# db_helper.py realizado por Xabier Iglesias
import mysql.connector
from dotenv import load_dotenv
from flask import session
import os

def get_db():
    # He añadido la funcionalidad de obtener las credenciales que estan guardadas en el archivo .env
    load_dotenv()

    tipo = session.get("tipo_usuario", "invitado")

    roles_db = {
        "invitado": "rol_invitado",
        "alumno":   "rol_alumno",
        "profesor": "rol_profesor"
    }
    
    rol = roles_db.get(tipo, "rol_invitado")

    host = os.getenv("HOST")
    user = os.getenv("DB_USER")
    password = os.getenv("DB_PASSWORD")
    database = os.getenv("DATABASE")

    conexion = mysql.connector.connect(
        host=host,
        user=user,
        password=password,
        database=database
    )
    # IMPORTANTE: Configuramos para que guarde cambios automáticamente
    conexion.autocommit = True

    # IMPORTANTE: Al guardar la conexión dentro del cursor, 
    # evitamos que Python la cierre por error.
    cursor = conexion.cursor(dictionary=True) #Nos da la informacion de la base de datos en forma de diccionario con los nombres de las columnas
    cursor._conexion_padre = conexion 
    
    return conexion, cursor