delimiter \\
create function eliminar_acentos(texto varchar(255))
returns varchar(255)
deterministic
begin
	declare resultado varchar(255);
    set resultado = lower(texto);
    set resultado = replace(texto, "á", "a");
    set resultado = replace(resultado, "é", "e");
    set resultado = replace(resultado, "í", "i");
    set resultado = replace(resultado, "ó", "o");
    set resultado = replace(resultado, "ú", "u");
    
    return resultado;
end \\
delimiter ;

delimiter \\

create procedure generar_correo(
in p_nombre varchar(255),
in p_apellido1 varchar(255),
in p_dominio varchar(255),
out p_correo varchar(255))
begin
	set p_nombre = eliminar_acentos(p_nombre);
    set p_apellido1 = eliminar_acentos(p_apellido1);
    set p_correo = lower(concat(left(p_nombre, 1), p_apellido1, "@", p_dominio));
end
\\

delimiter ;


delimiter \\
create trigger trigger_alumnos after insert on alumnos
for each row
begin
    call crear_correo(new.nombre, new.apellido1, "GastroLab.eus", @correo_creado);
    
	insert into usuarios (correo, contraseña, tipo_usuario)
	values(@correo_creado, 'GastroLab2026', 'alumno');
end \\
delimiter ;

delimiter \\
create trigger trigger_profesores after insert on profesores
for each row
begin
    call crear_correo(new.nombre, new.apellido1, "GastroLab.eus", @correo_creado);
    
	insert into usuarios (correo, contraseña, tipo_usuario)
	values(@correo_creado, 'GastroLab2026', 'profesor');
end \\
delimiter ;

INSERT INTO `reto5_musarana_elefante`.`alumnos` (`id_alumno`, `nombre`, `apellido1`, `apellido2`, `correo`, `fecha_ingreso`) 
VALUES ('60', 'xabi', 'prueba', 'sdas', 'prueba@gmail.com', '2025-09-01 08:00:00');


