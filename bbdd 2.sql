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
-- Table `reto5_musarana_elefante`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`cursos` (
  `id_curso` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `año_académico` DATETIME NULL DEFAULT NULL,
  `nivel` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_curso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`alumnos` (
  `id_alumno` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_ingreso` DATETIME NULL DEFAULT NULL,
  ` id_curso` INT NOT NULL,
  PRIMARY KEY (`id_alumno`),
  INDEX `Alumno_Cursos_idx` (` id_curso` ASC) VISIBLE,
  CONSTRAINT `Alumno_Cursos`
    FOREIGN KEY (` id_curso`)
    REFERENCES `reto5_musarana_elefante`.`cursos` (`id_curso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`asignaturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`asignaturas` (
  `id_asignatura` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `créditos` VARCHAR(45) NULL DEFAULT NULL,
  `tipo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_asignatura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`aulas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`aulas` (
  `id_aula` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `capacidad` INT NULL DEFAULT NULL,
  `tipo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_aula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`centros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`centros` (
  `idcentros` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idcentros`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`huertos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`huertos` (
  `id_huerto` INT NOT NULL,
  `sección` VARCHAR(45) NULL DEFAULT NULL,
  `tipo_suelo` VARCHAR(45) NULL DEFAULT NULL,
  `estado_siembra` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_huerto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`ingredientes` (
  `id_ingredientes` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `unidad_medida` INT NULL DEFAULT NULL,
  `stock` VARCHAR(45) NULL DEFAULT NULL,
  `id_huerto` INT NOT NULL,
  PRIMARY KEY (`id_ingredientes`),
  INDEX `Ingredientes_Huerto_idx` (`id_huerto` ASC) VISIBLE,
  CONSTRAINT `Ingredientes_Huerto`
    FOREIGN KEY (`id_huerto`)
    REFERENCES `reto5_musarana_elefante`.`huertos` (`id_huerto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`menu` (
  `id_menu` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `temporada` VARCHAR(45) NULL DEFAULT NULL,
  `precio` DECIMAL(10,0) NULL DEFAULT NULL,
  ` tipo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_menu`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`recetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`recetas` (
  `id_receta` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `dificultad` VARCHAR(45) NULL DEFAULT NULL,
  `tiempo` INT NULL DEFAULT NULL,
  `instrucciones` VARCHAR(45) NULL DEFAULT NULL,
  `id_asignatura` INT NOT NULL,
  PRIMARY KEY (`id_receta`),
  INDEX `Recetas_Asignaturas_idx` (`id_asignatura` ASC) VISIBLE,
  CONSTRAINT `Recetas_Asignaturas`
    FOREIGN KEY (`id_asignatura`)
    REFERENCES `reto5_musarana_elefante`.`asignaturas` (`id_asignatura`)
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
  INDEX `Menu_Rece_R_idx` (`id_menu` ASC) VISIBLE,
  INDEX `Menu_Rece_Receta_idx` (`id_receta` ASC) VISIBLE,
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
  `id_profesor` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `especialidad` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `id_nomina` INT NOT NULL,
  PRIMARY KEY (`id_profesor`),
  INDEX `Profesor_Nominas_idx` (`id_nomina` ASC) VISIBLE,
  CONSTRAINT `Profesor_Nominas`
    FOREIGN KEY (`id_nomina`)
    REFERENCES `reto5_musarana_elefante`.`nominas` (`id_nomina`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `reto5_musarana_elefante`.`nominas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reto5_musarana_elefante`.`nominas` (
  `id_nomina` INT NOT NULL,
  `sueldo_base` DECIMAL(50,0) NULL DEFAULT NULL,
  `deducciones` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_pago` DATE NULL DEFAULT NULL,
  `id_profesor` INT NOT NULL,
  PRIMARY KEY (`id_nomina`),
  INDEX `Nominas_Profesor_idx` (`id_profesor` ASC) VISIBLE,
  CONSTRAINT `Nominas_Profesores`
    FOREIGN KEY (`id_profesor`)
    REFERENCES `reto5_musarana_elefante`.`profesores` (`id_profesor`)
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
  `cantidad` INT NULL DEFAULT NULL,
  INDEX `r_Receta_Ingredientes_i_idx` (`id_receta` ASC) VISIBLE,
  INDEX `Receta_Ingredientes_Ingredientes_idx` (`id_ingrediente` ASC) VISIBLE,
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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
