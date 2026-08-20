CREATE DATABASE  IF NOT EXISTS `fraudnet_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fraudnet_db`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: fraudnet_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `account_type` varchar(30) DEFAULT NULL,
  `opening_date` date DEFAULT NULL,
  `balance` decimal(18,2) DEFAULT '0.00',
  `account_status` varchar(20) DEFAULT 'ACTIVE',
  `risk_level` varchar(20) DEFAULT 'LOW',
  PRIMARY KEY (`account_id`),
  KEY `fk_account_customer` (`customer_id`),
  CONSTRAINT `fk_account_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `chk_account_balance` CHECK ((`balance` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,1,'SAVINGS','2021-01-15',150000.00,'ACTIVE','LOW'),(2,2,'CURRENT','2020-06-10',800000.00,'ACTIVE','LOW'),(3,3,'SAVINGS','2019-03-05',250000.00,'ACTIVE','LOW'),(4,4,'SAVINGS','2022-07-18',100000.00,'ACTIVE','LOW'),(5,5,'CURRENT','2018-02-12',500000.00,'ACTIVE','LOW');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_relationship`
--

DROP TABLE IF EXISTS `account_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_relationship` (
  `relationship_id` int NOT NULL AUTO_INCREMENT,
  `source_account_id` int NOT NULL,
  `target_account_id` int NOT NULL,
  `relationship_type` varchar(30) DEFAULT NULL,
  `transaction_count` int DEFAULT NULL,
  `total_amount` decimal(18,2) DEFAULT NULL,
  `first_activity` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `risk_score` int DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  KEY `fk_relationship_source` (`source_account_id`),
  KEY `fk_relationship_target` (`target_account_id`),
  CONSTRAINT `fk_relationship_source` FOREIGN KEY (`source_account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `fk_relationship_target` FOREIGN KEY (`target_account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_relationship`
--

LOCK TABLES `account_relationship` WRITE;
/*!40000 ALTER TABLE `account_relationship` DISABLE KEYS */;
INSERT INTO `account_relationship` VALUES (1,1,2,'TRANSFER',5,204000.00,'2026-08-17 09:00:00','2026-08-17 10:10:00',0),(2,2,3,'TRANSFER',1,950000.00,'2026-08-17 10:20:00','2026-08-17 10:20:00',0),(3,3,4,'TRANSFER',1,900000.00,'2026-08-17 10:25:00','2026-08-17 10:25:00',0),(4,4,5,'TRANSFER',1,850000.00,'2026-08-17 10:30:00','2026-08-17 10:30:00',0),(5,5,1,'TRANSFER',1,800000.00,'2026-08-17 10:35:00','2026-08-17 10:35:00',0);
/*!40000 ALTER TABLE `account_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `income` decimal(15,2) DEFAULT NULL,
  `account_open_date` date DEFAULT NULL,
  `customer_status` varchar(20) DEFAULT 'ACTIVE',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Arjun Sharma','1995-04-12','Bengaluru','India','Software Engineer',1200000.00,'2021-01-15','ACTIVE'),(2,'Priya Verma','1992-09-20','Delhi','India','Business Owner',1800000.00,'2020-06-10','ACTIVE'),(3,'Rohan Mehta','1988-02-08','Mumbai','India','Consultant',2500000.00,'2019-03-05','ACTIVE'),(4,'Sneha Rao','1996-11-25','Hyderabad','India','Designer',900000.00,'2022-07-18','ACTIVE'),(5,'Vikram Singh','1985-06-14','Chennai','India','Trader',3000000.00,'2018-02-12','ACTIVE');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `device_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `device_type` varchar(30) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `first_seen` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  PRIMARY KEY (`device_id`),
  KEY `fk_device_customer` (`customer_id`),
  CONSTRAINT `fk_device_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1,1,'MOBILE','192.168.1.10','2024-01-01 09:00:00','2026-08-17 10:00:00'),(2,2,'LAPTOP','192.168.1.11','2023-06-01 10:00:00','2026-08-17 10:05:00'),(3,3,'MOBILE','192.168.1.12','2023-03-01 08:00:00','2026-08-17 10:10:00'),(4,4,'MOBILE','192.168.1.10','2024-02-01 09:00:00','2026-08-17 10:15:00'),(5,5,'LAPTOP','192.168.1.13','2022-01-01 11:00:00','2026-08-17 10:20:00');
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_transaction`
--

DROP TABLE IF EXISTS `financial_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `from_account` int DEFAULT NULL,
  `to_account` int DEFAULT NULL,
  `transaction_time` datetime NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `transaction_type` varchar(30) DEFAULT NULL,
  `channel` varchar(30) DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `device_id` int DEFAULT NULL,
  `status` varchar(20) DEFAULT 'SUCCESS',
  PRIMARY KEY (`transaction_id`),
  KEY `fk_transaction_to_account` (`to_account`),
  KEY `fk_transaction_location` (`location_id`),
  KEY `fk_transaction_device` (`device_id`),
  KEY `idx_from_account_time` (`from_account`,`transaction_time`),
  CONSTRAINT `fk_transaction_device` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`),
  CONSTRAINT `fk_transaction_from_account` FOREIGN KEY (`from_account`) REFERENCES `account` (`account_id`),
  CONSTRAINT `fk_transaction_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_transaction_to_account` FOREIGN KEY (`to_account`) REFERENCES `account` (`account_id`),
  CONSTRAINT `chk_transaction_amount` CHECK ((`amount` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_transaction`
--

LOCK TABLES `financial_transaction` WRITE;
/*!40000 ALTER TABLE `financial_transaction` DISABLE KEYS */;
INSERT INTO `financial_transaction` VALUES (1,1,2,'2026-08-17 09:00:00',10000.00,'TRANSFER','MOBILE',1,1,'SUCCESS'),(2,1,2,'2026-08-17 10:01:00',49000.00,'TRANSFER','MOBILE',1,1,'SUCCESS'),(3,1,2,'2026-08-17 10:04:00',48500.00,'TRANSFER','MOBILE',1,1,'SUCCESS'),(4,1,2,'2026-08-17 10:07:00',49500.00,'TRANSFER','MOBILE',1,1,'SUCCESS'),(5,1,2,'2026-08-17 10:10:00',47000.00,'TRANSFER','MOBILE',1,1,'SUCCESS'),(6,2,3,'2026-08-17 10:20:00',950000.00,'TRANSFER','WEB',2,2,'SUCCESS'),(7,3,4,'2026-08-17 10:25:00',900000.00,'TRANSFER','MOBILE',3,3,'SUCCESS'),(8,4,5,'2026-08-17 10:30:00',850000.00,'TRANSFER','MOBILE',4,4,'SUCCESS'),(9,5,1,'2026-08-17 10:35:00',800000.00,'TRANSFER','WEB',2,5,'SUCCESS');
/*!40000 ALTER TABLE `financial_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fraud_case`
--

DROP TABLE IF EXISTS `fraud_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fraud_case` (
  `case_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `detected_date` date DEFAULT (curdate()),
  `fraud_type` varchar(100) DEFAULT NULL,
  `risk_score` int DEFAULT NULL,
  `case_status` varchar(30) DEFAULT 'OPEN',
  `investigator` varchar(100) DEFAULT NULL,
  `resolution` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`case_id`),
  KEY `fk_case_account` (`account_id`),
  CONSTRAINT `fk_case_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fraud_case`
--

LOCK TABLES `fraud_case` WRITE;
/*!40000 ALTER TABLE `fraud_case` DISABLE KEYS */;
/*!40000 ALTER TABLE `fraud_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Bengaluru','Karnataka','India',12.971600,77.594600),(2,'Delhi','Delhi','India',28.613900,77.209000),(3,'Mumbai','Maharashtra','India',19.076000,72.877700),(4,'Hyderabad','Telangana','India',17.385000,78.486700);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_score`
--

DROP TABLE IF EXISTS `risk_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_score` (
  `risk_score_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `large_transaction_score` int DEFAULT '0',
  `rapid_transaction_score` int DEFAULT '0',
  `device_score` int DEFAULT '0',
  `location_score` int DEFAULT '0',
  `dormant_score` int DEFAULT '0',
  `beneficiary_score` int DEFAULT '0',
  `total_score` int DEFAULT '0',
  `risk_level` varchar(20) DEFAULT NULL,
  `calculation_date` date DEFAULT (curdate()),
  PRIMARY KEY (`risk_score_id`),
  KEY `fk_risk_account` (`account_id`),
  CONSTRAINT `fk_risk_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_score`
--

LOCK TABLES `risk_score` WRITE;
/*!40000 ALTER TABLE `risk_score` DISABLE KEYS */;
INSERT INTO `risk_score` VALUES (8,1,0,45,0,0,0,0,45,'HIGH','2026-08-18'),(9,2,0,0,0,0,0,0,0,'LOW','2026-08-18'),(10,3,0,0,0,0,0,0,0,'LOW','2026-08-18'),(11,4,0,0,0,0,0,0,0,'LOW','2026-08-18'),(12,5,0,0,0,0,0,0,0,'LOW','2026-08-18');
/*!40000 ALTER TABLE `risk_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suspicious_transaction`
--

DROP TABLE IF EXISTS `suspicious_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suspicious_transaction` (
  `suspicious_id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` int NOT NULL,
  `rule_name` varchar(100) NOT NULL,
  `risk_points` int DEFAULT '0',
  `severity` varchar(20) DEFAULT NULL,
  `explanation` varchar(500) DEFAULT NULL,
  `detected_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`suspicious_id`),
  KEY `fk_suspicious_transaction` (`transaction_id`),
  CONSTRAINT `fk_suspicious_transaction` FOREIGN KEY (`transaction_id`) REFERENCES `financial_transaction` (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspicious_transaction`
--

LOCK TABLES `suspicious_transaction` WRITE;
/*!40000 ALTER TABLE `suspicious_transaction` DISABLE KEYS */;
INSERT INTO `suspicious_transaction` VALUES (1,3,'RAPID_TRANSACTION',15,'HIGH','Multiple transactions detected within 10 minutes','2026-08-18 15:54:03'),(2,4,'RAPID_TRANSACTION',15,'HIGH','Multiple transactions detected within 10 minutes','2026-08-18 15:54:03'),(3,5,'RAPID_TRANSACTION',15,'HIGH','Multiple transactions detected within 10 minutes','2026-08-18 15:54:03'),(4,1,'SHARED_DEVICE',10,'MODERATE','Transaction from device shared by multiple customers','2026-08-18 16:18:04'),(5,2,'SHARED_DEVICE',10,'MODERATE','Transaction from device shared by multiple customers','2026-08-18 16:18:04'),(6,8,'SHARED_DEVICE',10,'MODERATE','Transaction from device shared by multiple customers','2026-08-18 16:18:04');
/*!40000 ALTER TABLE `suspicious_transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-18 21:30:21
