use reto5_musarana_elefante;

-- Vistas
create view vista_lectura_recetas_ingredientes as
select r.id_receta, r.nombre as nombre_receta, 
r.dificultad, r.tiempo, i.nombre as nombre_ingrediente,
ri.cantidad as cantidad_de_cada_ingrediente, ri.unidad_medida, 
r.instrucciones,
r.url_archivo as url_imagen_video, a.tipo as tipo_alergeno, 
a.enlace_img as icono_alergeno
from recetas r
left join receta_ingredientes ri on r.id_receta = ri.id_receta
left join ingredientes i on ri.id_ingrediente = i.id_ingredientes
left join alergenos a on i.id_alergeno = a.id_alergeno;


create view vista_huertos_ingredientes as
select h.id_huerto, h.sección as nombre_seccion,
h.tipo_suelo, h.estado_siembra,
i.nombre as ingrediente_plantado, hi.fecha_recoleccion,
hi.cantidad_recoleccion, i.stock
from huertos h
left join huerto_ingredientes hi on h.id_huerto = hi.id_huerto
left join ingredientes i on hi.id_ingrediente = i.id_ingredientes;


create view vista_cursos_asignaturas as
select c.nombre as nombre_curso, 
a.nombre as nombre_asignatura, ca.año_curso as año_curso
from cursos c
left join cursos_asignaturas ca on c.id_curso = ca.id_curso
left join asignaturas a on a.id_asignatura = ca.id_asignatura;


-- Roles
drop role if exists 'rol_invitado', 'rol_alumno', 'rol_profesor';
create role 'rol_invitado', 'rol_alumno', 'rol_profesor';

-- Permisos a los roles
-- Invitados
grant select on vista_lectura_recetas_ingredientes to 'rol_invitado';
grant select on vista_cursos_asignaturas to 'rol_invitado';
grant select, insert, delete on likes_recetas to 'rol_invitado';
grant select, insert on usuarios to 'rol_invitado';
grant select on recetas to 'rol_invitado';
grant select, update on likes to 'rol_invitado';


-- Alumnos
grant select on vista_lectura_recetas_ingredientes to 'rol_alumno';
grant select on vista_cursos_asignaturas to 'rol_alumno';
grant select, insert, delete on likes_recetas to 'rol_alumno';
grant select on usuarios to 'rol_alumno';
grant select on ingredientes to 'rol_alumno';
grant select, insert on recetas to 'rol_alumno';
grant select, insert on receta_ingredientes to 'rol_alumno';
grant select, update on likes to 'rol_alumno';


grant select on vista_huertos_ingredientes to 'rol_alumno';
grant select on huertos to 'rol_alumno';
grant insert, update on huerto_ingredientes to 'rol_alumno';

-- Profesores
grant select on vista_lectura_recetas_ingredientes to 'rol_profesor';
grant select on vista_cursos_asignaturas to 'rol_profesor';
grant select, insert, update on likes_recetas to 'rol_profesor';
grant select on usuarios to 'rol_profesor';
grant select, insert on ingredientes to 'rol_profesor';
grant select, insert, update, delete on recetas to 'rol_profesor';
grant select, insert, update, delete on receta_ingredientes to 'rol_profesor';
grant select, update on likes to 'rol_profesor';

grant select on vista_huertos_ingredientes to 'rol_profesor';
grant select on huertos to 'rol_profesor';
grant insert, update, delete on huerto_ingredientes to 'rol_profesor';

-- Crear usuario

drop user if exists 'usuario_La_Comanda'@'localhost';
create user 'usuario_La_Comanda'@'localhost' identified by 'GastroLab2026';
grant 'rol_invitado', 'rol_alumno', 'rol_profesor' to 'usuario_La_Comanda'@'localhost';

set default role 'rol_invitado' to 'usuario_La_Comanda'@'localhost';

GRANT ALL PRIVILEGES ON reto5_musarana_elefante.* TO 'usuario_La_Comanda'@'localhost';
FLUSH PRIVILEGES;


