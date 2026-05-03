# app.py realizado por Ibai y Xabier Iglesias
from flask import Flask, render_template, request, redirect, url_for, session
import mysql.connector
import db_helper
from werkzeug.security import generate_password_hash, check_password_hash # La herramienta para cifrar y comprobar si hay coincidencia

app = Flask(__name__)
app.secret_key = "ABCD"

@app.route("/home")
def home():

    conexion, cursor = db_helper.get_db()

    SQL = f"""
        select c.nombre as nombre_curso, a.nombre as nombre_asignatura, ca.año_curso as año_curso
        from cursos c
        inner join cursos_asignaturas ca on c.id_curso = ca.id_curso
        inner join asignaturas a on a.id_asignatura = ca.id_asignatura;
    """

    cursor.execute(SQL)
    cursos = cursor.fetchall()

    cursor.close()
    conexion.close()

    return render_template("Pagina_Principal.html", cursos=cursos)

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

        return render_template("registro.html")
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
            session["user_id"] = usuario["id_usuario"]
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

@app.route("/logout")
def logout():
    session.clear()  # Borra todo (ID, Rol, etc.)
    return redirect(url_for("login"))

if __name__ == "__main__":
    app.run(debug=True)