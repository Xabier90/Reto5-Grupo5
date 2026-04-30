import mysql.connector


def get_db():
    conexion = mysql.connector.connect(
        host="localhost",
        user="root",          # Tu usuario de MySQL
        password="Passw0rd", # ¡CAMBIA ESTO por tu contraseña!
        database="reto5_musarana_elefante"      # ¡CAMBIA ESTO por el nombre de tu base de datos!
    )
    # IMPORTANTE: Configuramos para que guarde cambios automáticamente
    conexion.autocommit = True

    # Devolvemos SOLO el cursor
    return conexion.cursor(dictionary=True)