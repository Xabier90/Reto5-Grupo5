import mysql.connector


def get_db():
    conexion = mysql.connector.connect(
        host="localhost",
        user="root",          # Tu usuario de MySQL
        password="PapasConQ66", # ¡CAMBIA ESTO por tu contraseña!
        database="reto5_musarana_elefante"      # ¡CAMBIA ESTO por el nombre de tu base de datos!
    )
    # IMPORTANTE: Configuramos para que guarde cambios automáticamente
    conexion.autocommit = True

    # IMPORTANTE: Al guardar la conexión dentro del cursor, 
    # evitamos que Python la cierre por error.
    cursor = conexion.cursor(dictionary=True) #Nos da la informacion de la base de datos en forma de diccionario con los nombres de las columnas
    cursor._conexion_padre = conexion 
    
    return conexion, cursor