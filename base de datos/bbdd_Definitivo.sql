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
INSERT INTO `alergenos` VALUES (1,'Gluten','https://www.ladietadelchef.es/wp-content/uploads/2016/06/gluten-derivados-140x140.png'),(2,'Crustáceos','https://www.ladietadelchef.es/wp-content/uploads/2016/06/crustaceos-140x140.png'),(3,'Huevo','https://www.ladietadelchef.es/wp-content/uploads/2016/06/huevos-140x140.png'),(4,'Pescado','https://www.ladietadelchef.es/wp-content/uploads/2016/06/pescados-140x140.png'),(5,'Cacahuetes','https://www.ladietadelchef.es/wp-content/uploads/2016/06/cacahuetes-140x140.png'),(6,'Soja','https://www.ladietadelchef.es/wp-content/uploads/2016/06/soja-140x140.png'),(7,'Lácteos','https://www.ladietadelchef.es/wp-content/uploads/2016/06/lacteos-140x140.png'),(8,'Frutos secos','https://www.ladietadelchef.es/wp-content/uploads/2016/06/cascaras-frutos-secos-140x140.png'),(9,'Apio','https://www.ladietadelchef.es/wp-content/uploads/2016/06/apio-140x140.png'),(10,'Mostaza','https://www.ladietadelchef.es/wp-content/uploads/2016/06/mostaza-140x140.png'),(11,'Sésamo','https://www.ladietadelchef.es/wp-content/uploads/2016/06/granos-sesamo-140x140.png'),(12,'Sulfitos','https://www.ladietadelchef.es/wp-content/uploads/2016/06/dioxido-azufre-sulfitos-140x140.png'),(13,'Altramuces','https://www.ladietadelchef.es/wp-content/uploads/2016/06/altramuces-140x140.png'),(14,'Moluscos','https://www.ladietadelchef.es/wp-content/uploads/2016/06/moluscos-140x140.png'),(15,'Vegano','https://www.ladietadelchef.es/wp-content/uploads/2016/06/vegano-140x140.png');
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
  `correo` varchar(255) NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_alumno`),
  KEY `alumno-usuario_idx` (`id_usuario`),
  CONSTRAINT `alumno-usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'ikersae@hotmail.es','2024-09-01 08:00:00',3),(2,'zubieta_1@yahoo.com','2024-09-01 08:00:00',4),(3,'chef_mikel3@gastromail.com','2024-09-01 08:00:00',5),(4,'lgoikoetxea2024@gmail.com','2024-09-01 08:00:00',6),(5,'unaiagu@hotmail.es','2024-09-01 08:00:00',7),(6,'iturbe_1@yahoo.com','2025-09-01 08:00:00',8),(7,'chef_jon7@gastromail.com','2025-09-01 08:00:00',9),(8,'aolalde2025@gmail.com','2025-09-01 08:00:00',10),(9,'enekozab@hotmail.es','2025-09-01 08:00:00',11),(10,'larrea_1@yahoo.com','2025-09-01 08:00:00',12);
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
  `horas_anuales_asignatura` int NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `año_curso` int DEFAULT NULL,
  PRIMARY KEY (`id_asignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
INSERT INTO `asignaturas` VALUES (1,'Preelaboración y conservación de alimentos PRUEBA',195,'Obligatoria',1),(2,'Técnicas culinarias',240,'Obligatoria',1),(3,'Procesos básicos de pastelería y repostería',90,'Obligatoria',1),(4,'Seguridad e higiene en la manipulación de alimentos',60,'Obligatoria',1),(5,'DUAL general – Cocina (prácticas en empresa)',405,'Prácticas',1),(6,'Postres en restauración',120,'Obligatoria',2),(7,'Productos culinarios',210,'Obligatoria',2),(8,'Empresa e iniciativa emprendedora',75,'Obligatoria',2),(9,'Inglés profesional',80,'Obligatoria',2),(10,'Formación en Centro de Trabajo – Cocina',165,'Prácticas',2),(11,'Elaboraciones de panadería-bollería',270,'Obligatoria',1),(12,'Elaboraciones de confitería y otras especialidades',150,'Obligatoria',1),(13,'Operaciones y control de almacén – ind. alimentaria',90,'Obligatoria',1),(14,'Seguridad e higiene en manipulación de alimentos',60,'Obligatoria',1),(15,'DUAL general – Panadería (prácticas en empresa)',390,'Prácticas',1),(16,'Presentación y venta de productos de panadería',180,'Obligatoria',2),(17,'Postres en restauración – Panadería',90,'Obligatoria',2),(18,'Productos de obrador',225,'Obligatoria',2),(19,'Empresa e iniciativa emprendedora – Panadería',75,'Obligatoria',2),(20,'Inglés técnico',80,'Obligatoria',2),(21,'Formación en Centro de Trabajo – Panadería',400,'Prácticas',2),(22,'Implantación de cultivos',195,'Obligatoria',1),(23,'Taller y equipos de tracción',165,'Obligatoria',1),(24,'Infraestructuras e instalaciones agrícolas',135,'Obligatoria',1),(25,'Principios de sanidad vegetal',105,'Obligatoria',1),(26,'Itinerario personal para la empleabilidad I',60,'Obligatoria',1),(27,'Inglés profesional (Agricultura)',80,'Obligatoria',1),(28,'DUAL general – Agricultura',310,'Prácticas',1),(29,'Producción de leche, huevos y animales',210,'Obligatoria',2),(30,'Control fitosanitario',165,'Obligatoria',2),(31,'Producción carne y otras producciones ganaderas',210,'Obligatoria',2),(32,'Empresa e iniciativa emprendedora (Agri)',65,'Obligatoria',2),(33,'Formación en Centros de Trabajo – Agricultura',400,'Prácticas',2),(34,'Alimentación equilibrada',195,'Obligatoria',1),(35,'Control alimentario',150,'Obligatoria',1),(36,'Fisiopatología aplicada a la dietética',165,'Obligatoria',1),(37,'Organización y gestión de gabinete de dietética',105,'Obligatoria',1),(38,'Relaciones en el entorno de trabajo',60,'Obligatoria',1),(39,'Itinerario personal para la empleabilidad I',60,'Obligatoria',1),(40,'DUAL general – Dietética',315,'Prácticas',1),(41,'Calidad y mejora continua',120,'Obligatoria',2),(42,'Dietoterapia',195,'Obligatoria',2),(43,'Educación sanitaria y promoción de la salud',135,'Obligatoria',2),(44,'Microbiología e higiene alimentaria',120,'Obligatoria',2),(45,'Inglés profesional (Dietética)',80,'Obligatoria',2),(46,'DUAL general – Dietética 2º',400,'Prácticas',2),(47,'Estructura del mercado turístico',105,'Obligatoria',1),(48,'Marketing turístico',105,'Obligatoria',1),(49,'Gestión del departamento de pisos',150,'Obligatoria',1),(50,'Recepción y reservas',150,'Obligatoria',1),(51,'Inglés (Dirección de Cocina)',80,'Obligatoria',1),(52,'Itinerario personal para la empleabilidad I',60,'Obligatoria',1),(53,'Digitalización aplicada a los sectores productivos',60,'Obligatoria',1),(54,'DUAL general – Dirección de Cocina 1º',340,'Prácticas',1),(55,'Protocolo y relaciones públicas',105,'Obligatoria',2),(56,'Dirección de alojamientos turísticos',165,'Obligatoria',2),(57,'Recursos humanos en alojamientos',120,'Obligatoria',2),(58,'Comercialización de eventos',105,'Obligatoria',2),(59,'Proyecto intermodular',75,'Obligatoria',2),(60,'Segunda lengua extranjera',80,'Obligatoria',2),(61,'Itinerario personal para la empleabilidad II',60,'Obligatoria',2),(62,'DUAL general – Dirección de Cocina 2º',340,'Prácticas',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aulas`
--

LOCK TABLES `aulas` WRITE;
/*!40000 ALTER TABLE `aulas` DISABLE KEYS */;
INSERT INTO `aulas` VALUES (1,'Cocina Taller A',20,'Cocina práctica'),(2,'Obrador-Panadería',20,'Taller de panadería y pastelería'),(3,'Aula Polivalente Agricultura',24,'Aula teórica y laboratorio'),(4,'Aula Dietética y Nutrición',24,'Aula teórica y laboratorio'),(5,'Aula Dirección y Gestión',24,'Aula teórica'),(6,'Aula Polivalente Agricultura',24,'Aula teórica y laboratorio'),(7,'Aula Dietética y Nutrición',24,'Aula teórica y laboratorio'),(8,'Aula Dirección y Gestión',24,'Aula teórica'),(9,'Aula Polivalente Agricultura',24,'Aula teórica y laboratorio'),(10,'Aula Dietética y Nutrición',24,'Aula teórica y laboratorio'),(11,'Aula Dirección y Gestión',24,'Aula teórica'),(12,'Aula Polivalente Agricultura',24,'Aula teórica y laboratorio'),(13,'Aula Dietética y Nutrición',24,'Aula teórica y laboratorio'),(14,'Aula Dirección y Gestión',24,'Aula teórica'),(15,'Aula Polivalente Agricultura',24,'Aula teórica y laboratorio'),(16,'Aula Dietética y Nutrición',24,'Aula teórica y laboratorio'),(17,'Aula Dirección y Gestión',24,'Aula teórica'),(18,'Aula Polivalente Agricultura',24,'Aula teórica y laboratorio'),(19,'Aula Dietética y Nutrición',24,'Aula teórica y laboratorio'),(20,'Aula Dirección y Gestión',24,'Aula teórica'),(21,'Aula Polivalente Agricultura',24,'Aula teórica y laboratorio'),(22,'Aula Dietética y Nutrición',24,'Aula teórica y laboratorio'),(23,'Aula Dirección y Gestión',24,'Aula teórica'),(24,'Aula Polivalente Agricultura',24,'Aula teórica y laboratorio'),(25,'Aula Dietética y Nutrición',24,'Aula teórica y laboratorio'),(26,'Aula Dirección y Gestión',24,'Aula teórica'),(27,'Aula Polivalente Agricultura',24,'Aula teórica y laboratorio'),(28,'Aula Dietética y Nutrición',24,'Aula teórica y laboratorio'),(29,'Aula Dirección y Gestión',24,'Aula teórica'),(30,'Aula Polivalente Agricultura',24,'Aula teórica y laboratorio'),(31,'Aula Dietética y Nutrición',24,'Aula teórica y laboratorio'),(32,'Aula Dirección y Gestión',24,'Aula teórica');
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
INSERT INTO `curso-aula` VALUES (1,1,15),(2,2,14),(3,3,16),(4,4,22),(5,5,17);
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
  `año_académico` date NOT NULL,
  `nivel` varchar(255) NOT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Cocina y Gastronomía','2024-09-01','Grado Medio'),(2,'Panadería, Repostería y Confitería','2024-09-01','Grado Medio'),(3,'Agricultura','2024-09-01','Grado Medio'),(4,'Dietética','2024-09-01','Grado Superior'),(5,'Dirección de Cocina','2024-09-01','Grado Superior'),(6,'Agricultura','2023-09-01','Grado Medio'),(7,'Dietética','2023-09-01','Grado Superior'),(8,'Dirección de Cocina','2023-09-01','Grado Superior');
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
  `numero_evaluaciones` int DEFAULT '3',
  `año_curso` int DEFAULT '1',
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
INSERT INTO `cursos_asignaturas` VALUES (1,1,3,1),(2,1,3,1),(3,1,3,1),(4,1,3,1),(5,1,1,1),(6,1,3,2),(7,1,3,2),(8,1,3,2),(9,1,3,2),(10,1,1,2),(11,2,3,1),(12,2,3,1),(13,2,3,1),(14,2,3,1),(15,2,1,1),(16,2,3,2),(17,2,3,2),(18,2,3,2),(19,2,3,2),(20,2,3,2),(21,2,1,2),(22,3,3,1),(23,3,3,1),(24,3,3,1),(25,3,3,1),(26,3,3,1),(27,3,3,1),(28,3,1,1),(29,3,3,2),(30,3,3,2),(31,3,3,2),(32,3,3,2),(33,3,1,2),(34,4,3,1),(35,4,3,1),(36,4,3,1),(37,4,3,1),(38,4,3,1),(39,4,3,1),(40,4,1,1),(41,4,3,2),(42,4,3,2),(43,4,3,2),(44,4,3,2),(45,4,3,2),(46,4,1,2),(47,5,3,1),(48,5,3,1),(49,5,3,1),(50,5,3,1),(51,5,3,1),(52,5,3,1),(53,5,3,1),(54,5,1,1),(55,5,3,2),(56,5,3,2),(57,5,3,2),(58,5,3,2),(59,5,3,2),(60,5,3,2),(61,5,3,2),(62,5,1,2);
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
INSERT INTO `cursos_profesores` VALUES (1,1,'2025-09-19'),(2,2,'2025-09-19'),(3,3,'2025-09-19'),(4,4,'2025-09-19'),(5,5,'2025-09-19');
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
  `cantidad` float DEFAULT NULL,
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
INSERT INTO `ingredientes` VALUES (1,'Tomate cherry',0.5,'kg',5,15),(2,'Cebolla',0.2,'kg',8,15),(3,'Ajo',3,'ud',2,15),(4,'Pimiento rojo',0.3,'kg',4,15),(5,'Zanahoria',0.3,'kg',6,15),(6,'Patata',0.5,'kg',10,15),(7,'Puerro',0.25,'kg',3,15),(8,'Espinacas',0.2,'kg',2,15),(9,'Aceite de oliva virgen extra',50,'ml',10,15),(10,'Sal',5,'g',3000,15),(11,'Pimienta negra',2,'g',500,15),(12,'Albahaca fresca',5,'ud',500,15),(13,'Perejil fresco',4,'ud',500,15),(14,'Bacalao desalado',0.2,'kg',4,4),(15,'Anchoas en aceite',4,'ud',500,4),(16,'Gambas frescas',0.15,'kg',2,2),(17,'Berberechos frescos',0.25,'kg',2,14),(18,'Huevo campero',2,'ud',30,3),(19,'Nata líquida 35%',100,'ml',2,7),(20,'Queso Idiazabal',0.05,'kg',2,7),(21,'Leche entera',250,'ml',4,7),(22,'Mantequilla',50,'g',1000,7),(23,'Queso crema',200,'g',1500,7),(24,'Harina de trigo T55',0.1,'kg',5,1),(25,'Harina de fuerza',0.5,'kg',5,1),(26,'Pan rallado',50,'g',1000,1),(27,'Levadura fresca',10,'g',200,1),(28,'Azúcar blanquilla',0.1,'kg',3,15),(29,'Azúcar glas',30,'g',500,15),(30,'Cacao en polvo',30,'g',500,15),(31,'Alubias rojas',0.3,'kg',3,15),(32,'Txistorra',150,'g',1,1),(33,'Chorizo',150,'g',1,1),(34,'Avellanas tostadas',40,'g',500,8);
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
  `especialidad` varchar(255) DEFAULT NULL,
  `correo` varchar(255) NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_profesor`),
  KEY `professor-usuario_idx` (`id_usuario`),
  CONSTRAINT `professor-usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'Cocina y Gastronomía','ana.docente@gmail.es',1),(2,'Panadería, Repostería y Confitería','profe.lópez@hotmail.com',2),(3,'Agricultura','agonzalez@GastroLab.eus',21),(4,'Dietética','mmartinez@GastroLab.eus',22),(5,'Dirección de Cocina','lsanchez@GastroLab.eus',23);
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
  `votos` int DEFAULT '0',
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
INSERT INTO `recetas` VALUES (1,'Porrusalda','Fácil',40,'Pochar puerro y zanahoria en aceite; añadir patata y caldo; cocer 30 min y salpimentar.',12,1,'https://www.hola.com/horizon/landscape/c3e91d484c61-crema-porru-age-t.jpg?im=Resize=(360),type=downsize'),(2,'Bacalao al pil-pil','Difícil',60,'Confitar bacalao con ajo a 60 grados; ligar gelatina moviendo la cazuela en circulos hasta emulsionar.',20,1,'https://www.infobae.com/resizer/v2/AXSZC3HFXBB5XGWVFKTY4C3SXM.jpeg?auth=c6c745624537eeb469441453f7279d829ebe5251b0dc4bb8239b10ff9ca4244f&smart=true&width=1200&height=1200&quality=85'),(3,'Tortilla de patata','Media',35,'Freir patata y cebolla; escurrir; mezclar con huevo batido y cuajar por ambos lados.',18,2,'https://www.coren.es/wp-content/uploads/2017/07/Tortilla-.jpeg'),(4,'Alubias rojas de Tolosa','Media',120,'Remojar 12 horas; cocer a fuego lento con txistorra y chorizo; añadir sal al final.',15,2,'https://www.hola.com/horizon/landscape/ff03066a0899-holatolosaportadas-t.jpg'),(5,'Revuelto de gambas y espinacas','Media',20,'Saltear gambas con ajo; añadir espinacas y huevo batido; remover hasta cuajar ligeramente.',10,3,'https://www.instagram.com/reel/DU8zbwyiC6_/'),(6,'Merluza en salsa verde','Media',30,'Dorar ajo; añadir harina; mojar con caldo de pescado y perejil; incorporar merluza y cocer 8 min.',14,4,'https://bigcrafters.com/cdn/shop/articles/merluza-en-salsa-verde-receta-de-la-abuela_a790cf27-8d28-4bf1-9742-ef63a8a792bd.webp?v=1773761893'),(7,'Gazpacho andaluz','Fácil',15,'Triturar tomate, pimiento, ajo, pan, aceite y vinagre; colar; salpimentar y enfriar 2 horas.',8,5,'https://static.bainet.es/clip/8cd6db25-3535-4baa-83cd-f90303765c5b_source-aspect-ratio_1600w_0.jpg'),(8,'Crema de zanahoria y jengibre','Fácil',35,'Pochar cebolla y zanahoria; añadir jengibre y caldo; cocer 20 min; triturar y montar con nata.',9,6,'https://okdiario.com/img/2019/10/04/crema-de-zanahoria-jengibre-y-queso-crema.jpg'),(9,'Pintxo de anchoa e Idiazabal','Fácil',10,'Tostar pan; colocar loncha de Idiazabal y anchoa encima; servir a temperatura ambiente.',11,7,'https://calidadgourmet.com/wp-content/uploads/2015/04/Tosta-de-anchoas-de-Santo%C3%B1a-con-queso-Idiazabal.png'),(10,'Tarta de queso al horno','Media',70,'Batir queso crema, huevos, nata y azucar; volcar en molde y hornear a 200 grados 50 min.',17,8,'https://imag.bonviveur.com/desmoldar-con-cuidado.jpg'),(11,'Pan de avellanas','Media',90,'Mezclar harina de fuerza, levadura, agua y sal; incorporar avellanas; fermentar 1 hora y hornear.',7,9,'https://www.tiktok.com/@josebaarguinano/video/7574424946873617696?is_from_webapp=1&sender_device=pc'),(12,'Berberechos al vapor','Fácil',10,'Cocer berberechos tapados con vino blanco y perejil hasta que abran; desechar los cerrados.',13,10,'https://recetasdecocina.elmundo.es/wp-content/uploads/2022/04/berberechos-al-vapor-1.jpg'),(13,'Croquetas de bacalao','Media',50,'Preparar bechamel espesa con mantequilla y harina; añadir bacalao; enfriar; empanar y freir.',16,11,'https://img.saboresdehoy.com/receta/715/croquetas-cremosas-de-bacalao.jpg'),(14,'Ensalada de tomate y albahaca','Fácil',10,'Cortar tomate cherry por la mitad; aliñar con aceite de oliva, sal y hojas de albahaca fresca.',6,12,'https://s1.abcstatics.com/abc/sevilla/media/gurmesevilla/2010/03/1256_ensaladatomatemozarellaalbahaca_1268558108.jpg'),(15,'Natillas caseras','Fácil',30,'Calentar leche con canela; batir yemas con azucar; mezclar y cocer sin hervir hasta espesar.',10,3,'https://imag.bonviveur.com/natillas.jpg');
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
  `nombre` varchar(45) NOT NULL,
  `apellido1` varchar(45) DEFAULT NULL,
  `apellido2` varchar(45) DEFAULT NULL,
  `correo` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `tipo_usuario` enum('profesor','alumno','invitado') NOT NULL DEFAULT 'invitado',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Ana','García','Fernández','agarcia@GastroLab.eus','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','profesor'),(2,'Carlos','López','Mendoza','clopez@GastroLab.eus','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','profesor'),(3,'Iker','Etxebarria','Saez','ietxebarria@GastroLab.eus','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','alumno'),(4,'Amaia','Zubieta','Garate','azubieta@GastroLab.eus','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','alumno'),(5,'Mikel','Arrizabalaga','Uribe','marrizabalaga@GastroLab.eus','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','alumno'),(6,'Leire','Goikoetxea','Pardo','lgoikoetxea@GastroLab.eus','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','alumno'),(7,'Unai','Arostegi','Aguirre','uarostegi@GastroLab.eus','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','alumno'),(8,'Nerea','Iture','Eguren','niture@GastroLab.eus','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','alumno'),(9,'Jon','Lazkano','Olabe','jlazkano@GastroLab.eus','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','alumno'),(10,'Ane','Olalde','Berasategi','aolalde@GastroLab.eus','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','alumno'),(11,'Eneko','Urrutia','Zabala','eurrutia@GastroLab.eus','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','alumno'),(12,'Miren','Larrea','Txabarri','mlarrea@GastroLab.eus','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','alumno'),(13,'invitado','invitado','invitado','invitado1@mail.com','cf39a5b6b9131f3615b4505f6c78cf37109f2e330ad1d457061cdfe873ca368a','invitado'),(14,'invitado','invitado','invitado','invitado2@mail.com','cf39a5b6b9131f3615b4505f6c78cf37109f2e330ad1d457061cdfe873ca368a','invitado'),(15,'invitado','invitado','invitado','invitado3@mail.com','cf39a5b6b9131f3615b4505f6c78cf37109f2e330ad1d457061cdfe873ca368a','invitado'),(16,'invitado','invitado','invitado','invitado4@mail.com','cf39a5b6b9131f3615b4505f6c78cf37109f2e330ad1d457061cdfe873ca368a','invitado'),(17,'invitado','invitado','invitado','invitado5@mail.com','cf39a5b6b9131f3615b4505f6c78cf37109f2e330ad1d457061cdfe873ca368a','invitado'),(18,'invitado','invitado','invitado','invitado6@mail.com','cf39a5b6b9131f3615b4505f6c78cf37109f2e330ad1d457061cdfe873ca368a','invitado'),(19,'invitado','invitado','invitado','invitado7@mail.com','cf39a5b6b9131f3615b4505f6c78cf37109f2e330ad1d457061cdfe873ca368a','invitado'),(20,'invitado','invitado','invitado','invitado8@mail.com','cf39a5b6b9131f3615b4505f6c78cf37109f2e330ad1d457061cdfe873ca368a','invitado'),(21,'Amaia','González','Elorza','agonzalez@GastroLab.eus','cf39a5b6b9131f3615b4505f6c78cf37109f2e330ad1d457061cdfe873ca368a','profesor'),(22,'Mikel','Martínez','Iturri','mmartinez@GastroLab.eus','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','profesor'),(23,'Leire','Sánchez','Zabala','lsanchez@GastroLab.eus','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','profesor');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_usuario_before_insert` BEFORE INSERT ON `usuarios` FOR EACH ROW begin
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
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_usuario_after_insert` AFTER INSERT ON `usuarios` FOR EACH ROW begin
	if new.tipo_usuario = 'alumno' then
		call crear_alumno(new.correo, new.id_usuario);
	elseif new.tipo_usuario = 'profesor' then
		call crear_profesor(null, new.correo, new.id_usuario);
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_usuarios_before_update` BEFORE UPDATE ON `usuarios` FOR EACH ROW begin
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
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vista_cursos_asignaturas`
--

DROP TABLE IF EXISTS `vista_cursos_asignaturas`;
/*!50001 DROP VIEW IF EXISTS `vista_cursos_asignaturas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_cursos_asignaturas` AS SELECT 
 1 AS `nombre_curso`,
 1 AS `nombre_asignatura`,
 1 AS `año_curso`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_huertos_ingredientes`
--

DROP TABLE IF EXISTS `vista_huertos_ingredientes`;
/*!50001 DROP VIEW IF EXISTS `vista_huertos_ingredientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_huertos_ingredientes` AS SELECT 
 1 AS `id_huerto`,
 1 AS `nombre_seccion`,
 1 AS `tipo_suelo`,
 1 AS `estado_siembra`,
 1 AS `ingrediente_plantado`,
 1 AS `fecha_recoleccion`,
 1 AS `cantidad_recoleccion`,
 1 AS `stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_lectura_recetas_ingredientes_likes`
--

DROP TABLE IF EXISTS `vista_lectura_recetas_ingredientes_likes`;
/*!50001 DROP VIEW IF EXISTS `vista_lectura_recetas_ingredientes_likes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_lectura_recetas_ingredientes_likes` AS SELECT 
 1 AS `id_receta`,
 1 AS `nombre_receta`,
 1 AS `cantidad_de_ingredientes_por_receta`,
 1 AS `dificultad`,
 1 AS `tiempo`,
 1 AS `nombre_ingrediente`,
 1 AS `cantidad_de_cada_ingrediente`,
 1 AS `unidad_medida`,
 1 AS `instrucciones`,
 1 AS `cantidad_likes`,
 1 AS `url_imagen_video`,
 1 AS `tipo_alergeno`,
 1 AS `icono_alergeno`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'reto5_musarana_elefante'
--

--
-- Dumping routines for database 'reto5_musarana_elefante'
--
/*!50003 DROP FUNCTION IF EXISTS `eliminar_acentos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminar_acentos`(texto varchar(255)) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
begin
	declare resultado varchar(255);
    set resultado = lower(texto);
    set resultado = replace(resultado, "á", "a");
    set resultado = replace(resultado, "é", "e");
    set resultado = replace(resultado, "í", "i");
    set resultado = replace(resultado, "ó", "o");
    set resultado = replace(resultado, "ú", "u");
    
    return resultado;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crear_alumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_alumno`(in correo_alumno varchar(255), in id_de_usuario int)
begin
	insert into alumnos (correo, id_usuario, fecha_ingreso)
    values(correo_alumno, id_de_usuario, NOW());
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crear_profesor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_profesor`(in especialidad_profesor varchar(255), in correo_profesor varchar(255), id_de_usuario int)
begin
	insert into profesores (especialidad, correo, id_usuario)
    values(especialidad_profesor, correo_profesor, id_de_usuario);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generar_correo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generar_correo`(
in p_nombre varchar(255),
in p_apellido1 varchar(255),
in p_dominio varchar(255),
out p_correo varchar(255))
begin
	set p_nombre = eliminar_acentos(p_nombre);
    set p_apellido1 = eliminar_acentos(p_apellido1);
    set p_correo = concat(lower(concat(left(p_nombre, 1), p_apellido1)), "@", p_dominio);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_cursos_asignaturas`
--

/*!50001 DROP VIEW IF EXISTS `vista_cursos_asignaturas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cursos_asignaturas` AS select `c`.`nombre` AS `nombre_curso`,`a`.`nombre` AS `nombre_asignatura`,`ca`.`año_curso` AS `año_curso` from ((`cursos` `c` left join `cursos_asignaturas` `ca` on((`c`.`id_curso` = `ca`.`id_curso`))) left join `asignaturas` `a` on((`a`.`id_asignatura` = `ca`.`id_asignatura`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_huertos_ingredientes`
--

/*!50001 DROP VIEW IF EXISTS `vista_huertos_ingredientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_huertos_ingredientes` AS select `h`.`id_huerto` AS `id_huerto`,`h`.`sección` AS `nombre_seccion`,`h`.`tipo_suelo` AS `tipo_suelo`,`h`.`estado_siembra` AS `estado_siembra`,`i`.`nombre` AS `ingrediente_plantado`,`hi`.`fecha_recoleccion` AS `fecha_recoleccion`,`hi`.`cantidad_recoleccion` AS `cantidad_recoleccion`,`i`.`stock` AS `stock` from ((`huertos` `h` left join `huerto_ingredientes` `hi` on((`h`.`id_huerto` = `hi`.`id_huerto`))) left join `ingredientes` `i` on((`hi`.`id_ingrediente` = `i`.`id_ingredientes`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_lectura_recetas_ingredientes_likes`
--

/*!50001 DROP VIEW IF EXISTS `vista_lectura_recetas_ingredientes_likes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_lectura_recetas_ingredientes_likes` AS select `r`.`id_receta` AS `id_receta`,`r`.`nombre` AS `nombre_receta`,`ri`.`cantidad` AS `cantidad_de_ingredientes_por_receta`,`r`.`dificultad` AS `dificultad`,`r`.`tiempo` AS `tiempo`,`i`.`nombre` AS `nombre_ingrediente`,`i`.`cantidad` AS `cantidad_de_cada_ingrediente`,`i`.`unidad_medida` AS `unidad_medida`,`r`.`instrucciones` AS `instrucciones`,`r`.`votos` AS `cantidad_likes`,`r`.`url_archivo` AS `url_imagen_video`,`a`.`tipo` AS `tipo_alergeno`,`a`.`enlace_img` AS `icono_alergeno` from (((`recetas` `r` left join `receta_ingredientes` `ri` on((`r`.`id_receta` = `ri`.`id_receta`))) left join `ingredientes` `i` on((`ri`.`id_ingrediente` = `i`.`id_ingredientes`))) left join `alergenos` `a` on((`i`.`id_alergeno` = `a`.`id_alergeno`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-05 16:25:15
