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
    id_usuario = session.get("id_usuario")
    if id_usuario is None:
        return redirect("/login")
    conexion, cursor = db_helper.get_db()
    
    # Cargar recetas con informacion de la base de datos si el usuario ya ha votado
    cursor.execute("""
        SELECT r.id_receta, r.nombre, r.url_archivo, r.votos,
               IF(v.id_usuario IS NOT NULL, 1, 0) AS ya_vote
        FROM recetas r
        LEFT JOIN likes_recetas v 
            ON r.id_receta = v.id_receta AND v.id_usuario = %s
        ORDER BY r.votos DESC
    """, (id_usuario,))
    
    recetas = cursor.fetchall()
    cursor.close()
    conexion.close()
    return render_template("La_Comanda.html", recetas=recetas)

    

@app.route("/votar", methods=["POST"])
def votar():
    id_usuario = session.get("id_usuario")
    if id_usuario is None:       
        return redirect("/login")

    conexion, cursor = db_helper.get_db()
    # Comprobar si ya ha votado
    cursor.execute(
        "SELECT 1 FROM likes_recetas WHERE id_usuario=%s AND id_receta=%s",
        (id_usuario, id_receta)
    )
    ya_voto = cursor.fetchone()

    if ya_voto:
        # Quitar voto
        cursor.execute(
            "DELETE FROM likes_recetas WHERE id_usuario=%s AND id_receta=%s",
            (id_usuario, id_receta)
        )
        cursor.execute(
            "UPDATE recetas SET votos = votos - 1 WHERE id_receta=%s",
            (id_receta,)
        )
        accion = "quitado"

    else:
        # Añadir voto
        cursor.execute(
            "INSERT INTO likes_recetas (id_usuario, id_receta, fecha_receta) VALUES (%s, %s, NOW())",
            (id_usuario, id_receta)
        )
        cursor.execute(
            "UPDATE recetas SET votos = votos + 1 WHERE id_receta=%s",
            (id_receta,)
        )
        accion = "añadido"

        # Obtener votos actualizados
        cursor.execute("SELECT votos FROM recetas WHERE id_receta=%s", (id_receta,))
        nuevos_votos = cursor.fetchone()["votos"]

        return redirect("/La_Comanda")
    
        cursor.close()
        conexion.close()


@app.route("/Pagina_principal")
def Pagina_Principal():
    return render_template("Pagina_Principal.html")

@app.route("/formulario_recetas")
def formulario_recetas():
    return render_template("FormularioRecetas.html")


@app.route("/logout")
def logout():
    session.clear()  # Borra todo (ID, Rol, etc.)
    return redirect(url_for("login"))

if __name__ == "__main__":
    app.run(debug=True)