-- MySQL Workbench Synchronization
-- Generated: 2026-04-30 13:38
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: herna

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `reto5_musarana_elefante`.`alergenos` 
CHANGE COLUMN `id_alergeno` `id_alergeno` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `reto5_musarana_elefante`.`alumnos` 
ADD COLUMN `apellido1` VARCHAR(255) NOT NULL AFTER `nombre`,
ADD COLUMN `apellido2` VARCHAR(255) NOT NULL AFTER `apellido1`,
CHANGE COLUMN `id_alumno` `id_alumno` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `reto5_musarana_elefante`.`aulas` 
CHANGE COLUMN `id_aula` `id_aula` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `reto5_musarana_elefante`.`cursos` 
CHANGE COLUMN `id_curso` `id_curso` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `reto5_musarana_elefante`.`huertos` 
CHANGE COLUMN `id_huerto` `id_huerto` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `reto5_musarana_elefante`.`ingredientes` 
CHANGE COLUMN `id_ingredientes` `id_ingredientes` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `reto5_musarana_elefante`.`menu` 
CHANGE COLUMN `id_menu` `id_menu` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `reto5_musarana_elefante`.`profesores` 
ADD COLUMN `apellido1` VARCHAR(255) NOT NULL AFTER `nombre`,
ADD COLUMN `apellido2` VARCHAR(255) NOT NULL AFTER `apellido1`,
CHANGE COLUMN `id_profesor` `id_profesor` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `reto5_musarana_elefante`.`recetas` 
CHANGE COLUMN `id_receta` `id_receta` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `reto5_musarana_elefante`.`usuarios` 
CHANGE COLUMN `id_usuario` `id_usuario` INT(11) NOT NULL AUTO_INCREMENT ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
