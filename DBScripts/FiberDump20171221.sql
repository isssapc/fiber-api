CREATE DATABASE  IF NOT EXISTS `fiber` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `fiber`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fiber
-- ------------------------------------------------------
-- Server version	5.5.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `linea_puerta`
--

DROP TABLE IF EXISTS `linea_puerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linea_puerta` (
  `id_linea_puerta` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(45) DEFAULT NULL,
  `linea` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `precio_m2` decimal(6,2) DEFAULT NULL,
  `precio_marco` decimal(6,2) DEFAULT NULL,
  `precio_mullion` decimal(6,2) DEFAULT NULL,
  `bg_color` varchar(45) DEFAULT NULL,
  `src` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_linea_puerta`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linea_puerta`
--

LOCK TABLES `linea_puerta` WRITE;
/*!40000 ALTER TABLE `linea_puerta` DISABLE KEYS */;
INSERT INTO `linea_puerta` VALUES (1,NULL,'LOFT','Nogal Terracota','046 Nogal Terracota',967.72,NULL,NULL,NULL,NULL),(2,NULL,'LOFT','Aserrado Nordico','161 Aserrado Nordico',967.72,NULL,NULL,NULL,NULL),(3,NULL,'MADERA','Banak con acabado','Caoba dorado',2087.69,NULL,NULL,NULL,NULL),(4,NULL,'LACA','Francia','Blanco Btn',2572.18,NULL,NULL,NULL,NULL),(5,NULL,'EUROPA 3D','Silvery Matt','PCEU3D-M99981B',2749.71,NULL,NULL,NULL,NULL),(6,NULL,'EUROPA BASIC TEXTURA','Zabrano Streak 1C','PCEU-M10861T-1C ',1309.73,NULL,NULL,NULL,NULL),(7,NULL,'EUROPA BASIC SOLIDOS ','Cardinal HG Roja Brillante','PCEU-M21065HG',1502.96,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `linea_puerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mueble`
--

DROP TABLE IF EXISTS `mueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mueble` (
  `id_mueble` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(45) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `ancho` decimal(5,2) DEFAULT NULL,
  `altura` decimal(5,2) DEFAULT NULL,
  `fondo` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_mueble`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mueble`
--

LOCK TABLES `mueble` WRITE;
/*!40000 ALTER TABLE `mueble` DISABLE KEYS */;
INSERT INTO `mueble` VALUES (1,'AC3510','Alacena Campana',100.00,35.00,30.00),(2,'AE510','Alacena Entrepaño Movible ',100.00,52.50,30.00),(3,'GB15','Gabinete Puerta Entrepaño',80.00,70.00,60.00),(4,'GC2C100','Gabinete Fregadero',100.00,70.00,60.00),(5,'GC4C40','Gabinete Cajonero 4C',40.00,70.00,60.00),(6,'GRC100DSC','Gabinete Rinconero Ciego',100.00,70.00,60.00);
/*!40000 ALTER TABLE `mueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `id_proyecto` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime DEFAULT NULL,
  `cliente` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_mueble`
--

DROP TABLE IF EXISTS `proyecto_mueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_mueble` (
  `id_proyecto_mueble` int(11) NOT NULL AUTO_INCREMENT,
  `id_proyecto` varchar(45) DEFAULT NULL,
  `id_mueble` varchar(45) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_proyecto_mueble`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_mueble`
--

LOCK TABLES `proyecto_mueble` WRITE;
/*!40000 ALTER TABLE `proyecto_mueble` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto_mueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_puerta`
--

DROP TABLE IF EXISTS `proyecto_puerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_puerta` (
  `id_proyecto_puerta` int(11) NOT NULL AUTO_INCREMENT,
  `id_proyecto` varchar(45) DEFAULT NULL,
  `id_puerta` varchar(45) DEFAULT NULL,
  `ancho` decimal(5,2) DEFAULT NULL,
  `altura` decimal(5,2) DEFAULT NULL,
  `id_linea_puerta` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `deshabilitada` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_proyecto_puerta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_puerta`
--

LOCK TABLES `proyecto_puerta` WRITE;
/*!40000 ALTER TABLE `proyecto_puerta` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto_puerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puerta_mueble`
--

DROP TABLE IF EXISTS `puerta_mueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puerta_mueble` (
  `id_puerta_mueble` int(11) NOT NULL AUTO_INCREMENT,
  `id_mueble` varchar(45) DEFAULT NULL,
  `ancho` decimal(5,2) DEFAULT NULL,
  `altura` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_puerta_mueble`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puerta_mueble`
--

LOCK TABLES `puerta_mueble` WRITE;
/*!40000 ALTER TABLE `puerta_mueble` DISABLE KEYS */;
INSERT INTO `puerta_mueble` VALUES (1,'1',49.80,34.80),(2,'1',49.80,34.80),(3,'2',49.80,52.30),(4,'2',49.80,52.30),(5,'3',39.80,69.80),(6,'3',39.80,69.80),(7,'4',49.80,54.80),(8,'4',49.80,54.80),(9,'5',39.80,14.80),(10,'6',49.70,69.80);
/*!40000 ALTER TABLE `puerta_mueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `roll` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-21 22:53:12
