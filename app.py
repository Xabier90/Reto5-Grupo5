from flask import Flask, render_template, request, redirect, url_for, session
import mysql.connector
import db_helper
from werkzeug.security import generate_password_hash # La herramienta para cifrar

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello, Flask + uv is working!"

@app.route("/registro", methods = ['GET','POST'])
def registro():
    if request.method == "POST":
        correo_usuario = request.form.get("email_address")
        contraseña = request.form.get("password")

        contraseña_segura = generate_password_hash(contraseña)

        db = db_helper.get_db()

        # sSQL = f"""
        #         INSERT INTO users (correo, contraseña)
        #         VALUES('{email_address}', {password})
        #     """
        # No usaremos este método para proteger nuestra base de datos 

        # Esta es una forma más segura de hacerlo
        sSQL = "INSERT INTO usuarios (correo, contraseña, tipo_usuario) VALUES (%s, %s, %s)"
        # Ahora se ejecuta introduciendo los datos que nos interesa sin ningun peligro
        db.execute(sSQL, (correo_usuario, contraseña_segura, "invitado"))

        return render_template("registro.html")
    return render_template("registro.html")
    

    
if __name__ == "__main__":
    app.run(debug=True)