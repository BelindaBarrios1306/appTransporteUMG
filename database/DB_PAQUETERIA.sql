-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: db_paqueteria
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `camion`
--

DROP TABLE IF EXISTS `camion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camion` (
  `idCamion` int NOT NULL AUTO_INCREMENT,
  `NoPlaca` varchar(45) NOT NULL,
  `Modelo` varchar(45) NOT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  `Potencia` int DEFAULT NULL,
  PRIMARY KEY (`idCamion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camion`
--

LOCK TABLES `camion` WRITE;
/*!40000 ALTER TABLE `camion` DISABLE KEYS */;
INSERT INTO `camion` VALUES (1,'Ead1','Yamaha','C',10);
/*!40000 ALTER TABLE `camion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camionero`
--

DROP TABLE IF EXISTS `camionero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camionero` (
  `idCamionero` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Salario` double(18,2) NOT NULL,
  `Poblacion` varchar(45) DEFAULT NULL,
  `DPI` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idCamionero`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camionero`
--

LOCK TABLES `camionero` WRITE;
/*!40000 ALTER TABLE `camionero` DISABLE KEYS */;
INSERT INTO `camionero` VALUES (1,'CARLOS','RAMIREZ','54357777','SAN MARCOS',3000.00,'JSJ','466203536');
/*!40000 ALTER TABLE `camionero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camionerocamion`
--

DROP TABLE IF EXISTS `camionerocamion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camionerocamion` (
  `idCamioneroCamion` int NOT NULL AUTO_INCREMENT,
  `idCamionero` int NOT NULL,
  `idCamion` int DEFAULT NULL,
  PRIMARY KEY (`idCamioneroCamion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camionerocamion`
--

LOCK TABLES `camionerocamion` WRITE;
/*!40000 ALTER TABLE `camionerocamion` DISABLE KEYS */;
/*!40000 ALTER TABLE `camionerocamion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `idCiudad` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idCiudad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'SAN MARCOS');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conductorcamion`
--

DROP TABLE IF EXISTS `conductorcamion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conductorcamion` (
  `idCamioneroCamion` int NOT NULL AUTO_INCREMENT,
  `fk_idCamionero` int DEFAULT NULL,
  `fk_idCamion` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`idCamioneroCamion`),
  KEY `fk_idCamionero` (`fk_idCamionero`),
  KEY `fk_idCamion` (`fk_idCamion`),
  CONSTRAINT `conductorcamion_ibfk_1` FOREIGN KEY (`fk_idCamionero`) REFERENCES `camionero` (`idCamionero`),
  CONSTRAINT `conductorcamion_ibfk_2` FOREIGN KEY (`fk_idCamion`) REFERENCES `camion` (`idCamion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conductorcamion`
--

LOCK TABLES `conductorcamion` WRITE;
/*!40000 ALTER TABLE `conductorcamion` DISABLE KEYS */;
INSERT INTO `conductorcamion` VALUES (1,1,1,'2026-10-23');
/*!40000 ALTER TABLE `conductorcamion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquete`
--

DROP TABLE IF EXISTS `paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquete` (
  `idPaquete` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  `Destinatario` varchar(45) NOT NULL,
  `DireccionEnvio` varchar(45) NOT NULL,
  `idCamionero` int NOT NULL,
  `idCiudad` int NOT NULL,
  PRIMARY KEY (`idPaquete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquete`
--

LOCK TABLES `paquete` WRITE;
/*!40000 ALTER TABLE `paquete` DISABLE KEYS */;
/*!40000 ALTER TABLE `paquete` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-24 18:22:57
