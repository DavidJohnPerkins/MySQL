-- MySQL dump 10.13  Distrib 8.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: TestDB
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `model_flag`;
DROP TABLE IF EXISTS `flag`;
DROP TABLE IF EXISTS `attribute_level_1_group_detail`;
DROP TABLE IF EXISTS `attribute_level_1_group`;
DROP TABLE IF EXISTS `attribute_level_2_detail`;
DROP TABLE IF EXISTS `attribute_level_2`;
DROP TABLE IF EXISTS `attribute_level_1_detail`;
DROP TABLE IF EXISTS `attribute_level_1`;
DROP TABLE IF EXISTS `model_name`;

--
-- Table structure for table `flag`
--
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flag` (
  `flag_id` int NOT NULL AUTO_INCREMENT,
  `flag_abbrev` char(8) NOT NULL,
  `flag_desc` varchar(50) NOT NULL,
  PRIMARY KEY (`flag_id`),
  UNIQUE KEY `U_IDX_flag_abbrev` (`flag_abbrev`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag`
--

LOCK TABLES `flag` WRITE;
/*!40000 ALTER TABLE `flag` DISABLE KEYS */;
INSERT INTO `flag` VALUES (1,'NPPIERCE','Has nipple piercing(s)'),(2,'GNPIERCE','Has genital piercing(s)'),(3,'PUBEHAIR','Has pubic hair'),(4,'WMNCHILD','Has womanchild characteristics'),(5,'HTROPORN','Appears in heterosexual pornography'),(6,'LSBNPORN','Appears in lesbian pornography'),(7,'EXCEPTNL','Is exceptional regardless of standouts');
/*!40000 ALTER TABLE `flag` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `attribute_scheme`
--

DROP TABLE IF EXISTS `attribute_scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_scheme` (
  `scheme_id` int NOT NULL AUTO_INCREMENT,
  `scheme_abbrev` varchar(20) NOT NULL,
  `scheme_desc` varchar(50) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`scheme_id`),
  UNIQUE KEY `U_IDX_attr_scheme_abbrev` (`scheme_abbrev`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_scheme`
--

LOCK TABLES `attribute_scheme` WRITE;
/*!40000 ALTER TABLE `attribute_scheme` DISABLE KEYS */;
INSERT INTO `attribute_scheme` VALUES (1,'LATEADOL','Favouring Late Adolescence',1),(2,'FULLERFIGURE','Favouring Fuller Figure',1),(3,'LATEADOLLEVEL','Fav. Late Adolescence Levelling Minor Attributes',0),(1002,'NOPREF','No preferences',1),(1009,'SIMPLE','Simple preferences',1);
/*!40000 ALTER TABLE `attribute_scheme` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `attribute_level_1`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_level_1` (
  `l1_id` int NOT NULL AUTO_INCREMENT,
  `l1_desc` varchar(50) NOT NULL,
  `abbrev` char(4) DEFAULT NULL,
  `for_aggregation` tinyint(1) NOT NULL,
  PRIMARY KEY (`l1_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_level_1`
--

LOCK TABLES `attribute_level_1` WRITE;
/*!40000 ALTER TABLE `attribute_level_1` DISABLE KEYS */;
INSERT INTO `attribute_level_1` VALUES (13,'Eye Colour','EYES',1),(14,'Hair Colour','HAIR',1),(15,'Nationality','NATN',0),(16,'Breast Size','BSIZ',1),(18,'Build','BILD',1),(19,'Attractiveness','ATTR',1),(20,'Youthfulness','YTHF',1),(21,'Complexion','CMPX',1),(22,'Pubic Mound Shape','MONS',1),(23,'Bum Shape','ASHP',1),(24,'Bum Size','ASIZ',1),(37,'Ethnicity','ETHN',1),(40,'Breast Shape','BRSH',1),(41,'Breast Droop','BRDR',1),(42,'Nipple Size','NPSZ',1),(43,'Nipple Shape','NPSH',1),(44,'Nipple Colour','NPCL',1),(46,'Pudenda Attractiveness','PUAT',1),(47,'Nipple Puffiness','NPPF',1);
/*!40000 ALTER TABLE `attribute_level_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_level_1_detail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_level_1_detail` (
  `l1_det_id` int NOT NULL AUTO_INCREMENT,
  `l1_id` int NOT NULL,
  `scheme_id` int NOT NULL,
  `attr_weight` int NOT NULL,
  PRIMARY KEY (`l1_det_id`),
  KEY `FK_attr_level_1_det_attr_level_1` (`l1_id`),
  KEY `FK_attr_level_1_det_attr_scheme` (`scheme_id`),
  CONSTRAINT `FK_attr_level_1_det_attr_level_1` FOREIGN KEY (`l1_id`) REFERENCES `attribute_level_1` (`l1_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_attr_level_1_det_attr_scheme` FOREIGN KEY (`scheme_id`) REFERENCES `attribute_scheme` (`scheme_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_level_1_detail`
--

LOCK TABLES `attribute_level_1_detail` WRITE;
/*!40000 ALTER TABLE `attribute_level_1_detail` DISABLE KEYS */;
INSERT INTO `attribute_level_1_detail` VALUES (1,13,1,3),(2,14,1,2),(3,15,1,1),(4,16,1,6),(5,18,1,4),(6,19,1,9),(7,20,1,5),(8,21,1,4),(9,22,1,6),(10,23,1,6),(11,24,1,6),(12,37,1,2),(13,40,1,8),(14,41,1,6),(15,42,1,6),(16,43,1,6),(17,44,1,3),(18,46,1,8),(19,13,2,3),(20,14,2,2),(21,15,2,1),(22,16,2,6),(23,18,2,4),(24,19,2,9),(25,20,2,5),(26,21,2,4),(27,22,2,6),(28,23,2,6),(29,24,2,6),(30,37,2,2),(31,40,2,8),(32,41,2,6),(33,42,2,6),(34,43,2,6),(35,44,2,3),(36,46,2,8),(37,13,3,2),(38,14,3,2),(39,15,3,1),(40,16,3,6),(41,18,3,4),(42,19,3,9),(43,20,3,5),(44,21,3,4),(45,22,3,6),(46,23,3,6),(47,24,3,6),(48,37,3,2),(49,40,3,8),(50,41,3,6),(51,42,3,6),(52,43,3,6),(53,44,3,3),(54,46,3,8),(1019,47,1,5),(1020,47,2,5),(1021,47,3,5),(1022,13,1002,5),(1023,14,1002,5),(1024,15,1002,5),(1025,16,1002,5),(1026,18,1002,5),(1027,19,1002,5),(1028,20,1002,5),(1029,21,1002,5),(1030,22,1002,5),(1031,23,1002,5),(1032,24,1002,5),(1033,37,1002,5),(1034,40,1002,5),(1035,41,1002,5),(1036,42,1002,5),(1037,43,1002,5),(1038,44,1002,5),(1039,46,1002,5),(1040,47,1002,5),(1136,13,1009,5),(1137,14,1009,5),(1138,15,1009,5),(1139,16,1009,5),(1140,18,1009,5),(1141,19,1009,5),(1142,20,1009,5),(1143,21,1009,5),(1144,22,1009,5),(1145,23,1009,5),(1146,24,1009,5),(1147,37,1009,5),(1148,40,1009,5),(1149,41,1009,5),(1150,42,1009,5),(1151,43,1009,5),(1152,44,1009,5),(1153,46,1009,5),(1154,47,1009,5);
/*!40000 ALTER TABLE `attribute_level_1_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_level_1_group`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_level_1_group` (
  `l1_group_id` int NOT NULL AUTO_INCREMENT,
  `l1_group_abbrev` varchar(10) DEFAULT NULL,
  `l1_group_desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`l1_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_level_1_group`
--

LOCK TABLES `attribute_level_1_group` WRITE;
/*!40000 ALTER TABLE `attribute_level_1_group` DISABLE KEYS */;
INSERT INTO `attribute_level_1_group` VALUES (13,'BREASTS','Breasts, excluding other factors'),(14,'PUBES','Pubes, excluding other factors'),(15,'ARSE','Pubes, excluding other factors'),(16,'FACE','Facial / beauty attributes'),(17,'FACEPLUS','Beauty and physique attributes'),(18,'WAISTUP','Exclude grim-down-south issues'),(19,'NOTPUBES','Everything but pubes'),(20,'ALL','All attributes');
/*!40000 ALTER TABLE `attribute_level_1_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_level_1_group_detail`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_level_1_group_detail` (
  `l1_group_detail_id` int NOT NULL AUTO_INCREMENT,
  `l1_group_id` int NOT NULL,
  `l1_id` int NOT NULL,
  PRIMARY KEY (`l1_group_detail_id`),
  UNIQUE KEY `U_IDX_l1group_l1id` (`l1_group_id`,`l1_id`),
  KEY `FK_l1_id_attribute_level_1` (`l1_id`),
  CONSTRAINT `FK_l1_group_id_l1_group` FOREIGN KEY (`l1_group_id`) REFERENCES `attribute_level_1_group` (`l1_group_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_l1_id_attribute_level_1` FOREIGN KEY (`l1_id`) REFERENCES `attribute_level_1` (`l1_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_level_1_group_detail`
--

LOCK TABLES `attribute_level_1_group_detail` WRITE;
/*!40000 ALTER TABLE `attribute_level_1_group_detail` DISABLE KEYS */;
INSERT INTO `attribute_level_1_group_detail` VALUES (105,13,16),(106,13,40),(107,13,41),(108,13,42),(109,13,43),(110,13,44),(111,13,47),(112,14,22),(113,14,46),(114,15,23),(115,15,24),(116,16,13),(117,16,14),(118,16,19),(119,16,20),(120,16,21),(121,17,13),(122,17,14),(123,17,18),(124,17,19),(125,17,20),(126,17,21),(127,17,37),(128,18,13),(129,18,14),(130,18,16),(131,18,18),(132,18,19),(133,18,20),(134,18,21),(135,18,37),(136,18,40),(137,18,41),(138,18,42),(139,18,43),(140,18,44),(141,18,47),(142,19,13),(143,19,14),(144,19,16),(145,19,18),(146,19,19),(147,19,20),(148,19,21),(149,19,23),(150,19,24),(151,19,37),(152,19,40),(153,19,41),(154,19,42),(155,19,43),(156,19,44),(157,19,47),(158,20,13),(159,20,14),(160,20,15),(161,20,16),(162,20,18),(163,20,19),(164,20,20),(165,20,21),(166,20,22),(167,20,23),(168,20,24),(169,20,37),(170,20,40),(171,20,41),(172,20,42),(173,20,43),(174,20,44),(175,20,46),(176,20,47);
/*!40000 ALTER TABLE `attribute_level_1_group_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_level_2`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_level_2` (
  `l2_id` int NOT NULL AUTO_INCREMENT,
  `l1_id` int NOT NULL,
  `l2_desc` varchar(50) DEFAULT NULL,
  `l2_sort_order` int DEFAULT NULL,
  PRIMARY KEY (`l2_id`),
  KEY `FK_attr_level_2_attr_level_1` (`l1_id`),
  CONSTRAINT `FK_attr_level_2_attr_level_1` FOREIGN KEY (`l1_id`) REFERENCES `attribute_level_1` (`l1_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_level_2`
--

LOCK TABLES `attribute_level_2` WRITE;
/*!40000 ALTER TABLE `attribute_level_2` DISABLE KEYS */;
INSERT INTO `attribute_level_2` VALUES (1,13,'Blue',1),(2,13,'Grey',6),(3,13,'Green',5),(4,13,'Hazel',7),(5,13,'Brown',2),(6,13,'Dark Brown',3),(7,13,'Pale Blue',8),(8,13,'Deep Grey',4),(9,14,'Dyed/Coloured',10),(10,14,'Bleached Blonde',4),(11,14,'White Blonde',15),(12,14,'Ash Blonde',2),(13,14,'Regular Blonde',14),(14,14,'Light Red',12),(15,14,'Bright Red',5),(16,14,'Copper Red',7),(17,14,'Fair',4),(18,14,'Brunette',6),(19,14,'Dark Brunette',8),(20,14,'Black',3),(21,15,'USA',23),(22,15,'Russia',17),(23,15,'Slovenia',18),(24,15,'Czech Republic',8),(25,15,'Croatia',7),(26,15,'Spain',19),(27,15,'Ukraine',21),(28,15,'Hungary',12),(29,15,'Latvia',14),(30,15,'United Kingdom',22),(31,16,'Flat',4),(32,16,'Small',2),(33,16,'Medium',3),(34,16,'Large',4),(35,16,'Oversized',5),(44,18,'Extra-Petite',1),(45,18,'Petite',1),(46,18,'Regular-Petite',3),(47,18,'Regular',5),(48,18,'Heavy-Regular',6),(49,18,'Heavy',5),(50,19,'Plain',8),(51,19,'Gamine',5),(52,19,'Girl-Next-Door',6),(53,19,'Cosmetic-led',7),(54,19,'Pretty',4),(55,19,'Beautiful',3),(56,19,'Knockout',2),(57,19,'Ten',1),(58,21,'Pale',6),(59,21,'Fair',4),(60,21,'Freckled',1),(61,21,'Mediterranean',2),(62,21,'Asian',5),(63,21,'Dark',3),(65,22,'Plump / Retreating',7),(66,22,'Plump / Proud',6),(67,22,'Narrow / Retreating',3),(68,22,'Narrow / Proud',2),(69,22,'Unattractive',8),(70,23,'Peach',3),(71,23,'Slight Lower Sag',5),(72,23,'Heavy Lower Sag',6),(73,23,'Balanced',1),(75,23,'Flat',4),(77,23,'Boyish',2),(78,24,'Small / Flat',2),(79,24,'Petite',1),(80,24,'Medium',3),(81,24,'Large',4),(82,24,'Heavy',5),(83,24,'Oversize',6),(84,37,'White',7),(85,37,'Latino',6),(86,37,'Indian Asian',4),(87,37,'Japanese',3),(88,37,'Chinese',2),(89,37,'Afro-Caribbean',1),(90,37,'Indonesian',5),(91,20,'Mid Teens',1),(92,20,'Late Teens',2),(93,20,'Early Twenties',3),(94,20,'Mid Twenties',4),(95,20,'Late Twenties',5),(96,22,'Natural / Proud',4),(97,22,'Natural / Retreating',5),(98,15,'Belarus',5),(106,14,'Mid Brown',13),(107,14,'Deep Grey',4),(108,15,'Moldova',15),(110,15,'Germany',10),(111,40,'Nubs',1),(112,40,'Conical',2),(113,40,'Dome',5),(114,40,'Full',6),(115,40,'Pendulous',7),(116,41,'None',1),(117,41,'Slight',2),(118,41,'Moderate',3),(119,41,'Heavy',5),(120,42,'Tiny',1),(121,42,'Small',2),(122,42,'Normal',2),(123,42,'Large',4),(124,42,'Very Large',5),(125,43,'Flat',1),(126,43,'Slightly Pert',2),(127,43,'Pert',3),(128,43,'Very Pert',4),(132,44,'Pale',6),(133,44,'Normal',2),(134,44,'Dark',3),(135,22,'Flat / Retreating',1),(136,40,'Semi-Pendulous',4),(137,15,'Not Known',1),(143,46,'Unsightly',6),(144,46,'Noticeable Protrusion',5),(145,46,'Slight Protrusion',4),(146,46,'No Protrusion',3),(147,46,'Plump No Protrusion',1),(148,15,'Brazil',4),(149,14,'Afro',1),(1149,15,'Thailand',20),(1153,15,'Japan',13),(1154,46,'Plump Slight Protrusion',2),(1156,18,'Tall-Petite',4),(1157,40,'Semi-Pendulous Globe',3),(1158,47,'Not Puffy',1),(1159,47,'Slightly Puffy',2),(1160,47,'Puffy',3),(1161,47,'Very Puffy',4),(1162,15,'Armenia',2),(1163,15,'Greece',11),(1164,15,'Poland',16),(1165,15,'Venezuela',24),(1166,15,'Canada',6),(1167,15,'Belgium',3),(1168,15,'France',9),(1169,15,'Colombia',99),(1170,15,'China',99);
/*!40000 ALTER TABLE `attribute_level_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_level_2_detail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_level_2_detail` (
  `l2_det_id` int NOT NULL AUTO_INCREMENT,
  `l2_id` int NOT NULL,
  `scheme_id` int NOT NULL,
  `l2_preference` int NOT NULL,
  PRIMARY KEY (`l2_det_id`),
  KEY `FK_attr_level_2_det_attr_level_2` (`l2_id`),
  KEY `FK_attr_level_2_det_attr_scheme` (`scheme_id`),
  CONSTRAINT `FK_attr_level_2_det_attr_level_2` FOREIGN KEY (`l2_id`) REFERENCES `attribute_level_2` (`l2_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_attr_level_2_det_attr_scheme` FOREIGN KEY (`scheme_id`) REFERENCES `attribute_scheme` (`scheme_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_level_2_detail`
--

LOCK TABLES `attribute_level_2_detail` WRITE;
/*!40000 ALTER TABLE `attribute_level_2_detail` DISABLE KEYS */;
INSERT INTO `attribute_level_2_detail` VALUES (1,1,1,11),(2,2,1,12),(3,3,1,9),(4,4,1,10),(5,5,1,14),(6,6,1,16),(7,7,1,7),(8,8,1,13),(9,9,1,4),(10,10,1,4),(11,11,1,8),(12,12,1,11),(13,13,1,10),(14,14,1,8),(15,15,1,10),(16,16,1,11),(17,17,1,11),(18,18,1,13),(19,19,1,15),(20,20,1,14),(21,106,1,11),(22,107,1,10),(23,21,1,1),(24,22,1,1),(25,23,1,1),(26,24,1,1),(27,25,1,1),(28,26,1,1),(29,27,1,1),(30,28,1,1),(31,29,1,1),(32,30,1,1),(33,98,1,1),(34,108,1,1),(35,110,1,1),(36,137,1,5),(37,31,1,15),(38,32,1,18),(39,33,1,13),(40,34,1,5),(41,35,1,2),(42,44,1,10),(43,45,1,14),(44,46,1,13),(45,47,1,12),(46,48,1,6),(47,49,1,5),(48,50,1,4),(49,51,1,10),(50,52,1,8),(51,53,1,5),(52,54,1,10),(53,55,1,13),(54,56,1,14),(55,57,1,16),(56,91,1,15),(57,92,1,12),(58,93,1,11),(59,94,1,8),(60,95,1,4),(61,58,1,6),(62,59,1,10),(63,60,1,13),(64,61,1,12),(65,62,1,7),(66,63,1,12),(67,65,1,16),(68,66,1,17),(69,67,1,11),(70,68,1,12),(71,69,1,2),(72,96,1,14),(73,97,1,13),(74,135,1,9),(75,70,1,11),(76,71,1,8),(77,72,1,5),(78,73,1,14),(79,75,1,10),(80,77,1,12),(81,78,1,14),(82,79,1,15),(83,80,1,12),(84,81,1,8),(85,82,1,6),(86,83,1,5),(87,84,1,14),(88,85,1,13),(89,86,1,10),(90,87,1,8),(91,88,1,8),(92,89,1,8),(93,90,1,9),(94,111,1,14),(95,112,1,12),(96,113,1,9),(97,114,1,8),(98,115,1,7),(99,136,1,11),(100,116,1,15),(101,117,1,13),(102,118,1,11),(103,119,1,4),(104,120,1,14),(105,121,1,13),(106,122,1,11),(107,123,1,8),(108,124,1,4),(109,125,1,9),(110,126,1,11),(111,127,1,13),(112,128,1,15),(116,132,1,6),(117,133,1,10),(118,134,1,14),(119,143,1,4),(120,144,1,8),(121,145,1,10),(122,146,1,14),(123,147,1,18),(124,1,2,11),(125,2,2,12),(126,3,2,9),(127,4,2,10),(128,5,2,14),(129,6,2,16),(130,7,2,7),(131,8,2,13),(132,9,2,4),(133,10,2,4),(134,11,2,8),(135,12,2,11),(136,13,2,10),(137,14,2,12),(138,15,2,10),(139,16,2,11),(140,17,2,11),(141,18,2,13),(142,19,2,15),(143,20,2,14),(144,106,2,11),(145,107,2,10),(146,21,2,1),(147,22,2,1),(148,23,2,1),(149,24,2,1),(150,25,2,1),(151,26,2,1),(152,27,2,1),(153,28,2,1),(154,29,2,1),(155,30,2,1),(156,98,2,1),(157,108,2,1),(158,110,2,1),(159,137,2,5),(160,31,2,15),(161,32,2,18),(162,33,2,13),(163,34,2,5),(164,35,2,2),(165,44,2,10),(166,45,2,14),(167,46,2,13),(168,47,2,12),(169,48,2,6),(170,49,2,5),(171,50,2,4),(172,51,2,10),(173,52,2,8),(174,53,2,5),(175,54,2,10),(176,55,2,13),(177,56,2,14),(178,57,2,16),(179,91,2,15),(180,92,2,12),(181,93,2,11),(182,94,2,8),(183,95,2,4),(184,58,2,6),(185,59,2,10),(186,60,2,13),(187,61,2,12),(188,62,2,7),(189,63,2,12),(190,65,2,16),(191,66,2,17),(192,67,2,11),(193,68,2,12),(194,69,2,2),(195,96,2,14),(196,97,2,13),(197,135,2,9),(198,70,2,11),(199,71,2,8),(200,72,2,5),(201,73,2,14),(202,75,2,10),(203,77,2,12),(204,78,2,14),(205,79,2,15),(206,80,2,12),(207,81,2,8),(208,82,2,6),(209,83,2,5),(210,84,2,14),(211,85,2,13),(212,86,2,10),(213,87,2,8),(214,88,2,8),(215,89,2,8),(216,90,2,9),(217,111,2,14),(218,112,2,13),(219,113,2,11),(220,114,2,9),(221,115,2,7),(222,136,2,12),(223,116,2,15),(224,117,2,13),(225,118,2,11),(226,119,2,4),(227,120,2,14),(228,121,2,13),(229,122,2,11),(230,123,2,8),(231,124,2,4),(232,125,2,9),(233,126,2,11),(234,127,2,13),(235,128,2,15),(239,132,2,6),(240,133,2,10),(241,134,2,14),(242,143,2,11),(243,144,2,11),(244,145,2,11),(245,146,2,11),(246,147,2,11),(247,1,3,24),(248,2,3,25),(249,3,3,22),(250,4,3,23),(251,5,3,27),(252,6,3,28),(253,7,3,21),(254,8,3,26),(255,9,3,4),(256,10,3,4),(257,11,3,8),(258,12,3,11),(259,13,3,10),(260,14,3,8),(261,15,3,10),(262,16,3,11),(263,17,3,11),(264,18,3,13),(265,19,3,15),(266,20,3,14),(267,106,3,11),(268,107,3,10),(269,21,3,1),(270,22,3,1),(271,23,3,1),(272,24,3,1),(273,25,3,1),(274,26,3,1),(275,27,3,1),(276,28,3,1),(277,29,3,1),(278,30,3,1),(279,98,3,1),(280,108,3,1),(281,110,3,1),(282,137,3,5),(283,31,3,15),(284,32,3,18),(285,33,3,13),(286,34,3,5),(287,35,3,2),(288,44,3,10),(289,45,3,14),(290,46,3,13),(291,47,3,12),(292,48,3,6),(293,49,3,5),(294,50,3,4),(295,51,3,10),(296,52,3,8),(297,53,3,5),(298,54,3,10),(299,55,3,13),(300,56,3,14),(301,57,3,16),(302,91,3,15),(303,92,3,12),(304,93,3,11),(305,94,3,8),(306,95,3,4),(307,58,3,6),(308,59,3,10),(309,60,3,13),(310,61,3,12),(311,62,3,7),(312,63,3,12),(313,65,3,16),(314,66,3,17),(315,67,3,11),(316,68,3,12),(317,69,3,2),(318,96,3,14),(319,97,3,13),(320,135,3,9),(321,70,3,11),(322,71,3,8),(323,72,3,5),(324,73,3,14),(325,75,3,10),(326,77,3,12),(327,78,3,14),(328,79,3,15),(329,80,3,12),(330,81,3,8),(331,82,3,6),(332,83,3,5),(333,84,3,14),(334,85,3,13),(335,86,3,10),(336,87,3,8),(337,88,3,8),(338,89,3,8),(339,90,3,9),(340,111,3,14),(341,112,3,12),(342,113,3,9),(343,114,3,8),(344,115,3,7),(345,136,3,11),(346,116,3,15),(347,117,3,13),(348,118,3,11),(349,119,3,4),(350,120,3,14),(351,121,3,13),(352,122,3,11),(353,123,3,8),(354,124,3,4),(355,125,3,9),(356,126,3,11),(357,127,3,13),(358,128,3,15),(362,132,3,6),(363,133,3,10),(364,134,3,14),(365,143,3,4),(366,144,3,8),(367,145,3,10),(368,146,3,14),(369,147,3,18),(1124,148,1,1),(1125,148,2,1),(1126,148,3,1),(1127,149,1,11),(1128,149,2,11),(1129,149,3,11),(2129,1149,1,1),(2130,1149,2,1),(2131,1149,3,1),(2143,1153,1,1),(2144,1153,2,1),(2145,1153,3,1),(2146,1154,1,16),(2147,1154,2,12),(2148,1154,3,16),(2152,1156,1,15),(2153,1156,2,15),(2154,1156,3,15),(2155,1157,1,12),(2156,1157,2,12),(2157,1157,3,12),(2158,1158,1,18),(2159,1158,2,18),(2160,1158,3,18),(2161,1159,1,16),(2162,1159,2,16),(2163,1159,3,16),(2164,1160,1,14),(2165,1160,2,14),(2166,1160,3,14),(2167,1161,1,12),(2168,1161,2,12),(2169,1161,3,12),(2170,1162,1,1),(2171,1162,2,1),(2172,1162,3,1),(2173,1163,1,1),(2174,1163,2,1),(2175,1163,3,1),(2176,1164,1,1),(2177,1164,2,1),(2178,1164,3,1),(2179,1165,1,1),(2180,1165,2,1),(2181,1165,3,1),(2182,73,1002,10),(2183,77,1002,10),(2184,70,1002,10),(2185,75,1002,10),(2186,71,1002,10),(2187,72,1002,10),(2188,79,1002,10),(2189,78,1002,10),(2190,80,1002,10),(2191,81,1002,10),(2192,82,1002,10),(2193,83,1002,10),(2194,57,1002,10),(2195,56,1002,10),(2196,55,1002,10),(2197,54,1002,10),(2198,51,1002,10),(2199,52,1002,10),(2200,53,1002,10),(2201,50,1002,10),(2202,44,1002,10),(2203,45,1002,10),(2204,46,1002,10),(2205,1156,1002,10),(2206,47,1002,10),(2207,48,1002,10),(2208,49,1002,10),(2209,116,1002,10),(2210,117,1002,10),(2211,118,1002,10),(2212,119,1002,10),(2213,111,1002,10),(2214,112,1002,10),(2215,1157,1002,10),(2216,136,1002,10),(2217,113,1002,10),(2218,114,1002,10),(2219,115,1002,10),(2220,32,1002,10),(2221,31,1002,10),(2222,33,1002,10),(2223,34,1002,10),(2224,35,1002,10),(2225,60,1002,10),(2226,61,1002,10),(2227,63,1002,10),(2228,59,1002,10),(2229,62,1002,10),(2230,58,1002,10),(2231,84,1002,10),(2232,85,1002,10),(2233,86,1002,10),(2234,90,1002,10),(2235,87,1002,10),(2236,88,1002,10),(2237,89,1002,10),(2238,6,1002,10),(2239,5,1002,10),(2240,8,1002,10),(2241,2,1002,10),(2242,1,1002,10),(2243,4,1002,10),(2244,3,1002,10),(2245,7,1002,10),(2246,19,1002,10),(2247,20,1002,10),(2248,18,1002,10),(2249,16,1002,10),(2250,17,1002,10),(2251,12,1002,10),(2252,106,1002,10),(2253,107,1002,10),(2254,13,1002,10),(2255,15,1002,10),(2256,14,1002,10),(2257,11,1002,10),(2258,9,1002,10),(2259,10,1002,10),(2260,149,1002,10),(2261,66,1002,10),(2262,65,1002,10),(2263,96,1002,10),(2264,97,1002,10),(2265,68,1002,10),(2266,67,1002,10),(2267,135,1002,10),(2268,69,1002,10),(2269,137,1002,10),(2270,1162,1002,10),(2271,148,1002,10),(2272,98,1002,10),(2273,25,1002,10),(2274,24,1002,10),(2275,110,1002,10),(2276,1163,1002,10),(2277,28,1002,10),(2278,1153,1002,10),(2279,29,1002,10),(2280,108,1002,10),(2281,1164,1002,10),(2282,22,1002,10),(2283,23,1002,10),(2284,26,1002,10),(2285,1149,1002,10),(2286,27,1002,10),(2287,30,1002,10),(2288,21,1002,10),(2289,1165,1002,10),(2290,134,1002,10),(2291,133,1002,10),(2292,132,1002,10),(2293,1158,1002,10),(2294,1159,1002,10),(2295,1160,1002,10),(2296,1161,1002,10),(2297,126,1002,10),(2298,127,1002,10),(2299,128,1002,10),(2300,125,1002,10),(2301,120,1002,10),(2302,121,1002,10),(2303,122,1002,10),(2304,123,1002,10),(2305,124,1002,10),(2306,147,1002,10),(2307,1154,1002,10),(2308,146,1002,10),(2309,145,1002,10),(2310,144,1002,10),(2311,143,1002,10),(2312,91,1002,10),(2313,92,1002,10),(2314,93,1002,10),(2315,94,1002,10),(2316,95,1002,10),(2992,73,1009,6),(2993,77,1009,5),(2994,70,1009,4),(2995,75,1009,3),(2996,71,1009,2),(2997,72,1009,1),(2998,79,1009,6),(2999,78,1009,5),(3000,80,1009,4),(3001,81,1009,3),(3002,82,1009,2),(3003,83,1009,1),(3004,57,1009,7),(3005,56,1009,6),(3006,55,1009,6),(3007,54,1009,5),(3008,51,1009,5),(3009,52,1009,4),(3010,53,1009,2),(3011,50,1009,2),(3012,44,1009,7),(3013,45,1009,6),(3014,46,1009,5),(3015,1156,1009,4),(3016,47,1009,3),(3017,48,1009,2),(3018,49,1009,1),(3019,116,1009,4),(3020,117,1009,3),(3021,118,1009,2),(3022,119,1009,1),(3023,111,1009,5),(3024,112,1009,5),(3025,1157,1009,4),(3026,136,1009,3),(3027,113,1009,4),(3028,114,1009,2),(3029,115,1009,1),(3030,32,1009,5),(3031,31,1009,4),(3032,33,1009,3),(3033,34,1009,2),(3034,35,1009,1),(3035,60,1009,4),(3036,61,1009,5),(3037,63,1009,6),(3038,59,1009,3),(3039,62,1009,2),(3040,58,1009,1),(3041,84,1009,3),(3042,85,1009,3),(3043,86,1009,3),(3044,90,1009,3),(3045,87,1009,3),(3046,88,1009,3),(3047,89,1009,3),(3048,6,1009,3),(3049,5,1009,3),(3050,8,1009,3),(3051,2,1009,3),(3052,1,1009,2),(3053,4,1009,3),(3054,3,1009,3),(3055,7,1009,1),(3056,19,1009,6),(3057,20,1009,4),(3058,18,1009,5),(3059,16,1009,5),(3060,17,1009,4),(3061,12,1009,4),(3062,106,1009,3),(3063,107,1009,3),(3064,13,1009,3),(3065,15,1009,2),(3066,14,1009,2),(3067,11,1009,2),(3068,9,1009,1),(3069,10,1009,1),(3070,149,1009,2),(3071,66,1009,8),(3072,65,1009,7),(3073,96,1009,6),(3074,97,1009,5),(3075,68,1009,4),(3076,67,1009,3),(3077,135,1009,2),(3078,69,1009,1),(3079,137,1009,5),(3080,1162,1009,5),(3081,148,1009,5),(3082,98,1009,5),(3083,25,1009,5),(3084,24,1009,5),(3085,110,1009,5),(3086,1163,1009,5),(3087,28,1009,5),(3088,1153,1009,5),(3089,29,1009,5),(3090,108,1009,5),(3091,1164,1009,5),(3092,22,1009,5),(3093,23,1009,5),(3094,26,1009,5),(3095,1149,1009,5),(3096,27,1009,5),(3097,30,1009,5),(3098,21,1009,5),(3099,1165,1009,5),(3100,134,1009,3),(3101,133,1009,2),(3102,132,1009,1),(3103,1158,1009,4),(3104,1159,1009,3),(3105,1160,1009,2),(3106,1161,1009,1),(3107,126,1009,2),(3108,127,1009,3),(3109,128,1009,4),(3110,125,1009,1),(3111,120,1009,5),(3112,121,1009,4),(3113,122,1009,3),(3114,123,1009,2),(3115,124,1009,1),(3116,147,1009,6),(3117,1154,1009,5),(3118,146,1009,4),(3119,145,1009,3),(3120,144,1009,2),(3121,143,1009,1),(3122,91,1009,5),(3123,92,1009,4),(3124,93,1009,4),(3125,94,1009,3),(3126,95,1009,2),(3127,1166,1,1),(3128,1166,2,1),(3129,1166,3,1),(3130,1166,1002,1),(3131,1166,1009,1),(3132,1167,1,1),(3133,1167,2,1),(3134,1167,3,1),(3135,1167,1002,1),(3136,1167,1009,1),(3137,1168,1,1),(3138,1168,2,1),(3139,1168,3,1),(3140,1168,1002,1),(3141,1168,1009,1),(3142,1169,1,1),(3143,1169,2,1),(3144,1169,3,1),(3145,1169,1002,1),(3146,1169,1009,1),(3147,1170,1,1),(3148,1170,2,1),(3149,1170,3,1),(3150,1170,1002,1),(3151,1170,1009,1);
/*!40000 ALTER TABLE `attribute_level_2_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `model_id` int NOT NULL AUTO_INCREMENT,
  `sobriquet` varchar(50) NOT NULL,
  `year_of_birth` int NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `for_comparison` tinyint(1) NOT NULL,
  `is_excluded` tinyint(1) NOT NULL,
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `U_IDX_model_sobriquet` (`sobriquet`),
  KEY `IDX_model_for_comparison` (`for_comparison`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_flag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_flag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `model_id` int NOT NULL,
  `flag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `U_IDX_modelflag_modelid_flagid` (`model_id`,`flag_id`),
  KEY `FK_modelflag_flagid_flag` (`flag_id`),
  CONSTRAINT `FK_modelflag_flagid_flag` FOREIGN KEY (`flag_id`) REFERENCES `flag` (`flag_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_modelflag_modelid_model` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_flag`
--

LOCK TABLES `model_flag` WRITE;
/*!40000 ALTER TABLE `model_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_name`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_name` (
  `id` int NOT NULL AUTO_INCREMENT,
  `model_id` int NOT NULL,
  `model_name` varchar(50) NOT NULL,
  `principal_name` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `U_IDX_modelid_nameid` (`model_id`,`id`),
  CONSTRAINT `FK_model_name_model` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_name`
--

LOCK TABLES `model_name` WRITE;
/*!40000 ALTER TABLE `model_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_name` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-16 21:31:31
