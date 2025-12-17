/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: localhost    Database: mushborg
-- ------------------------------------------------------
-- Server version	11.8.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `calendarCategories`
--

DROP TABLE IF EXISTS `calendarCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendarCategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(255) DEFAULT NULL,
  `colore` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `show` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendarCategories`
--

LOCK TABLES `calendarCategories` WRITE;
/*!40000 ALTER TABLE `calendarCategories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `calendarCategories` VALUES
(2,'Scadenza','#a9dbcb',NULL,1,'2024-12-08 20:00:00','2024-12-08 20:00:00'),
(3,'Fruttificazione','#9cdcff',NULL,1,'2024-12-08 20:00:00','2024-12-08 20:00:00'),
(4,'Maturazione','#f2746d',NULL,1,'2024-12-08 20:00:00','2024-12-08 20:00:00'),
(5,'Appuntamento','#2439aa',NULL,1,'2024-12-08 20:00:00','2024-12-08 20:00:00');
/*!40000 ALTER TABLE `calendarCategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `calendars`
--

DROP TABLE IF EXISTS `calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `allDay` tinyint(4) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `relatedElement` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `completed` int(11) DEFAULT NULL,
  `calendarCategoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendars`
--

LOCK TABLES `calendars` WRITE;
/*!40000 ALTER TABLE `calendars` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `calendars` VALUES
(1,'Ricrodo 2','TEst descrizione','2024-12-08 01:00:00','2024-12-09 23:00:00',0,3,NULL,'2024-12-07 10:00:00','2024-12-10 10:02:25',1,2),
(2,'Ricrodo 3','TEst descrizione','2024-12-05 01:00:00','2024-12-10 22:00:00',0,2,NULL,'2024-12-07 10:00:00','2024-12-10 10:37:48',1,3),
(4,'Ricrodo 4','TEst descrizione','2024-12-01 13:00:00',NULL,0,3,NULL,'2024-12-07 10:00:00','2024-12-10 10:41:27',1,2),
(8,'3333','TEst descrizione','2024-12-01 15:00:00',NULL,0,3,NULL,'2024-12-07 10:00:00','2024-12-10 10:41:31',1,3),
(10,'ssss','ssss','2024-10-20 10:01:00','2012-11-20 11:01:00',1,2,NULL,'2024-12-10 11:01:42','2024-12-10 11:01:42',0,3),
(12,'rerere','rwerwerwer','2024-03-20 11:09:00',NULL,0,2,NULL,'2024-12-10 11:09:40','2024-12-10 11:09:40',0,2),
(13,'sss','wdc','2024-03-20 11:09:00',NULL,0,2,NULL,'2024-12-10 11:10:43','2024-12-10 11:10:43',0,2),
(14,'asdasd','asdasd','2024-10-20 10:16:00',NULL,0,2,NULL,'2024-12-10 11:16:04','2024-12-10 11:16:04',0,2),
(15,'asdasdasdasd','asdasdasd asd asd asd asdasd','2024-10-20 10:29:00',NULL,1,2,NULL,'2024-12-10 11:29:13','2024-12-10 11:29:13',0,2),
(17,'asdas asd asd as','a sd 3 sd a ','2024-12-10 11:31:00',NULL,1,2,NULL,'2024-12-10 11:31:48','2024-12-10 11:31:48',0,2),
(19,'sdasdasd','as asd asd as','2024-12-09 23:00:00',NULL,1,4,NULL,'2024-12-10 11:39:17','2024-12-10 13:22:46',0,4),
(20,'aasdasd',' sad asd asd','2024-12-10 11:39:00','2024-12-25 11:39:00',1,2,NULL,'2024-12-10 11:39:36','2024-12-10 11:39:36',0,2),
(21,'sadasd',' sdasd','2024-12-27 11:39:00',NULL,1,4,NULL,'2024-12-10 11:39:53','2024-12-10 11:39:53',0,4),
(22,'asda','asdasd','2024-12-10 11:45:00',NULL,1,2,NULL,'2024-12-10 11:45:53','2024-12-10 11:48:22',1,2),
(23,'qweqwe qwe ','qweeqw','2024-12-11 11:46:00',NULL,1,2,NULL,'2024-12-10 11:46:47','2024-12-10 11:46:47',0,2),
(24,'qweqwe qwe ','qweeqw','2024-12-13 11:46:00',NULL,1,2,NULL,'2024-12-10 11:47:14','2024-12-10 11:47:14',0,2),
(25,'asdasd',' asdasd ','2024-12-03 11:48:00',NULL,0,2,NULL,'2024-12-10 11:48:03','2024-12-10 11:48:03',0,2),
(26,'asdasd',' asdasd ','2024-12-02 23:00:00',NULL,1,2,NULL,'2024-12-10 11:48:10','2024-12-10 13:16:04',0,2),
(28,'Test modifica','TEsta di cazzo','2024-12-06 11:00:00','2024-12-07 08:17:00',1,4,NULL,'2024-12-10 13:19:12','2024-12-10 14:20:18',0,4),
(29,'ultimo','sssssss','2024-12-16 02:19:00','2024-12-21 02:19:00',0,3,NULL,'2024-12-10 14:20:03','2024-12-10 14:20:38',0,3),
(30,'dddd','dddd','2025-08-06 00:49:00','2025-08-09 00:49:00',1,3,NULL,'2025-08-06 12:50:06','2025-08-06 12:50:13',1,3),
(31,'asdasd','asdas dasd as d asd','2025-09-12 08:09:00','2025-09-13 08:09:00',0,3,NULL,'2025-09-12 08:09:59','2025-09-12 08:09:59',0,3),
(37,'Maturazione elemento  ILE25L12GMAP00','Maturazione elemento \n                                            <a href=\"/mushElement/singleMushElement?id=689&filterCategory=INOCULUM\" target=\"_blank\"> \n                                            ILE25L12GMAP00\n                                            </a>','2025-10-17 10:00:00','2025-10-17 10:00:00',1,NULL,689,'2025-10-12 16:09:07','2025-10-12 16:09:07',NULL,4),
(38,'Maturazione elemento  ILE25L12GMAP01','Maturazione elemento \n                                            <a href=\"/mushElement/singleMushElement?id=690&filterCategory=INOCULUM\" target=\"_blank\"> \n                                            ILE25L12GMAP01\n                                            </a>','2025-10-17 10:00:00','2025-10-17 10:00:00',1,NULL,690,'2025-10-12 16:09:07','2025-10-12 16:09:07',NULL,4),
(39,'Mat.  CPS25L12rrC100','Maturazione elemento COLTIVAZIONE\n                                            <a href=\"/mushElement/singleMushElement?id=691&filterCategory=CULTIVATION\" target=\"_blank\"> \n                                            CPS25L12rrC100\n                                            </a>','2025-10-23 10:00:00','2025-10-23 10:00:00',1,NULL,691,'2025-10-12 16:29:34','2025-10-12 16:29:34',NULL,4),
(40,'Frut.  CPS25L12rrC100','Fruttificazione elemento COLTIVAZIONE\n                                            <a href=\"/mushElement/singleMushElement?id=691&filterCategory=CULTIVATION\" target=\"_blank\"> \n                                            CPS25L12rrC100\n                                            </a>','2025-10-30 11:00:00','2025-10-30 11:00:00',1,NULL,691,'2025-10-12 16:29:34','2025-10-12 16:29:34',NULL,3);
/*!40000 ALTER TABLE `calendars` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `containerTypes`
--

DROP TABLE IF EXISTS `containerTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `containerTypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txt` varchar(255) DEFAULT NULL,
  `val` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `containerTypes`
--

LOCK TABLES `containerTypes` WRITE;
/*!40000 ALTER TABLE `containerTypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `containerTypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `containers`
--

DROP TABLE IF EXISTS `containers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `containers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_container` varchar(255) DEFAULT NULL,
  `container_name` varchar(255) DEFAULT NULL,
  `capacity` float DEFAULT NULL,
  `uom` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `reusable` int(1) DEFAULT NULL,
  `supplierId` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `used` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `supplierId` (`supplierId`),
  CONSTRAINT `containers_ibfk_1` FOREIGN KEY (`supplierId`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=622 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `containers`
--

LOCK TABLES `containers` WRITE;
/*!40000 ALTER TABLE `containers` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `containers` VALUES
(17,'CONT040125000','Sacchetti con filtro 3kg',3,'Kg','Plastica',0,7,'Sacco con filtro','ALL',14,'','2025-01-04 17:59:31','2025-08-07 18:14:39'),
(18,'CONT060125000','Sacchetti con filtro 1.5kg',1.5,'Kg','Plastica',0,7,'Sacco con filtro','ALL',11,'','2025-01-06 22:36:03','2025-02-26 14:07:19'),
(19,'CONT060125001','Sacchetti con filtro 2kg',2,'Kg','Plastica',0,7,'Sacco con filtro','ALL',24,'','2025-01-06 22:36:50','2025-08-19 18:00:03'),
(20,'CONT060125002','Sacchetti con filtro 2,5kg',2.5,'Kg','Plastica',0,7,'Sacco con filtro','ALL',-1,'','2025-01-06 22:37:36','2025-02-28 14:24:56'),
(21,'TEST','TEST',22,'Gr','Plastica',1,1,'Secchio','ALL',0,'','2025-01-09 12:04:21','2025-01-09 12:04:21'),
(22,'pippo1','pippo1',20,'Kg','polietilene',1,7,'Sacco con filtro','SPAWN',0,'test','2025-08-10 09:54:27','2025-08-10 09:54:36'),
(23,'PP001','Piastra petri 9cm',50,'ml','Vetro',1,7,'Piastra petri','INOCULUM',0,'','2025-08-13 20:53:19','2025-08-13 20:53:19'),
(621,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'COLTIVATION',NULL,0,NULL,'2025-09-01 08:35:07','2025-09-01 08:35:07');
/*!40000 ALTER TABLE `containers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `dDOptions`
--

DROP TABLE IF EXISTS `dDOptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dDOptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txt` varchar(255) DEFAULT NULL,
  `val` tinyint(3) DEFAULT NULL,
  `ddMenu` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dDOptions`
--

LOCK TABLES `dDOptions` WRITE;
/*!40000 ALTER TABLE `dDOptions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `dDOptions` VALUES
(1,'Da fruttificare',5,'pickReason','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(2,'Eliminato',1,'pickReason','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(3,'Regalato',2,'pickReason','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(4,'Stato marcescente',3,'pickReason','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(5,'Contaminato tricoderma',4,'pickReason','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(6,'Buon micelio',1,'statoProp','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(7,'Sviluppo primordi',2,'statoProp','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(8,'Ambiente troppo freddo',3,'statoProp','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(9,'Ambiente troppo caldo',4,'statoProp','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(10,'Contaminato',5,'statoProp','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(11,'In osservazione',6,'statoProp','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(12,'Propagazione',1,'stageMushElement','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(13,'Fruttificazione',2,'stageMushElement','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(14,'Inoculato',6,'pickReason','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(15,'Utilizzato',7,'pickReason','2024-12-31 11:49:43','2024-12-31 11:49:43');
/*!40000 ALTER TABLE `dDOptions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_device` varchar(255) DEFAULT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `posizione` varchar(255) DEFAULT NULL,
  `storageId` int(11) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `cronString` varchar(45) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `temp` tinyint(1) DEFAULT 0,
  `hum` tinyint(1) DEFAULT 0,
  `co2` tinyint(1) DEFAULT 0,
  `light` tinyint(1) DEFAULT 0,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `devices` VALUES
(1,'sens01','Sensore umidità e temperatura Grow01','Soffitto grow01',1,'192.168.1.13','http://192.168.1.13/getData',NULL,'*/10 * * * *',NULL,1,1,0,0,'2025-09-01 09:36:03','2025-09-01 09:36:03'),
(3,'sens02','Sensore umidita','Casa',2,'172.20.10.10','http://172.20.10.10/getData',NULL,'*/5 * * * *',NULL,1,1,0,0,'2025-09-01 09:36:03','2025-09-01 09:36:03');
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `diaryNotes`
--

DROP TABLE IF EXISTS `diaryNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `diaryNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota` text NOT NULL,
  `area` varchar(45) DEFAULT NULL,
  `tag` varchar(45) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diaryNotes`
--

LOCK TABLES `diaryNotes` WRITE;
/*!40000 ALTER TABLE `diaryNotes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `diaryNotes` VALUES
(1,'ssss',NULL,'ssss','2025-09-09 19:14:48','2025-09-09 19:14:48'),
(2,'ssss',NULL,'ssss','2025-09-09 19:14:52','2025-09-09 19:14:52'),
(3,'ssss',NULL,'ssss','2025-09-09 19:14:52','2025-09-09 19:14:52'),
(4,'ssss',NULL,'ssss','2025-09-09 19:14:53','2025-09-09 19:14:53'),
(5,'ssss',NULL,'ssss','2025-09-09 19:14:53','2025-09-09 19:14:53'),
(6,'ssss',NULL,'ssss','2025-09-09 19:14:53','2025-09-09 19:14:53'),
(7,'ssss',NULL,'ssss','2025-09-09 19:14:53','2025-09-09 19:14:53'),
(8,'ssss',NULL,'ssss','2025-09-09 19:14:53','2025-09-09 19:14:53'),
(9,'ssss',NULL,'ssss','2025-09-09 19:14:53','2025-09-09 19:14:53'),
(10,'ssss',NULL,'ssss','2025-09-09 19:14:54','2025-09-09 19:14:54'),
(11,'ssss',NULL,'ssss','2025-09-09 19:14:54','2025-09-09 19:14:54'),
(12,'asdasd',NULL,'','2025-09-10 09:12:52','2025-09-10 09:12:52'),
(13,'Creato lotto di coltivazione SPO25I10eeACXX con n° 2 eleemnti di spawn','','','2025-09-10 09:34:18','2025-09-10 09:34:18'),
(14,'Creato lotto di coltivazione SPB25I11PRACXX con n° 2 elemnti di spawn','','','2025-09-11 16:58:04','2025-09-11 16:58:04'),
(15,'Creato lotto di coltivazione SPO25I11eeACXX con n° 3 elemnti di spawn','','','2025-09-11 18:14:41','2025-09-11 18:14:41'),
(16,'Creato lotto di coltivazione SPO25I15eeASXX con n° 2 elemnti di spawn','','','2025-09-15 03:53:37','2025-09-15 03:53:37'),
(17,'Creato lotto di coltivazione SPO25I15GSACXX con n° 2 elemnti di spawn','','','2025-09-15 04:07:26','2025-09-15 04:07:26'),
(18,'Creato lotto di coltivazione CPS25I17rrC1XX con n° 3 elementi di coltivazione','','','2025-09-17 11:26:48','2025-09-17 11:26:48'),
(22,'Elemento CSH25H21GSC106 messo in fruttificazione','','','2025-09-21 09:22:54','2025-09-21 09:22:54'),
(23,'Creato lotto di inoculo IPS25I27rrAPXX con n° 4 elementi di inoculo','','','2025-09-27 13:24:07','2025-09-27 13:24:07'),
(24,'Creato lotto di coltivazione SPO25I27eeACXX con n° 5 elementi di spawn','','','2025-09-27 13:27:10','2025-09-27 13:27:10'),
(25,'Creato lotto di coltivazione CPO25I27eeC1XX con n° 4 elementi di coltivazione','','','2025-09-27 13:28:09','2025-09-27 13:28:09'),
(26,'Creato lotto di coltivazione SPO25I27FLACXX con n° 3 elementi di spawn','','','2025-09-27 18:28:25','2025-09-27 18:28:25'),
(27,'pulizia grow',NULL,'GRow','2025-09-27 18:36:27','2025-09-27 18:36:27'),
(28,'pulizia grow',NULL,'GRow','2025-09-27 18:36:28','2025-09-27 18:36:28'),
(29,'Creato lotto di inoculo IPO25L12GSAPXX con n° 2 elementi di inoculo','','','2025-10-12 15:28:36','2025-10-12 15:28:36'),
(30,'Creato lotto di coltivazione SPO25L12GSACXX con n° 2 elementi di spawn','','','2025-10-12 15:47:58','2025-10-12 15:47:58'),
(31,'Creato lotto di inoculo ILE25L12GMAPXX con n° 2 elementi di inoculo','','','2025-10-12 16:09:07','2025-10-12 16:09:07'),
(32,'Creato lotto di coltivazione CPS25L12rrC1XX con n° 1 elementi di coltivazione','','','2025-10-12 16:29:34','2025-10-12 16:29:34');
/*!40000 ALTER TABLE `diaryNotes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `fructificationElements`
--

DROP TABLE IF EXISTS `fructificationElements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fructificationElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fructificationId` int(11) DEFAULT NULL,
  `propagationId` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fructificationId` (`fructificationId`),
  CONSTRAINT `fructificationelements_ibfk_1` FOREIGN KEY (`fructificationId`) REFERENCES `fructifications` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fructificationElements`
--

LOCK TABLES `fructificationElements` WRITE;
/*!40000 ALTER TABLE `fructificationElements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fructificationElements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `fructificationFlushes`
--

DROP TABLE IF EXISTS `fructificationFlushes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fructificationFlushes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fructificationId` int(11) DEFAULT NULL,
  `propagationId` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fructificationId` (`fructificationId`),
  CONSTRAINT `fructificationflushes_ibfk_1` FOREIGN KEY (`fructificationId`) REFERENCES `fructifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fructificationFlushes`
--

LOCK TABLES `fructificationFlushes` WRITE;
/*!40000 ALTER TABLE `fructificationFlushes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fructificationFlushes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `fructifications`
--

DROP TABLE IF EXISTS `fructifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fructifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_fructification` varchar(255) DEFAULT NULL,
  `propagationId` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `propagationId` (`propagationId`),
  CONSTRAINT `fructifications_ibfk_1` FOREIGN KEY (`propagationId`) REFERENCES `propagations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fructifications`
--

LOCK TABLES `fructifications` WRITE;
/*!40000 ALTER TABLE `fructifications` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fructifications` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `harvests`
--

DROP TABLE IF EXISTS `harvests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `harvests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mushElementId` int(11) DEFAULT NULL,
  `harvest_date` datetime DEFAULT NULL,
  `harvest_weight` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvests`
--

LOCK TABLES `harvests` WRITE;
/*!40000 ALTER TABLE `harvests` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `harvests` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `inoculums`
--

DROP TABLE IF EXISTS `inoculums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `inoculums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_inoculum` varchar(45) NOT NULL,
  `inoculum_name` varchar(45) NOT NULL,
  `strainId` int(11) NOT NULL,
  `containerId` int(11) NOT NULL,
  `n_container` int(11) DEFAULT NULL,
  `cultivation_media` varchar(65) DEFAULT NULL,
  `exp_date` datetime DEFAULT NULL,
  `expected_maturation_date` datetime DEFAULT NULL,
  `storageId` int(11) DEFAULT NULL,
  `purchased` tinyint(1) DEFAULT NULL,
  `substrateId` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inoculums`
--

LOCK TABLES `inoculums` WRITE;
/*!40000 ALTER TABLE `inoculums` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `inoculums` VALUES
(21,'IPO25H31eeAPXX','PO testXX',1,23,3,NULL,'2025-09-06 10:00:00',NULL,4,0,44,NULL,'2025-08-31 10:53:11','2025-08-31 17:31:05'),
(22,'IPB25I11PRAPXX','test licoposto',5,23,4,NULL,'2025-09-25 10:00:00',NULL,1,0,44,NULL,'2025-09-11 16:57:05','2025-09-11 16:57:05'),
(23,'IPO25I11eeAPXX','pippo',1,23,2,NULL,'2025-09-24 10:00:00',NULL,2,0,44,NULL,'2025-09-11 18:16:28','2025-09-11 18:16:28'),
(24,'IPS25I27rrAPXX','TEst micocosmo',2,23,4,NULL,'2025-09-27 10:00:00',NULL,1,0,44,NULL,'2025-09-27 13:24:07','2025-09-27 13:24:07'),
(26,'ILE25L12GMAPXX','Shiitake ottobre 25',15,23,2,NULL,'2025-10-15 10:00:00','2025-10-17 10:00:00',2,0,44,NULL,'2025-10-12 16:09:07','2025-10-12 16:09:07');
/*!40000 ALTER TABLE `inoculums` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `materialCategories`
--

DROP TABLE IF EXISTS `materialCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `materialCategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `hum_factor` float DEFAULT NULL,
  `dry_factor` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialCategories`
--

LOCK TABLES `materialCategories` WRITE;
/*!40000 ALTER TABLE `materialCategories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `materialCategories` VALUES
(14,'Cat4',2,1,'Test note','#66bbee','2024-12-10 19:54:42','2024-12-10 19:54:42'),
(15,'Paglia',2,1,'','#66bbee','2024-12-11 12:54:46','2024-12-11 12:54:46'),
(30,'Cippato',3,NULL,'9de0af','9de0af','2024-12-19 00:17:21','2024-12-19 00:17:21'),
(31,'Segatura',3,NULL,'','9de0af','2024-12-23 22:05:57','2024-12-23 22:05:57'),
(32,'Additivi',1,NULL,'Additivi per substrato','9de0af','2024-12-26 18:38:31','2024-12-26 18:38:31'),
(33,'Grani',1,NULL,'9de0af','9de0af','2025-08-13 17:22:57','2025-08-13 17:22:57'),
(34,'Agar',1,NULL,'9de0af','9de0af','2025-08-15 09:14:54','2025-08-15 09:14:54');
/*!40000 ALTER TABLE `materialCategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `movimentations`
--

DROP TABLE IF EXISTS `movimentations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relatedId` int(11) NOT NULL,
  `from` tinyint(2) NOT NULL DEFAULT 0,
  `to` tinyint(2) NOT NULL DEFAULT 0,
  `type` varchar(45) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentations`
--

LOCK TABLES `movimentations` WRITE;
/*!40000 ALTER TABLE `movimentations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `movimentations` VALUES
(123,609,4,1,'SPAWN','2025-08-27 20:20:20','2025-08-27 20:20:20'),
(124,609,1,4,'SPAWN','2025-08-27 20:22:45','2025-08-27 20:20:45'),
(125,609,4,3,'SPAWN','2025-08-27 20:24:31','2025-08-27 20:21:31'),
(126,610,4,3,'SPAWN','2025-08-27 20:51:30','2025-08-27 20:21:31'),
(127,613,3,1,'COLTIVATION','2025-08-27 20:23:00','2025-08-27 20:23:00'),
(128,614,3,1,'COLTIVATION','2025-08-27 20:23:00','2025-08-27 20:23:00'),
(129,615,3,1,'COLTIVATION','2025-08-27 20:23:00','2025-08-27 20:23:00'),
(130,616,3,1,'COLTIVATION','2025-08-27 20:23:00','2025-08-27 20:23:00'),
(131,618,3,1,'COLTIVATION','2025-08-27 20:23:00','2025-08-27 20:23:00'),
(132,619,3,1,'COLTIVATION','2025-08-27 20:23:00','2025-08-27 20:23:00'),
(133,620,3,1,'COLTIVATION','2025-08-27 20:23:00','2025-08-27 20:23:00'),
(134,621,3,1,'COLTIVATION','2025-08-27 20:23:00','2025-08-27 20:23:00'),
(135,642,3,4,'INOCULUM','2025-08-31 17:24:53','2025-08-31 17:24:53'),
(136,642,4,1,'INOCULUM','2025-08-31 17:25:29','2025-08-31 17:25:29'),
(137,642,1,2,'INOCULUM','2025-08-31 17:28:17','2025-08-31 17:28:17'),
(138,642,3,4,'INOCULUM','2025-08-31 17:31:05','2025-08-31 17:31:05'),
(139,643,3,4,'INOCULUM','2025-08-31 17:31:05','2025-08-31 17:31:05'),
(140,644,3,4,'INOCULUM','2025-08-31 17:31:05','2025-08-31 17:31:05'),
(141,642,4,2,'INOCULUM','2025-08-31 17:44:04','2025-08-31 17:44:04');
/*!40000 ALTER TABLE `movimentations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mushElementHarvests`
--

DROP TABLE IF EXISTS `mushElementHarvests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mushElementHarvests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mushElementId` int(11) DEFAULT NULL,
  `harvest_date` datetime NOT NULL,
  `harvest_weight` int(11) NOT NULL,
  `note` text NOT NULL,
  `type` varchar(15) NOT NULL,
  `createdAt` varchar(45) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=634 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mushElementHarvests`
--

LOCK TABLES `mushElementHarvests` WRITE;
/*!40000 ALTER TABLE `mushElementHarvests` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `mushElementHarvests` VALUES
(614,NULL,'2025-01-08 23:00:00',1000,'Belli','COLTIVATION','2025-09-01 09:36:03.798','2025-09-01 09:36:03'),
(615,614,'2025-01-08 23:00:00',1000,'pippo','COLTIVATION','2025-09-01 09:39:17.726','2025-09-01 09:39:17'),
(616,657,'2025-09-19 22:00:00',100,'ssss','SPAWN','2025-09-20 09:54:23.094','2025-09-20 09:54:23'),
(617,657,'2025-09-19 22:00:00',100,'ssss','SPAWN','2025-09-20 09:57:13.486','2025-09-20 09:57:13'),
(618,657,'2025-09-19 22:00:00',100,'ssss','SPAWN','2025-09-20 09:57:51.662','2025-09-20 09:57:51'),
(619,657,'2025-09-19 22:00:00',100,'ssss','SPAWN','2025-09-20 09:57:55.528','2025-09-20 09:57:55'),
(620,657,'2025-09-19 22:00:00',100,'sss','SPAWN','2025-09-20 10:09:21.758','2025-09-20 10:09:21'),
(621,657,'2025-09-19 22:00:00',200,'sss','SPAWN','2025-09-20 10:09:31.126','2025-09-20 10:09:31'),
(622,657,'2025-09-19 22:00:00',40,'sss','SPAWN','2025-09-20 10:10:47.711','2025-09-20 10:10:47'),
(623,657,'2025-09-19 22:00:00',400,'aaa','SPAWN','2025-09-20 10:11:24.933','2025-09-20 10:11:24'),
(624,657,'2025-09-19 22:00:00',400,'aaa','SPAWN','2025-09-20 10:11:32.407','2025-09-20 10:11:32'),
(625,657,'2025-09-19 22:00:00',800,'100','SPAWN','2025-09-20 10:23:33.904','2025-09-20 10:23:33'),
(626,657,'2025-09-19 22:00:00',4000,'das','SPAWN','2025-09-20 10:25:52.940','2025-09-20 10:25:52'),
(627,657,'2025-09-19 22:00:00',4000,'das','SPAWN','2025-09-20 10:27:30.723','2025-09-20 10:27:30'),
(628,657,'2025-09-19 22:00:00',4000,'das','SPAWN','2025-09-20 10:27:57.811','2025-09-20 10:27:57'),
(629,657,'2025-09-19 22:00:00',600,'asd','SPAWN','2025-09-20 10:31:10.717','2025-09-20 10:31:10'),
(630,657,'2025-09-19 22:00:00',300,'Gggg','SPAWN','2025-09-20 10:33:08.541','2025-09-20 10:33:08'),
(631,657,'2025-09-19 22:00:00',764,'asd','SPAWN','2025-09-20 10:33:59.334','2025-09-20 10:33:59'),
(632,627,'2025-09-19 22:00:00',100,'Pippo','CULTIVATION','2025-09-20 10:35:54.802','2025-09-20 10:35:54'),
(633,618,'2025-09-19 22:00:00',455,'asdas','CULTIVATION','2025-09-20 11:36:57.473','2025-09-20 11:36:57');
/*!40000 ALTER TABLE `mushElementHarvests` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mushElementHarvestss`
--

DROP TABLE IF EXISTS `mushElementHarvestss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mushElementHarvestss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mushElementId` int(11) DEFAULT NULL,
  `harvest_date` datetime DEFAULT NULL,
  `harvest_weight` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mushElementId` (`mushElementId`),
  CONSTRAINT `mushelementharvestss_ibfk_1` FOREIGN KEY (`mushElementId`) REFERENCES `mushElements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mushElementHarvestss`
--

LOCK TABLES `mushElementHarvestss` WRITE;
/*!40000 ALTER TABLE `mushElementHarvestss` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mushElementHarvestss` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mushElementNotes`
--

DROP TABLE IF EXISTS `mushElementNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mushElementNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mushElementId` int(11) DEFAULT NULL,
  `check_date` datetime DEFAULT NULL,
  `stato` varchar(255) DEFAULT NULL,
  `pict` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mushElementId` (`mushElementId`),
  CONSTRAINT `mushelementnotes_ibfk_1` FOREIGN KEY (`mushElementId`) REFERENCES `mushElements` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mushElementNotes`
--

LOCK TABLES `mushElementNotes` WRITE;
/*!40000 ALTER TABLE `mushElementNotes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `mushElementNotes` VALUES
(61,609,'2025-08-27 22:00:00','Cattivo','IMG_2404.jpeg','',' SPAWN','2025-08-28 09:51:07','2025-08-28 09:51:07'),
(62,609,'2025-08-27 22:00:00','Contaminato','IMG_2414.jpeg','',' SPAWN','2025-08-28 09:51:44','2025-08-28 09:51:44'),
(63,609,'2025-08-27 22:00:00','Cattivo','IMG_2423.jpg','wdwdasd',' SPAWN','2025-08-28 10:03:39','2025-08-28 10:03:39'),
(64,609,'2025-08-27 22:00:00','In osservazione',NULL,'asdasd',' SPAWN','2025-08-28 10:13:58','2025-08-28 10:13:58'),
(65,609,'2025-08-27 22:00:00','In osservazione',NULL,'asdasd',' SPAWN','2025-08-28 10:14:37','2025-08-28 10:14:37'),
(66,609,'2025-08-27 22:00:00','In osservazione',NULL,'asdasd','SPAWN','2025-08-28 10:15:22','2025-08-28 10:15:22'),
(67,609,'2025-08-27 22:00:00','In osservazione',NULL,'asdasd','SPAWN','2025-08-28 10:15:52','2025-08-28 10:15:52'),
(73,609,'2025-08-27 22:00:00','Contaminato','IMG_2404.jpeg','sssss','SPAWN','2025-08-28 12:40:39','2025-08-28 12:40:39'),
(74,613,'2025-08-27 22:00:00','Buono','IMG_2407.jpg','ssss','COLTIVATION','2025-08-28 12:48:26','2025-08-28 12:48:26'),
(75,642,'2025-08-30 22:00:00','Cattivo','IMG_2407.jpg','SSSSS','INOCULUM','2025-08-31 11:26:04','2025-08-31 11:26:04'),
(76,642,'2025-08-30 22:00:00','','IMG_2429.jpeg','sadasd','INOCULUM','2025-08-31 11:30:46','2025-08-31 11:30:46'),
(77,642,'2025-08-30 22:00:00','Contaminato',NULL,'','INOCULUM','2025-08-31 17:44:21','2025-08-31 17:44:21'),
(78,614,'2025-08-31 22:00:00','Cattivo','IMG_2422.jpg','jhfghgcgj hjkv khj kh ','COLTIVATION','2025-09-01 16:33:48','2025-09-01 16:33:48'),
(79,672,'2025-09-25 22:00:00','Buono',NULL,'test','INOCULUM','2025-09-27 13:24:28','2025-09-27 13:24:28');
/*!40000 ALTER TABLE `mushElementNotes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mushElements`
--

DROP TABLE IF EXISTS `mushElements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mushElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_code` varchar(45) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `relatedId` int(11) NOT NULL,
  `load_date` datetime DEFAULT NULL,
  `pick_date` datetime DEFAULT NULL,
  `pick_reason` varchar(255) DEFAULT NULL,
  `stato` varchar(255) DEFAULT NULL,
  `stage` tinyint(1) DEFAULT NULL,
  `qt` float DEFAULT NULL,
  `expected_fructification_date` datetime DEFAULT NULL,
  `real_fructification_date` datetime DEFAULT NULL,
  `expected_maturation_date` datetime DEFAULT NULL,
  `real_maturation_date` datetime DEFAULT NULL,
  `substrateId` varchar(45) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 1,
  `storageId` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=692 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mushElements`
--

LOCK TABLES `mushElements` WRITE;
/*!40000 ALTER TABLE `mushElements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `mushElements` VALUES
(609,'SSH25H21GSAC00','SPAWN',102,'2025-08-21 12:27:46','2025-09-11 10:00:00','1','Contaminato',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,3,'2025-08-21 12:27:46','2025-09-11 18:13:30'),
(610,'SSH25H21GSAC01','SPAWN',102,'2025-08-21 12:27:46','2025-08-21 12:49:05','7','Buono',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,1,3,'2025-08-21 12:27:46','2025-08-27 20:21:31'),
(611,'SPO25H21GSAC00','SPAWN',103,'2025-08-21 12:42:20','2025-08-21 12:46:39','7','Buono',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:42:20','2025-08-21 12:46:39'),
(612,'CPO25H21GSC100','CULTIVATION',108,'2025-08-21 12:46:39','2025-08-23 10:00:00','1','Buono',1,10,NULL,NULL,NULL,NULL,NULL,NULL,0,3,'2025-08-21 12:46:39','2025-08-26 21:23:38'),
(613,'CPO25H21GSC101','CULTIVATION',108,'2025-08-21 12:46:39','2025-08-31 10:00:00','7','Buono',1,10,NULL,NULL,NULL,NULL,NULL,NULL,0,1,'2025-08-21 12:46:39','2025-08-31 11:13:48'),
(614,'CPO25H21GSC102','CULTIVATION',108,'2025-08-21 12:46:39',NULL,NULL,'Cattivo',1,10,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-08-21 12:46:39','2025-09-01 16:33:48'),
(615,'CPO25H21GSC103','CULTIVATION',108,'2025-08-21 12:46:39',NULL,NULL,'Buono',1,10,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-08-21 12:46:39','2025-08-27 20:23:00'),
(616,'CPO25H21GSC104','CULTIVATION',108,'2025-08-21 12:46:39',NULL,NULL,'Buono',1,10,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-08-21 12:46:39','2025-08-27 20:23:00'),
(617,'CPO25H21GSC105','CULTIVATION',108,'2025-08-21 12:46:39','2025-08-27 10:00:00','1','Buono',1,10,NULL,NULL,NULL,NULL,NULL,NULL,0,3,'2025-08-21 12:46:39','2025-08-27 20:07:51'),
(618,'CPO25H21GSC106','CULTIVATION',108,'2025-08-21 12:46:39',NULL,NULL,'Buono',2,10,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-08-21 12:46:39','2025-09-21 07:45:13'),
(619,'CPO25H21GSC107','CULTIVATION',108,'2025-08-21 12:46:39',NULL,NULL,'Buono',1,10,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-08-21 12:46:39','2025-08-27 20:23:00'),
(620,'CPO25H21GSC108','CULTIVATION',108,'2025-08-21 12:46:39',NULL,NULL,'Buono',1,10,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-08-21 12:46:39','2025-08-27 20:23:00'),
(621,'CPO25H21GSC109','CULTIVATION',108,'2025-08-21 12:46:39',NULL,NULL,'Buono',1,10,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-08-21 12:46:39','2025-08-27 20:23:00'),
(622,'CSH25H21GSC100','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(623,'CSH25H21GSC101','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',2,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-09-21 07:54:02'),
(624,'CSH25H21GSC102','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',2,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-09-21 09:17:21'),
(625,'CSH25H21GSC103','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(626,'CSH25H21GSC104','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(627,'CSH25H21GSC105','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(628,'CSH25H21GSC106','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',2,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-09-21 09:22:54'),
(629,'CSH25H21GSC107','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(630,'CSH25H21GSC108','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(631,'CSH25H21GSC109','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(632,'CSH25H21GSC110','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(633,'CSH25H21GSC111','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(634,'CSH25H21GSC112','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(635,'CSH25H21GSC113','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(636,'CSH25H21GSC114','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(637,'CSH25H21GSC115','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(638,'CSH25H21GSC116','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(639,'CSH25H21GSC117','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(640,'CSH25H21GSC118','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(641,'CSH25H21GSC119','CULTIVATION',109,'2025-08-21 12:49:05',NULL,NULL,'Buono',1,20,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(642,'IPO25H31eeAP00','INOCULUM',21,'2025-08-31 10:53:11','2025-09-11 18:14:41','7','Contaminato',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-08-31 10:53:11','2025-09-11 18:14:41'),
(643,'IPO25H31eeAP01','INOCULUM',21,'2025-08-31 10:53:11','2025-09-11 18:14:41','7','Buono',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,1,4,'2025-08-31 10:53:11','2025-09-11 18:14:41'),
(644,'IPO25H31eeAP02','INOCULUM',21,'2025-08-31 10:53:11','2025-09-15 03:53:37','7','Buono',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,1,4,'2025-08-31 10:53:11','2025-09-15 03:53:37'),
(651,'IPB25I11PRAP00','INOCULUM',22,'2025-08-11 16:57:05','2025-09-11 16:58:04','7','Buono',NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,0,1,'2025-08-11 16:57:05','2025-09-11 16:58:04'),
(652,'IPB25I11PRAP01','INOCULUM',22,'2025-09-11 16:57:05','2025-09-11 16:58:04','7','Buono',NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-11 16:57:05','2025-09-11 16:58:04'),
(653,'IPB25I11PRAP02','INOCULUM',22,'2025-09-11 16:57:05','2025-09-11 16:58:04','7','Buono',NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-11 16:57:05','2025-09-11 16:58:04'),
(654,'IPB25I11PRAP03','INOCULUM',22,'2025-09-11 16:57:05',NULL,NULL,'Buono',NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-11 16:57:05','2025-09-11 16:57:05'),
(655,'SPB25I11PRAC00','SPAWN',107,'2025-09-11 16:58:04',NULL,NULL,'Buono',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-09-11 16:58:04','2025-09-11 16:58:04'),
(656,'SPB25I11PRAC01','SPAWN',107,'2025-09-11 16:58:04',NULL,NULL,'Buono',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,1,3,'2025-09-11 16:58:04','2025-09-11 16:58:04'),
(657,'SPO25I11eeAC00','SPAWN',108,'2025-09-11 18:14:41',NULL,NULL,'Buono',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-11 18:14:41','2025-09-11 18:14:41'),
(658,'SPO25I11eeAC01','SPAWN',108,'2025-09-11 18:14:41',NULL,NULL,'Buono',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-09-11 18:14:41','2025-09-11 18:14:41'),
(659,'SPO25I11eeAC02','SPAWN',108,'2025-09-11 18:14:41',NULL,NULL,'Buono',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,1,3,'2025-09-11 18:14:41','2025-09-11 18:14:41'),
(660,'IPO25I11eeAP00','INOCULUM',23,'2025-09-11 18:16:28','2025-09-15 04:07:26','7','Buono',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-09-11 18:16:28','2025-09-15 04:07:26'),
(661,'IPO25I11eeAP01','INOCULUM',23,'2025-09-11 18:16:28',NULL,NULL,'Buono',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2025-09-11 18:16:28','2025-09-11 18:16:28'),
(662,'SPO25I15eeAS00','SPAWN',109,'2025-09-15 03:53:37','2025-10-12 16:29:34','7','Buono',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-15 03:53:37','2025-10-12 16:29:34'),
(663,'SPO25I15eeAS01','SPAWN',109,'2025-09-15 03:53:37',NULL,NULL,'Buono',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-15 03:53:37','2025-09-15 03:53:37'),
(664,'SPO25I15GSAC00','SPAWN',110,'2025-09-15 04:07:26','2025-09-17 11:26:48','7','Buono',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-15 04:07:26','2025-09-17 11:26:48'),
(665,'SPO25I15GSAC01','SPAWN',110,'2025-09-15 04:07:26',NULL,NULL,'Buono',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-15 04:07:26','2025-09-15 04:07:26'),
(666,'CPS25I17rrC100','CULTIVATION',110,'2025-09-17 11:26:48',NULL,NULL,'Buono',1,3,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-17 11:26:48','2025-09-17 11:26:48'),
(667,'CPS25I17rrC101','CULTIVATION',110,'2025-09-17 11:26:48',NULL,NULL,'Buono',1,3,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-17 11:26:48','2025-09-17 11:26:48'),
(668,'CPS25I17rrC102','CULTIVATION',110,'2025-09-17 11:26:48',NULL,NULL,'Buono',1,3,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-17 11:26:48','2025-09-17 11:26:48'),
(669,'IPS25I27rrAP00','INOCULUM',24,'2025-09-27 13:24:07','2025-09-27 13:27:10','7','Buono',NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-27 13:24:07','2025-09-27 13:27:10'),
(670,'IPS25I27rrAP01','INOCULUM',24,'2025-09-27 13:24:07','2025-09-27 18:28:25','7','Buono',NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-27 13:24:07','2025-09-27 18:28:25'),
(671,'IPS25I27rrAP02','INOCULUM',24,'2025-09-27 13:24:07','2025-09-27 13:27:10','7','Buono',NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-27 13:24:07','2025-09-27 13:27:10'),
(672,'IPS25I27rrAP03','INOCULUM',24,'2025-09-27 13:24:07','2025-09-27 18:28:25','7','Buono',NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-27 13:24:07','2025-09-27 18:28:25'),
(673,'SPO25I27eeAC00','SPAWN',111,'2025-09-27 13:27:10','2025-09-27 13:28:09','7','Buono',NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-27 13:27:10','2025-09-27 13:28:09'),
(674,'SPO25I27eeAC01','SPAWN',111,'2025-09-27 13:27:10',NULL,NULL,'Buono',NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-27 13:27:10','2025-09-27 13:27:10'),
(675,'SPO25I27eeAC02','SPAWN',111,'2025-09-27 13:27:10','2025-09-27 13:28:09','7','Buono',NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-27 13:27:10','2025-09-27 13:28:09'),
(676,'SPO25I27eeAC03','SPAWN',111,'2025-09-27 13:27:10',NULL,NULL,'Buono',NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-27 13:27:10','2025-09-27 13:27:10'),
(677,'SPO25I27eeAC04','SPAWN',111,'2025-09-27 13:27:10',NULL,NULL,'Buono',NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-27 13:27:10','2025-09-27 13:27:10'),
(678,'CPO25I27eeC100','CULTIVATION',111,'2025-09-27 13:28:09',NULL,NULL,'Buono',1,4,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-27 13:28:09','2025-09-27 13:28:09'),
(679,'CPO25I27eeC101','CULTIVATION',111,'2025-09-27 13:28:09',NULL,NULL,'Buono',1,4,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-27 13:28:09','2025-09-27 13:28:09'),
(680,'CPO25I27eeC102','CULTIVATION',111,'2025-09-27 13:28:09',NULL,NULL,'Buono',1,4,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-27 13:28:09','2025-09-27 13:28:09'),
(681,'CPO25I27eeC103','CULTIVATION',111,'2025-09-27 13:28:09',NULL,NULL,'Buono',1,4,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-27 13:28:09','2025-09-27 13:28:09'),
(682,'SPO25I27FLAC00','SPAWN',112,'2025-09-27 18:28:25',NULL,NULL,'Buono',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-27 18:28:25','2025-09-27 18:28:25'),
(683,'SPO25I27FLAC01','SPAWN',112,'2025-09-27 18:28:25',NULL,NULL,'Buono',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-27 18:28:25','2025-09-27 18:28:25'),
(684,'SPO25I27FLAC02','SPAWN',112,'2025-09-27 18:28:25',NULL,NULL,'Buono',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2025-09-27 18:28:25','2025-09-27 18:28:25'),
(689,'ILE25L12GMAP00','INOCULUM',26,'2025-10-12 16:09:07',NULL,NULL,'Buono',NULL,2,NULL,NULL,'2025-10-17 10:00:00',NULL,NULL,NULL,1,2,'2025-10-12 16:09:07','2025-10-12 16:09:07'),
(690,'ILE25L12GMAP01','INOCULUM',26,'2025-10-12 16:09:07',NULL,NULL,'Buono',NULL,2,NULL,NULL,'2025-10-17 10:00:00',NULL,NULL,NULL,1,2,'2025-10-12 16:09:07','2025-10-12 16:09:07'),
(691,'CPS25L12rrC100','CULTIVATION',112,'2025-10-12 16:29:34',NULL,NULL,'Buono',1,1,'2025-10-30 11:00:00',NULL,'2025-10-23 10:00:00',NULL,NULL,NULL,1,2,'2025-10-12 16:29:34','2025-10-12 16:29:34');
/*!40000 ALTER TABLE `mushElements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `pretreatments`
--

DROP TABLE IF EXISTS `pretreatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pretreatments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pretreatment_name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `protocol` text DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pretreatments`
--

LOCK TABLES `pretreatments` WRITE;
/*!40000 ALTER TABLE `pretreatments` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `pretreatments` VALUES
(1,'test',NULL,NULL,'2024-12-25 09:46:37','2024-12-25 09:46:37');
/*!40000 ALTER TABLE `pretreatments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `propagationElements`
--

DROP TABLE IF EXISTS `propagationElements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `propagationElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `propagationId` int(11) DEFAULT NULL,
  `proElement_code` varchar(255) DEFAULT NULL,
  `stato` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `lastControl_date` datetime DEFAULT NULL,
  `pick_date` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `pick_reason` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `propagationId` (`propagationId`),
  CONSTRAINT `propagationelements_ibfk_1` FOREIGN KEY (`propagationId`) REFERENCES `propagations` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propagationElements`
--

LOCK TABLES `propagationElements` WRITE;
/*!40000 ALTER TABLE `propagationElements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `propagationElements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `propagations`
--

DROP TABLE IF EXISTS `propagations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `propagations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_propagation` varchar(255) DEFAULT NULL,
  `propagation_name` varchar(45) DEFAULT NULL,
  `strainId` int(11) DEFAULT NULL,
  `substrateId` int(11) DEFAULT NULL,
  `containerId` int(11) DEFAULT NULL,
  `n_container` int(11) DEFAULT NULL,
  `qt` int(11) DEFAULT NULL,
  `substrateQt` float DEFAULT NULL,
  `spawnQt` float DEFAULT NULL,
  `percInoculo` float DEFAULT NULL,
  `storageId` int(11) DEFAULT NULL,
  `purchased` tinyint(1) DEFAULT 0,
  `note` varchar(45) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `substrateId` (`substrateId`),
  KEY `propagations_ibfk_1` (`strainId`),
  CONSTRAINT `propagations_ibfk_2` FOREIGN KEY (`substrateId`) REFERENCES `substrates` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propagations`
--

LOCK TABLES `propagations` WRITE;
/*!40000 ALTER TABLE `propagations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `propagations` VALUES
(108,'CPO25H21GSC1XX','PO glucke splitze',8,43,17,10,NULL,NULL,NULL,NULL,1,0,NULL,'2025-08-21 12:46:39','2025-08-27 20:23:00'),
(109,'CSH25H21GSC1XX','Shiitake indoor settembre',7,43,17,20,NULL,NULL,NULL,NULL,2,0,NULL,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(110,'CPS25I17rrC1XX','TEst Log',2,43,18,3,NULL,NULL,NULL,NULL,1,0,NULL,'2025-09-17 11:26:48','2025-09-17 11:26:48'),
(111,'CPO25I27eeC1XX','Mic prop',1,43,17,4,NULL,NULL,NULL,NULL,1,0,NULL,'2025-09-27 13:28:09','2025-09-27 13:28:09'),
(112,'CPS25L12rrC1XX','Test',2,43,18,1,NULL,NULL,NULL,NULL,2,0,NULL,'2025-10-12 16:29:34','2025-10-12 16:29:34');
/*!40000 ALTER TABLE `propagations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `rawMaterials`
--

DROP TABLE IF EXISTS `rawMaterials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rawMaterials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_name` varchar(255) DEFAULT NULL,
  `materialCategoryId` int(11) DEFAULT NULL,
  `supplierId` int(11) DEFAULT NULL,
  `date_storage` datetime DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `uom` varchar(255) DEFAULT NULL,
  `hum_factor` float DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `used` int(11) DEFAULT NULL,
  `storageId` int(11) NOT NULL,
  `destination` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `material_name` (`material_name`),
  KEY `materialCategoryId` (`materialCategoryId`),
  CONSTRAINT `rawmaterials_ibfk_1` FOREIGN KEY (`materialCategoryId`) REFERENCES `materialCategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawMaterials`
--

LOCK TABLES `rawMaterials` WRITE;
/*!40000 ALTER TABLE `rawMaterials` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `rawMaterials` VALUES
(2,'Paglia otbre 21',15,2,NULL,200,'Kg',4,'','2024-12-11 12:52:03','2024-12-13 17:24:00',1,1,'COLTIVATION'),
(3,'Paglia ottobbre 24',15,2,NULL,200,'Kg',2,'','2024-12-11 12:55:43','2024-12-11 12:55:43',1,1,'COLTIVATION'),
(9,'Cippato di carpino',30,1,NULL,49,'',1,'Cippato del 17-19 dicembre 24','2024-12-23 22:05:19','2024-12-23 22:09:23',0,2,'COLTIVATION'),
(10,'Segatura di castagno',31,1,NULL,30,'Kg',2,'Segatura da motosega 01-2024','2024-12-23 22:07:10','2024-12-23 22:07:10',0,3,'COLTIVATION'),
(11,'Ballone di paglia',15,2,NULL,200,'',3,'Mietitura agosto 2024, parte esterna da scartare','2024-12-23 22:09:08','2025-02-26 09:12:32',0,4,'COLTIVATION'),
(12,'Calce agricola',32,1,NULL,25,'Kg',1,'','2024-12-26 18:39:09','2024-12-26 18:39:09',0,2,'ALL'),
(13,'Cippato carpino 29-12-24',30,1,NULL,100,'Kg',1.7,'','2025-01-04 17:34:17','2025-01-04 17:34:17',0,2,'ALL'),
(14,'Cippato carpino',14,1,NULL,60,'Kg',60,'','2025-08-07 18:11:45','2025-08-16 08:15:05',0,4,'ALL'),
(16,'Agar + malto',34,7,NULL,100,'kg',1,'','2025-08-16 07:48:19','2025-08-16 08:21:08',0,1,'ALL');
/*!40000 ALTER TABLE `rawMaterials` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `recipeElements`
--

DROP TABLE IF EXISTS `recipeElements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipeElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipeId` int(11) DEFAULT NULL,
  `materialCategoryId` int(11) DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `wet_weight` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `categoryName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipeId` (`recipeId`),
  CONSTRAINT `recipeelements_ibfk_1` FOREIGN KEY (`recipeId`) REFERENCES `recipes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeElements`
--

LOCK TABLES `recipeElements` WRITE;
/*!40000 ALTER TABLE `recipeElements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `recipeElements` VALUES
(17,2,15,13,NULL,1,'2024-12-12 09:56:13','2024-12-12 09:56:13',NULL),
(18,2,15,13,NULL,1,'2024-12-12 09:56:13','2024-12-12 09:56:13',NULL),
(20,NULL,15,13000,NULL,33333,'2024-12-12 10:00:16','2024-12-12 10:00:16',NULL),
(21,NULL,15,13000,NULL,33333,'2024-12-12 10:00:35','2024-12-12 10:00:35',NULL),
(33,1,29,10,NULL,0,'2024-12-17 18:06:21','2024-12-17 18:06:21','Segatura di castagno'),
(34,1,15,90,NULL,0,'2024-12-17 18:06:29','2024-12-17 18:06:29','Paglia'),
(54,34,32,2,NULL,0,'2024-12-26 18:42:15','2024-12-26 18:42:15','Additivi'),
(55,34,31,15,NULL,0,'2024-12-26 18:42:31','2024-12-26 18:42:31','Segatura'),
(57,34,15,83,NULL,0,'2024-12-26 18:42:57','2024-12-26 18:42:57','Paglia'),
(58,35,30,50,NULL,0,'2025-01-04 18:00:31','2025-01-04 18:00:31','Cippato'),
(59,35,15,50,NULL,0,'2025-01-04 18:00:38','2025-01-04 18:00:38','Paglia'),
(60,36,30,30,NULL,0,'2025-01-04 18:01:14','2025-01-04 18:01:14','Cippato'),
(61,36,15,70,NULL,0,'2025-01-04 18:01:22','2025-01-04 18:01:22','Paglia'),
(62,37,30,100,NULL,0,'2025-01-04 18:01:44','2025-01-04 18:01:44','Cippato'),
(63,38,15,70,NULL,0,'2025-01-18 09:57:12','2025-01-18 09:57:12','Paglia'),
(64,38,31,28,NULL,0,'2025-01-18 09:57:31','2025-01-18 09:57:31','Segatura'),
(65,38,32,2,NULL,0,'2025-01-18 09:57:35','2025-01-18 09:57:35','Additivi'),
(67,40,33,100,NULL,0,'2025-08-15 09:14:04','2025-08-15 09:14:04','Grani'),
(68,39,34,100,NULL,0,'2025-08-16 10:31:16','2025-08-16 10:31:16','Agar'),
(69,41,30,100,NULL,0,'2025-08-20 09:35:35','2025-08-20 09:35:35','Cippato'),
(70,42,31,100,NULL,0,'2025-08-21 12:24:13','2025-08-21 12:24:13','Segatura'),
(71,43,30,70,NULL,0,'2025-09-27 18:08:11','2025-09-27 18:08:11','Cippato'),
(72,43,32,2,NULL,0,'2025-09-27 18:08:22','2025-09-27 18:08:22','Additivi'),
(74,43,15,28,NULL,0,'2025-09-27 18:08:48','2025-09-27 18:08:48','Paglia');
/*!40000 ALTER TABLE `recipeElements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_recipe` varchar(255) DEFAULT NULL,
  `sub_code` varchar(2) DEFAULT NULL,
  `recipe_name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `used` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `recipes` VALUES
(1,'ric01a','R1','Ricetta1a','','COLTIVATION',1,'2024-12-12 09:05:25','2024-12-12 09:53:17'),
(2,'ric04','R4','Ricetta4','','COLTIVATION',1,'2024-12-12 09:55:30','2024-12-12 09:55:30'),
(34,'R24122600200','PS','Paglia + segatura','Ricetta per Pleorotus (Salmon, Ostreatus ecc), Stropharia rugosa annulata','COLTIVATION',0,'2024-12-26 18:42:10','2024-12-26 18:42:10'),
(35,'R25010403400','PC','Paglia + Cippato 50:50','','COLTIVATION',0,'2025-01-04 18:00:20','2025-01-04 18:00:20'),
(36,'R25010403500','PC','Paglia + Cippato 70:30','','COLTIVATION',0,'2025-01-04 18:01:03','2025-01-04 18:01:03'),
(37,'R25010403600','C1','Cippato 100%','','COLTIVATION',0,'2025-01-04 18:01:37','2025-01-04 18:01:37'),
(38,'R25011803700','PS','Paglia + segatura 70+30','','COLTIVATION',0,'2025-01-18 09:57:04','2025-01-18 09:57:04'),
(39,'R25081503800','AP','Agar p/petri','Media per piatra petri Agar agar','INOCULUM',0,'2025-08-15 09:11:49','2025-08-15 09:11:49'),
(40,'R25081503900','GS','Grain segale','Substrato grani segale per pleurotus','SPAWN',0,'2025-08-15 09:13:30','2025-08-15 09:13:30'),
(41,'R25082004000','AC','ACQ su cippato','','SPAWN',0,'2025-08-20 09:35:27','2025-08-20 09:35:27'),
(42,'R25082104100','AS','ACQ Segatura','','',0,'2025-08-21 12:24:03','2025-08-21 12:24:03'),
(43,'R25092704200','tr','wdacfdfa','erfwerwe','SPAWN',0,'2025-09-27 18:07:59','2025-09-27 18:07:59');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `seeds`
--

DROP TABLE IF EXISTS `seeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `seeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relatedId` int(11) DEFAULT NULL,
  `inoculumId` int(11) DEFAULT NULL,
  `spawnId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seeds`
--

LOCK TABLES `seeds` WRITE;
/*!40000 ALTER TABLE `seeds` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `seeds` VALUES
(45,108,NULL,611,'2025-08-21 12:46:39','2025-08-21 12:46:39'),
(46,109,NULL,609,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(47,109,NULL,610,'2025-08-21 12:49:05','2025-08-21 12:49:05'),
(48,107,651,NULL,'2025-09-11 16:58:04','2025-09-11 16:58:04'),
(49,107,652,NULL,'2025-09-11 16:58:04','2025-09-11 16:58:04'),
(50,107,653,NULL,'2025-09-11 16:58:04','2025-09-11 16:58:04'),
(51,108,642,NULL,'2025-09-11 18:14:41','2025-09-11 18:14:41'),
(52,108,643,NULL,'2025-09-11 18:14:41','2025-09-11 18:14:41'),
(53,109,644,NULL,'2025-09-15 03:53:37','2025-09-15 03:53:37'),
(54,110,660,NULL,'2025-09-15 04:07:26','2025-09-15 04:07:26'),
(55,110,NULL,664,'2025-09-17 11:26:48','2025-09-17 11:26:48'),
(56,111,669,NULL,'2025-09-27 13:27:10','2025-09-27 13:27:10'),
(57,111,671,NULL,'2025-09-27 13:27:10','2025-09-27 13:27:10'),
(58,111,NULL,673,'2025-09-27 13:28:09','2025-09-27 13:28:09'),
(59,111,NULL,675,'2025-09-27 13:28:09','2025-09-27 13:28:09'),
(60,112,670,NULL,'2025-09-27 18:28:25','2025-09-27 18:28:25'),
(61,112,672,NULL,'2025-09-27 18:28:25','2025-09-27 18:28:25'),
(62,112,NULL,662,'2025-10-12 16:29:34','2025-10-12 16:29:34');
/*!40000 ALTER TABLE `seeds` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `sensorData`
--

DROP TABLE IF EXISTS `sensorData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensorData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_device` varchar(45) DEFAULT NULL,
  `temp` float DEFAULT NULL,
  `hum` float DEFAULT NULL,
  `Co2` float DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `flag01` tinyint(1) DEFAULT NULL,
  `flag02` tinyint(1) DEFAULT NULL,
  `deviceId` int(11) DEFAULT NULL,
  `storageId` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3846 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensorData`
--

LOCK TABLES `sensorData` WRITE;
/*!40000 ALTER TABLE `sensorData` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sensorData` VALUES
(1,'/',15.2,77.5,12000,NULL,NULL,NULL,NULL,NULL,'2024-12-03 13:29:17','2024-12-03 13:29:17'),
(2,'s',15.2,77.5,12000,NULL,NULL,NULL,NULL,NULL,'2024-12-03 13:29:54','2024-12-03 13:29:54'),
(3,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 13:30:39','2024-12-03 13:30:39'),
(4,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 13:41:40','2024-12-03 13:41:40'),
(5,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 13:49:18','2024-12-03 13:49:18'),
(6,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 13:52:12','2024-12-03 13:52:12'),
(7,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 13:52:42','2024-12-03 13:52:42'),
(8,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 13:53:01','2024-12-03 13:53:01'),
(9,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 13:53:38','2024-12-03 13:53:38'),
(10,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 13:54:29','2024-12-03 13:54:29'),
(11,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 13:55:37','2024-12-03 13:55:37'),
(12,'sens01',18,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 13:55:40','2024-12-03 13:55:40'),
(13,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 13:56:42','2024-12-03 13:56:42'),
(14,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 13:58:03','2024-12-03 13:58:03'),
(15,'sens01',30,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 13:59:25','2024-12-03 13:59:25'),
(16,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 14:12:00','2024-12-03 14:12:00'),
(17,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 14:30:01','2024-12-03 14:30:01'),
(18,'sens01',10,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 16:03:50','2024-12-03 16:03:50'),
(19,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 17:27:43','2024-12-03 17:27:43'),
(20,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 17:28:19','2024-12-03 17:28:19'),
(21,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 19:32:25','2024-12-03 19:32:25'),
(22,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 19:34:08','2024-12-03 19:34:08'),
(23,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 23:28:20','2024-12-03 23:28:20'),
(24,'sens01',15.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 23:28:39','2024-12-03 23:28:39'),
(25,'sens01',16.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 23:28:42','2024-12-03 23:28:42'),
(26,'sens01',18.2,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 23:28:47','2024-12-03 23:28:47'),
(27,'sens01',30,77.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 23:28:55','2024-12-03 23:28:55'),
(28,'sens01',30,33.5,12000,NULL,NULL,NULL,1,1,'2024-12-03 23:28:59','2024-12-03 23:28:59'),
(29,'sens01',15,55.5,12,NULL,NULL,NULL,1,1,'2024-12-03 23:29:08','2024-12-03 23:29:08'),
(30,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-03 23:54:01','2024-12-03 23:54:01'),
(31,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-04 00:04:05','2024-12-04 00:04:05'),
(32,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-05 22:56:09','2024-12-05 22:56:09'),
(33,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-05 22:56:30','2024-12-05 22:56:30'),
(34,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-06 18:51:15','2024-12-06 18:51:15'),
(35,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-06 18:51:16','2024-12-06 18:51:16'),
(36,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-22 18:37:05','2024-12-22 18:37:05'),
(37,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-22 18:37:06','2024-12-22 18:37:06'),
(38,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-22 18:37:08','2024-12-22 18:37:08'),
(39,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-22 18:51:11','2024-12-22 18:51:11'),
(40,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-22 18:51:11','2024-12-22 18:51:11'),
(41,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-22 18:51:17','2024-12-22 18:51:17'),
(42,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-22 18:51:18','2024-12-22 18:51:18'),
(43,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-22 18:51:18','2024-12-22 18:51:18'),
(44,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-22 18:51:23','2024-12-22 18:51:23'),
(45,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-22 19:07:28','2024-12-22 19:07:28'),
(46,'sens01',15,5.5,12,NULL,NULL,NULL,1,1,'2024-12-22 19:07:28','2024-12-22 19:07:28'),
(47,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:20:59','2024-12-22 21:20:59'),
(48,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:00','2024-12-22 21:21:00'),
(49,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:02','2024-12-22 21:21:02'),
(50,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:04','2024-12-22 21:21:04'),
(51,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:06','2024-12-22 21:21:06'),
(52,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:08','2024-12-22 21:21:08'),
(53,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:10','2024-12-22 21:21:10'),
(54,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:12','2024-12-22 21:21:12'),
(55,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:15','2024-12-22 21:21:15'),
(56,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:17','2024-12-22 21:21:17'),
(57,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:19','2024-12-22 21:21:19'),
(58,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:21','2024-12-22 21:21:21'),
(59,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:23','2024-12-22 21:21:23'),
(60,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:25','2024-12-22 21:21:25'),
(61,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:27','2024-12-22 21:21:27'),
(62,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:29','2024-12-22 21:21:29'),
(63,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:31','2024-12-22 21:21:31'),
(64,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:33','2024-12-22 21:21:33'),
(65,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:36','2024-12-22 21:21:36'),
(66,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:38','2024-12-22 21:21:38'),
(67,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-22 21:21:40','2024-12-22 21:21:40'),
(68,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-23 22:12:34','2024-12-23 22:12:34'),
(69,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-23 22:14:29','2024-12-23 22:14:29'),
(70,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-23 22:16:25','2024-12-23 22:16:25'),
(71,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-23 22:24:40','2024-12-23 22:24:40'),
(72,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-23 22:26:14','2024-12-23 22:26:14'),
(73,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 12:54:16','2024-12-24 12:54:16'),
(74,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 13:07:13','2024-12-24 13:07:13'),
(75,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 13:08:01','2024-12-24 13:08:01'),
(76,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 13:08:16','2024-12-24 13:08:16'),
(77,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 13:08:23','2024-12-24 13:08:23'),
(78,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 13:10:55','2024-12-24 13:10:55'),
(79,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 13:10:59','2024-12-24 13:10:59'),
(80,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 13:11:30','2024-12-24 13:11:30'),
(81,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 13:13:25','2024-12-24 13:13:25'),
(82,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 13:14:01','2024-12-24 13:14:01'),
(83,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 13:18:10','2024-12-24 13:18:10'),
(84,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 13:18:37','2024-12-24 13:18:37'),
(85,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 13:19:08','2024-12-24 13:19:08'),
(86,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 13:19:22','2024-12-24 13:19:22'),
(87,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 13:19:54','2024-12-24 13:19:54'),
(88,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 16:09:05','2024-12-24 16:09:05'),
(89,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 16:10:57','2024-12-24 16:10:57'),
(90,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-24 16:11:18','2024-12-24 16:11:18'),
(91,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-25 22:21:37','2024-12-25 22:21:37'),
(92,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-25 22:23:18','2024-12-25 22:23:18'),
(93,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-25 22:26:59','2024-12-25 22:26:59'),
(94,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-25 22:29:42','2024-12-25 22:29:42'),
(95,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-25 22:29:53','2024-12-25 22:29:53'),
(96,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-25 22:34:22','2024-12-25 22:34:22'),
(97,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-25 22:34:31','2024-12-25 22:34:31'),
(98,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 07:48:19','2024-12-26 07:48:19'),
(99,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 07:49:21','2024-12-26 07:49:21'),
(100,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 08:05:51','2024-12-26 08:05:51'),
(101,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 08:06:29','2024-12-26 08:06:29'),
(102,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 08:06:58','2024-12-26 08:06:58'),
(103,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 08:07:24','2024-12-26 08:07:24'),
(104,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 08:09:41','2024-12-26 08:09:41'),
(105,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 08:34:32','2024-12-26 08:34:32'),
(106,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 08:35:50','2024-12-26 08:35:50'),
(107,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 08:36:13','2024-12-26 08:36:13'),
(108,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 08:45:17','2024-12-26 08:45:17'),
(109,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 08:47:10','2024-12-26 08:47:10'),
(110,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 13:50:50','2024-12-26 13:50:50'),
(111,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 14:02:24','2024-12-26 14:02:24'),
(112,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 14:02:46','2024-12-26 14:02:46'),
(113,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 14:03:01','2024-12-26 14:03:01'),
(114,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 14:03:37','2024-12-26 14:03:37'),
(115,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 14:49:45','2024-12-26 14:49:45'),
(116,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 15:08:53','2024-12-26 15:08:53'),
(117,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 15:17:44','2024-12-26 15:17:44'),
(118,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 18:22:11','2024-12-26 18:22:11'),
(119,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 18:29:04','2024-12-26 18:29:04'),
(120,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 18:35:49','2024-12-26 18:35:49'),
(121,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 18:36:06','2024-12-26 18:36:06'),
(122,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 18:48:49','2024-12-26 18:48:49'),
(123,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 18:49:03','2024-12-26 18:49:03'),
(124,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 19:07:00','2024-12-26 19:07:00'),
(125,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 20:21:34','2024-12-26 20:21:34'),
(126,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 20:22:11','2024-12-26 20:22:11'),
(127,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 20:32:10','2024-12-26 20:32:10'),
(128,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 22:15:54','2024-12-26 22:15:54'),
(129,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 22:24:01','2024-12-26 22:24:01'),
(130,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 22:25:57','2024-12-26 22:25:57'),
(131,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 22:28:02','2024-12-26 22:28:02'),
(132,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 22:28:09','2024-12-26 22:28:09'),
(133,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 22:33:37','2024-12-26 22:33:37'),
(134,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 22:34:04','2024-12-26 22:34:04'),
(135,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 22:34:17','2024-12-26 22:34:17'),
(136,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 22:34:20','2024-12-26 22:34:20'),
(137,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 22:34:38','2024-12-26 22:34:38'),
(138,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-26 22:36:42','2024-12-26 22:36:42'),
(139,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 07:43:23','2024-12-27 07:43:23'),
(140,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 07:49:05','2024-12-27 07:49:05'),
(141,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 07:49:45','2024-12-27 07:49:45'),
(142,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 07:51:27','2024-12-27 07:51:27'),
(143,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 07:53:11','2024-12-27 07:53:11'),
(144,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 08:11:52','2024-12-27 08:11:52'),
(145,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 08:20:00','2024-12-27 08:20:00'),
(146,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 08:29:13','2024-12-27 08:29:13'),
(147,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 08:30:23','2024-12-27 08:30:23'),
(148,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 08:34:55','2024-12-27 08:34:55'),
(149,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 08:39:57','2024-12-27 08:39:57'),
(150,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 08:41:01','2024-12-27 08:41:01'),
(151,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 10:08:39','2024-12-27 10:08:39'),
(152,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:16:21','2024-12-27 18:16:21'),
(153,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:17:11','2024-12-27 18:17:11'),
(154,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:23:52','2024-12-27 18:23:52'),
(155,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:25:03','2024-12-27 18:25:03'),
(156,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:25:43','2024-12-27 18:25:43'),
(157,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:28:00','2024-12-27 18:28:00'),
(158,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:30:43','2024-12-27 18:30:43'),
(159,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:31:31','2024-12-27 18:31:31'),
(160,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:32:37','2024-12-27 18:32:37'),
(161,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:33:20','2024-12-27 18:33:20'),
(162,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:42:11','2024-12-27 18:42:11'),
(163,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:42:48','2024-12-27 18:42:48'),
(164,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:43:07','2024-12-27 18:43:07'),
(165,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:44:44','2024-12-27 18:44:44'),
(166,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:44:46','2024-12-27 18:44:46'),
(167,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:47:18','2024-12-27 18:47:18'),
(168,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:50:03','2024-12-27 18:50:03'),
(169,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:50:56','2024-12-27 18:50:56'),
(170,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:51:12','2024-12-27 18:51:12'),
(171,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 18:52:54','2024-12-27 18:52:54'),
(172,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 19:27:29','2024-12-27 19:27:29'),
(173,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 19:28:27','2024-12-27 19:28:27'),
(174,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 19:28:47','2024-12-27 19:28:47'),
(175,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 19:29:52','2024-12-27 19:29:52'),
(176,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 19:32:01','2024-12-27 19:32:01'),
(177,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 19:33:31','2024-12-27 19:33:31'),
(178,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 19:47:49','2024-12-27 19:47:49'),
(179,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 19:55:53','2024-12-27 19:55:53'),
(180,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 20:10:35','2024-12-27 20:10:35'),
(181,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 20:11:01','2024-12-27 20:11:01'),
(182,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 20:17:40','2024-12-27 20:17:40'),
(183,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 20:27:26','2024-12-27 20:27:26'),
(184,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 20:29:59','2024-12-27 20:29:59'),
(185,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 20:30:35','2024-12-27 20:30:35'),
(186,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 20:30:41','2024-12-27 20:30:41'),
(187,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 20:31:37','2024-12-27 20:31:37'),
(188,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 20:33:02','2024-12-27 20:33:02'),
(189,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-27 20:34:34','2024-12-27 20:34:34'),
(190,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 08:44:55','2024-12-29 08:44:55'),
(191,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 08:47:37','2024-12-29 08:47:37'),
(192,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 08:48:09','2024-12-29 08:48:09'),
(193,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 08:48:26','2024-12-29 08:48:26'),
(194,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 08:50:26','2024-12-29 08:50:26'),
(195,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 08:50:43','2024-12-29 08:50:43'),
(196,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 08:51:24','2024-12-29 08:51:24'),
(197,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 08:51:42','2024-12-29 08:51:42'),
(198,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 09:30:52','2024-12-29 09:30:52'),
(199,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 09:32:20','2024-12-29 09:32:20'),
(200,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 09:34:34','2024-12-29 09:34:34'),
(201,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 09:34:36','2024-12-29 09:34:36'),
(202,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 09:35:17','2024-12-29 09:35:17'),
(203,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 09:39:03','2024-12-29 09:39:03'),
(204,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 09:41:53','2024-12-29 09:41:53'),
(205,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 09:42:21','2024-12-29 09:42:21'),
(206,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 09:43:12','2024-12-29 09:43:12'),
(207,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 09:44:34','2024-12-29 09:44:34'),
(208,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 09:49:00','2024-12-29 09:49:00'),
(209,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 11:35:37','2024-12-29 11:35:37'),
(210,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 11:35:45','2024-12-29 11:35:45'),
(211,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 11:36:27','2024-12-29 11:36:27'),
(212,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 11:36:32','2024-12-29 11:36:32'),
(213,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 11:37:55','2024-12-29 11:37:55'),
(214,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 11:38:46','2024-12-29 11:38:46'),
(215,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 11:39:03','2024-12-29 11:39:03'),
(216,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 11:39:28','2024-12-29 11:39:28'),
(217,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 11:44:25','2024-12-29 11:44:25'),
(218,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 11:44:41','2024-12-29 11:44:41'),
(219,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 11:44:48','2024-12-29 11:44:48'),
(220,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 12:16:33','2024-12-29 12:16:33'),
(221,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 12:16:54','2024-12-29 12:16:54'),
(222,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 12:17:39','2024-12-29 12:17:39'),
(223,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 12:27:27','2024-12-29 12:27:27'),
(224,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 12:28:20','2024-12-29 12:28:20'),
(225,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 12:28:53','2024-12-29 12:28:53'),
(226,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 12:29:14','2024-12-29 12:29:14'),
(227,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 12:29:52','2024-12-29 12:29:52'),
(228,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 12:48:04','2024-12-29 12:48:04'),
(229,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 17:21:00','2024-12-29 17:21:00'),
(230,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 17:22:32','2024-12-29 17:22:32'),
(231,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-29 17:23:08','2024-12-29 17:23:08'),
(232,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-30 23:26:07','2024-12-30 23:26:07'),
(233,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-30 23:29:36','2024-12-30 23:29:36'),
(234,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-30 23:31:11','2024-12-30 23:31:11'),
(235,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-30 23:31:39','2024-12-30 23:31:39'),
(236,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-30 23:32:27','2024-12-30 23:32:27'),
(237,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-30 23:34:04','2024-12-30 23:34:04'),
(238,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-30 23:35:12','2024-12-30 23:35:12'),
(239,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-30 23:36:16','2024-12-30 23:36:16'),
(240,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-30 23:43:38','2024-12-30 23:43:38'),
(241,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-30 23:49:31','2024-12-30 23:49:31'),
(242,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-30 23:50:14','2024-12-30 23:50:14'),
(243,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 00:16:37','2024-12-31 00:16:37'),
(244,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 00:18:30','2024-12-31 00:18:30'),
(245,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 00:21:33','2024-12-31 00:21:33'),
(246,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 00:22:38','2024-12-31 00:22:38'),
(247,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 00:49:56','2024-12-31 00:49:56'),
(248,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 00:50:28','2024-12-31 00:50:28'),
(249,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:01:56','2024-12-31 01:01:56'),
(250,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:02:40','2024-12-31 01:02:40'),
(251,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:05:50','2024-12-31 01:05:50'),
(252,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:07:41','2024-12-31 01:07:41'),
(253,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:09:12','2024-12-31 01:09:12'),
(254,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:09:45','2024-12-31 01:09:45'),
(255,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:10:38','2024-12-31 01:10:38'),
(256,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:11:12','2024-12-31 01:11:12'),
(257,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:11:48','2024-12-31 01:11:48'),
(258,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:14:34','2024-12-31 01:14:34'),
(259,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:14:57','2024-12-31 01:14:57'),
(260,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:16:12','2024-12-31 01:16:12'),
(261,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:16:27','2024-12-31 01:16:27'),
(262,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:18:39','2024-12-31 01:18:39'),
(263,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:18:51','2024-12-31 01:18:51'),
(264,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:19:22','2024-12-31 01:19:22'),
(265,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:19:51','2024-12-31 01:19:51'),
(266,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:20:04','2024-12-31 01:20:04'),
(267,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:20:12','2024-12-31 01:20:12'),
(268,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:21:32','2024-12-31 01:21:32'),
(269,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:22:00','2024-12-31 01:22:00'),
(270,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:22:49','2024-12-31 01:22:49'),
(271,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:23:22','2024-12-31 01:23:22'),
(272,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:23:41','2024-12-31 01:23:41'),
(273,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:23:51','2024-12-31 01:23:51'),
(274,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:25:01','2024-12-31 01:25:01'),
(275,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:26:34','2024-12-31 01:26:34'),
(276,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:27:01','2024-12-31 01:27:01'),
(277,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:27:26','2024-12-31 01:27:26'),
(278,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:28:49','2024-12-31 01:28:49'),
(279,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:29:20','2024-12-31 01:29:20'),
(280,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:30:22','2024-12-31 01:30:22'),
(281,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 01:31:50','2024-12-31 01:31:50'),
(282,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 11:35:22','2024-12-31 11:35:22'),
(283,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 11:36:26','2024-12-31 11:36:26'),
(284,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 11:36:41','2024-12-31 11:36:41'),
(285,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 11:37:11','2024-12-31 11:37:11'),
(286,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 11:37:52','2024-12-31 11:37:52'),
(287,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 11:39:23','2024-12-31 11:39:23'),
(288,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 11:41:39','2024-12-31 11:41:39'),
(289,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2024-12-31 11:41:55','2024-12-31 11:41:55'),
(290,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-02 23:45:41','2025-01-02 23:45:41'),
(291,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-02 23:48:55','2025-01-02 23:48:55'),
(292,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-02 23:50:10','2025-01-02 23:50:10'),
(293,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-02 23:56:34','2025-01-02 23:56:34'),
(294,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-03 00:01:56','2025-01-03 00:01:56'),
(295,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-03 00:04:33','2025-01-03 00:04:33'),
(296,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-03 00:13:42','2025-01-03 00:13:42'),
(297,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-03 00:15:59','2025-01-03 00:15:59'),
(298,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-03 00:24:36','2025-01-03 00:24:36'),
(299,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-03 00:29:47','2025-01-03 00:29:47'),
(300,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-03 22:44:15','2025-01-03 22:44:15'),
(301,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-03 22:46:13','2025-01-03 22:46:13'),
(302,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-03 22:48:04','2025-01-03 22:48:04'),
(303,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-03 22:50:11','2025-01-03 22:50:11'),
(304,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-03 22:51:18','2025-01-03 22:51:18'),
(305,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-03 22:52:15','2025-01-03 22:52:15'),
(306,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-03 22:52:58','2025-01-03 22:52:58'),
(307,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-03 22:54:17','2025-01-03 22:54:17'),
(308,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-03 23:01:18','2025-01-03 23:01:18'),
(309,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-04 17:44:55','2025-01-04 17:44:55'),
(310,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-04 17:52:38','2025-01-04 17:52:38'),
(311,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-04 17:54:00','2025-01-04 17:54:00'),
(312,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-04 17:54:18','2025-01-04 17:54:18'),
(313,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-04 17:54:37','2025-01-04 17:54:37'),
(314,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-04 17:55:29','2025-01-04 17:55:29'),
(315,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-04 18:02:09','2025-01-04 18:02:09'),
(316,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-04 18:03:06','2025-01-04 18:03:06'),
(317,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-06 16:20:56','2025-01-06 16:20:56'),
(318,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-06 16:25:03','2025-01-06 16:25:03'),
(319,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-06 16:25:04','2025-01-06 16:25:04'),
(320,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-06 21:57:03','2025-01-06 21:57:03'),
(321,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-06 21:57:13','2025-01-06 21:57:13'),
(322,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-06 21:57:25','2025-01-06 21:57:25'),
(323,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-06 21:58:07','2025-01-06 21:58:07'),
(324,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-06 21:58:22','2025-01-06 21:58:22'),
(325,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-06 21:59:07','2025-01-06 21:59:07'),
(326,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-06 21:59:44','2025-01-06 21:59:44'),
(327,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-06 22:04:51','2025-01-06 22:04:51'),
(328,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-06 22:05:15','2025-01-06 22:05:15'),
(329,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-06 22:07:36','2025-01-06 22:07:36'),
(330,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-06 22:07:48','2025-01-06 22:07:48'),
(331,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-06 22:30:13','2025-01-06 22:30:13'),
(332,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-06 22:52:53','2025-01-06 22:52:53'),
(333,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-07 08:12:25','2025-01-07 08:12:25'),
(334,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 08:51:25','2025-01-09 08:51:25'),
(335,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 08:53:33','2025-01-09 08:53:33'),
(336,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 08:54:19','2025-01-09 08:54:19'),
(337,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 08:54:21','2025-01-09 08:54:21'),
(338,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 08:54:52','2025-01-09 08:54:52'),
(339,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:00:09','2025-01-09 09:00:09'),
(340,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:05:01','2025-01-09 09:05:01'),
(341,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:05:52','2025-01-09 09:05:52'),
(342,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:06:29','2025-01-09 09:06:29'),
(343,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:10:39','2025-01-09 09:10:39'),
(344,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:12:39','2025-01-09 09:12:39'),
(345,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:13:53','2025-01-09 09:13:53'),
(346,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:15:31','2025-01-09 09:15:31'),
(347,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:16:06','2025-01-09 09:16:06'),
(348,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:19:06','2025-01-09 09:19:06'),
(349,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:21:47','2025-01-09 09:21:47'),
(350,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:22:01','2025-01-09 09:22:01'),
(351,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:27:30','2025-01-09 09:27:30'),
(352,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:28:24','2025-01-09 09:28:24'),
(353,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:30:38','2025-01-09 09:30:38'),
(354,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:33:06','2025-01-09 09:33:06'),
(355,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:42:25','2025-01-09 09:42:25'),
(356,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:42:54','2025-01-09 09:42:54'),
(357,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:44:17','2025-01-09 09:44:17'),
(358,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:44:38','2025-01-09 09:44:38'),
(359,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:46:21','2025-01-09 09:46:21'),
(360,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:46:55','2025-01-09 09:46:55'),
(361,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:47:57','2025-01-09 09:47:57'),
(362,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:48:17','2025-01-09 09:48:17'),
(363,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:51:40','2025-01-09 09:51:40'),
(364,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:52:01','2025-01-09 09:52:01'),
(365,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 09:59:59','2025-01-09 09:59:59'),
(366,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 10:03:13','2025-01-09 10:03:13'),
(367,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 10:28:18','2025-01-09 10:28:18'),
(368,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 10:31:33','2025-01-09 10:31:33'),
(369,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 10:32:07','2025-01-09 10:32:07'),
(370,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 11:36:03','2025-01-09 11:36:03'),
(371,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 12:00:27','2025-01-09 12:00:27'),
(372,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 12:03:23','2025-01-09 12:03:23'),
(373,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 12:03:48','2025-01-09 12:03:48'),
(374,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 12:09:47','2025-01-09 12:09:47'),
(375,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 12:17:46','2025-01-09 12:17:46'),
(376,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 12:17:59','2025-01-09 12:17:59'),
(377,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 12:18:33','2025-01-09 12:18:33'),
(378,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 12:18:47','2025-01-09 12:18:47'),
(379,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 12:19:41','2025-01-09 12:19:41'),
(380,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 12:20:10','2025-01-09 12:20:10'),
(381,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-09 12:20:20','2025-01-09 12:20:20'),
(382,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 01:03:34','2025-01-10 01:03:34'),
(383,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 01:07:31','2025-01-10 01:07:31'),
(384,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 01:09:31','2025-01-10 01:09:31'),
(385,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 13:18:29','2025-01-10 13:18:29'),
(386,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 13:32:41','2025-01-10 13:32:41'),
(387,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 13:32:43','2025-01-10 13:32:43'),
(388,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 13:40:29','2025-01-10 13:40:29'),
(389,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 13:41:05','2025-01-10 13:41:05'),
(390,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 13:41:27','2025-01-10 13:41:27'),
(391,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 13:42:25','2025-01-10 13:42:25'),
(392,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 13:42:40','2025-01-10 13:42:40'),
(393,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 13:42:45','2025-01-10 13:42:45'),
(394,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 13:46:43','2025-01-10 13:46:43'),
(395,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 13:47:57','2025-01-10 13:47:57'),
(396,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 13:48:12','2025-01-10 13:48:12'),
(397,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 13:49:02','2025-01-10 13:49:02'),
(398,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 13:51:41','2025-01-10 13:51:41'),
(399,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 13:53:32','2025-01-10 13:53:32'),
(400,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 13:53:57','2025-01-10 13:53:57'),
(401,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 15:44:30','2025-01-10 15:44:30'),
(402,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 15:46:28','2025-01-10 15:46:28'),
(403,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 15:52:13','2025-01-10 15:52:13'),
(404,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 15:52:29','2025-01-10 15:52:29'),
(405,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 15:53:08','2025-01-10 15:53:08'),
(406,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 15:53:18','2025-01-10 15:53:18'),
(407,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 22:49:49','2025-01-10 22:49:49'),
(408,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 22:49:55','2025-01-10 22:49:55'),
(409,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-10 22:52:28','2025-01-10 22:52:28'),
(410,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 10:10:38','2025-01-13 10:10:38'),
(411,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 10:10:53','2025-01-13 10:10:53'),
(412,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 10:11:05','2025-01-13 10:11:05'),
(413,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 10:11:11','2025-01-13 10:11:11'),
(414,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 10:11:22','2025-01-13 10:11:22'),
(415,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 10:11:28','2025-01-13 10:11:28'),
(416,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 10:14:44','2025-01-13 10:14:44'),
(417,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 10:14:49','2025-01-13 10:14:49'),
(418,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 10:19:41','2025-01-13 10:19:41'),
(419,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 10:22:49','2025-01-13 10:22:49'),
(420,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 10:23:43','2025-01-13 10:23:43'),
(421,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 12:22:53','2025-01-13 12:22:53'),
(422,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 12:23:17','2025-01-13 12:23:17'),
(423,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 12:23:46','2025-01-13 12:23:46'),
(424,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 12:28:47','2025-01-13 12:28:47'),
(425,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 12:29:47','2025-01-13 12:29:47'),
(426,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 12:37:35','2025-01-13 12:37:35'),
(427,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 12:42:00','2025-01-13 12:42:00'),
(428,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 12:51:30','2025-01-13 12:51:30'),
(429,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 12:52:47','2025-01-13 12:52:47'),
(430,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 12:55:11','2025-01-13 12:55:11'),
(431,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 12:55:46','2025-01-13 12:55:46'),
(432,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 12:57:02','2025-01-13 12:57:02'),
(433,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 12:58:55','2025-01-13 12:58:55'),
(434,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 12:59:57','2025-01-13 12:59:57'),
(435,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:00:15','2025-01-13 13:00:15'),
(436,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:03:07','2025-01-13 13:03:07'),
(437,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:05:28','2025-01-13 13:05:28'),
(438,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:06:35','2025-01-13 13:06:35'),
(439,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:06:52','2025-01-13 13:06:52'),
(440,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:07:41','2025-01-13 13:07:41'),
(441,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:08:09','2025-01-13 13:08:09'),
(442,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:08:23','2025-01-13 13:08:23'),
(443,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:09:14','2025-01-13 13:09:14'),
(444,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:09:33','2025-01-13 13:09:33'),
(445,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:09:49','2025-01-13 13:09:49'),
(446,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:10:29','2025-01-13 13:10:29'),
(447,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:40:56','2025-01-13 13:40:56'),
(448,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:41:16','2025-01-13 13:41:16'),
(449,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:42:39','2025-01-13 13:42:39'),
(450,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:42:57','2025-01-13 13:42:57'),
(451,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:43:37','2025-01-13 13:43:37'),
(452,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:44:16','2025-01-13 13:44:16'),
(453,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:44:43','2025-01-13 13:44:43'),
(454,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:46:13','2025-01-13 13:46:13'),
(455,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:47:10','2025-01-13 13:47:10'),
(456,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:48:05','2025-01-13 13:48:05'),
(457,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:48:34','2025-01-13 13:48:34'),
(458,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:48:43','2025-01-13 13:48:43'),
(459,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:51:06','2025-01-13 13:51:06'),
(460,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:52:51','2025-01-13 13:52:51'),
(461,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:53:43','2025-01-13 13:53:43'),
(462,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:54:29','2025-01-13 13:54:29'),
(463,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:55:34','2025-01-13 13:55:34'),
(464,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:57:25','2025-01-13 13:57:25'),
(465,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:58:19','2025-01-13 13:58:19'),
(466,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 13:59:54','2025-01-13 13:59:54'),
(467,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 14:00:19','2025-01-13 14:00:19'),
(468,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 14:02:12','2025-01-13 14:02:12'),
(469,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 14:03:04','2025-01-13 14:03:04'),
(470,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 14:06:52','2025-01-13 14:06:52'),
(471,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-13 14:07:07','2025-01-13 14:07:07'),
(472,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-17 14:09:26','2025-01-17 14:09:26'),
(473,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-17 14:11:46','2025-01-17 14:11:46'),
(474,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-17 14:12:45','2025-01-17 14:12:45'),
(475,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-17 14:14:18','2025-01-17 14:14:18'),
(476,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-17 14:16:46','2025-01-17 14:16:46'),
(477,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-17 14:23:29','2025-01-17 14:23:29'),
(478,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-18 09:37:49','2025-01-18 09:37:49'),
(479,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-18 09:38:10','2025-01-18 09:38:10'),
(480,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-18 09:38:12','2025-01-18 09:38:12'),
(481,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-18 09:38:14','2025-01-18 09:38:14'),
(482,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-18 09:38:15','2025-01-18 09:38:15'),
(483,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-18 09:38:17','2025-01-18 09:38:17'),
(484,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-18 09:38:24','2025-01-18 09:38:24'),
(485,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-18 09:38:28','2025-01-18 09:38:28'),
(486,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-18 09:38:30','2025-01-18 09:38:30'),
(487,'sens02',0,0,0,NULL,NULL,NULL,3,2,'2025-01-18 09:38:47','2025-01-18 09:38:47'),
(488,'sens01',0,0,0,NULL,NULL,NULL,1,1,'2025-09-01 22:40:00','2025-09-01 22:40:00'),
(489,'sens01',0,0,0,NULL,NULL,NULL,1,1,'2025-09-01 22:41:00','2025-09-01 22:41:00'),
(490,'sens01',22.7,66,0,NULL,NULL,NULL,1,1,'2025-09-01 22:42:00','2025-09-01 22:42:00'),
(491,'sens01',22.7,65.9,0,NULL,NULL,NULL,1,1,'2025-09-01 22:43:00','2025-09-01 22:43:00'),
(492,'sens01',22.5,65.9,0,NULL,NULL,NULL,1,1,'2025-09-01 23:08:39','2025-09-01 23:08:39'),
(493,'sens01',22.4,65.9,0,NULL,NULL,NULL,1,1,'2025-09-01 23:10:31','2025-09-01 23:10:31'),
(494,'sens01',22.4,66,0,NULL,NULL,NULL,1,1,'2025-09-01 23:12:14','2025-09-01 23:12:14'),
(495,'sens01',0,0,0,NULL,NULL,NULL,1,1,'2025-09-06 19:22:51','2025-09-06 19:22:51'),
(496,'sens01',0,0,0,NULL,NULL,NULL,1,1,'2025-09-06 19:54:19','2025-09-06 19:54:19'),
(497,'sens01',21.8,58.7,0,NULL,NULL,NULL,1,1,'2025-09-06 19:54:36','2025-09-06 19:54:36'),
(498,'sens01',21.6,59.1,0,NULL,NULL,NULL,1,1,'2025-09-06 19:57:48','2025-09-06 19:57:48'),
(499,'sens01',21.6,59.2,0,NULL,NULL,NULL,1,1,'2025-09-06 19:59:16','2025-09-06 19:59:16'),
(500,'sens01',21.6,59.3,0,NULL,NULL,NULL,1,1,'2025-09-06 20:00:15','2025-09-06 20:00:15'),
(501,'sens01',21.5,59.4,0,NULL,NULL,NULL,1,1,'2025-09-06 20:00:22','2025-09-06 20:00:22'),
(502,'sens01',21.5,59.5,0,NULL,NULL,NULL,1,1,'2025-09-06 20:01:31','2025-09-06 20:01:31'),
(503,'sens01',21.5,59.5,0,NULL,NULL,NULL,1,1,'2025-09-06 20:02:00','2025-09-06 20:02:00'),
(504,'sens01',21.5,59.5,0,NULL,NULL,NULL,1,1,'2025-09-06 20:02:07','2025-09-06 20:02:07'),
(505,'sens01',21.5,59.6,0,NULL,NULL,NULL,1,1,'2025-09-06 20:03:00','2025-09-06 20:03:00'),
(506,'sens01',21.5,59.5,0,NULL,NULL,NULL,1,1,'2025-09-06 20:04:00','2025-09-06 20:04:00'),
(507,'sens01',21.5,59.8,0,NULL,NULL,NULL,1,1,'2025-09-06 20:04:35','2025-09-06 20:04:35'),
(508,'sens01',21.5,59.8,0,NULL,NULL,NULL,1,1,'2025-09-06 20:04:44','2025-09-06 20:04:44'),
(509,'sens01',21.6,60.7,0,NULL,NULL,NULL,1,1,'2025-09-06 20:22:18','2025-09-06 20:22:18'),
(510,'sens01',21.5,60.6,0,NULL,NULL,NULL,1,1,'2025-09-06 20:22:18','2025-09-06 20:22:18'),
(511,'sens01',21.3,62.2,0,NULL,NULL,NULL,1,1,'2025-09-06 20:40:00','2025-09-06 20:40:00'),
(512,'sens01',21.3,62.2,0,NULL,NULL,NULL,1,1,'2025-09-06 20:40:00','2025-09-06 20:40:00'),
(513,'sens01',21.1,63.1,0,NULL,NULL,NULL,1,1,'2025-09-06 20:55:37','2025-09-06 20:55:37'),
(514,'sens01',20.9,63.6,0,NULL,NULL,NULL,1,1,'2025-09-06 21:12:33','2025-09-06 21:12:33'),
(515,'sens01',20.9,63.6,0,NULL,NULL,NULL,1,1,'2025-09-06 21:12:33','2025-09-06 21:12:33'),
(516,'sens01',20.9,63.8,0,NULL,NULL,NULL,1,1,'2025-09-06 21:28:45','2025-09-06 21:28:45'),
(517,'sens01',20.9,64,0,NULL,NULL,NULL,1,1,'2025-09-06 21:44:12','2025-09-06 21:44:12'),
(518,'sens01',20.9,64,0,NULL,NULL,NULL,1,1,'2025-09-06 21:44:12','2025-09-06 21:44:12'),
(519,'sens01',20.9,64.4,0,NULL,NULL,NULL,1,1,'2025-09-06 22:03:02','2025-09-06 22:03:02'),
(520,'sens01',20.9,64.4,0,NULL,NULL,NULL,1,1,'2025-09-06 22:03:02','2025-09-06 22:03:02'),
(521,'sens01',20.9,64.5,0,NULL,NULL,NULL,1,1,'2025-09-06 22:25:59','2025-09-06 22:25:59'),
(522,'sens01',20.9,64.5,0,NULL,NULL,NULL,1,1,'2025-09-06 22:25:59','2025-09-06 22:25:59'),
(523,'sens01',20.9,64.7,0,NULL,NULL,NULL,1,1,'2025-09-06 22:44:12','2025-09-06 22:44:12'),
(524,'sens01',20.9,64.7,0,NULL,NULL,NULL,1,1,'2025-09-06 22:44:12','2025-09-06 22:44:12'),
(525,'sens01',21.1,65.7,0,NULL,NULL,NULL,1,1,'2025-09-06 23:00:37','2025-09-06 23:00:37'),
(526,'sens01',21.1,65.7,0,NULL,NULL,NULL,1,1,'2025-09-06 23:00:37','2025-09-06 23:00:37'),
(527,'sens01',22.2,61.4,0,NULL,NULL,NULL,1,1,'2025-09-06 23:24:59','2025-09-06 23:24:59'),
(528,'sens01',22.2,61.4,0,NULL,NULL,NULL,1,1,'2025-09-06 23:24:59','2025-09-06 23:24:59'),
(529,'sens01',22.3,61.1,0,NULL,NULL,NULL,1,1,'2025-09-06 23:43:12','2025-09-06 23:43:12'),
(530,'sens01',22.3,61.1,0,NULL,NULL,NULL,1,1,'2025-09-06 23:43:12','2025-09-06 23:43:12'),
(531,'sens01',22.3,61,0,NULL,NULL,NULL,1,1,'2025-09-06 23:59:12','2025-09-06 23:59:12'),
(532,'sens01',22.3,60.9,0,NULL,NULL,NULL,1,1,'2025-09-07 00:09:03','2025-09-07 00:09:03'),
(533,'sens01',22.4,61,0,NULL,NULL,NULL,1,1,'2025-09-07 00:26:39','2025-09-07 00:26:39'),
(534,'sens01',22.4,61,0,NULL,NULL,NULL,1,1,'2025-09-07 00:26:39','2025-09-07 00:26:39'),
(535,'sens01',22.3,60.9,0,NULL,NULL,NULL,1,1,'2025-09-07 00:43:51','2025-09-07 00:43:51'),
(536,'sens01',22.3,60.9,0,NULL,NULL,NULL,1,1,'2025-09-07 00:43:51','2025-09-07 00:43:51'),
(537,'sens01',22.3,61,0,NULL,NULL,NULL,1,1,'2025-09-07 00:59:48','2025-09-07 00:59:48'),
(538,'sens01',22.3,61,0,NULL,NULL,NULL,1,1,'2025-09-07 01:00:00','2025-09-07 01:00:00'),
(539,'sens01',22.3,61,0,NULL,NULL,NULL,1,1,'2025-09-07 01:10:20','2025-09-07 01:10:20'),
(540,'sens01',22.2,61,0,NULL,NULL,NULL,1,1,'2025-09-07 01:26:06','2025-09-07 01:26:06'),
(541,'sens01',22.2,61.1,0,NULL,NULL,NULL,1,1,'2025-09-07 01:42:27','2025-09-07 01:42:27'),
(542,'sens01',22.2,61.1,0,NULL,NULL,NULL,1,1,'2025-09-07 01:42:27','2025-09-07 01:42:27'),
(543,'sens01',22.2,61.1,0,NULL,NULL,NULL,1,1,'2025-09-07 02:03:20','2025-09-07 02:03:20'),
(544,'sens01',22.2,61.1,0,NULL,NULL,NULL,1,1,'2025-09-07 02:03:20','2025-09-07 02:03:20'),
(545,'sens01',22.2,61.2,0,NULL,NULL,NULL,1,1,'2025-09-07 02:11:27','2025-09-07 02:11:27'),
(546,'sens01',22.2,61.2,0,NULL,NULL,NULL,1,1,'2025-09-07 02:28:53','2025-09-07 02:28:53'),
(547,'sens01',22.1,61.2,0,NULL,NULL,NULL,1,1,'2025-09-07 02:46:50','2025-09-07 02:46:50'),
(548,'sens01',22.1,61.2,0,NULL,NULL,NULL,1,1,'2025-09-07 02:46:50','2025-09-07 02:46:50'),
(549,'sens01',22.1,61.3,0,NULL,NULL,NULL,1,1,'2025-09-07 03:03:19','2025-09-07 03:03:19'),
(550,'sens01',22.1,61.3,0,NULL,NULL,NULL,1,1,'2025-09-07 03:03:19','2025-09-07 03:03:19'),
(551,'sens01',22.1,61.3,0,NULL,NULL,NULL,1,1,'2025-09-07 03:12:15','2025-09-07 03:12:15'),
(552,'sens01',22.1,61.3,0,NULL,NULL,NULL,1,1,'2025-09-07 03:29:53','2025-09-07 03:29:53'),
(553,'sens01',22.1,61.3,0,NULL,NULL,NULL,1,1,'2025-09-07 03:30:00','2025-09-07 03:30:00'),
(554,'sens01',22,61.3,0,NULL,NULL,NULL,1,1,'2025-09-07 03:47:04','2025-09-07 03:47:04'),
(555,'sens01',22,61.3,0,NULL,NULL,NULL,1,1,'2025-09-07 04:04:10','2025-09-07 04:04:10'),
(556,'sens01',22,61.3,0,NULL,NULL,NULL,1,1,'2025-09-07 04:04:10','2025-09-07 04:04:10'),
(557,'sens01',22,61.4,0,NULL,NULL,NULL,1,1,'2025-09-07 04:13:06','2025-09-07 04:13:06'),
(558,'sens01',22,61.6,0,NULL,NULL,NULL,1,1,'2025-09-07 04:30:09','2025-09-07 04:30:09'),
(559,'sens01',22,61.6,0,NULL,NULL,NULL,1,1,'2025-09-07 04:30:09','2025-09-07 04:30:09'),
(560,'sens01',21.9,61.6,0,NULL,NULL,NULL,1,1,'2025-09-07 04:47:36','2025-09-07 04:47:36'),
(561,'sens01',21.9,61.6,0,NULL,NULL,NULL,1,1,'2025-09-07 05:05:31','2025-09-07 05:05:31'),
(562,'sens01',21.9,61.6,0,NULL,NULL,NULL,1,1,'2025-09-07 05:05:31','2025-09-07 05:05:31'),
(563,'sens01',21.9,61.6,0,NULL,NULL,NULL,1,1,'2025-09-07 05:14:31','2025-09-07 05:14:31'),
(564,'sens01',21.9,61.6,0,NULL,NULL,NULL,1,1,'2025-09-07 05:32:34','2025-09-07 05:32:34'),
(565,'sens01',21.9,61.6,0,NULL,NULL,NULL,1,1,'2025-09-07 05:32:34','2025-09-07 05:32:34'),
(566,'sens01',21.9,61.7,0,NULL,NULL,NULL,1,1,'2025-09-07 05:50:53','2025-09-07 05:50:53'),
(567,'sens01',21.9,61.7,0,NULL,NULL,NULL,1,1,'2025-09-07 05:50:53','2025-09-07 05:50:53'),
(568,'sens01',22,61.4,0,NULL,NULL,NULL,1,1,'2025-09-07 06:07:12','2025-09-07 06:07:12'),
(569,'sens01',22,61.4,0,NULL,NULL,NULL,1,1,'2025-09-07 06:15:19','2025-09-07 06:15:19'),
(570,'sens01',22,61.3,0,NULL,NULL,NULL,1,1,'2025-09-07 06:33:17','2025-09-07 06:33:17'),
(571,'sens01',22,61.3,0,NULL,NULL,NULL,1,1,'2025-09-07 06:33:17','2025-09-07 06:33:17'),
(572,'sens01',22,61.3,0,NULL,NULL,NULL,1,1,'2025-09-07 06:50:37','2025-09-07 06:50:37'),
(573,'sens01',22,61.3,0,NULL,NULL,NULL,1,1,'2025-09-07 06:50:37','2025-09-07 06:50:37'),
(574,'sens01',22,61.3,0,NULL,NULL,NULL,1,1,'2025-09-07 07:07:53','2025-09-07 07:07:53'),
(575,'sens01',22,61.4,0,NULL,NULL,NULL,1,1,'2025-09-07 07:16:09','2025-09-07 07:16:09'),
(576,'sens01',22,62.4,0,NULL,NULL,NULL,1,1,'2025-09-07 07:33:42','2025-09-07 07:33:42'),
(577,'sens01',22,62.4,0,NULL,NULL,NULL,1,1,'2025-09-07 07:33:42','2025-09-07 07:33:42'),
(578,'sens01',22.1,62.3,0,NULL,NULL,NULL,1,1,'2025-09-07 07:49:26','2025-09-07 07:49:26'),
(579,'sens01',22.1,62.3,0,NULL,NULL,NULL,1,1,'2025-09-07 07:50:00','2025-09-07 07:50:00'),
(580,'sens01',22.1,62.3,0,NULL,NULL,NULL,1,1,'2025-09-07 08:07:18','2025-09-07 08:07:18'),
(581,'sens01',22.1,62.3,0,NULL,NULL,NULL,1,1,'2025-09-07 08:17:15','2025-09-07 08:17:15'),
(582,'sens01',22.1,62.2,0,NULL,NULL,NULL,1,1,'2025-09-07 08:34:50','2025-09-07 08:34:50'),
(583,'sens01',22.1,62.2,0,NULL,NULL,NULL,1,1,'2025-09-07 08:34:50','2025-09-07 08:34:50'),
(584,'sens01',22.2,62.3,0,NULL,NULL,NULL,1,1,'2025-09-07 08:52:44','2025-09-07 08:52:44'),
(585,'sens01',22.2,62.3,0,NULL,NULL,NULL,1,1,'2025-09-07 08:52:44','2025-09-07 08:52:44'),
(586,'sens01',22.2,62.5,0,NULL,NULL,NULL,1,1,'2025-09-07 09:10:30','2025-09-07 09:10:30'),
(587,'sens01',22.2,62.5,0,NULL,NULL,NULL,1,1,'2025-09-07 09:10:30','2025-09-07 09:10:30'),
(588,'sens01',22.3,62.5,0,NULL,NULL,NULL,1,1,'2025-09-07 09:34:55','2025-09-07 09:34:55'),
(589,'sens01',22.3,62.5,0,NULL,NULL,NULL,1,1,'2025-09-07 09:34:55','2025-09-07 09:34:55'),
(590,'sens01',22.3,62.3,0,NULL,NULL,NULL,1,1,'2025-09-07 09:53:12','2025-09-07 09:53:12'),
(591,'sens01',22.3,62.3,0,NULL,NULL,NULL,1,1,'2025-09-07 09:53:12','2025-09-07 09:53:12'),
(592,'sens01',22.3,62.3,0,NULL,NULL,NULL,1,1,'2025-09-07 10:00:00','2025-09-07 10:00:00'),
(593,'sens01',22.4,62,0,NULL,NULL,NULL,1,1,'2025-09-07 10:17:42','2025-09-07 10:17:42'),
(594,'sens01',22.5,61.8,0,NULL,NULL,NULL,1,1,'2025-09-07 10:33:40','2025-09-07 10:33:40'),
(595,'sens01',22.5,61.8,0,NULL,NULL,NULL,1,1,'2025-09-07 10:33:40','2025-09-07 10:33:40'),
(596,'sens01',22.7,61.6,0,NULL,NULL,NULL,1,1,'2025-09-07 10:52:33','2025-09-07 10:52:33'),
(597,'sens01',22.7,61.6,0,NULL,NULL,NULL,1,1,'2025-09-07 10:52:34','2025-09-07 10:52:34'),
(598,'sens01',22.8,61.3,0,NULL,NULL,NULL,1,1,'2025-09-07 11:10:54','2025-09-07 11:10:54'),
(599,'sens01',22.8,61.3,0,NULL,NULL,NULL,1,1,'2025-09-07 11:10:54','2025-09-07 11:10:54'),
(600,'sens01',23,61,0,NULL,NULL,NULL,1,1,'2025-09-07 11:37:11','2025-09-07 11:37:11'),
(601,'sens01',23,61,0,NULL,NULL,NULL,1,1,'2025-09-07 11:37:11','2025-09-07 11:37:11'),
(602,'sens01',23,60.9,0,NULL,NULL,NULL,1,1,'2025-09-07 11:55:07','2025-09-07 11:55:07'),
(603,'sens01',23,60.9,0,NULL,NULL,NULL,1,1,'2025-09-07 11:55:07','2025-09-07 11:55:07'),
(604,'sens01',23.1,60.4,0,NULL,NULL,NULL,1,1,'2025-09-07 12:12:25','2025-09-07 12:12:25'),
(605,'sens01',23.1,60.4,0,NULL,NULL,NULL,1,1,'2025-09-07 12:12:25','2025-09-07 12:12:25'),
(606,'sens01',23.1,60.5,0,NULL,NULL,NULL,1,1,'2025-09-07 12:20:09','2025-09-07 12:20:09'),
(607,'sens01',23.2,60.4,0,NULL,NULL,NULL,1,1,'2025-09-07 12:38:35','2025-09-07 12:38:35'),
(608,'sens01',23.8,60.2,0,NULL,NULL,NULL,1,1,'2025-09-07 13:47:57','2025-09-07 13:47:57'),
(609,'sens01',23.8,60.2,0,1,NULL,NULL,1,1,'2025-09-07 13:49:42','2025-09-07 13:49:42'),
(610,'sens01',23.8,60.2,0,1,NULL,NULL,1,1,'2025-09-07 13:50:00','2025-09-07 13:50:00'),
(611,'sens01',23.6,60.7,0,1,NULL,NULL,1,1,'2025-09-07 14:00:00','2025-09-07 14:00:00'),
(612,'sens01',23.6,60.6,0,1,NULL,NULL,1,1,'2025-09-07 14:00:27','2025-09-07 14:00:27'),
(613,'sens01',23.6,60.6,0,1,NULL,NULL,1,1,'2025-09-07 14:00:38','2025-09-07 14:00:38'),
(614,'sens01',23.7,60.3,0,1,NULL,NULL,1,1,'2025-09-07 14:06:20','2025-09-07 14:06:20'),
(615,'sens01',23.7,60.4,0,1,NULL,NULL,1,1,'2025-09-07 14:08:14','2025-09-07 14:08:14'),
(616,'sens01',23.7,60.4,0,1,NULL,NULL,1,1,'2025-09-07 14:08:54','2025-09-07 14:08:54'),
(617,'sens01',23.7,60.4,0,1,NULL,NULL,1,1,'2025-09-07 14:10:00','2025-09-07 14:10:00'),
(618,'sens01',23.7,60.4,0,1,NULL,NULL,1,1,'2025-09-07 14:10:15','2025-09-07 14:10:15'),
(619,'sens01',23.7,60.4,0,1,NULL,NULL,1,1,'2025-09-07 14:11:00','2025-09-07 14:11:00'),
(620,'sens01',23.7,60.4,0,1,NULL,NULL,1,1,'2025-09-07 14:14:10','2025-09-07 14:14:10'),
(621,'sens01',23.7,60.4,0,1,NULL,NULL,1,1,'2025-09-07 14:14:12','2025-09-07 14:14:12'),
(622,'sens01',23.7,60.4,0,1,NULL,NULL,1,1,'2025-09-07 14:15:49','2025-09-07 14:15:49'),
(623,'sens01',23.7,60.5,0,1,NULL,NULL,1,1,'2025-09-07 14:17:43','2025-09-07 14:17:43'),
(624,'sens01',23.7,60.5,0,1,NULL,NULL,1,1,'2025-09-07 14:20:00','2025-09-07 14:20:00'),
(625,'sens01',23.7,60.5,0,1,NULL,NULL,1,1,'2025-09-07 14:20:12','2025-09-07 14:20:12'),
(626,'sens01',23.7,60.5,0,1,NULL,NULL,1,1,'2025-09-07 14:23:24','2025-09-07 14:23:24'),
(627,'sens01',23.7,60.5,0,1,NULL,NULL,1,1,'2025-09-07 14:23:52','2025-09-07 14:23:52'),
(628,'sens01',23.8,60.5,0,1,NULL,NULL,1,1,'2025-09-07 14:27:02','2025-09-07 14:27:02'),
(629,'sens01',23.8,60.5,0,1,NULL,NULL,1,1,'2025-09-07 14:27:18','2025-09-07 14:27:18'),
(630,'sens01',23.8,60.5,0,1,NULL,NULL,1,1,'2025-09-07 14:28:19','2025-09-07 14:28:19'),
(631,'sens01',23.8,60.5,0,1,NULL,NULL,1,1,'2025-09-07 14:28:25','2025-09-07 14:28:25'),
(632,'sens01',23.7,60.5,0,1,NULL,NULL,1,1,'2025-09-07 14:30:00','2025-09-07 14:30:00'),
(633,'sens01',23.6,60.8,0,1,NULL,NULL,1,1,'2025-09-07 14:40:00','2025-09-07 14:40:00'),
(634,'sens01',23.6,60.8,0,1,NULL,NULL,1,1,'2025-09-07 14:45:52','2025-09-07 14:45:52'),
(635,'sens01',23.7,60.7,0,1,NULL,NULL,1,1,'2025-09-07 14:46:44','2025-09-07 14:46:44'),
(636,'sens01',23.7,60.6,0,1,NULL,NULL,1,1,'2025-09-07 14:47:10','2025-09-07 14:47:10'),
(637,'sens01',23.9,60.2,0,1,NULL,NULL,1,1,'2025-09-07 14:48:04','2025-09-07 14:48:04'),
(638,'sens01',24,59.9,0,1,NULL,NULL,1,1,'2025-09-07 14:49:13','2025-09-07 14:49:13'),
(639,'sens01',24.1,59.7,0,1,NULL,NULL,1,1,'2025-09-07 14:50:00','2025-09-07 14:50:00'),
(640,'sens01',24.7,70.8,0,1,NULL,NULL,1,1,'2025-09-07 14:52:00','2025-09-07 14:52:00'),
(641,'sens01',24.6,58.3,0,1,NULL,NULL,1,1,'2025-09-07 14:54:00','2025-09-07 14:54:00'),
(642,'sens01',24.3,59,0,1,NULL,NULL,1,1,'2025-09-07 14:56:00','2025-09-07 14:56:00'),
(643,'sens01',24.2,59.4,0,1,NULL,NULL,1,1,'2025-09-07 14:58:00','2025-09-07 14:58:00'),
(644,'sens01',24.2,59.6,0,1,NULL,NULL,1,1,'2025-09-07 15:00:00','2025-09-07 15:00:00'),
(645,'sens01',24.1,59.9,0,1,NULL,NULL,1,1,'2025-09-07 15:02:00','2025-09-07 15:02:00'),
(646,'sens01',24.1,59.9,0,1,NULL,NULL,1,1,'2025-09-07 15:04:00','2025-09-07 15:04:00'),
(647,'sens01',24.1,60.1,0,1,NULL,NULL,1,1,'2025-09-07 15:06:00','2025-09-07 15:06:00'),
(648,'sens01',24.1,60,0,1,NULL,NULL,1,1,'2025-09-07 15:07:02','2025-09-07 15:07:02'),
(649,'sens01',24.1,60.2,0,1,NULL,NULL,1,1,'2025-09-07 15:08:00','2025-09-07 15:08:00'),
(650,'sens01',24.1,60.1,0,1,NULL,NULL,1,1,'2025-09-07 15:10:00','2025-09-07 15:10:00'),
(651,'sens01',24.1,60,0,1,NULL,NULL,1,1,'2025-09-07 15:12:00','2025-09-07 15:12:00'),
(652,'sens01',24.1,60.1,0,1,NULL,NULL,1,1,'2025-09-07 15:12:45','2025-09-07 15:12:45'),
(653,'sens01',24,60.2,0,1,NULL,NULL,1,1,'2025-09-07 15:13:56','2025-09-07 15:13:56'),
(654,'sens01',24.1,60.2,0,1,NULL,NULL,1,1,'2025-09-07 15:14:00','2025-09-07 15:14:00'),
(655,'sens01',24.1,59.9,0,1,NULL,NULL,1,1,'2025-09-07 15:15:59','2025-09-07 15:15:59'),
(656,'sens01',24.1,59.9,0,1,NULL,NULL,1,1,'2025-09-07 15:16:00','2025-09-07 15:16:00'),
(657,'sens01',24.1,59.9,0,1,NULL,NULL,1,1,'2025-09-07 15:16:01','2025-09-07 15:16:01'),
(658,'sens01',24.1,59.8,0,1,NULL,NULL,1,1,'2025-09-07 15:16:16','2025-09-07 15:16:16'),
(659,'sens01',24.1,59.9,0,1,NULL,NULL,1,1,'2025-09-07 15:17:33','2025-09-07 15:17:33'),
(660,'sens01',24.1,59.8,0,1,NULL,NULL,1,1,'2025-09-07 15:18:00','2025-09-07 15:18:00'),
(661,'sens01',24.1,59.7,0,1,NULL,NULL,1,1,'2025-09-07 15:20:00','2025-09-07 15:20:00'),
(662,'sens01',24.1,59.6,0,1,NULL,NULL,1,1,'2025-09-07 15:22:00','2025-09-07 15:22:00'),
(663,'sens01',24.1,59.3,0,1,NULL,NULL,1,1,'2025-09-07 15:24:00','2025-09-07 15:24:00'),
(664,'sens01',24.1,59.4,0,1,NULL,NULL,1,1,'2025-09-07 15:26:00','2025-09-07 15:26:00'),
(665,'sens01',24.1,59.3,0,1,NULL,NULL,1,1,'2025-09-07 15:28:00','2025-09-07 15:28:00'),
(666,'sens01',24,59.3,0,1,NULL,NULL,1,1,'2025-09-07 15:30:00','2025-09-07 15:30:00'),
(667,'sens01',24,59.6,0,1,NULL,NULL,1,1,'2025-09-07 15:32:00','2025-09-07 15:32:00'),
(668,'sens01',24,59.6,0,1,NULL,NULL,1,1,'2025-09-07 15:34:00','2025-09-07 15:34:00'),
(669,'sens01',23.9,59.7,0,1,NULL,NULL,1,1,'2025-09-07 15:36:00','2025-09-07 15:36:00'),
(670,'sens01',23.9,59.7,0,1,NULL,NULL,1,1,'2025-09-07 15:36:05','2025-09-07 15:36:05'),
(671,'sens01',23.9,59.7,0,1,NULL,NULL,1,1,'2025-09-07 15:36:49','2025-09-07 15:36:49'),
(672,'sens01',23.9,59.8,0,1,NULL,NULL,1,1,'2025-09-07 15:38:00','2025-09-07 15:38:00'),
(673,'sens01',24,59.6,0,1,NULL,NULL,1,1,'2025-09-07 15:40:00','2025-09-07 15:40:00'),
(674,'sens01',23.9,59.8,0,1,NULL,NULL,1,1,'2025-09-07 15:42:00','2025-09-07 15:42:00'),
(675,'sens01',23.8,60.2,0,1,NULL,NULL,1,1,'2025-09-07 15:44:00','2025-09-07 15:44:00'),
(676,'sens01',23.8,60.3,0,1,NULL,NULL,1,1,'2025-09-07 15:46:00','2025-09-07 15:46:00'),
(677,'sens01',23.8,60.1,0,1,NULL,NULL,1,1,'2025-09-07 15:48:00','2025-09-07 15:48:00'),
(678,'sens01',23.8,60.1,0,1,NULL,NULL,1,1,'2025-09-07 15:50:00','2025-09-07 15:50:00'),
(679,'sens01',23.8,60.3,0,1,NULL,NULL,1,1,'2025-09-07 15:52:00','2025-09-07 15:52:00'),
(680,'sens01',23.8,60.2,0,1,NULL,NULL,1,1,'2025-09-07 15:54:00','2025-09-07 15:54:00'),
(681,'sens01',23.7,60.3,0,1,NULL,NULL,1,1,'2025-09-07 15:56:00','2025-09-07 15:56:00'),
(682,'sens01',23.8,60.3,0,1,NULL,NULL,1,1,'2025-09-07 15:57:24','2025-09-07 15:57:24'),
(683,'sens01',23.7,60.5,0,1,NULL,NULL,1,1,'2025-09-07 15:58:00','2025-09-07 15:58:00'),
(684,'sens01',23.7,60.4,0,1,NULL,NULL,1,1,'2025-09-07 16:00:00','2025-09-07 16:00:00'),
(685,'sens01',23.8,60.3,0,1,NULL,NULL,1,1,'2025-09-07 16:01:03','2025-09-07 16:01:03'),
(686,'sens02',25.8,80,0,1,NULL,NULL,3,2,'2025-09-07 16:01:03','2025-09-07 16:01:03'),
(687,'sens02',25.7,81,0,1,NULL,NULL,3,2,'2025-09-07 16:02:00','2025-09-07 16:02:00'),
(688,'sens01',23.7,60.4,0,1,NULL,NULL,1,1,'2025-09-07 16:02:00','2025-09-07 16:02:00'),
(689,'sens02',25,85,0,1,NULL,NULL,3,2,'2025-09-07 16:04:00','2025-09-07 16:04:00'),
(690,'sens01',23.6,60.6,0,1,NULL,NULL,1,1,'2025-09-07 16:04:00','2025-09-07 16:04:00'),
(691,'sens02',24.9,86,0,1,NULL,NULL,3,2,'2025-09-07 16:06:00','2025-09-07 16:06:00'),
(692,'sens01',23.6,60.9,0,1,NULL,NULL,1,1,'2025-09-07 16:06:00','2025-09-07 16:06:00'),
(693,'sens02',24.8,86,0,1,NULL,NULL,3,2,'2025-09-07 16:08:00','2025-09-07 16:08:00'),
(694,'sens01',23.5,60.8,0,1,NULL,NULL,1,1,'2025-09-07 16:08:00','2025-09-07 16:08:00'),
(695,'sens02',24.7,87,0,1,NULL,NULL,3,2,'2025-09-07 16:10:00','2025-09-07 16:10:00'),
(696,'sens01',23.5,60.9,0,1,NULL,NULL,1,1,'2025-09-07 16:10:00','2025-09-07 16:10:00'),
(697,'sens02',24.6,88,0,1,NULL,NULL,3,2,'2025-09-07 16:12:00','2025-09-07 16:12:00'),
(698,'sens01',23.5,60.9,0,1,NULL,NULL,1,1,'2025-09-07 16:12:00','2025-09-07 16:12:00'),
(699,'sens02',24.4,89,0,1,NULL,NULL,3,2,'2025-09-07 16:14:00','2025-09-07 16:14:00'),
(700,'sens01',23.5,61,0,1,NULL,NULL,1,1,'2025-09-07 16:14:00','2025-09-07 16:14:00'),
(701,'sens02',24.3,89,0,1,NULL,NULL,3,2,'2025-09-07 16:16:00','2025-09-07 16:16:00'),
(702,'sens01',23.5,61,0,1,NULL,NULL,1,1,'2025-09-07 16:16:00','2025-09-07 16:16:00'),
(703,'sens02',24.2,91,0,1,NULL,NULL,3,2,'2025-09-07 16:18:00','2025-09-07 16:18:00'),
(704,'sens01',23.4,61,0,1,NULL,NULL,1,1,'2025-09-07 16:18:00','2025-09-07 16:18:00'),
(705,'sens02',24.2,91,0,1,NULL,NULL,3,2,'2025-09-07 16:20:00','2025-09-07 16:20:00'),
(706,'sens01',23.5,61,0,1,NULL,NULL,1,1,'2025-09-07 16:20:00','2025-09-07 16:20:00'),
(707,'sens02',24.1,91,0,1,NULL,NULL,3,2,'2025-09-07 16:22:00','2025-09-07 16:22:00'),
(708,'sens01',23.4,61,0,1,NULL,NULL,1,1,'2025-09-07 16:22:00','2025-09-07 16:22:00'),
(709,'sens02',24.1,91,0,1,NULL,NULL,3,2,'2025-09-07 16:24:00','2025-09-07 16:24:00'),
(710,'sens01',23.4,61,0,1,NULL,NULL,1,1,'2025-09-07 16:24:00','2025-09-07 16:24:00'),
(711,'sens02',24,92,0,1,NULL,NULL,3,2,'2025-09-07 16:26:00','2025-09-07 16:26:00'),
(712,'sens01',23.4,61,0,1,NULL,NULL,1,1,'2025-09-07 16:26:00','2025-09-07 16:26:00'),
(713,'sens02',23.9,92,0,1,NULL,NULL,3,2,'2025-09-07 16:28:00','2025-09-07 16:28:00'),
(714,'sens01',23.4,61,0,1,NULL,NULL,1,1,'2025-09-07 16:28:00','2025-09-07 16:28:00'),
(715,'sens02',23.9,93,0,1,NULL,NULL,3,2,'2025-09-07 16:30:00','2025-09-07 16:30:00'),
(716,'sens01',23.4,61,0,1,NULL,NULL,1,1,'2025-09-07 16:30:00','2025-09-07 16:30:00'),
(717,'sens02',23.9,93,0,1,NULL,NULL,3,2,'2025-09-07 16:32:00','2025-09-07 16:32:00'),
(718,'sens01',23.4,61.1,0,1,NULL,NULL,1,1,'2025-09-07 16:32:00','2025-09-07 16:32:00'),
(719,'sens02',23.8,93,0,1,NULL,NULL,3,2,'2025-09-07 16:34:00','2025-09-07 16:34:00'),
(720,'sens01',23.4,61,0,1,NULL,NULL,1,1,'2025-09-07 16:34:00','2025-09-07 16:34:00'),
(721,'sens02',23.7,94,0,1,NULL,NULL,3,2,'2025-09-07 16:36:00','2025-09-07 16:36:00'),
(722,'sens01',23.4,61,0,1,NULL,NULL,1,1,'2025-09-07 16:36:00','2025-09-07 16:36:00'),
(723,'sens02',23.7,94,0,1,NULL,NULL,3,2,'2025-09-07 16:38:00','2025-09-07 16:38:00'),
(724,'sens01',23.4,61.1,0,1,NULL,NULL,1,1,'2025-09-07 16:38:00','2025-09-07 16:38:00'),
(725,'sens02',23.7,94,0,1,NULL,NULL,3,2,'2025-09-07 16:40:00','2025-09-07 16:40:00'),
(726,'sens01',23.4,61.1,0,1,NULL,NULL,1,1,'2025-09-07 16:40:00','2025-09-07 16:40:00'),
(727,'sens02',23.6,95,0,1,NULL,NULL,3,2,'2025-09-07 16:42:00','2025-09-07 16:42:00'),
(728,'sens01',23.3,61.2,0,1,NULL,NULL,1,1,'2025-09-07 16:42:00','2025-09-07 16:42:00'),
(729,'sens02',23.6,95,0,1,NULL,NULL,3,2,'2025-09-07 16:44:00','2025-09-07 16:44:00'),
(730,'sens01',23.4,61.1,0,1,NULL,NULL,1,1,'2025-09-07 16:44:00','2025-09-07 16:44:00'),
(731,'sens02',23.6,95,0,1,NULL,NULL,3,2,'2025-09-07 16:46:00','2025-09-07 16:46:00'),
(732,'sens01',23.3,61.1,0,1,NULL,NULL,1,1,'2025-09-07 16:46:00','2025-09-07 16:46:00'),
(733,'sens02',23.5,95,0,1,NULL,NULL,3,2,'2025-09-07 16:48:00','2025-09-07 16:48:00'),
(734,'sens01',23.3,61.2,0,1,NULL,NULL,1,1,'2025-09-07 16:48:00','2025-09-07 16:48:00'),
(735,'sens02',23.5,95,0,1,NULL,NULL,3,2,'2025-09-07 16:50:00','2025-09-07 16:50:00'),
(736,'sens01',23.3,61.2,0,1,NULL,NULL,1,1,'2025-09-07 16:50:00','2025-09-07 16:50:00'),
(737,'sens02',23.5,95,0,1,NULL,NULL,3,2,'2025-09-07 16:52:00','2025-09-07 16:52:00'),
(738,'sens01',23.3,61.2,0,1,NULL,NULL,1,1,'2025-09-07 16:52:00','2025-09-07 16:52:00'),
(739,'sens02',23.5,95,0,1,NULL,NULL,3,2,'2025-09-07 16:54:00','2025-09-07 16:54:00'),
(740,'sens01',23.3,61.1,0,1,NULL,NULL,1,1,'2025-09-07 16:54:00','2025-09-07 16:54:00'),
(741,'sens01',23.3,61.2,0,1,NULL,NULL,1,1,'2025-09-07 16:56:00','2025-09-07 16:56:00'),
(742,'sens02',23.4,95,0,1,NULL,NULL,3,2,'2025-09-07 16:56:00','2025-09-07 16:56:00'),
(743,'sens02',23.4,95,0,1,NULL,NULL,3,2,'2025-09-07 16:58:00','2025-09-07 16:58:00'),
(744,'sens01',23.3,61.3,0,1,NULL,NULL,1,1,'2025-09-07 16:58:00','2025-09-07 16:58:00'),
(745,'sens02',23.4,95,0,1,NULL,NULL,3,2,'2025-09-07 17:00:00','2025-09-07 17:00:00'),
(746,'sens01',23.3,61.3,0,1,NULL,NULL,1,1,'2025-09-07 17:00:00','2025-09-07 17:00:00'),
(747,'sens02',23.4,95,0,1,NULL,NULL,3,2,'2025-09-07 17:02:00','2025-09-07 17:02:00'),
(748,'sens01',23.3,61.3,0,1,NULL,NULL,1,1,'2025-09-07 17:02:00','2025-09-07 17:02:00'),
(749,'sens02',23.3,95,0,1,NULL,NULL,3,2,'2025-09-07 17:04:00','2025-09-07 17:04:00'),
(750,'sens01',23.3,61.3,0,1,NULL,NULL,1,1,'2025-09-07 17:04:00','2025-09-07 17:04:00'),
(751,'sens02',23.3,95,0,1,NULL,NULL,3,2,'2025-09-07 17:06:00','2025-09-07 17:06:00'),
(752,'sens01',23.2,61.3,0,1,NULL,NULL,1,1,'2025-09-07 17:06:00','2025-09-07 17:06:00'),
(753,'sens02',23.3,95,0,1,NULL,NULL,3,2,'2025-09-07 17:08:00','2025-09-07 17:08:00'),
(754,'sens01',23.2,61.4,0,1,NULL,NULL,1,1,'2025-09-07 17:08:00','2025-09-07 17:08:00'),
(755,'sens02',23.3,95,0,1,NULL,NULL,3,2,'2025-09-07 17:10:00','2025-09-07 17:10:00'),
(756,'sens01',23.2,61.5,0,1,NULL,NULL,1,1,'2025-09-07 17:10:00','2025-09-07 17:10:00'),
(757,'sens02',23.3,95,0,1,NULL,NULL,3,2,'2025-09-07 17:12:00','2025-09-07 17:12:00'),
(758,'sens01',23.2,61.4,0,1,NULL,NULL,1,1,'2025-09-07 17:12:00','2025-09-07 17:12:00'),
(759,'sens02',23.3,95,0,1,NULL,NULL,3,2,'2025-09-07 17:14:00','2025-09-07 17:14:00'),
(760,'sens01',23.2,61.5,0,1,NULL,NULL,1,1,'2025-09-07 17:14:00','2025-09-07 17:14:00'),
(761,'sens02',23.3,95,0,1,NULL,NULL,3,2,'2025-09-07 17:16:00','2025-09-07 17:16:00'),
(762,'sens01',23.2,61.5,0,1,NULL,NULL,1,1,'2025-09-07 17:16:00','2025-09-07 17:16:00'),
(763,'sens02',23.3,95,0,1,NULL,NULL,3,2,'2025-09-07 17:18:00','2025-09-07 17:18:00'),
(764,'sens01',23.2,61.6,0,1,NULL,NULL,1,1,'2025-09-07 17:18:00','2025-09-07 17:18:00'),
(765,'sens02',23.3,95,0,1,NULL,NULL,3,2,'2025-09-07 17:20:00','2025-09-07 17:20:00'),
(766,'sens01',23.2,61.5,0,1,NULL,NULL,1,1,'2025-09-07 17:20:00','2025-09-07 17:20:00'),
(767,'sens02',23.3,95,0,1,NULL,NULL,3,2,'2025-09-07 17:22:00','2025-09-07 17:22:00'),
(768,'sens01',23.1,61.6,0,1,NULL,NULL,1,1,'2025-09-07 17:22:00','2025-09-07 17:22:00'),
(769,'sens02',23.3,95,0,1,NULL,NULL,3,2,'2025-09-07 17:24:00','2025-09-07 17:24:00'),
(770,'sens01',23.1,61.7,0,1,NULL,NULL,1,1,'2025-09-07 17:24:00','2025-09-07 17:24:00'),
(771,'sens02',23.3,95,0,1,NULL,NULL,3,2,'2025-09-07 17:26:00','2025-09-07 17:26:00'),
(772,'sens01',23.2,61.6,0,1,NULL,NULL,1,1,'2025-09-07 17:26:00','2025-09-07 17:26:00'),
(773,'sens02',23.2,95,0,1,NULL,NULL,3,2,'2025-09-07 17:28:00','2025-09-07 17:28:00'),
(774,'sens01',23.2,61.6,0,1,NULL,NULL,1,1,'2025-09-07 17:28:00','2025-09-07 17:28:00'),
(775,'sens02',23.2,95,0,1,NULL,NULL,3,2,'2025-09-07 17:30:00','2025-09-07 17:30:00'),
(776,'sens01',23.1,61.7,0,1,NULL,NULL,1,1,'2025-09-07 17:30:00','2025-09-07 17:30:00'),
(777,'sens02',23.2,95,0,1,NULL,NULL,3,2,'2025-09-07 17:32:00','2025-09-07 17:32:00'),
(778,'sens01',23.1,61.7,0,1,NULL,NULL,1,1,'2025-09-07 17:32:00','2025-09-07 17:32:00'),
(779,'sens02',23.2,95,0,1,NULL,NULL,3,2,'2025-09-07 17:34:00','2025-09-07 17:34:00'),
(780,'sens01',23.1,61.7,0,1,NULL,NULL,1,1,'2025-09-07 17:34:00','2025-09-07 17:34:00'),
(781,'sens02',23.2,95,0,1,NULL,NULL,3,2,'2025-09-07 17:36:00','2025-09-07 17:36:00'),
(782,'sens01',23.1,61.8,0,1,NULL,NULL,1,1,'2025-09-07 17:36:00','2025-09-07 17:36:00'),
(783,'sens02',23.2,95,0,1,NULL,NULL,3,2,'2025-09-07 17:38:00','2025-09-07 17:38:00'),
(784,'sens01',23.1,61.8,0,1,NULL,NULL,1,1,'2025-09-07 17:38:00','2025-09-07 17:38:00'),
(785,'sens02',23.2,95,0,1,NULL,NULL,3,2,'2025-09-07 17:40:00','2025-09-07 17:40:00'),
(786,'sens01',23.1,61.7,0,1,NULL,NULL,1,1,'2025-09-07 17:40:00','2025-09-07 17:40:00'),
(787,'sens02',23.2,95,0,1,NULL,NULL,3,2,'2025-09-07 17:42:00','2025-09-07 17:42:00'),
(788,'sens01',23.1,61.7,0,1,NULL,NULL,1,1,'2025-09-07 17:42:00','2025-09-07 17:42:00'),
(789,'sens02',23.2,95,0,1,NULL,NULL,3,2,'2025-09-07 17:44:00','2025-09-07 17:44:00'),
(790,'sens01',23.1,61.8,0,1,NULL,NULL,1,1,'2025-09-07 17:44:00','2025-09-07 17:44:00'),
(791,'sens02',23.1,95,0,1,NULL,NULL,3,2,'2025-09-07 17:46:00','2025-09-07 17:46:00'),
(792,'sens01',23.1,61.8,0,1,NULL,NULL,1,1,'2025-09-07 17:46:00','2025-09-07 17:46:00'),
(793,'sens02',23.2,95,0,1,NULL,NULL,3,2,'2025-09-07 17:48:00','2025-09-07 17:48:00'),
(794,'sens01',23.1,61.8,0,1,NULL,NULL,1,1,'2025-09-07 17:48:00','2025-09-07 17:48:00'),
(795,'sens02',23.1,95,0,1,NULL,NULL,3,2,'2025-09-07 17:50:00','2025-09-07 17:50:00'),
(796,'sens01',23.1,61.8,0,1,NULL,NULL,1,1,'2025-09-07 17:50:00','2025-09-07 17:50:00'),
(797,'sens02',23.1,95,0,1,NULL,NULL,3,2,'2025-09-07 17:52:00','2025-09-07 17:52:00'),
(798,'sens01',23.1,61.8,0,1,NULL,NULL,1,1,'2025-09-07 17:52:00','2025-09-07 17:52:00'),
(799,'sens02',23.1,95,0,1,NULL,NULL,3,2,'2025-09-07 17:54:00','2025-09-07 17:54:00'),
(800,'sens01',23.1,61.8,0,1,NULL,NULL,1,1,'2025-09-07 17:54:00','2025-09-07 17:54:00'),
(801,'sens02',23.1,95,0,1,NULL,NULL,3,2,'2025-09-07 17:56:00','2025-09-07 17:56:00'),
(802,'sens01',23.1,61.9,0,1,NULL,NULL,1,1,'2025-09-07 17:56:00','2025-09-07 17:56:00'),
(803,'sens02',23.1,95,0,1,NULL,NULL,3,2,'2025-09-07 17:58:00','2025-09-07 17:58:00'),
(804,'sens01',23.1,61.9,0,1,NULL,NULL,1,1,'2025-09-07 17:58:00','2025-09-07 17:58:00'),
(805,'sens02',23.1,95,0,1,NULL,NULL,3,2,'2025-09-07 18:00:00','2025-09-07 18:00:00'),
(806,'sens01',23,61.9,0,1,NULL,NULL,1,1,'2025-09-07 18:00:00','2025-09-07 18:00:00'),
(807,'sens02',23.1,95,0,1,NULL,NULL,3,2,'2025-09-07 18:02:00','2025-09-07 18:02:00'),
(808,'sens01',23,61.9,0,1,NULL,NULL,1,1,'2025-09-07 18:02:00','2025-09-07 18:02:00'),
(809,'sens02',23.1,95,0,1,NULL,NULL,3,2,'2025-09-07 18:04:00','2025-09-07 18:04:00'),
(810,'sens01',23.1,61.8,0,1,NULL,NULL,1,1,'2025-09-07 18:04:00','2025-09-07 18:04:00'),
(811,'sens02',23.1,95,0,1,NULL,NULL,3,2,'2025-09-07 18:06:00','2025-09-07 18:06:00'),
(812,'sens01',23,61.9,0,1,NULL,NULL,1,1,'2025-09-07 18:06:00','2025-09-07 18:06:00'),
(813,'sens02',23.1,95,0,1,NULL,NULL,3,2,'2025-09-07 18:08:00','2025-09-07 18:08:00'),
(814,'sens01',23,62,0,1,NULL,NULL,1,1,'2025-09-07 18:08:00','2025-09-07 18:08:00'),
(815,'sens02',23.1,95,0,1,NULL,NULL,3,2,'2025-09-07 18:10:00','2025-09-07 18:10:00'),
(816,'sens01',23,62,0,1,NULL,NULL,1,1,'2025-09-07 18:10:00','2025-09-07 18:10:00'),
(817,'sens01',23,61.9,0,1,NULL,NULL,1,1,'2025-09-07 18:12:00','2025-09-07 18:12:00'),
(818,'sens02',23.1,95,0,1,NULL,NULL,3,2,'2025-09-07 18:12:00','2025-09-07 18:12:00'),
(819,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 18:14:00','2025-09-07 18:14:00'),
(820,'sens01',23,62,0,1,NULL,NULL,1,1,'2025-09-07 18:14:00','2025-09-07 18:14:00'),
(821,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 18:16:00','2025-09-07 18:16:00'),
(822,'sens01',23,62,0,1,NULL,NULL,1,1,'2025-09-07 18:16:00','2025-09-07 18:16:00'),
(823,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 18:18:00','2025-09-07 18:18:00'),
(824,'sens01',23,62,0,1,NULL,NULL,1,1,'2025-09-07 18:18:00','2025-09-07 18:18:00'),
(825,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 18:20:00','2025-09-07 18:20:00'),
(826,'sens01',23,62,0,1,NULL,NULL,1,1,'2025-09-07 18:20:00','2025-09-07 18:20:00'),
(827,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 18:22:00','2025-09-07 18:22:00'),
(828,'sens01',23,62,0,1,NULL,NULL,1,1,'2025-09-07 18:22:00','2025-09-07 18:22:00'),
(829,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 18:24:00','2025-09-07 18:24:00'),
(830,'sens01',23,62,0,1,NULL,NULL,1,1,'2025-09-07 18:24:00','2025-09-07 18:24:00'),
(831,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 18:26:00','2025-09-07 18:26:00'),
(832,'sens01',23,62,0,1,NULL,NULL,1,1,'2025-09-07 18:26:00','2025-09-07 18:26:00'),
(833,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 18:28:00','2025-09-07 18:28:00'),
(834,'sens01',23,62.1,0,1,NULL,NULL,1,1,'2025-09-07 18:28:00','2025-09-07 18:28:00'),
(835,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 18:30:00','2025-09-07 18:30:00'),
(836,'sens01',23,62,0,1,NULL,NULL,1,1,'2025-09-07 18:30:00','2025-09-07 18:30:00'),
(837,'sens02',23.1,95,0,1,NULL,NULL,3,2,'2025-09-07 18:32:00','2025-09-07 18:32:00'),
(838,'sens01',23,62,0,1,NULL,NULL,1,1,'2025-09-07 18:32:00','2025-09-07 18:32:00'),
(839,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 18:34:00','2025-09-07 18:34:00'),
(840,'sens01',23,62.1,0,1,NULL,NULL,1,1,'2025-09-07 18:34:00','2025-09-07 18:34:00'),
(841,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 18:36:00','2025-09-07 18:36:00'),
(842,'sens01',23.1,62,0,1,NULL,NULL,1,1,'2025-09-07 18:36:00','2025-09-07 18:36:00'),
(843,'sens01',23,62.1,0,1,NULL,NULL,1,1,'2025-09-07 18:38:00','2025-09-07 18:38:00'),
(845,'sens01',23,62,0,1,NULL,NULL,1,1,'2025-09-07 18:40:00','2025-09-07 18:40:00'),
(847,'sens01',23,62.1,0,1,NULL,NULL,1,1,'2025-09-07 18:42:00','2025-09-07 18:42:00'),
(849,'sens01',23,62.1,0,1,NULL,NULL,1,1,'2025-09-07 18:44:00','2025-09-07 18:44:00'),
(851,'sens01',23,62.1,0,1,NULL,NULL,1,1,'2025-09-07 18:46:00','2025-09-07 18:46:00'),
(853,'sens01',23,62.1,0,1,NULL,NULL,1,1,'2025-09-07 18:48:00','2025-09-07 18:48:00'),
(855,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 18:50:00','2025-09-07 18:50:00'),
(856,'sens01',23,62.1,0,1,NULL,NULL,1,1,'2025-09-07 18:50:00','2025-09-07 18:50:00'),
(857,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 18:52:00','2025-09-07 18:52:00'),
(858,'sens01',23,62.1,0,1,NULL,NULL,1,1,'2025-09-07 18:52:00','2025-09-07 18:52:00'),
(859,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 18:54:00','2025-09-07 18:54:00'),
(860,'sens01',23,62.2,0,1,NULL,NULL,1,1,'2025-09-07 18:54:00','2025-09-07 18:54:00'),
(861,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 18:56:00','2025-09-07 18:56:00'),
(862,'sens01',23,62.3,0,1,NULL,NULL,1,1,'2025-09-07 18:56:00','2025-09-07 18:56:00'),
(863,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 18:58:00','2025-09-07 18:58:00'),
(864,'sens01',23,62.1,0,1,NULL,NULL,1,1,'2025-09-07 18:58:00','2025-09-07 18:58:00'),
(865,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:00:00','2025-09-07 19:00:00'),
(866,'sens01',23,62.2,0,1,NULL,NULL,1,1,'2025-09-07 19:00:00','2025-09-07 19:00:00'),
(867,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:02:00','2025-09-07 19:02:00'),
(868,'sens01',23,62.2,0,1,NULL,NULL,1,1,'2025-09-07 19:02:00','2025-09-07 19:02:00'),
(869,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:04:00','2025-09-07 19:04:00'),
(870,'sens01',23,62.3,0,1,NULL,NULL,1,1,'2025-09-07 19:04:00','2025-09-07 19:04:00'),
(871,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:06:00','2025-09-07 19:06:00'),
(872,'sens01',23,62.3,0,1,NULL,NULL,1,1,'2025-09-07 19:06:00','2025-09-07 19:06:00'),
(873,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:08:00','2025-09-07 19:08:00'),
(874,'sens01',22.9,62.4,0,1,NULL,NULL,1,1,'2025-09-07 19:08:00','2025-09-07 19:08:00'),
(875,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:10:00','2025-09-07 19:10:00'),
(876,'sens01',23,62.3,0,1,NULL,NULL,1,1,'2025-09-07 19:10:00','2025-09-07 19:10:00'),
(877,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:12:00','2025-09-07 19:12:00'),
(878,'sens01',23,62.4,0,1,NULL,NULL,1,1,'2025-09-07 19:12:00','2025-09-07 19:12:00'),
(879,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:14:00','2025-09-07 19:14:00'),
(880,'sens01',23,62.2,0,1,NULL,NULL,1,1,'2025-09-07 19:14:00','2025-09-07 19:14:00'),
(881,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:16:00','2025-09-07 19:16:00'),
(882,'sens01',23,62.2,0,1,NULL,NULL,1,1,'2025-09-07 19:16:00','2025-09-07 19:16:00'),
(883,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:18:00','2025-09-07 19:18:00'),
(884,'sens01',23,62.2,0,1,NULL,NULL,1,1,'2025-09-07 19:18:00','2025-09-07 19:18:00'),
(885,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:20:00','2025-09-07 19:20:00'),
(886,'sens01',23,62.2,0,1,NULL,NULL,1,1,'2025-09-07 19:20:00','2025-09-07 19:20:00'),
(887,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:22:00','2025-09-07 19:22:00'),
(888,'sens01',23,62.1,0,1,NULL,NULL,1,1,'2025-09-07 19:22:00','2025-09-07 19:22:00'),
(889,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:24:00','2025-09-07 19:24:00'),
(890,'sens01',23,62.2,0,1,NULL,NULL,1,1,'2025-09-07 19:24:00','2025-09-07 19:24:00'),
(891,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:26:00','2025-09-07 19:26:00'),
(892,'sens01',23,62.1,0,1,NULL,NULL,1,1,'2025-09-07 19:26:00','2025-09-07 19:26:00'),
(893,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 19:28:00','2025-09-07 19:28:00'),
(894,'sens01',23,62.3,0,1,NULL,NULL,1,1,'2025-09-07 19:28:00','2025-09-07 19:28:00'),
(895,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:30:00','2025-09-07 19:30:00'),
(896,'sens01',23,62.1,0,1,NULL,NULL,1,1,'2025-09-07 19:30:00','2025-09-07 19:30:00'),
(897,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:32:00','2025-09-07 19:32:00'),
(898,'sens01',23,62.1,0,1,NULL,NULL,1,1,'2025-09-07 19:32:00','2025-09-07 19:32:00'),
(899,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:34:00','2025-09-07 19:34:00'),
(900,'sens01',23,62.1,0,1,NULL,NULL,1,1,'2025-09-07 19:34:00','2025-09-07 19:34:00'),
(901,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 19:36:00','2025-09-07 19:36:00'),
(902,'sens01',23,62.2,0,1,NULL,NULL,1,1,'2025-09-07 19:36:00','2025-09-07 19:36:00'),
(903,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:38:00','2025-09-07 19:38:00'),
(904,'sens01',23,62.2,0,1,NULL,NULL,1,1,'2025-09-07 19:38:00','2025-09-07 19:38:00'),
(905,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 19:40:00','2025-09-07 19:40:00'),
(906,'sens01',23,62.3,0,1,NULL,NULL,1,1,'2025-09-07 19:40:00','2025-09-07 19:40:00'),
(907,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 19:42:00','2025-09-07 19:42:00'),
(908,'sens01',23,62.4,0,1,NULL,NULL,1,1,'2025-09-07 19:42:00','2025-09-07 19:42:00'),
(909,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 19:44:00','2025-09-07 19:44:00'),
(910,'sens01',23,62.5,0,1,NULL,NULL,1,1,'2025-09-07 19:44:00','2025-09-07 19:44:00'),
(911,'sens02',23,95,0,1,NULL,NULL,3,2,'2025-09-07 19:46:00','2025-09-07 19:46:00'),
(912,'sens01',22.9,62.7,0,1,NULL,NULL,1,1,'2025-09-07 19:46:00','2025-09-07 19:46:00'),
(913,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 19:48:00','2025-09-07 19:48:00'),
(914,'sens01',23,62.7,0,1,NULL,NULL,1,1,'2025-09-07 19:48:00','2025-09-07 19:48:00'),
(915,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 19:50:00','2025-09-07 19:50:00'),
(916,'sens01',23,63,0,1,NULL,NULL,1,1,'2025-09-07 19:50:00','2025-09-07 19:50:00'),
(917,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 19:52:00','2025-09-07 19:52:00'),
(918,'sens01',22.9,62.8,0,1,NULL,NULL,1,1,'2025-09-07 19:52:00','2025-09-07 19:52:00'),
(919,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 19:54:00','2025-09-07 19:54:00'),
(920,'sens01',22.9,62.9,0,1,NULL,NULL,1,1,'2025-09-07 19:54:00','2025-09-07 19:54:00'),
(921,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 19:56:00','2025-09-07 19:56:00'),
(922,'sens01',22.9,62.9,0,1,NULL,NULL,1,1,'2025-09-07 19:56:00','2025-09-07 19:56:00'),
(923,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 19:58:00','2025-09-07 19:58:00'),
(924,'sens01',22.9,63,0,1,NULL,NULL,1,1,'2025-09-07 19:58:00','2025-09-07 19:58:00'),
(925,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 20:00:00','2025-09-07 20:00:00'),
(926,'sens01',22.9,62.9,0,1,NULL,NULL,1,1,'2025-09-07 20:00:00','2025-09-07 20:00:00'),
(927,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 20:02:00','2025-09-07 20:02:00'),
(928,'sens01',22.9,62.9,0,1,NULL,NULL,1,1,'2025-09-07 20:02:00','2025-09-07 20:02:00'),
(929,'sens01',22.9,63,0,1,NULL,NULL,1,1,'2025-09-07 20:04:00','2025-09-07 20:04:00'),
(930,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 20:04:00','2025-09-07 20:04:00'),
(931,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 20:06:00','2025-09-07 20:06:00'),
(932,'sens01',22.9,63,0,1,NULL,NULL,1,1,'2025-09-07 20:06:00','2025-09-07 20:06:00'),
(933,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 20:08:00','2025-09-07 20:08:00'),
(934,'sens01',22.9,63,0,1,NULL,NULL,1,1,'2025-09-07 20:08:00','2025-09-07 20:08:00'),
(935,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 20:10:00','2025-09-07 20:10:00'),
(936,'sens01',22.9,62.9,0,1,NULL,NULL,1,1,'2025-09-07 20:10:00','2025-09-07 20:10:00'),
(937,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 20:12:00','2025-09-07 20:12:00'),
(938,'sens01',22.9,62.9,0,1,NULL,NULL,1,1,'2025-09-07 20:12:00','2025-09-07 20:12:00'),
(939,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 20:14:00','2025-09-07 20:14:00'),
(940,'sens01',22.9,63.1,0,1,NULL,NULL,1,1,'2025-09-07 20:14:00','2025-09-07 20:14:00'),
(941,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 20:16:00','2025-09-07 20:16:00'),
(942,'sens01',22.9,63,0,1,NULL,NULL,1,1,'2025-09-07 20:16:00','2025-09-07 20:16:00'),
(943,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:18:00','2025-09-07 20:18:00'),
(944,'sens01',22.9,63.1,0,1,NULL,NULL,1,1,'2025-09-07 20:18:00','2025-09-07 20:18:00'),
(945,'sens01',22.9,63.1,0,1,NULL,NULL,1,1,'2025-09-07 20:20:00','2025-09-07 20:20:00'),
(946,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:20:00','2025-09-07 20:20:00'),
(947,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:22:00','2025-09-07 20:22:00'),
(948,'sens01',22.8,63.4,0,1,NULL,NULL,1,1,'2025-09-07 20:22:00','2025-09-07 20:22:00'),
(949,'sens02',22.9,95,0,1,NULL,NULL,3,2,'2025-09-07 20:24:00','2025-09-07 20:24:00'),
(950,'sens01',22.9,63.3,0,1,NULL,NULL,1,1,'2025-09-07 20:24:00','2025-09-07 20:24:00'),
(951,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:26:00','2025-09-07 20:26:00'),
(952,'sens01',22.9,63.2,0,1,NULL,NULL,1,1,'2025-09-07 20:26:00','2025-09-07 20:26:00'),
(953,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:28:00','2025-09-07 20:28:00'),
(954,'sens01',22.9,63.1,0,1,NULL,NULL,1,1,'2025-09-07 20:28:00','2025-09-07 20:28:00'),
(955,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:30:00','2025-09-07 20:30:00'),
(956,'sens01',22.8,63.1,0,1,NULL,NULL,1,1,'2025-09-07 20:30:00','2025-09-07 20:30:00'),
(957,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:32:00','2025-09-07 20:32:00'),
(958,'sens01',22.9,63.2,0,1,NULL,NULL,1,1,'2025-09-07 20:32:00','2025-09-07 20:32:00'),
(959,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:34:00','2025-09-07 20:34:00'),
(960,'sens01',22.8,63.2,0,1,NULL,NULL,1,1,'2025-09-07 20:34:00','2025-09-07 20:34:00'),
(961,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:36:00','2025-09-07 20:36:00'),
(962,'sens01',22.8,63.1,0,1,NULL,NULL,1,1,'2025-09-07 20:36:00','2025-09-07 20:36:00'),
(963,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:38:00','2025-09-07 20:38:00'),
(964,'sens01',22.8,63.2,0,1,NULL,NULL,1,1,'2025-09-07 20:38:00','2025-09-07 20:38:00'),
(965,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:40:00','2025-09-07 20:40:00'),
(966,'sens01',22.8,63.2,0,1,NULL,NULL,1,1,'2025-09-07 20:40:00','2025-09-07 20:40:00'),
(967,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:42:00','2025-09-07 20:42:00'),
(968,'sens01',22.8,63.3,0,1,NULL,NULL,1,1,'2025-09-07 20:42:00','2025-09-07 20:42:00'),
(969,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:44:00','2025-09-07 20:44:00'),
(970,'sens01',22.8,63.2,0,1,NULL,NULL,1,1,'2025-09-07 20:44:00','2025-09-07 20:44:00'),
(971,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:46:00','2025-09-07 20:46:00'),
(972,'sens01',22.8,63.4,0,1,NULL,NULL,1,1,'2025-09-07 20:46:00','2025-09-07 20:46:00'),
(973,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:48:00','2025-09-07 20:48:00'),
(974,'sens01',22.8,63.6,0,1,NULL,NULL,1,1,'2025-09-07 20:48:00','2025-09-07 20:48:00'),
(975,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:50:00','2025-09-07 20:50:00'),
(976,'sens01',22.8,63.2,0,1,NULL,NULL,1,1,'2025-09-07 20:50:00','2025-09-07 20:50:00'),
(977,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:52:00','2025-09-07 20:52:00'),
(978,'sens01',22.8,63.2,0,1,NULL,NULL,1,1,'2025-09-07 20:52:00','2025-09-07 20:52:00'),
(979,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:54:00','2025-09-07 20:54:00'),
(980,'sens01',22.8,63.3,0,1,NULL,NULL,1,1,'2025-09-07 20:54:00','2025-09-07 20:54:00'),
(981,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:56:00','2025-09-07 20:56:00'),
(982,'sens01',22.8,63.3,0,1,NULL,NULL,1,1,'2025-09-07 20:56:00','2025-09-07 20:56:00'),
(983,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 20:58:00','2025-09-07 20:58:00'),
(984,'sens01',22.8,63.2,0,1,NULL,NULL,1,1,'2025-09-07 20:58:00','2025-09-07 20:58:00'),
(985,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 21:00:00','2025-09-07 21:00:00'),
(986,'sens01',22.8,63.3,0,1,NULL,NULL,1,1,'2025-09-07 21:00:00','2025-09-07 21:00:00'),
(987,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 21:02:00','2025-09-07 21:02:00'),
(988,'sens01',22.8,63.3,0,1,NULL,NULL,1,1,'2025-09-07 21:02:00','2025-09-07 21:02:00'),
(989,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 21:04:00','2025-09-07 21:04:00'),
(990,'sens01',22.8,63.1,0,1,NULL,NULL,1,1,'2025-09-07 21:04:00','2025-09-07 21:04:00'),
(991,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 21:06:00','2025-09-07 21:06:00'),
(992,'sens01',22.8,63.2,0,1,NULL,NULL,1,1,'2025-09-07 21:06:00','2025-09-07 21:06:00'),
(993,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 21:08:00','2025-09-07 21:08:00'),
(994,'sens01',22.8,63.2,0,1,NULL,NULL,1,1,'2025-09-07 21:08:00','2025-09-07 21:08:00'),
(995,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 21:10:00','2025-09-07 21:10:00'),
(996,'sens01',22.8,63.1,0,1,NULL,NULL,1,1,'2025-09-07 21:10:00','2025-09-07 21:10:00'),
(997,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 21:12:00','2025-09-07 21:12:00'),
(998,'sens01',22.8,63.2,0,1,NULL,NULL,1,1,'2025-09-07 21:12:00','2025-09-07 21:12:00'),
(999,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 21:14:00','2025-09-07 21:14:00'),
(1000,'sens01',22.8,63.4,0,1,NULL,NULL,1,1,'2025-09-07 21:14:00','2025-09-07 21:14:00'),
(1001,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:16:00','2025-09-07 21:16:00'),
(1002,'sens01',22.7,63.2,0,1,NULL,NULL,1,1,'2025-09-07 21:16:00','2025-09-07 21:16:00'),
(1003,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-07 21:18:00','2025-09-07 21:18:00'),
(1004,'sens01',22.8,63.2,0,1,NULL,NULL,1,1,'2025-09-07 21:18:00','2025-09-07 21:18:00'),
(1005,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:20:00','2025-09-07 21:20:00'),
(1006,'sens01',22.8,63.4,0,1,NULL,NULL,1,1,'2025-09-07 21:20:00','2025-09-07 21:20:00'),
(1007,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:22:00','2025-09-07 21:22:00'),
(1008,'sens01',22.8,63.2,0,1,NULL,NULL,1,1,'2025-09-07 21:22:00','2025-09-07 21:22:00'),
(1009,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:24:00','2025-09-07 21:24:00'),
(1010,'sens01',22.7,63.2,0,1,NULL,NULL,1,1,'2025-09-07 21:24:00','2025-09-07 21:24:00'),
(1011,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:26:00','2025-09-07 21:26:00'),
(1012,'sens01',22.7,63.2,0,1,NULL,NULL,1,1,'2025-09-07 21:26:00','2025-09-07 21:26:00'),
(1013,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:28:00','2025-09-07 21:28:00'),
(1014,'sens01',22.8,63.2,0,1,NULL,NULL,1,1,'2025-09-07 21:28:00','2025-09-07 21:28:00'),
(1015,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:30:00','2025-09-07 21:30:00'),
(1016,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 21:30:00','2025-09-07 21:30:00'),
(1017,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:32:00','2025-09-07 21:32:00'),
(1018,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 21:32:00','2025-09-07 21:32:00'),
(1019,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:34:00','2025-09-07 21:34:00'),
(1020,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 21:34:00','2025-09-07 21:34:00'),
(1021,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:36:00','2025-09-07 21:36:00'),
(1022,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 21:36:00','2025-09-07 21:36:00'),
(1023,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:38:00','2025-09-07 21:38:00'),
(1024,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 21:38:00','2025-09-07 21:38:00'),
(1025,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:40:00','2025-09-07 21:40:00'),
(1026,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 21:40:00','2025-09-07 21:40:00'),
(1027,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:42:00','2025-09-07 21:42:00'),
(1028,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 21:42:00','2025-09-07 21:42:00'),
(1029,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:44:00','2025-09-07 21:44:00'),
(1030,'sens01',22.7,63.5,0,1,NULL,NULL,1,1,'2025-09-07 21:44:00','2025-09-07 21:44:00'),
(1031,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:46:00','2025-09-07 21:46:00'),
(1032,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 21:46:00','2025-09-07 21:46:00'),
(1033,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:48:00','2025-09-07 21:48:00'),
(1034,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 21:48:00','2025-09-07 21:48:00'),
(1035,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:50:00','2025-09-07 21:50:00'),
(1036,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 21:50:00','2025-09-07 21:50:00'),
(1037,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:52:00','2025-09-07 21:52:00'),
(1038,'sens01',22.7,63.5,0,1,NULL,NULL,1,1,'2025-09-07 21:52:00','2025-09-07 21:52:00'),
(1039,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:54:00','2025-09-07 21:54:00'),
(1040,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 21:54:00','2025-09-07 21:54:00'),
(1041,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 21:56:00','2025-09-07 21:56:00'),
(1042,'sens01',22.7,63.5,0,1,NULL,NULL,1,1,'2025-09-07 21:56:00','2025-09-07 21:56:00'),
(1043,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-07 21:58:00','2025-09-07 21:58:00'),
(1044,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 21:58:00','2025-09-07 21:58:00'),
(1045,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-07 22:00:00','2025-09-07 22:00:00'),
(1046,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 22:00:00','2025-09-07 22:00:00'),
(1047,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 22:02:00','2025-09-07 22:02:00'),
(1048,'sens01',22.7,63.5,0,1,NULL,NULL,1,1,'2025-09-07 22:02:00','2025-09-07 22:02:00'),
(1049,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 22:04:00','2025-09-07 22:04:00'),
(1050,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 22:04:00','2025-09-07 22:04:00'),
(1051,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 22:06:00','2025-09-07 22:06:00'),
(1052,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 22:06:00','2025-09-07 22:06:00'),
(1053,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 22:08:00','2025-09-07 22:08:00'),
(1054,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 22:08:00','2025-09-07 22:08:00'),
(1055,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 22:10:00','2025-09-07 22:10:00'),
(1056,'sens01',22.7,63.5,0,1,NULL,NULL,1,1,'2025-09-07 22:10:00','2025-09-07 22:10:00'),
(1057,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 22:12:00','2025-09-07 22:12:00'),
(1058,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 22:12:00','2025-09-07 22:12:00'),
(1059,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 22:14:00','2025-09-07 22:14:00'),
(1060,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 22:14:00','2025-09-07 22:14:00'),
(1061,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-07 22:16:00','2025-09-07 22:16:00'),
(1062,'sens01',22.7,63.5,0,1,NULL,NULL,1,1,'2025-09-07 22:16:00','2025-09-07 22:16:00'),
(1063,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-07 22:18:00','2025-09-07 22:18:00'),
(1064,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 22:18:00','2025-09-07 22:18:00'),
(1065,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-07 22:20:00','2025-09-07 22:20:00'),
(1066,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 22:20:00','2025-09-07 22:20:00'),
(1067,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-07 22:22:00','2025-09-07 22:22:00'),
(1068,'sens01',22.7,63.5,0,1,NULL,NULL,1,1,'2025-09-07 22:22:00','2025-09-07 22:22:00'),
(1069,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-07 22:24:00','2025-09-07 22:24:00'),
(1070,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 22:24:00','2025-09-07 22:24:00'),
(1071,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-07 22:26:00','2025-09-07 22:26:00'),
(1072,'sens01',22.7,63.3,0,1,NULL,NULL,1,1,'2025-09-07 22:26:00','2025-09-07 22:26:00'),
(1073,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-07 22:28:00','2025-09-07 22:28:00'),
(1074,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 22:28:00','2025-09-07 22:28:00'),
(1075,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-07 22:30:00','2025-09-07 22:30:00'),
(1076,'sens01',22.7,63.3,0,1,NULL,NULL,1,1,'2025-09-07 22:30:00','2025-09-07 22:30:00'),
(1077,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-07 22:32:00','2025-09-07 22:32:00'),
(1078,'sens01',22.7,63.3,0,1,NULL,NULL,1,1,'2025-09-07 22:32:00','2025-09-07 22:32:00'),
(1079,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-07 22:34:00','2025-09-07 22:34:00'),
(1080,'sens01',22.7,63.3,0,1,NULL,NULL,1,1,'2025-09-07 22:34:00','2025-09-07 22:34:00'),
(1081,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-07 22:36:00','2025-09-07 22:36:00'),
(1082,'sens01',22.7,63.3,0,1,NULL,NULL,1,1,'2025-09-07 22:36:00','2025-09-07 22:36:00'),
(1083,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-07 22:38:00','2025-09-07 22:38:00'),
(1084,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 22:38:00','2025-09-07 22:38:00'),
(1085,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-07 22:40:00','2025-09-07 22:40:00'),
(1086,'sens01',22.7,63.4,0,1,NULL,NULL,1,1,'2025-09-07 22:40:00','2025-09-07 22:40:00'),
(1087,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-07 22:42:00','2025-09-07 22:42:00'),
(1088,'sens01',22.7,63.5,0,1,NULL,NULL,1,1,'2025-09-07 22:42:00','2025-09-07 22:42:00'),
(1089,'sens01',23,61.8,0,1,NULL,NULL,1,1,'2025-09-08 10:03:03','2025-09-08 10:03:03'),
(1090,'sens02',22.4,95,0,1,NULL,NULL,3,2,'2025-09-08 10:03:03','2025-09-08 10:03:03'),
(1091,'sens02',22.4,95,0,1,NULL,NULL,3,2,'2025-09-08 10:04:00','2025-09-08 10:04:00'),
(1092,'sens01',23.1,61.7,0,1,NULL,NULL,1,1,'2025-09-08 10:04:00','2025-09-08 10:04:00'),
(1093,'sens02',22.5,95,0,1,NULL,NULL,3,2,'2025-09-08 10:06:00','2025-09-08 10:06:00'),
(1094,'sens01',23.2,61.2,0,1,NULL,NULL,1,1,'2025-09-08 10:06:00','2025-09-08 10:06:00'),
(1095,'sens02',22.4,95,0,1,NULL,NULL,3,2,'2025-09-08 10:08:00','2025-09-08 10:08:00'),
(1096,'sens01',23.3,61.1,0,1,NULL,NULL,1,1,'2025-09-08 10:08:00','2025-09-08 10:08:00'),
(1097,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-08 10:10:00','2025-09-08 10:10:00'),
(1098,'sens01',23.3,61.1,0,1,NULL,NULL,1,1,'2025-09-08 10:10:00','2025-09-08 10:10:00'),
(1099,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-08 10:12:00','2025-09-08 10:12:00'),
(1100,'sens01',23.3,61.1,0,1,NULL,NULL,1,1,'2025-09-08 10:12:00','2025-09-08 10:12:00'),
(1101,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-08 10:14:00','2025-09-08 10:14:00'),
(1102,'sens01',23.3,61,0,1,NULL,NULL,1,1,'2025-09-08 10:14:00','2025-09-08 10:14:00'),
(1103,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-08 10:16:00','2025-09-08 10:16:00'),
(1104,'sens01',23.3,61.1,0,1,NULL,NULL,1,1,'2025-09-08 10:16:00','2025-09-08 10:16:00'),
(1105,'sens02',22.6,95,0,1,NULL,NULL,3,2,'2025-09-08 10:18:00','2025-09-08 10:18:00'),
(1106,'sens01',23.3,61.2,0,1,NULL,NULL,1,1,'2025-09-08 10:18:00','2025-09-08 10:18:00'),
(1107,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-08 10:20:00','2025-09-08 10:20:00'),
(1108,'sens01',23.3,61.3,0,1,NULL,NULL,1,1,'2025-09-08 10:20:00','2025-09-08 10:20:00'),
(1109,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-08 10:22:00','2025-09-08 10:22:00'),
(1110,'sens01',23.3,61.3,0,1,NULL,NULL,1,1,'2025-09-08 10:22:00','2025-09-08 10:22:00'),
(1111,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-08 10:24:00','2025-09-08 10:24:00'),
(1112,'sens01',23.3,61.3,0,1,NULL,NULL,1,1,'2025-09-08 10:24:00','2025-09-08 10:24:00'),
(1113,'sens02',22.7,95,0,1,NULL,NULL,3,2,'2025-09-08 10:26:00','2025-09-08 10:26:00'),
(1114,'sens01',23.2,61.5,0,1,NULL,NULL,1,1,'2025-09-08 10:26:00','2025-09-08 10:26:00'),
(1115,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-08 10:28:00','2025-09-08 10:28:00'),
(1116,'sens01',23.2,61.6,0,1,NULL,NULL,1,1,'2025-09-08 10:28:00','2025-09-08 10:28:00'),
(1117,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-08 10:30:00','2025-09-08 10:30:00'),
(1118,'sens01',23.2,61.6,0,1,NULL,NULL,1,1,'2025-09-08 10:30:00','2025-09-08 10:30:00'),
(1119,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-08 10:32:00','2025-09-08 10:32:00'),
(1120,'sens01',23.2,61.6,0,1,NULL,NULL,1,1,'2025-09-08 10:32:00','2025-09-08 10:32:00'),
(1121,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-08 10:34:00','2025-09-08 10:34:00'),
(1122,'sens01',23.3,61.6,0,1,NULL,NULL,1,1,'2025-09-08 10:34:00','2025-09-08 10:34:00'),
(1123,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-08 10:36:00','2025-09-08 10:36:00'),
(1124,'sens01',23.2,61.7,0,1,NULL,NULL,1,1,'2025-09-08 10:36:00','2025-09-08 10:36:00'),
(1125,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-08 10:38:00','2025-09-08 10:38:00'),
(1126,'sens01',23.1,62,0,1,NULL,NULL,1,1,'2025-09-08 10:38:00','2025-09-08 10:38:00'),
(1127,'sens01',23,62.1,0,1,NULL,NULL,1,1,'2025-09-08 10:40:00','2025-09-08 10:40:00'),
(1128,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-08 10:40:00','2025-09-08 10:40:00'),
(1129,'sens02',22.8,95,0,1,NULL,NULL,3,2,'2025-09-08 10:42:00','2025-09-08 10:42:00'),
(1130,'sens01',23.1,62,0,1,NULL,NULL,1,1,'2025-09-08 10:42:00','2025-09-08 10:42:00'),
(1142,'sens02',22.9,71,0,1,NULL,NULL,3,2,'2025-09-08 13:30:31','2025-09-08 13:30:31'),
(1144,'sens02',23,71,0,1,NULL,NULL,3,2,'2025-09-08 13:30:54','2025-09-08 13:30:54'),
(1145,'sens02',22.9,71.2,0,1,NULL,NULL,3,2,'2025-09-08 13:32:00','2025-09-08 13:32:00'),
(1147,'sens02',22.9,71.1,0,1,NULL,NULL,3,2,'2025-09-08 13:32:31','2025-09-08 13:32:31'),
(1148,'sens02',22.9,71.4,0,1,NULL,NULL,3,2,'2025-09-08 13:34:00','2025-09-08 13:34:00'),
(1150,'sens02',22.9,71.4,0,1,NULL,NULL,3,2,'2025-09-08 13:35:25','2025-09-08 13:35:25'),
(1151,'sens02',22.9,71.3,0,1,NULL,NULL,3,2,'2025-09-08 13:36:00','2025-09-08 13:36:00'),
(1152,'sens02',22.9,71.7,0,1,NULL,NULL,3,2,'2025-09-08 13:38:00','2025-09-08 13:38:00'),
(1153,'sens02',23,71.3,0,1,NULL,NULL,3,2,'2025-09-08 13:40:00','2025-09-08 13:40:00'),
(1154,'sens02',23.1,70.9,0,1,NULL,NULL,3,2,'2025-09-08 13:42:00','2025-09-08 13:42:00'),
(1155,'sens02',23.1,71,0,1,NULL,NULL,3,2,'2025-09-08 13:44:00','2025-09-08 13:44:00'),
(1156,'sens02',23.1,71.3,0,1,NULL,NULL,3,2,'2025-09-08 13:46:00','2025-09-08 13:46:00'),
(1157,'sens02',23,71.5,0,1,NULL,NULL,3,2,'2025-09-08 13:48:00','2025-09-08 13:48:00'),
(1158,'sens02',23,71.6,0,1,NULL,NULL,3,2,'2025-09-08 13:50:00','2025-09-08 13:50:00'),
(1159,'sens02',22.9,71.7,0,1,NULL,NULL,3,2,'2025-09-08 13:52:00','2025-09-08 13:52:00'),
(1160,'sens02',22.9,71.9,0,1,NULL,NULL,3,2,'2025-09-08 13:54:00','2025-09-08 13:54:00'),
(1161,'sens02',22.9,71.7,0,1,NULL,NULL,3,2,'2025-09-08 13:56:00','2025-09-08 13:56:00'),
(1162,'sens02',22.9,71.9,0,1,NULL,NULL,3,2,'2025-09-08 13:58:00','2025-09-08 13:58:00'),
(1163,'sens02',23,71.6,0,1,NULL,NULL,3,2,'2025-09-08 14:00:00','2025-09-08 14:00:00'),
(1164,'sens02',22.9,71.8,0,1,NULL,NULL,3,2,'2025-09-08 14:02:00','2025-09-08 14:02:00'),
(1165,'sens02',22.7,72.4,0,1,NULL,NULL,3,2,'2025-09-08 14:04:00','2025-09-08 14:04:00'),
(1208,'sens01',22.5,66.5,0,1,NULL,NULL,1,1,'2025-09-09 18:44:47','2025-09-09 18:44:47'),
(1210,'sens01',22.5,66.5,0,1,NULL,NULL,1,1,'2025-09-09 18:46:00','2025-09-09 18:46:00'),
(1211,'sens01',22.5,66.6,0,1,NULL,NULL,1,1,'2025-09-09 18:48:00','2025-09-09 18:48:00'),
(1212,'sens01',22.5,66.8,0,1,NULL,NULL,1,1,'2025-09-09 18:50:00','2025-09-09 18:50:00'),
(1213,'sens01',22.5,66.8,0,1,NULL,NULL,1,1,'2025-09-09 18:52:00','2025-09-09 18:52:00'),
(1214,'sens01',22.5,66.9,0,1,NULL,NULL,1,1,'2025-09-09 18:54:00','2025-09-09 18:54:00'),
(1215,'sens01',22.5,66.9,0,1,NULL,NULL,1,1,'2025-09-09 18:56:00','2025-09-09 18:56:00'),
(1216,'sens01',22.5,66.9,0,1,NULL,NULL,1,1,'2025-09-09 18:57:12','2025-09-09 18:57:12'),
(1218,'sens01',22.5,66.9,0,1,NULL,NULL,1,1,'2025-09-09 18:58:00','2025-09-09 18:58:00'),
(1219,'sens01',22.5,66.9,0,1,NULL,NULL,1,1,'2025-09-09 18:58:19','2025-09-09 18:58:19'),
(1221,'sens01',22.6,66.9,0,1,NULL,NULL,1,1,'2025-09-09 19:00:00','2025-09-09 19:00:00'),
(1222,'sens01',22.5,67,0,1,NULL,NULL,1,1,'2025-09-09 19:00:51','2025-09-09 19:00:51'),
(1224,'sens01',22.5,67,0,1,NULL,NULL,1,1,'2025-09-09 19:02:00','2025-09-09 19:02:00'),
(1225,'sens01',22.5,67,0,1,NULL,NULL,1,1,'2025-09-09 19:04:00','2025-09-09 19:04:00'),
(1226,'sens01',22.5,67,0,1,NULL,NULL,1,1,'2025-09-09 19:06:00','2025-09-09 19:06:00'),
(1227,'sens01',22.5,67,0,1,NULL,NULL,1,1,'2025-09-09 19:08:22','2025-09-09 19:08:22'),
(1228,'sens01',22.5,67,0,1,NULL,NULL,1,1,'2025-09-09 19:09:35','2025-09-09 19:09:35'),
(1229,'sens01',22.5,67,0,1,NULL,NULL,1,1,'2025-09-09 19:10:59','2025-09-09 19:10:59'),
(1230,'sens01',22.5,67,0,1,NULL,NULL,1,1,'2025-09-09 19:12:27','2025-09-09 19:12:27'),
(1231,'sens01',22.5,67,0,1,NULL,NULL,1,1,'2025-09-09 19:13:15','2025-09-09 19:13:15'),
(1233,'sens01',22.5,67,0,1,NULL,NULL,1,1,'2025-09-09 19:14:00','2025-09-09 19:14:00'),
(1234,'sens01',22.6,67,0,1,NULL,NULL,1,1,'2025-09-09 19:14:40','2025-09-09 19:14:40'),
(1236,'sens01',22.5,67,0,1,NULL,NULL,1,1,'2025-09-09 19:15:30','2025-09-09 19:15:30'),
(1238,'sens01',22.6,67,0,1,NULL,NULL,1,1,'2025-09-09 19:16:00','2025-09-09 19:16:00'),
(1239,'sens01',22.5,67,0,1,NULL,NULL,1,1,'2025-09-09 19:16:33','2025-09-09 19:16:33'),
(1240,'sens01',22.6,67,0,1,NULL,NULL,1,1,'2025-09-09 19:17:21','2025-09-09 19:17:21'),
(1241,'sens01',22.6,67,0,1,NULL,NULL,1,1,'2025-09-09 19:18:24','2025-09-09 19:18:24'),
(1242,'sens01',22.5,67,0,1,NULL,NULL,1,1,'2025-09-09 19:18:46','2025-09-09 19:18:46'),
(1243,'sens01',22.6,67,0,1,NULL,NULL,1,1,'2025-09-09 19:19:08','2025-09-09 19:19:08'),
(1244,'sens01',22.2,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:15:41','2025-09-10 07:15:41'),
(1245,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 07:18:17','2025-09-10 07:18:17'),
(1246,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 07:20:23','2025-09-10 07:20:23'),
(1247,'sens01',22.2,67.3,0,1,NULL,NULL,1,1,'2025-09-10 07:20:58','2025-09-10 07:20:58'),
(1248,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 07:22:01','2025-09-10 07:22:01'),
(1250,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 07:22:22','2025-09-10 07:22:22'),
(1251,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:22:31','2025-09-10 07:22:31'),
(1252,'sens01',22.2,67.2,0,1,NULL,NULL,1,1,'2025-09-10 07:23:15','2025-09-10 07:23:15'),
(1253,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 07:25:19','2025-09-10 07:25:19'),
(1255,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 07:26:00','2025-09-10 07:26:00'),
(1256,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:26:28','2025-09-10 07:26:28'),
(1258,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:28:00','2025-09-10 07:28:00'),
(1259,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:30:00','2025-09-10 07:30:00'),
(1260,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:32:00','2025-09-10 07:32:00'),
(1261,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:34:00','2025-09-10 07:34:00'),
(1262,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:36:00','2025-09-10 07:36:00'),
(1263,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:38:00','2025-09-10 07:38:00'),
(1264,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:40:00','2025-09-10 07:40:00'),
(1265,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:42:00','2025-09-10 07:42:00'),
(1266,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:44:00','2025-09-10 07:44:00'),
(1267,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:46:00','2025-09-10 07:46:00'),
(1268,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:48:00','2025-09-10 07:48:00'),
(1269,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:50:00','2025-09-10 07:50:00'),
(1270,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 07:52:00','2025-09-10 07:52:00'),
(1271,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:54:00','2025-09-10 07:54:00'),
(1272,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 07:56:00','2025-09-10 07:56:00'),
(1273,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 07:58:00','2025-09-10 07:58:00'),
(1274,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 08:00:00','2025-09-10 08:00:00'),
(1275,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 08:02:00','2025-09-10 08:02:00'),
(1276,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 08:04:00','2025-09-10 08:04:00'),
(1277,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 08:06:00','2025-09-10 08:06:00'),
(1278,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 08:08:00','2025-09-10 08:08:00'),
(1279,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 08:10:00','2025-09-10 08:10:00'),
(1280,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 08:12:00','2025-09-10 08:12:00'),
(1281,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 08:14:00','2025-09-10 08:14:00'),
(1282,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 08:16:00','2025-09-10 08:16:00'),
(1283,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 08:18:00','2025-09-10 08:18:00'),
(1284,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 08:20:00','2025-09-10 08:20:00'),
(1285,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 08:22:00','2025-09-10 08:22:00'),
(1286,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 08:24:00','2025-09-10 08:24:00'),
(1287,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 08:26:00','2025-09-10 08:26:00'),
(1288,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 08:28:00','2025-09-10 08:28:00'),
(1289,'sens01',22.1,67.7,0,1,NULL,NULL,1,1,'2025-09-10 08:30:00','2025-09-10 08:30:00'),
(1290,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 08:32:00','2025-09-10 08:32:00'),
(1291,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 08:34:00','2025-09-10 08:34:00'),
(1292,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 08:36:00','2025-09-10 08:36:00'),
(1293,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 08:38:00','2025-09-10 08:38:00'),
(1294,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 08:40:00','2025-09-10 08:40:00'),
(1295,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 08:42:00','2025-09-10 08:42:00'),
(1296,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 08:44:00','2025-09-10 08:44:00'),
(1297,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 08:46:00','2025-09-10 08:46:00'),
(1298,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 08:48:00','2025-09-10 08:48:00'),
(1299,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 08:50:00','2025-09-10 08:50:00'),
(1300,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 08:52:00','2025-09-10 08:52:00'),
(1301,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 08:54:00','2025-09-10 08:54:00'),
(1302,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 08:56:00','2025-09-10 08:56:00'),
(1303,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 08:58:00','2025-09-10 08:58:00'),
(1304,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 09:00:00','2025-09-10 09:00:00'),
(1305,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 09:02:00','2025-09-10 09:02:00'),
(1306,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 09:04:00','2025-09-10 09:04:00'),
(1307,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 09:06:00','2025-09-10 09:06:00'),
(1308,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 09:08:00','2025-09-10 09:08:00'),
(1309,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:10:00','2025-09-10 09:10:00'),
(1310,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:12:52','2025-09-10 09:12:52'),
(1311,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:14:00','2025-09-10 09:14:00'),
(1312,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:16:00','2025-09-10 09:16:00'),
(1313,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:17:08','2025-09-10 09:17:08'),
(1315,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:18:00','2025-09-10 09:18:00'),
(1316,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:20:00','2025-09-10 09:20:00'),
(1317,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:22:00','2025-09-10 09:22:00'),
(1318,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:24:00','2025-09-10 09:24:00'),
(1319,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:26:00','2025-09-10 09:26:00'),
(1320,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 09:28:00','2025-09-10 09:28:00'),
(1321,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 09:30:00','2025-09-10 09:30:00'),
(1322,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 09:30:32','2025-09-10 09:30:32'),
(1324,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:31:25','2025-09-10 09:31:25'),
(1326,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:32:00','2025-09-10 09:32:00'),
(1327,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:34:00','2025-09-10 09:34:00'),
(1328,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:34:10','2025-09-10 09:34:10'),
(1330,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:36:00','2025-09-10 09:36:00'),
(1331,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:37:58','2025-09-10 09:37:58'),
(1332,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:38:00','2025-09-10 09:38:00'),
(1334,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:40:00','2025-09-10 09:40:00'),
(1335,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:42:00','2025-09-10 09:42:00'),
(1336,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 09:46:59','2025-09-10 09:46:59'),
(1337,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 09:46:59','2025-09-10 09:46:59'),
(1338,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:50:30','2025-09-10 09:50:30'),
(1339,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:50:30','2025-09-10 09:50:30'),
(1340,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:53:53','2025-09-10 09:53:53'),
(1341,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:54:00','2025-09-10 09:54:00'),
(1342,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 09:57:29','2025-09-10 09:57:29'),
(1343,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 10:01:56','2025-09-10 10:01:56'),
(1344,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 10:01:56','2025-09-10 10:01:56'),
(1345,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 10:02:00','2025-09-10 10:02:00'),
(1346,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:06:50','2025-09-10 10:06:50'),
(1347,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:06:50','2025-09-10 10:06:50'),
(1348,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 10:11:44','2025-09-10 10:11:44'),
(1349,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 10:11:44','2025-09-10 10:11:44'),
(1350,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 10:12:00','2025-09-10 10:12:00'),
(1351,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:14:35','2025-09-10 10:14:35'),
(1352,'sens01',22,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:18:53','2025-09-10 10:18:53'),
(1353,'sens01',22,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:18:53','2025-09-10 10:18:53'),
(1354,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:22:23','2025-09-10 10:22:23'),
(1355,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:22:23','2025-09-10 10:22:23'),
(1356,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:25:34','2025-09-10 10:25:34'),
(1357,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 10:26:00','2025-09-10 10:26:00'),
(1358,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:30:38','2025-09-10 10:30:38'),
(1359,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:30:38','2025-09-10 10:30:38'),
(1360,'sens01',22,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:33:36','2025-09-10 10:33:36'),
(1361,'sens01',22,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:34:00','2025-09-10 10:34:00'),
(1362,'sens01',22,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:37:35','2025-09-10 10:37:35'),
(1363,'sens01',22,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:38:00','2025-09-10 10:38:00'),
(1364,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:41:45','2025-09-10 10:41:45'),
(1365,'sens01',22,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:42:00','2025-09-10 10:42:00'),
(1366,'sens01',22,67.4,0,1,NULL,NULL,1,1,'2025-09-10 10:45:15','2025-09-10 10:45:15'),
(1367,'sens01',22,67.5,0,1,NULL,NULL,1,1,'2025-09-10 10:48:31','2025-09-10 10:48:31'),
(1368,'sens01',22,67.5,0,1,NULL,NULL,1,1,'2025-09-10 10:48:31','2025-09-10 10:48:31'),
(1369,'sens01',22,67.5,0,1,NULL,NULL,1,1,'2025-09-10 10:52:03','2025-09-10 10:52:03'),
(1370,'sens01',22,67.5,0,1,NULL,NULL,1,1,'2025-09-10 10:52:03','2025-09-10 10:52:03'),
(1371,'sens01',22,67.5,0,1,NULL,NULL,1,1,'2025-09-10 10:55:43','2025-09-10 10:55:43'),
(1372,'sens01',22,67.5,0,1,NULL,NULL,1,1,'2025-09-10 10:56:00','2025-09-10 10:56:00'),
(1373,'sens01',22,67.5,0,1,NULL,NULL,1,1,'2025-09-10 10:58:09','2025-09-10 10:58:09'),
(1374,'sens01',22,67.5,0,1,NULL,NULL,1,1,'2025-09-10 11:02:39','2025-09-10 11:02:39'),
(1375,'sens01',22,67.5,0,1,NULL,NULL,1,1,'2025-09-10 11:02:39','2025-09-10 11:02:39'),
(1376,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 11:06:11','2025-09-10 11:06:11'),
(1377,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 11:06:11','2025-09-10 11:06:11'),
(1378,'sens01',22,67.4,0,1,NULL,NULL,1,1,'2025-09-10 11:09:42','2025-09-10 11:09:42'),
(1379,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 11:10:00','2025-09-10 11:10:00'),
(1381,'sens01',22.1,67.2,0,1,NULL,NULL,1,1,'2025-09-10 11:17:06','2025-09-10 11:17:06'),
(1382,'sens01',22.1,67.2,0,1,NULL,NULL,1,1,'2025-09-10 11:17:06','2025-09-10 11:17:06'),
(1383,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 11:21:37','2025-09-10 11:21:37'),
(1384,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 11:21:37','2025-09-10 11:21:37'),
(1385,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 11:22:00','2025-09-10 11:22:00'),
(1386,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 11:25:39','2025-09-10 11:25:39'),
(1387,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 11:26:00','2025-09-10 11:26:00'),
(1388,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 11:30:02','2025-09-10 11:30:02'),
(1389,'sens01',22.1,67.3,0,1,NULL,NULL,1,1,'2025-09-10 11:30:02','2025-09-10 11:30:02'),
(1390,'sens01',22.2,67.2,0,1,NULL,NULL,1,1,'2025-09-10 11:34:24','2025-09-10 11:34:24'),
(1391,'sens01',22.2,67.2,0,1,NULL,NULL,1,1,'2025-09-10 11:34:24','2025-09-10 11:34:24'),
(1392,'sens01',22.2,67.3,0,1,NULL,NULL,1,1,'2025-09-10 11:38:07','2025-09-10 11:38:07'),
(1393,'sens01',22.2,67.3,0,1,NULL,NULL,1,1,'2025-09-10 11:38:08','2025-09-10 11:38:08'),
(1394,'sens01',22.2,67.5,0,1,NULL,NULL,1,1,'2025-09-10 11:41:35','2025-09-10 11:41:35'),
(1395,'sens01',22.2,67.5,0,1,NULL,NULL,1,1,'2025-09-10 11:42:00','2025-09-10 11:42:00'),
(1396,'sens01',22.1,67.7,0,1,NULL,NULL,1,1,'2025-09-10 11:44:05','2025-09-10 11:44:05'),
(1397,'sens01',22.1,67.8,0,1,NULL,NULL,1,1,'2025-09-10 12:01:54','2025-09-10 12:01:54'),
(1398,'sens01',22.1,67.8,0,1,NULL,NULL,1,1,'2025-09-10 12:01:54','2025-09-10 12:01:54'),
(1399,'sens01',22.1,67.8,0,1,NULL,NULL,1,1,'2025-09-10 12:01:54','2025-09-10 12:01:54'),
(1400,'sens01',22.1,67.8,0,1,NULL,NULL,1,1,'2025-09-10 12:01:54','2025-09-10 12:01:54'),
(1401,'sens01',22.1,67.8,0,1,NULL,NULL,1,1,'2025-09-10 12:01:54','2025-09-10 12:01:54'),
(1402,'sens01',22.1,67.8,0,1,NULL,NULL,1,1,'2025-09-10 12:01:55','2025-09-10 12:01:55'),
(1403,'sens01',22.1,67.8,0,1,NULL,NULL,1,1,'2025-09-10 12:01:55','2025-09-10 12:01:55'),
(1404,'sens01',22.1,67.8,0,1,NULL,NULL,1,1,'2025-09-10 12:01:55','2025-09-10 12:01:55'),
(1405,'sens01',22.1,67.8,0,1,NULL,NULL,1,1,'2025-09-10 12:02:00','2025-09-10 12:02:00'),
(1506,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 15:40:25','2025-09-10 15:40:25'),
(1508,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 15:40:26','2025-09-10 15:40:26'),
(1509,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 15:40:26','2025-09-10 15:40:26'),
(1510,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 15:40:26','2025-09-10 15:40:26'),
(1511,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 15:40:26','2025-09-10 15:40:26'),
(1512,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 15:40:26','2025-09-10 15:40:26'),
(1513,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 15:40:27','2025-09-10 15:40:27'),
(1514,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 15:40:27','2025-09-10 15:40:27'),
(1515,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 15:43:57','2025-09-10 15:43:57'),
(1516,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 15:44:00','2025-09-10 15:44:00'),
(1517,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 15:46:59','2025-09-10 15:46:59'),
(1518,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 15:51:21','2025-09-10 15:51:21'),
(1519,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 15:51:21','2025-09-10 15:51:21'),
(1520,'sens01',22.3,66.9,0,1,NULL,NULL,1,1,'2025-09-10 15:55:46','2025-09-10 15:55:46'),
(1521,'sens01',22.3,66.9,0,1,NULL,NULL,1,1,'2025-09-10 15:55:46','2025-09-10 15:55:46'),
(1522,'sens01',22.3,66.9,0,1,NULL,NULL,1,1,'2025-09-10 15:56:00','2025-09-10 15:56:00'),
(1523,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 15:59:18','2025-09-10 15:59:18'),
(1524,'sens01',22.3,66.9,0,1,NULL,NULL,1,1,'2025-09-10 16:02:39','2025-09-10 16:02:39'),
(1525,'sens01',22.3,66.9,0,1,NULL,NULL,1,1,'2025-09-10 16:02:39','2025-09-10 16:02:39'),
(1526,'sens01',22.3,66.9,0,1,NULL,NULL,1,1,'2025-09-10 16:06:42','2025-09-10 16:06:42'),
(1527,'sens01',22.3,66.9,0,1,NULL,NULL,1,1,'2025-09-10 16:06:42','2025-09-10 16:06:42'),
(1528,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 16:10:59','2025-09-10 16:10:59'),
(1529,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 16:10:59','2025-09-10 16:10:59'),
(1530,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 16:14:00','2025-09-10 16:14:00'),
(1531,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 16:14:01','2025-09-10 16:14:01'),
(1532,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 16:18:11','2025-09-10 16:18:11'),
(1533,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 16:18:11','2025-09-10 16:18:11'),
(1534,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 16:21:11','2025-09-10 16:21:11'),
(1535,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 16:25:32','2025-09-10 16:25:32'),
(1536,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 16:25:32','2025-09-10 16:25:32'),
(1537,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 16:26:00','2025-09-10 16:26:00'),
(1538,'sens01',22.3,67.1,0,1,NULL,NULL,1,1,'2025-09-10 16:29:12','2025-09-10 16:29:12'),
(1539,'sens01',22.3,67.1,0,1,NULL,NULL,1,1,'2025-09-10 16:32:32','2025-09-10 16:32:32'),
(1540,'sens01',22.3,67.1,0,1,NULL,NULL,1,1,'2025-09-10 16:32:32','2025-09-10 16:32:32'),
(1541,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 16:36:03','2025-09-10 16:36:03'),
(1542,'sens01',22.3,67,0,1,NULL,NULL,1,1,'2025-09-10 16:36:03','2025-09-10 16:36:03'),
(1543,'sens01',22.3,67.1,0,1,NULL,NULL,1,1,'2025-09-10 16:40:35','2025-09-10 16:40:35'),
(1544,'sens01',22.3,67.1,0,1,NULL,NULL,1,1,'2025-09-10 16:40:35','2025-09-10 16:40:35'),
(1545,'sens01',22.2,67.2,0,1,NULL,NULL,1,1,'2025-09-10 16:45:34','2025-09-10 16:45:34'),
(1546,'sens01',22.2,67.2,0,1,NULL,NULL,1,1,'2025-09-10 16:45:34','2025-09-10 16:45:34'),
(1547,'sens01',22.2,67.2,0,1,NULL,NULL,1,1,'2025-09-10 16:46:00','2025-09-10 16:46:00'),
(1548,'sens01',22.2,67.2,0,1,NULL,NULL,1,1,'2025-09-10 16:48:10','2025-09-10 16:48:10'),
(1549,'sens01',22.2,67.2,0,1,NULL,NULL,1,1,'2025-09-10 16:52:00','2025-09-10 16:52:00'),
(1550,'sens01',22.2,67.2,0,1,NULL,NULL,1,1,'2025-09-10 16:52:00','2025-09-10 16:52:00'),
(1551,'sens01',22.2,67.3,0,1,NULL,NULL,1,1,'2025-09-10 16:56:19','2025-09-10 16:56:19'),
(1552,'sens01',22.2,67.3,0,1,NULL,NULL,1,1,'2025-09-10 16:56:19','2025-09-10 16:56:19'),
(1553,'sens01',22.2,67.3,0,1,NULL,NULL,1,1,'2025-09-10 17:00:09','2025-09-10 17:00:09'),
(1554,'sens01',22.2,67.3,0,1,NULL,NULL,1,1,'2025-09-10 17:00:09','2025-09-10 17:00:09'),
(1555,'sens01',22.2,67.3,0,1,NULL,NULL,1,1,'2025-09-10 17:04:30','2025-09-10 17:04:30'),
(1556,'sens01',22.2,67.3,0,1,NULL,NULL,1,1,'2025-09-10 17:04:30','2025-09-10 17:04:30'),
(1557,'sens01',22.2,67.4,0,1,NULL,NULL,1,1,'2025-09-10 17:08:49','2025-09-10 17:08:49'),
(1558,'sens01',22.2,67.4,0,1,NULL,NULL,1,1,'2025-09-10 17:08:50','2025-09-10 17:08:50'),
(1559,'sens01',22.2,67.4,0,1,NULL,NULL,1,1,'2025-09-10 17:12:55','2025-09-10 17:12:55'),
(1560,'sens01',22.2,67.4,0,1,NULL,NULL,1,1,'2025-09-10 17:12:55','2025-09-10 17:12:55'),
(1561,'sens01',22.2,67.4,0,1,NULL,NULL,1,1,'2025-09-10 17:17:14','2025-09-10 17:17:14'),
(1562,'sens01',22.2,67.4,0,1,NULL,NULL,1,1,'2025-09-10 17:17:14','2025-09-10 17:17:14'),
(1563,'sens01',22.2,67.4,0,1,NULL,NULL,1,1,'2025-09-10 17:21:47','2025-09-10 17:21:47'),
(1564,'sens01',22.2,67.4,0,1,NULL,NULL,1,1,'2025-09-10 17:21:47','2025-09-10 17:21:47'),
(1565,'sens01',22.2,67.4,0,1,NULL,NULL,1,1,'2025-09-10 17:22:00','2025-09-10 17:22:00'),
(1566,'sens01',22.2,67.4,0,1,NULL,NULL,1,1,'2025-09-10 17:25:17','2025-09-10 17:25:17'),
(1567,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 17:28:49','2025-09-10 17:28:49'),
(1568,'sens01',22.1,67.4,0,1,NULL,NULL,1,1,'2025-09-10 17:28:49','2025-09-10 17:28:49'),
(1569,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 17:48:11','2025-09-10 17:48:11'),
(1570,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 17:48:11','2025-09-10 17:48:11'),
(1571,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 17:48:11','2025-09-10 17:48:11'),
(1572,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 17:48:11','2025-09-10 17:48:11'),
(1573,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 17:48:11','2025-09-10 17:48:11'),
(1574,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 17:48:12','2025-09-10 17:48:12'),
(1575,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 17:48:12','2025-09-10 17:48:12'),
(1576,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 17:48:12','2025-09-10 17:48:12'),
(1577,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 17:48:12','2025-09-10 17:48:12'),
(1578,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 17:48:12','2025-09-10 17:48:12'),
(1579,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 18:24:14','2025-09-10 18:24:14'),
(1580,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 18:24:14','2025-09-10 18:24:14'),
(1581,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 18:24:14','2025-09-10 18:24:14'),
(1582,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 18:24:14','2025-09-10 18:24:14'),
(1583,'sens01',22.1,67.5,0,1,NULL,NULL,1,1,'2025-09-10 18:24:14','2025-09-10 18:24:14'),
(1584,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 18:24:15','2025-09-10 18:24:15'),
(1585,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 18:24:15','2025-09-10 18:24:15'),
(1586,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 18:24:15','2025-09-10 18:24:15'),
(1587,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 18:24:15','2025-09-10 18:24:15'),
(1588,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 18:24:15','2025-09-10 18:24:15'),
(1589,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 18:24:16','2025-09-10 18:24:16'),
(1590,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 18:24:16','2025-09-10 18:24:16'),
(1591,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 18:24:16','2025-09-10 18:24:16'),
(1592,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 18:24:16','2025-09-10 18:24:16'),
(1593,'sens01',22.1,67.6,0,1,NULL,NULL,1,1,'2025-09-10 18:24:16','2025-09-10 18:24:16'),
(1602,'sens01',22.1,67.8,0,1,NULL,NULL,1,1,'2025-09-10 18:42:01','2025-09-10 18:42:01'),
(1627,'sens01',22,67.9,0,1,NULL,NULL,1,1,'2025-09-10 19:41:52','2025-09-10 19:41:52'),
(1628,'sens01',22,67.9,0,1,NULL,NULL,1,1,'2025-09-10 19:41:52','2025-09-10 19:41:52'),
(1629,'sens01',22,67.9,0,1,NULL,NULL,1,1,'2025-09-10 19:41:52','2025-09-10 19:41:52'),
(1630,'sens01',22,67.9,0,1,NULL,NULL,1,1,'2025-09-10 19:41:52','2025-09-10 19:41:52'),
(1631,'sens01',22,67.9,0,1,NULL,NULL,1,1,'2025-09-10 19:41:52','2025-09-10 19:41:52'),
(1632,'sens01',22,67.9,0,1,NULL,NULL,1,1,'2025-09-10 19:41:53','2025-09-10 19:41:53'),
(1633,'sens01',22,67.9,0,1,NULL,NULL,1,1,'2025-09-10 19:41:53','2025-09-10 19:41:53'),
(1634,'sens01',22,67.9,0,1,NULL,NULL,1,1,'2025-09-10 19:41:53','2025-09-10 19:41:53'),
(1635,'sens01',22,67.9,0,1,NULL,NULL,1,1,'2025-09-10 19:42:00','2025-09-10 19:42:00'),
(1636,'sens01',22,67.9,0,1,NULL,NULL,1,1,'2025-09-10 19:50:22','2025-09-10 19:50:22'),
(1637,'sens01',22,67.9,0,1,NULL,NULL,1,1,'2025-09-10 19:50:22','2025-09-10 19:50:22'),
(1638,'sens01',22,67.9,0,1,NULL,NULL,1,1,'2025-09-10 19:50:22','2025-09-10 19:50:22'),
(1639,'sens01',22,67.9,0,1,NULL,NULL,1,1,'2025-09-10 19:50:22','2025-09-10 19:50:22'),
(1649,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:25:00','2025-09-10 20:25:00'),
(1650,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:25:00','2025-09-10 20:25:00'),
(1651,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:25:00','2025-09-10 20:25:00'),
(1652,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:25:00','2025-09-10 20:25:00'),
(1653,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:25:00','2025-09-10 20:25:00'),
(1654,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:25:01','2025-09-10 20:25:01'),
(1655,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:25:01','2025-09-10 20:25:01'),
(1656,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:25:01','2025-09-10 20:25:01'),
(1657,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:44:13','2025-09-10 20:44:13'),
(1658,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:44:13','2025-09-10 20:44:13'),
(1659,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:44:13','2025-09-10 20:44:13'),
(1660,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:44:13','2025-09-10 20:44:13'),
(1661,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:44:13','2025-09-10 20:44:13'),
(1662,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:44:14','2025-09-10 20:44:14'),
(1663,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:44:14','2025-09-10 20:44:14'),
(1664,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:44:14','2025-09-10 20:44:14'),
(1665,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:44:14','2025-09-10 20:44:14'),
(1666,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:44:14','2025-09-10 20:44:14'),
(1667,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:51:30','2025-09-10 20:51:30'),
(1668,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:51:30','2025-09-10 20:51:30'),
(1669,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 20:51:30','2025-09-10 20:51:30'),
(1670,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 21:09:55','2025-09-10 21:09:55'),
(1671,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 21:09:55','2025-09-10 21:09:55'),
(1672,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 21:09:55','2025-09-10 21:09:55'),
(1673,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 21:09:55','2025-09-10 21:09:55'),
(1674,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 21:09:55','2025-09-10 21:09:55'),
(1675,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 21:09:56','2025-09-10 21:09:56'),
(1676,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 21:09:56','2025-09-10 21:09:56'),
(1677,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 21:09:56','2025-09-10 21:09:56'),
(1678,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 21:09:56','2025-09-10 21:09:56'),
(1679,'sens01',21.9,67.7,0,1,NULL,NULL,1,1,'2025-09-10 21:10:00','2025-09-10 21:10:00'),
(1680,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 21:29:28','2025-09-10 21:29:28'),
(1681,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 21:29:28','2025-09-10 21:29:28'),
(1682,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 21:29:28','2025-09-10 21:29:28'),
(1683,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 21:29:29','2025-09-10 21:29:29'),
(1684,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 21:29:29','2025-09-10 21:29:29'),
(1685,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 21:29:29','2025-09-10 21:29:29'),
(1686,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 21:29:29','2025-09-10 21:29:29'),
(1687,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 21:29:29','2025-09-10 21:29:29'),
(1688,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 21:29:30','2025-09-10 21:29:30'),
(1689,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 21:30:00','2025-09-10 21:30:00'),
(1699,'sens01',21.8,67.5,0,1,NULL,NULL,1,1,'2025-09-10 21:52:15','2025-09-10 21:52:15'),
(1700,'sens01',21.8,67.5,0,1,NULL,NULL,1,1,'2025-09-10 21:52:15','2025-09-10 21:52:15'),
(1701,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 22:09:47','2025-09-10 22:09:47'),
(1702,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 22:09:47','2025-09-10 22:09:47'),
(1703,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 22:09:47','2025-09-10 22:09:47'),
(1704,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 22:09:47','2025-09-10 22:09:47'),
(1705,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 22:09:47','2025-09-10 22:09:47'),
(1706,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 22:09:48','2025-09-10 22:09:48'),
(1707,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 22:09:48','2025-09-10 22:09:48'),
(1708,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 22:09:48','2025-09-10 22:09:48'),
(1709,'sens01',21.8,67.6,0,1,NULL,NULL,1,1,'2025-09-10 22:10:00','2025-09-10 22:10:00'),
(1719,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 22:47:39','2025-09-10 22:47:39'),
(1720,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 22:47:39','2025-09-10 22:47:39'),
(1721,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 22:47:39','2025-09-10 22:47:39'),
(1722,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 22:47:39','2025-09-10 22:47:39'),
(1723,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 22:47:39','2025-09-10 22:47:39'),
(1724,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 22:47:40','2025-09-10 22:47:40'),
(1725,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 22:47:40','2025-09-10 22:47:40'),
(1726,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 22:47:40','2025-09-10 22:47:40'),
(1727,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 22:47:40','2025-09-10 22:47:40'),
(1728,'sens01',21.8,67.7,0,1,NULL,NULL,1,1,'2025-09-10 22:48:00','2025-09-10 22:48:00'),
(1729,'sens01',21.7,67.6,0,1,NULL,NULL,1,1,'2025-09-10 22:53:22','2025-09-10 22:53:22'),
(1730,'sens01',21.7,67.6,0,1,NULL,NULL,1,1,'2025-09-10 22:53:22','2025-09-10 22:53:22'),
(1740,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:12:00','2025-09-10 23:12:00'),
(1741,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:28:40','2025-09-10 23:28:40'),
(1742,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:28:40','2025-09-10 23:28:40'),
(1743,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:28:41','2025-09-10 23:28:41'),
(1744,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:28:41','2025-09-10 23:28:41'),
(1745,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:28:41','2025-09-10 23:28:41'),
(1746,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:28:43','2025-09-10 23:28:43'),
(1747,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:28:43','2025-09-10 23:28:43'),
(1748,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:28:43','2025-09-10 23:28:43'),
(1749,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:46:21','2025-09-10 23:46:21'),
(1750,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:46:21','2025-09-10 23:46:21'),
(1751,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:46:21','2025-09-10 23:46:21'),
(1752,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:46:22','2025-09-10 23:46:22'),
(1753,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:46:22','2025-09-10 23:46:22'),
(1754,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:46:22','2025-09-10 23:46:22'),
(1755,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:46:22','2025-09-10 23:46:22'),
(1756,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:46:22','2025-09-10 23:46:22'),
(1757,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:46:22','2025-09-10 23:46:22'),
(1758,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:54:32','2025-09-10 23:54:32'),
(1759,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:54:32','2025-09-10 23:54:32'),
(1760,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:54:32','2025-09-10 23:54:32'),
(1761,'sens01',21.7,67.5,0,1,NULL,NULL,1,1,'2025-09-10 23:54:32','2025-09-10 23:54:32'),
(1762,'sens01',21.7,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:11:40','2025-09-11 00:11:40'),
(1763,'sens01',21.7,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:11:40','2025-09-11 00:11:40'),
(1764,'sens01',21.7,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:11:40','2025-09-11 00:11:40'),
(1765,'sens01',21.7,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:11:40','2025-09-11 00:11:40'),
(1766,'sens01',21.7,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:11:40','2025-09-11 00:11:40'),
(1767,'sens01',21.7,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:11:41','2025-09-11 00:11:41'),
(1768,'sens01',21.7,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:11:41','2025-09-11 00:11:41'),
(1769,'sens01',21.7,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:11:41','2025-09-11 00:11:41'),
(1770,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:12:00','2025-09-11 00:12:00'),
(1771,'sens01',21.6,67.5,0,1,NULL,NULL,1,1,'2025-09-11 00:30:22','2025-09-11 00:30:22'),
(1772,'sens01',21.6,67.5,0,1,NULL,NULL,1,1,'2025-09-11 00:30:22','2025-09-11 00:30:22'),
(1773,'sens01',21.6,67.5,0,1,NULL,NULL,1,1,'2025-09-11 00:30:22','2025-09-11 00:30:22'),
(1774,'sens01',21.6,67.5,0,1,NULL,NULL,1,1,'2025-09-11 00:30:22','2025-09-11 00:30:22'),
(1775,'sens01',21.6,67.5,0,1,NULL,NULL,1,1,'2025-09-11 00:30:22','2025-09-11 00:30:22'),
(1776,'sens01',21.6,67.5,0,1,NULL,NULL,1,1,'2025-09-11 00:30:23','2025-09-11 00:30:23'),
(1777,'sens01',21.6,67.5,0,1,NULL,NULL,1,1,'2025-09-11 00:30:23','2025-09-11 00:30:23'),
(1778,'sens01',21.6,67.5,0,1,NULL,NULL,1,1,'2025-09-11 00:30:23','2025-09-11 00:30:23'),
(1779,'sens01',21.6,67.5,0,1,NULL,NULL,1,1,'2025-09-11 00:30:23','2025-09-11 00:30:23'),
(1780,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:49:03','2025-09-11 00:49:03'),
(1781,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:49:03','2025-09-11 00:49:03'),
(1782,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:49:03','2025-09-11 00:49:03'),
(1783,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:49:03','2025-09-11 00:49:03'),
(1784,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:49:03','2025-09-11 00:49:03'),
(1785,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:49:04','2025-09-11 00:49:04'),
(1786,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:49:04','2025-09-11 00:49:04'),
(1787,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:49:04','2025-09-11 00:49:04'),
(1788,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:49:04','2025-09-11 00:49:04'),
(1789,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:55:08','2025-09-11 00:55:08'),
(1790,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:55:08','2025-09-11 00:55:08'),
(1791,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:55:08','2025-09-11 00:55:08'),
(1792,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:58:37','2025-09-11 00:58:37'),
(1793,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 00:58:38','2025-09-11 00:58:38'),
(1794,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:17:45','2025-09-11 01:17:45'),
(1795,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:17:45','2025-09-11 01:17:45'),
(1796,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:17:45','2025-09-11 01:17:45'),
(1797,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:17:45','2025-09-11 01:17:45'),
(1798,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:17:45','2025-09-11 01:17:45'),
(1799,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:17:46','2025-09-11 01:17:46'),
(1800,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:17:46','2025-09-11 01:17:46'),
(1801,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:17:46','2025-09-11 01:17:46'),
(1802,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:17:46','2025-09-11 01:17:46'),
(1803,'sens01',21.6,67.3,0,1,NULL,NULL,1,1,'2025-09-11 01:18:00','2025-09-11 01:18:00'),
(1804,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:36:57','2025-09-11 01:36:57'),
(1805,'sens01',21.6,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:36:57','2025-09-11 01:36:57'),
(1806,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:36:57','2025-09-11 01:36:57'),
(1807,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:36:57','2025-09-11 01:36:57'),
(1808,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:36:57','2025-09-11 01:36:57'),
(1809,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:36:58','2025-09-11 01:36:58'),
(1810,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:36:58','2025-09-11 01:36:58'),
(1811,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:36:58','2025-09-11 01:36:58'),
(1812,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 01:36:58','2025-09-11 01:36:58'),
(1822,'sens01',21.5,67.3,0,1,NULL,NULL,1,1,'2025-09-11 01:56:19','2025-09-11 01:56:19'),
(1823,'sens01',21.5,67.3,0,1,NULL,NULL,1,1,'2025-09-11 02:13:36','2025-09-11 02:13:36'),
(1824,'sens01',21.5,67.3,0,1,NULL,NULL,1,1,'2025-09-11 02:13:37','2025-09-11 02:13:37'),
(1825,'sens01',21.5,67.3,0,1,NULL,NULL,1,1,'2025-09-11 02:13:37','2025-09-11 02:13:37'),
(1826,'sens01',21.5,67.3,0,1,NULL,NULL,1,1,'2025-09-11 02:13:37','2025-09-11 02:13:37'),
(1827,'sens01',21.5,67.3,0,1,NULL,NULL,1,1,'2025-09-11 02:13:37','2025-09-11 02:13:37'),
(1828,'sens01',21.5,67.3,0,1,NULL,NULL,1,1,'2025-09-11 02:13:37','2025-09-11 02:13:37'),
(1829,'sens01',21.5,67.3,0,1,NULL,NULL,1,1,'2025-09-11 02:13:37','2025-09-11 02:13:37'),
(1830,'sens01',21.5,67.3,0,1,NULL,NULL,1,1,'2025-09-11 02:13:38','2025-09-11 02:13:38'),
(1831,'sens01',21.5,67.3,0,1,NULL,NULL,1,1,'2025-09-11 02:14:00','2025-09-11 02:14:00'),
(1840,'sens01',21.5,67.3,0,1,NULL,NULL,1,1,'2025-09-11 02:47:27','2025-09-11 02:47:27'),
(1841,'sens01',21.5,67.3,0,1,NULL,NULL,1,1,'2025-09-11 02:47:27','2025-09-11 02:47:27'),
(1842,'sens01',21.5,67.3,0,1,NULL,NULL,1,1,'2025-09-11 02:47:27','2025-09-11 02:47:27'),
(1843,'sens01',21.5,67.3,0,1,NULL,NULL,1,1,'2025-09-11 02:47:27','2025-09-11 02:47:27'),
(1844,'sens01',21.5,67.3,0,1,NULL,NULL,1,1,'2025-09-11 02:47:27','2025-09-11 02:47:27'),
(1845,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 02:47:28','2025-09-11 02:47:28'),
(1846,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 02:47:28','2025-09-11 02:47:28'),
(1847,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 02:47:28','2025-09-11 02:47:28'),
(1848,'sens01',21.5,67.3,0,1,NULL,NULL,1,1,'2025-09-11 02:48:00','2025-09-11 02:48:00'),
(1862,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 03:16:00','2025-09-11 03:16:00'),
(1871,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 03:50:57','2025-09-11 03:50:57'),
(1872,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 03:50:57','2025-09-11 03:50:57'),
(1873,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 03:50:57','2025-09-11 03:50:57'),
(1874,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 03:50:57','2025-09-11 03:50:57'),
(1875,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 03:50:58','2025-09-11 03:50:58'),
(1876,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 03:50:58','2025-09-11 03:50:58'),
(1877,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 03:50:58','2025-09-11 03:50:58'),
(1878,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 03:50:58','2025-09-11 03:50:58'),
(1879,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 03:50:58','2025-09-11 03:50:58'),
(1880,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 03:58:28','2025-09-11 03:58:28'),
(1881,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 03:58:28','2025-09-11 03:58:28'),
(1882,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 03:58:28','2025-09-11 03:58:28'),
(1883,'sens01',21.5,67.4,0,1,NULL,NULL,1,1,'2025-09-11 03:58:28','2025-09-11 03:58:28'),
(1902,'sens01',21.4,67.3,0,1,NULL,NULL,1,1,'2025-09-11 04:36:00','2025-09-11 04:36:00'),
(1903,'sens01',21.4,67.3,0,1,NULL,NULL,1,1,'2025-09-11 04:53:06','2025-09-11 04:53:06'),
(1904,'sens01',21.4,67.3,0,1,NULL,NULL,1,1,'2025-09-11 04:53:06','2025-09-11 04:53:06'),
(1905,'sens01',21.4,67.3,0,1,NULL,NULL,1,1,'2025-09-11 04:53:06','2025-09-11 04:53:06'),
(1906,'sens01',21.4,67.3,0,1,NULL,NULL,1,1,'2025-09-11 04:53:06','2025-09-11 04:53:06'),
(1907,'sens01',21.4,67.3,0,1,NULL,NULL,1,1,'2025-09-11 04:53:06','2025-09-11 04:53:06'),
(1908,'sens01',21.4,67.3,0,1,NULL,NULL,1,1,'2025-09-11 04:53:07','2025-09-11 04:53:07'),
(1909,'sens01',21.4,67.3,0,1,NULL,NULL,1,1,'2025-09-11 04:53:07','2025-09-11 04:53:07'),
(1910,'sens01',21.4,67.3,0,1,NULL,NULL,1,1,'2025-09-11 04:53:07','2025-09-11 04:53:07'),
(1911,'sens01',21.4,67.3,0,1,NULL,NULL,1,1,'2025-09-11 04:59:23','2025-09-11 04:59:23'),
(1912,'sens01',21.4,67.3,0,1,NULL,NULL,1,1,'2025-09-11 04:59:23','2025-09-11 04:59:23'),
(1913,'sens01',21.4,67.3,0,1,NULL,NULL,1,1,'2025-09-11 04:59:23','2025-09-11 04:59:23'),
(1923,'sens01',21.3,67.3,0,1,NULL,NULL,1,1,'2025-09-11 05:18:00','2025-09-11 05:18:00'),
(1924,'sens01',21.4,67.2,0,1,NULL,NULL,1,1,'2025-09-11 05:36:15','2025-09-11 05:36:15'),
(1925,'sens01',21.4,67.2,0,1,NULL,NULL,1,1,'2025-09-11 05:36:15','2025-09-11 05:36:15'),
(1926,'sens01',21.4,67.2,0,1,NULL,NULL,1,1,'2025-09-11 05:36:15','2025-09-11 05:36:15'),
(1927,'sens01',21.4,67.2,0,1,NULL,NULL,1,1,'2025-09-11 05:36:15','2025-09-11 05:36:15'),
(1928,'sens01',21.4,67.2,0,1,NULL,NULL,1,1,'2025-09-11 05:36:15','2025-09-11 05:36:15'),
(1929,'sens01',21.4,67.2,0,1,NULL,NULL,1,1,'2025-09-11 05:36:16','2025-09-11 05:36:16'),
(1930,'sens01',21.4,67.2,0,1,NULL,NULL,1,1,'2025-09-11 05:36:16','2025-09-11 05:36:16'),
(1931,'sens01',21.4,67.2,0,1,NULL,NULL,1,1,'2025-09-11 05:36:16','2025-09-11 05:36:16'),
(1932,'sens01',21.4,67.2,0,1,NULL,NULL,1,1,'2025-09-11 05:36:16','2025-09-11 05:36:16'),
(1933,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 05:55:13','2025-09-11 05:55:13'),
(1934,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 05:55:13','2025-09-11 05:55:13'),
(1935,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 05:55:13','2025-09-11 05:55:13'),
(1936,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 05:55:13','2025-09-11 05:55:13'),
(1937,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 05:55:13','2025-09-11 05:55:13'),
(1938,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 05:55:14','2025-09-11 05:55:14'),
(1939,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 05:55:14','2025-09-11 05:55:14'),
(1940,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 05:55:14','2025-09-11 05:55:14'),
(1941,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 05:55:14','2025-09-11 05:55:14'),
(1942,'sens01',21.4,67.2,0,1,NULL,NULL,1,1,'2025-09-11 06:00:24','2025-09-11 06:00:24'),
(1943,'sens01',21.4,67.2,0,1,NULL,NULL,1,1,'2025-09-11 06:00:24','2025-09-11 06:00:24'),
(1944,'sens01',21.4,67.2,0,1,NULL,NULL,1,1,'2025-09-11 06:00:24','2025-09-11 06:00:24'),
(1945,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 06:18:24','2025-09-11 06:18:24'),
(1946,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 06:18:24','2025-09-11 06:18:24'),
(1947,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 06:18:24','2025-09-11 06:18:24'),
(1948,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 06:18:24','2025-09-11 06:18:24'),
(1949,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 06:18:24','2025-09-11 06:18:24'),
(1950,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 06:18:25','2025-09-11 06:18:25'),
(1951,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 06:18:25','2025-09-11 06:18:25'),
(1952,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 06:18:25','2025-09-11 06:18:25'),
(1953,'sens01',21.4,67.1,0,1,NULL,NULL,1,1,'2025-09-11 06:18:25','2025-09-11 06:18:25'),
(1963,'sens01',21.5,69.2,0,1,NULL,NULL,1,1,'2025-09-11 06:38:00','2025-09-11 06:38:00'),
(2216,'sens01',22.9,66,0,1,NULL,NULL,1,1,'2025-09-17 10:00:49','2025-09-17 10:00:49'),
(2217,'sens01',22.9,66,0,1,NULL,NULL,1,1,'2025-09-17 10:00:53','2025-09-17 10:00:53'),
(2219,'sens01',22.9,66,0,1,NULL,NULL,1,1,'2025-09-17 10:02:00','2025-09-17 10:02:00'),
(2220,'sens01',22.9,66,0,1,NULL,NULL,1,1,'2025-09-17 10:04:00','2025-09-17 10:04:00'),
(2221,'sens01',22.9,65.9,0,1,NULL,NULL,1,1,'2025-09-17 10:06:00','2025-09-17 10:06:00'),
(2222,'sens01',22.9,66.1,0,1,NULL,NULL,1,1,'2025-09-17 10:08:00','2025-09-17 10:08:00'),
(2223,'sens01',22.8,66,0,1,NULL,NULL,1,1,'2025-09-17 10:10:00','2025-09-17 10:10:00'),
(2224,'sens01',22.8,65,0,1,NULL,NULL,1,1,'2025-09-17 10:12:00','2025-09-17 10:12:00'),
(2225,'sens01',22.8,64.8,0,1,NULL,NULL,1,1,'2025-09-17 10:14:00','2025-09-17 10:14:00'),
(2226,'sens01',22.9,64.2,0,1,NULL,NULL,1,1,'2025-09-17 10:16:00','2025-09-17 10:16:00'),
(2227,'sens01',23,63.9,0,1,NULL,NULL,1,1,'2025-09-17 10:18:00','2025-09-17 10:18:00'),
(2228,'sens01',23,64.1,0,1,NULL,NULL,1,1,'2025-09-17 10:20:00','2025-09-17 10:20:00'),
(2229,'sens01',23,64,0,1,NULL,NULL,1,1,'2025-09-17 10:22:00','2025-09-17 10:22:00'),
(2230,'sens01',23,64.1,0,1,NULL,NULL,1,1,'2025-09-17 10:24:00','2025-09-17 10:24:00'),
(2231,'sens01',23,64,0,1,NULL,NULL,1,1,'2025-09-17 10:25:42','2025-09-17 10:25:42'),
(2233,'sens01',23,64,0,1,NULL,NULL,1,1,'2025-09-17 10:26:00','2025-09-17 10:26:00'),
(2234,'sens01',23.1,63.9,0,1,NULL,NULL,1,1,'2025-09-17 10:26:44','2025-09-17 10:26:44'),
(2236,'sens01',23.1,64,0,1,NULL,NULL,1,1,'2025-09-17 10:28:00','2025-09-17 10:28:00'),
(2237,'sens01',23,63.9,0,1,NULL,NULL,1,1,'2025-09-17 10:28:05','2025-09-17 10:28:05'),
(2239,'sens01',23,64,0,1,NULL,NULL,1,1,'2025-09-17 10:28:59','2025-09-17 10:28:59'),
(2240,'sens01',23.1,64.1,0,1,NULL,NULL,1,1,'2025-09-17 10:29:03','2025-09-17 10:29:03'),
(2242,'sens01',23.1,64.1,0,1,NULL,NULL,1,1,'2025-09-17 10:29:58','2025-09-17 10:29:58'),
(2245,'sens01',23.1,64.1,0,1,NULL,NULL,1,1,'2025-09-17 10:30:36','2025-09-17 10:30:36'),
(2247,'sens01',23.1,64,0,1,NULL,NULL,1,1,'2025-09-17 10:32:00','2025-09-17 10:32:00'),
(2248,'sens01',23.1,64,0,1,NULL,NULL,1,1,'2025-09-17 10:34:00','2025-09-17 10:34:00'),
(2249,'sens01',23.1,64.1,0,1,NULL,NULL,1,1,'2025-09-17 10:36:00','2025-09-17 10:36:00'),
(2250,'sens01',23.1,64.1,0,1,NULL,NULL,1,1,'2025-09-17 10:38:00','2025-09-17 10:38:00'),
(2251,'sens01',23.1,64.1,0,1,NULL,NULL,1,1,'2025-09-17 10:38:49','2025-09-17 10:38:49'),
(2253,'sens01',23.1,64.2,0,1,NULL,NULL,1,1,'2025-09-17 10:40:00','2025-09-17 10:40:00'),
(2254,'sens01',23.1,64.1,0,1,NULL,NULL,1,1,'2025-09-17 10:41:08','2025-09-17 10:41:08'),
(2256,'sens01',23,64.4,0,1,NULL,NULL,1,1,'2025-09-17 10:50:00','2025-09-17 10:50:00'),
(2257,'sens01',23,64.5,0,1,NULL,NULL,1,1,'2025-09-17 11:00:00','2025-09-17 11:00:00'),
(2258,'sens01',23.1,64.4,0,1,NULL,NULL,1,1,'2025-09-17 11:10:00','2025-09-17 11:10:00'),
(2259,'sens01',23,64.7,0,1,NULL,NULL,1,1,'2025-09-17 11:18:25','2025-09-17 11:18:25'),
(2260,'sens01',23,64.7,0,1,NULL,NULL,1,1,'2025-09-17 11:18:32','2025-09-17 11:18:32'),
(2262,'sens01',23,64.6,0,1,NULL,NULL,1,1,'2025-09-17 11:19:45','2025-09-17 11:19:45'),
(2264,'sens01',23,64.6,0,1,NULL,NULL,1,1,'2025-09-17 11:20:00','2025-09-17 11:20:00'),
(2265,'sens01',23,64.5,0,1,NULL,NULL,1,1,'2025-09-17 11:22:49','2025-09-17 11:22:49'),
(2267,'sens01',23,64.6,0,1,NULL,NULL,1,1,'2025-09-17 11:23:44','2025-09-17 11:23:44'),
(2269,'sens01',23.1,64.5,0,1,NULL,NULL,1,1,'2025-09-17 11:29:44','2025-09-17 11:29:44'),
(2271,'sens01',23,64.5,0,1,NULL,NULL,1,1,'2025-09-17 11:30:00','2025-09-17 11:30:00'),
(2272,'sens01',22.9,64.2,0,1,NULL,NULL,1,1,'2025-09-17 11:40:00','2025-09-17 11:40:00'),
(2273,'sens01',22.9,64.9,0,1,NULL,NULL,1,1,'2025-09-17 11:54:27','2025-09-17 11:54:27'),
(2296,'sens01',23.5,66.6,0,1,NULL,NULL,1,1,'2025-09-20 09:20:16','2025-09-20 09:20:16'),
(2298,'sens01',23.5,66.6,0,1,NULL,NULL,1,1,'2025-09-20 09:29:45','2025-09-20 09:29:45'),
(2300,'sens01',23.5,66.6,0,1,NULL,NULL,1,1,'2025-09-20 09:30:00','2025-09-20 09:30:00'),
(2301,'sens01',23.6,66.5,0,1,NULL,NULL,1,1,'2025-09-20 09:40:00','2025-09-20 09:40:00'),
(2302,'sens01',23.7,66.3,0,1,NULL,NULL,1,1,'2025-09-20 09:45:57','2025-09-20 09:45:57'),
(2304,'sens01',23.7,66.3,0,1,NULL,NULL,1,1,'2025-09-20 09:47:16','2025-09-20 09:47:16'),
(2305,'sens01',23.7,66.2,0,1,NULL,NULL,1,1,'2025-09-20 09:48:01','2025-09-20 09:48:01'),
(2306,'sens01',23.7,66.2,0,1,NULL,NULL,1,1,'2025-09-20 09:48:42','2025-09-20 09:48:42'),
(2307,'sens01',23.7,66.3,0,1,NULL,NULL,1,1,'2025-09-20 09:49:15','2025-09-20 09:49:15'),
(2308,'sens01',23.7,66.3,0,1,NULL,NULL,1,1,'2025-09-20 09:50:09','2025-09-20 09:50:09'),
(2309,'sens01',23.7,66.3,0,1,NULL,NULL,1,1,'2025-09-20 09:50:54','2025-09-20 09:50:54'),
(2311,'sens01',23.7,66.4,0,1,NULL,NULL,1,1,'2025-09-20 09:54:19','2025-09-20 09:54:19'),
(2313,'sens01',23.7,66.2,0,1,NULL,NULL,1,1,'2025-09-20 09:56:58','2025-09-20 09:56:58'),
(2315,'sens01',23.7,66.2,0,1,NULL,NULL,1,1,'2025-09-20 09:57:50','2025-09-20 09:57:50'),
(2317,'sens01',23.7,66.2,0,1,NULL,NULL,1,1,'2025-09-20 10:00:00','2025-09-20 10:00:00'),
(2318,'sens01',23.8,66.3,0,1,NULL,NULL,1,1,'2025-09-20 10:06:58','2025-09-20 10:06:58'),
(2320,'sens01',23.8,66.1,0,1,NULL,NULL,1,1,'2025-09-20 10:10:00','2025-09-20 10:10:00'),
(2321,'sens01',23.8,66.3,0,1,NULL,NULL,1,1,'2025-09-20 10:15:44','2025-09-20 10:15:44'),
(2323,'sens01',23.8,66.3,0,1,NULL,NULL,1,1,'2025-09-20 10:20:00','2025-09-20 10:20:00'),
(2324,'sens01',23.8,66.3,0,1,NULL,NULL,1,1,'2025-09-20 10:25:44','2025-09-20 10:25:44'),
(2325,'sens01',23.8,66.3,0,1,NULL,NULL,1,1,'2025-09-20 10:27:29','2025-09-20 10:27:29'),
(2326,'sens01',23.8,66.2,0,1,NULL,NULL,1,1,'2025-09-20 10:27:54','2025-09-20 10:27:54'),
(2328,'sens01',23.8,66.1,0,1,NULL,NULL,1,1,'2025-09-20 10:30:00','2025-09-20 10:30:00'),
(2329,'sens01',23.9,66.1,0,1,NULL,NULL,1,1,'2025-09-20 10:40:00','2025-09-20 10:40:00'),
(2330,'sens01',23.8,66.4,0,1,NULL,NULL,1,1,'2025-09-20 10:50:00','2025-09-20 10:50:00'),
(2331,'sens01',24,65.9,0,1,NULL,NULL,1,1,'2025-09-20 11:00:00','2025-09-20 11:00:00'),
(2332,'sens01',24,65.8,0,1,NULL,NULL,1,1,'2025-09-20 11:10:00','2025-09-20 11:10:00'),
(2333,'sens01',24.2,65.6,0,1,NULL,NULL,1,1,'2025-09-20 11:20:00','2025-09-20 11:20:00'),
(2334,'sens01',24.2,65.6,0,1,NULL,NULL,1,1,'2025-09-20 11:30:00','2025-09-20 11:30:00'),
(2335,'sens01',24.2,65.5,0,1,NULL,NULL,1,1,'2025-09-20 11:40:00','2025-09-20 11:40:00'),
(2336,'sens01',24.2,65.6,0,1,NULL,NULL,1,1,'2025-09-20 11:45:57','2025-09-20 11:45:57'),
(2338,'sens01',24.3,65.4,0,1,NULL,NULL,1,1,'2025-09-20 11:50:00','2025-09-20 11:50:00'),
(2339,'sens01',24.2,65.6,0,1,NULL,NULL,1,1,'2025-09-20 12:00:00','2025-09-20 12:00:00'),
(2340,'sens01',24.2,65.6,0,1,NULL,NULL,1,1,'2025-09-20 12:10:00','2025-09-20 12:10:00'),
(2341,'sens01',24.3,65.4,0,1,NULL,NULL,1,1,'2025-09-20 12:20:00','2025-09-20 12:20:00'),
(2342,'sens01',24.3,65.2,0,1,NULL,NULL,1,1,'2025-09-20 12:30:00','2025-09-20 12:30:00'),
(2343,'sens01',24.3,65.1,0,1,NULL,NULL,1,1,'2025-09-20 12:40:00','2025-09-20 12:40:00'),
(2344,'sens01',24.3,65.1,0,1,NULL,NULL,1,1,'2025-09-20 12:50:00','2025-09-20 12:50:00'),
(2345,'sens01',24.3,64.9,0,1,NULL,NULL,1,1,'2025-09-20 13:00:00','2025-09-20 13:00:00'),
(2346,'sens01',24.4,64.7,0,1,NULL,NULL,1,1,'2025-09-20 13:10:00','2025-09-20 13:10:00'),
(2347,'sens01',24.4,64.8,0,1,NULL,NULL,1,1,'2025-09-20 13:20:00','2025-09-20 13:20:00'),
(2348,'sens01',24.4,64.9,0,1,NULL,NULL,1,1,'2025-09-20 13:30:04','2025-09-20 13:30:04'),
(2349,'sens01',24.4,64.8,0,1,NULL,NULL,1,1,'2025-09-20 13:40:00','2025-09-20 13:40:00'),
(2350,'sens01',24.4,65,0,1,NULL,NULL,1,1,'2025-09-20 13:50:00','2025-09-20 13:50:00'),
(2351,'sens01',24.4,64.9,0,1,NULL,NULL,1,1,'2025-09-20 14:00:00','2025-09-20 14:00:00'),
(2352,'sens01',24.4,64.8,0,1,NULL,NULL,1,1,'2025-09-20 14:10:00','2025-09-20 14:10:00'),
(2353,'sens01',24.4,64.8,0,1,NULL,NULL,1,1,'2025-09-20 14:20:00','2025-09-20 14:20:00'),
(2354,'sens01',24.4,64.9,0,1,NULL,NULL,1,1,'2025-09-20 14:30:00','2025-09-20 14:30:00'),
(2355,'sens01',24.3,64.8,0,1,NULL,NULL,1,1,'2025-09-20 14:40:00','2025-09-20 14:40:00'),
(2356,'sens01',24.4,64.8,0,1,NULL,NULL,1,1,'2025-09-20 14:50:00','2025-09-20 14:50:00'),
(2357,'sens01',24.4,64.7,0,1,NULL,NULL,1,1,'2025-09-20 15:00:00','2025-09-20 15:00:00'),
(2358,'sens01',24.4,64.7,0,1,NULL,NULL,1,1,'2025-09-20 15:10:00','2025-09-20 15:10:00'),
(2359,'sens01',24.4,64.8,0,1,NULL,NULL,1,1,'2025-09-20 15:20:00','2025-09-20 15:20:00'),
(2360,'sens01',24.4,64.8,0,1,NULL,NULL,1,1,'2025-09-20 15:30:00','2025-09-20 15:30:00'),
(2361,'sens01',24.5,64.9,0,1,NULL,NULL,1,1,'2025-09-20 15:39:24','2025-09-20 15:39:24'),
(2363,'sens01',24.5,64.8,0,1,NULL,NULL,1,1,'2025-09-20 15:40:00','2025-09-20 15:40:00'),
(2364,'sens01',24.5,64.9,0,1,NULL,NULL,1,1,'2025-09-20 15:40:42','2025-09-20 15:40:42'),
(2366,'sens01',24.6,64.6,0,1,NULL,NULL,1,1,'2025-09-20 15:45:35','2025-09-20 15:45:35'),
(2368,'sens01',24.6,64.5,0,1,NULL,NULL,1,1,'2025-09-20 15:45:56','2025-09-20 15:45:56'),
(2370,'sens01',24.6,64.4,0,1,NULL,NULL,1,1,'2025-09-20 15:46:22','2025-09-20 15:46:22'),
(2372,'sens01',24.6,64.3,0,1,NULL,NULL,1,1,'2025-09-20 15:46:43','2025-09-20 15:46:43'),
(2373,'sens01',24.6,64.4,0,1,NULL,NULL,1,1,'2025-09-20 15:46:51','2025-09-20 15:46:51'),
(2374,'sens01',24.7,64.4,0,1,NULL,NULL,1,1,'2025-09-20 15:47:01','2025-09-20 15:47:01'),
(2376,'sens01',24.6,64.4,0,1,NULL,NULL,1,1,'2025-09-20 15:50:00','2025-09-20 15:50:00'),
(2377,'sens01',24.6,64.8,0,1,NULL,NULL,1,1,'2025-09-20 16:00:00','2025-09-20 16:00:00'),
(2378,'sens01',24.6,64.9,0,1,NULL,NULL,1,1,'2025-09-20 16:05:51','2025-09-20 16:05:51'),
(2379,'sens01',24.6,64.9,0,1,NULL,NULL,1,1,'2025-09-20 16:05:56','2025-09-20 16:05:56'),
(2381,'sens01',24.6,65.3,0,1,NULL,NULL,1,1,'2025-09-20 16:10:00','2025-09-20 16:10:00'),
(2382,'sens01',24.6,64.9,0,1,NULL,NULL,1,1,'2025-09-20 16:10:59','2025-09-20 16:10:59'),
(2384,'sens01',24.6,65.2,0,1,NULL,NULL,1,1,'2025-09-20 16:20:00','2025-09-20 16:20:00'),
(2385,'sens01',24.6,65.4,0,1,NULL,NULL,1,1,'2025-09-20 16:30:00','2025-09-20 16:30:00'),
(2386,'sens01',24.6,65.6,0,1,NULL,NULL,1,1,'2025-09-20 16:40:00','2025-09-20 16:40:00'),
(2387,'sens01',24.5,65.7,0,1,NULL,NULL,1,1,'2025-09-20 16:47:49','2025-09-20 16:47:49'),
(2389,'sens01',24.5,65.8,0,1,NULL,NULL,1,1,'2025-09-20 16:48:25','2025-09-20 16:48:25'),
(2390,'sens01',24.5,65.8,0,1,NULL,NULL,1,1,'2025-09-20 16:49:10','2025-09-20 16:49:10'),
(2392,'sens01',24.6,65.8,0,1,NULL,NULL,1,1,'2025-09-20 16:50:00','2025-09-20 16:50:00'),
(2393,'sens01',24.5,65.8,0,1,NULL,NULL,1,1,'2025-09-20 16:55:37','2025-09-20 16:55:37'),
(2395,'sens01',24.6,65.8,0,1,NULL,NULL,1,1,'2025-09-20 17:00:00','2025-09-20 17:00:00'),
(2396,'sens01',24.4,65.9,0,1,NULL,NULL,1,1,'2025-09-20 17:10:00','2025-09-20 17:10:00'),
(2397,'sens01',24.4,66,0,1,NULL,NULL,1,1,'2025-09-20 17:20:00','2025-09-20 17:20:00'),
(2398,'sens01',24.5,67.6,0,1,NULL,NULL,1,1,'2025-09-20 17:30:00','2025-09-20 17:30:00'),
(2399,'sens01',24.5,68.1,0,1,NULL,NULL,1,1,'2025-09-20 17:40:00','2025-09-20 17:40:00'),
(2400,'sens01',24.5,68.1,0,1,NULL,NULL,1,1,'2025-09-20 17:50:00','2025-09-20 17:50:00'),
(2401,'sens01',24.6,67.7,0,1,NULL,NULL,1,1,'2025-09-20 18:00:00','2025-09-20 18:00:00'),
(2402,'sens01',24.3,68.4,0,1,NULL,NULL,1,1,'2025-09-20 18:10:00','2025-09-20 18:10:00'),
(2403,'sens01',24.2,68.9,0,1,NULL,NULL,1,1,'2025-09-20 18:20:00','2025-09-20 18:20:00'),
(2404,'sens01',24.2,68.7,0,1,NULL,NULL,1,1,'2025-09-20 18:30:00','2025-09-20 18:30:00'),
(2405,'sens01',24.2,68.2,0,1,NULL,NULL,1,1,'2025-09-20 18:40:00','2025-09-20 18:40:00'),
(2406,'sens01',24.2,69.2,0,1,NULL,NULL,1,1,'2025-09-20 18:50:00','2025-09-20 18:50:00'),
(2407,'sens01',24.2,69,0,1,NULL,NULL,1,1,'2025-09-20 19:00:00','2025-09-20 19:00:00'),
(2408,'sens01',24.2,68.9,0,1,NULL,NULL,1,1,'2025-09-20 19:10:00','2025-09-20 19:10:00'),
(2409,'sens01',24.1,68.8,0,1,NULL,NULL,1,1,'2025-09-20 19:20:00','2025-09-20 19:20:00'),
(2410,'sens01',24.1,68.1,0,1,NULL,NULL,1,1,'2025-09-20 19:30:00','2025-09-20 19:30:00'),
(2411,'sens01',24.1,68.2,0,1,NULL,NULL,1,1,'2025-09-20 19:40:00','2025-09-20 19:40:00'),
(2412,'sens01',24.1,68.4,0,1,NULL,NULL,1,1,'2025-09-20 19:50:00','2025-09-20 19:50:00'),
(2413,'sens01',24,68.6,0,1,NULL,NULL,1,1,'2025-09-20 20:00:00','2025-09-20 20:00:00'),
(2414,'sens01',23.9,68.7,0,1,NULL,NULL,1,1,'2025-09-20 20:10:00','2025-09-20 20:10:00'),
(2415,'sens01',24,68.6,0,1,NULL,NULL,1,1,'2025-09-20 20:20:00','2025-09-20 20:20:00'),
(2416,'sens01',24,68.7,0,1,NULL,NULL,1,1,'2025-09-20 20:30:00','2025-09-20 20:30:00'),
(2417,'sens01',23.9,68.6,0,1,NULL,NULL,1,1,'2025-09-20 20:40:00','2025-09-20 20:40:00'),
(2418,'sens01',23.9,68.5,0,1,NULL,NULL,1,1,'2025-09-20 20:50:00','2025-09-20 20:50:00'),
(2419,'sens01',23.9,68.6,0,1,NULL,NULL,1,1,'2025-09-20 21:00:00','2025-09-20 21:00:00'),
(2420,'sens01',23.9,68.4,0,1,NULL,NULL,1,1,'2025-09-20 21:10:00','2025-09-20 21:10:00'),
(2421,'sens01',23.9,68.6,0,1,NULL,NULL,1,1,'2025-09-20 21:20:00','2025-09-20 21:20:00'),
(2422,'sens01',23.9,68.6,0,1,NULL,NULL,1,1,'2025-09-20 21:30:00','2025-09-20 21:30:00'),
(2423,'sens01',23.8,68.7,0,1,NULL,NULL,1,1,'2025-09-20 21:40:00','2025-09-20 21:40:00'),
(2424,'sens01',23.8,68.6,0,1,NULL,NULL,1,1,'2025-09-20 21:50:00','2025-09-20 21:50:00'),
(2425,'sens01',23.8,68.6,0,1,NULL,NULL,1,1,'2025-09-20 22:00:00','2025-09-20 22:00:00'),
(2426,'sens01',23.8,68.6,0,1,NULL,NULL,1,1,'2025-09-20 22:10:00','2025-09-20 22:10:00'),
(2427,'sens01',23.8,68.5,0,1,NULL,NULL,1,1,'2025-09-20 22:20:00','2025-09-20 22:20:00'),
(2428,'sens01',23.7,68.5,0,1,NULL,NULL,1,1,'2025-09-20 22:30:00','2025-09-20 22:30:00'),
(2429,'sens01',23.7,68.4,0,1,NULL,NULL,1,1,'2025-09-20 22:40:00','2025-09-20 22:40:00'),
(2430,'sens01',23.7,68,0,1,NULL,NULL,1,1,'2025-09-20 22:50:00','2025-09-20 22:50:00'),
(2431,'sens01',23.7,68.4,0,1,NULL,NULL,1,1,'2025-09-20 23:00:00','2025-09-20 23:00:00'),
(2432,'sens01',23.7,68.5,0,1,NULL,NULL,1,1,'2025-09-20 23:10:00','2025-09-20 23:10:00'),
(2433,'sens01',23.7,68.3,0,1,NULL,NULL,1,1,'2025-09-20 23:20:00','2025-09-20 23:20:00'),
(2434,'sens01',23.7,68.3,0,1,NULL,NULL,1,1,'2025-09-20 23:30:00','2025-09-20 23:30:00'),
(2435,'sens01',23.6,68.3,0,1,NULL,NULL,1,1,'2025-09-20 23:40:00','2025-09-20 23:40:00'),
(2436,'sens01',23.6,68.4,0,1,NULL,NULL,1,1,'2025-09-20 23:50:00','2025-09-20 23:50:00'),
(2437,'sens01',23.6,68.5,0,1,NULL,NULL,1,1,'2025-09-21 00:00:00','2025-09-21 00:00:00'),
(2438,'sens01',23.6,68.5,0,1,NULL,NULL,1,1,'2025-09-21 00:10:00','2025-09-21 00:10:00'),
(2439,'sens01',23.6,68.5,0,1,NULL,NULL,1,1,'2025-09-21 00:20:00','2025-09-21 00:20:00'),
(2440,'sens01',23.6,68.5,0,1,NULL,NULL,1,1,'2025-09-21 00:30:00','2025-09-21 00:30:00'),
(2441,'sens01',23.5,68.5,0,1,NULL,NULL,1,1,'2025-09-21 00:40:00','2025-09-21 00:40:00'),
(2442,'sens01',23.5,68.5,0,1,NULL,NULL,1,1,'2025-09-21 00:50:00','2025-09-21 00:50:00'),
(2443,'sens01',23.5,68.5,0,1,NULL,NULL,1,1,'2025-09-21 01:00:00','2025-09-21 01:00:00'),
(2444,'sens01',23.5,68.5,0,1,NULL,NULL,1,1,'2025-09-21 01:10:00','2025-09-21 01:10:00'),
(2445,'sens01',23.5,68.5,0,1,NULL,NULL,1,1,'2025-09-21 01:20:00','2025-09-21 01:20:00'),
(2446,'sens01',23.5,68.4,0,1,NULL,NULL,1,1,'2025-09-21 01:30:00','2025-09-21 01:30:00'),
(2447,'sens01',23.5,68.4,0,1,NULL,NULL,1,1,'2025-09-21 01:40:00','2025-09-21 01:40:00'),
(2448,'sens01',23.4,68.5,0,1,NULL,NULL,1,1,'2025-09-21 01:50:00','2025-09-21 01:50:00'),
(2449,'sens01',23.4,68.4,0,1,NULL,NULL,1,1,'2025-09-21 02:00:00','2025-09-21 02:00:00'),
(2450,'sens01',23.4,68.4,0,1,NULL,NULL,1,1,'2025-09-21 02:10:00','2025-09-21 02:10:00'),
(2451,'sens01',23.4,68.4,0,1,NULL,NULL,1,1,'2025-09-21 02:20:00','2025-09-21 02:20:00'),
(2452,'sens01',23.4,68.4,0,1,NULL,NULL,1,1,'2025-09-21 02:30:00','2025-09-21 02:30:00'),
(2453,'sens01',23.4,68.4,0,1,NULL,NULL,1,1,'2025-09-21 02:40:00','2025-09-21 02:40:00'),
(2454,'sens01',23.4,68.5,0,1,NULL,NULL,1,1,'2025-09-21 02:50:00','2025-09-21 02:50:00'),
(2455,'sens01',23.4,68.4,0,1,NULL,NULL,1,1,'2025-09-21 03:00:00','2025-09-21 03:00:00'),
(2456,'sens01',23.3,68.5,0,1,NULL,NULL,1,1,'2025-09-21 03:10:00','2025-09-21 03:10:00'),
(2457,'sens01',23.3,68.4,0,1,NULL,NULL,1,1,'2025-09-21 03:20:00','2025-09-21 03:20:00'),
(2458,'sens01',23.3,68.4,0,1,NULL,NULL,1,1,'2025-09-21 03:30:00','2025-09-21 03:30:00'),
(2459,'sens01',23.3,68.4,0,1,NULL,NULL,1,1,'2025-09-21 03:40:00','2025-09-21 03:40:00'),
(2460,'sens01',23.3,68.4,0,1,NULL,NULL,1,1,'2025-09-21 03:50:00','2025-09-21 03:50:00'),
(2461,'sens01',23.3,68.4,0,1,NULL,NULL,1,1,'2025-09-21 04:00:00','2025-09-21 04:00:00'),
(2462,'sens01',23.3,68.4,0,1,NULL,NULL,1,1,'2025-09-21 04:10:00','2025-09-21 04:10:00'),
(2463,'sens01',23.2,68.5,0,1,NULL,NULL,1,1,'2025-09-21 04:20:00','2025-09-21 04:20:00'),
(2464,'sens01',23.2,68.5,0,1,NULL,NULL,1,1,'2025-09-21 04:30:00','2025-09-21 04:30:00'),
(2465,'sens01',23.2,68.4,0,1,NULL,NULL,1,1,'2025-09-21 04:40:00','2025-09-21 04:40:00'),
(2466,'sens01',23.2,68.6,0,1,NULL,NULL,1,1,'2025-09-21 04:50:00','2025-09-21 04:50:00'),
(2467,'sens01',23.2,68.7,0,1,NULL,NULL,1,1,'2025-09-21 05:00:00','2025-09-21 05:00:00'),
(2468,'sens01',23.2,68.7,0,1,NULL,NULL,1,1,'2025-09-21 05:10:00','2025-09-21 05:10:00'),
(2469,'sens01',23.2,68.6,0,1,NULL,NULL,1,1,'2025-09-21 05:20:00','2025-09-21 05:20:00'),
(2470,'sens01',23.3,68.7,0,1,NULL,NULL,1,1,'2025-09-21 05:30:00','2025-09-21 05:30:00'),
(2471,'sens01',23.3,68.6,0,1,NULL,NULL,1,1,'2025-09-21 05:40:00','2025-09-21 05:40:00'),
(2472,'sens01',23.3,68.6,0,1,NULL,NULL,1,1,'2025-09-21 05:50:00','2025-09-21 05:50:00'),
(2473,'sens01',23.3,68.4,0,1,NULL,NULL,1,1,'2025-09-21 06:00:00','2025-09-21 06:00:00'),
(2474,'sens01',23.4,69.1,0,1,NULL,NULL,1,1,'2025-09-21 06:10:00','2025-09-21 06:10:00'),
(2475,'sens01',23.5,69,0,1,NULL,NULL,1,1,'2025-09-21 06:20:00','2025-09-21 06:20:00'),
(2476,'sens01',23.5,69,0,1,NULL,NULL,1,1,'2025-09-21 06:30:00','2025-09-21 06:30:00'),
(2477,'sens01',23.5,68.9,0,1,NULL,NULL,1,1,'2025-09-21 06:33:50','2025-09-21 06:33:50'),
(2479,'sens01',23.6,68.8,0,1,NULL,NULL,1,1,'2025-09-21 06:40:00','2025-09-21 06:40:00'),
(2480,'sens01',23.6,68.8,0,1,NULL,NULL,1,1,'2025-09-21 06:50:00','2025-09-21 06:50:00'),
(2481,'sens01',23.6,68.9,0,1,NULL,NULL,1,1,'2025-09-21 06:50:50','2025-09-21 06:50:50'),
(2483,'sens01',23.6,68.9,0,1,NULL,NULL,1,1,'2025-09-21 06:51:30','2025-09-21 06:51:30'),
(2485,'sens01',23.6,68.7,0,1,NULL,NULL,1,1,'2025-09-21 06:56:08','2025-09-21 06:56:08'),
(2487,'sens01',23.6,68.8,0,1,NULL,NULL,1,1,'2025-09-21 06:59:15','2025-09-21 06:59:15'),
(2488,'sens01',23.6,68.8,0,1,NULL,NULL,1,1,'2025-09-21 06:59:24','2025-09-21 06:59:24'),
(2489,'sens01',23.6,68.8,0,1,NULL,NULL,1,1,'2025-09-21 06:59:25','2025-09-21 06:59:25'),
(2491,'sens01',23.6,68.7,0,1,NULL,NULL,1,1,'2025-09-21 07:00:00','2025-09-21 07:00:00'),
(2492,'sens01',23.6,68.6,0,1,NULL,NULL,1,1,'2025-09-21 07:02:36','2025-09-21 07:02:36'),
(2494,'sens01',23.6,68.7,0,1,NULL,NULL,1,1,'2025-09-21 07:03:25','2025-09-21 07:03:25'),
(2496,'sens01',23.6,68.6,0,1,NULL,NULL,1,1,'2025-09-21 07:06:58','2025-09-21 07:06:58'),
(2498,'sens01',23.6,68.6,0,1,NULL,NULL,1,1,'2025-09-21 07:08:09','2025-09-21 07:08:09'),
(2500,'sens01',23.6,68.6,0,1,NULL,NULL,1,1,'2025-09-21 07:09:37','2025-09-21 07:09:37'),
(2502,'sens01',23.6,68.5,0,1,NULL,NULL,1,1,'2025-09-21 07:10:00','2025-09-21 07:10:00'),
(2503,'sens01',23.6,68.8,0,1,NULL,NULL,1,1,'2025-09-21 07:11:15','2025-09-21 07:11:15'),
(2505,'sens01',23.7,68.5,0,1,NULL,NULL,1,1,'2025-09-21 07:13:55','2025-09-21 07:13:55'),
(2507,'sens01',23.6,68.6,0,1,NULL,NULL,1,1,'2025-09-21 07:20:00','2025-09-21 07:20:00'),
(2508,'sens01',23.7,68.3,0,1,NULL,NULL,1,1,'2025-09-21 07:25:08','2025-09-21 07:25:08'),
(2510,'sens01',23.7,68.4,0,1,NULL,NULL,1,1,'2025-09-21 07:30:00','2025-09-21 07:30:00'),
(2511,'sens01',23.6,68.5,0,1,NULL,NULL,1,1,'2025-09-21 07:40:00','2025-09-21 07:40:00'),
(2512,'sens01',23.6,68.6,0,1,NULL,NULL,1,1,'2025-09-21 07:43:48','2025-09-21 07:43:48'),
(2514,'sens01',23.7,68.3,0,1,NULL,NULL,1,1,'2025-09-21 07:50:00','2025-09-21 07:50:00'),
(2515,'sens01',23.8,68.2,0,1,NULL,NULL,1,1,'2025-09-21 08:00:00','2025-09-21 08:00:00'),
(2516,'sens01',23.7,68.4,0,1,NULL,NULL,1,1,'2025-09-21 08:10:00','2025-09-21 08:10:00'),
(2517,'sens01',23.7,68.3,0,1,NULL,NULL,1,1,'2025-09-21 08:20:00','2025-09-21 08:20:00'),
(2518,'sens01',23.7,68.3,0,1,NULL,NULL,1,1,'2025-09-21 08:24:40','2025-09-21 08:24:40'),
(2520,'sens01',23.7,68.3,0,1,NULL,NULL,1,1,'2025-09-21 08:30:00','2025-09-21 08:30:00'),
(2521,'sens01',23.7,68.3,0,1,NULL,NULL,1,1,'2025-09-21 08:31:49','2025-09-21 08:31:49'),
(2523,'sens01',23.7,68.3,0,1,NULL,NULL,1,1,'2025-09-21 08:32:12','2025-09-21 08:32:12'),
(2525,'sens01',23.7,68.3,0,1,NULL,NULL,1,1,'2025-09-21 08:32:38','2025-09-21 08:32:38'),
(2527,'sens01',23.7,68.3,0,1,NULL,NULL,1,1,'2025-09-21 08:32:55','2025-09-21 08:32:55'),
(2529,'sens01',23.7,68.2,0,1,NULL,NULL,1,1,'2025-09-21 08:40:00','2025-09-21 08:40:00'),
(2530,'sens01',23.7,68.2,0,1,NULL,NULL,1,1,'2025-09-21 08:40:12','2025-09-21 08:40:12'),
(2532,'sens01',23.8,67.9,0,1,NULL,NULL,1,1,'2025-09-21 08:48:07','2025-09-21 08:48:07'),
(2534,'sens01',23.8,67.8,0,1,NULL,NULL,1,1,'2025-09-21 08:50:00','2025-09-21 08:50:00'),
(2535,'sens01',23.9,67.8,0,1,NULL,NULL,1,1,'2025-09-21 08:58:01','2025-09-21 08:58:01'),
(2537,'sens01',23.9,67.6,0,1,NULL,NULL,1,1,'2025-09-21 09:00:00','2025-09-21 09:00:00'),
(2538,'sens01',24.1,66.3,0,1,NULL,NULL,1,1,'2025-09-21 09:10:00','2025-09-21 09:10:00'),
(2539,'sens01',24.2,66,0,1,NULL,NULL,1,1,'2025-09-21 09:14:26','2025-09-21 09:14:26'),
(2541,'sens01',24.1,65.4,0,1,NULL,NULL,1,1,'2025-09-21 09:16:45','2025-09-21 09:16:45'),
(2543,'sens01',24.1,65.4,0,1,NULL,NULL,1,1,'2025-09-21 09:17:08','2025-09-21 09:17:08'),
(2545,'sens01',24,65.4,0,1,NULL,NULL,1,1,'2025-09-21 09:18:53','2025-09-21 09:18:53'),
(2547,'sens01',24.1,65.6,0,1,NULL,NULL,1,1,'2025-09-21 09:19:57','2025-09-21 09:19:57'),
(2548,'sens01',24.1,65.6,0,1,NULL,NULL,1,1,'2025-09-21 09:20:00','2025-09-21 09:20:00'),
(2550,'sens01',24.2,65.6,0,1,NULL,NULL,1,1,'2025-09-21 09:21:23','2025-09-21 09:21:23'),
(2552,'sens01',24.3,64.9,0,1,NULL,NULL,1,1,'2025-09-21 09:28:21','2025-09-21 09:28:21'),
(2554,'sens01',24.2,65,0,1,NULL,NULL,1,1,'2025-09-21 09:29:11','2025-09-21 09:29:11'),
(2556,'sens01',24.2,65.1,0,1,NULL,NULL,1,1,'2025-09-21 09:30:00','2025-09-21 09:30:00'),
(2557,'sens01',24.1,64.9,0,1,NULL,NULL,1,1,'2025-09-21 09:40:00','2025-09-21 09:40:00'),
(2558,'sens01',24,65.1,0,1,NULL,NULL,1,1,'2025-09-21 09:50:00','2025-09-21 09:50:00'),
(2559,'sens01',24.1,65.1,0,1,NULL,NULL,1,1,'2025-09-21 10:00:00','2025-09-21 10:00:00'),
(2560,'sens01',24.2,65,0,1,NULL,NULL,1,1,'2025-09-21 10:10:00','2025-09-21 10:10:00'),
(2561,'sens01',24.2,64.7,0,1,NULL,NULL,1,1,'2025-09-21 10:20:00','2025-09-21 10:20:00'),
(2562,'sens01',24.5,63.7,0,1,NULL,NULL,1,1,'2025-09-21 10:30:00','2025-09-21 10:30:00'),
(2563,'sens01',24.5,63.8,0,1,NULL,NULL,1,1,'2025-09-21 10:40:00','2025-09-21 10:40:00'),
(2564,'sens01',24.5,63.8,0,1,NULL,NULL,1,1,'2025-09-21 10:50:00','2025-09-21 10:50:00'),
(2565,'sens01',24.6,63.8,0,1,NULL,NULL,1,1,'2025-09-21 11:00:00','2025-09-21 11:00:00'),
(2566,'sens01',24.8,63.3,0,1,NULL,NULL,1,1,'2025-09-21 11:10:00','2025-09-21 11:10:00'),
(2567,'sens01',24.8,63.3,0,1,NULL,NULL,1,1,'2025-09-21 11:20:00','2025-09-21 11:20:00'),
(2568,'sens01',25.1,62.7,0,1,NULL,NULL,1,1,'2025-09-21 11:30:00','2025-09-21 11:30:00'),
(2569,'sens01',25,63.4,0,1,NULL,NULL,1,1,'2025-09-21 11:40:00','2025-09-21 11:40:00'),
(2570,'sens01',25.2,62.8,0,1,NULL,NULL,1,1,'2025-09-21 11:50:00','2025-09-21 11:50:00'),
(2571,'sens01',25.1,63,0,1,NULL,NULL,1,1,'2025-09-21 12:00:00','2025-09-21 12:00:00'),
(2572,'sens01',25.3,63,0,1,NULL,NULL,1,1,'2025-09-21 12:10:00','2025-09-21 12:10:00'),
(2573,'sens01',25.4,62.8,0,1,NULL,NULL,1,1,'2025-09-21 12:20:00','2025-09-21 12:20:00'),
(2574,'sens01',25.3,62.7,0,1,NULL,NULL,1,1,'2025-09-21 12:30:00','2025-09-21 12:30:00'),
(2575,'sens01',25.4,61.8,0,1,NULL,NULL,1,1,'2025-09-21 12:40:00','2025-09-21 12:40:00'),
(2576,'sens01',25.4,62,0,1,NULL,NULL,1,1,'2025-09-21 12:50:00','2025-09-21 12:50:00'),
(2577,'sens01',25.5,61.6,0,1,NULL,NULL,1,1,'2025-09-21 13:00:00','2025-09-21 13:00:00'),
(2578,'sens01',25.5,61.8,0,1,NULL,NULL,1,1,'2025-09-21 13:10:00','2025-09-21 13:10:00'),
(2579,'sens01',25.6,61.5,0,1,NULL,NULL,1,1,'2025-09-21 13:20:00','2025-09-21 13:20:00'),
(2580,'sens01',25.6,61.1,0,1,NULL,NULL,1,1,'2025-09-21 13:30:00','2025-09-21 13:30:00'),
(2581,'sens01',25.6,61.4,0,1,NULL,NULL,1,1,'2025-09-21 13:40:00','2025-09-21 13:40:00'),
(2582,'sens01',25.8,61.3,0,1,NULL,NULL,1,1,'2025-09-21 13:50:00','2025-09-21 13:50:00'),
(2583,'sens01',25.7,61.5,0,1,NULL,NULL,1,1,'2025-09-21 14:00:00','2025-09-21 14:00:00'),
(2584,'sens01',25.8,60.9,0,1,NULL,NULL,1,1,'2025-09-21 14:10:00','2025-09-21 14:10:00'),
(2585,'sens01',25.7,60.9,0,1,NULL,NULL,1,1,'2025-09-21 14:20:00','2025-09-21 14:20:00'),
(2586,'sens01',25.6,61.2,0,1,NULL,NULL,1,1,'2025-09-21 14:30:00','2025-09-21 14:30:00'),
(2587,'sens01',25.7,61.2,0,1,NULL,NULL,1,1,'2025-09-21 14:40:00','2025-09-21 14:40:00'),
(2588,'sens01',25.7,61.3,0,1,NULL,NULL,1,1,'2025-09-21 14:50:00','2025-09-21 14:50:00'),
(2589,'sens01',25.6,61.3,0,1,NULL,NULL,1,1,'2025-09-21 15:00:00','2025-09-21 15:00:00'),
(2590,'sens01',25.6,61.2,0,1,NULL,NULL,1,1,'2025-09-21 15:10:00','2025-09-21 15:10:00'),
(2591,'sens01',25.5,60.8,0,1,NULL,NULL,1,1,'2025-09-21 15:20:00','2025-09-21 15:20:00'),
(2592,'sens01',25.4,61,0,1,NULL,NULL,1,1,'2025-09-21 15:30:00','2025-09-21 15:30:00'),
(2593,'sens01',25.3,61.3,0,1,NULL,NULL,1,1,'2025-09-21 15:40:00','2025-09-21 15:40:00'),
(2594,'sens01',25.3,61.1,0,1,NULL,NULL,1,1,'2025-09-21 15:50:00','2025-09-21 15:50:00'),
(2595,'sens01',25.2,60.6,0,1,NULL,NULL,1,1,'2025-09-21 16:00:00','2025-09-21 16:00:00'),
(2596,'sens01',25.2,60.9,0,1,NULL,NULL,1,1,'2025-09-21 16:10:00','2025-09-21 16:10:00'),
(2597,'sens01',25,62.5,0,1,NULL,NULL,1,1,'2025-09-21 16:20:00','2025-09-21 16:20:00'),
(2598,'sens01',25,63.1,0,1,NULL,NULL,1,1,'2025-09-21 16:30:00','2025-09-21 16:30:00'),
(2599,'sens01',24.8,63.7,0,1,NULL,NULL,1,1,'2025-09-21 16:40:00','2025-09-21 16:40:00'),
(2600,'sens01',24.6,63.9,0,1,NULL,NULL,1,1,'2025-09-21 16:50:00','2025-09-21 16:50:00'),
(2601,'sens01',24.5,63.8,0,1,NULL,NULL,1,1,'2025-09-21 17:00:00','2025-09-21 17:00:00'),
(2602,'sens01',24.4,63.7,0,1,NULL,NULL,1,1,'2025-09-21 17:10:00','2025-09-21 17:10:00'),
(2603,'sens01',24.2,63.7,0,1,NULL,NULL,1,1,'2025-09-21 17:20:00','2025-09-21 17:20:00'),
(2604,'sens01',24.1,63.8,0,1,NULL,NULL,1,1,'2025-09-21 17:30:00','2025-09-21 17:30:00'),
(2605,'sens01',24.1,63.7,0,1,NULL,NULL,1,1,'2025-09-21 17:40:00','2025-09-21 17:40:00'),
(2606,'sens01',23.9,64.2,0,1,NULL,NULL,1,1,'2025-09-21 17:50:00','2025-09-21 17:50:00'),
(2607,'sens01',23.8,64.5,0,1,NULL,NULL,1,1,'2025-09-21 18:00:00','2025-09-21 18:00:00'),
(2608,'sens01',23.7,64.9,0,1,NULL,NULL,1,1,'2025-09-21 18:10:00','2025-09-21 18:10:00'),
(2609,'sens01',24.1,65.7,0,1,NULL,NULL,1,1,'2025-09-21 18:20:00','2025-09-21 18:20:00'),
(2610,'sens01',24.2,65.6,0,1,NULL,NULL,1,1,'2025-09-21 18:30:00','2025-09-21 18:30:00'),
(2611,'sens01',24.3,65.7,0,1,NULL,NULL,1,1,'2025-09-21 18:40:00','2025-09-21 18:40:00'),
(2612,'sens01',24.3,65.9,0,1,NULL,NULL,1,1,'2025-09-21 18:50:00','2025-09-21 18:50:00'),
(2613,'sens01',24.3,66.4,0,1,NULL,NULL,1,1,'2025-09-21 19:00:00','2025-09-21 19:00:00'),
(2614,'sens01',24.3,66.6,0,1,NULL,NULL,1,1,'2025-09-21 19:10:00','2025-09-21 19:10:00'),
(2615,'sens01',24.3,66.6,0,1,NULL,NULL,1,1,'2025-09-21 19:20:00','2025-09-21 19:20:00'),
(2616,'sens01',24.3,67,0,1,NULL,NULL,1,1,'2025-09-21 19:30:00','2025-09-21 19:30:00'),
(2617,'sens01',24.4,66.3,0,1,NULL,NULL,1,1,'2025-09-21 19:40:00','2025-09-21 19:40:00'),
(2618,'sens01',24.6,65.7,0,1,NULL,NULL,1,1,'2025-09-21 19:50:00','2025-09-21 19:50:00'),
(2619,'sens01',24.6,65.7,0,1,NULL,NULL,1,1,'2025-09-21 19:52:39','2025-09-21 19:52:39'),
(2621,'sens01',24.6,65.7,0,1,NULL,NULL,1,1,'2025-09-21 19:53:49','2025-09-21 19:53:49'),
(2623,'sens01',24.5,66.2,0,1,NULL,NULL,1,1,'2025-09-21 20:00:00','2025-09-21 20:00:00'),
(2624,'sens01',24.3,66.7,0,1,NULL,NULL,1,1,'2025-09-21 20:10:00','2025-09-21 20:10:00'),
(2625,'sens01',24.2,67.1,0,1,NULL,NULL,1,1,'2025-09-21 20:20:00','2025-09-21 20:20:00'),
(2626,'sens01',24.2,67.2,0,1,NULL,NULL,1,1,'2025-09-21 20:30:00','2025-09-21 20:30:00'),
(2627,'sens01',24.1,67.3,0,1,NULL,NULL,1,1,'2025-09-21 20:40:00','2025-09-21 20:40:00'),
(2628,'sens01',24.1,67.4,0,1,NULL,NULL,1,1,'2025-09-21 20:50:00','2025-09-21 20:50:00'),
(2629,'sens01',24.1,67.5,0,1,NULL,NULL,1,1,'2025-09-21 21:00:00','2025-09-21 21:00:00'),
(2630,'sens01',24,67.5,0,1,NULL,NULL,1,1,'2025-09-21 21:10:00','2025-09-21 21:10:00'),
(2631,'sens01',24.1,67.2,0,1,NULL,NULL,1,1,'2025-09-21 21:20:00','2025-09-21 21:20:00'),
(2632,'sens01',24.1,67.4,0,1,NULL,NULL,1,1,'2025-09-21 21:30:00','2025-09-21 21:30:00'),
(2633,'sens01',24.3,66.7,0,1,NULL,NULL,1,1,'2025-09-21 21:40:00','2025-09-21 21:40:00'),
(2634,'sens01',24.2,67.5,0,1,NULL,NULL,1,1,'2025-09-21 21:50:00','2025-09-21 21:50:00'),
(2635,'sens01',24.2,68.1,0,1,NULL,NULL,1,1,'2025-09-21 22:00:00','2025-09-21 22:00:00'),
(2636,'sens01',24.1,68.3,0,1,NULL,NULL,1,1,'2025-09-21 22:10:00','2025-09-21 22:10:00'),
(2637,'sens01',24.1,68.4,0,1,NULL,NULL,1,1,'2025-09-21 22:20:00','2025-09-21 22:20:00'),
(2638,'sens01',24.1,68.5,0,1,NULL,NULL,1,1,'2025-09-21 22:30:00','2025-09-21 22:30:00'),
(2639,'sens01',24.1,68.6,0,1,NULL,NULL,1,1,'2025-09-21 22:40:00','2025-09-21 22:40:00'),
(2640,'sens01',24,68.6,0,1,NULL,NULL,1,1,'2025-09-21 22:50:00','2025-09-21 22:50:00'),
(2641,'sens01',24.1,68.5,0,1,NULL,NULL,1,1,'2025-09-21 23:00:00','2025-09-21 23:00:00'),
(2642,'sens01',24,68.6,0,1,NULL,NULL,1,1,'2025-09-21 23:10:00','2025-09-21 23:10:00'),
(2643,'sens01',24.1,68.6,0,1,NULL,NULL,1,1,'2025-09-21 23:20:00','2025-09-21 23:20:00'),
(2644,'sens01',24.1,68.3,0,1,NULL,NULL,1,1,'2025-09-21 23:30:00','2025-09-21 23:30:00'),
(2645,'sens01',24.1,68.1,0,1,NULL,NULL,1,1,'2025-09-21 23:40:00','2025-09-21 23:40:00'),
(2646,'sens01',24.1,68,0,1,NULL,NULL,1,1,'2025-09-21 23:50:00','2025-09-21 23:50:00'),
(2647,'sens01',24,68,0,1,NULL,NULL,1,1,'2025-09-22 00:00:00','2025-09-22 00:00:00'),
(2648,'sens01',24,67.9,0,1,NULL,NULL,1,1,'2025-09-22 00:10:00','2025-09-22 00:10:00'),
(2649,'sens01',24,67.7,0,1,NULL,NULL,1,1,'2025-09-22 00:20:00','2025-09-22 00:20:00'),
(2650,'sens01',24,67.7,0,1,NULL,NULL,1,1,'2025-09-22 00:30:00','2025-09-22 00:30:00'),
(2651,'sens01',24,67.6,0,1,NULL,NULL,1,1,'2025-09-22 00:40:00','2025-09-22 00:40:00'),
(2652,'sens01',24,67.6,0,1,NULL,NULL,1,1,'2025-09-22 00:50:00','2025-09-22 00:50:00'),
(2653,'sens01',24,67.5,0,1,NULL,NULL,1,1,'2025-09-22 01:00:00','2025-09-22 01:00:00'),
(2654,'sens01',24,67.5,0,1,NULL,NULL,1,1,'2025-09-22 01:10:00','2025-09-22 01:10:00'),
(2655,'sens01',24,67.3,0,1,NULL,NULL,1,1,'2025-09-22 01:20:00','2025-09-22 01:20:00'),
(2656,'sens01',24,68,0,1,NULL,NULL,1,1,'2025-09-22 01:30:00','2025-09-22 01:30:00'),
(2657,'sens01',24,68.1,0,1,NULL,NULL,1,1,'2025-09-22 01:40:00','2025-09-22 01:40:00'),
(2658,'sens01',24,68.2,0,1,NULL,NULL,1,1,'2025-09-22 01:50:00','2025-09-22 01:50:00'),
(2659,'sens01',24,68.3,0,1,NULL,NULL,1,1,'2025-09-22 02:00:00','2025-09-22 02:00:00'),
(2660,'sens01',23.9,68.4,0,1,NULL,NULL,1,1,'2025-09-22 02:10:00','2025-09-22 02:10:00'),
(2661,'sens01',23.9,68.4,0,1,NULL,NULL,1,1,'2025-09-22 02:20:00','2025-09-22 02:20:00'),
(2662,'sens01',23.9,68.3,0,1,NULL,NULL,1,1,'2025-09-22 02:30:00','2025-09-22 02:30:00'),
(2663,'sens01',23.9,68.4,0,1,NULL,NULL,1,1,'2025-09-22 02:40:00','2025-09-22 02:40:00'),
(2664,'sens01',23.9,68.4,0,1,NULL,NULL,1,1,'2025-09-22 02:50:00','2025-09-22 02:50:00'),
(2665,'sens01',23.9,68.3,0,1,NULL,NULL,1,1,'2025-09-22 03:00:00','2025-09-22 03:00:00'),
(2666,'sens01',23.9,68.3,0,1,NULL,NULL,1,1,'2025-09-22 03:10:00','2025-09-22 03:10:00'),
(2667,'sens01',23.8,68.4,0,1,NULL,NULL,1,1,'2025-09-22 03:20:00','2025-09-22 03:20:00'),
(2668,'sens01',23.8,68.4,0,1,NULL,NULL,1,1,'2025-09-22 03:30:00','2025-09-22 03:30:00'),
(2669,'sens01',23.8,68.3,0,1,NULL,NULL,1,1,'2025-09-22 03:40:00','2025-09-22 03:40:00'),
(2670,'sens01',23.8,68.3,0,1,NULL,NULL,1,1,'2025-09-22 03:50:00','2025-09-22 03:50:00'),
(2671,'sens01',23.8,68.4,0,1,NULL,NULL,1,1,'2025-09-22 04:00:00','2025-09-22 04:00:00'),
(2672,'sens01',23.8,68.4,0,1,NULL,NULL,1,1,'2025-09-22 04:10:00','2025-09-22 04:10:00'),
(2673,'sens01',23.7,68.5,0,1,NULL,NULL,1,1,'2025-09-22 04:20:00','2025-09-22 04:20:00'),
(2674,'sens01',23.7,68.4,0,1,NULL,NULL,1,1,'2025-09-22 04:30:00','2025-09-22 04:30:00'),
(2675,'sens01',23.7,68.4,0,1,NULL,NULL,1,1,'2025-09-22 04:40:00','2025-09-22 04:40:00'),
(2676,'sens01',23.7,68.3,0,1,NULL,NULL,1,1,'2025-09-22 04:50:00','2025-09-22 04:50:00'),
(2677,'sens01',23.7,68,0,1,NULL,NULL,1,1,'2025-09-22 05:00:00','2025-09-22 05:00:00'),
(2678,'sens01',23.8,67.9,0,1,NULL,NULL,1,1,'2025-09-22 05:10:00','2025-09-22 05:10:00'),
(2679,'sens01',23.8,67.8,0,1,NULL,NULL,1,1,'2025-09-22 05:20:00','2025-09-22 05:20:00'),
(2680,'sens01',23.8,67.9,0,1,NULL,NULL,1,1,'2025-09-22 05:30:00','2025-09-22 05:30:00'),
(2681,'sens01',23.8,68,0,1,NULL,NULL,1,1,'2025-09-22 05:40:00','2025-09-22 05:40:00'),
(2682,'sens01',23.8,68,0,1,NULL,NULL,1,1,'2025-09-22 05:50:00','2025-09-22 05:50:00'),
(2683,'sens01',23.7,68.1,0,1,NULL,NULL,1,1,'2025-09-22 06:00:00','2025-09-22 06:00:00'),
(2684,'sens01',23.7,68.2,0,1,NULL,NULL,1,1,'2025-09-22 06:10:00','2025-09-22 06:10:00'),
(2685,'sens01',23.7,68.9,0,1,NULL,NULL,1,1,'2025-09-22 06:20:00','2025-09-22 06:20:00'),
(2686,'sens01',23.7,68.6,0,1,NULL,NULL,1,1,'2025-09-22 06:30:00','2025-09-22 06:30:00'),
(2687,'sens01',23.7,68.9,0,1,NULL,NULL,1,1,'2025-09-22 06:40:00','2025-09-22 06:40:00'),
(2688,'sens01',23.7,68.8,0,1,NULL,NULL,1,1,'2025-09-22 06:50:00','2025-09-22 06:50:00'),
(2689,'sens01',23.7,69,0,1,NULL,NULL,1,1,'2025-09-22 07:00:00','2025-09-22 07:00:00'),
(2690,'sens01',23.7,68.6,0,1,NULL,NULL,1,1,'2025-09-22 07:10:00','2025-09-22 07:10:00'),
(2691,'sens01',23.7,69,0,1,NULL,NULL,1,1,'2025-09-22 07:20:00','2025-09-22 07:20:00'),
(2692,'sens01',23.7,68.5,0,1,NULL,NULL,1,1,'2025-09-22 07:30:00','2025-09-22 07:30:00'),
(2693,'sens01',23.8,68.8,0,1,NULL,NULL,1,1,'2025-09-22 07:40:00','2025-09-22 07:40:00'),
(2694,'sens01',23.8,68.9,0,1,NULL,NULL,1,1,'2025-09-22 07:50:00','2025-09-22 07:50:00'),
(2695,'sens01',23.8,68.5,0,1,NULL,NULL,1,1,'2025-09-22 08:00:00','2025-09-22 08:00:00'),
(2696,'sens01',23.9,68.6,0,1,NULL,NULL,1,1,'2025-09-22 08:10:00','2025-09-22 08:10:00'),
(2697,'sens01',23.9,68.4,0,1,NULL,NULL,1,1,'2025-09-22 08:20:00','2025-09-22 08:20:00'),
(2698,'sens01',23.8,68.7,0,1,NULL,NULL,1,1,'2025-09-22 08:30:00','2025-09-22 08:30:00'),
(2699,'sens01',23.8,68.6,0,1,NULL,NULL,1,1,'2025-09-22 08:40:00','2025-09-22 08:40:00'),
(2700,'sens01',23.8,68.6,0,1,NULL,NULL,1,1,'2025-09-22 08:50:00','2025-09-22 08:50:00'),
(2701,'sens01',23.9,68.7,0,1,NULL,NULL,1,1,'2025-09-22 08:58:11','2025-09-22 08:58:11'),
(2702,'sens01',23.9,68.7,0,1,NULL,NULL,1,1,'2025-09-22 08:58:42','2025-09-22 08:58:42'),
(2703,'sens01',23.9,68.7,0,1,NULL,NULL,1,1,'2025-09-22 08:59:57','2025-09-22 08:59:57'),
(2704,'sens01',23.9,68.7,0,1,NULL,NULL,1,1,'2025-09-22 09:00:00','2025-09-22 09:00:00'),
(2705,'sens01',23.9,68.7,0,1,NULL,NULL,1,1,'2025-09-22 09:00:25','2025-09-22 09:00:25'),
(2706,'sens01',23.9,68.7,0,1,NULL,NULL,1,1,'2025-09-22 09:00:55','2025-09-22 09:00:55'),
(2707,'sens01',23.9,68.7,0,1,NULL,NULL,1,1,'2025-09-22 09:01:44','2025-09-22 09:01:44'),
(2709,'sens01',23.9,68.6,0,1,NULL,NULL,1,1,'2025-09-22 09:02:26','2025-09-22 09:02:26'),
(2711,'sens01',23.9,68.6,0,1,NULL,NULL,1,1,'2025-09-22 09:04:07','2025-09-22 09:04:07'),
(2713,'sens01',23.9,68.7,0,1,NULL,NULL,1,1,'2025-09-22 09:06:35','2025-09-22 09:06:35'),
(2715,'sens01',23.9,68.6,0,1,NULL,NULL,1,1,'2025-09-22 09:10:00','2025-09-22 09:10:00'),
(2716,'sens01',23.9,68.6,0,1,NULL,NULL,1,1,'2025-09-22 09:20:00','2025-09-22 09:20:00'),
(2717,'sens01',23.9,68.5,0,1,NULL,NULL,1,1,'2025-09-22 09:30:00','2025-09-22 09:30:00'),
(3794,'sens02',19.2,77.7,0,1,NULL,NULL,3,2,'2025-10-14 14:26:33','2025-10-14 14:26:33'),
(3795,'sens02',19.2,78,0,1,NULL,NULL,3,2,'2025-10-14 14:28:00','2025-10-14 14:28:00'),
(3796,'sens02',19.2,78.1,0,1,NULL,NULL,3,2,'2025-10-14 14:30:00','2025-10-14 14:30:00'),
(3797,'sens02',19.2,78.2,0,1,NULL,NULL,3,2,'2025-10-14 14:32:00','2025-10-14 14:32:00'),
(3798,'sens01',0,0,0,0,NULL,NULL,NULL,NULL,'2025-10-14 14:33:12','2025-10-14 14:33:12'),
(3799,'sens02',19.2,78.3,0,1,NULL,NULL,3,2,'2025-10-14 14:33:12','2025-10-14 14:33:12'),
(3800,'sens02',19.2,78.3,0,1,NULL,NULL,3,2,'2025-10-14 14:35:00','2025-10-14 14:35:00'),
(3801,'sens02',19.3,76.8,0,1,NULL,NULL,3,2,'2025-10-14 14:40:00','2025-10-14 14:40:00'),
(3802,'sens02',19.4,77.2,0,1,NULL,NULL,3,2,'2025-10-14 14:45:00','2025-10-14 14:45:00'),
(3803,'sens02',19.4,77.9,0,1,NULL,NULL,3,2,'2025-10-14 14:50:00','2025-10-14 14:50:00'),
(3804,'sens02',19.3,78.6,0,1,NULL,NULL,3,2,'2025-10-14 14:55:00','2025-10-14 14:55:00'),
(3805,'sens02',19.3,78.8,0,1,NULL,NULL,3,2,'2025-10-14 15:00:00','2025-10-14 15:00:00'),
(3806,'sens02',19.3,79,0,1,NULL,NULL,3,2,'2025-10-14 15:05:00','2025-10-14 15:05:00'),
(3807,'sens02',19.3,79.2,0,1,NULL,NULL,3,2,'2025-10-14 15:10:00','2025-10-14 15:10:00'),
(3808,'sens02',19.3,78.4,0,1,NULL,NULL,3,2,'2025-10-14 15:15:00','2025-10-14 15:15:00'),
(3809,'sens02',19.5,74.9,0,1,NULL,NULL,3,2,'2025-10-14 15:20:00','2025-10-14 15:20:00'),
(3810,'sens02',19.7,75.8,0,1,NULL,NULL,3,2,'2025-10-14 15:25:00','2025-10-14 15:25:00'),
(3811,'sens02',18.7,76.3,0,1,NULL,NULL,3,2,'2025-10-14 15:30:00','2025-10-14 15:30:00'),
(3812,'sens02',18.7,76.7,0,1,NULL,NULL,3,2,'2025-10-14 15:35:00','2025-10-14 15:35:00'),
(3813,'sens02',18.7,76.7,0,1,NULL,NULL,3,2,'2025-10-14 15:40:00','2025-10-14 15:40:00'),
(3814,'sens02',18.7,76.6,0,1,NULL,NULL,3,2,'2025-10-14 15:45:00','2025-10-14 15:45:00'),
(3815,'sens02',18.7,77,0,1,NULL,NULL,3,2,'2025-10-14 15:50:00','2025-10-14 15:50:00'),
(3816,'sens02',18.7,77.5,0,1,NULL,NULL,3,2,'2025-10-14 15:55:00','2025-10-14 15:55:00'),
(3817,'sens02',19.1,76.2,0,1,NULL,NULL,3,2,'2025-10-14 16:00:00','2025-10-14 16:00:00'),
(3818,'sens02',19.3,76.2,0,1,NULL,NULL,3,2,'2025-10-14 16:05:00','2025-10-14 16:05:00'),
(3819,'sens02',19.2,77.6,0,1,NULL,NULL,3,2,'2025-10-14 16:10:00','2025-10-14 16:10:00'),
(3820,'sens02',19.3,77,0,1,NULL,NULL,3,2,'2025-10-14 16:15:00','2025-10-14 16:15:00'),
(3821,'sens02',19.4,77.6,0,1,NULL,NULL,3,2,'2025-10-14 16:20:03','2025-10-14 16:20:03'),
(3822,'sens02',19.3,78.7,0,1,NULL,NULL,3,2,'2025-10-14 16:25:00','2025-10-14 16:25:00'),
(3823,'sens02',19.4,78.8,0,1,NULL,NULL,3,2,'2025-10-14 16:30:00','2025-10-14 16:30:00'),
(3824,'sens02',19.5,77.3,0,1,NULL,NULL,3,2,'2025-10-14 16:35:00','2025-10-14 16:35:00'),
(3825,'sens02',19.6,77.3,0,1,NULL,NULL,3,2,'2025-10-14 16:40:00','2025-10-14 16:40:00'),
(3826,'sens02',0,0,0,0,NULL,NULL,3,2,'2025-10-14 17:14:41','2025-10-14 17:14:41'),
(3827,'sens02',0,0,0,0,NULL,NULL,3,2,'2025-10-14 17:14:41','2025-10-14 17:14:41'),
(3828,'sens02',0,0,0,0,NULL,NULL,3,2,'2025-10-14 17:14:41','2025-10-14 17:14:41'),
(3829,'sens02',0,0,0,0,NULL,NULL,3,2,'2025-10-14 17:14:41','2025-10-14 17:14:41'),
(3830,'sens02',0,0,0,0,NULL,NULL,3,2,'2025-10-14 17:14:41','2025-10-14 17:14:41'),
(3831,'sens02',0,0,0,0,NULL,NULL,3,2,'2025-10-14 17:14:41','2025-10-14 17:14:41'),
(3832,'sens02',0,0,0,0,NULL,NULL,3,2,'2025-10-14 17:31:39','2025-10-14 17:31:39'),
(3833,'sens02',0,0,0,0,NULL,NULL,3,2,'2025-10-14 17:31:39','2025-10-14 17:31:39'),
(3834,'sens02',0,0,0,0,NULL,NULL,3,2,'2025-10-14 17:31:39','2025-10-14 17:31:39'),
(3835,'sens02',0,0,0,0,NULL,NULL,3,2,'2025-10-14 17:31:39','2025-10-14 17:31:39'),
(3836,'sens02',0,0,0,0,NULL,NULL,3,2,'2025-10-14 17:40:32','2025-10-14 17:40:32'),
(3837,'sens02',0,0,0,0,NULL,NULL,3,2,'2025-10-14 17:40:32','2025-10-14 17:40:32'),
(3838,'sens02',0,0,0,0,NULL,NULL,3,2,'2025-10-14 17:45:10','2025-10-14 17:45:10'),
(3839,'sens02',0,0,0,0,NULL,NULL,3,2,'2025-10-14 17:50:10','2025-10-14 17:50:10'),
(3840,'sens01',0,0,0,0,NULL,NULL,NULL,NULL,'2025-10-14 17:53:28','2025-10-14 17:53:28'),
(3841,'sens01',0,0,0,0,NULL,NULL,NULL,NULL,'2025-10-14 17:53:38','2025-10-14 17:53:38'),
(3842,'sens02',0,0,0,0,NULL,NULL,NULL,NULL,'2025-10-14 17:53:48','2025-10-14 17:53:48'),
(3843,'sens01',0,0,0,0,NULL,NULL,NULL,NULL,'2025-10-14 17:57:19','2025-10-14 17:57:19'),
(3844,'sens01',0,0,0,0,NULL,NULL,NULL,NULL,'2025-10-14 18:38:06','2025-10-14 18:38:06'),
(3845,'sens02',0,0,0,0,NULL,NULL,NULL,NULL,'2025-10-14 18:38:16','2025-10-14 18:38:16');
/*!40000 ALTER TABLE `sensorData` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `spawnElementNotes`
--

DROP TABLE IF EXISTS `spawnElementNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spawnElementNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spawnElementId` int(11) DEFAULT NULL,
  `check_date` datetime DEFAULT NULL,
  `stato` varchar(255) DEFAULT NULL,
  `pict` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `spawnElementId` (`spawnElementId`),
  CONSTRAINT `spawnelementnotes_ibfk_1` FOREIGN KEY (`spawnElementId`) REFERENCES `spawnElements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spawnElementNotes`
--

LOCK TABLES `spawnElementNotes` WRITE;
/*!40000 ALTER TABLE `spawnElementNotes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `spawnElementNotes` VALUES
(3,5,'2025-02-18 23:00:00','Buono',NULL,'wqdas','2025-02-18 18:57:46','2025-02-18 18:57:46');
/*!40000 ALTER TABLE `spawnElementNotes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `spawnElements`
--

DROP TABLE IF EXISTS `spawnElements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spawnElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_code` varchar(255) DEFAULT NULL,
  `relatedId` int(11) NOT NULL,
  `load_date` datetime DEFAULT NULL,
  `pick_date` datetime DEFAULT NULL,
  `pick_reason` varchar(255) DEFAULT NULL,
  `stato` varchar(255) DEFAULT NULL,
  `qt` float DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `spawnId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spawnId` (`spawnId`),
  CONSTRAINT `spawnelements_ibfk_1` FOREIGN KEY (`spawnId`) REFERENCES `spawns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spawnElements`
--

LOCK TABLES `spawnElements` WRITE;
/*!40000 ALTER TABLE `spawnElements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `spawnElements` VALUES
(1,'undefined25B18GSS000',63,'2025-02-18 14:16:14',NULL,NULL,NULL,2,NULL,'2025-02-18 14:16:14','2025-02-18 14:16:14',NULL),
(2,'undefined25B18FLS000',64,'2025-02-18 14:20:21',NULL,NULL,NULL,1.5,NULL,'2025-02-18 14:20:21','2025-02-18 14:20:21',NULL),
(3,'undefined25B18FLS001',64,'2025-02-18 14:20:21',NULL,NULL,NULL,1.5,NULL,'2025-02-18 14:20:21','2025-02-18 14:20:21',NULL),
(4,'PO25B18FLS000',65,'2025-02-18 14:23:48',NULL,NULL,'Buono',1.5,NULL,'2025-02-18 14:23:48','2025-02-18 14:23:48',NULL),
(5,'PO25B18FLS001',65,'2025-02-18 14:23:48','2025-02-17 23:00:00','Contaminazione','Contaminato',3,NULL,'2025-02-18 14:23:48','2025-02-18 18:36:23',NULL),
(6,'PB25B26PRS00',66,'2025-02-26 14:07:19',NULL,NULL,'Buono',1.5,NULL,'2025-02-26 14:07:19','2025-02-26 14:07:19',NULL),
(7,'PB25B26PRS01',66,'2025-02-26 14:07:19',NULL,NULL,'Buono',1.5,NULL,'2025-02-26 14:07:19','2025-02-26 14:07:19',NULL),
(8,'PE25B28DBS00',67,'2025-02-28 14:24:17',NULL,NULL,'Buono',2,NULL,'2025-02-28 14:24:17','2025-02-28 14:24:17',NULL),
(9,'PE25B28DBS01',67,'2025-02-28 14:24:17',NULL,NULL,'Buono',2,NULL,'2025-02-28 14:24:17','2025-02-28 14:24:17',NULL),
(10,'PE25B28DBS02',67,'2025-02-28 14:24:17',NULL,NULL,'Buono',2,NULL,'2025-02-28 14:24:17','2025-02-28 14:24:17',NULL),
(11,'PE25B28DBS03',67,'2025-02-28 14:24:17',NULL,NULL,'Buono',2,NULL,'2025-02-28 14:24:17','2025-02-28 14:24:17',NULL),
(12,'PB25H19PRS00',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(13,'PB25H19PRS01',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(14,'PB25H19PRS02',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(15,'PB25H19PRS03',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(16,'PB25H19PRS04',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(17,'PB25H19PRS05',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(18,'PB25H19PRS06',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(19,'PB25H19PRS07',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(20,'PB25H19PRS08',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(21,'PB25H19PRS09',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(22,'PB25H19PRS10',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(23,'PB25H19PRS11',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(24,'PB25H19PRS12',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(25,'PB25H19PRS13',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(26,'PB25H19PRS14',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(27,'PB25H19PRS15',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(28,'PB25H19PRS16',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(29,'PB25H19PRS17',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(30,'PB25H19PRS18',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(31,'PB25H19PRS19',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(32,'PB25H19PRS20',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(33,'PB25H19PRS21',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(34,'PB25H19PRS22',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(35,'PB25H19PRS23',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(36,'PB25H19PRS24',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(37,'PB25H19PRS25',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(38,'PB25H19PRS26',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(39,'PB25H19PRS27',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(40,'PB25H19PRS28',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(41,'PB25H19PRS29',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(42,'PB25H19PRS30',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(43,'PB25H19PRS31',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(44,'PB25H19PRS32',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(45,'PB25H19PRS33',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(46,'PB25H19PRS34',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(47,'PB25H19PRS35',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(48,'PB25H19PRS36',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(49,'PB25H19PRS37',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(50,'PB25H19PRS38',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(51,'PB25H19PRS39',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(52,'PB25H19PRS40',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(53,'PB25H19PRS41',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(54,'PB25H19PRS42',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(55,'PB25H19PRS43',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(56,'PB25H19PRS44',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(57,'PB25H19PRS45',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(58,'PB25H19PRS46',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(59,'PB25H19PRS47',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(60,'PB25H19PRS48',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(61,'PB25H19PRS49',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(62,'PB25H19PRS50',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(63,'PB25H19PRS51',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(64,'PB25H19PRS52',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(65,'PB25H19PRS53',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(66,'PB25H19PRS54',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(67,'PB25H19PRS55',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(68,'PB25H19PRS56',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(69,'PB25H19PRS57',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(70,'PB25H19PRS58',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(71,'PB25H19PRS59',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(72,'PB25H19PRS60',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(73,'PB25H19PRS61',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(74,'PB25H19PRS62',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(75,'PB25H19PRS63',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(76,'PB25H19PRS64',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(77,'PB25H19PRS65',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(78,'PB25H19PRS66',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(79,'PB25H19PRS67',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(80,'PB25H19PRS68',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(81,'PB25H19PRS69',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(82,'PB25H19PRS70',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(83,'PB25H19PRS71',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(84,'PB25H19PRS72',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(85,'PB25H19PRS73',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(86,'PB25H19PRS74',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(87,'PB25H19PRS75',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(88,'PB25H19PRS76',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(89,'PB25H19PRS77',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(90,'PB25H19PRS78',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(91,'PB25H19PRS79',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(92,'PB25H19PRS80',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(93,'PB25H19PRS81',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(94,'PB25H19PRS82',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(95,'PB25H19PRS83',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(96,'PB25H19PRS84',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(97,'PB25H19PRS85',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(98,'PB25H19PRS86',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(99,'PB25H19PRS87',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(100,'PB25H19PRS88',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(101,'PB25H19PRS89',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(102,'PB25H19PRS90',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(103,'PB25H19PRS91',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(104,'PB25H19PRS92',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(105,'PB25H19PRS93',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(106,'PB25H19PRS94',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(107,'PB25H19PRS95',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(108,'PB25H19PRS96',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(109,'PB25H19PRS97',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(110,'PB25H19PRS98',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(111,'PB25H19PRS99',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(112,'PB25H19PRS100',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(113,'PB25H19PRS101',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(114,'PB25H19PRS102',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(115,'PB25H19PRS103',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(116,'PB25H19PRS104',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(117,'PB25H19PRS105',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(118,'PB25H19PRS106',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(119,'PB25H19PRS107',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(120,'PB25H19PRS108',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(121,'PB25H19PRS109',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(122,'PB25H19PRS110',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(123,'PB25H19PRS111',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(124,'PB25H19PRS112',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(125,'PB25H19PRS113',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(126,'PB25H19PRS114',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(127,'PB25H19PRS115',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(128,'PB25H19PRS116',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(129,'PB25H19PRS117',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(130,'PB25H19PRS118',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(131,'PB25H19PRS119',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(132,'PB25H19PRS120',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(133,'PB25H19PRS121',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(134,'PB25H19PRS122',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(135,'PB25H19PRS123',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(136,'PB25H19PRS124',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(137,'PB25H19PRS125',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(138,'PB25H19PRS126',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(139,'PB25H19PRS127',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(140,'PB25H19PRS128',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(141,'PB25H19PRS129',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(142,'PB25H19PRS130',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(143,'PB25H19PRS131',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(144,'PB25H19PRS132',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(145,'PB25H19PRS133',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(146,'PB25H19PRS134',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(147,'PB25H19PRS135',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(148,'PB25H19PRS136',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(149,'PB25H19PRS137',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(150,'PB25H19PRS138',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(151,'PB25H19PRS139',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(152,'PB25H19PRS140',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(153,'PB25H19PRS141',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(154,'PB25H19PRS142',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(155,'PB25H19PRS143',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(156,'PB25H19PRS144',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(157,'PB25H19PRS145',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(158,'PB25H19PRS146',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(159,'PB25H19PRS147',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(160,'PB25H19PRS148',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL),
(161,'PB25H19PRS149',68,'2025-08-19 18:00:03',NULL,NULL,'Buono',2,NULL,'2025-08-19 18:00:03','2025-08-19 18:00:03',NULL);
/*!40000 ALTER TABLE `spawnElements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `spawns`
--

DROP TABLE IF EXISTS `spawns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spawns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_spawn` varchar(255) DEFAULT NULL,
  `spawn_name` varchar(45) DEFAULT NULL,
  `strainId` int(11) DEFAULT NULL,
  `strainPerc` float DEFAULT NULL,
  `strainWeight` float DEFAULT NULL,
  `qt` float DEFAULT NULL,
  `containerId` int(11) DEFAULT NULL,
  `n_container` int(11) DEFAULT NULL,
  `substrateId` int(11) DEFAULT NULL,
  `substrateQt` int(11) DEFAULT NULL,
  `inoculumId` int(11) DEFAULT NULL,
  `inoculumQt` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `purchased` tinyint(1) DEFAULT 0,
  `storageId` tinyint(2) DEFAULT NULL,
  `exp_date` datetime DEFAULT NULL,
  `expected_maturation_date` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `strainId` (`strainId`),
  KEY `substrateId` (`substrateId`),
  CONSTRAINT `spawns_ibfk_1` FOREIGN KEY (`strainId`) REFERENCES `strains` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `spawns_ibfk_2` FOREIGN KEY (`substrateId`) REFERENCES `substrates` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spawns`
--

LOCK TABLES `spawns` WRITE;
/*!40000 ALTER TABLE `spawns` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `spawns` VALUES
(102,'SSH25H21GSACXX','Shiitake indoor GS',7,NULL,NULL,NULL,17,2,41,NULL,NULL,NULL,NULL,1,3,NULL,NULL,'2025-08-21 12:27:46','2025-08-27 20:21:31'),
(103,'SPO25H21GSACXX','Ple ostreatus GS',8,NULL,NULL,NULL,17,1,41,NULL,NULL,NULL,NULL,1,2,NULL,NULL,'2025-08-21 12:42:20','2025-08-21 12:42:20'),
(107,'SPB25I11PRACXX','licposto',5,NULL,NULL,NULL,19,2,41,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'2025-09-11 16:58:04','2025-09-11 16:58:04'),
(108,'SPO25I11eeACXX','TEST spawn ',1,NULL,NULL,NULL,19,3,41,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'2025-09-11 18:14:41','2025-09-11 18:14:41'),
(109,'SPO25I15eeASXX','addadasd',1,NULL,NULL,NULL,17,2,42,NULL,NULL,NULL,NULL,0,2,NULL,NULL,'2025-09-15 03:53:37','2025-09-15 03:53:37'),
(110,'SPO25I15GSACXX','asdasd',3,NULL,NULL,NULL,18,2,41,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'2025-09-15 04:07:26','2025-09-15 04:07:26'),
(111,'SPO25I27eeACXX','test spawn mic',1,NULL,NULL,NULL,18,5,41,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'2025-09-27 13:27:10','2025-09-27 13:27:10'),
(112,'SPO25I27FLACXX','test',4,NULL,NULL,NULL,18,3,41,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'2025-09-27 18:28:25','2025-09-27 18:28:25');
/*!40000 ALTER TABLE `spawns` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `species` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `species_name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `shortCode` varchar(2) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `species` VALUES
(1,'Lentinula Edodes','LE -  Lentinula Edodes','LE','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(2,'Pleurotus Ostreatus','PO - Pleurotus Ostreatus','PO','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(3,'Pleurotus Djarmon','PR - Pleurotus Djarmon','PR','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(4,'Pleurotus Colombinus','PC - Pleurotus Colombinus','PC','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(5,'Pleurotus cytrinus','PY - Pleurotus cytrinus','PY','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(6,'Ericium erinaceus','EE - Ericium erinaceus','EE','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(7,'Ganoderma lucidum','GL - Ganoderma lucidum','GL','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(8,'Trametes versicolor','TV - Trametes versicolor','TV','2024-12-31 11:49:43','2024-12-31 11:49:43'),
(9,'Strofaria rugosa annulata','SR - Strofaria rugosa annulata','SR','2024-12-31 11:49:43','2024-12-31 11:49:43');
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `storages`
--

DROP TABLE IF EXISTS `storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `storages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_storage` varchar(255) NOT NULL,
  `name_storage` varchar(255) NOT NULL,
  `data_storage` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `rawmaterial` tinyint(1) NOT NULL,
  `strain` tinyint(1) NOT NULL,
  `container` tinyint(1) NOT NULL,
  `spawn` tinyint(1) NOT NULL,
  `mushElement` tinyint(1) NOT NULL,
  `propagation` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storages`
--

LOCK TABLES `storages` WRITE;
/*!40000 ALTER TABLE `storages` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `storages` VALUES
(1,'grow00','Grow mazzano','Via indipendenza, 11 <br> Mazzano',NULL,0,0,0,0,1,1,'2025-02-18 14:16:14','2025-02-18 14:16:14'),
(2,'exp00','Stanza propagazione','Via indipendenza, 11 <br> Mazzano',NULL,0,1,0,1,1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(3,'maga01','Magazzino serle','Via Tesio sopra, 11 <br> 25080, Serle',NULL,1,1,1,1,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(4,'grCastagno','Fungaia tesio  castagno','Via Tesio sopra, 11 <br> 25080, Serle',NULL,0,0,0,0,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `storages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `strains`
--

DROP TABLE IF EXISTS `strains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `strains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_strain` varchar(255) DEFAULT NULL,
  `sub_code` varchar(2) DEFAULT NULL,
  `strain_name` varchar(255) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `species` varchar(255) DEFAULT NULL,
  `species_code` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generation` varchar(255) DEFAULT NULL,
  `derivedFrom` varchar(255) DEFAULT NULL,
  `incubation_temp` varchar(255) DEFAULT NULL,
  `incubation_hum` varchar(255) DEFAULT NULL,
  `incubation_len` varchar(255) DEFAULT NULL,
  `incubation_co2` varchar(255) DEFAULT NULL,
  `incubation_airExch` varchar(45) DEFAULT NULL,
  `incubation_light` varchar(45) DEFAULT NULL,
  `primordia_temp` varchar(45) DEFAULT NULL,
  `primordia_hum` varchar(45) DEFAULT NULL,
  `primordia_len` varchar(45) DEFAULT NULL,
  `primordia_co2` varchar(45) DEFAULT NULL,
  `primordia_airExch` varchar(45) DEFAULT NULL,
  `primordia_light` varchar(45) DEFAULT NULL,
  `fructification_temp` varchar(255) DEFAULT NULL,
  `fructification_hum` varchar(255) DEFAULT NULL,
  `fructification_len` varchar(255) DEFAULT NULL,
  `fructification_co2` varchar(255) DEFAULT NULL,
  `fructification_airExch` varchar(45) DEFAULT NULL,
  `fructification_light` varchar(45) DEFAULT NULL,
  `light_temp` varchar(255) DEFAULT NULL,
  `outdoor` int(11) DEFAULT NULL,
  `indoor` int(11) DEFAULT NULL,
  `buyed` datetime DEFAULT NULL,
  `liked_substrate` varchar(255) DEFAULT NULL,
  `qt` int(11) DEFAULT NULL,
  `supplierId` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strains`
--

LOCK TABLES `strains` WRITE;
/*!40000 ALTER TABLE `strains` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `strains` VALUES
(1,'S241220001PO','ee','Pleurotus001',NULL,'PO - Pleurotus Ostreatus','PO',NULL,'1','','10-22','74','3','1000','2-3','6000','25-24','33','4','1000','3','6000','50-60','30','90','1000','4','','',0,1,'1999-12-31 23:00:00','',0,1,'','2024-12-20 13:16:41','2025-10-06 20:46:08'),
(2,'S241220001PO','rr','Pleurotus002',NULL,'PS - Pleurotus Salmon','PS',NULL,'1','','10-22','74','3','1000','2-3','6000','25-24','33','4','1000','3','6000','50-60','30','90','1000','4','','',0,1,'1999-12-31 23:00:00','',0,1,'','2024-12-20 13:16:41','2025-10-06 21:57:55'),
(3,'POGS10A0001','GS','Pleurotus GS',NULL,'PO - Pleurotus Ostreatus','PO','Pleurotus acquistato su glucke splitzle','1','','18-22','80-85','15','<1000','3','6000','15-22','80-85','','','','','','','','','','','',0,1,'1999-12-31 23:00:00','',0,1,'','2024-12-20 13:16:41','2025-10-04 07:22:04'),
(4,'POFL10A0001','FL','Pleurotus FL',NULL,'PO - Pleurotus Ostreatus','PO','Pleurotus clonato Flexibus','1','','0','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','',NULL,NULL,'',0,1,'1999-12-31 23:00:00','',0,1,'','2024-12-20 13:16:41','2025-02-18 14:23:48'),
(5,'PBPR26B01','PR','Blu Oyster PR',NULL,'PB - Pleurotus Blu','PB','Pleurotus acquistato da Primordia','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-02-12 00:00:00',NULL,2,1,NULL,'2024-12-20 13:16:41','2025-08-19 18:00:03'),
(6,'PEDB28B02','DB','Cardoncello DB',NULL,'PE - Pleurotus Eringy','PE','Pleurotus acquistato da De Blasi','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-02-12 00:00:00',NULL,2,1,NULL,'2024-12-20 13:16:41','2025-02-28 14:24:17'),
(7,'SHGS21H01','GS','Shiitake indoor GS',NULL,'SH - Shiitake','SH','Shiitake indoor','1',NULL,'21',NULL,'3 mesi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-08-21 12:00:00',NULL,5,1,NULL,'2025-08-21 12:00:00','2025-08-21 12:00:00'),
(8,'POGS21H01','GS','Pleurotus ostreatus GS',NULL,'PO - Pleurotus Ostreatus','PO','PO - Pleurotus Ostreatus di GS','1',NULL,'21',NULL,'3 mesi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-08-21 12:00:00',NULL,NULL,2,NULL,'2025-08-21 12:00:00','2025-08-21 12:00:00'),
(10,'tetst','GM',NULL,NULL,'PO','PO','tetst','1','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-05-09 22:00:00',NULL,NULL,8,'','2025-10-05 16:20:41','2025-10-05 16:20:41'),
(11,'sss','GM',NULL,NULL,'PC','PC','ssssss','1','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-06-09 22:00:00',NULL,NULL,8,'','2025-10-06 07:40:18','2025-10-06 07:45:30'),
(12,'sss','ss',NULL,NULL,'PO','PO','sss','ss','ss',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-06-09 22:00:00',NULL,NULL,2,'','2025-10-06 07:47:35','2025-10-06 07:47:35'),
(13,'Test','GM','test',NULL,'PO','PO','Test strain','1','1','10-22','74','3','1000','2-3','6000','25-24','33','4','1000','3','6000','50-60','30','90','1000','4','',NULL,0,1,'2025-06-09 22:00:00','',NULL,7,'','2025-10-06 07:48:22','2025-10-06 09:03:19'),
(14,'odakjpn','ss','pnpn',NULL,'LE','LE','pknknpknkn','sss','','21','','3 mesi','','','','','','','','','','','','','','','',NULL,0,0,'2025-06-09 22:00:00','',NULL,1,'ss','2025-10-06 09:03:51','2025-10-06 09:04:15'),
(15,'LE25L07GM0','GM','test',NULL,'LE -  Lentinula Edodes','LE','test','1','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-07-09 22:00:00',NULL,NULL,8,'','2025-10-07 16:37:08','2025-10-07 19:47:48');
/*!40000 ALTER TABLE `strains` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `substrateElements`
--

DROP TABLE IF EXISTS `substrateElements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `substrateElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `substrateId` int(11) DEFAULT NULL,
  `materialCategoryId` int(11) DEFAULT NULL,
  `rawMaterialId` int(11) DEFAULT NULL,
  `materialName` varchar(50) DEFAULT NULL,
  `qt_hum` float DEFAULT NULL,
  `qt_dry` float DEFAULT NULL,
  `pretreatmentId` int(2) DEFAULT NULL,
  `pretreatmentNote` varchar(100) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `substrateElements`
--

LOCK TABLES `substrateElements` WRITE;
/*!40000 ALTER TABLE `substrateElements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `substrateElements` VALUES
(91,41,30,9,NULL,0,0,NULL,NULL,'2025-08-20 09:36:16','2025-08-20 09:36:16'),
(92,42,31,10,NULL,0,0,NULL,NULL,'2025-08-21 12:24:43','2025-08-21 12:24:43'),
(93,43,30,9,NULL,0,0,NULL,NULL,'2025-08-21 12:43:36','2025-08-21 12:43:36'),
(94,44,34,16,NULL,0,0,NULL,NULL,'2025-08-31 10:52:07','2025-08-31 10:52:07'),
(95,45,30,13,NULL,35,20.59,NULL,NULL,'2025-09-27 18:15:18','2025-09-27 18:15:18'),
(96,45,32,12,NULL,0,0,NULL,NULL,'2025-09-27 18:15:18','2025-09-27 18:15:18'),
(97,45,15,3,NULL,14,7,NULL,NULL,'2025-09-27 18:15:18','2025-09-27 18:15:18');
/*!40000 ALTER TABLE `substrateElements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `substrates`
--

DROP TABLE IF EXISTS `substrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `substrates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_substrate` varchar(255) NOT NULL,
  `name_substrate` varchar(255) NOT NULL,
  `sub_code` varchar(2) DEFAULT NULL,
  `recipeId` int(11) NOT NULL,
  `recipe_name` varchar(255) DEFAULT NULL,
  `pretreatment` varchar(255) DEFAULT NULL,
  `pretreatmentId` int(11) DEFAULT NULL,
  `pretreatmentNote` varchar(255) DEFAULT NULL,
  `qt` float DEFAULT NULL,
  `uom` varchar(3) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `forPurchased` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `substrates`
--

LOCK TABLES `substrates` WRITE;
/*!40000 ALTER TABLE `substrates` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `substrates` VALUES
(41,'SU250804000','ACQ cippato','AC',41,NULL,NULL,NULL,NULL,1000,'Kg','SPAWN','',1,'2025-08-20 09:36:16','2025-08-20 09:36:16'),
(42,'SU250804100','ACQ segatura','AS',42,NULL,NULL,NULL,NULL,10000,'Kg','SPAWN','',0,'2025-08-21 12:24:43','2025-08-21 12:24:43'),
(43,'SU250804200','Cippato misto','',37,NULL,NULL,NULL,NULL,30,'Kg','CULTIVATION','',0,'2025-08-21 12:43:36','2025-08-21 12:43:36'),
(44,'SU250804300','Agar Malto','AM',39,NULL,NULL,NULL,NULL,100,'Gr','INOCULUM','',0,'2025-08-31 10:52:07','2025-08-31 10:52:07'),
(45,'SU250904400','ric mico','gg',43,NULL,NULL,NULL,NULL,50,'Kg','CULTIVATION','',0,'2025-09-27 18:15:18','2025-09-27 18:15:18');
/*!40000 ALTER TABLE `substrates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `field` varchar(45) DEFAULT NULL,
  `taxInfo` varchar(45) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `used` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `suppliers` VALUES
(1,'Io','via le mani dal culo','3291011987','pippo@pippo.it',NULL,NULL,'','2024-12-11 12:50:00','2024-12-11 12:50:00',0),
(2,'Pietta','Paitone','','',NULL,NULL,'','2024-12-11 12:56:19','2024-12-11 12:56:19',0),
(3,'Pietta2','Paitone','','',NULL,NULL,'','2024-12-13 16:46:03','2024-12-13 16:46:03',0),
(7,'Aliexpress','https://it.aliexpress.com','','',NULL,NULL,'','2024-12-27 18:14:38','2024-12-27 18:14:38',0),
(8,'Grower of mushroom','Roma','3333','info@growerofmushroom.it',NULL,NULL,'','2025-10-05 15:48:35','2025-10-05 15:48:35',0);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `todos`
--

DROP TABLE IF EXISTS `todos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `todos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titolo` varchar(255) DEFAULT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `eseguito` tinyint(1) DEFAULT NULL,
  `sezione` varchar(255) DEFAULT NULL,
  `durata` varchar(255) DEFAULT NULL,
  `posizione` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todos`
--

LOCK TABLES `todos` WRITE;
/*!40000 ALTER TABLE `todos` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `todos` VALUES
(37,'qewqwe','qweqwe','0',1,'0','3 h',NULL,'2025-09-21 06:53:10','2025-09-21 07:03:58'),
(40,'dsf sdf sdfs df',' sdfs dfsdf','1',1,'5','3',NULL,'2025-09-21 06:57:37','2025-09-21 06:58:03'),
(43,'asd asd asd ',' asd asd asd','2',1,'0',' 4f',NULL,'2025-09-21 07:08:17','2025-09-21 07:09:54'),
(44,'Preparare cippato','Cippare ad inizio ottobbre','1',0,'2','3 g',NULL,'2025-09-21 07:12:28','2025-09-21 07:12:28'),
(45,'wwwwce ds','d. ds d d d','0',0,'0','3 h',NULL,'2025-09-21 19:51:59','2025-09-21 19:51:59');
/*!40000 ALTER TABLE `todos` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `unknowMessages`
--

DROP TABLE IF EXISTS `unknowMessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `unknowMessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unknowMessages`
--

LOCK TABLES `unknowMessages` WRITE;
/*!40000 ALTER TABLE `unknowMessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `unknowMessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`),
  UNIQUE KEY `username_3` (`username`),
  UNIQUE KEY `username_4` (`username`),
  UNIQUE KEY `username_5` (`username`),
  UNIQUE KEY `username_6` (`username`),
  UNIQUE KEY `username_7` (`username`),
  UNIQUE KEY `username_8` (`username`),
  UNIQUE KEY `username_9` (`username`),
  UNIQUE KEY `username_10` (`username`),
  UNIQUE KEY `username_11` (`username`),
  UNIQUE KEY `username_12` (`username`),
  UNIQUE KEY `username_13` (`username`),
  UNIQUE KEY `username_14` (`username`),
  UNIQUE KEY `username_15` (`username`),
  UNIQUE KEY `username_16` (`username`),
  UNIQUE KEY `username_17` (`username`),
  UNIQUE KEY `username_18` (`username`),
  UNIQUE KEY `username_19` (`username`),
  UNIQUE KEY `username_20` (`username`),
  UNIQUE KEY `username_21` (`username`),
  UNIQUE KEY `username_22` (`username`),
  UNIQUE KEY `username_23` (`username`),
  UNIQUE KEY `username_24` (`username`),
  UNIQUE KEY `username_25` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES
(1,'pippo','$2a$10$mlwtww9I7BovwQ9hnvG9kO2H6dUTZckC.nKi.0er.JGWG9M35OVjq',NULL,NULL,NULL,'2025-01-06 22:00:33','2025-01-06 22:00:33');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-10-14 22:47:33
