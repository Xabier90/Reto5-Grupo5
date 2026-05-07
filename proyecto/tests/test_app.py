# proyecto/tests/test_app.py
# Aquí escribimos las pruebas. 
# Fíjate en cómo usamos la aserción nativa de Python (assert)
# y cómo inyectamos "mágicamente" el fixture datos_suma.
#from app import sumar, es_par

from src.funciones_test import contrasena_es_valida, correo_es_valido, verificar_contrasena, nombre_receta_valido, usuario_es_root, usuario_puede_eliminar_receta, calcular_votos, formato_correo
from werkzeug.security import generate_password_hash

# contrasena_es_valida 

def test_contrasena_valida():
    assert contrasena_es_valida("123456789") == True

def test_contrasena_8digitos():
    assert contrasena_es_valida("12345678") == True

def test_contrasena_muy_corta():
    assert contrasena_es_valida("123") == False

def test_contrasena_vacia():
    assert contrasena_es_valida("") == False

# correo_es_valido

def test_correo_valido():
    assert correo_es_valido("usuario@gmail.com") == True

def test_correo_sin_arroba():
    assert correo_es_valido("usuariogmail.com") == False

def test_correo_sin_punto():
    assert correo_es_valido("usuario@gmailcom") == False

def test_correo_mal_hecho_pero_cumple_funcion():
    assert correo_es_valido("@.") == True

# verificar_contrasena

def test_verificar_contrasena_correcta():
    hash = generate_password_hash("1234")
    assert verificar_contrasena(hash, "1234") == True

def test_verificar_contrasena_incorrecta():
    hash = generate_password_hash("1234")
    assert verificar_contrasena(hash, "123") == False


def test_verificar_contrasena_incorrecta():
    hash = generate_password_hash("1234")
    assert verificar_contrasena(hash, "1324") == False

# nombre_receta_valido 

def test_nombre_receta_valido():
    assert nombre_receta_valido("Paella") == True

def test_nombre_receta_con_espacio():
    assert nombre_receta_valido("pimiento relleno") == True

def test_nombre_receta_muy_corto():
    assert nombre_receta_valido("Pi") == False

def test_nombre_receta_muy_corto_con_2espacios_en_medio():
    assert nombre_receta_valido("P  i") == True

def test_nombre_receta_vacio():
    assert nombre_receta_valido("") == False

def test_nombre_receta_solo_espacios():
    assert nombre_receta_valido("   ") == False

# usuario_es_admin 

def test_usuario_es_root():
    assert usuario_es_root("root") == True

def test_usuario_no_es_root():
    assert usuario_es_root("usuario_La_Comanda") == False

def test_profesor_no_es_admin():
    assert usuario_es_root("profesor") == False

# usuario_puede_votar 

def test_invitado_no_puede_eliminar_receta():
    assert usuario_puede_eliminar_receta("invitado") == False

def test_profesor_puede_eliminar_receta():
    assert usuario_puede_eliminar_receta("profesor") == True

def test_alumno_puede_eliminar_receta():
    assert usuario_puede_eliminar_receta("alumno") == False

def test_vacio_puede_eliminar_receta():
    assert usuario_puede_eliminar_receta("") == False



# calcular_votos 

def test_anadir_voto():
    assert calcular_votos(5, "añadir") == 6

def test_quitar_voto():
    assert calcular_votos(5, "quitar") == 4

def test_accion_desconocida_no_cambia_votos():
    assert calcular_votos(5, "otra_cosa") == 5

def test_votos_desde_cero():
    assert calcular_votos(0, "añadir") == 1

# formato_correo 

def test_correo_a_minusculas():
    assert formato_correo("USUARIO@GMAIL.COM") == "usuario@gmail.com"

def test_correo_sin_espacios():
    assert formato_correo("  usuario@gmail.com  ") == "usuario@gmail.com"

def test_correo_ya_minusculas():
    assert formato_correo("usuario@gmail.com") == "usuario@gmail.com"



