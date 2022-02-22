CREATE DATABASE  IF NOT EXISTS `pizza` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pizza`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: pizza
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `item_master`
--

DROP TABLE IF EXISTS `item_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_master` (
  `it_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `it_name` varchar(100) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`it_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_master`
--

LOCK TABLES `item_master` WRITE;
/*!40000 ALTER TABLE `item_master` DISABLE KEYS */;
INSERT INTO `item_master` VALUES (1,'tomato',1,'em1001','2022-02-19 09:51:27','em1001','2022-02-19 09:51:27'),(2,'mozzarella',1,'em1001','2022-02-19 09:51:27','em1001','2022-02-19 09:51:27'),(3,'mozarella di bufala',1,'em1001','2022-02-19 09:51:27','em1001','2022-02-19 09:51:27'),(4,'anchovies',1,'em1001','2022-02-19 09:51:27','em1001','2022-02-19 09:51:27'),(5,'oregano',1,'em1001','2022-02-19 09:51:27','em1001','2022-02-19 09:51:27'),(6,'oil',1,'em1001','2022-02-19 09:51:27','em1001','2022-02-19 09:51:27'),(7,'spicy salami',1,'em1001','2022-02-19 09:51:27','em1001','2022-02-19 09:51:27');
/*!40000 ALTER TABLE `item_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `ot_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pz_id` bigint unsigned NOT NULL,
  `quantity` int DEFAULT NULL,
  `order_by` varchar(10) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `session_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ot_id`),
  KEY `pz_id_fk_idx` (`pz_id`),
  CONSTRAINT `pz_id_fk` FOREIGN KEY (`pz_id`) REFERENCES `pizza_master` (`pz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,2,'cs1001','2022-02-19 09:51:27','or1001'),(2,2,1,'cs1001','2022-02-19 09:51:27','or1001'),(3,3,2,'cs1002','2022-02-19 09:51:27','or1002'),(4,4,3,'cs1002','2022-02-19 09:51:27','or1002'),(5,1,3,'cs1003','2022-02-19 23:12:59','or1003'),(11,3,3,'cs1004','2022-02-20 07:02:41','or1004'),(12,3,3,'cs1004','2022-02-20 07:08:35','or1004'),(13,4,3,'cs1005','2022-02-21 15:44:17','or1005'),(14,3,2,'cus1006','2022-02-22 11:54:26','or1006');
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_master`
--

DROP TABLE IF EXISTS `pizza_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_master` (
  `pz_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pz_name` varchar(100) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_by` varchar(10) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(10) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`pz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='pizza master';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_master`
--

LOCK TABLES `pizza_master` WRITE;
/*!40000 ALTER TABLE `pizza_master` DISABLE KEYS */;
INSERT INTO `pizza_master` VALUES (1,'Margherita',5.00,1,'em1001','2022-02-19 09:49:05','em1001','2022-02-19 09:49:05'),(2,'Bufala',6.00,1,'em1001','2022-02-19 09:49:05','em1001','2022-02-19 09:49:05'),(3,'Romana',5.00,1,'em1001','2022-02-19 09:49:05','em1001','2022-02-19 09:49:05'),(4,'Diavola',7.50,1,'em1001','2022-02-19 09:49:05','em1001','2022-02-19 09:49:05'),(5,'Pizza Bianca',5.00,1,'em1001','2022-02-19 09:49:05','em1001','2022-02-19 09:49:05');
/*!40000 ALTER TABLE `pizza_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pz_item_mapping`
--

DROP TABLE IF EXISTS `pz_item_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pz_item_mapping` (
  `pzit_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pz_id` bigint unsigned NOT NULL,
  `it_id` bigint unsigned NOT NULL,
  `status` int DEFAULT '0',
  PRIMARY KEY (`pzit_id`),
  KEY `pz_id_fk_itmap_idx` (`pz_id`),
  KEY `it_id_fk_itmap_idx` (`it_id`),
  CONSTRAINT `it_id_fk_itmap` FOREIGN KEY (`it_id`) REFERENCES `item_master` (`it_id`),
  CONSTRAINT `pz_id_fk_itmap` FOREIGN KEY (`pz_id`) REFERENCES `pizza_master` (`pz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pz_item_mapping`
--

LOCK TABLES `pz_item_mapping` WRITE;
/*!40000 ALTER TABLE `pz_item_mapping` DISABLE KEYS */;
INSERT INTO `pz_item_mapping` VALUES (1,1,1,1),(2,1,2,1),(3,2,1,1),(4,2,3,1),(5,3,1,1),(6,3,2,1),(7,3,4,1),(8,3,5,1),(9,3,6,1),(10,4,1,1),(11,4,2,1),(12,4,7,1);
/*!40000 ALTER TABLE `pz_item_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pz_price_history`
--

DROP TABLE IF EXISTS `pz_price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pz_price_history` (
  `pp_id` int unsigned NOT NULL AUTO_INCREMENT,
  `pz_id` bigint unsigned NOT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`pp_id`),
  KEY `pz_id_fk_history_idx` (`pz_id`),
  CONSTRAINT `pz_id_fk_history` FOREIGN KEY (`pz_id`) REFERENCES `pizza_master` (`pz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pz_price_history`
--

LOCK TABLES `pz_price_history` WRITE;
/*!40000 ALTER TABLE `pz_price_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `pz_price_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-22 12:57:33
