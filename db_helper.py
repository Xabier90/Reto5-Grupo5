import mysql.connector

def get_db():
    conexion = mysql.connector.connect(
        host="localhost",
        user="root",          # Tu usuario de MySQL
        password="Passw0rd", # ¡CAMBIA ESTO por tu contraseña!
        database="reto5_musarana_elefante"      # ¡CAMBIA ESTO por el nombre de tu base de datos!
    )
    return conexion.cursor(dictionary=True), conexion 
    # Devolvemos el cursor para hacer consultas y la conexion para hacer el .commit()