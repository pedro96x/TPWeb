-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tp
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `autos`
--

DROP TABLE IF EXISTS `autos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autos` (
  `id_auto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `id_tipoauto` int(11) NOT NULL,
  PRIMARY KEY (`id_auto`),
  KEY `tiene_auto_tipo_fk_idx` (`id_tipoauto`),
  CONSTRAINT `tiene_auto_tipo_fk` FOREIGN KEY (`id_tipoauto`) REFERENCES `tiposdeauto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autos`
--

LOCK TABLES `autos` WRITE;
/*!40000 ALTER TABLE `autos` DISABLE KEYS */;
INSERT INTO `autos` VALUES (1,'',1),(2,'SER-133 ROJO',2),(7,'QER-103 VERDE',1),(8,'WSR-102',4),(10,'NOO-109',3),(11,'YES-111',2),(12,'PED-002',2),(13,'QWE-186',4),(14,'zsdasd',2);
/*!40000 ALTER TABLE `autos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personastp`
--

DROP TABLE IF EXISTS `personastp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personastp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `habilitado` tinyint(4) DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `tipo_per` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personastp`
--

LOCK TABLES `personastp` WRITE;
/*!40000 ALTER TABLE `personastp` DISABLE KEYS */;
INSERT INTO `personastp` VALUES (4,123123,'Romeo','Perez',1,'rome123','pass123','ADM'),(5,39120762,'Pedro  ','Routaboul',1,'pedro96x','5300','ENC'),(7,1245789,'Miguel 2','Oliveros',0,'cuban65','freecuba','USR'),(8,3955698,'Facundito    ','Gomez',1,'facux','facu123','ADM'),(9,21312,'asdas','asda',0,'sdad','adsd1','ADM'),(14,333,'asda','asda',1,'asda','sd','ADM'),(17,2333,'asdasd  ','asdasd',0,'232332','3e3','USR'),(21,40145698,'Juan  ','Diaz',0,'pedro96x@gmail.com','admin','ADM'),(22,3912256,'Pedro ','Routaboul',1,'pedroroutaboul@gmail.com','5300','ADM'),(23,123123,'dfsdfsd','sdfsdf',1,'asdasdasd','asdasd','ADM'),(24,23123,'asdasdas','asdasd',0,'asdasd','asdasd','ADM'),(25,23434,'Encargado','Encargado',1,'encargado@encargado.com','encargado','ENC'),(27,9090909,'Usuario','Usuario',1,'usuario@usuario.com','usuario','USR');
/*!40000 ALTER TABLE `personastp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fechain` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  `detalle` varchar(45) DEFAULT NULL,
  `auto_reservado` int(11) NOT NULL,
  `id_persona` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tiene_auto_idx` (`auto_reservado`),
  KEY `tiene_persona_idx` (`id_persona`),
  CONSTRAINT `tiene_auto` FOREIGN KEY (`auto_reservado`) REFERENCES `autos` (`id_auto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tiene_persona` FOREIGN KEY (`id_persona`) REFERENCES `personastp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,'2000-01-01','2000-01-10','Dame una senic verde ',7,5),(8,'2017-10-10','2017-10-20','sdasd',8,5),(9,'2017-10-11','2017-10-25','asdasd',8,5),(11,'2019-03-01','2019-04-01','sdasd',7,4),(12,'2019-03-01','2019-04-01','sdfdf',10,4),(13,'2019-08-01','2019-09-01','sdasd',1,4),(14,'2019-09-01','2019-10-01','sdsd',7,4),(16,'2020-03-20','2020-03-28','ddvdsssss',2,21),(17,'2044-12-01','2044-12-07','detallesss',10,21),(18,'2017-10-28','2017-10-29','change',7,21),(23,'2017-10-28','2017-10-31','asd',10,21),(25,'2017-11-21','2017-11-24','vbnghn',8,21),(27,'2018-04-30','2018-05-24','JBHJBJJ',7,21),(28,'2017-11-09','2017-11-11','dfsdfsdf',7,22),(37,'2017-12-01','2017-12-08','dfsdfsdf',13,25);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposdeauto`
--

DROP TABLE IF EXISTS `tiposdeauto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposdeauto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_auto` varchar(45) DEFAULT NULL,
  `cant_max_res` int(11) DEFAULT NULL,
  `lim_max_tiempo_reserva` int(11) DEFAULT NULL,
  `dias_de_ant_nec` int(11) DEFAULT NULL,
  `permiso` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposdeauto`
--

LOCK TABLES `tiposdeauto` WRITE;
/*!40000 ALTER TABLE `tiposdeauto` DISABLE KEYS */;
INSERT INTO `tiposdeauto` VALUES (1,'Renault Scenic',2,672,1,'ALL'),(2,'Ford Focus',3,700,2,'ALL'),(3,'Chevrolet Onix ',4,4,2,'ALL'),(4,'Nissan Tiida',1,625,2,'ENC');
/*!40000 ALTER TABLE `tiposdeauto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-16 21:52:57
