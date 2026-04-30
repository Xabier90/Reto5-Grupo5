-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema reto5_musarana_elefante
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema reto5_musarana_elefante
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `reto5_musarana_elefante` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `reto5_musarana_elefante` ;

-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`alergenos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`alergenos` (
  `id_alergeno` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(255) NULL DEFAULT NULL,
  `enlace_img` VARCHAR(255) NULL,
  PRIMARY KEY (`id_alergeno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `correo` VARCHAR(255) NOT NULL,
  `contraseña` VARCHAR(255) NOT NULL,
  `tipo_usuario` ENUM('profesor', 'alumno', 'invitado') NOT NULL DEFAULT 'invitado',
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`alumnos` (
  `id_alumno` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `apellido1` VARCHAR(255) NOT NULL,
  `apellido2` VARCHAR(255) NOT NULL,
  `correo` VARCHAR(255) NOT NULL,
  `fecha_ingreso` DATETIME NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_alumno`),
  INDEX `alumno-usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `alumno-usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `reto5_musarana_elefante`.`usuarios` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`asignaturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`asignaturas` (
  `id_asignatura` INT NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `créditos` VARCHAR(255) NOT NULL,
  `tipo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_asignatura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`aulas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`aulas` (
  `id_aula` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `capacidad` INT NOT NULL,
  `tipo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_aula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`cursos` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `año_académico` DATETIME NOT NULL,
  `nivel` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_curso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`huertos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`huertos` (
  `id_huerto` INT NOT NULL AUTO_INCREMENT,
  `sección` VARCHAR(255) NULL DEFAULT NULL,
  `tipo_suelo` VARCHAR(255) NULL DEFAULT NULL,
  `estado_siembra` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_huerto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`ingredientes` (
  `id_ingredientes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `unidad_medida` ENUM('mg', 'g', 'kg', 'ud', 'ml', 'L') NOT NULL,
  `stock` INT NULL DEFAULT NULL,
  `id_alergeno` INT NOT NULL,
  PRIMARY KEY (`id_ingredientes`, `id_alergeno`),
  INDEX `ingredientes_alergenos_idx` (`id_alergeno` ASC) VISIBLE,
  CONSTRAINT `ingredientes_alergenos`
    FOREIGN KEY (`id_alergeno`)
    REFERENCES `reto5_musarana_elefante`.`alergenos` (`id_alergeno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`menu` (
  `id_menu` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `temporada` VARCHAR(255) NOT NULL,
  `precio` FLOAT NOT NULL,
  ` tipo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_menu`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`recetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`recetas` (
  `id_receta` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `dificultad` VARCHAR(255) NOT NULL,
  `tiempo` INT NOT NULL,
  `instrucciones` VARCHAR(255) NOT NULL,
  `votos` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `url_archivo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_receta`),
  INDEX `recetas_usuarios_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `recetas_usuarios`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `reto5_musarana_elefante`.`usuarios` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`menu_recetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`menu_recetas` (
  `id_menu` INT NOT NULL,
  `id_receta` INT NOT NULL,
  `fecha_receta_integrada_menu` DATE NULL,
  INDEX `Menu_Rece_R_idx` (`id_menu` ASC) VISIBLE,
  INDEX `Menu_Rece_Receta_idx` (`id_receta` ASC) VISIBLE,
  PRIMARY KEY (`id_menu`, `id_receta`),
  CONSTRAINT `Menu_Rece_Menus`
    FOREIGN KEY (`id_menu`)
    REFERENCES `reto5_musarana_elefante`.`menu` (`id_menu`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Menu_Rece_Recetas`
    FOREIGN KEY (`id_receta`)
    REFERENCES `reto5_musarana_elefante`.`recetas` (`id_receta`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`profesores` (
  `id_profesor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `apellido1` VARCHAR(255) NOT NULL,
  `apellido2` VARCHAR(255) NOT NULL,
  `especialidad` VARCHAR(255) NULL DEFAULT NULL,
  `correo` VARCHAR(255) NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_profesor`),
  INDEX `professor-usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `professor-usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `reto5_musarana_elefante`.`usuarios` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`receta_ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`receta_ingredientes` (
  `id_receta` INT NOT NULL,
  `id_ingrediente` INT NOT NULL,
  `cantidad` INT NOT NULL,
  INDEX `r_Receta_Ingredientes_i_idx` (`id_receta` ASC) VISIBLE,
  INDEX `Receta_Ingredientes_Ingredientes_idx` (`id_ingrediente` ASC) VISIBLE,
  PRIMARY KEY (`id_receta`, `id_ingrediente`),
  CONSTRAINT `Receta_Ingredientes_Ingredientes`
    FOREIGN KEY (`id_ingrediente`)
    REFERENCES `reto5_musarana_elefante`.`ingredientes` (`id_ingredientes`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Receta_Ingredientes_Recetas`
    FOREIGN KEY (`id_receta`)
    REFERENCES `reto5_musarana_elefante`.`recetas` (`id_receta`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`cursos_asignaturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`cursos_asignaturas` (
  `id_asignatura` INT NOT NULL,
  `id_curso` INT NOT NULL,
  `cantidad_asig_año` INT NULL,
  PRIMARY KEY (`id_asignatura`, `id_curso`),
  INDEX `CursoAsig- Curso_idx` (`id_curso` ASC) VISIBLE,
  CONSTRAINT `CursoAsig- Asig`
    FOREIGN KEY (`id_asignatura`)
    REFERENCES `reto5_musarana_elefante`.`asignaturas` (`id_asignatura`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CursoAsig- Curso`
    FOREIGN KEY (`id_curso`)
    REFERENCES `reto5_musarana_elefante`.`cursos` (`id_curso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`cursos-alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`cursos-alumnos` (
  `id_curso` INT NOT NULL,
  `id_alumno` INT NOT NULL,
  `fecha_inicio` DATE NULL,
  `fecha_fin` DATE NULL,
  PRIMARY KEY (`id_curso`, `id_alumno`),
  INDEX `curso_alum-alumno_idx` (`id_alumno` ASC) VISIBLE,
  CONSTRAINT `curso_alum-Curso`
    FOREIGN KEY (`id_curso`)
    REFERENCES `reto5_musarana_elefante`.`cursos` (`id_curso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `curso_alum-alumno`
    FOREIGN KEY (`id_alumno`)
    REFERENCES `reto5_musarana_elefante`.`alumnos` (`id_alumno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`cursos_profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`cursos_profesores` (
  `id_curso` INT NOT NULL,
  `id_profesor` INT NOT NULL,
  `fecha_evaluaciones` DATE NULL,
  PRIMARY KEY (`id_curso`, `id_profesor`),
  INDEX `cursos_prof-profesores_idx` (`id_profesor` ASC) VISIBLE,
  CONSTRAINT `cursos_prof-cursos`
    FOREIGN KEY (`id_curso`)
    REFERENCES `reto5_musarana_elefante`.`cursos` (`id_curso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `cursos_prof-profesores`
    FOREIGN KEY (`id_profesor`)
    REFERENCES `reto5_musarana_elefante`.`profesores` (`id_profesor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`likes_recetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`likes_recetas` (
  `id_usuario` INT NOT NULL,
  `id_receta` INT NOT NULL,
  `fecha_like` DATETIME NULL,
  INDEX `likes_receta- receta_idx` (`id_receta` ASC) VISIBLE,
  INDEX `likes_receta- usuarios_idx` (`id_usuario` ASC) VISIBLE,
  PRIMARY KEY (`id_usuario`, `id_receta`),
  CONSTRAINT `likes_receta- receta`
    FOREIGN KEY (`id_receta`)
    REFERENCES `reto5_musarana_elefante`.`recetas` (`id_receta`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `likes_receta- usuarios`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `reto5_musarana_elefante`.`usuarios` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`curso-aula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`curso-aula` (
  `id_curso` INT NOT NULL,
  `id_aula` INT NOT NULL,
  `capacidad_utilizada` INT NULL,
  PRIMARY KEY (`id_curso`, `id_aula`),
  INDEX `curso_aula-aula_idx` (`id_aula` ASC) VISIBLE,
  CONSTRAINT `curso_aula-curso`
    FOREIGN KEY (`id_curso`)
    REFERENCES `reto5_musarana_elefante`.`cursos` (`id_curso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `curso_aula-aula`
    FOREIGN KEY (`id_aula`)
    REFERENCES `reto5_musarana_elefante`.`aulas` (`id_aula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`huerto_ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`huerto_ingredientes` (
  `id_huerto` INT NOT NULL,
  `id_ingrediente` INT NOT NULL,
  `fecha_recoleccion` DATE NULL,
  `cantidad_recoleccion` INT NULL,
  PRIMARY KEY (`id_huerto`, `id_ingrediente`),
  INDEX `huerto_ingre-ingrediente_idx` (`id_ingrediente` ASC) VISIBLE,
  CONSTRAINT `huerto_ingre-huerto`
    FOREIGN KEY (`id_huerto`)
    REFERENCES `reto5_musarana_elefante`.`huertos` (`id_huerto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `huerto_ingre-ingrediente`
    FOREIGN KEY (`id_ingrediente`)
    REFERENCES `reto5_musarana_elefante`.`ingredientes` (`id_ingredientes`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
