delimiter \\
create function eliminar_acentos(texto varchar(255))
returns varchar(255)
deterministic
begin
	declare resultado varchar(255);
    set resultado = lower(texto);
    set resultado = replace(resultado, "á", "a");
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
    set p_correo = concat(lower(concat(left(p_nombre, 1), p_apellido1)), "@", p_dominio);
end\\

delimiter ;

delimiter \\
create trigger trigger_usuario_before_insert before insert on usuarios
for each row
begin
	if char_length(new.contraseña) < 8 or char_length(new.contraseña) > 64 then
		signal sqlstate '45000'
        set message_text = "La contraseña debe tener entre 8 y 64 caracteres";
	end if;
    
	if new.correo is null then
		call generar_correo(new.nombre, new.apellido1, "GastroLab.eus", @correo_creado);
		set new.correo = @correo_creado;
	elseif new.tipo_usuario = 'invitado' then
		set new.nombre = 'invitado';
        set new.apellido1 = 'invitado';
        set new.apellido2 = 'invitado';
    end if;
    if new.tipo_usuario != 'invitado' then
		set new.contraseña = SHA2(new.contraseña, 256);
	end if;
end \\

delimiter ;

delimiter \\
create trigger trigger_usuario_after_insert after insert on usuarios
for each row
begin
	if new.tipo_usuario = 'alumno' then
		call crear_alumno(new.correo, new.id_usuario);
	elseif new.tipo_usuario = 'profesor' then
		call crear_profesor(null, new.correo, new.id_usuario);
    end if;
end \\

delimiter ;

delimiter \\

create procedure crear_alumno(in correo_alumno varchar(255), in id_de_usuario int)
begin
	insert into alumnos (correo, id_usuario, fecha_ingreso)
    values(correo_alumno, id_de_usuario, NOW());
end \\

delimiter ;

delimiter \\

create procedure crear_profesor(in especialidad_profesor varchar(255), in correo_profesor varchar(255), id_de_usuario int)
begin
	insert into profesores (especialidad, correo, id_usuario)
    values(especialidad_profesor, correo_profesor, id_de_usuario);
end \\

delimiter ;

delimiter \\
create trigger trigger_usuarios_before_update before update on usuarios
for each row
begin
	if char_length(new.contraseña) < 8 or char_length(new.contraseña) > 64 then
		signal sqlstate '45000'
        set message_text = "La contraseña debe tener entre 8 y 64 caracteres";
	end if;
    
    set new.contraseña = SHA2(new.contraseña, 256);
    
    if new.tipo_usuario = 'invitado' then
		set new.nombre = 'invitado';
        set new.apellido1 = 'invitado';
        set new.apellido2 = 'invitado';
    end if;
end \\

delimiter ;



