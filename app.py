from flask import Flask, render_template, request, redirect, url_for, session
import mysql.connector
import db_helper
from werkzeug.security import generate_password_hash, check_password_hash # La herramienta para cifrar y comprobar si hay coincidencia

app = Flask(__name__)
app.secret_key = "ABCD"

@app.route("/")
def home():
    return "Hello, Flask + uv is working!"

@app.route("/registro", methods = ['GET','POST'])
def registro():
    
    if request.method == "POST":
        correo_usuario = request.form.get("email_address")
        contraseña = request.form.get("password")

        contraseña_segura = generate_password_hash(contraseña)

        conexion, cursor = db_helper.get_db()

        # sSQL = f"""
        #         INScursor.execute(sSQL, [correo_usuario])ERT INTO users (correo, contraseña, tipo_usuario)
        #         VALUES('{email_address}', '{password}', 'invitado')
        #     """
        # No usaremos este método para proteger nuestra base de datos 

        # Esta es una forma más segura de hacerlo
        sSQL = "INSERT INTO usuarios (correo, contraseña, tipo_usuario) VALUES (%s, %s, %s)"
        # Ahora se ejecuta introduciendo los datos que nos interesa sin ningun peligro
        cursor.execute(sSQL, (correo_usuario, contraseña_segura, "invitado"))

        
        cursor.close()
        conexion.close()

        # return render_template("login.html")
        return redirect(url_for("login"))

    return render_template("registro.html")
    
@app.route("/login", methods =["GET","POST"])
def login():

    mensaje = "" # defino mensaje para evitar errores y siempre exista

    if request.method == "POST":
        correo_usuario = request.form.get("email_address")
        contraseña_normal = request.form.get("password")

        
        conexion, cursor = db_helper.get_db()

        sSQL = "SELECT id_usuario, correo, contraseña , tipo_usuario FROM usuarios where correo = %s" 
        # selecciona en este caso en la tabla usuarios, todas las columnas. 
        # Unicamente en el caso  que coincida el correo de la base de datos con el que ha introducido el usuario
        cursor.execute(sSQL, [correo_usuario])

        usuario = cursor.fetchone() # Recoge el resultado de la consulta SQL que hemos hecho y nos da la primera coincidencia (En este caso no va a haber correos repetidos por lo que nos sirve)
        print(f"VALOR DE USUARIO: {usuario}")

        if usuario is not None and check_password_hash(usuario["contraseña"], contraseña_normal):
            session["id_usuario"] = usuario["id_usuario"]
            session["tipo_usuario"] = usuario["tipo_usuario"] # Nos sirve para saber que la persona que esta accediendo es o profesor o alumno o invitado(el Rol del usuario)
            session["correo"] = usuario["correo"] # Para guardar el correo
            mensaje = "Bienvenido a La Comanda"
            return redirect(url_for("La_Comanda"))
            # Aquí haremos que acceda al apartado de la red social
        else:
            mensaje = "No has introducido bien o el correo o la contraseña"

        
        cursor.close()    
        conexion.close()

    return render_template("login.html", mensaje = mensaje) # hace que devuelva lo que nos interesa

@app.route("/la-comanda") # Esta es la URL que se verá en el navegador
def La_Comanda(): 
    usuario = session.get("id_usuario")
    if usuario:      # <--- Este es el nombre que busca url_for
        return render_template("La_Comanda.html")
    else:
        return redirect(url_for("login"))


@app.route("/Pagina_principal")
def Pagina_Principal():
    return render_template("Pagina_Principal.html")

@app.route("/formulario_recetas", methods=["GET", "POST"])
def formulario_recetas():
    id_usuario = session.get("id_usuario")
    if not id_usuario:
        return redirect(url_for("login"))

    conexion, cursor = db_helper.get_db()

    # --- SI ES GET: ¿VIENE CON ID? ---
    id_receta = request.args.get("id_receta")

    receta = None
    ingredientes = []
    pasos = []
    alergenos_receta = []

    if id_receta and request.method == "GET":
        cursor.execute("SELECT * FROM recetas WHERE id_receta=%s",
        (id_receta,))
        receta = cursor.fetchone()

        if receta:
            # 2. Ingredientes
            cursor.execute("""
                SELECT i.nombre, ri.cantidad, i.unidad_medida
                FROM receta_ingredientes ri
                JOIN ingredientes i ON ri.id_ingrediente = i.id_ingredientes
                WHERE ri.id_receta = %s
            """, (id_receta,))
            ingredientes = cursor.fetchall()

        # Ingredientes: cantidad viene de receta_ingredientes
        cursor.execute("""
            SELECT i.nombre, ri.cantidad, i.unidad_medida
            FROM receta_ingredientes ri
            JOIN ingredientes i ON ri.id_ingrediente = i.id_ingredientes
            WHERE ri.id_receta = %s
        """, (id_receta,))
        ingredientes = cursor.fetchall()

        # Alergenos
        cursor.execute("""
            SELECT id_alergeno
            FROM ingredientes i
            JOIN receta_ingredientes ri ON i.id_ingredientes = ri.id_ingrediente
            WHERE ri.id_receta = %s
        """, (id_receta,))
        alergenos_receta = [row["id_alergeno"] for row in cursor.fetchall()]

        # Pasos
        if receta and receta["instrucciones"]:
            pasos = receta["instrucciones"].split(";")
            pasos = [p.strip() for p in pasos if p.strip()]
        else:
            pasos = []
    else:
        receta = None
        ingredientes = []
        pasos = []
        alergenos_receta = []


    # --- SI ES POST: GUARDAR O ACTUALIZAR ---
    if request.method == "POST":
        nombre = request.form.get("nombre_receta")

        # ¿Existe ya una receta con ese nombre?
        cursor.execute("""
            SELECT id_receta FROM recetas
            WHERE nombre=%s AND id_usuario=%s
        """, (nombre, id_usuario))

        existente = cursor.fetchone()

        if existente:
            id_receta = existente["id_receta"]
        else:
            id_receta = None

        # Convertir tiempo
        tiempo_str = request.form.get("tiempo_receta")
        horas, minutos = tiempo_str.split(":")
        tiempo = int(horas) * 60 + int(minutos)

        # Pasos
        num_pasos = int(request.form.get("Num_pasos"))
        pasos = [request.form.get(f"paso_{i}") for i in range(1, num_pasos + 1)]
        instrucciones = "; ".join(filter(None, pasos))

        # Si existe → actualizar
        if id_receta:
            cursor.execute("""
                UPDATE recetas
                SET dificultad=%s, tiempo=%s, instrucciones=%s, url_archivo=%s
                WHERE id_receta=%s AND id_usuario=%s
            """, (request.form.get("nivel_dificultad"), tiempo, instrucciones,
                  request.form.get("url_archivo"), id_receta, id_usuario))

        else:
            # Crear nueva
            cursor.execute("""
                INSERT INTO recetas (nombre, dificultad, tiempo, instrucciones, votos, id_usuario, url_archivo)
                VALUES (%s, %s, %s, %s, 0, %s, %s)
            """, (nombre, request.form.get("nivel_dificultad"), tiempo,
                  instrucciones, id_usuario, request.form.get("url_archivo")))
            id_receta = cursor.lastrowid


        cursor.close()
        conexion.close()

        return redirect(url_for("La_Comanda"))

    cursor.close()
    conexion.close()

    return render_template("FormularioRecetas.html",
        receta=receta,
        ingredientes=ingredientes,
        pasos=pasos,
        num_ingredientes=len(ingredientes),
        num_pasos=len(pasos),
        alergenos_receta=alergenos_receta)




@app.route("/editar_receta_por_nombre/<nombre>")
def editar_receta_por_nombre(nombre):

    print(">>> NOMBRE RECIBIDO:", nombre)

    id_usuario = session.get("id_usuario")
    if not id_usuario:
        return redirect(url_for("login"))

    conexion, cursor = db_helper.get_db()

    nombre_cap = nombre.capitalize()

    cursor.execute("""
        SELECT * FROM recetas WHERE nombre = %s
    """, (nombre_cap,))


    

    receta = cursor.fetchone()

    print(">>> NOMBRE RECIBIDO:", nombre)
    print(">>> ID_USUARIO:", id_usuario)
    print(">>> RECETA ENCONTRADA:", receta)


    cursor.close()
    conexion.close()

    # Si existe -> cargar formulario con datos
    if receta:
        return redirect(url_for("formulario_recetas", id_receta=receta["id_receta"]))


    else:

        # Si no existe -> formulario vacío (crear nueva)
        return redirect(url_for("La_Comanda"))


@app.route("/eliminar_receta_por_nombre/<nombre>")
def eliminar_receta_por_nombre(nombre):

    id_usuario = session.get("id_usuario")
    if not id_usuario:
        return redirect(url_for("login"))

    conexion, cursor = db_helper.get_db()

    cursor.execute("""
    DELETE FROM recetas
        WHERE nombre = %s
    """, (nombre,))



    cursor.close()
    conexion.close()

    return redirect(url_for("La_Comanda"))



@app.route("/logout")
def logout():
    session.clear()  # Borra todo (ID, Rol, etc.)
    return redirect(url_for("login"))

if __name__ == "__main__":
    app.run(debug=True)