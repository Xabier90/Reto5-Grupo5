# Problema
GastroLab tiene su información dispersa en múltiples documentos, lo que dificulta su gestión y organnización diaria. Nuestro trabajo es diseñar una base de datos que centralice toda esta información y proporcionar un plan de digitalización y sostenibilidad. Además, crear una página web que permita visualizar toda la información necesaria que esté almacenada en la base de datos.

## Tecnologías utilizadas

### Lenguajes de programación
- **Python 3.12**

### Base de datos
- **MySQL Workbench 8.0**

### Librerías / Dependencias
- Python: `flask`, `mysql-connector-python`, `python-dotenv`

### Herramientas y Entorno
- IDE: **VSCode**

## Base de datos
Los archivos de la base de datos están en la carpeta `base de datos` en la rama `Xabier`:
```
Xabier
    └── base de datos/
        ├── Vistas_roles_permisos.sql # Archivo SQL para crear un usuario, las vistas y los tres roles y dar permisos a esos roles
        ├── bbdd_Definitivo.sql # Archivo SQL con la estructura completa y datos de la base de datos
        └── procedimientos_funciones_triggers.sql # Archivo SQL para crear los procedimientos, funciones y triggers
                                                  # (no necesario ejecutar si se ha ejecutado bbdd_Definitivo.sql por completo) 
```
> Nota: Primero ejecutar `bbdd_Definitivo.sql` y luego `procedimientos_funciones_triggers.sql`.

## Flask
El archivo a ejecutar para iniciar el flask es `app.py`.

### Pasos a seguir
Una vez que tienes todo el contenido del `main` y sus archivos sigue los siguientes pasos:
1. En la carpeta debes crear un archivo llamado `.env` con el siguiente contenido:
      ```
      HOST=localhost
      DATABASE=reto5_musarana_elefante
      DB_USER=usuario_La_Comanda
      DB_PASSWORD=GastroLab2026
      ```
2. Si has colocado todo correctamente ejecuta el archivo `app.py` y abre en el navegador `127.0.0.1:5000/Pagina_principal`

## Autores

**Xabier Iglesias**
**Aroa Hernández**
**Ibai López**

Repositorio mantenido por el grupo `Musaraña elefante`

En este reto nuestro grupo ha tenido que crear un contrato el cual deberemos cumplir.

<img width="769" height="756" alt="image" src="https://github.com/user-attachments/assets/126e8aaf-6a9d-43bd-ba49-d774566d101a" /> <b>
<p align="center">
<img width="500" height="200" alt="image" src="https://github.com/user-attachments/assets/9f7a5ead-9f9f-48ad-963c-c8a96c4023eb" />


