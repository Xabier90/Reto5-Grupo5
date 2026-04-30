CREATE DATABASE  IF NOT EXISTS `reto5_musarana_elefante` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `reto5_musarana_elefante`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: reto5_musarana_elefante
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alergenos`
--

DROP TABLE IF EXISTS `alergenos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alergenos` (
  `id_alergeno` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `enlace_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_alergeno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alergenos`
--

LOCK TABLES `alergenos` WRITE;
/*!40000 ALTER TABLE `alergenos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alergenos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `id_alumno` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido1` varchar(255) NOT NULL,
  `apellido2` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_alumno`),
  KEY `alumno-usuario_idx` (`id_usuario`),
  CONSTRAINT `alumno-usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignaturas` (
  `id_asignatura` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `créditos` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_asignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aulas`
--

DROP TABLE IF EXISTS `aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aulas` (
  `id_aula` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `capacidad` int NOT NULL,
  `tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_aula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aulas`
--

LOCK TABLES `aulas` WRITE;
/*!40000 ALTER TABLE `aulas` DISABLE KEYS */;
/*!40000 ALTER TABLE `aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso-aula`
--

DROP TABLE IF EXISTS `curso-aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso-aula` (
  `id_curso` int NOT NULL,
  `id_aula` int NOT NULL,
  `capacidad_utilizada` int DEFAULT NULL,
  PRIMARY KEY (`id_curso`,`id_aula`),
  KEY `curso_aula-aula_idx` (`id_aula`),
  CONSTRAINT `curso_aula-aula` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id_aula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `curso_aula-curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso-aula`
--

LOCK TABLES `curso-aula` WRITE;
/*!40000 ALTER TABLE `curso-aula` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso-aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `año_académico` datetime NOT NULL,
  `nivel` varchar(255) NOT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos-alumnos`
--

DROP TABLE IF EXISTS `cursos-alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos-alumnos` (
  `id_curso` int NOT NULL,
  `id_alumno` int NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id_curso`,`id_alumno`),
  KEY `curso_alum-alumno_idx` (`id_alumno`),
  CONSTRAINT `curso_alum-alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `curso_alum-Curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos-alumnos`
--

LOCK TABLES `cursos-alumnos` WRITE;
/*!40000 ALTER TABLE `cursos-alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos-alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos_asignaturas`
--

DROP TABLE IF EXISTS `cursos_asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos_asignaturas` (
  `id_asignatura` int NOT NULL,
  `id_curso` int NOT NULL,
  `cantidad_asig_año` int DEFAULT NULL,
  PRIMARY KEY (`id_asignatura`,`id_curso`),
  KEY `CursoAsig- Curso_idx` (`id_curso`),
  CONSTRAINT `CursoAsig- Asig` FOREIGN KEY (`id_asignatura`) REFERENCES `asignaturas` (`id_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CursoAsig- Curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos_asignaturas`
--

LOCK TABLES `cursos_asignaturas` WRITE;
/*!40000 ALTER TABLE `cursos_asignaturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos_asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos_profesores`
--

DROP TABLE IF EXISTS `cursos_profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos_profesores` (
  `id_curso` int NOT NULL,
  `id_profesor` int NOT NULL,
  `fecha_evaluaciones` date DEFAULT NULL,
  PRIMARY KEY (`id_curso`,`id_profesor`),
  KEY `cursos_prof-profesores_idx` (`id_profesor`),
  CONSTRAINT `cursos_prof-cursos` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cursos_prof-profesores` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos_profesores`
--

LOCK TABLES `cursos_profesores` WRITE;
/*!40000 ALTER TABLE `cursos_profesores` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos_profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huerto_ingredientes`
--

DROP TABLE IF EXISTS `huerto_ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huerto_ingredientes` (
  `id_huerto` int NOT NULL,
  `id_ingrediente` int NOT NULL,
  `fecha_recoleccion` date DEFAULT NULL,
  `cantidad_recoleccion` int DEFAULT NULL,
  PRIMARY KEY (`id_huerto`,`id_ingrediente`),
  KEY `huerto_ingre-ingrediente_idx` (`id_ingrediente`),
  CONSTRAINT `huerto_ingre-huerto` FOREIGN KEY (`id_huerto`) REFERENCES `huertos` (`id_huerto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `huerto_ingre-ingrediente` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingredientes`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huerto_ingredientes`
--

LOCK TABLES `huerto_ingredientes` WRITE;
/*!40000 ALTER TABLE `huerto_ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `huerto_ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huertos`
--

DROP TABLE IF EXISTS `huertos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huertos` (
  `id_huerto` int NOT NULL AUTO_INCREMENT,
  `sección` varchar(255) DEFAULT NULL,
  `tipo_suelo` varchar(255) DEFAULT NULL,
  `estado_siembra` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_huerto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huertos`
--

LOCK TABLES `huertos` WRITE;
/*!40000 ALTER TABLE `huertos` DISABLE KEYS */;
/*!40000 ALTER TABLE `huertos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes` (
  `id_ingredientes` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `unidad_medida` enum('mg','g','kg','ud','ml','L') NOT NULL,
  `stock` int DEFAULT NULL,
  `id_alergeno` int NOT NULL,
  PRIMARY KEY (`id_ingredientes`,`id_alergeno`),
  KEY `ingredientes_alergenos_idx` (`id_alergeno`),
  CONSTRAINT `ingredientes_alergenos` FOREIGN KEY (`id_alergeno`) REFERENCES `alergenos` (`id_alergeno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_recetas`
--

DROP TABLE IF EXISTS `likes_recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_recetas` (
  `id_usuario` int NOT NULL,
  `id_receta` int NOT NULL,
  `fecha_like` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`id_receta`),
  KEY `likes_receta- receta_idx` (`id_receta`),
  KEY `likes_receta- usuarios_idx` (`id_usuario`),
  CONSTRAINT `likes_receta- receta` FOREIGN KEY (`id_receta`) REFERENCES `recetas` (`id_receta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `likes_receta- usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_recetas`
--

LOCK TABLES `likes_recetas` WRITE;
/*!40000 ALTER TABLE `likes_recetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes_recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `temporada` varchar(255) NOT NULL,
  `precio` float NOT NULL,
  ` tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_recetas`
--

DROP TABLE IF EXISTS `menu_recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_recetas` (
  `id_menu` int NOT NULL,
  `id_receta` int NOT NULL,
  `fecha_receta_integrada_menu` date DEFAULT NULL,
  PRIMARY KEY (`id_menu`,`id_receta`),
  KEY `Menu_Rece_R_idx` (`id_menu`),
  KEY `Menu_Rece_Receta_idx` (`id_receta`),
  CONSTRAINT `Menu_Rece_Menus` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Menu_Rece_Recetas` FOREIGN KEY (`id_receta`) REFERENCES `recetas` (`id_receta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_recetas`
--

LOCK TABLES `menu_recetas` WRITE;
/*!40000 ALTER TABLE `menu_recetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `id_profesor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido1` varchar(255) NOT NULL,
  `apellido2` varchar(255) NOT NULL,
  `especialidad` varchar(255) DEFAULT NULL,
  `correo` varchar(255) NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_profesor`),
  KEY `professor-usuario_idx` (`id_usuario`),
  CONSTRAINT `professor-usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta_ingredientes`
--

DROP TABLE IF EXISTS `receta_ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta_ingredientes` (
  `id_receta` int NOT NULL,
  `id_ingrediente` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_receta`,`id_ingrediente`),
  KEY `r_Receta_Ingredientes_i_idx` (`id_receta`),
  KEY `Receta_Ingredientes_Ingredientes_idx` (`id_ingrediente`),
  CONSTRAINT `Receta_Ingredientes_Ingredientes` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingredientes`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Receta_Ingredientes_Recetas` FOREIGN KEY (`id_receta`) REFERENCES `recetas` (`id_receta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta_ingredientes`
--

LOCK TABLES `receta_ingredientes` WRITE;
/*!40000 ALTER TABLE `receta_ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta_ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas` (
  `id_receta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `dificultad` varchar(255) NOT NULL,
  `tiempo` int NOT NULL,
  `instrucciones` varchar(255) NOT NULL,
  `votos` int NOT NULL,
  `id_usuario` int NOT NULL,
  `url_archivo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_receta`),
  KEY `recetas_usuarios_idx` (`id_usuario`),
  CONSTRAINT `recetas_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `correo` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `tipo_usuario` enum('profesor','alumno','invitado') NOT NULL DEFAULT 'invitado',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-30 13:56:11
