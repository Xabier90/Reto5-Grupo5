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

        return render_template("login.html")
    return render_template("registro.html")
    
@app.route("/login", methods =["GET","POST"])
def login():

    mensaje = "" # defino mensaje para evitar errores y siempre exista

    if request.method == "POST":
        correo_usuario = request.form.get("email_address")
        contraseña_normal = request.form.get("password")

        
        conexion, cursor = db_helper.get_db()

        sSQL = "SELECT id_usuario, correo, contraseña AS contra, tipo_usuario FROM usuarios where correo = %s" 
        # selecciona en este caso en la tabla usuarios, todas las columnas. 
        # Unicamente en el caso  que coincida el correo de la base de datos con el que ha introducido el usuario
        cursor.execute(sSQL, [correo_usuario])

        usuario = cursor.fetchone() # Recoge el resultado de la consulta SQL que hemos hecho y nos da la primera coincidencia (En este caso no va a haber correos repetidos por lo que nos sirve)
        print(f"VALOR DE USUARIO: {usuario}")

        if usuario is not None and check_password_hash(usuario["contra"], contraseña_normal):
            session["id_usuario"] = usuario["id_usuario"]
            session["tipo_usuario"] = usuario["tipo_usuario"] # Nos sirve para saber que la persona que esta accediendo es o profesor o alumno o invitado(el Rol del usuario)
            mensaje = "Bienvenido a La Comanda"
            return redirect(url_for("La_Comanda"))
            # Aquí haremos que acceda al apartado de la red social
        else:
            mensaje = "No has introducido bien o el correo o la contraseña"

        
        cursor.close()    
        conexion.close()

    return render_template("login.html", mensaje = mensaje) # hace que devuelva lo que nos interesa

@app.route("/la-comanda") # Esta es la URL que se verá en el navegador
def La_Comanda():         # <--- Este es el nombre que busca url_for
    return render_template("la_comanda.html")

@app.route("/Pagina_principal")
def Pagina_Principal ():
    return render_template("Pagina_Principal.html")

@app.route("/formulario_recetas", methods=["GET", "POST"])
def formulario_recetas():

    if request.method == "POST":
        conexion, cursor = db_helper.get_db()

        # DATOS PRINCIPALES DE LA RECETA
        nombre = request.form.get("nombre_receta")
        dificultad = request.form.get("nivel_dificultad")
        tiempo_str = request.form.get("tiempo_receta")  # formato HH:MM
        url_archivo = request.form.get("url_archivo")
        id_usuario = request.form.get("nom_usuario")

        # Convertir tiempo a minutos
        horas, minutos = tiempo_str.split(":")
        tiempo = int(horas) * 60 + int(minutos)


        num_pasos = int(request.form.get("Num_pasos"))
        pasos = [request.form.get(f"paso_{i}") for i in range(1, num_pasos + 1)]
        instrucciones = "\n".join(pasos)

        #Concexion con el usuario - Pueba
        id_usuario = session.get("id_usuario")

        if id_usuario is None:
            return redirect("/login")
        
        else:

            #Insertar receta
            sql_receta = """
                INSERT INTO recetas (nombre, dificultad, tiempo, instrucciones, votos, id_usuario, url_archivo)
                VALUES (%s, %s, %s, %s, 0, 1, %s, %s)
                    """
            cursor.execute(sql_receta, (nombre, dificultad, tiempo, instrucciones, url_archivo, id_usuario))


            id_receta = cursor.lastrowid

            num_ing = int(request.form.get("Num_ingredientes"))

            for i in range(1, num_ing + 1):
                nombre_ing = request.form.get(f"ingrediente_{i}")
                cantidad = request.form.get(f"cantidad_{i}")
                unidad = request.form.get(f"unidad_{i}")


                cursor.execute("SELECT id_ingredientes FROM ingredientes WHERE nombre = %s", (nombre_ing,))
                resultado = cursor.fetchone()

                if resultado:
                    id_ing = resultado["id_ingredientes"]
                else:
                    cursor.execute(
                        "INSERT INTO ingredientes (nombre, unidad_medida, stock, id_alergeno) VALUES (%s, %s, 0, NULL)",
                        (nombre_ing, unidad)
                    )
                    id_ing = cursor.lastrowid

                cursor.execute(
                    "INSERT INTO receta_ingredientes (id_receta, id_ingrediente, cantidad) VALUES (%s, %s, %s)",
                    (id_receta, id_ing, cantidad)
                )

            return redirect("/formulario_recetas")

    return render_template("FormularioRecetas.html")



@app.route("/logout")
def logout():
    session.clear()  # Borra todo (ID, Rol, etc.)
    return redirect(url_for("login"))

if __name__ == "__main__":
    app.run(debug=True)