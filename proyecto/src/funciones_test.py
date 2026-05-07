from werkzeug.security import generate_password_hash, check_password_hash

def contrasena_es_valida(contrasena):
    """La contraseña debe tener al menos 8 caracteres"""
    return len(contrasena) >= 8

def correo_es_valido(correo):
    """El correo debe contener @ y un punto"""
    return "@" in correo and "." in correo

def verificar_contrasena(hash_guardado, contrasena_normal):
    """Comprueba si la contraseña coincide con el hash"""
    return check_password_hash(hash_guardado, contrasena_normal)

def nombre_receta_valido(nombre):
    """El nombre no puede estar vacío ni tener menos de 3 caracteres"""
    return len(nombre.strip()) >= 4

def usuario_es_root(tipo_usuario):
    """Comprueba si el usuario tiene permisos de administrador"""
    return tipo_usuario == "root"

def usuario_puede_eliminar_receta(tipo_usuario):
    """Solo pueden eliminar recetas los profesores"""
    return tipo_usuario == "profesor"

def calcular_votos(votos_actuales, accion):
    """Calcula los votos según la acción: 'añadir' o 'quitar'"""
    if accion == "añadir":
        return votos_actuales + 1
    elif accion == "quitar":
        return votos_actuales - 1
    return votos_actuales 

def formato_correo(correo):
    """Devuelve el correo siempre en minúsculas y sin espacios"""
    return correo.strip().lower()