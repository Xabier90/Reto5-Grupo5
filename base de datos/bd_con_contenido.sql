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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alergenos`
--

LOCK TABLES `alergenos` WRITE;
/*!40000 ALTER TABLE `alergenos` DISABLE KEYS */;
INSERT INTO `alergenos` VALUES (1,'Gluten','https://www.euskadi.eus/contenidos/informacion/alergenos/es_def/images/gluten.png'),(2,'Crustáceos','https://www.euskadi.eus/contenidos/informacion/alergenos/es_def/images/crustaceos.png'),(3,'Huevo','https://www.euskadi.eus/contenidos/informacion/alergenos/es_def/images/huevo.png'),(4,'Pescado','https://www.euskadi.eus/contenidos/informacion/alergenos/es_def/images/pescado.png'),(5,'Cacahuetes','https://www.euskadi.eus/contenidos/informacion/alergenos/es_def/images/cacahuetes.png'),(6,'Soja','https://www.euskadi.eus/contenidos/informacion/alergenos/es_def/images/soja.png'),(7,'Lácteos','https://www.euskadi.eus/contenidos/informacion/alergenos/es_def/images/lacteos.png'),(8,'Frutos de cáscara','https://www.euskadi.eus/contenidos/informacion/alergenos/es_def/images/frutos_cascara.png'),(9,'Apio','https://www.euskadi.eus/contenidos/informacion/alergenos/es_def/images/apio.png'),(10,'Mostaza','https://www.euskadi.eus/contenidos/informacion/alergenos/es_def/images/mostaza.png'),(11,'Sésamo','https://www.euskadi.eus/contenidos/informacion/alergenos/es_def/images/sesamo.png'),(12,'Sulfitos','https://www.euskadi.eus/contenidos/informacion/alergenos/es_def/images/sulfitos.png'),(13,'Altramuces','https://www.euskadi.eus/contenidos/informacion/alergenos/es_def/images/altramuces.png'),(14,'Moluscos','https://www.euskadi.eus/contenidos/informacion/alergenos/es_def/images/moluscos.png'),(15,'Sin alérgeno','https://www.euskadi.eus/contenidos/informacion/alergenos/es_def/images/sin_alergeno.png');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'Iker','Etxebarria','Saez','ietxebarria@GastroLab.eus','2024-09-01 08:00:00',3),(2,'Amaia','Zubieta','Garate','azubieta@GastroLab.eus','2024-09-01 08:00:00',4),(3,'Mikel','Arrizabalaga','Uribe','marrizabalaga@GastroLab.eus','2024-09-01 08:00:00',5),(4,'Leire','Goikoetxea','Pardo','lgoikoetxea@GastroLab.eus','2024-09-01 08:00:00',6),(5,'Unai','Arostegi','Aguirre','uarostegi@GastroLab.eus','2024-09-01 08:00:00',7),(6,'Nerea','Iturbe','Eguren','niture@GastroLab.eus','2025-09-01 08:00:00',8),(7,'Jon','Lazkano','Olabe','jlazkano@GastroLab.eus','2025-09-01 08:00:00',9),(8,'Ane','Olalde','Berasategi','aolalde@GastroLab.eus','2025-09-01 08:00:00',10),(9,'Eneko','Urrutia','Zabala','eurrutia@GastroLab.eus','2025-09-01 08:00:00',11),(10,'Miren','Larrea','Txabarri','mlarrea@GastroLab.eus','2025-09-01 08:00:00',12);
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
INSERT INTO `asignaturas` VALUES (1,'Preelaboración y conservación de alimentos','11','Obligatoria'),(2,'Técnicas culinarias','13','Obligatoria'),(3,'Procesos básicos de pastelería y repostería','5','Obligatoria'),(4,'Seguridad e higiene en la manipulación de alimentos','3','Obligatoria'),(5,'DUAL general – Cocina (prácticas en empresa)','22','Prácticas'),(6,'Postres en restauración','5','Obligatoria'),(7,'Productos culinarios','12','Obligatoria'),(8,'Empresa e iniciativa emprendedora','4','Obligatoria'),(9,'Inglés profesional','3','Obligatoria'),(10,'Formación en Centro de Trabajo – Cocina','22','Prácticas'),(11,'Elaboraciones de panadería-bollería','14','Obligatoria'),(12,'Elaboraciones de confitería y otras especialidades','7','Obligatoria'),(13,'Operaciones y control de almacén – ind. alimentaria','5','Obligatoria'),(14,'Seguridad e higiene en manipulación de alimentos','3','Obligatoria'),(15,'DUAL general – Panadería (prácticas en empresa)','22','Prácticas'),(16,'Presentación y venta de productos de panadería','8','Obligatoria'),(17,'Postres en restauración – Panadería','5','Obligatoria'),(18,'Productos de obrador','13','Obligatoria'),(19,'Empresa e iniciativa emprendedora – Panadería','4','Obligatoria'),(20,'Inglés técnico','3','Obligatoria');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aulas`
--

LOCK TABLES `aulas` WRITE;
/*!40000 ALTER TABLE `aulas` DISABLE KEYS */;
INSERT INTO `aulas` VALUES (1,'Cocina Taller A',20,'Cocina práctica'),(2,'Obrador-Panadería',20,'Taller de panadería y pastelería');
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
INSERT INTO `curso-aula` VALUES (1,1,15),(2,2,14);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Cocina y Gastronomía','2024-09-01 00:00:00','Grado Medio'),(2,'Panadería, Repostería y Confitería','2024-09-01 00:00:00','Grado Medio');
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
INSERT INTO `cursos-alumnos` VALUES (1,1,'2024-09-01','2026-06-30'),(1,2,'2024-09-01','2026-06-30'),(1,3,'2024-09-01','2026-06-30'),(1,4,'2024-09-01','2026-06-30'),(1,5,'2024-09-01','2026-06-30'),(2,6,'2024-09-01','2026-06-30'),(2,7,'2024-09-01','2026-06-30'),(2,8,'2024-09-01','2026-06-30'),(2,9,'2024-09-01','2026-06-30'),(2,10,'2024-09-01','2026-06-30');
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
INSERT INTO `cursos_asignaturas` VALUES (1,1,3),(2,1,3),(3,1,3),(4,1,3),(5,1,1),(6,1,3),(7,1,3),(8,1,3),(9,1,3),(10,1,1),(11,2,3),(12,2,3),(13,2,3),(14,2,3),(15,2,1),(16,2,3),(17,2,3),(18,2,3),(19,2,3),(20,2,3);
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
INSERT INTO `cursos_profesores` VALUES (1,1,'2025-09-19'),(2,2,'2025-09-19');
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
INSERT INTO `huerto_ingredientes` VALUES (1,1,'2026-04-20',8),(1,2,'2026-04-15',10),(1,4,'2026-04-18',6),(1,5,'2026-04-10',12),(1,6,'2026-03-25',20),(1,7,'2026-04-22',5),(2,3,'2026-04-20',3),(2,12,'2026-04-25',2),(2,13,'2026-04-25',2),(3,8,'2026-04-28',4),(3,31,'2026-05-10',7);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huertos`
--

LOCK TABLES `huertos` WRITE;
/*!40000 ALTER TABLE `huertos` DISABLE KEYS */;
INSERT INTO `huertos` VALUES (1,'Sección A – Hortalizas de temporada','Franco-arcilloso','En producción'),(2,'Sección B – Plantas aromáticas','Arenoso-franco','En crecimiento'),(3,'Sección C – Legumbres y cereales','Franco-limoso','Recién sembrado');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES (1,'Tomate cherry','kg',5,15),(2,'Cebolla','kg',8,15),(3,'Ajo','kg',2,15),(4,'Pimiento rojo','kg',4,15),(5,'Zanahoria','kg',6,15),(6,'Patata','kg',10,15),(7,'Puerro','kg',3,15),(8,'Espinacas','kg',2,15),(9,'Aceite de oliva virgen extra','L',10,15),(10,'Sal','g',3000,15),(11,'Pimienta negra','g',500,15),(12,'Albahaca fresca','g',500,15),(13,'Perejil fresco','g',500,15),(14,'Bacalao desalado','kg',4,4),(15,'Anchoas en aceite','g',500,4),(16,'Gambas frescas','kg',2,2),(17,'Berberechos frescos','kg',2,14),(18,'Huevo campero','ud',30,3),(19,'Nata líquida 35%','L',2,7),(20,'Queso Idiazabal','kg',2,7),(21,'Leche entera','L',4,7),(22,'Mantequilla','g',1000,7),(23,'Queso crema','g',1500,7),(24,'Harina de trigo T55','kg',5,1),(25,'Harina de fuerza','kg',5,1),(26,'Pan rallado','g',1000,1),(27,'Levadura fresca','g',200,1),(28,'Azúcar blanquilla','kg',3,15),(29,'Azúcar glas','g',500,15),(30,'Cacao en polvo','g',500,15),(31,'Alubias rojas','kg',3,15),(32,'Txistorra','kg',1,1),(33,'Chorizo','kg',1,1),(34,'Avellanas tostadas','g',500,8);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Menú Euskal Sukaldea','Otoño-Invierno',12.5,'Menú diario'),(2,'Menú Primavera Fresh','Primavera-Verano',10,'Menú degustación');
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
INSERT INTO `menu_recetas` VALUES (1,1,'2024-10-01'),(1,2,'2024-10-01'),(1,4,'2024-10-01'),(1,9,'2024-10-01'),(1,10,'2024-10-01'),(2,5,'2025-04-01'),(2,7,'2025-04-01'),(2,12,'2025-04-01'),(2,14,'2025-04-01'),(2,15,'2025-04-01');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'Ana','García','Fernández','Cocina y Gastronomía','agarcia@GastroLab.eus',1),(2,'Carlos','López','Mendoza','Panadería, Repostería y Confitería','clopez@GastroLab.eus',2);
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
INSERT INTO `receta_ingredientes` VALUES (1,5,4),(1,6,5),(1,7,3),(1,9,2),(1,10,5),(2,3,6),(2,9,3),(2,14,4),(3,2,2),(3,6,4),(3,9,3),(3,10,5),(3,18,6),(4,10,5),(4,31,5),(4,32,2),(4,33,1),(5,3,2),(5,8,2),(5,9,2),(5,16,3),(5,18,4),(6,3,3),(6,9,3),(6,10,5),(6,13,2),(6,24,2),(7,1,6),(7,3,1),(7,4,2),(7,9,4),(7,10,5),(7,26,2),(8,2,1),(8,5,5),(8,9,2),(8,10,5),(8,11,3),(8,19,2),(9,15,2),(9,20,3),(9,26,4),(10,18,3),(10,19,2),(10,23,4),(10,28,2),(11,10,5),(11,25,5),(11,27,1),(11,34,3),(12,9,1),(12,13,2),(12,17,5),(13,14,3),(13,18,2),(13,21,4),(13,22,2),(13,24,3),(13,26,2),(14,1,4),(14,9,3),(14,10,5),(14,12,2),(15,18,4),(15,21,5),(15,28,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES (1,'Porrusalda','Fácil',40,'Pochar puerro y zanahoria en aceite; añadir patata y caldo; cocer 30 min y salpimentar.',12,1,'https://gastrolab.eus/recetas/porrusalda.pdf'),(2,'Bacalao al pil-pil','Difícil',60,'Confitar bacalao con ajo a 60 grados; ligar gelatina moviendo la cazuela en circulos hasta emulsionar.',20,1,'https://gastrolab.eus/recetas/bacalao_pilpil.pdf'),(3,'Tortilla de patata','Media',35,'Freir patata y cebolla; escurrir; mezclar con huevo batido y cuajar por ambos lados.',18,2,'https://gastrolab.eus/recetas/tortilla_patata.pdf'),(4,'Alubias rojas de Tolosa','Media',120,'Remojar 12 horas; cocer a fuego lento con txistorra y chorizo; añadir sal al final.',15,2,'https://gastrolab.eus/recetas/alubias_tolosa.pdf'),(5,'Revuelto de gambas y espinacas','Media',20,'Saltear gambas con ajo; añadir espinacas y huevo batido; remover hasta cuajar ligeramente.',10,3,'https://gastrolab.eus/recetas/revuelto_gambas.pdf'),(6,'Merluza en salsa verde','Media',30,'Dorar ajo; añadir harina; mojar con caldo de pescado y perejil; incorporar merluza y cocer 8 min.',14,4,'https://gastrolab.eus/recetas/merluza_verde.pdf'),(7,'Gazpacho andaluz','Fácil',15,'Triturar tomate, pimiento, ajo, pan, aceite y vinagre; colar; salpimentar y enfriar 2 horas.',8,5,'https://gastrolab.eus/recetas/gazpacho.pdf'),(8,'Crema de zanahoria y jengibre','Fácil',35,'Pochar cebolla y zanahoria; añadir jengibre y caldo; cocer 20 min; triturar y montar con nata.',9,6,'https://gastrolab.eus/recetas/crema_zanahoria.pdf'),(9,'Pintxo de anchoa e Idiazabal','Fácil',10,'Tostar pan; colocar loncha de Idiazabal y anchoa encima; servir a temperatura ambiente.',11,7,'https://gastrolab.eus/recetas/pintxo_anchoa.pdf'),(10,'Tarta de queso al horno','Media',70,'Batir queso crema, huevos, nata y azucar; volcar en molde y hornear a 200 grados 50 min.',17,8,'https://gastrolab.eus/recetas/tarta_queso.pdf'),(11,'Pan de avellanas','Media',90,'Mezclar harina de fuerza, levadura, agua y sal; incorporar avellanas; fermentar 1 hora y hornear.',7,9,'https://gastrolab.eus/recetas/pan_avellanas.pdf'),(12,'Berberechos al vapor','Fácil',10,'Cocer berberechos tapados con vino blanco y perejil hasta que abran; desechar los cerrados.',13,10,'https://gastrolab.eus/recetas/berberechos.pdf'),(13,'Croquetas de bacalao','Media',50,'Preparar bechamel espesa con mantequilla y harina; añadir bacalao; enfriar; empanar y freir.',16,11,'https://gastrolab.eus/recetas/croquetas_bacalao.pdf'),(14,'Ensalada de tomate y albahaca','Fácil',10,'Cortar tomate cherry por la mitad; aliñar con aceite de oliva, sal y hojas de albahaca fresca.',6,12,'https://gastrolab.eus/recetas/ensalada_tomate.pdf'),(15,'Natillas caseras','Fácil',30,'Calentar leche con canela; batir yemas con azucar; mezclar y cocer sin hervir hasta espesar.',10,3,'https://gastrolab.eus/recetas/natillas.pdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'agarcia@GastroLab.eus','$2b$10$HaShedPasswd0001','profesor'),(2,'clopez@GastroLab.eus','$2b$10$HaShedPasswd0002','profesor'),(3,'ietxebarria@GastroLab.eus','$2b$10$HaShedPasswd0003','alumno'),(4,'azubieta@GastroLab.eus','$2b$10$HaShedPasswd0004','alumno'),(5,'marrizabalaga@GastroLab.eus','$2b$10$HaShedPasswd0005','alumno'),(6,'lgoikoetxea@GastroLab.eus','$2b$10$HaShedPasswd0006','alumno'),(7,'uarostegi@GastroLab.eus','$2b$10$HaShedPasswd0007','alumno'),(8,'niture@GastroLab.eus','$2b$10$HaShedPasswd0008','alumno'),(9,'jlazkano@GastroLab.eus','$2b$10$HaShedPasswd0009','alumno'),(10,'aolalde@GastroLab.eus','$2b$10$HaShedPasswd0010','alumno'),(11,'eurrutia@GastroLab.eus','$2b$10$HaShedPasswd0011','alumno'),(12,'mlarrea@GastroLab.eus','$2b$10$HaShedPasswd0012','alumno'),(13,'invitado1@mail.com','$2b$10$HaShedPasswd0013','invitado'),(14,'invitado2@mail.com','$2b$10$HaShedPasswd0014','invitado'),(15,'invitado3@mail.com','$2b$10$HaShedPasswd0015','invitado'),(16,'invitado4@mail.com','$2b$10$HaShedPasswd0016','invitado'),(17,'invitado5@mail.com','$2b$10$HaShedPasswd0017','invitado'),(18,'invitado6@mail.com','$2b$10$HaShedPasswd0018','invitado'),(19,'invitado7@mail.com','$2b$10$HaShedPasswd0019','invitado'),(20,'invitado8@mail.com','$2b$10$HaShedPasswd0020','invitado');
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

-- Dump completed on 2026-04-30 17:41:23
