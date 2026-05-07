# app.py realizado por Ibai, Xabier Iglesias y Aroa
from flask import Flask, render_template, request, redirect, url_for, session
import mysql.connector
import db_helper
import hashlib # La herramienta para cifrar y comprobar si hay coincidencia
from transformers import pipeline

app = Flask(__name__)
app.secret_key = "ABCD"

traductor = pipeline("translation", model="Helsinki-NLP/opus-mt-en-es")

@app.route("/Pagina_principal")
def Pagina_principal():

    conexion, cursor = db_helper.get_db()

    SQL = f"""
        SELECT * FROM vista_cursos_asignaturas;
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

        contraseña_segura = hashlib.sha256(contraseña.encode()).hexdigest()

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

        if usuario is not None and hashlib.sha256(contraseña_normal.encode()).hexdigest() == usuario["contraseña"]:
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
    # No conseguia que funcionara la select y le he pedido ayuda a la IA, el problema era que estaba intentando 
    # hacer todo en una consulta y se volvia loco, me dijo que lo separara en 2.
    # cursor.execute("""
    #     SELECT r.id_receta, r.nombre, r.url_archivo, l.votos,
    #            IF(v.id_usuario IS NOT NULL, 1, 0) AS ya_voto
    #     FROM recetas r
    #     LEFT JOIN likes_recetas v ON r.id_receta = v.id_receta
    #     LEFT JOIN likes l ON r.id_receta = l.id_receta AND v.id_usuario = %s
    #     GROUP BY r.id_receta
    #     ORDER BY l.votos DESC
    # """, (id_usuario,))

    cursor.execute("""
        SELECT r.id_receta, r.nombre, r.url_archivo, COALESCE(l.votos, 0) as votos
        FROM recetas r
        LEFT JOIN likes l ON r.id_receta = l.id_receta
        ORDER BY r.id_receta DESC
    """)
    recetas_galeria = cursor.fetchall()
    # necesite ayuda con el coalesce
    cursor.execute("""
        SELECT nombre, COALESCE(l.votos, 0) as votos  
        FROM recetas r
        JOIN likes l ON r.id_receta = l.id_receta
        ORDER BY l.votos DESC
        LIMIT 10
    """)
    ranking_votos = cursor.fetchall()

    # Consulta 2: obtener qué recetas ha votado el usuario
    cursor.execute("""
        SELECT id_receta FROM likes_recetas WHERE id_usuario = %s
    """, (id_usuario,))
    votos_usuario = [row["id_receta"] for row in cursor.fetchall()]
    
    for r in recetas_galeria:
        r["ya_voto"] = r["id_receta"] in votos_usuario
        if r["votos"] is None:
            r["votos"] = 0
    cursor.close()
    conexion.close()
    return render_template("La_Comanda.html", recetas=recetas_galeria, ranking=ranking_votos)

    
# He necesitado IA porque necesitaba el rowcount que no lo conocia para resolver
#el problema de los votos que en la likes no inserta la información, que necesitamos para
# que si eliminamos una receta y generamos una nueva la nueva no nos de erroras.
@app.route("/votar", methods=["POST"])
def votar():
    id_usuario = session.get("id_usuario")
    if id_usuario is None:       
        return redirect("/login")
    
    id_receta = request.form.get("id_receta")

    conexion, cursor = db_helper.get_db()
    
    # 1. Comprobar si ya ha votado
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
            "UPDATE likes SET votos = votos - 1 WHERE id_receta=%s",
            (id_receta,)
        )
    else:
        # Añadir voto
        cursor.execute(
            "INSERT INTO likes_recetas (id_usuario, id_receta, fecha_like) VALUES (%s, %s, NOW())",
            (id_usuario, id_receta)
        )
        
        # Intentamos actualizar el contador
        cursor.execute(
            "UPDATE likes SET votos = votos + 1 WHERE id_receta=%s",
            (id_receta,)
        )

        # SEGURIDAD: Si la fila no existía en 'likes', el UPDATE no hace nada (rowcount 0)
        # En ese caso, la creamos con 1 voto.
        if cursor.rowcount == 0:
            cursor.execute(
                "INSERT INTO likes (id_receta, votos) VALUES (%s, 1)",
                (id_receta,)
            )

    # 2. Obtener votos actualizados DE FORMA SEGURA (Fuera del if/else)
    cursor.execute("SELECT votos FROM likes WHERE id_receta=%s", (id_receta,))
    resultado = cursor.fetchone()
    
    # Si por algún milagro 'resultado' sigue siendo None, evitamos el crash
    nuevos_votos = resultado["votos"] if resultado else 0
    
    # Forzamos el guardado
    conexion.commit()
    
    cursor.close()
    conexion.close()

    return redirect("/la-comanda")

@app.route("/ver_receta/<int:id_receta>")
def ver_receta(id_receta):
    conexion, cursor = db_helper.get_db()
    
    cursor.execute("SELECT * FROM recetas WHERE id_receta=%s", (id_receta,))
    receta = cursor.fetchone()
    
    cursor.execute("""
        SELECT i.nombre, ri.cantidad, ri.unidad_medida
        FROM receta_ingredientes ri
        JOIN ingredientes i ON ri.id_ingrediente = i.id_ingredientes
        WHERE ri.id_receta = %s
    """, (id_receta,))
    ingredientes = cursor.fetchall()
    
    pasos = []
    if receta and receta["instrucciones"]:
        pasos = [p.strip() for p in receta["instrucciones"].split(";") if p.strip()]
    
    cursor.close()
    conexion.close()
    
    return render_template("ver_receta.html", receta=receta, ingredientes=ingredientes, pasos=pasos)
    

@app.route("/Pagina_principal")
def Pagina_Principal():
    return render_template("Pagina_Principal.html")

@app.route("/formulario_recetas", methods=["GET", "POST"])
def formulario_recetas():
    id_usuario = session.get("id_usuario")
    if not id_usuario:
        return redirect(url_for("login"))

    conexion, cursor = db_helper.get_db()

    # --- SI ES GET: REVISAR SI VIENE CON ID ---
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
                SELECT i.nombre, ri.cantidad, ri.unidad_medida
                FROM receta_ingredientes ri
                JOIN ingredientes i ON ri.id_ingrediente = i.id_ingredientes
                WHERE ri.id_receta = %s
            """, (id_receta,))
            ingredientes = cursor.fetchall()

        # Ingredientes: cantidad viene de receta_ingredientes
        cursor.execute("""
            SELECT i.nombre, ri.cantidad, ri.unidad_medida
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
        #Ayuda de IA para recoger los datos de los alergenos
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

        # Convertir tiempo en INT
        #Ayuda de IA para saber como convetir tiempo
        tiempo_str = request.form.get("tiempo_receta")
        horas, minutos = tiempo_str.split(":")
        tiempo = int(horas) * 60 + int(minutos)

        # Pasos
        #Ayuda de IA para filtrar los pasos
        num_pasos = int(request.form.get("Num_pasos"))
        pasos = [request.form.get(f"paso_{i}") for i in range(1, num_pasos + 1)]
        instrucciones = "; ".join(filter(None, pasos))
        #Fin uso IA (pasos)

        # Si existe -> actualizar
        if id_receta:
            cursor.execute("""
                UPDATE recetas
                SET dificultad=%s, tiempo=%s, instrucciones=%s, url_archivo=%s
                WHERE id_receta=%s AND id_usuario=%s
            """, 
            (request.form.get("nivel_dificultad"), tiempo, instrucciones,
                  request.form.get("url_archivo"), id_receta, id_usuario))

        else:
            # Crear nueva
            cursor.execute("""
                INSERT INTO recetas (nombre, dificultad, tiempo, instrucciones, id_usuario, url_archivo)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (nombre, request.form.get("nivel_dificultad"), tiempo,
                  instrucciones, id_usuario, request.form.get("url_archivo")))
            id_receta = cursor.lastrowid

            conexion.commit()

            cursor.execute("""
                INSERT INTO likes (id_receta, votos) VALUES (%s, %s)
            """, (id_receta, 0))

            conexion.commit()

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

    id_usuario = session.get("id_usuario")
    if not id_usuario:
        return redirect(url_for("login"))

    conexion, cursor = db_helper.get_db()

    nombre_cap = nombre.lower().capitalize()

    cursor.execute("""
        SELECT * FROM recetas WHERE nombre = %s
    """, (nombre_cap,))

    receta = cursor.fetchone()

    cursor.close()
    conexion.close()

    # Si existe -> cargar formulario con datos
    #Ayuda de IA para implementar receta con los datos de la base de datos
    if receta:
        return redirect(url_for("formulario_recetas", id_receta=receta["id_receta"]))

    else:
        # Si no existe -> redireccionar a "La_Comanda"
        return redirect(url_for("La_Comanda"))


@app.route("/eliminar_receta_por_nombre/<nombre>")
def eliminar_receta_por_nombre(nombre):

    id_usuario = session.get("id_usuario")
    if not id_usuario:
        return redirect(url_for("login"))

    conexion, cursor = db_helper.get_db()

    cursor.execute("""
    SELECT id_receta FROM recetas 
        WHERE nombre = %s
    """, (nombre,))

    resultado = cursor.fetchone()

    if resultado:

        id_receta = resultado['id_receta']

        cursor.execute("""
        DELETE FROM likes_recetas 
            WHERE id_receta = %s
        """, (id_receta,))

        cursor.execute("""
        DELETE FROM likes 
            WHERE id_receta = %s
        """, (id_receta,))

        cursor.execute("""
        DELETE FROM recetas
            WHERE nombre = %s
        """, (id_receta,))


    cursor.close()
    conexion.close()

    return redirect(url_for("La_Comanda"))

# Para poder utilizar el modelo para traducir el texto he tenido que ayudarme un poco de la IA porque no me funcionaba correctamente
@app.route("/who_we_are", methods=["GET", "POST"])
def who_we_are():
    titulo_en_ingles = "All about us"
    texto_en_ingles = """We are a small team of developers and foodies. 
On our website, you can see a combination of delicious recipes for everyday cooking, 
a couple of courses in which, if you're interested, you can register for a course and learn with us, 
and an option to submit your recipes if you're signed in. 
Our mission is to teach cooking with locally sourced foods planted and grown by our students, 
also helping them to enter the labour market and to make it enjoyable and affordable for anyone in the public interested in cooking. 
Explore the different sections and come cook with us."""

    idioma = request.form.get("idioma", "inglés")

    if idioma == "inglés":
        titulo=titulo_en_ingles
        texto = texto_en_ingles
        proximo_idioma = "es"
        boton="Translate to Spanish"
    else:
        titulo = traductor(titulo_en_ingles)[0]["translation_text"]
        texto = traductor(texto_en_ingles)[0]["translation_text"]
        proximo_idioma = "en"
        boton="Traducido"
        
    return render_template("Who_we_are.html", titulo=titulo, texto=texto, boton=boton, proximo_idioma=proximo_idioma)

@app.route("/digitalizacion")
def digi():
    return render_template("Digitalizacion.html")




@app.route("/logout")
def logout():
    session.clear()  # Borra todo (ID, Rol, etc.)
    return redirect(url_for("login"))

if __name__ == "__main__":
    app.run(debug=True)