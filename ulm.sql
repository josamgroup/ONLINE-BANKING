-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ulm
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

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

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
INSERT INTO `activity_log` VALUES (1,'default','Reconfigure Module:Share',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-09-15 10:09:29','2020-09-15 10:09:29'),(2,'default','Reconfigure Module:Share',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-09-15 10:10:46','2020-09-15 10:10:46'),(3,'default','Create Share Charge',1,'Modules\\Share\\Entities\\ShareCharge',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-09-15 10:54:01','2020-09-15 10:54:01'),(4,'default','Update Share Charge',1,'Modules\\Share\\Entities\\ShareCharge',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-09-15 10:54:21','2020-09-15 10:54:21'),(5,'default','Create Share Products',1,'Modules\\Share\\Entities\\ShareProduct',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-09-15 11:57:59','2020-09-15 11:57:59'),(6,'default','Update Share Products',1,'Modules\\Share\\Entities\\ShareProduct',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-09-15 12:07:17','2020-09-15 12:07:17'),(7,'default','Update Share Products',1,'Modules\\Share\\Entities\\ShareProduct',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-09-15 12:09:21','2020-09-15 12:09:21'),(8,'default','Create Fund',1,'Modules\\Loan\\Entities\\Fund',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-09-22 13:58:56','2020-09-22 13:58:56'),(9,'default','Create Client Type',1,'Modules\\Client\\Entities\\ClientType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-09-22 13:59:21','2020-09-22 13:59:21'),(10,'default','Create Client Identification Type',1,'Modules\\Client\\Entities\\ClientIdentificationType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-09-22 13:59:45','2020-09-22 13:59:45'),(11,'default','Create Payment Type',1,'Modules\\Core\\Entities\\PaymentType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-09-22 14:00:09','2020-09-22 14:00:09'),(12,'default','Create Loan Purpose',1,'Modules\\Loan\\Entities\\LoanPurpose',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-09-22 14:00:30','2020-09-22 14:00:30'),(13,'default','Create Loan Product',1,'Modules\\Loan\\Entities\\LoanProduct',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-09-22 14:04:21','2020-09-22 14:04:21'),(14,'default','Create Client',1,'Modules\\Client\\Entities\\Client',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-09-22 14:05:08','2020-09-22 14:05:08'),(15,'default','Update Client Status',1,'Modules\\Client\\Entities\\Client',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-09-22 14:05:24','2020-09-22 14:05:24'),(16,'default','Create Loan',1,'Modules\\Loan\\Entities\\Loan',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-09-22 14:06:02','2020-09-22 14:06:02'),(17,'default','Approve Loan',1,'Modules\\Loan\\Entities\\Loan',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-09-22 14:06:08','2020-09-22 14:06:08'),(18,'default','Disburse Loan',1,'Modules\\Loan\\Entities\\Loan',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-09-22 14:06:16','2020-09-22 14:06:16'),(19,'default','Create Savings Products',1,'Modules\\Savings\\Entities\\SavingsProduct',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-02 06:28:23','2020-10-02 06:28:23'),(20,'default','Create Savings',1,'Modules\\Savings\\Entities\\Savings',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-02 06:28:35','2020-10-02 06:28:35'),(21,'default','Approve Savings',1,'Modules\\Savings\\Entities\\Savings',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-02 06:28:40','2020-10-02 06:28:40'),(22,'default','Activate Savings',1,'Modules\\Savings\\Entities\\Savings',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-02 06:28:44','2020-10-02 06:28:44'),(23,'default','Create Share',1,'Modules\\Share\\Entities\\Share',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-02 07:49:36','2020-10-02 07:49:36'),(24,'default','Update Share',1,'Modules\\Share\\Entities\\Share',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-02 10:38:40','2020-10-02 10:38:40'),(25,'default','Approve Shares',1,'Modules\\Share\\Entities\\Share',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-03 16:22:08','2020-10-03 16:22:08'),(26,'default','Activate Share',1,'Modules\\Share\\Entities\\Share',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-07 11:15:10','2020-10-07 11:15:10'),(27,'default','Create Income Type',1,'Modules\\Income\\Entities\\IncomeType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-07 16:49:33','2020-10-07 16:49:33'),(28,'default','Redeem Share',1,'Modules\\Share\\Entities\\Share',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-08 13:15:09','2020-10-08 13:15:09'),(29,'default','Purchase Share',1,'Modules\\Share\\Entities\\Share',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-08 13:19:35','2020-10-08 13:19:35'),(30,'default','Reconfigure Module:Core',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-11 10:42:55','2020-10-11 10:42:55'),(31,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:23','2020-10-13 08:27:23'),(32,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:23','2020-10-13 08:27:23'),(33,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:23','2020-10-13 08:27:23'),(34,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:24','2020-10-13 08:27:24'),(35,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:24','2020-10-13 08:27:24'),(36,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:24','2020-10-13 08:27:24'),(37,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:24','2020-10-13 08:27:24'),(38,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:24','2020-10-13 08:27:24'),(39,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:25','2020-10-13 08:27:25'),(40,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:25','2020-10-13 08:27:25'),(41,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:25','2020-10-13 08:27:25'),(42,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:25','2020-10-13 08:27:25'),(43,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:25','2020-10-13 08:27:25'),(44,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:25','2020-10-13 08:27:25'),(45,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:26','2020-10-13 08:27:26'),(46,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:26','2020-10-13 08:27:26'),(47,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:26','2020-10-13 08:27:26'),(48,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:26','2020-10-13 08:27:26'),(49,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:26','2020-10-13 08:27:26'),(50,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:27','2020-10-13 08:27:27'),(51,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:28','2020-10-13 08:27:28'),(52,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:28','2020-10-13 08:27:28'),(53,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:28','2020-10-13 08:27:28'),(54,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:29','2020-10-13 08:27:29'),(55,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:29','2020-10-13 08:27:29'),(56,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:29','2020-10-13 08:27:29'),(57,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:30','2020-10-13 08:27:30'),(58,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:30','2020-10-13 08:27:30'),(59,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:30','2020-10-13 08:27:30'),(60,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:30','2020-10-13 08:27:30'),(61,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:31','2020-10-13 08:27:31'),(62,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:31','2020-10-13 08:27:31'),(63,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:31','2020-10-13 08:27:31'),(64,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:32','2020-10-13 08:27:32'),(65,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:32','2020-10-13 08:27:32'),(66,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:32','2020-10-13 08:27:32'),(67,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:33','2020-10-13 08:27:33'),(68,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:33','2020-10-13 08:27:33'),(69,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:34','2020-10-13 08:27:34'),(70,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:34','2020-10-13 08:27:34'),(71,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:40','2020-10-13 08:27:40'),(72,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:40','2020-10-13 08:27:40'),(73,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:40','2020-10-13 08:27:40'),(74,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:40','2020-10-13 08:27:40'),(75,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:40','2020-10-13 08:27:40'),(76,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:41','2020-10-13 08:27:41'),(77,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:41','2020-10-13 08:27:41'),(78,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:41','2020-10-13 08:27:41'),(79,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:42','2020-10-13 08:27:42'),(80,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:42','2020-10-13 08:27:42'),(81,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:42','2020-10-13 08:27:42'),(82,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:43','2020-10-13 08:27:43'),(83,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:43','2020-10-13 08:27:43'),(84,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:44','2020-10-13 08:27:44'),(85,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:44','2020-10-13 08:27:44'),(86,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:44','2020-10-13 08:27:44'),(87,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:45','2020-10-13 08:27:45'),(88,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 08:27:45','2020-10-13 08:27:45'),(89,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 09:02:47','2020-10-13 09:02:47'),(90,'default','Reconfigure Module:Dashboard',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-13 11:48:46','2020-10-13 11:48:46'),(91,'default','Create User',2,'Modules\\User\\Entities\\User',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-14 07:36:47','2020-10-14 07:36:47'),(92,'default','Create User',3,'Modules\\User\\Entities\\User',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-10-14 07:37:30','2020-10-14 07:37:30'),(93,'default','Create User',4,'Modules\\User\\Entities\\User',1,'Modules\\User\\Entities\\User','{\"id\":4}','2020-10-15 12:41:00','2020-10-15 12:41:00'),(94,'default','Create User',5,'Modules\\User\\Entities\\User',1,'Modules\\User\\Entities\\User','{\"id\":5}','2020-10-15 13:09:08','2020-10-15 13:09:08'),(95,'default','Create User',6,'Modules\\User\\Entities\\User',1,'Modules\\User\\Entities\\User','{\"id\":6}','2020-10-15 13:11:20','2020-10-15 13:11:20'),(96,'default','Delete User',4,'Modules\\User\\Entities\\User',1,'Modules\\User\\Entities\\User','{\"id\":4}','2020-10-15 13:27:18','2020-10-15 13:27:18'),(97,'default','Delete User',6,'Modules\\User\\Entities\\User',1,'Modules\\User\\Entities\\User','{\"id\":6}','2020-10-15 13:32:35','2020-10-15 13:32:35'),(98,'default','Update User',2,'Modules\\User\\Entities\\User',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-15 14:23:11','2020-10-15 14:23:11'),(99,'default','Update User',1,'Modules\\User\\Entities\\User',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-15 14:25:11','2020-10-15 14:25:11'),(100,'default','Update User',1,'Modules\\User\\Entities\\User',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-15 14:26:46','2020-10-15 14:26:46'),(101,'default','Create Role',3,'Spatie\\Permission\\Models\\Role',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-10-18 09:54:50','2020-10-18 09:54:50'),(102,'default','Update Role',3,'Spatie\\Permission\\Models\\Role',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-10-18 09:59:39','2020-10-18 09:59:39'),(103,'default','Update Settings',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-18 17:34:34','2020-10-18 17:34:34'),(104,'default','Update Settings',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-18 17:34:43','2020-10-18 17:34:43'),(105,'default','Create Currency',2,'Modules\\Core\\Entities\\Currency',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-19 07:15:21','2020-10-19 07:15:21'),(106,'default','Update Currency',1,'Modules\\Core\\Entities\\Currency',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-19 07:32:24','2020-10-19 07:32:24'),(107,'default','Create Payment Type',2,'Modules\\Core\\Entities\\PaymentType',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-19 07:57:26','2020-10-19 07:57:26'),(108,'default','Update Payment Type',2,'Modules\\Core\\Entities\\PaymentType',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-19 08:17:20','2020-10-19 08:17:20'),(109,'default','Create Branch',2,'Modules\\Branch\\Entities\\Branch',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-20 07:51:37','2020-10-20 07:51:37'),(110,'default','Update Branch',2,'Modules\\Branch\\Entities\\Branch',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-20 07:57:09','2020-10-20 07:57:09'),(111,'default','Create Chart Of Account',1,'Modules\\Accounting\\Entities\\ChartOfAccount',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-20 10:28:11','2020-10-20 10:28:11'),(112,'default','Update Chart Of Account',1,'Modules\\Accounting\\Entities\\ChartOfAccount',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-20 10:31:25','2020-10-20 10:31:25'),(113,'default','Create Journal Entry',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-20 12:22:55','2020-10-20 12:22:55'),(114,'default','Create Client',2,'Modules\\Client\\Entities\\Client',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-20 14:18:38','2020-10-20 14:18:38'),(115,'default','Update Client Status',2,'Modules\\Client\\Entities\\Client',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-21 11:48:29','2020-10-21 11:48:29'),(116,'default','Update Client Status',2,'Modules\\Client\\Entities\\Client',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-21 11:48:45','2020-10-21 11:48:45'),(117,'default','Create Client File',1,'Modules\\Client\\Entities\\ClientFile',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-21 12:05:36','2020-10-21 12:05:36'),(118,'default','Create Client Identification',1,'Modules\\Client\\Entities\\ClientIdentification',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-21 12:06:02','2020-10-21 12:06:02'),(119,'default','Update Client Identification',1,'Modules\\Client\\Entities\\ClientIdentification',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-21 12:06:16','2020-10-21 12:06:16'),(120,'default','Create Client Identification',2,'Modules\\Client\\Entities\\ClientIdentification',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-21 13:39:24','2020-10-21 13:39:24'),(121,'default','Update Client Identification',2,'Modules\\Client\\Entities\\ClientIdentification',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-21 13:44:46','2020-10-21 13:44:46'),(122,'default','Update Client Identification',1,'Modules\\Client\\Entities\\ClientIdentification',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-21 13:44:59','2020-10-21 13:44:59'),(123,'default','Create Client File',2,'Modules\\Client\\Entities\\ClientFile',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-21 13:52:40','2020-10-21 13:52:40'),(124,'default','Update Client File',1,'Modules\\Client\\Entities\\ClientFile',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-21 13:55:03','2020-10-21 13:55:03'),(125,'default','Create Client User',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-10-21 14:23:51','2020-10-21 14:23:51'),(126,'default','Create Client Type',2,'Modules\\Client\\Entities\\ClientType',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-21 14:53:25','2020-10-21 14:53:25'),(127,'default','Update Client Type',2,'Modules\\Client\\Entities\\ClientType',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-21 14:55:16','2020-10-21 14:55:16'),(128,'default','Create Client Title',1,'Modules\\Client\\Entities\\Title',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 10:29:05','2020-10-22 10:29:05'),(129,'default','Update Client Title',1,'Modules\\Client\\Entities\\Title',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 10:30:20','2020-10-22 10:30:20'),(130,'default','Create Profession',1,'Modules\\Client\\Entities\\Profession',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 10:45:11','2020-10-22 10:45:11'),(131,'default','Update Profession',1,'Modules\\Client\\Entities\\Profession',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 10:45:21','2020-10-22 10:45:21'),(132,'default','Create Client Relationship',1,'Modules\\Client\\Entities\\ClientRelationship',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 10:49:55','2020-10-22 10:49:55'),(133,'default','Update Client Relationship',1,'Modules\\Client\\Entities\\ClientRelationship',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 10:50:07','2020-10-22 10:50:07'),(134,'default','Create Client Identification Type',2,'Modules\\Client\\Entities\\ClientIdentificationType',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-22 10:56:57','2020-10-22 10:56:57'),(135,'default','Update Client Identification Type',2,'Modules\\Client\\Entities\\ClientIdentificationType',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-22 10:57:07','2020-10-22 10:57:07'),(136,'default','Create Client Next Of Kin',1,'Modules\\Client\\Entities\\ClientNextOfKin',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 11:18:43','2020-10-22 11:18:43'),(137,'default','Update Client Next Of Kin',1,'Modules\\Client\\Entities\\ClientNextOfKin',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 11:26:55','2020-10-22 11:26:55'),(138,'default','Create SMS Gateway',1,'Modules\\Communication\\Entities\\SmsGateway',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 12:16:41','2020-10-22 12:16:41'),(139,'default','Update SMS Gateway',1,'Modules\\Communication\\Entities\\SmsGateway',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 12:19:39','2020-10-22 12:19:39'),(140,'default','Update SMS Gateway',1,'Modules\\Communication\\Entities\\SmsGateway',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 12:19:57','2020-10-22 12:19:57'),(141,'default','Create Communication Campaign',1,'Modules\\Communication\\Entities\\CommunicationCampaign',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 13:45:51','2020-10-22 13:45:51'),(142,'default','Update Communication Campaign',1,'Modules\\Communication\\Entities\\CommunicationCampaign',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 13:50:06','2020-10-22 13:50:06'),(143,'default','Update Communication Campaign',1,'Modules\\Communication\\Entities\\CommunicationCampaign',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 13:59:09','2020-10-22 13:59:09'),(144,'default','Create Custom Field',1,'Modules\\CustomField\\Entities\\CustomField',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 15:05:01','2020-10-22 15:05:01'),(145,'default','Update Custom Field',1,'Modules\\CustomField\\Entities\\CustomField',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 15:07:05','2020-10-22 15:07:05'),(146,'default','Create Chart Of Account',2,'Modules\\Accounting\\Entities\\ChartOfAccount',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-22 16:26:48','2020-10-22 16:26:48'),(147,'default','Update Chart Of Account',2,'Modules\\Accounting\\Entities\\ChartOfAccount',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-22 16:27:07','2020-10-22 16:27:07'),(148,'default','Create Chart Of Account',3,'Modules\\Accounting\\Entities\\ChartOfAccount',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-10-22 16:27:26','2020-10-22 16:27:26'),(149,'default','Create Chart Of Account',4,'Modules\\Accounting\\Entities\\ChartOfAccount',1,'Modules\\User\\Entities\\User','{\"id\":4}','2020-10-22 16:27:53','2020-10-22 16:27:53'),(150,'default','Create Chart Of Account',5,'Modules\\Accounting\\Entities\\ChartOfAccount',1,'Modules\\User\\Entities\\User','{\"id\":5}','2020-10-22 16:28:11','2020-10-22 16:28:11'),(151,'default','Create Expense Type',1,'Modules\\Expense\\Entities\\ExpenseType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 16:32:47','2020-10-22 16:32:47'),(152,'default','Update Expense Type',1,'Modules\\Expense\\Entities\\ExpenseType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 16:34:18','2020-10-22 16:34:18'),(153,'default','Create Expense',1,'Modules\\Expense\\Entities\\Expense',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 16:56:56','2020-10-22 16:56:56'),(154,'default','Update Expense',1,'Modules\\Expense\\Entities\\Expense',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-22 16:57:14','2020-10-22 16:57:14'),(155,'default','Create Income Type',2,'Modules\\Income\\Entities\\IncomeType',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-23 07:10:19','2020-10-23 07:10:19'),(156,'default','Update Income Type',2,'Modules\\Income\\Entities\\IncomeType',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-10-23 07:12:16','2020-10-23 07:12:16'),(157,'default','Update Income Type',1,'Modules\\Income\\Entities\\IncomeType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-23 07:12:31','2020-10-23 07:12:31'),(158,'default','Create Income',1,'Modules\\Income\\Entities\\Income',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-23 08:08:29','2020-10-23 08:08:29'),(159,'default','Update Income',1,'Modules\\Income\\Entities\\Income',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-23 08:12:43','2020-10-23 08:12:43'),(160,'default','Create Asset Type',1,'Modules\\Asset\\Entities\\AssetType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-26 10:50:25','2020-10-26 10:50:25'),(161,'default','Update Asset Type',1,'Modules\\Asset\\Entities\\AssetType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-26 11:03:01','2020-10-26 11:03:01'),(162,'default','Create Asset',1,'Modules\\Asset\\Entities\\Asset',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-27 15:32:59','2020-10-27 15:32:59'),(163,'default','Update Asset',1,'Modules\\Asset\\Entities\\Asset',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-27 15:38:22','2020-10-27 15:38:22'),(164,'default','Create Payroll Item',1,'Modules\\Payroll\\Entities\\PayrollItem',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-27 16:19:42','2020-10-27 16:19:42'),(165,'default','Update Payroll Item',1,'Modules\\Payroll\\Entities\\PayrollItem',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-27 16:21:43','2020-10-27 16:21:43'),(166,'default','Update Payroll Item',1,'Modules\\Payroll\\Entities\\PayrollItem',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-10-27 16:21:49','2020-10-27 16:21:49'),(167,'default','Create Payroll Template',1,'Modules\\Payroll\\Entities\\PayrollTemplate',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-11-23 06:56:09','2020-11-23 06:56:09'),(168,'default','Update Payroll Template',1,'Modules\\Payroll\\Entities\\PayrollTemplate',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-11-23 07:08:20','2020-11-23 07:08:20'),(169,'default','Create Payroll',2,'Modules\\Payroll\\Entities\\Payroll',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-11-27 07:52:06','2020-11-27 07:52:06'),(170,'default','Delete Payroll',1,'Modules\\Payroll\\Entities\\Payroll',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-11-27 07:52:20','2020-11-27 07:52:20'),(171,'default','Update Payroll',2,'Modules\\Payroll\\Entities\\Payroll',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-11-27 07:57:40','2020-11-27 07:57:40'),(172,'default','Create Payroll Payment',1,'Modules\\Payroll\\Entities\\PayrollPayment',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-11-27 08:35:07','2020-11-27 08:35:07'),(173,'default','Update Payroll Payment',1,'Modules\\Payroll\\Entities\\PayrollPayment',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-11-27 08:42:16','2020-11-27 08:42:16'),(174,'default','Create Fund',2,'Modules\\Loan\\Entities\\Fund',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-11-30 08:11:15','2020-11-30 08:11:15'),(175,'default','Update Fund',2,'Modules\\Loan\\Entities\\Fund',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-11-30 08:12:43','2020-11-30 08:12:43'),(176,'default','Create Loan Collateral Type',1,'Modules\\Loan\\Entities\\LoanCollateralType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-11-30 08:33:28','2020-11-30 08:33:28'),(177,'default','Update Loan Collateral Type',1,'Modules\\Loan\\Entities\\LoanCollateralType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-11-30 08:41:17','2020-11-30 08:41:17'),(178,'default','Update Loan Collateral Type',1,'Modules\\Loan\\Entities\\LoanCollateralType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-11-30 08:41:17','2020-11-30 08:41:17'),(179,'default','Create Loan Purpose',2,'Modules\\Loan\\Entities\\LoanPurpose',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-11-30 08:51:58','2020-11-30 08:51:58'),(180,'default','Update Loan Purpose',1,'Modules\\Loan\\Entities\\LoanPurpose',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-11-30 08:52:52','2020-11-30 08:52:52'),(181,'default','Create Loan Charge',1,'Modules\\Loan\\Entities\\LoanCharge',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-11-30 10:31:04','2020-11-30 10:31:04'),(182,'default','Update Loan Charge',1,'Modules\\Loan\\Entities\\LoanCharge',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-11-30 10:35:30','2020-11-30 10:35:30'),(183,'default','Create Loan Product',3,'Modules\\Loan\\Entities\\LoanProduct',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-11-30 14:40:07','2020-11-30 14:40:07'),(184,'default','Update Loan Product',3,'Modules\\Loan\\Entities\\LoanProduct',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-11-30 14:57:26','2020-11-30 14:57:26'),(185,'default','Update Loan Product',1,'Modules\\Loan\\Entities\\LoanProduct',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-11-30 15:05:53','2020-11-30 15:05:53'),(186,'default','Create Loan',2,'Modules\\Loan\\Entities\\Loan',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-02 12:19:06','2020-12-02 12:19:06'),(187,'default','Update Loan',2,'Modules\\Loan\\Entities\\Loan',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-02 14:21:04','2020-12-02 14:21:04'),(188,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-02 15:42:58','2020-12-02 15:42:58'),(189,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-02 15:43:17','2020-12-02 15:43:17'),(190,'default','Approve Loan',2,'Modules\\Loan\\Entities\\Loan',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-02 16:07:50','2020-12-02 16:07:50'),(191,'default','Disburse Loan',2,'Modules\\Loan\\Entities\\Loan',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-02 16:11:09','2020-12-02 16:11:09'),(192,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-02 16:14:32','2020-12-02 16:14:32'),(193,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-02 16:14:41','2020-12-02 16:14:41'),(194,'default','Create Loan File',1,'Modules\\Loan\\Entities\\LoanFile',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-03 07:10:42','2020-12-03 07:10:42'),(195,'default','Create Loan File',2,'Modules\\Loan\\Entities\\LoanFile',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-03 07:11:32','2020-12-03 07:11:32'),(196,'default','Update Loan File',1,'Modules\\Loan\\Entities\\LoanFile',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-03 07:31:52','2020-12-03 07:31:52'),(197,'default','Update Loan File',2,'Modules\\Loan\\Entities\\LoanFile',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-03 07:32:06','2020-12-03 07:32:06'),(198,'default','Create Loan Collateral',1,'Modules\\Loan\\Entities\\LoanCollateral',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-03 07:54:16','2020-12-03 07:54:16'),(199,'default','Update Loan Collateral',1,'Modules\\Loan\\Entities\\LoanCollateral',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-03 07:57:13','2020-12-03 07:57:13'),(200,'default','Create Loan Note',1,'Modules\\Loan\\Entities\\LoanNote',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-03 08:04:09','2020-12-03 08:04:09'),(201,'default','Create Loan Note',2,'Modules\\Loan\\Entities\\LoanNote',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-03 08:14:23','2020-12-03 08:14:23'),(202,'default','Create Loan Guarantor',1,'Modules\\Loan\\Entities\\LoanGuarantor',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-03 09:06:32','2020-12-03 09:06:32'),(203,'default','Create Loan Guarantor',2,'Modules\\Loan\\Entities\\LoanGuarantor',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-03 09:13:47','2020-12-03 09:13:47'),(204,'default','Update Loan Guarantor',1,'Modules\\Loan\\Entities\\LoanGuarantor',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-03 09:22:57','2020-12-03 09:22:57'),(205,'default','Update Loan Guarantor',2,'Modules\\Loan\\Entities\\LoanGuarantor',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-03 09:24:04','2020-12-03 09:24:04'),(206,'default','Create Loan Repayment',5,'Modules\\Loan\\Entities\\LoanTransaction',1,'Modules\\User\\Entities\\User','{\"id\":5}','2020-12-03 09:59:34','2020-12-03 09:59:34'),(207,'default','Update Loan Repayment',5,'Modules\\Loan\\Entities\\LoanTransaction',1,'Modules\\User\\Entities\\User','{\"id\":5}','2020-12-03 10:11:24','2020-12-03 10:11:24'),(208,'default','Use Loan Calculator',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-03 10:33:48','2020-12-03 10:33:48'),(209,'default','Use Loan Calculator',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-03 10:34:16','2020-12-03 10:34:16'),(210,'default','Use Loan Calculator',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-03 10:39:25','2020-12-03 10:39:25'),(211,'default','Use Loan Calculator',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-03 10:39:39','2020-12-03 10:39:39'),(212,'default','Use Loan Calculator',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-03 10:39:52','2020-12-03 10:39:52'),(213,'default','Use Loan Calculator',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-03 10:40:01','2020-12-03 10:40:01'),(214,'default','Update User',2,'Modules\\User\\Entities\\User',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-04 07:22:33','2020-12-04 07:22:33'),(215,'default','Create Client User',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-04 07:22:42','2020-12-04 07:22:42'),(216,'default','Create Wallet',1,'Modules\\Wallet\\Entities\\Wallet',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-04 17:48:10','2020-12-04 17:48:10'),(217,'default','Create Wallet Deposit',1,'Modules\\Wallet\\Entities\\Wallet',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-04 18:16:07','2020-12-04 18:16:07'),(218,'default','Update Wallet Transaction',1,'Modules\\Wallet\\Entities\\WalletTransaction',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-04 18:20:06','2020-12-04 18:20:06'),(219,'default','Create Savings Charge',1,'Modules\\Savings\\Entities\\SavingsCharge',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-05 07:37:27','2020-12-05 07:37:27'),(220,'default','Update Savings Charge',1,'Modules\\Savings\\Entities\\SavingsCharge',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-05 07:40:37','2020-12-05 07:40:37'),(221,'default','Create Savings Products',2,'Modules\\Savings\\Entities\\SavingsProduct',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-05 09:06:44','2020-12-05 09:06:44'),(222,'default','Update Savings Products',2,'Modules\\Savings\\Entities\\SavingsProduct',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-05 09:16:39','2020-12-05 09:16:39'),(223,'default','Update Savings Products',2,'Modules\\Savings\\Entities\\SavingsProduct',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-05 09:16:49','2020-12-05 09:16:49'),(224,'default','Create Savings',2,'Modules\\Savings\\Entities\\Savings',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-06 17:11:55','2020-12-06 17:11:55'),(225,'default','Create Savings',3,'Modules\\Savings\\Entities\\Savings',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-12-06 17:27:08','2020-12-06 17:27:08'),(226,'default','Update Savings',3,'Modules\\Savings\\Entities\\Savings',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-12-06 17:45:36','2020-12-06 17:45:36'),(227,'default','Approve Savings',3,'Modules\\Savings\\Entities\\Savings',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-12-06 17:58:25','2020-12-06 17:58:25'),(228,'default','Activate Savings',3,'Modules\\Savings\\Entities\\Savings',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-12-06 18:01:10','2020-12-06 18:01:10'),(229,'default','Create Savings Deposit',3,'Modules\\Savings\\Entities\\Savings',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-12-06 18:09:38','2020-12-06 18:09:38'),(230,'default','Update Savings Transaction',3,'Modules\\Savings\\Entities\\Savings',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-12-06 18:10:56','2020-12-06 18:10:56'),(231,'default','Create Savings Withdrawal',3,'Modules\\Savings\\Entities\\Savings',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-12-06 18:13:21','2020-12-06 18:13:21'),(232,'default','Create Share Charge',2,'Modules\\Share\\Entities\\ShareCharge',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-06 18:33:57','2020-12-06 18:33:57'),(233,'default','Update Share Charge',2,'Modules\\Share\\Entities\\ShareCharge',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-06 18:36:00','2020-12-06 18:36:00'),(234,'default','Update Share Products',1,'Modules\\Share\\Entities\\ShareProduct',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-07 07:46:16','2020-12-07 07:46:16'),(235,'default','Create Share',2,'Modules\\Share\\Entities\\Share',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-07 10:07:48','2020-12-07 10:07:48'),(236,'default','Update Share',2,'Modules\\Share\\Entities\\Share',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-07 10:28:54','2020-12-07 10:28:54'),(237,'default','Approve Shares',2,'Modules\\Share\\Entities\\Share',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-07 12:32:21','2020-12-07 12:32:21'),(238,'default','Change Share Officer',2,'Modules\\Share\\Entities\\Share',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-07 12:32:37','2020-12-07 12:32:37'),(239,'default','Activate Share',2,'Modules\\Share\\Entities\\Share',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-07 12:49:45','2020-12-07 12:49:45'),(240,'default','Update Share Transaction',2,'Modules\\Share\\Entities\\Share',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-07 15:47:28','2020-12-07 15:47:28'),(241,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-09 10:47:51','2020-12-09 10:47:51'),(242,'default','Create Loan',3,'Modules\\Loan\\Entities\\Loan',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-12-10 08:55:21','2020-12-10 08:55:21'),(243,'default','Approve Loan',3,'Modules\\Loan\\Entities\\Loan',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-12-10 08:55:35','2020-12-10 08:55:35'),(244,'default','Disburse Loan',3,'Modules\\Loan\\Entities\\Loan',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-12-10 08:56:07','2020-12-10 08:56:07'),(245,'default','Undo Loan Disbursement',3,'Modules\\Loan\\Entities\\Loan',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-12-10 08:56:38','2020-12-10 08:56:38'),(246,'default','Disburse Loan',3,'Modules\\Loan\\Entities\\Loan',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-12-10 08:56:55','2020-12-10 08:56:55'),(247,'default','Undo Loan Disbursement',3,'Modules\\Loan\\Entities\\Loan',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-12-10 09:11:54','2020-12-10 09:11:54'),(248,'default','Disburse Loan',3,'Modules\\Loan\\Entities\\Loan',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-12-10 09:12:10','2020-12-10 09:12:10'),(249,'default','Update Chart Of Account',1,'Modules\\Accounting\\Entities\\ChartOfAccount',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-13 11:00:12','2020-12-13 11:00:12'),(250,'default','Update Branch',2,'Modules\\Branch\\Entities\\Branch',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-13 12:48:33','2020-12-13 12:48:33'),(251,'default','Update Branch',2,'Modules\\Branch\\Entities\\Branch',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-13 12:49:22','2020-12-13 12:49:22'),(252,'default','Update Branch',2,'Modules\\Branch\\Entities\\Branch',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-13 12:50:02','2020-12-13 12:50:02'),(253,'default','Update Branch',2,'Modules\\Branch\\Entities\\Branch',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-13 12:50:47','2020-12-13 12:50:47'),(254,'default','Update Branch',2,'Modules\\Branch\\Entities\\Branch',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-13 12:51:23','2020-12-13 12:51:23'),(255,'default','Update Branch',2,'Modules\\Branch\\Entities\\Branch',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-13 12:52:39','2020-12-13 12:52:39'),(256,'default','Add Branch User',1,'Modules\\Branch\\Entities\\BranchUser',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-13 13:19:33','2020-12-13 13:19:33'),(257,'default','Update Asset Type',1,'Modules\\Asset\\Entities\\AssetType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-13 13:53:30','2020-12-13 13:53:30'),(258,'default','Update Asset Type',1,'Modules\\Asset\\Entities\\AssetType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-13 13:55:01','2020-12-13 13:55:01'),(259,'default','Update Asset',1,'Modules\\Asset\\Entities\\Asset',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-13 15:01:00','2020-12-13 15:01:00'),(260,'default','Update Payroll Item',1,'Modules\\Payroll\\Entities\\PayrollItem',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-13 15:51:17','2020-12-13 15:51:17'),(261,'default','Update Payroll Template',1,'Modules\\Payroll\\Entities\\PayrollTemplate',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-13 16:24:29','2020-12-13 16:24:29'),(262,'default','Update Payroll',2,'Modules\\Payroll\\Entities\\Payroll',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-13 16:48:39','2020-12-13 16:48:39'),(263,'default','Update Payroll Payment',1,'Modules\\Payroll\\Entities\\PayrollPayment',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-13 17:24:18','2020-12-13 17:24:18'),(264,'default','Update Client',1,'Modules\\Client\\Entities\\Client',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-13 18:31:15','2020-12-13 18:31:15'),(265,'default','Update Client Type',1,'Modules\\Client\\Entities\\ClientType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-14 07:29:56','2020-12-14 07:29:56'),(266,'default','Update Client Relationship',1,'Modules\\Client\\Entities\\ClientRelationship',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-14 08:07:51','2020-12-14 08:07:51'),(267,'default','Update Client Identification Type',1,'Modules\\Client\\Entities\\ClientIdentificationType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-14 08:13:14','2020-12-14 08:13:14'),(268,'default','Update SMS Gateway',1,'Modules\\Communication\\Entities\\SmsGateway',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-14 10:13:31','2020-12-14 10:13:31'),(269,'default','Update Communication Campaign',1,'Modules\\Communication\\Entities\\CommunicationCampaign',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-14 15:20:16','2020-12-14 15:20:16'),(270,'default','Update Loan Charge',1,'Modules\\Loan\\Entities\\LoanCharge',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-14 16:03:42','2020-12-14 16:03:42'),(271,'default','Update Loan Product',1,'Modules\\Loan\\Entities\\LoanProduct',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-14 17:42:16','2020-12-14 17:42:16'),(272,'default','Update Loan Note',2,'Modules\\Loan\\Entities\\LoanNote',1,'Modules\\User\\Entities\\User','{\"id\":2}','2020-12-15 00:07:15','2020-12-15 00:07:15'),(273,'default','Update Fund',1,'Modules\\Loan\\Entities\\Fund',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-15 00:32:48','2020-12-15 00:32:48'),(274,'default','Update Loan Collateral Type',1,'Modules\\Loan\\Entities\\LoanCollateralType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-15 00:39:51','2020-12-15 00:39:51'),(275,'default','Update Loan Purpose',1,'Modules\\Loan\\Entities\\LoanPurpose',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-15 00:43:06','2020-12-15 00:43:06'),(276,'default','Use Loan Calculator',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-15 01:03:41','2020-12-15 01:03:41'),(277,'default','Update Expense Type',1,'Modules\\Expense\\Entities\\ExpenseType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-15 02:06:02','2020-12-15 02:06:02'),(278,'default','Update Income Type',1,'Modules\\Income\\Entities\\IncomeType',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-15 09:34:46','2020-12-15 09:34:46'),(279,'default','Update Custom Field',1,'Modules\\CustomField\\Entities\\CustomField',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-15 11:01:38','2020-12-15 11:01:38'),(280,'default','Update Currency',1,'Modules\\Core\\Entities\\Currency',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-15 12:31:37','2020-12-15 12:31:37'),(281,'default','Update Savings Charge',1,'Modules\\Savings\\Entities\\SavingsCharge',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-15 15:07:00','2020-12-15 15:07:00'),(282,'default','Update Savings Products',1,'Modules\\Savings\\Entities\\SavingsProduct',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-15 15:41:34','2020-12-15 15:41:34'),(283,'default','Update Savings Transaction',3,'Modules\\Savings\\Entities\\Savings',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-12-15 16:20:53','2020-12-15 16:20:53'),(284,'default','Update User',1,'Modules\\User\\Entities\\User',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-16 06:05:41','2020-12-16 06:05:41'),(285,'default','Update Share Charge',1,'Modules\\Share\\Entities\\ShareCharge',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-16 07:44:14','2020-12-16 07:44:14'),(286,'default','Update Share Products',1,'Modules\\Share\\Entities\\ShareProduct',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-16 07:50:01','2020-12-16 07:50:01'),(287,'default','Reconfigure Module:Wallet',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 09:20:50','2020-12-16 09:20:50'),(288,'default','Reconfigure Module:Wallet',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 09:21:30','2020-12-16 09:21:30'),(289,'default','Reconfigure Module:Wallet',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 09:22:14','2020-12-16 09:22:14'),(290,'default','Reconfigure Module:Setting',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 09:43:42','2020-12-16 09:43:42'),(291,'default','Reconfigure Module:Dashboard',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:05:12','2020-12-16 10:05:12'),(292,'default','Reconfigure Module:Dashboard',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:06:14','2020-12-16 10:06:14'),(293,'default','Reconfigure Module:Dashboard',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:07:59','2020-12-16 10:07:59'),(294,'default','Reconfigure Module:Core',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:09:22','2020-12-16 10:09:22'),(295,'default','Reconfigure Module:Core',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:11:09','2020-12-16 10:11:09'),(296,'default','Reconfigure Module:Core',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:12:43','2020-12-16 10:12:43'),(297,'default','Reconfigure Module:Core',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:13:29','2020-12-16 10:13:29'),(298,'default','Reconfigure Module:Accounting',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:14:53','2020-12-16 10:14:53'),(299,'default','Reconfigure Module:Branch',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:16:00','2020-12-16 10:16:00'),(300,'default','Reconfigure Module:Payroll',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:19:04','2020-12-16 10:19:04'),(301,'default','Reconfigure Module:Core',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:20:25','2020-12-16 10:20:25'),(302,'default','Reconfigure Module:Payroll',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:21:48','2020-12-16 10:21:48'),(303,'default','Reconfigure Module:Payroll',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:22:53','2020-12-16 10:22:53'),(304,'default','Reconfigure Module:Loan',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:24:35','2020-12-16 10:24:35'),(305,'default','Reconfigure Module:Loan',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:26:27','2020-12-16 10:26:27'),(306,'default','Reconfigure Module:Communication',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:28:00','2020-12-16 10:28:00'),(307,'default','Reconfigure Module:Communication',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:29:01','2020-12-16 10:29:01'),(308,'default','Reconfigure Module:Expense',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:30:24','2020-12-16 10:30:24'),(309,'default','Reconfigure Module:Report',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:31:30','2020-12-16 10:31:30'),(310,'default','Reconfigure Module:Report',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:32:37','2020-12-16 10:32:37'),(311,'default','Reconfigure Module:CustomField',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:34:09','2020-12-16 10:34:09'),(312,'default','Reconfigure Module:Savings',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:36:25','2020-12-16 10:36:25'),(313,'default','Reconfigure Module:Income',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:38:36','2020-12-16 10:38:36'),(314,'default','Reconfigure Module:User',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:41:40','2020-12-16 10:41:40'),(315,'default','Reconfigure Module:Share',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:42:57','2020-12-16 10:42:57'),(316,'default','Reconfigure Module:Share',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:43:29','2020-12-16 10:43:29'),(317,'default','Reconfigure Module:Setting',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:44:59','2020-12-16 10:44:59'),(318,'default','Reconfigure Module:Asset',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-16 10:46:22','2020-12-16 10:46:22'),(319,'default','Reconfigure Module:Client',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-17 08:03:48','2020-12-17 08:03:48'),(320,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-17 15:27:14','2020-12-17 15:27:14'),(321,'default','Change Theme',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2020-12-19 02:37:11','2020-12-19 02:37:11'),(322,'default','Create Client',3,'Modules\\Client\\Entities\\Client',1,'Modules\\User\\Entities\\User','{\"id\":3}','2020-12-21 08:25:40','2020-12-21 08:25:40'),(323,'default','Undo Loan Disbursement',1,'Modules\\Loan\\Entities\\Loan',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-21 08:55:51','2020-12-21 08:55:51'),(324,'default','Disburse Loan',1,'Modules\\Loan\\Entities\\Loan',1,'Modules\\User\\Entities\\User','{\"id\":1}','2020-12-21 08:55:59','2020-12-21 08:55:59'),(325,'default','Reconfigure Module:User',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2021-01-15 11:25:39','2021-01-15 11:25:39'),(326,'default','Update Settings',NULL,NULL,1,'Modules\\User\\Entities\\User','[]','2021-01-15 15:28:29','2021-01-15 15:28:29'),(327,'default','Update Savings',3,'Modules\\Savings\\Entities\\Savings',1,'Modules\\User\\Entities\\User','{\"id\":3}','2021-01-15 15:30:42','2021-01-15 15:30:42'),(328,'default','Update Savings',2,'Modules\\Savings\\Entities\\Savings',1,'Modules\\User\\Entities\\User','{\"id\":2}','2021-01-15 15:34:02','2021-01-15 15:34:02'),(329,'default','Create Savings',5,'Modules\\Savings\\Entities\\Savings',1,'Modules\\User\\Entities\\User','{\"id\":5}','2021-01-15 18:15:05','2021-01-15 18:15:05');
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_depreciation`
--

DROP TABLE IF EXISTS `asset_depreciation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_depreciation` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` bigint unsigned DEFAULT NULL,
  `year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beginning_value` decimal(65,2) DEFAULT NULL,
  `depreciation_value` decimal(65,2) DEFAULT NULL,
  `rate` decimal(65,2) DEFAULT NULL,
  `cost` decimal(65,2) DEFAULT NULL,
  `accumulated` decimal(65,2) DEFAULT NULL,
  `ending_value` decimal(65,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_depreciation`
--

LOCK TABLES `asset_depreciation` WRITE;
/*!40000 ALTER TABLE `asset_depreciation` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_depreciation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_files`
--

DROP TABLE IF EXISTS `asset_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` bigint unsigned DEFAULT NULL,
  `file` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_files`
--

LOCK TABLES `asset_files` WRITE;
/*!40000 ALTER TABLE `asset_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_maintenance`
--

DROP TABLE IF EXISTS `asset_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_maintenance` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `asset_maintenance_type_id` bigint unsigned DEFAULT NULL,
  `asset_id` bigint unsigned DEFAULT NULL,
  `performed_by` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `amount` decimal(65,2) DEFAULT NULL,
  `mileage` decimal(65,2) DEFAULT NULL,
  `record_expense` tinyint NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_maintenance`
--

LOCK TABLES `asset_maintenance` WRITE;
/*!40000 ALTER TABLE `asset_maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_maintenance_types`
--

DROP TABLE IF EXISTS `asset_maintenance_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_maintenance_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_maintenance_types`
--

LOCK TABLES `asset_maintenance_types` WRITE;
/*!40000 ALTER TABLE `asset_maintenance_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_maintenance_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_notes`
--

DROP TABLE IF EXISTS `asset_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int unsigned DEFAULT NULL,
  `asset_id` bigint unsigned DEFAULT NULL,
  `attachment` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_notes`
--

LOCK TABLES `asset_notes` WRITE;
/*!40000 ALTER TABLE `asset_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_pictures`
--

DROP TABLE IF EXISTS `asset_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_pictures` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` bigint unsigned DEFAULT NULL,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `primary_picture` tinyint NOT NULL DEFAULT '0',
  `picture` text COLLATE utf8mb4_unicode_ci,
  `date_taken` date DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_pictures`
--

LOCK TABLES `asset_pictures` WRITE;
/*!40000 ALTER TABLE `asset_pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_types`
--

DROP TABLE IF EXISTS `asset_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('current','fixed','intangible','investment','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chart_of_account_fixed_asset_id` int DEFAULT NULL,
  `chart_of_account_asset_id` int DEFAULT NULL,
  `chart_of_account_contra_asset_id` int DEFAULT NULL,
  `chart_of_account_expense_id` int DEFAULT NULL,
  `chart_of_account_liability_id` int DEFAULT NULL,
  `chart_of_account_income_id` int DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_types`
--

LOCK TABLES `asset_types` WRITE;
/*!40000 ALTER TABLE `asset_types` DISABLE KEYS */;
INSERT INTO `asset_types` VALUES (1,'Test',NULL,1,1,2,2,NULL,3,'ff');
/*!40000 ALTER TABLE `asset_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `asset_type_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_price` decimal(65,2) DEFAULT NULL,
  `replacement_value` decimal(65,2) DEFAULT NULL,
  `value` decimal(65,2) DEFAULT NULL,
  `life_span` int DEFAULT NULL,
  `salvage_value` decimal(65,2) DEFAULT NULL,
  `serial_number` text COLLATE utf8mb4_unicode_ci,
  `bought_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive','sold','damaged','written_off') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,1,1,1,'Test','2020-10-02',6000.00,NULL,6000.00,2,3000.00,NULL,NULL,NULL,'ggg',NULL,0,'2020-10-27 15:32:59','2020-10-27 15:32:59');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_users`
--

DROP TABLE IF EXISTS `branch_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_users`
--

LOCK TABLES `branch_users` WRITE;
/*!40000 ALTER TABLE `branch_users` DISABLE KEYS */;
INSERT INTO `branch_users` VALUES (1,1,2,1,NULL,NULL);
/*!40000 ALTER TABLE `branch_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_date` date DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint NOT NULL DEFAULT '1',
  `is_system` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,NULL,NULL,NULL,'Default','2020-09-02',NULL,1,1,'2020-09-02 06:59:25','2020-09-02 06:59:25'),(2,NULL,NULL,NULL,'Test','2020-10-20','ff',1,0,'2020-10-20 07:51:37','2020-10-20 07:51:37');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chart_of_accounts`
--

DROP TABLE IF EXISTS `chart_of_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chart_of_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `gl_code` int DEFAULT NULL,
  `account_type` enum('asset','expense','equity','liability','income') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'asset',
  `allow_manual` tinyint NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chart_of_accounts`
--

LOCK TABLES `chart_of_accounts` WRITE;
/*!40000 ALTER TABLE `chart_of_accounts` DISABLE KEYS */;
INSERT INTO `chart_of_accounts` VALUES (1,NULL,'Asset',100,'asset',1,1,'test','2020-10-20 10:28:10','2020-10-20 10:31:25'),(2,NULL,'Expense',200,'expense',1,1,NULL,'2020-10-22 16:26:48','2020-10-22 16:27:07'),(3,NULL,'Income',300,'income',1,1,NULL,'2020-10-22 16:27:26','2020-10-22 16:27:26'),(4,NULL,'Liability',400,'liability',1,1,NULL,'2020-10-22 16:27:53','2020-10-22 16:27:53'),(5,NULL,'Equity',500,'equity',1,1,NULL,'2020-10-22 16:28:11','2020-10-22 16:28:11');
/*!40000 ALTER TABLE `chart_of_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_files`
--

DROP TABLE IF EXISTS `client_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `size` int DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_files`
--

LOCK TABLES `client_files` WRITE;
/*!40000 ALTER TABLE `client_files` DISABLE KEYS */;
INSERT INTO `client_files` VALUES (1,1,2,'Test','ff',NULL,'3DiV1KowryCzUR6mxt9Alxve9cHguYjo2FCdZT9m.jpeg','2020-10-21 12:05:36','2020-10-21 12:05:36'),(2,1,2,'Test','gg',NULL,'vwPvOzuisqwSkBdw7uBR42zUrudfFnejz1PmBfkN.jpeg','2020-10-21 13:52:40','2020-10-21 13:52:40');
/*!40000 ALTER TABLE `client_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_identification`
--

DROP TABLE IF EXISTS `client_identification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_identification` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `client_identification_type_id` bigint unsigned DEFAULT NULL,
  `identification_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `size` int DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_identification`
--

LOCK TABLES `client_identification` WRITE;
/*!40000 ALTER TABLE `client_identification` DISABLE KEYS */;
INSERT INTO `client_identification` VALUES (1,1,2,1,'14-199697','dd',NULL,'P2neJqyTEw0lezkhGGGF8A503gLZm8UdpWRj0Qa4.jpeg','2020-10-21 12:06:02','2020-10-21 12:06:02'),(2,1,2,1,'14-199697c18','rr',NULL,NULL,'2020-10-21 13:39:24','2020-10-21 13:39:24');
/*!40000 ALTER TABLE `client_identification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_identification_types`
--

DROP TABLE IF EXISTS `client_identification_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_identification_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_identification_types`
--

LOCK TABLES `client_identification_types` WRITE;
/*!40000 ALTER TABLE `client_identification_types` DISABLE KEYS */;
INSERT INTO `client_identification_types` VALUES (1,'National'),(2,'Passport');
/*!40000 ALTER TABLE `client_identification_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_next_of_kin`
--

DROP TABLE IF EXISTS `client_next_of_kin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_next_of_kin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `client_relationship_id` bigint unsigned DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','other','unspecified') COLLATE utf8mb4_unicode_ci DEFAULT 'unspecified',
  `marital_status` enum('married','single','divorced','widowed','unspecified','other') COLLATE utf8mb4_unicode_ci DEFAULT 'unspecified',
  `country_id` bigint unsigned DEFAULT NULL,
  `title_id` bigint unsigned DEFAULT NULL,
  `profession_id` bigint unsigned DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_next_of_kin`
--

LOCK TABLES `client_next_of_kin` WRITE;
/*!40000 ALTER TABLE `client_next_of_kin` DISABLE KEYS */;
INSERT INTO `client_next_of_kin` VALUES (1,1,2,1,'Tererai',NULL,'Mugova','male','single',1,1,1,'0774175438',NULL,'tjmugova@gmail.com','2020-10-22','1110 11th crescent glenview 1\r\nGlenview 1',NULL,NULL,NULL,NULL,NULL,'ff','2020-10-22 11:18:43','2020-10-22 11:26:55');
/*!40000 ALTER TABLE `client_next_of_kin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_relationships`
--

DROP TABLE IF EXISTS `client_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_relationships` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_relationships`
--

LOCK TABLES `client_relationships` WRITE;
/*!40000 ALTER TABLE `client_relationships` DISABLE KEYS */;
INSERT INTO `client_relationships` VALUES (1,'Father');
/*!40000 ALTER TABLE `client_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_types`
--

DROP TABLE IF EXISTS `client_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_types`
--

LOCK TABLES `client_types` WRITE;
/*!40000 ALTER TABLE `client_types` DISABLE KEYS */;
INSERT INTO `client_types` VALUES (1,'Individual'),(2,'Group');
/*!40000 ALTER TABLE `client_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_users`
--

DROP TABLE IF EXISTS `client_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_users`
--

LOCK TABLES `client_users` WRITE;
/*!40000 ALTER TABLE `client_users` DISABLE KEYS */;
INSERT INTO `client_users` VALUES (1,1,2,7,'2020-10-21 14:23:51','2020-10-21 14:23:51'),(2,1,1,2,'2020-12-04 07:22:42','2020-12-04 07:22:42');
/*!40000 ALTER TABLE `client_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `loan_officer_id` bigint unsigned DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','other','unspecified') COLLATE utf8mb4_unicode_ci DEFAULT 'unspecified',
  `status` enum('pending','active','inactive','deceased','unspecified','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `marital_status` enum('married','single','divorced','widowed','unspecified','other') COLLATE utf8mb4_unicode_ci DEFAULT 'unspecified',
  `country_id` bigint unsigned DEFAULT NULL,
  `title_id` bigint unsigned DEFAULT NULL,
  `profession_id` bigint unsigned DEFAULT NULL,
  `client_type_id` bigint unsigned DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `signature` text COLLATE utf8mb4_unicode_ci,
  `created_date` date DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `activation_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,1,1,NULL,NULL,NULL,'Tererai',NULL,'Mugova','male','active',NULL,246,1,NULL,1,'+263774175438',NULL,'tjmugova@localhost.com','vg56','2019-03-29','933 13th street\r\nGlenview 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-22',NULL,NULL,'2020-09-22 14:05:08','2020-12-13 18:31:14'),(2,1,1,1,NULL,NULL,'Maclaven',NULL,'Mugova','male','active','single',1,NULL,NULL,1,'0774175438',NULL,'tjmugova@gmail.com','m123','2020-10-20','933 13th street, Glenview 1',NULL,NULL,NULL,NULL,NULL,'eee',NULL,'2020-10-20',NULL,NULL,'2020-10-20 14:18:38','2020-10-21 11:48:45'),(3,1,1,NULL,NULL,NULL,'Tererai',NULL,'Mugova','male','pending',NULL,246,1,1,NULL,'+263774175438',NULL,'tjmugova@webstudio.co.zw',NULL,'2020-12-07','933 13th street\r\nGlenview 1',NULL,NULL,NULL,NULL,'OvAlvTbvlyy7gKejJVEt1klvuCtFvHDoeTrIbg48.png',NULL,NULL,'2020-12-21',NULL,NULL,'2020-12-21 08:25:40','2020-12-21 08:25:40');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communication_campaign_attachment_types`
--

DROP TABLE IF EXISTS `communication_campaign_attachment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communication_campaign_attachment_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci,
  `translated_name` text COLLATE utf8mb4_unicode_ci,
  `is_trigger` tinyint NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communication_campaign_attachment_types`
--

LOCK TABLES `communication_campaign_attachment_types` WRITE;
/*!40000 ALTER TABLE `communication_campaign_attachment_types` DISABLE KEYS */;
INSERT INTO `communication_campaign_attachment_types` VALUES (1,'Loan Schedule',NULL,0,1),(2,'Client Statement',NULL,0,1),(3,'Saving Mini Statement',NULL,0,0);
/*!40000 ALTER TABLE `communication_campaign_attachment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communication_campaign_business_rules`
--

DROP TABLE IF EXISTS `communication_campaign_business_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communication_campaign_business_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci,
  `translated_name` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint NOT NULL DEFAULT '1',
  `is_trigger` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communication_campaign_business_rules`
--

LOCK TABLES `communication_campaign_business_rules` WRITE;
/*!40000 ALTER TABLE `communication_campaign_business_rules` DISABLE KEYS */;
INSERT INTO `communication_campaign_business_rules` VALUES (1,'Active Clients',NULL,'All clients with the status ‘Active’',1,0),(2,'Prospective Clients',NULL,'All clients with the status ‘Active’ who have never had a loan before',1,0),(3,'Active Loan Clients',NULL,'All clients with an outstanding loan',1,0),(4,'Loans in arrears',NULL,'All clients with an outstanding loan in arrears between X and Y days',1,0),(5,'Loans disbursed to clients',NULL,'All clients who have had a loan disbursed to them in the last X to Y days',1,0),(6,'Loan payments due',NULL,'All clients with an unpaid installment due on their loan between X and Y days',1,0),(7,'Dormant Prospects',NULL,'All individuals who have not yet received a loan but were also entered into the system more than 3 months',0,0),(8,'Loan Payments Due (Overdue Loans)',NULL,'Loan Payments Due between X to Y days for clients in arrears between X and Y days',0,0),(9,'Loan Payments Received (Active Loans)',NULL,'Payments received in the last X to Y days for any loan with the status Active (on-time)',0,0),(10,'Loan Payments Received (Overdue Loans) ',NULL,'Payments received in the last X to Y days for any loan with the status Overdue (arrears) between X and Y days',0,0),(11,'Happy Birthday',NULL,'This sends a message to all clients with the status Active on their Birthday',0,0),(12,'Loan Fully Repaid',NULL,'All loans that have been fully repaid (Closed or Overpaid) in the last X to Y days',0,0),(13,'Loans Outstanding after final instalment date',NULL,'All active loans (with an outstanding balance) between X to Y days after the final instalment date on their loan schedule',0,0),(14,'Past Loan Clients',NULL,'Past Loan Clients who have previously had a loan but do not currently have one and finished repaying their most recent loan in the last X to Y days.',0,0),(15,'Loan Submitted',NULL,'Loan and client data of submitted loan',1,1),(16,'Loan Rejected',NULL,'Loan and client data of rejected loan',1,1),(17,'Loan Approved',NULL,'Loan and client data of approved loan',1,1),(18,'Loan Disbursed',NULL,'Loan Disbursed',1,1),(19,'Loan Rescheduled',NULL,'Loan Rescheduled',1,1),(20,'Loan Closed',NULL,'Loan Closed',1,1),(21,'Loan Repayment',NULL,'Loan Repayment',1,1),(22,'Savings Submitted',NULL,'Savings and client data of submitted savings',1,1),(23,'Savings Rejected',NULL,'Savings and client data of rejected savings',1,1),(24,'Savings Approved',NULL,'Savings and client data of approved savings',1,1),(25,'Savings Activated',NULL,'Savings Activated',1,1),(26,'Savings Dormant',NULL,'Savings Dormant',1,1),(27,'Savings Inactive',NULL,'Savings Inactive',1,1),(28,'Savings Closed',NULL,'Savings Closed',1,1),(29,'Savings Deposit',NULL,'Savings Deposit',1,1),(30,'Savings Withdrawal',NULL,'Savings Withdrawal',1,1);
/*!40000 ALTER TABLE `communication_campaign_business_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communication_campaign_logs`
--

DROP TABLE IF EXISTS `communication_campaign_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communication_campaign_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `sms_gateway_id` bigint DEFAULT NULL,
  `communication_campaign_id` bigint DEFAULT NULL,
  `campaign_type` enum('sms','email') COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `send_to` text COLLATE utf8mb4_unicode_ci,
  `campaign_name` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','sent','delivered','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communication_campaign_logs`
--

LOCK TABLES `communication_campaign_logs` WRITE;
/*!40000 ALTER TABLE `communication_campaign_logs` DISABLE KEYS */;
INSERT INTO `communication_campaign_logs` VALUES (1,NULL,2,NULL,1,'sms','fff','0774175438','Test','sent','2020-12-02 12:19:11','2020-12-02 12:19:11');
/*!40000 ALTER TABLE `communication_campaign_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communication_campaigns`
--

DROP TABLE IF EXISTS `communication_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communication_campaigns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `sms_gateway_id` bigint unsigned DEFAULT NULL,
  `communication_campaign_business_rule_id` bigint unsigned DEFAULT NULL,
  `communication_campaign_attachment_type_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `loan_officer_id` bigint unsigned DEFAULT NULL,
  `loan_product_id` bigint unsigned DEFAULT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci,
  `name` text COLLATE utf8mb4_unicode_ci,
  `campaign_type` enum('sms','email') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'email',
  `trigger_type` enum('direct','schedule','triggered') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'direct',
  `scheduled_date` date DEFAULT NULL,
  `scheduled_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_frequency` int DEFAULT NULL,
  `schedule_frequency_type` enum('days','weeks','months','years') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'days',
  `scheduled_next_run_date` date DEFAULT NULL,
  `scheduled_last_run_date` date DEFAULT NULL,
  `from_x` int DEFAULT NULL,
  `to_y` int DEFAULT NULL,
  `cycle_x` int DEFAULT NULL,
  `cycle_y` int DEFAULT NULL,
  `overdue_x` int DEFAULT NULL,
  `overdue_y` int DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '0',
  `status` enum('pending','active','inactive','closed','done') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `description` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communication_campaigns`
--

LOCK TABLES `communication_campaigns` WRITE;
/*!40000 ALTER TABLE `communication_campaigns` DISABLE KEYS */;
INSERT INTO `communication_campaigns` VALUES (1,1,1,15,NULL,1,1,1,NULL,'Test','sms','triggered',NULL,NULL,NULL,'days',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'active','fff',NULL,'2020-10-22 13:45:51','2020-10-22 13:59:09');
/*!40000 ALTER TABLE `communication_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sortname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan',NULL,NULL),(2,'AL','Albania',NULL,NULL),(3,'DZ','Algeria',NULL,NULL),(4,'AS','American Samoa',NULL,NULL),(5,'AD','Andorra',NULL,NULL),(6,'AO','Angola',NULL,NULL),(7,'AI','Anguilla',NULL,NULL),(8,'AQ','Antarctica',NULL,NULL),(9,'AG','Antigua And Barbuda',NULL,NULL),(10,'AR','Argentina',NULL,NULL),(11,'AM','Armenia',NULL,NULL),(12,'AW','Aruba',NULL,NULL),(13,'AU','Australia',NULL,NULL),(14,'AT','Austria',NULL,NULL),(15,'AZ','Azerbaijan',NULL,NULL),(16,'BS','Bahamas The',NULL,NULL),(17,'BH','Bahrain',NULL,NULL),(18,'BD','Bangladesh',NULL,NULL),(19,'BB','Barbados',NULL,NULL),(20,'BY','Belarus',NULL,NULL),(21,'BE','Belgium',NULL,NULL),(22,'BZ','Belize',NULL,NULL),(23,'BJ','Benin',NULL,NULL),(24,'BM','Bermuda',NULL,NULL),(25,'BT','Bhutan',NULL,NULL),(26,'BO','Bolivia',NULL,NULL),(27,'BA','Bosnia and Herzegovina',NULL,NULL),(28,'BW','Botswana',NULL,NULL),(29,'BV','Bouvet Island',NULL,NULL),(30,'BR','Brazil',NULL,NULL),(31,'IO','British Indian Ocean Territory',NULL,NULL),(32,'BN','Brunei',NULL,NULL),(33,'BG','Bulgaria',NULL,NULL),(34,'BF','Burkina Faso',NULL,NULL),(35,'BI','Burundi',NULL,NULL),(36,'KH','Cambodia',NULL,NULL),(37,'CM','Cameroon',NULL,NULL),(38,'CA','Canada',NULL,NULL),(39,'CV','Cape Verde',NULL,NULL),(40,'KY','Cayman Islands',NULL,NULL),(41,'CF','Central African Republic',NULL,NULL),(42,'TD','Chad',NULL,NULL),(43,'CL','Chile',NULL,NULL),(44,'CN','China',NULL,NULL),(45,'CX','Christmas Island',NULL,NULL),(46,'CC','Cocos (Keeling) Islands',NULL,NULL),(47,'CO','Colombia',NULL,NULL),(48,'KM','Comoros',NULL,NULL),(49,'CG','Congo',NULL,NULL),(50,'CD','Congo The Democratic Republic Of The',NULL,NULL),(51,'CK','Cook Islands',NULL,NULL),(52,'CR','Costa Rica',NULL,NULL),(53,'CI','Cote D\'Ivoire (Ivory Coast)',NULL,NULL),(54,'HR','Croatia (Hrvatska)',NULL,NULL),(55,'CU','Cuba',NULL,NULL),(56,'CY','Cyprus',NULL,NULL),(57,'CZ','Czech Republic',NULL,NULL),(58,'DK','Denmark',NULL,NULL),(59,'DJ','Djibouti',NULL,NULL),(60,'DM','Dominica',NULL,NULL),(61,'DO','Dominican Republic',NULL,NULL),(62,'TP','East Timor',NULL,NULL),(63,'EC','Ecuador',NULL,NULL),(64,'EG','Egypt',NULL,NULL),(65,'SV','El Salvador',NULL,NULL),(66,'GQ','Equatorial Guinea',NULL,NULL),(67,'ER','Eritrea',NULL,NULL),(68,'EE','Estonia',NULL,NULL),(69,'ET','Ethiopia',NULL,NULL),(70,'XA','External Territories of Australia',NULL,NULL),(71,'FK','Falkland Islands',NULL,NULL),(72,'FO','Faroe Islands',NULL,NULL),(73,'FJ','Fiji Islands',NULL,NULL),(74,'FI','Finland',NULL,NULL),(75,'FR','France',NULL,NULL),(76,'GF','French Guiana',NULL,NULL),(77,'PF','French Polynesia',NULL,NULL),(78,'TF','French Southern Territories',NULL,NULL),(79,'GA','Gabon',NULL,NULL),(80,'GM','Gambia The',NULL,NULL),(81,'GE','Georgia',NULL,NULL),(82,'DE','Germany',NULL,NULL),(83,'GH','Ghana',NULL,NULL),(84,'GI','Gibraltar',NULL,NULL),(85,'GR','Greece',NULL,NULL),(86,'GL','Greenland',NULL,NULL),(87,'GD','Grenada',NULL,NULL),(88,'GP','Guadeloupe',NULL,NULL),(89,'GU','Guam',NULL,NULL),(90,'GT','Guatemala',NULL,NULL),(91,'XU','Guernsey and Alderney',NULL,NULL),(92,'GN','Guinea',NULL,NULL),(93,'GW','Guinea-Bissau',NULL,NULL),(94,'GY','Guyana',NULL,NULL),(95,'HT','Haiti',NULL,NULL),(96,'HM','Heard and McDonald Islands',NULL,NULL),(97,'HN','Honduras',NULL,NULL),(98,'HK','Hong Kong S.A.R.',NULL,NULL),(99,'HU','Hungary',NULL,NULL),(100,'IS','Iceland',NULL,NULL),(101,'IN','India',NULL,NULL),(102,'ID','Indonesia',NULL,NULL),(103,'IR','Iran',NULL,NULL),(104,'IQ','Iraq',NULL,NULL),(105,'IE','Ireland',NULL,NULL),(106,'IL','Israel',NULL,NULL),(107,'IT','Italy',NULL,NULL),(108,'JM','Jamaica',NULL,NULL),(109,'JP','Japan',NULL,NULL),(110,'XJ','Jersey',NULL,NULL),(111,'JO','Jordan',NULL,NULL),(112,'KZ','Kazakhstan',NULL,NULL),(113,'KE','Kenya',NULL,NULL),(114,'KI','Kiribati',NULL,NULL),(115,'KP','Korea North',NULL,NULL),(116,'KR','Korea South',NULL,NULL),(117,'KW','Kuwait',NULL,NULL),(118,'KG','Kyrgyzstan',NULL,NULL),(119,'LA','Laos',NULL,NULL),(120,'LV','Latvia',NULL,NULL),(121,'LB','Lebanon',NULL,NULL),(122,'LS','Lesotho',NULL,NULL),(123,'LR','Liberia',NULL,NULL),(124,'LY','Libya',NULL,NULL),(125,'LI','Liechtenstein',NULL,NULL),(126,'LT','Lithuania',NULL,NULL),(127,'LU','Luxembourg',NULL,NULL),(128,'MO','Macau S.A.R.',NULL,NULL),(129,'MK','Macedonia',NULL,NULL),(130,'MG','Madagascar',NULL,NULL),(131,'MW','Malawi',NULL,NULL),(132,'MY','Malaysia',NULL,NULL),(133,'MV','Maldives',NULL,NULL),(134,'ML','Mali',NULL,NULL),(135,'MT','Malta',NULL,NULL),(136,'XM','Man (Isle of)',NULL,NULL),(137,'MH','Marshall Islands',NULL,NULL),(138,'MQ','Martinique',NULL,NULL),(139,'MR','Mauritania',NULL,NULL),(140,'MU','Mauritius',NULL,NULL),(141,'YT','Mayotte',NULL,NULL),(142,'MX','Mexico',NULL,NULL),(143,'FM','Micronesia',NULL,NULL),(144,'MD','Moldova',NULL,NULL),(145,'MC','Monaco',NULL,NULL),(146,'MN','Mongolia',NULL,NULL),(147,'MS','Montserrat',NULL,NULL),(148,'MA','Morocco',NULL,NULL),(149,'MZ','Mozambique',NULL,NULL),(150,'MM','Myanmar',NULL,NULL),(151,'NA','Namibia',NULL,NULL),(152,'NR','Nauru',NULL,NULL),(153,'NP','Nepal',NULL,NULL),(154,'AN','Netherlands Antilles',NULL,NULL),(155,'NL','Netherlands The',NULL,NULL),(156,'NC','New Caledonia',NULL,NULL),(157,'NZ','New Zealand',NULL,NULL),(158,'NI','Nicaragua',NULL,NULL),(159,'NE','Niger',NULL,NULL),(160,'NG','Nigeria',NULL,NULL),(161,'NU','Niue',NULL,NULL),(162,'NF','Norfolk Island',NULL,NULL),(163,'MP','Northern Mariana Islands',NULL,NULL),(164,'NO','Norway',NULL,NULL),(165,'OM','Oman',NULL,NULL),(166,'PK','Pakistan',NULL,NULL),(167,'PW','Palau',NULL,NULL),(168,'PS','Palestinian Territory Occupied',NULL,NULL),(169,'PA','Panama',NULL,NULL),(170,'PG','Papua new Guinea',NULL,NULL),(171,'PY','Paraguay',NULL,NULL),(172,'PE','Peru',NULL,NULL),(173,'PH','Philippines',NULL,NULL),(174,'PN','Pitcairn Island',NULL,NULL),(175,'PL','Poland',NULL,NULL),(176,'PT','Portugal',NULL,NULL),(177,'PR','Puerto Rico',NULL,NULL),(178,'QA','Qatar',NULL,NULL),(179,'RE','Reunion',NULL,NULL),(180,'RO','Romania',NULL,NULL),(181,'RU','Russia',NULL,NULL),(182,'RW','Rwanda',NULL,NULL),(183,'SH','Saint Helena',NULL,NULL),(184,'KN','Saint Kitts And Nevis',NULL,NULL),(185,'LC','Saint Lucia',NULL,NULL),(186,'PM','Saint Pierre and Miquelon',NULL,NULL),(187,'VC','Saint Vincent And The Grenadines',NULL,NULL),(188,'WS','Samoa',NULL,NULL),(189,'SM','San Marino',NULL,NULL),(190,'ST','Sao Tome and Principe',NULL,NULL),(191,'SA','Saudi Arabia',NULL,NULL),(192,'SN','Senegal',NULL,NULL),(193,'RS','Serbia',NULL,NULL),(194,'SC','Seychelles',NULL,NULL),(195,'SL','Sierra Leone',NULL,NULL),(196,'SG','Singapore',NULL,NULL),(197,'SK','Slovakia',NULL,NULL),(198,'SI','Slovenia',NULL,NULL),(199,'XG','Smaller Territories of the UK',NULL,NULL),(200,'SB','Solomon Islands',NULL,NULL),(201,'SO','Somalia',NULL,NULL),(202,'ZA','South Africa',NULL,NULL),(203,'GS','South Georgia',NULL,NULL),(204,'SS','South Sudan',NULL,NULL),(205,'ES','Spain',NULL,NULL),(206,'LK','Sri Lanka',NULL,NULL),(207,'SD','Sudan',NULL,NULL),(208,'SR','Suriname',NULL,NULL),(209,'SJ','Svalbard And Jan Mayen Islands',NULL,NULL),(210,'SZ','Swaziland',NULL,NULL),(211,'SE','Sweden',NULL,NULL),(212,'CH','Switzerland',NULL,NULL),(213,'SY','Syria',NULL,NULL),(214,'TW','Taiwan',NULL,NULL),(215,'TJ','Tajikistan',NULL,NULL),(216,'TZ','Tanzania',NULL,NULL),(217,'TH','Thailand',NULL,NULL),(218,'TG','Togo',NULL,NULL),(219,'TK','Tokelau',NULL,NULL),(220,'TO','Tonga',NULL,NULL),(221,'TT','Trinidad And Tobago',NULL,NULL),(222,'TN','Tunisia',NULL,NULL),(223,'TR','Turkey',NULL,NULL),(224,'TM','Turkmenistan',NULL,NULL),(225,'TC','Turks And Caicos Islands',NULL,NULL),(226,'TV','Tuvalu',NULL,NULL),(227,'UG','Uganda',NULL,NULL),(228,'UA','Ukraine',NULL,NULL),(229,'AE','United Arab Emirates',NULL,NULL),(230,'GB','United Kingdom',NULL,NULL),(231,'US','United States',NULL,NULL),(232,'UM','United States Minor Outlying Islands',NULL,NULL),(233,'UY','Uruguay',NULL,NULL),(234,'UZ','Uzbekistan',NULL,NULL),(235,'VU','Vanuatu',NULL,NULL),(236,'VA','Vatican City State (Holy See)',NULL,NULL),(237,'VE','Venezuela',NULL,NULL),(238,'VN','Vietnam',NULL,NULL),(239,'VG','Virgin Islands (British)',NULL,NULL),(240,'VI','Virgin Islands (US)',NULL,NULL),(241,'WF','Wallis And Futuna Islands',NULL,NULL),(242,'EH','Western Sahara',NULL,NULL),(243,'YE','Yemen',NULL,NULL),(244,'YU','Yugoslavia',NULL,NULL),(245,'ZM','Zambia',NULL,NULL),(246,'ZW','Zimbabwe',NULL,NULL);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int DEFAULT NULL,
  `rate` decimal(65,8) DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` enum('left','right') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'left',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,NULL,1.00000000,'USD','United States dollar','$','left',NULL,NULL),(2,NULL,NULL,'zwl','Zimbabwean Dollar','$','left','2020-10-19 07:15:21','2020-10-19 07:15:21');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `label` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `class` text COLLATE utf8mb4_unicode_ci,
  `db_columns` text COLLATE utf8mb4_unicode_ci,
  `rules` text COLLATE utf8mb4_unicode_ci,
  `default_values` text COLLATE utf8mb4_unicode_ci,
  `required` tinyint NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
INSERT INTO `custom_fields` VALUES (1,1,'add_client','textfield','system reference','system reference',NULL,NULL,NULL,NULL,NULL,0,1,'2020-10-22 15:05:01','2020-10-22 15:05:01');
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_meta`
--

DROP TABLE IF EXISTS `custom_fields_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL,
  `custom_field_id` bigint unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_meta`
--

LOCK TABLES `custom_fields_meta` WRITE;
/*!40000 ALTER TABLE `custom_fields_meta` DISABLE KEYS */;
INSERT INTO `custom_fields_meta` VALUES (1,'add_client',1,1,NULL,'2020-12-13 18:31:15','2020-12-13 18:31:15'),(2,'add_client',3,1,NULL,'2020-12-21 08:25:40','2020-12-21 08:25:40');
/*!40000 ALTER TABLE `custom_fields_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_types`
--

DROP TABLE IF EXISTS `expense_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `asset_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_types`
--

LOCK TABLES `expense_types` WRITE;
/*!40000 ALTER TABLE `expense_types` DISABLE KEYS */;
INSERT INTO `expense_types` VALUES (1,'Test',2,1,'2020-10-22 16:32:47','2020-10-22 16:32:47');
/*!40000 ALTER TABLE `expense_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `expense_type_id` bigint unsigned DEFAULT NULL,
  `expense_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `asset_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `amount` decimal(65,2) NOT NULL DEFAULT '0.00',
  `date` date DEFAULT NULL,
  `recurring` tinyint NOT NULL DEFAULT '0',
  `recur_frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '31',
  `recur_start_date` date DEFAULT NULL,
  `recur_end_date` date DEFAULT NULL,
  `recur_next_date` date DEFAULT NULL,
  `recur_type` enum('day','week','month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `files` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,1,1,2,1,1,1,20.00,'2020-10-22',0,'31',NULL,NULL,NULL,'month',NULL,'ff',NULL,'2020-10-22 16:56:55','2020-10-22 16:57:14');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
INSERT INTO `failed_jobs` VALUES (1,'database','default','{\"uuid\":\"c29c4b8d-c242-4c94-a9de-dd4ae076d9f9\",\"displayName\":\"Modules\\\\Savings\\\\Listeners\\\\SavingsStatusChangedCampaigns\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:55:\\\"Modules\\\\Savings\\\\Listeners\\\\SavingsStatusChangedCampaigns\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:43:\\\"Modules\\\\Savings\\\\Events\\\\SavingsStatusChanged\\\":2:{s:7:\\\"savings\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:32:\\\"Modules\\\\Savings\\\\Entities\\\\Savings\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:15:\\\"previous_status\\\";s:9:\\\"submitted\\\";}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:3:\\\"job\\\";N;}\"}}','PDOException: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'savings_product_id\' in \'where clause\' in /var/www/html/projects/loan.local/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDOConnection.php:64\nStack trace:\n#0 /var/www/html/projects/loan.local/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDOConnection.php(64): PDO->prepare(\'select * from `...\', Array)\n#1 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(331): Doctrine\\DBAL\\Driver\\PDOConnection->prepare(\'select * from `...\')\n#2 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(664): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(\'select * from `...\', Array)\n#3 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(631): Illuminate\\Database\\Connection->runQueryCallback(\'select * from `...\', Array, Object(Closure))\n#4 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(339): Illuminate\\Database\\Connection->run(\'select * from `...\', Array, Object(Closure))\n#5 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2202): Illuminate\\Database\\Connection->select(\'select * from `...\', Array, true)\n#6 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2190): Illuminate\\Database\\Query\\Builder->runSelect()\n#7 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2685): Illuminate\\Database\\Query\\Builder->Illuminate\\Database\\Query\\{closure}()\n#8 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2191): Illuminate\\Database\\Query\\Builder->onceWithColumns(Array, Object(Closure))\n#9 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(539): Illuminate\\Database\\Query\\Builder->get(Array)\n#10 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(523): Illuminate\\Database\\Eloquent\\Builder->getModels(Array)\n#11 /var/www/html/projects/loan.local/Modules/Savings/Listeners/SavingsStatusChangedCampaigns.php(62): Illuminate\\Database\\Eloquent\\Builder->get()\n#12 [internal function]: Modules\\Savings\\Listeners\\SavingsStatusChangedCampaigns->handle(Object(Modules\\Savings\\Events\\SavingsStatusChanged))\n#13 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Events/CallQueuedListener.php(93): call_user_func_array(Array, Array)\n#14 [internal function]: Illuminate\\Events\\CallQueuedListener->handle(Object(Illuminate\\Foundation\\Application))\n#15 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array(Array, Array)\n#16 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#18 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#19 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#20 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#21 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#22 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#23 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Events\\CallQueuedListener), false)\n#25 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#26 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#27 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Events\\CallQueuedListener))\n#29 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#30 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#32 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#35 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array(Array, Array)\n#37 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call(Array)\n#42 /var/www/html/projects/loan.local/vendor/symfony/console/Command/Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(912): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 /var/www/html/projects/loan.local/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 {main}\n\nNext Doctrine\\DBAL\\Driver\\PDOException: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'savings_product_id\' in \'where clause\' in /var/www/html/projects/loan.local/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDOConnection.php:66\nStack trace:\n#0 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(331): Doctrine\\DBAL\\Driver\\PDOConnection->prepare(\'select * from `...\')\n#1 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(664): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(\'select * from `...\', Array)\n#2 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(631): Illuminate\\Database\\Connection->runQueryCallback(\'select * from `...\', Array, Object(Closure))\n#3 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(339): Illuminate\\Database\\Connection->run(\'select * from `...\', Array, Object(Closure))\n#4 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2202): Illuminate\\Database\\Connection->select(\'select * from `...\', Array, true)\n#5 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2190): Illuminate\\Database\\Query\\Builder->runSelect()\n#6 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2685): Illuminate\\Database\\Query\\Builder->Illuminate\\Database\\Query\\{closure}()\n#7 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2191): Illuminate\\Database\\Query\\Builder->onceWithColumns(Array, Object(Closure))\n#8 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(539): Illuminate\\Database\\Query\\Builder->get(Array)\n#9 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(523): Illuminate\\Database\\Eloquent\\Builder->getModels(Array)\n#10 /var/www/html/projects/loan.local/Modules/Savings/Listeners/SavingsStatusChangedCampaigns.php(62): Illuminate\\Database\\Eloquent\\Builder->get()\n#11 [internal function]: Modules\\Savings\\Listeners\\SavingsStatusChangedCampaigns->handle(Object(Modules\\Savings\\Events\\SavingsStatusChanged))\n#12 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Events/CallQueuedListener.php(93): call_user_func_array(Array, Array)\n#13 [internal function]: Illuminate\\Events\\CallQueuedListener->handle(Object(Illuminate\\Foundation\\Application))\n#14 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array(Array, Array)\n#15 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#17 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#18 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#19 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#20 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#21 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#22 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Events\\CallQueuedListener), false)\n#24 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#25 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#26 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Events\\CallQueuedListener))\n#28 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#29 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#31 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#32 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#34 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array(Array, Array)\n#36 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#37 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#38 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#39 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#40 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call(Array)\n#41 /var/www/html/projects/loan.local/vendor/symfony/console/Command/Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#42 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(912): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 /var/www/html/projects/loan.local/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'savings_product_id\' in \'where clause\' (SQL: select * from `communication_campaigns` where `trigger_type` = triggered and `status` = active and `savings_product_id` = 1 and `communication_campaign_business_rule_id` = 24) in /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php:671\nStack trace:\n#0 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(631): Illuminate\\Database\\Connection->runQueryCallback(\'select * from `...\', Array, Object(Closure))\n#1 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(339): Illuminate\\Database\\Connection->run(\'select * from `...\', Array, Object(Closure))\n#2 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2202): Illuminate\\Database\\Connection->select(\'select * from `...\', Array, true)\n#3 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2190): Illuminate\\Database\\Query\\Builder->runSelect()\n#4 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2685): Illuminate\\Database\\Query\\Builder->Illuminate\\Database\\Query\\{closure}()\n#5 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2191): Illuminate\\Database\\Query\\Builder->onceWithColumns(Array, Object(Closure))\n#6 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(539): Illuminate\\Database\\Query\\Builder->get(Array)\n#7 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(523): Illuminate\\Database\\Eloquent\\Builder->getModels(Array)\n#8 /var/www/html/projects/loan.local/Modules/Savings/Listeners/SavingsStatusChangedCampaigns.php(62): Illuminate\\Database\\Eloquent\\Builder->get()\n#9 [internal function]: Modules\\Savings\\Listeners\\SavingsStatusChangedCampaigns->handle(Object(Modules\\Savings\\Events\\SavingsStatusChanged))\n#10 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Events/CallQueuedListener.php(93): call_user_func_array(Array, Array)\n#11 [internal function]: Illuminate\\Events\\CallQueuedListener->handle(Object(Illuminate\\Foundation\\Application))\n#12 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array(Array, Array)\n#13 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#18 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#19 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#20 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#21 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Events\\CallQueuedListener), false)\n#22 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#23 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#24 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Events\\CallQueuedListener))\n#26 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#27 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#28 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#29 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#31 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#32 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#33 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array(Array, Array)\n#34 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#35 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#36 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#37 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#38 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call(Array)\n#39 /var/www/html/projects/loan.local/vendor/symfony/console/Command/Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#40 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(912): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /var/www/html/projects/loan.local/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 {main}','2020-10-02 06:28:41'),(2,'database','default','{\"uuid\":\"ef7e1f7f-0ed3-4006-97a6-3cc443af6cef\",\"displayName\":\"Modules\\\\Savings\\\\Listeners\\\\SavingsStatusChangedCampaigns\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:55:\\\"Modules\\\\Savings\\\\Listeners\\\\SavingsStatusChangedCampaigns\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:43:\\\"Modules\\\\Savings\\\\Events\\\\SavingsStatusChanged\\\":2:{s:7:\\\"savings\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:32:\\\"Modules\\\\Savings\\\\Entities\\\\Savings\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:1:{i:0;s:7:\\\"charges\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:15:\\\"previous_status\\\";s:8:\\\"approved\\\";}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:3:\\\"job\\\";N;}\"}}','PDOException: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'savings_product_id\' in \'where clause\' in /var/www/html/projects/loan.local/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDOConnection.php:64\nStack trace:\n#0 /var/www/html/projects/loan.local/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDOConnection.php(64): PDO->prepare(\'select * from `...\', Array)\n#1 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(331): Doctrine\\DBAL\\Driver\\PDOConnection->prepare(\'select * from `...\')\n#2 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(664): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(\'select * from `...\', Array)\n#3 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(631): Illuminate\\Database\\Connection->runQueryCallback(\'select * from `...\', Array, Object(Closure))\n#4 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(339): Illuminate\\Database\\Connection->run(\'select * from `...\', Array, Object(Closure))\n#5 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2202): Illuminate\\Database\\Connection->select(\'select * from `...\', Array, true)\n#6 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2190): Illuminate\\Database\\Query\\Builder->runSelect()\n#7 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2685): Illuminate\\Database\\Query\\Builder->Illuminate\\Database\\Query\\{closure}()\n#8 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2191): Illuminate\\Database\\Query\\Builder->onceWithColumns(Array, Object(Closure))\n#9 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(539): Illuminate\\Database\\Query\\Builder->get(Array)\n#10 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(523): Illuminate\\Database\\Eloquent\\Builder->getModels(Array)\n#11 /var/www/html/projects/loan.local/Modules/Savings/Listeners/SavingsStatusChangedCampaigns.php(62): Illuminate\\Database\\Eloquent\\Builder->get()\n#12 [internal function]: Modules\\Savings\\Listeners\\SavingsStatusChangedCampaigns->handle(Object(Modules\\Savings\\Events\\SavingsStatusChanged))\n#13 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Events/CallQueuedListener.php(93): call_user_func_array(Array, Array)\n#14 [internal function]: Illuminate\\Events\\CallQueuedListener->handle(Object(Illuminate\\Foundation\\Application))\n#15 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array(Array, Array)\n#16 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#18 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#19 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#20 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#21 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#22 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#23 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Events\\CallQueuedListener), false)\n#25 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#26 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#27 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Events\\CallQueuedListener))\n#29 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#30 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#32 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#35 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array(Array, Array)\n#37 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call(Array)\n#42 /var/www/html/projects/loan.local/vendor/symfony/console/Command/Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(912): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 /var/www/html/projects/loan.local/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 {main}\n\nNext Doctrine\\DBAL\\Driver\\PDOException: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'savings_product_id\' in \'where clause\' in /var/www/html/projects/loan.local/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDOConnection.php:66\nStack trace:\n#0 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(331): Doctrine\\DBAL\\Driver\\PDOConnection->prepare(\'select * from `...\')\n#1 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(664): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(\'select * from `...\', Array)\n#2 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(631): Illuminate\\Database\\Connection->runQueryCallback(\'select * from `...\', Array, Object(Closure))\n#3 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(339): Illuminate\\Database\\Connection->run(\'select * from `...\', Array, Object(Closure))\n#4 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2202): Illuminate\\Database\\Connection->select(\'select * from `...\', Array, true)\n#5 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2190): Illuminate\\Database\\Query\\Builder->runSelect()\n#6 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2685): Illuminate\\Database\\Query\\Builder->Illuminate\\Database\\Query\\{closure}()\n#7 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2191): Illuminate\\Database\\Query\\Builder->onceWithColumns(Array, Object(Closure))\n#8 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(539): Illuminate\\Database\\Query\\Builder->get(Array)\n#9 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(523): Illuminate\\Database\\Eloquent\\Builder->getModels(Array)\n#10 /var/www/html/projects/loan.local/Modules/Savings/Listeners/SavingsStatusChangedCampaigns.php(62): Illuminate\\Database\\Eloquent\\Builder->get()\n#11 [internal function]: Modules\\Savings\\Listeners\\SavingsStatusChangedCampaigns->handle(Object(Modules\\Savings\\Events\\SavingsStatusChanged))\n#12 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Events/CallQueuedListener.php(93): call_user_func_array(Array, Array)\n#13 [internal function]: Illuminate\\Events\\CallQueuedListener->handle(Object(Illuminate\\Foundation\\Application))\n#14 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array(Array, Array)\n#15 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#17 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#18 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#19 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#20 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#21 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#22 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Events\\CallQueuedListener), false)\n#24 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#25 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#26 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Events\\CallQueuedListener))\n#28 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#29 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#31 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#32 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#34 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array(Array, Array)\n#36 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#37 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#38 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#39 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#40 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call(Array)\n#41 /var/www/html/projects/loan.local/vendor/symfony/console/Command/Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#42 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(912): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 /var/www/html/projects/loan.local/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'savings_product_id\' in \'where clause\' (SQL: select * from `communication_campaigns` where `trigger_type` = triggered and `status` = active and `savings_product_id` = 1 and `communication_campaign_business_rule_id` = 25) in /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php:671\nStack trace:\n#0 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(631): Illuminate\\Database\\Connection->runQueryCallback(\'select * from `...\', Array, Object(Closure))\n#1 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(339): Illuminate\\Database\\Connection->run(\'select * from `...\', Array, Object(Closure))\n#2 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2202): Illuminate\\Database\\Connection->select(\'select * from `...\', Array, true)\n#3 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2190): Illuminate\\Database\\Query\\Builder->runSelect()\n#4 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2685): Illuminate\\Database\\Query\\Builder->Illuminate\\Database\\Query\\{closure}()\n#5 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2191): Illuminate\\Database\\Query\\Builder->onceWithColumns(Array, Object(Closure))\n#6 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(539): Illuminate\\Database\\Query\\Builder->get(Array)\n#7 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(523): Illuminate\\Database\\Eloquent\\Builder->getModels(Array)\n#8 /var/www/html/projects/loan.local/Modules/Savings/Listeners/SavingsStatusChangedCampaigns.php(62): Illuminate\\Database\\Eloquent\\Builder->get()\n#9 [internal function]: Modules\\Savings\\Listeners\\SavingsStatusChangedCampaigns->handle(Object(Modules\\Savings\\Events\\SavingsStatusChanged))\n#10 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Events/CallQueuedListener.php(93): call_user_func_array(Array, Array)\n#11 [internal function]: Illuminate\\Events\\CallQueuedListener->handle(Object(Illuminate\\Foundation\\Application))\n#12 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array(Array, Array)\n#13 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#18 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#19 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#20 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#21 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Events\\CallQueuedListener), false)\n#22 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#23 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#24 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Events\\CallQueuedListener))\n#26 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#27 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#28 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#29 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#31 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#32 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#33 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array(Array, Array)\n#34 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#35 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#36 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#37 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#38 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call(Array)\n#39 /var/www/html/projects/loan.local/vendor/symfony/console/Command/Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#40 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(912): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /var/www/html/projects/loan.local/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 {main}','2020-10-02 06:28:47'),(3,'database','default','{\"uuid\":\"ed5feebb-b3f6-4038-90d0-d3c22cc9d976\",\"displayName\":\"Modules\\\\Savings\\\\Listeners\\\\SavingsStatusChangedCampaigns\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":16:{s:5:\\\"class\\\";s:55:\\\"Modules\\\\Savings\\\\Listeners\\\\SavingsStatusChangedCampaigns\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:43:\\\"Modules\\\\Savings\\\\Events\\\\SavingsStatusChanged\\\":2:{s:7:\\\"savings\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:32:\\\"Modules\\\\Savings\\\\Entities\\\\Savings\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:15:\\\"previous_status\\\";s:9:\\\"submitted\\\";}}s:5:\\\"tries\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}','PDOException: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'savings_product_id\' in \'where clause\' in /var/www/html/projects/loan.local/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDOConnection.php:77\nStack trace:\n#0 /var/www/html/projects/loan.local/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDOConnection.php(77): PDO->prepare()\n#1 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(331): Doctrine\\DBAL\\Driver\\PDOConnection->prepare()\n#2 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(664): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}()\n#3 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(631): Illuminate\\Database\\Connection->runQueryCallback()\n#4 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(339): Illuminate\\Database\\Connection->run()\n#5 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2302): Illuminate\\Database\\Connection->select()\n#6 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2290): Illuminate\\Database\\Query\\Builder->runSelect()\n#7 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2785): Illuminate\\Database\\Query\\Builder->Illuminate\\Database\\Query\\{closure}()\n#8 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2291): Illuminate\\Database\\Query\\Builder->onceWithColumns()\n#9 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(547): Illuminate\\Database\\Query\\Builder->get()\n#10 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(531): Illuminate\\Database\\Eloquent\\Builder->getModels()\n#11 /var/www/html/projects/loan.local/Modules/Savings/Listeners/SavingsStatusChangedCampaigns.php(62): Illuminate\\Database\\Eloquent\\Builder->get()\n#12 [internal function]: Modules\\Savings\\Listeners\\SavingsStatusChangedCampaigns->handle()\n#13 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Events/CallQueuedListener.php(94): call_user_func_array()\n#14 [internal function]: Illuminate\\Events\\CallQueuedListener->handle()\n#15 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): call_user_func_array()\n#16 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#20 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#21 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#24 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(87): Illuminate\\Pipeline\\Pipeline->then()\n#28 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(60): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(406): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Worker->process()\n#32 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(158): Illuminate\\Queue\\Worker->runJob()\n#33 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(116): Illuminate\\Queue\\Worker->daemon()\n#34 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(100): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): call_user_func_array()\n#37 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#39 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#40 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#41 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#42 /var/www/html/projects/loan.local/vendor/symfony/console/Command/Command.php(258): Illuminate\\Console\\Command->execute()\n#43 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#44 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(920): Illuminate\\Console\\Command->run()\n#45 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(266): Symfony\\Component\\Console\\Application->doRunCommand()\n#46 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(142): Symfony\\Component\\Console\\Application->doRun()\n#47 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run()\n#48 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#49 /var/www/html/projects/loan.local/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#50 {main}\n\nNext Doctrine\\DBAL\\Driver\\PDO\\Exception: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'savings_product_id\' in \'where clause\' in /var/www/html/projects/loan.local/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDO/Exception.php:18\nStack trace:\n#0 /var/www/html/projects/loan.local/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDOConnection.php(82): Doctrine\\DBAL\\Driver\\PDO\\Exception::new()\n#1 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(331): Doctrine\\DBAL\\Driver\\PDOConnection->prepare()\n#2 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(664): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}()\n#3 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(631): Illuminate\\Database\\Connection->runQueryCallback()\n#4 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(339): Illuminate\\Database\\Connection->run()\n#5 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2302): Illuminate\\Database\\Connection->select()\n#6 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2290): Illuminate\\Database\\Query\\Builder->runSelect()\n#7 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2785): Illuminate\\Database\\Query\\Builder->Illuminate\\Database\\Query\\{closure}()\n#8 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2291): Illuminate\\Database\\Query\\Builder->onceWithColumns()\n#9 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(547): Illuminate\\Database\\Query\\Builder->get()\n#10 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(531): Illuminate\\Database\\Eloquent\\Builder->getModels()\n#11 /var/www/html/projects/loan.local/Modules/Savings/Listeners/SavingsStatusChangedCampaigns.php(62): Illuminate\\Database\\Eloquent\\Builder->get()\n#12 [internal function]: Modules\\Savings\\Listeners\\SavingsStatusChangedCampaigns->handle()\n#13 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Events/CallQueuedListener.php(94): call_user_func_array()\n#14 [internal function]: Illuminate\\Events\\CallQueuedListener->handle()\n#15 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): call_user_func_array()\n#16 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#20 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#21 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#24 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(87): Illuminate\\Pipeline\\Pipeline->then()\n#28 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(60): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(406): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Worker->process()\n#32 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(158): Illuminate\\Queue\\Worker->runJob()\n#33 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(116): Illuminate\\Queue\\Worker->daemon()\n#34 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(100): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): call_user_func_array()\n#37 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#39 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#40 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#41 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#42 /var/www/html/projects/loan.local/vendor/symfony/console/Command/Command.php(258): Illuminate\\Console\\Command->execute()\n#43 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#44 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(920): Illuminate\\Console\\Command->run()\n#45 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(266): Symfony\\Component\\Console\\Application->doRunCommand()\n#46 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(142): Symfony\\Component\\Console\\Application->doRun()\n#47 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run()\n#48 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#49 /var/www/html/projects/loan.local/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#50 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'savings_product_id\' in \'where clause\' (SQL: select * from `communication_campaigns` where `trigger_type` = triggered and `status` = active and `savings_product_id` = 2 and `communication_campaign_business_rule_id` = 24) in /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php:671\nStack trace:\n#0 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(631): Illuminate\\Database\\Connection->runQueryCallback()\n#1 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(339): Illuminate\\Database\\Connection->run()\n#2 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2302): Illuminate\\Database\\Connection->select()\n#3 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2290): Illuminate\\Database\\Query\\Builder->runSelect()\n#4 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2785): Illuminate\\Database\\Query\\Builder->Illuminate\\Database\\Query\\{closure}()\n#5 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2291): Illuminate\\Database\\Query\\Builder->onceWithColumns()\n#6 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(547): Illuminate\\Database\\Query\\Builder->get()\n#7 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(531): Illuminate\\Database\\Eloquent\\Builder->getModels()\n#8 /var/www/html/projects/loan.local/Modules/Savings/Listeners/SavingsStatusChangedCampaigns.php(62): Illuminate\\Database\\Eloquent\\Builder->get()\n#9 [internal function]: Modules\\Savings\\Listeners\\SavingsStatusChangedCampaigns->handle()\n#10 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Events/CallQueuedListener.php(94): call_user_func_array()\n#11 [internal function]: Illuminate\\Events\\CallQueuedListener->handle()\n#12 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): call_user_func_array()\n#13 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#15 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#16 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#17 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#18 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#19 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#21 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#22 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#23 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(87): Illuminate\\Pipeline\\Pipeline->then()\n#25 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(60): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#26 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#27 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(406): Illuminate\\Queue\\Jobs\\Job->fire()\n#28 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Worker->process()\n#29 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(158): Illuminate\\Queue\\Worker->runJob()\n#30 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(116): Illuminate\\Queue\\Worker->daemon()\n#31 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(100): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#32 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#33 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): call_user_func_array()\n#34 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#35 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#36 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#37 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#38 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#39 /var/www/html/projects/loan.local/vendor/symfony/console/Command/Command.php(258): Illuminate\\Console\\Command->execute()\n#40 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#41 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(920): Illuminate\\Console\\Command->run()\n#42 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(266): Symfony\\Component\\Console\\Application->doRunCommand()\n#43 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(142): Symfony\\Component\\Console\\Application->doRun()\n#44 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run()\n#45 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#46 /var/www/html/projects/loan.local/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 {main}','2020-12-06 17:58:27'),(4,'database','default','{\"uuid\":\"c7232cbb-94f6-49ca-a510-423339f2a621\",\"displayName\":\"Modules\\\\Savings\\\\Listeners\\\\SavingsStatusChangedCampaigns\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":16:{s:5:\\\"class\\\";s:55:\\\"Modules\\\\Savings\\\\Listeners\\\\SavingsStatusChangedCampaigns\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:43:\\\"Modules\\\\Savings\\\\Events\\\\SavingsStatusChanged\\\":2:{s:7:\\\"savings\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:32:\\\"Modules\\\\Savings\\\\Entities\\\\Savings\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:2:{i:0;s:7:\\\"charges\\\";i:1;s:15:\\\"savings_product\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:15:\\\"previous_status\\\";s:8:\\\"approved\\\";}}s:5:\\\"tries\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}','PDOException: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'savings_product_id\' in \'where clause\' in /var/www/html/projects/loan.local/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDOConnection.php:77\nStack trace:\n#0 /var/www/html/projects/loan.local/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDOConnection.php(77): PDO->prepare()\n#1 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(331): Doctrine\\DBAL\\Driver\\PDOConnection->prepare()\n#2 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(664): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}()\n#3 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(631): Illuminate\\Database\\Connection->runQueryCallback()\n#4 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(339): Illuminate\\Database\\Connection->run()\n#5 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2302): Illuminate\\Database\\Connection->select()\n#6 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2290): Illuminate\\Database\\Query\\Builder->runSelect()\n#7 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2785): Illuminate\\Database\\Query\\Builder->Illuminate\\Database\\Query\\{closure}()\n#8 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2291): Illuminate\\Database\\Query\\Builder->onceWithColumns()\n#9 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(547): Illuminate\\Database\\Query\\Builder->get()\n#10 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(531): Illuminate\\Database\\Eloquent\\Builder->getModels()\n#11 /var/www/html/projects/loan.local/Modules/Savings/Listeners/SavingsStatusChangedCampaigns.php(62): Illuminate\\Database\\Eloquent\\Builder->get()\n#12 [internal function]: Modules\\Savings\\Listeners\\SavingsStatusChangedCampaigns->handle()\n#13 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Events/CallQueuedListener.php(94): call_user_func_array()\n#14 [internal function]: Illuminate\\Events\\CallQueuedListener->handle()\n#15 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): call_user_func_array()\n#16 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#20 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#21 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#24 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(87): Illuminate\\Pipeline\\Pipeline->then()\n#28 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(60): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(406): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Worker->process()\n#32 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(158): Illuminate\\Queue\\Worker->runJob()\n#33 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(116): Illuminate\\Queue\\Worker->daemon()\n#34 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(100): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): call_user_func_array()\n#37 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#39 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#40 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#41 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#42 /var/www/html/projects/loan.local/vendor/symfony/console/Command/Command.php(258): Illuminate\\Console\\Command->execute()\n#43 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#44 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(920): Illuminate\\Console\\Command->run()\n#45 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(266): Symfony\\Component\\Console\\Application->doRunCommand()\n#46 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(142): Symfony\\Component\\Console\\Application->doRun()\n#47 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run()\n#48 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#49 /var/www/html/projects/loan.local/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#50 {main}\n\nNext Doctrine\\DBAL\\Driver\\PDO\\Exception: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'savings_product_id\' in \'where clause\' in /var/www/html/projects/loan.local/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDO/Exception.php:18\nStack trace:\n#0 /var/www/html/projects/loan.local/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDOConnection.php(82): Doctrine\\DBAL\\Driver\\PDO\\Exception::new()\n#1 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(331): Doctrine\\DBAL\\Driver\\PDOConnection->prepare()\n#2 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(664): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}()\n#3 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(631): Illuminate\\Database\\Connection->runQueryCallback()\n#4 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(339): Illuminate\\Database\\Connection->run()\n#5 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2302): Illuminate\\Database\\Connection->select()\n#6 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2290): Illuminate\\Database\\Query\\Builder->runSelect()\n#7 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2785): Illuminate\\Database\\Query\\Builder->Illuminate\\Database\\Query\\{closure}()\n#8 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2291): Illuminate\\Database\\Query\\Builder->onceWithColumns()\n#9 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(547): Illuminate\\Database\\Query\\Builder->get()\n#10 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(531): Illuminate\\Database\\Eloquent\\Builder->getModels()\n#11 /var/www/html/projects/loan.local/Modules/Savings/Listeners/SavingsStatusChangedCampaigns.php(62): Illuminate\\Database\\Eloquent\\Builder->get()\n#12 [internal function]: Modules\\Savings\\Listeners\\SavingsStatusChangedCampaigns->handle()\n#13 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Events/CallQueuedListener.php(94): call_user_func_array()\n#14 [internal function]: Illuminate\\Events\\CallQueuedListener->handle()\n#15 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): call_user_func_array()\n#16 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#20 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#21 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#24 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(87): Illuminate\\Pipeline\\Pipeline->then()\n#28 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(60): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(406): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Worker->process()\n#32 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(158): Illuminate\\Queue\\Worker->runJob()\n#33 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(116): Illuminate\\Queue\\Worker->daemon()\n#34 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(100): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): call_user_func_array()\n#37 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#39 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#40 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#41 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#42 /var/www/html/projects/loan.local/vendor/symfony/console/Command/Command.php(258): Illuminate\\Console\\Command->execute()\n#43 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#44 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(920): Illuminate\\Console\\Command->run()\n#45 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(266): Symfony\\Component\\Console\\Application->doRunCommand()\n#46 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(142): Symfony\\Component\\Console\\Application->doRun()\n#47 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run()\n#48 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#49 /var/www/html/projects/loan.local/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#50 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'savings_product_id\' in \'where clause\' (SQL: select * from `communication_campaigns` where `trigger_type` = triggered and `status` = active and `savings_product_id` = 2 and `communication_campaign_business_rule_id` = 25) in /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php:671\nStack trace:\n#0 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(631): Illuminate\\Database\\Connection->runQueryCallback()\n#1 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Connection.php(339): Illuminate\\Database\\Connection->run()\n#2 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2302): Illuminate\\Database\\Connection->select()\n#3 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2290): Illuminate\\Database\\Query\\Builder->runSelect()\n#4 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2785): Illuminate\\Database\\Query\\Builder->Illuminate\\Database\\Query\\{closure}()\n#5 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2291): Illuminate\\Database\\Query\\Builder->onceWithColumns()\n#6 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(547): Illuminate\\Database\\Query\\Builder->get()\n#7 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(531): Illuminate\\Database\\Eloquent\\Builder->getModels()\n#8 /var/www/html/projects/loan.local/Modules/Savings/Listeners/SavingsStatusChangedCampaigns.php(62): Illuminate\\Database\\Eloquent\\Builder->get()\n#9 [internal function]: Modules\\Savings\\Listeners\\SavingsStatusChangedCampaigns->handle()\n#10 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Events/CallQueuedListener.php(94): call_user_func_array()\n#11 [internal function]: Illuminate\\Events\\CallQueuedListener->handle()\n#12 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): call_user_func_array()\n#13 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#15 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#16 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#17 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#18 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#19 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#21 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#22 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#23 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(87): Illuminate\\Pipeline\\Pipeline->then()\n#25 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(60): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#26 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#27 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(406): Illuminate\\Queue\\Jobs\\Job->fire()\n#28 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Worker->process()\n#29 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(158): Illuminate\\Queue\\Worker->runJob()\n#30 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(116): Illuminate\\Queue\\Worker->daemon()\n#31 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(100): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#32 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#33 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): call_user_func_array()\n#34 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#35 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#36 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#37 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Container/Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#38 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#39 /var/www/html/projects/loan.local/vendor/symfony/console/Command/Command.php(258): Illuminate\\Console\\Command->execute()\n#40 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#41 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(920): Illuminate\\Console\\Command->run()\n#42 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(266): Symfony\\Component\\Console\\Application->doRunCommand()\n#43 /var/www/html/projects/loan.local/vendor/symfony/console/Application.php(142): Symfony\\Component\\Console\\Application->doRun()\n#44 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run()\n#45 /var/www/html/projects/loan.local/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#46 /var/www/html/projects/loan.local/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#47 {main}','2020-12-06 18:01:11');
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funds`
--

DROP TABLE IF EXISTS `funds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funds`
--

LOCK TABLES `funds` WRITE;
/*!40000 ALTER TABLE `funds` DISABLE KEYS */;
INSERT INTO `funds` VALUES (1,'Test'),(2,'Donor Fund');
/*!40000 ALTER TABLE `funds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `income_type_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `income_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `asset_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `amount` decimal(65,2) NOT NULL DEFAULT '0.00',
  `date` date DEFAULT NULL,
  `recurring` tinyint NOT NULL DEFAULT '0',
  `recur_frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '31',
  `recur_start_date` date DEFAULT NULL,
  `recur_end_date` date DEFAULT NULL,
  `recur_next_date` date DEFAULT NULL,
  `recur_type` enum('day','week','month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `files` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income` VALUES (1,1,1,1,1,3,1,40.00,'2020-10-23',0,'31',NULL,NULL,NULL,'month',NULL,'test',NULL,'2020-10-23 08:08:29','2020-10-23 08:08:29');
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income_types`
--

DROP TABLE IF EXISTS `income_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `income_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `asset_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_types`
--

LOCK TABLES `income_types` WRITE;
/*!40000 ALTER TABLE `income_types` DISABLE KEYS */;
INSERT INTO `income_types` VALUES (1,'Test',3,1,'2020-10-07 16:49:33','2020-10-23 07:12:31'),(2,'New',3,1,'2020-10-23 07:10:19','2020-10-23 07:10:19');
/*!40000 ALTER TABLE `income_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_entries`
--

DROP TABLE IF EXISTS `journal_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journal_entries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_detail_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `chart_of_account_id` bigint unsigned DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_sub_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `debit` decimal(65,4) DEFAULT NULL,
  `credit` decimal(65,4) DEFAULT NULL,
  `balance` decimal(65,4) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `reversed` tinyint NOT NULL DEFAULT '0',
  `reversible` tinyint NOT NULL DEFAULT '1',
  `manual_entry` tinyint NOT NULL DEFAULT '0',
  `receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_id_index` (`branch_id`),
  KEY `chart_of_account_id_index` (`chart_of_account_id`),
  KEY `currency_id_index` (`currency_id`),
  KEY `created_by_id_index` (`created_by_id`),
  KEY `client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_entries`
--

LOCK TABLES `journal_entries` WRITE;
/*!40000 ALTER TABLE `journal_entries` DISABLE KEYS */;
INSERT INTO `journal_entries` VALUES (1,1,'5f8ed69f3776b',2,1,1,1,'manual_entry',NULL,NULL,'2020-10-20','10','2020','ff',NULL,50.0000,NULL,NULL,1,0,1,1,NULL,'ff','2020-10-20 12:22:55','2020-10-20 12:22:55'),(2,1,'5f8ed69f3776b',2,1,1,1,'manual_entry',NULL,NULL,'2020-10-20','10','2020','ff',NULL,NULL,50.0000,NULL,1,0,1,1,NULL,'ff','2020-10-20 12:22:55','2020-10-20 12:22:55'),(5,1,'1',4,1,1,2,'expense',NULL,NULL,'2020-10-22','10','2020','1',NULL,20.0000,NULL,NULL,1,0,1,0,NULL,NULL,'2020-10-22 16:57:14','2020-10-22 16:57:14'),(6,1,'1',4,1,1,1,'expense',NULL,NULL,'2020-10-22','10','2020','1',NULL,NULL,20.0000,NULL,1,0,1,0,NULL,NULL,'2020-10-22 16:57:14','2020-10-22 16:57:14'),(9,1,'1',6,1,1,3,'income',NULL,NULL,'2020-10-23','10','2020','1',NULL,NULL,40.0000,NULL,1,0,1,0,NULL,NULL,'2020-10-23 08:12:43','2020-10-23 08:12:43'),(10,1,'1',6,1,1,1,'income',NULL,NULL,'2020-10-23','10','2020','1',NULL,40.0000,NULL,NULL,1,0,1,0,NULL,NULL,'2020-10-23 08:12:43','2020-10-23 08:12:43');
/*!40000 ALTER TABLE `journal_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_applications`
--

DROP TABLE IF EXISTS `loan_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_applications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned DEFAULT NULL,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `loan_id` bigint unsigned DEFAULT NULL,
  `loan_product_id` bigint unsigned NOT NULL,
  `amount` decimal(65,4) NOT NULL DEFAULT '0.0000',
  `status` enum('approved','pending','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_applications`
--

LOCK TABLES `loan_applications` WRITE;
/*!40000 ALTER TABLE `loan_applications` DISABLE KEYS */;
INSERT INTO `loan_applications` VALUES (1,1,2,1,NULL,2,1000.0000,'pending','dd','2020-12-04 17:11:51','2020-12-04 17:11:51'),(2,1,2,1,NULL,2,1000.0000,'pending','ff f','2020-12-04 17:13:11','2020-12-04 17:13:11'),(3,1,2,1,NULL,1,1000.0000,'pending','sd','2020-12-04 17:13:18','2020-12-04 17:13:18');
/*!40000 ALTER TABLE `loan_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_charge_options`
--

DROP TABLE IF EXISTS `loan_charge_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_charge_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `translated_name` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_charge_options`
--

LOCK TABLES `loan_charge_options` WRITE;
/*!40000 ALTER TABLE `loan_charge_options` DISABLE KEYS */;
INSERT INTO `loan_charge_options` VALUES (1,'Flat','Flat',1),(2,'Principal due on installment','Principal due on installment',1),(3,'Principal + Interest due on installment','Principal + Interest due on installment',1),(4,'Interest due on installment','Interest due on installment',1),(5,'Total Outstanding Loan Principal','Total Outstanding Loan Principal',1),(6,'Percentage of Original Loan Principal per Installment','Percentage of Original Loan Principal per Installment',1),(7,'Original Loan Principal','Original Loan Principal',1);
/*!40000 ALTER TABLE `loan_charge_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_charge_types`
--

DROP TABLE IF EXISTS `loan_charge_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_charge_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `translated_name` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_charge_types`
--

LOCK TABLES `loan_charge_types` WRITE;
/*!40000 ALTER TABLE `loan_charge_types` DISABLE KEYS */;
INSERT INTO `loan_charge_types` VALUES (1,'Disbursement','Disbursement',1),(2,'Specified Due Date','Specified Due Date',1),(3,'Installment Fees','Installment Fees',1),(4,'Overdue Installment Fee','Overdue Installment Fee',1),(5,'Disbursement - Paid With Repayment','Disbursement - Paid With Repayment',1),(6,'Loan Rescheduling Fee','Loan Rescheduling Fee',1),(7,'Overdue On Loan Maturity','Overdue On Loan Maturity',1),(8,'Last installment fee','Last installment fee',1);
/*!40000 ALTER TABLE `loan_charge_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_charges`
--

DROP TABLE IF EXISTS `loan_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_charges` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `loan_charge_type_id` bigint unsigned NOT NULL,
  `loan_charge_option_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(65,6) NOT NULL,
  `min_amount` decimal(65,6) DEFAULT NULL,
  `max_amount` decimal(65,6) DEFAULT NULL,
  `payment_mode` enum('regular','account_transfer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'regular',
  `schedule` tinyint DEFAULT '0',
  `schedule_frequency` int DEFAULT NULL,
  `schedule_frequency_type` enum('days','weeks','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_penalty` tinyint DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '0',
  `allow_override` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_charges_currency_id_foreign` (`currency_id`),
  KEY `loan_charges_loan_charge_type_id_foreign` (`loan_charge_type_id`),
  KEY `loan_charges_loan_charge_option_id_foreign` (`loan_charge_option_id`),
  KEY `loan_charges_created_by_id_foreign` (`created_by_id`),
  CONSTRAINT `loan_charges_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `loan_charges_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `loan_charges_loan_charge_option_id_foreign` FOREIGN KEY (`loan_charge_option_id`) REFERENCES `loan_charge_options` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `loan_charges_loan_charge_type_id_foreign` FOREIGN KEY (`loan_charge_type_id`) REFERENCES `loan_charge_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_charges`
--

LOCK TABLES `loan_charges` WRITE;
/*!40000 ALTER TABLE `loan_charges` DISABLE KEYS */;
INSERT INTO `loan_charges` VALUES (1,1,1,3,1,'Installation',40.000000,NULL,NULL,'regular',0,NULL,NULL,0,1,0,'2020-11-30 10:31:04','2020-11-30 10:31:04');
/*!40000 ALTER TABLE `loan_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_collateral`
--

DROP TABLE IF EXISTS `loan_collateral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_collateral` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `loan_id` bigint unsigned NOT NULL,
  `loan_collateral_type_id` bigint unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `value` decimal(65,6) DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','repossessed','sold','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_collateral_loan_id_index` (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_collateral`
--

LOCK TABLES `loan_collateral` WRITE;
/*!40000 ALTER TABLE `loan_collateral` DISABLE KEYS */;
INSERT INTO `loan_collateral` VALUES (1,1,2,1,'jfjf',1000.000000,'wG0cgBgyEPriiDQ7cA0DNAJgkuBiH2PzkdEjnzH3.png','active','2020-12-03 07:54:16','2020-12-03 07:54:16');
/*!40000 ALTER TABLE `loan_collateral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_collateral_types`
--

DROP TABLE IF EXISTS `loan_collateral_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_collateral_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_collateral_types`
--

LOCK TABLES `loan_collateral_types` WRITE;
/*!40000 ALTER TABLE `loan_collateral_types` DISABLE KEYS */;
INSERT INTO `loan_collateral_types` VALUES (1,'TV Set');
/*!40000 ALTER TABLE `loan_collateral_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_credit_checks`
--

DROP TABLE IF EXISTS `loan_credit_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_credit_checks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `translated_name` text COLLATE utf8mb4_unicode_ci,
  `security_level` enum('block','pass','warning') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'warning',
  `rating_type` enum('boolean','score') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'boolean',
  `pass_min_amount` decimal(65,6) DEFAULT NULL,
  `pass_max_amount` decimal(65,6) DEFAULT NULL,
  `warn_min_amount` decimal(65,6) DEFAULT NULL,
  `warn_max_amount` decimal(65,6) DEFAULT NULL,
  `fail_min_amount` decimal(65,6) DEFAULT NULL,
  `fail_max_amount` decimal(65,6) DEFAULT NULL,
  `general_error_msg` text COLLATE utf8mb4_unicode_ci,
  `user_friendly_error_msg` text COLLATE utf8mb4_unicode_ci,
  `general_warning_msg` text COLLATE utf8mb4_unicode_ci,
  `user_friendly_warning_msg` text COLLATE utf8mb4_unicode_ci,
  `general_success_msg` text COLLATE utf8mb4_unicode_ci,
  `user_friendly_success_msg` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_credit_checks_created_by_id_foreign` (`created_by_id`),
  CONSTRAINT `loan_credit_checks_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_credit_checks`
--

LOCK TABLES `loan_credit_checks` WRITE;
/*!40000 ALTER TABLE `loan_credit_checks` DISABLE KEYS */;
INSERT INTO `loan_credit_checks` VALUES (1,NULL,'Client Written-Off Loans Check','Client Written-Off Loans Check','block','boolean',NULL,NULL,NULL,NULL,NULL,NULL,'The client has one or more written-off loans','The client has one or more written-off loans','The client has one or more written-off loans','The client has one or more written-off loans','The client has one or more written-off loans','The client has one or more written-off loans',0,NULL,NULL),(2,NULL,'Same Product Outstanding','Same Product Outstanding','block','boolean',NULL,NULL,NULL,NULL,NULL,NULL,'The client has an active loan for the same product','The client has an active loan for the same product','The client has an active loan for the same product','The client has an active loan for the same product','The client has an active loan for the same product','The client has an active loan for the same product',0,NULL,NULL),(3,NULL,'Client Arrears','Client Arrears','block','boolean',NULL,NULL,NULL,NULL,NULL,NULL,'Client has arrears on existing loans','Client has arrears on existing loans','Client has arrears on existing loans','Client has arrears on existing loans','Client has arrears on existing loans','Client has arrears on existing loans',0,NULL,NULL),(4,NULL,'Outstanding Loan Balance','Outstanding Loan Balance','block','boolean',NULL,NULL,NULL,NULL,NULL,NULL,'Client has outstanding balance on existing loans','Client has outstanding balance on existing loans','Client has outstanding balance on existing loans','Client has outstanding balance on existing loans','Client has outstanding balance on existing loans','Client has outstanding balance on existing loans',0,NULL,NULL),(5,NULL,'Rejected and withdrawn loans','Rejected and withdrawn loans','block','boolean',NULL,NULL,NULL,NULL,NULL,NULL,'This client has had one or more rejected or withdrawn loans','This client has had one or more rejected or withdrawn loans','This client has had one or more rejected or withdrawn loans','This client has had one or more rejected or withdrawn loans','This client has had one or more rejected or withdrawn loans','This client has had one or more rejected or withdrawn loans',0,NULL,NULL),(6,NULL,'Total collateral items value','Total collateral items value','block','boolean',NULL,NULL,NULL,NULL,NULL,NULL,'The total value of collateral items for this loan is less than the principal loanamount','The total value of collateral items for this loan is less than the principal loanamount','The total value of collateral items for this loan is less than the principal loanamount','The total value of collateral items for this loan is less than the principal loanamount','The total value of collateral items for this loan is less than the principal loanamount','The total value of collateral items for this loan is less than the principal loanamount',0,NULL,NULL);
/*!40000 ALTER TABLE `loan_credit_checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_disbursement_channels`
--

DROP TABLE IF EXISTS `loan_disbursement_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_disbursement_channels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_system` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_disbursement_channels`
--

LOCK TABLES `loan_disbursement_channels` WRITE;
/*!40000 ALTER TABLE `loan_disbursement_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_disbursement_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_files`
--

DROP TABLE IF EXISTS `loan_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `loan_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `size` int DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_files_loan_id_index` (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_files`
--

LOCK TABLES `loan_files` WRITE;
/*!40000 ALTER TABLE `loan_files` DISABLE KEYS */;
INSERT INTO `loan_files` VALUES (1,1,2,'Dit','ggf gg',NULL,'0JEZF3voy3DGTkF7G5nhSbYg1Zy41oKxaletsJVM.pdf','2020-12-03 07:10:42','2020-12-03 07:31:52'),(2,1,2,'nd','ttbttt',NULL,'3WAuW2Bnqy1tzp5lOPB8s9Qrt0dvvV0bjm1E65Po.pdf','2020-12-03 07:11:32','2020-12-03 07:32:06');
/*!40000 ALTER TABLE `loan_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_guarantors`
--

DROP TABLE IF EXISTS `loan_guarantors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_guarantors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `loan_id` bigint unsigned DEFAULT NULL,
  `is_client` tinyint NOT NULL DEFAULT '0',
  `client_id` bigint unsigned DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','other','unspecified') COLLATE utf8mb4_unicode_ci DEFAULT 'unspecified',
  `status` enum('pending','active','inactive','deceased','unspecified','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `marital_status` enum('married','single','divorced','widowed','unspecified','other') COLLATE utf8mb4_unicode_ci DEFAULT 'unspecified',
  `country_id` bigint unsigned DEFAULT NULL,
  `title_id` bigint unsigned DEFAULT NULL,
  `profession_id` bigint unsigned DEFAULT NULL,
  `client_relationship_id` bigint unsigned DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_date` date DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `guaranteed_amount` decimal(65,6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_guarantors_loan_id_index` (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_guarantors`
--

LOCK TABLES `loan_guarantors` WRITE;
/*!40000 ALTER TABLE `loan_guarantors` DISABLE KEYS */;
INSERT INTO `loan_guarantors` VALUES (1,1,NULL,2,1,1,'Tererai',NULL,'Mugova','male','pending',NULL,246,NULL,NULL,NULL,'+263774175438',NULL,'tjmugova@localhost.com','2019-03-29','933 13th street\r\nGlenview 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,400.000000,'2020-12-03 09:06:32','2020-12-03 09:06:32'),(2,1,NULL,2,0,NULL,'Tererai',NULL,'Mugova','male','pending','single',1,1,1,1,'+263774175438',NULL,'tjmugova@webstudio.co.zw','2020-12-01','933 13th street\r\nGlenview 1',NULL,NULL,NULL,NULL,NULL,'f',NULL,NULL,400.000000,'2020-12-03 09:13:46','2020-12-03 09:24:04');
/*!40000 ALTER TABLE `loan_guarantors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_history`
--

DROP TABLE IF EXISTS `loan_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint unsigned NOT NULL,
  `created_by_id` bigint unsigned NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci,
  `user` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_history_loan_id_index` (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_history`
--

LOCK TABLES `loan_history` WRITE;
/*!40000 ALTER TABLE `loan_history` DISABLE KEYS */;
INSERT INTO `loan_history` VALUES (1,1,1,'Loan Created','Admin Admin','2020-09-22 14:06:02','2020-09-22 14:06:02'),(2,1,1,'Loan Approved','Admin Admin','2020-09-22 14:06:08','2020-09-22 14:06:08'),(3,1,1,'Loan Disbursed','Admin Admin','2020-09-22 14:06:16','2020-09-22 14:06:16'),(4,2,1,'Loan Created','Admin Admin','2020-12-02 12:19:06','2020-12-02 12:19:06'),(5,2,1,'Loan Approved','Admin Admin','2020-12-02 16:07:50','2020-12-02 16:07:50'),(6,2,1,'Loan Disbursed','Admin Admin','2020-12-02 16:11:09','2020-12-02 16:11:09'),(7,3,1,'Loan Created','Admin Admin','2020-12-10 08:55:21','2020-12-10 08:55:21'),(8,3,1,'Loan Approved','Admin Admin','2020-12-10 08:55:35','2020-12-10 08:55:35'),(9,3,1,'Loan Disbursed','Admin Admin','2020-12-10 08:56:07','2020-12-10 08:56:07'),(10,3,1,'Loan Undisbursed','Admin Admin','2020-12-10 08:56:38','2020-12-10 08:56:38'),(11,3,1,'Loan Disbursed','Admin Admin','2020-12-10 08:56:55','2020-12-10 08:56:55'),(12,3,1,'Loan Undisbursed','Admin Admin','2020-12-10 09:11:54','2020-12-10 09:11:54'),(13,3,1,'Loan Disbursed','Admin Admin','2020-12-10 09:12:10','2020-12-10 09:12:10'),(14,1,1,'Loan Undisbursed','Admin Admin','2020-12-21 08:55:51','2020-12-21 08:55:51'),(15,1,1,'Loan Disbursed','Admin Admin','2020-12-21 08:55:59','2020-12-21 08:55:59');
/*!40000 ALTER TABLE `loan_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_linked_charges`
--

DROP TABLE IF EXISTS `loan_linked_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_linked_charges` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint unsigned NOT NULL,
  `loan_charge_id` bigint unsigned NOT NULL,
  `loan_charge_type_id` bigint unsigned DEFAULT NULL,
  `loan_charge_option_id` bigint unsigned DEFAULT NULL,
  `loan_transaction_id` bigint unsigned DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `amount` decimal(65,6) NOT NULL,
  `calculated_amount` decimal(65,6) DEFAULT NULL,
  `amount_paid_derived` decimal(65,6) DEFAULT NULL,
  `amount_waived_derived` decimal(65,6) DEFAULT NULL,
  `amount_written_off_derived` decimal(65,6) DEFAULT NULL,
  `amount_outstanding_derived` decimal(65,6) DEFAULT NULL,
  `is_penalty` tinyint NOT NULL DEFAULT '0',
  `waived` tinyint NOT NULL DEFAULT '0',
  `is_paid` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_linked_charges_loan_id_index` (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_linked_charges`
--

LOCK TABLES `loan_linked_charges` WRITE;
/*!40000 ALTER TABLE `loan_linked_charges` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_linked_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_linked_credit_checks`
--

DROP TABLE IF EXISTS `loan_linked_credit_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_linked_credit_checks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint unsigned NOT NULL,
  `loan_credit_check_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_linked_credit_checks`
--

LOCK TABLES `loan_linked_credit_checks` WRITE;
/*!40000 ALTER TABLE `loan_linked_credit_checks` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_linked_credit_checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_notes`
--

DROP TABLE IF EXISTS `loan_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `loan_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_notes_loan_id_index` (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_notes`
--

LOCK TABLES `loan_notes` WRITE;
/*!40000 ALTER TABLE `loan_notes` DISABLE KEYS */;
INSERT INTO `loan_notes` VALUES (1,1,2,NULL,'Client not in good books','2020-12-03 08:04:09','2020-12-03 08:04:09'),(2,1,2,NULL,'fmf fjf','2020-12-03 08:14:23','2020-12-03 08:14:23');
/*!40000 ALTER TABLE `loan_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_officer_history`
--

DROP TABLE IF EXISTS `loan_officer_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_officer_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint unsigned NOT NULL,
  `created_by_id` bigint unsigned NOT NULL,
  `loan_officer_id` bigint unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_officer_history_loan_id_index` (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_officer_history`
--

LOCK TABLES `loan_officer_history` WRITE;
/*!40000 ALTER TABLE `loan_officer_history` DISABLE KEYS */;
INSERT INTO `loan_officer_history` VALUES (1,1,1,1,'2020-09-22',NULL,'2020-09-22 14:06:02','2020-09-22 14:06:02'),(2,2,1,1,'2020-12-02',NULL,'2020-12-02 12:19:06','2020-12-02 12:19:06'),(3,3,1,1,'2020-12-10',NULL,'2020-12-10 08:55:21','2020-12-10 08:55:21');
/*!40000 ALTER TABLE `loan_officer_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_product_linked_charges`
--

DROP TABLE IF EXISTS `loan_product_linked_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_product_linked_charges` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `loan_product_id` bigint unsigned NOT NULL,
  `loan_charge_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_product_linked_charges`
--

LOCK TABLES `loan_product_linked_charges` WRITE;
/*!40000 ALTER TABLE `loan_product_linked_charges` DISABLE KEYS */;
INSERT INTO `loan_product_linked_charges` VALUES (1,2,1,'2020-11-30 13:58:39','2020-11-30 13:58:39'),(5,1,1,'2020-12-14 17:42:16','2020-12-14 17:42:16');
/*!40000 ALTER TABLE `loan_product_linked_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_product_linked_credit_checks`
--

DROP TABLE IF EXISTS `loan_product_linked_credit_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_product_linked_credit_checks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `loan_product_id` bigint unsigned NOT NULL,
  `loan_credit_check_id` bigint unsigned NOT NULL,
  `check_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_product_linked_credit_checks`
--

LOCK TABLES `loan_product_linked_credit_checks` WRITE;
/*!40000 ALTER TABLE `loan_product_linked_credit_checks` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_product_linked_credit_checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_products`
--

DROP TABLE IF EXISTS `loan_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `loan_disbursement_channel_id` bigint unsigned DEFAULT NULL,
  `loan_transaction_processing_strategy_id` bigint unsigned NOT NULL,
  `fund_id` bigint unsigned NOT NULL,
  `fund_source_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `loan_portfolio_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `interest_receivable_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `penalties_receivable_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `fees_receivable_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `fees_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `overpayments_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `suspended_income_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `income_from_interest_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `income_from_penalties_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `income_from_fees_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `income_from_recovery_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `losses_written_off_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `interest_written_off_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `decimals` int DEFAULT NULL,
  `instalment_multiple_of` int DEFAULT '1',
  `minimum_principal` decimal(65,6) NOT NULL,
  `default_principal` decimal(65,6) NOT NULL,
  `maximum_principal` decimal(65,6) NOT NULL,
  `minimum_loan_term` int NOT NULL,
  `default_loan_term` int NOT NULL,
  `maximum_loan_term` int NOT NULL,
  `repayment_frequency` int NOT NULL,
  `repayment_frequency_type` enum('days','weeks','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum_interest_rate` decimal(65,6) NOT NULL,
  `default_interest_rate` decimal(65,6) NOT NULL,
  `maximum_interest_rate` decimal(65,6) NOT NULL,
  `interest_rate_type` enum('day','week','month','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_balloon_payments` tinyint NOT NULL DEFAULT '0',
  `allow_schedule_adjustments` tinyint NOT NULL DEFAULT '0',
  `grace_on_principal_paid` int NOT NULL DEFAULT '0',
  `grace_on_interest_paid` int NOT NULL DEFAULT '0',
  `grace_on_interest_charged` int NOT NULL DEFAULT '0',
  `allow_custom_grace_period` tinyint NOT NULL DEFAULT '0',
  `allow_topup` tinyint NOT NULL DEFAULT '0',
  `interest_methodology` enum('flat','declining_balance') COLLATE utf8mb4_unicode_ci NOT NULL,
  `interest_recalculation` tinyint NOT NULL DEFAULT '0',
  `amortization_method` enum('equal_installments','equal_principal_payments') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interest_calculation_period_type` enum('daily','same') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `days_in_year` enum('actual','360','365','364') COLLATE utf8mb4_unicode_ci DEFAULT 'actual',
  `days_in_month` enum('actual','30','31') COLLATE utf8mb4_unicode_ci DEFAULT 'actual',
  `include_in_loan_cycle` tinyint NOT NULL DEFAULT '0',
  `lock_guarantee_funds` tinyint NOT NULL DEFAULT '0',
  `auto_allocate_overpayments` tinyint NOT NULL DEFAULT '0',
  `allow_additional_charges` tinyint NOT NULL DEFAULT '0',
  `auto_disburse` tinyint NOT NULL DEFAULT '0',
  `require_linked_savings_account` tinyint NOT NULL DEFAULT '0',
  `min_amount` decimal(65,6) DEFAULT NULL,
  `max_amount` decimal(65,6) DEFAULT NULL,
  `accounting_rule` enum('none','cash','accrual_periodic','accrual_upfront') COLLATE utf8mb4_unicode_ci DEFAULT 'none',
  `npa_overdue_days` int NOT NULL DEFAULT '0',
  `npa_suspend_accrued_income` tinyint NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_products`
--

LOCK TABLES `loan_products` WRITE;
/*!40000 ALTER TABLE `loan_products` DISABLE KEYS */;
INSERT INTO `loan_products` VALUES (1,1,1,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Test','test','Test',0,1,500.000000,1000000.000000,2000000.000000,1,6,10,1,'months',5.000000,20.000000,24.000000,'year',0,0,0,0,0,0,0,'flat',0,'equal_installments',NULL,'actual','actual',0,0,0,0,0,0,NULL,NULL,'none',0,0,1,'2020-09-22 14:04:21','2020-09-22 14:04:21'),(2,1,1,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Good Product','good','gggg',0,1,500.000000,1000.000000,5000.000000,1,5,10,1,'months',5.000000,10.000000,20.000000,'year',0,0,0,0,0,0,0,'declining_balance',0,'equal_installments',NULL,'actual','actual',0,0,0,0,0,0,NULL,NULL,'none',0,0,1,'2020-11-30 13:58:39','2020-11-30 13:58:39'),(3,1,1,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Tesf b','test','fff',0,1,500.000000,1000.000000,5000.000000,1,5,10,1,'months',5.000000,10.000000,20.000000,'month',0,0,0,0,0,0,0,'declining_balance',0,'equal_installments',NULL,'actual','actual',0,0,0,0,0,0,NULL,NULL,'none',0,0,1,'2020-11-30 14:40:07','2020-11-30 14:40:07');
/*!40000 ALTER TABLE `loan_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_purposes`
--

DROP TABLE IF EXISTS `loan_purposes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_purposes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_purposes`
--

LOCK TABLES `loan_purposes` WRITE;
/*!40000 ALTER TABLE `loan_purposes` DISABLE KEYS */;
INSERT INTO `loan_purposes` VALUES (1,'Agriculture'),(2,'Capital');
/*!40000 ALTER TABLE `loan_purposes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_repayment_schedules`
--

DROP TABLE IF EXISTS `loan_repayment_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_repayment_schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `loan_id` bigint unsigned DEFAULT NULL,
  `paid_by_date` date DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `due_date` date NOT NULL,
  `installment` int DEFAULT NULL,
  `principal` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `principal_repaid_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `principal_written_off_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `interest` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `interest_repaid_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `interest_written_off_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `interest_waived_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `fees` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `fees_repaid_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `fees_written_off_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `fees_waived_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `penalties` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `penalties_repaid_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `penalties_written_off_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `penalties_waived_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `total_due` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_repayment_schedules_loan_id_index` (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_repayment_schedules`
--

LOCK TABLES `loan_repayment_schedules` WRITE;
/*!40000 ALTER TABLE `loan_repayment_schedules` DISABLE KEYS */;
INSERT INTO `loan_repayment_schedules` VALUES (7,1,2,NULL,'2020-12-02','2021-01-02',1,166667.000000,0.000000,0.000000,16667.000000,60.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,183274.000000,'01','2021','2020-12-02 16:11:09','2020-12-03 10:11:24'),(8,1,2,NULL,'2021-01-03','2021-02-02',2,166667.000000,0.000000,0.000000,16667.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,183334.000000,'02','2021','2020-12-02 16:11:09','2020-12-03 10:11:24'),(9,1,2,NULL,'2021-02-03','2021-03-02',3,166667.000000,0.000000,0.000000,16667.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,183334.000000,'03','2021','2020-12-02 16:11:09','2020-12-03 10:11:24'),(10,1,2,NULL,'2021-03-03','2021-04-02',4,166667.000000,0.000000,0.000000,16667.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,183334.000000,'04','2021','2020-12-02 16:11:09','2020-12-03 10:11:24'),(11,1,2,NULL,'2021-04-03','2021-05-02',5,166667.000000,0.000000,0.000000,16667.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,183334.000000,'05','2021','2020-12-02 16:11:09','2020-12-03 10:11:24'),(12,1,2,NULL,'2021-05-03','2021-06-02',6,166665.000000,0.000000,0.000000,16667.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,183332.000000,'06','2021','2020-12-02 16:11:09','2020-12-03 10:11:24'),(23,1,3,NULL,'2020-12-10','2021-01-29',1,197.000000,0.000000,0.000000,8.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,205.000000,'01','2021','2020-12-10 09:12:10','2020-12-10 09:12:10'),(24,1,3,NULL,'2021-01-30','2021-02-28',2,198.000000,0.000000,0.000000,7.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,205.000000,'02','2021','2020-12-10 09:12:10','2020-12-10 09:12:10'),(25,1,3,NULL,'2021-03-01','2021-03-28',3,200.000000,0.000000,0.000000,5.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,205.000000,'03','2021','2020-12-10 09:12:10','2020-12-10 09:12:10'),(26,1,3,NULL,'2021-03-29','2021-04-28',4,202.000000,0.000000,0.000000,3.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,205.000000,'04','2021','2020-12-10 09:12:10','2020-12-10 09:12:10'),(27,1,3,NULL,'2021-04-29','2021-05-28',5,203.000000,0.000000,0.000000,2.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,205.000000,'05','2021','2020-12-10 09:12:10','2020-12-10 09:12:10'),(28,1,1,NULL,'2020-09-22','2020-10-22',1,166667.000000,0.000000,0.000000,16667.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,183334.000000,'10','2020','2020-12-21 08:55:59','2020-12-21 08:55:59'),(29,1,1,NULL,'2020-10-23','2020-11-22',2,166667.000000,0.000000,0.000000,16667.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,183334.000000,'11','2020','2020-12-21 08:55:59','2020-12-21 08:55:59'),(30,1,1,NULL,'2020-11-23','2020-12-22',3,166667.000000,0.000000,0.000000,16667.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,183334.000000,'12','2020','2020-12-21 08:55:59','2020-12-21 08:55:59'),(31,1,1,NULL,'2020-12-23','2021-01-22',4,166667.000000,0.000000,0.000000,16667.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,183334.000000,'01','2021','2020-12-21 08:55:59','2020-12-21 08:55:59'),(32,1,1,NULL,'2021-01-23','2021-02-22',5,166667.000000,0.000000,0.000000,16667.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,183334.000000,'02','2021','2020-12-21 08:55:59','2020-12-21 08:55:59'),(33,1,1,NULL,'2021-02-23','2021-03-22',6,166665.000000,0.000000,0.000000,16667.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,183332.000000,'03','2021','2020-12-21 08:55:59','2020-12-21 08:55:59');
/*!40000 ALTER TABLE `loan_repayment_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_transaction_processing_strategies`
--

DROP TABLE IF EXISTS `loan_transaction_processing_strategies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_transaction_processing_strategies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `translated_name` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_transaction_processing_strategies`
--

LOCK TABLES `loan_transaction_processing_strategies` WRITE;
/*!40000 ALTER TABLE `loan_transaction_processing_strategies` DISABLE KEYS */;
INSERT INTO `loan_transaction_processing_strategies` VALUES (1,'Penalties, Fees, Interest, Principal order','Penalties, Fees, Interest, Principal order',1),(2,'Principal, Interest, Penalties, Fees Order','Principal, Interest, Penalties, Fees Order',1),(3,'Interest, Principal, Penalties, Fees Order','Interest, Principal, Penalties, Fees Order',1);
/*!40000 ALTER TABLE `loan_transaction_processing_strategies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_transaction_types`
--

DROP TABLE IF EXISTS `loan_transaction_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_transaction_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `translated_name` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_transaction_types`
--

LOCK TABLES `loan_transaction_types` WRITE;
/*!40000 ALTER TABLE `loan_transaction_types` DISABLE KEYS */;
INSERT INTO `loan_transaction_types` VALUES (1,'Disbursement','Disbursement',1),(2,'Repayment','Repayment',1),(3,'Contra','Contra',1),(4,'Waive Interest','Waive Interest',1),(5,'Repayment At Disbursement','Repayment At Disbursement',1),(6,'Write Off','Write Off',1),(7,'Marked for Rescheduling','Marked for Rescheduling',1),(8,'Recovery Repayment','Recovery Repayment',1),(9,'Waive Charges','Waive Charges',1),(10,'Apply Charges','Apply Charges',1),(11,'Apply Interest','Apply Interest',1);
/*!40000 ALTER TABLE `loan_transaction_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_transactions`
--

DROP TABLE IF EXISTS `loan_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint unsigned NOT NULL,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `payment_detail_id` bigint unsigned DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `amount` decimal(65,6) NOT NULL,
  `credit` decimal(65,6) DEFAULT NULL,
  `debit` decimal(65,6) DEFAULT NULL,
  `principal_repaid_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `interest_repaid_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `fees_repaid_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `penalties_repaid_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `loan_transaction_type_id` bigint unsigned NOT NULL,
  `reversed` tinyint NOT NULL DEFAULT '0',
  `reversible` tinyint NOT NULL DEFAULT '0',
  `submitted_on` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `status` enum('pending','approved','declined') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `payment_gateway_data` text COLLATE utf8mb4_unicode_ci,
  `online_transaction` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_transactions_loan_id_index` (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_transactions`
--

LOCK TABLES `loan_transactions` WRITE;
/*!40000 ALTER TABLE `loan_transactions` DISABLE KEYS */;
INSERT INTO `loan_transactions` VALUES (3,2,1,1,8,'Disbursement',1000000.000000,NULL,1000000.000000,0.000000,0.000000,0.000000,0.000000,1,0,0,'2020-12-02',NULL,'2020-12-02',NULL,NULL,NULL,NULL,NULL,0,'2020-12-02 16:11:09','2020-12-02 16:11:09'),(4,2,1,1,NULL,'Interest Applied',100002.000000,NULL,100002.000000,0.000000,0.000000,0.000000,0.000000,11,0,0,'2020-12-02',NULL,'2020-12-02',NULL,NULL,NULL,NULL,NULL,0,'2020-12-02 16:11:09','2020-12-02 16:11:09'),(5,2,1,NULL,9,'Repayment',60.000000,60.000000,NULL,0.000000,60.000000,0.000000,0.000000,2,0,0,'2020-12-03',NULL,'2020-12-03',NULL,NULL,NULL,NULL,NULL,0,'2020-12-03 09:59:34','2020-12-03 10:11:24'),(10,3,1,1,15,'Disbursement',1000.000000,NULL,1000.000000,0.000000,0.000000,0.000000,0.000000,1,0,0,'2020-12-10',NULL,'2020-12-10',NULL,NULL,NULL,NULL,NULL,0,'2020-12-10 09:12:10','2020-12-10 09:12:10'),(11,3,1,1,NULL,'Interest Applied',25.000000,NULL,25.000000,0.000000,0.000000,0.000000,0.000000,11,0,0,'2020-12-10',NULL,'2020-12-10',NULL,NULL,NULL,NULL,NULL,0,'2020-12-10 09:12:10','2020-12-10 09:12:10'),(12,1,1,1,16,'Disbursement',1000000.000000,NULL,1000000.000000,0.000000,0.000000,0.000000,0.000000,1,0,0,'2020-09-22',NULL,'2020-12-21',NULL,NULL,NULL,NULL,NULL,0,'2020-12-21 08:55:59','2020-12-21 08:55:59'),(13,1,1,1,NULL,'Interest Applied',100002.000000,NULL,100002.000000,0.000000,0.000000,0.000000,0.000000,11,0,0,'2020-09-22',NULL,'2020-12-21',NULL,NULL,NULL,NULL,NULL,0,'2020-12-21 08:55:59','2020-12-21 08:55:59');
/*!40000 ALTER TABLE `loan_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `client_type` enum('client','group') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'client',
  `client_id` bigint unsigned DEFAULT NULL,
  `group_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `loan_product_id` bigint unsigned NOT NULL,
  `loan_transaction_processing_strategy_id` bigint unsigned NOT NULL,
  `fund_id` bigint unsigned NOT NULL,
  `loan_purpose_id` bigint unsigned NOT NULL,
  `loan_officer_id` bigint unsigned NOT NULL,
  `linked_savings_id` bigint unsigned DEFAULT NULL,
  `loan_disbursement_channel_id` bigint unsigned DEFAULT NULL,
  `submitted_on_date` date DEFAULT NULL,
  `submitted_by_user_id` bigint unsigned DEFAULT NULL,
  `approved_on_date` date DEFAULT NULL,
  `approved_by_user_id` bigint unsigned DEFAULT NULL,
  `approved_notes` text COLLATE utf8mb4_unicode_ci,
  `expected_disbursement_date` date DEFAULT NULL,
  `expected_first_payment_date` date DEFAULT NULL,
  `first_payment_date` date DEFAULT NULL,
  `expected_maturity_date` date DEFAULT NULL,
  `disbursed_on_date` date DEFAULT NULL,
  `disbursed_by_user_id` bigint unsigned DEFAULT NULL,
  `disbursed_notes` text COLLATE utf8mb4_unicode_ci,
  `rejected_on_date` date DEFAULT NULL,
  `rejected_by_user_id` bigint unsigned DEFAULT NULL,
  `rejected_notes` text COLLATE utf8mb4_unicode_ci,
  `written_off_on_date` date DEFAULT NULL,
  `written_off_by_user_id` bigint unsigned DEFAULT NULL,
  `written_off_notes` text COLLATE utf8mb4_unicode_ci,
  `closed_on_date` date DEFAULT NULL,
  `closed_by_user_id` bigint unsigned DEFAULT NULL,
  `closed_notes` text COLLATE utf8mb4_unicode_ci,
  `rescheduled_on_date` date DEFAULT NULL,
  `rescheduled_by_user_id` bigint unsigned DEFAULT NULL,
  `rescheduled_notes` text COLLATE utf8mb4_unicode_ci,
  `withdrawn_on_date` date DEFAULT NULL,
  `withdrawn_by_user_id` bigint unsigned DEFAULT NULL,
  `withdrawn_notes` text COLLATE utf8mb4_unicode_ci,
  `external_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `principal` decimal(65,6) NOT NULL,
  `applied_amount` decimal(65,6) DEFAULT NULL,
  `approved_amount` decimal(65,6) DEFAULT NULL,
  `interest_rate` decimal(65,6) NOT NULL,
  `decimals` int DEFAULT NULL,
  `instalment_multiple_of` int DEFAULT '1',
  `loan_term` int NOT NULL,
  `repayment_frequency` int NOT NULL,
  `repayment_frequency_type` enum('days','weeks','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `interest_rate_type` enum('day','week','month','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_balloon_payments` tinyint NOT NULL DEFAULT '0',
  `allow_schedule_adjustments` tinyint NOT NULL DEFAULT '0',
  `grace_on_principal_paid` int NOT NULL DEFAULT '0',
  `grace_on_interest_paid` int NOT NULL DEFAULT '0',
  `grace_on_interest_charged` int NOT NULL DEFAULT '0',
  `allow_custom_grace_period` tinyint NOT NULL DEFAULT '0',
  `allow_topup` tinyint NOT NULL DEFAULT '0',
  `interest_methodology` enum('flat','declining_balance') COLLATE utf8mb4_unicode_ci NOT NULL,
  `interest_recalculation` tinyint NOT NULL DEFAULT '0',
  `amortization_method` enum('equal_installments','equal_principal_payments') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interest_calculation_period_type` enum('daily','same') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `days_in_year` enum('actual','360','365','364') COLLATE utf8mb4_unicode_ci DEFAULT 'actual',
  `days_in_month` enum('actual','30','31') COLLATE utf8mb4_unicode_ci DEFAULT 'actual',
  `include_in_loan_cycle` tinyint NOT NULL DEFAULT '0',
  `lock_guarantee_funds` tinyint NOT NULL DEFAULT '0',
  `auto_allocate_overpayments` tinyint NOT NULL DEFAULT '0',
  `allow_additional_charges` tinyint NOT NULL DEFAULT '0',
  `auto_disburse` tinyint NOT NULL DEFAULT '0',
  `status` enum('pending','approved','active','withdrawn','rejected','closed','rescheduled','written_off','overpaid','submitted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'submitted',
  `disbursement_charges` decimal(65,6) DEFAULT NULL,
  `principal_disbursed_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `principal_repaid_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `principal_written_off_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `principal_outstanding_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `interest_disbursed_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `interest_repaid_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `interest_written_off_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `interest_waived_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `interest_outstanding_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `fees_disbursed_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `fees_repaid_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `fees_written_off_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `fees_waived_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `fees_outstanding_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `penalties_disbursed_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `penalties_repaid_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `penalties_written_off_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `penalties_waived_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `penalties_outstanding_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `total_disbursed_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `total_repaid_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `total_written_off_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `total_waived_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `total_outstanding_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loans_external_id_unique` (`external_id`),
  UNIQUE KEY `loans_account_number_unique` (`account_number`),
  KEY `loans_client_id_index` (`client_id`),
  KEY `loans_loan_officer_id_index` (`loan_officer_id`),
  KEY `loans_loan_product_id_index` (`loan_product_id`),
  KEY `loans_branch_id_index` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (1,1,'client',1,NULL,1,1,1,1,1,1,1,NULL,NULL,'2020-09-22',1,'2020-09-22',1,NULL,'2020-09-22','2020-10-22','2020-10-22','2021-04-22','2020-09-22',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1000000.000000,1000000.000000,1000000.000000,20.000000,NULL,1,6,1,'months','year',0,0,0,0,0,0,0,'flat',0,'equal_installments',NULL,'actual','actual',0,0,0,0,0,'active',0.000000,1000000.000000,0.000000,0.000000,0.000000,100002.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,'2020-09-22 14:06:02','2020-12-21 08:55:59'),(2,1,'client',2,NULL,1,1,1,1,1,1,1,NULL,NULL,'2020-12-02',1,'2020-12-02',1,'cc ff','2020-12-02','2021-01-02','2021-01-02','2021-07-02','2020-12-02',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1000000.000000,1000000.000000,1000000.000000,20.000000,NULL,1,6,1,'months','year',0,0,0,0,0,0,0,'flat',0,'equal_installments',NULL,'actual','actual',0,0,0,0,0,'active',0.000000,1000000.000000,0.000000,0.000000,0.000000,100002.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,'2020-12-02 12:19:06','2020-12-02 16:11:09'),(3,1,'client',1,NULL,1,1,2,1,1,1,1,NULL,NULL,'2020-12-10',1,'2020-12-10',1,NULL,'2020-12-10','2020-01-29','2021-01-29','2021-06-28','2020-12-10',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1000.000000,1000.000000,1000.000000,10.000000,NULL,1,5,1,'months','year',0,0,0,0,0,0,0,'declining_balance',0,'equal_installments',NULL,'actual','actual',0,0,0,0,0,'active',0.000000,1000.000000,0.000000,0.000000,0.000000,25.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,'2020-12-10 08:55:21','2020-12-10 09:12:10');
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `parent_slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `menu_order` int DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (65,NULL,NULL,'',1,'Activity Logs',NULL,'activity_log',NULL,60,'activity_log','activitylog.activity_logs.index','fa fa-database','Activitylog','2020-09-02 06:59:45','2020-09-02 06:59:45'),(89,NULL,NULL,'',1,'Dashboard',NULL,'dashboard',NULL,0,'dashboard','dashboard.index','fas fa-home','Dashboard','2020-12-16 10:07:59','2020-12-16 10:07:59'),(106,NULL,NULL,'',1,'Accounting',NULL,'accounting',NULL,3,'accounting','','fas fa-money-bill','Accounting','2020-12-16 10:14:53','2020-12-16 10:14:53'),(107,NULL,106,'accounting',0,'View Charts of Accounts',NULL,'view_charts_of_accounts',NULL,4,'accounting/chart_of_account','accounting.chart_of_accounts.index','far fa-circle','Accounting','2020-12-16 10:14:53','2020-12-16 10:14:53'),(108,NULL,106,'accounting',0,'Journal Entries',NULL,'journal_entries',NULL,5,'accounting/journal_entry','accounting.journal_entries.index','far fa-circle','Accounting','2020-12-16 10:14:53','2020-12-16 10:14:53'),(109,NULL,NULL,'',1,'Branches',NULL,'branches',NULL,6,'branch','','fas fa-building','Branch','2020-12-16 10:16:00','2020-12-16 10:16:00'),(110,NULL,109,'branches',0,'View Branches',NULL,'view_branches',NULL,7,'branch','branch.branches.index','far fa-circle','Branch','2020-12-16 10:16:00','2020-12-16 10:16:00'),(111,NULL,109,'branches',0,'Create Branch',NULL,'create_branch',NULL,8,'branch/create','branch.branches.create','far fa-circle','Branch','2020-12-16 10:16:00','2020-12-16 10:16:00'),(117,NULL,NULL,'',1,'Manage Modules',NULL,'modules',NULL,30,'module','core.modules.index','fas fa-plug','Core','2020-12-16 10:20:25','2020-12-16 10:20:25'),(118,NULL,NULL,'',1,'Manage Menu',NULL,'menu',NULL,31,'menu','core.menu.index','fas fa-bars','Core','2020-12-16 10:20:25','2020-12-16 10:20:25'),(119,NULL,79,'settings',0,'Payment Gateways',NULL,'menu',NULL,32,'settings/payment_gateway','core.payment_gateways.index','fas fa-money-bill','Core','2020-12-16 10:20:25','2020-12-16 10:20:25'),(120,NULL,NULL,'',1,'Themes',NULL,'themes',NULL,40,'theme','core.themes.index','fas fa-palette','Core','2020-12-16 10:20:25','2020-12-16 10:20:25'),(126,NULL,NULL,'',1,'Payroll',NULL,'payroll',NULL,10,'payroll','payroll.payroll.index','fab fa-paypal','Payroll','2020-12-16 10:22:53','2020-12-16 10:22:53'),(127,NULL,126,'payroll',0,'View Payroll',NULL,'view_payroll',NULL,11,'payroll','payroll.payroll.index','far fa-circle','Payroll','2020-12-16 10:22:53','2020-12-16 10:22:53'),(128,NULL,126,'payroll',0,'Create Payroll',NULL,'create_payroll',NULL,12,'payroll/create','payroll.payroll.create','far fa-circle','Payroll','2020-12-16 10:22:53','2020-12-16 10:22:53'),(129,NULL,126,'payroll',0,'Manage Payroll Items',NULL,'manage_payroll_items',NULL,12,'payroll/item','payroll.payroll.items.index','far fa-circle','Payroll','2020-12-16 10:22:53','2020-12-16 10:22:53'),(130,NULL,126,'payroll',0,'Manage Payroll Templates',NULL,'manage_payroll_templates',NULL,12,'payroll/template','payroll.payroll.templates.index','far fa-circle','Payroll','2020-12-16 10:22:53','2020-12-16 10:22:53'),(138,NULL,NULL,'',1,'Loans',NULL,'loans',NULL,18,'loan','','fas fa-money-bill','Loan','2020-12-16 10:26:27','2020-12-16 10:26:27'),(139,NULL,138,'loans',0,'View Loans',NULL,'view_loans',NULL,19,'loan','loan.loans.index','far fa-circle','Loan','2020-12-16 10:26:27','2020-12-16 10:26:27'),(140,NULL,138,'loans',0,'View Applications',NULL,'view_applications',NULL,20,'loan/application','loan.loans.index','far fa-circle','Loan','2020-12-16 10:26:27','2020-12-16 10:26:27'),(141,NULL,138,'loans',0,'Create Loan',NULL,'create_loan',NULL,21,'loan/create','loan.loans.create','far fa-circle','Loan','2020-12-16 10:26:27','2020-12-16 10:26:27'),(142,NULL,138,'loans',0,'Manage Products',NULL,'manage_products',NULL,22,'loan/product','loan.loans.products.index','far fa-circle','Loan','2020-12-16 10:26:27','2020-12-16 10:26:27'),(143,NULL,138,'loans',0,'Manage Charges',NULL,'manage_charges',NULL,23,'loan/charge','loan.loans.charges.index','far fa-circle','Loan','2020-12-16 10:26:27','2020-12-16 10:26:27'),(144,NULL,138,'loans',0,'Loan Calculator',NULL,'loan_calculator',NULL,24,'loan/calculator','loan.loans.index','far fa-circle','Loan','2020-12-16 10:26:27','2020-12-16 10:26:27'),(150,NULL,NULL,'',1,'Communication',NULL,'communication',NULL,13,'communication','','fas fa-envelope','Communication','2020-12-16 10:29:01','2020-12-16 10:29:01'),(151,NULL,150,'communication',0,'View Campaigns',NULL,'view_campaigns',NULL,14,'communication/campaign','communication.campaigns.index','far fa-circle','Communication','2020-12-16 10:29:01','2020-12-16 10:29:01'),(152,NULL,150,'communication',0,'Create Campaign',NULL,'create_campaign',NULL,15,'communication/campaign/create','communication.campaigns.create','far fa-circle','Communication','2020-12-16 10:29:01','2020-12-16 10:29:01'),(153,NULL,150,'communication',0,'View Logs',NULL,'view_logs',NULL,16,'communication/log','communication.logs.index','far fa-circle','Communication','2020-12-16 10:29:01','2020-12-16 10:29:01'),(154,NULL,150,'communication',0,'Manage SMS Gateways',NULL,'manage_sms_gateways',NULL,17,'communication/sms_gateway','communication.sms_gateways.index','far fa-circle','Communication','2020-12-16 10:29:01','2020-12-16 10:29:01'),(155,NULL,NULL,'',1,'Expenses',NULL,'expenses',NULL,20,'expense','expense.expenses.index','fas fa-share','Expense','2020-12-16 10:30:24','2020-12-16 10:30:24'),(156,NULL,155,'expenses',0,'View Expenses',NULL,'view_expenses',NULL,0,'expense','expense.expenses.index','far fa-circle','Expense','2020-12-16 10:30:24','2020-12-16 10:30:24'),(157,NULL,155,'expenses',0,'Create Expense',NULL,'create_expense',NULL,1,'expense/create','expense.expenses.create','far fa-circle','Expense','2020-12-16 10:30:24','2020-12-16 10:30:24'),(158,NULL,155,'expenses',0,'Manage Expense Types',NULL,'manage_expense_types',NULL,2,'expense/type','expense.expenses.types.index','far fa-circle','Expense','2020-12-16 10:30:24','2020-12-16 10:30:24'),(160,NULL,NULL,'report',1,'Reports',NULL,'reports',NULL,20,'report','reports.index','fas fa-chart-bar','Report','2020-12-16 10:32:37','2020-12-16 10:32:37'),(161,NULL,NULL,'',1,'Custom Fields',NULL,'custom_fields',NULL,25,'custom_field','','fas fa-list','CustomField','2020-12-16 10:34:09','2020-12-16 10:34:09'),(164,NULL,NULL,'',1,'Savings',NULL,'savings',NULL,25,'savings','','fas fa-university','Savings','2020-12-16 10:36:25','2020-12-16 10:36:25'),(165,NULL,164,'savings',0,'View Savings',NULL,'view_savings',NULL,26,'savings','savings.savings.index','far fa-circle','Savings','2020-12-16 10:36:25','2020-12-16 10:36:25'),(166,NULL,164,'savings',0,'Create Savings',NULL,'create_savings',NULL,27,'savings/create','savings.savings.create','far fa-circle','Savings','2020-12-16 10:36:25','2020-12-16 10:36:25'),(167,NULL,164,'savings',0,'Manage Products',NULL,'manage_products',NULL,28,'savings/product','savings.savings.products.index','far fa-circle','Savings','2020-12-16 10:36:25','2020-12-16 10:36:25'),(168,NULL,164,'savings',0,'Manage Charges',NULL,'manage_charges',NULL,29,'savings/charge','savings.savings.charges.index','far fa-circle','Savings','2020-12-16 10:36:25','2020-12-16 10:36:25'),(169,NULL,NULL,'',1,'Income',NULL,'income',NULL,25,'income','income.income.index','fas fa-money-bill','Income','2020-12-16 10:38:36','2020-12-16 10:38:36'),(170,NULL,169,'income',0,'View Income',NULL,'view_assets',NULL,7,'income','income.income.index','far fa-circle','Income','2020-12-16 10:38:36','2020-12-16 10:38:36'),(171,NULL,169,'income',0,'Create Income',NULL,'create_asset',NULL,8,'income/create','income.income.create','far fa-circle','Income','2020-12-16 10:38:36','2020-12-16 10:38:36'),(172,NULL,169,'income',0,'Manage Income Types',NULL,'manage_asset_types',NULL,9,'income/type','income.income.types.index','far fa-circle','Income','2020-12-16 10:38:36','2020-12-16 10:38:36'),(182,NULL,NULL,'',1,'Shares',NULL,'shares',NULL,30,'share','share.shares.index','fas fa-database','Share','2020-12-16 10:43:29','2020-12-16 10:43:29'),(183,NULL,182,'shares',0,'View Shares',NULL,'view_shares',NULL,1,'share','share.shares.index','far fa-circle','Share','2020-12-16 10:43:29','2020-12-16 10:43:29'),(184,NULL,182,'shares',0,'Create Share',NULL,'create_share',NULL,2,'share/create','share.shares.create','far fa-circle','Share','2020-12-16 10:43:29','2020-12-16 10:43:29'),(185,NULL,182,'shares',0,'Manage Products',NULL,'manage_share_products',NULL,3,'share/product','share.shares.products.index','far fa-circle','Share','2020-12-16 10:43:29','2020-12-16 10:43:29'),(186,NULL,182,'shares',0,'Manage Charges',NULL,'manage_share_charges',NULL,3,'share/charge','share.shares.charges.index','far fa-circle','Share','2020-12-16 10:43:29','2020-12-16 10:43:29'),(187,NULL,NULL,'',1,'Settings',NULL,'settings',NULL,31,'setting','setting.setting.index','fas fa-cogs','Setting','2020-12-16 10:44:59','2020-12-16 10:44:59'),(188,NULL,187,'settings',0,'Organisation Settings',NULL,'organisation_settings',NULL,32,'setting/organisation','setting.setting.index','far fa-circle','Setting','2020-12-16 10:44:59','2020-12-16 10:44:59'),(189,NULL,187,'settings',0,'General Settings',NULL,'general_settings',NULL,33,'setting/general','setting.setting.index','far fa-circle','Setting','2020-12-16 10:44:59','2020-12-16 10:44:59'),(190,NULL,187,'settings',0,'Email Settings',NULL,'email_settings',NULL,34,'setting/email','setting.setting.index','far fa-circle','Setting','2020-12-16 10:44:59','2020-12-16 10:44:59'),(191,NULL,187,'settings',0,'SMS Settings',NULL,'sms_settings',NULL,35,'setting/sms','setting.setting.index','far fa-circle','Setting','2020-12-16 10:44:59','2020-12-16 10:44:59'),(192,NULL,187,'settings',0,'System Settings',NULL,'system_settings',NULL,36,'setting/system','setting.setting.index','far fa-circle','Setting','2020-12-16 10:44:59','2020-12-16 10:44:59'),(193,NULL,187,'settings',0,'System Update',NULL,'system_update',NULL,37,'setting/system_update','setting.setting.index','far fa-circle','Setting','2020-12-16 10:44:59','2020-12-16 10:44:59'),(194,NULL,187,'settings',0,'Other Settings',NULL,'other_settings',NULL,38,'setting/other','setting.setting.index','far fa-circle','Setting','2020-12-16 10:44:59','2020-12-16 10:44:59'),(195,NULL,NULL,'',1,'Assets',NULL,'assets',NULL,30,'asset','asset.assets.index','fas fa-building','Asset','2020-12-16 10:46:22','2020-12-16 10:46:22'),(196,NULL,195,'assets',0,'View Assets',NULL,'view_assets',NULL,7,'asset','asset.assets.index','far fa-circle','Asset','2020-12-16 10:46:22','2020-12-16 10:46:22'),(197,NULL,195,'assets',0,'Create Asset',NULL,'create_asset',NULL,8,'asset/create','asset.assets.create','far fa-circle','Asset','2020-12-16 10:46:22','2020-12-16 10:46:22'),(198,NULL,195,'assets',0,'Manage Asset Types',NULL,'manage_asset_types',NULL,9,'asset/type','asset.assets.types.index','far fa-circle','Asset','2020-12-16 10:46:22','2020-12-16 10:46:22'),(199,NULL,NULL,'',1,'Clients',NULL,'clients',NULL,10,'client','','fas fa-users','Client','2020-12-17 08:03:47','2020-12-17 08:03:47'),(200,NULL,199,'clients',0,'View Clients',NULL,'view_clients',NULL,11,'client','client.clients.index','far fa-circle','Client','2020-12-17 08:03:47','2020-12-17 08:03:47'),(201,NULL,199,'clients',0,'Create Client',NULL,'create_client',NULL,12,'client/create','client.clients.create','far fa-circle','Client','2020-12-17 08:03:47','2020-12-17 08:03:47'),(202,NULL,NULL,'',1,'Users',NULL,'users',NULL,27,'user','','fas fa-users','User','2021-01-15 11:25:39','2021-01-15 11:25:39'),(203,NULL,202,'users',0,'View Users',NULL,'view_loans',NULL,28,'user','user.users.index','far fa-circle','User','2021-01-15 11:25:39','2021-01-15 11:25:39'),(204,NULL,202,'users',0,'Create User',NULL,'create_loan',NULL,29,'user/create','user.users.create','far fa-circle','User','2021-01-15 11:25:39','2021-01-15 11:25:39'),(205,NULL,202,'users',0,'Manage Roles',NULL,'manage_roles',NULL,30,'user/role','user.roles.index','far fa-circle','User','2021-01-15 11:25:39','2021-01-15 11:25:39');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1075 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (955,'2019_07_06_133107_create_settings_table',1),(956,'2018_08_08_100000_create_telescope_entries_table',2),(957,'2019_07_06_135714_create_countries_table',2),(958,'2019_07_06_140045_create_currencies_table',2),(959,'2019_07_06_140908_create_timezones_table',2),(960,'2019_07_07_110645_create_payment_types_table',2),(961,'2019_07_07_110717_create_payment_details_table',2),(962,'2019_07_10_225923_create_notifications_table',2),(963,'2019_07_27_080313_create_jobs_table',2),(964,'2019_09_07_001758_create_menus_table',2),(965,'2019_11_04_152950_create_tax_rates_table',2),(966,'2020_01_14_114056_create_failed_jobs_table',2),(967,'2014_10_12_000000_create_users_table',3),(968,'2014_10_12_100000_create_password_resets_table',3),(969,'2019_07_01_214429_create_permission_tables',3),(970,'2019_08_03_085238_create_widgets_table',4),(971,'2019_07_06_111125_create_branches_table',5),(972,'2019_07_06_111419_create_branch_users_table',5),(973,'2019_07_07_093258_create_chart_of_accounts_table',6),(974,'2019_07_07_093648_create_journal_entries_table',6),(975,'2019_09_26_153830_create_asset_types_table',7),(976,'2019_09_26_153906_create_assets_table',7),(977,'2019_09_26_153953_create_asset_notes_table',7),(978,'2019_09_26_153954_create_asset_maintenance_types_table',7),(979,'2019_09_26_154012_create_asset_maintenance_table',7),(980,'2019_09_26_154050_create_asset_files_table',7),(981,'2019_09_26_154103_create_asset_pictures_table',7),(982,'2019_09_27_063335_create_asset_depreciation_table',7),(983,'2019_07_08_130052_create_titles_table',8),(984,'2019_07_08_130053_create_client_relationships_table',8),(985,'2019_07_08_130533_create_professions_table',8),(986,'2019_07_08_150347_create_client_types_table',8),(987,'2019_07_08_151636_create_client_identification_types_table',8),(988,'2019_07_08_182818_create_clients_table',8),(989,'2019_07_08_182911_create_client_files_table',8),(990,'2019_07_08_182938_create_client_identification_table',8),(991,'2019_07_08_183031_create_client_next_of_kin_table',8),(992,'2019_07_11_180428_create_client_users_table',8),(993,'2019_08_05_093954_create_savings_charge_options_table',9),(994,'2019_08_05_094221_create_savings_charge_types_table',9),(995,'2019_08_05_094458_create_savings_charges_table',9),(996,'2019_08_05_094544_create_savings_transaction_types_table',9),(997,'2019_08_05_094956_create_savings_products_table',9),(998,'2019_08_05_095030_create_savings_table',9),(999,'2019_08_05_095031_create_savings_linked_charges_table',9),(1000,'2019_08_05_095048_create_savings_transactions_table',9),(1001,'2019_08_05_095148_create_savings_product_linked_charges_table',9),(1002,'2019_07_15_094401_create_loan_transaction_processing_strategies_table',10),(1003,'2019_07_15_100526_create_loan_charge_types_table',10),(1004,'2019_07_15_100649_create_loan_charge_options_table',10),(1005,'2019_07_15_104331_create_loan_credit_checks_table',10),(1006,'2019_07_15_141230_create_loan_purposes_table',10),(1007,'2019_07_15_201056_create_loan_transaction_types_table',10),(1008,'2019_07_15_214326_create_funds_table',10),(1009,'2019_07_15_214410_create_loan_charges_table',10),(1010,'2019_07_15_214940_create_loan_products_table',10),(1011,'2019_07_15_215017_create_loan_product_linked_charges_table',10),(1012,'2019_07_15_215107_create_loan_disbursement_channels_table',10),(1013,'2019_07_15_215314_create_loan_collateral_types_table',10),(1014,'2019_07_15_215355_create_loans_table',10),(1015,'2019_07_15_215451_create_loan_collateral_table',10),(1016,'2019_07_15_215546_create_loan_repayment_schedules_table',10),(1017,'2019_07_15_215604_create_loan_transactions_table',10),(1018,'2019_07_15_221258_create_loan_linked_charges_table',10),(1019,'2019_07_17_130522_create_loan_product_linked_credit_checks_table',10),(1020,'2019_07_17_130536_create_loan_linked_credit_checks_table',10),(1021,'2019_07_17_162121_create_loan_guarantors_table',10),(1022,'2019_07_17_194223_create_loan_officer_history_table',10),(1023,'2019_07_17_194247_create_loan_history_table',10),(1024,'2019_07_17_194817_create_loan_files_table',10),(1025,'2019_07_17_194827_create_loan_notes_table',10),(1026,'2019_08_30_074012_create_loan_applications_table',10),(1027,'2019_07_27_161835_create_communication_campaign_business_rules_table',11),(1028,'2019_07_27_161902_create_communication_campaign_attachment_types_table',11),(1029,'2019_07_28_150020_create_sms_gateways_table',11),(1030,'2019_07_28_150053_create_communication_campaigns_table',11),(1031,'2019_07_28_161940_create_communication_campaign_logs_table',11),(1032,'2016_06_01_000001_create_oauth_auth_codes_table',12),(1033,'2016_06_01_000002_create_oauth_access_tokens_table',12),(1034,'2016_06_01_000003_create_oauth_refresh_tokens_table',12),(1035,'2016_06_01_000004_create_oauth_clients_table',12),(1036,'2016_06_01_000005_create_oauth_personal_access_clients_table',12),(1037,'2019_09_22_080345_create_payroll_items_table',13),(1038,'2019_09_22_081303_create_payroll_templates_table',13),(1039,'2019_09_22_081304_create_payroll_template_items_table',13),(1040,'2019_09_22_081326_create_payroll_table',13),(1041,'2019_09_22_081441_create_payroll_items_meta_table',13),(1042,'2019_09_22_082657_create_payroll_payments_table',13),(1043,'2019_09_15_164302_create_custom_fields_table',14),(1044,'2019_09_15_164434_create_custom_fields_meta_table',14),(1045,'2020_02_24_114006_create_expense_types_table',15),(1046,'2020_02_24_114018_create_expenses_table',15),(1047,'2020_02_24_114052_create_income_types_table',16),(1048,'2020_02_24_114104_create_income_table',16),(1049,'2019_07_15_125704_create_activity_log_table',17),(1050,'2020_08_31_141646_create_wallets_table',18),(1051,'2020_08_31_150716_create_wallet_transactions_table',18),(1065,'2020_09_10_171351_create_share_charge_options_table',19),(1066,'2020_09_10_171936_create_share_transaction_types_table',19),(1067,'2020_09_10_171940_create_share_charge_types_table',19),(1068,'2020_09_10_171940_create_share_charges_table',19),(1069,'2020_09_10_171959_create_share_products_table',19),(1070,'2020_09_10_172033_create_share_product_linked_charges_table',19),(1071,'2020_09_10_172054_create_shares_table',19),(1072,'2020_09_10_172110_create_share_linked_charges_table',19),(1073,'2020_09_10_172120_create_share_transactions_table',19),(1074,'2020_09_10_172155_create_share_market_periods_table',19);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` int unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` int unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'Modules\\User\\Entities\\User',1),(2,'Modules\\User\\Entities\\User',2),(1,'Modules\\User\\Entities\\User',3),(2,'Modules\\User\\Entities\\User',7);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('20a72c3f-590f-4c35-a038-7e4860bf33ce','Modules\\User\\Notifications\\DemoNotification','Modules\\User\\Entities\\User',1,'{\"url\":\"http:\\/\\/loan.local\\/user\\/profile\",\"message\":\"Sample notification\"}','2020-12-14 14:35:44','2020-10-15 16:54:53','2020-12-14 14:35:44'),('a5d5aec4-f1d0-4f38-85d7-f5942a6d4843','Modules\\User\\Notifications\\DemoNotification','Modules\\User\\Entities\\User',1,'{\"url\":\"http:\\/\\/loan.local\\/user\\/profile\",\"message\":\"Sample notification\"}','2020-12-16 07:18:04','2020-10-15 16:55:11','2020-12-16 07:18:04'),('ff641911-2c54-4dd5-a947-dde7a2255d6b','Modules\\User\\Notifications\\DemoNotification','Modules\\User\\Entities\\User',1,'{\"url\":\"http:\\/\\/loan.local\\/user\\/profile\",\"message\":\"Sample notification\"}','2020-12-09 09:21:22','2020-10-15 16:55:07','2020-12-09 09:21:22');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `client_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `client_id` int unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int DEFAULT NULL,
  `payment_type_id` int DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` int DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routing_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
INSERT INTO `payment_details` VALUES (1,1,1,'loan_transaction',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-22 14:06:16','2020-09-22 14:06:16'),(2,1,1,'journal_manual_entry',NULL,NULL,'ff','ff','ff','ff',NULL,'2020-10-20 12:22:54','2020-10-20 12:22:54'),(3,1,NULL,'expense',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-10-22 16:56:55','2020-10-22 16:56:55'),(4,1,NULL,'expense',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-10-22 16:57:14','2020-10-22 16:57:14'),(5,1,NULL,'income',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-10-23 08:08:29','2020-10-23 08:08:29'),(6,1,NULL,'income',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-10-23 08:12:43','2020-10-23 08:12:43'),(7,1,1,'payroll_transaction',NULL,'dd','fd','dd','dffd','ff','ff ff','2020-11-27 08:35:07','2020-11-27 08:42:16'),(8,1,1,'loan_transaction',NULL,'ddd',NULL,'dd',NULL,NULL,NULL,'2020-12-02 16:11:09','2020-12-02 16:11:09'),(9,1,1,'loan_transaction',NULL,'gg','e44','23','ggg5f','ggf','jj','2020-12-03 09:59:34','2020-12-03 10:11:24'),(10,1,1,'wallet_transaction',NULL,'ff','dad','sd ff','dd','cc','dss dd','2020-12-04 18:16:07','2020-12-04 18:20:06'),(11,1,1,'savings_transaction',NULL,'ff',NULL,'ff',NULL,'ggg',NULL,'2020-12-06 18:09:38','2020-12-06 18:10:56'),(12,1,1,'savings_transaction',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-06 18:13:21','2020-12-06 18:13:21'),(13,1,1,'loan_transaction',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-10 08:56:06','2020-12-10 08:56:06'),(14,1,1,'loan_transaction',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-10 08:56:55','2020-12-10 08:56:55'),(15,1,1,'loan_transaction',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-10 09:12:10','2020-12-10 09:12:10'),(16,1,1,'loan_transaction',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-21 08:55:59','2020-12-21 08:55:59');
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_types`
--

DROP TABLE IF EXISTS `payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_cash` tinyint NOT NULL DEFAULT '0',
  `is_online` tinyint NOT NULL DEFAULT '0',
  `is_system` tinyint NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  `position` int DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_types`
--

LOCK TABLES `payment_types` WRITE;
/*!40000 ALTER TABLE `payment_types` DISABLE KEYS */;
INSERT INTO `payment_types` VALUES (1,'Cash',NULL,NULL,0,0,0,1,NULL,NULL,NULL,'2020-09-22 14:00:09','2020-09-22 14:00:09'),(2,'Ecocash',NULL,'ecocash',0,0,0,1,1,NULL,NULL,'2020-10-19 07:57:26','2020-10-19 07:57:26'),(3,'Mpesa',NULL,'Pay via Mpesa',0,1,0,1,NULL,NULL,NULL,'2020-12-04 13:27:45','2020-12-04 13:27:45');
/*!40000 ALTER TABLE `payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `payroll_template_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `employee_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `work_duration` decimal(65,2) NOT NULL DEFAULT '0.00',
  `duration_unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_per_duration` decimal(65,2) NOT NULL DEFAULT '0.00',
  `total_duration_amount` decimal(65,2) NOT NULL DEFAULT '0.00',
  `gross_amount` decimal(65,2) NOT NULL DEFAULT '0.00',
  `total_allowances` decimal(65,2) NOT NULL DEFAULT '0.00',
  `total_deductions` decimal(65,2) NOT NULL DEFAULT '0.00',
  `date` date DEFAULT NULL,
  `year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurring` tinyint DEFAULT '0',
  `recur_frequency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '31',
  `recur_start_date` date DEFAULT NULL,
  `recur_end_date` date DEFAULT NULL,
  `recur_next_date` date DEFAULT NULL,
  `recur_type` enum('day','week','month','year') COLLATE utf8mb4_unicode_ci DEFAULT 'month',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
INSERT INTO `payroll` VALUES (2,1,1,1,1,1,'Admin Admin','ff','fg','gg',NULL,8.00,'Day',10.00,80.00,270.00,200.00,10.00,'2020-11-27','2020','11',0,'31',NULL,NULL,NULL,'month','2020-11-27 07:52:06','2020-12-13 16:48:39');
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_items`
--

DROP TABLE IF EXISTS `payroll_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('allowance','deduction') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(65,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_items`
--

LOCK TABLES `payroll_items` WRITE;
/*!40000 ALTER TABLE `payroll_items` DISABLE KEYS */;
INSERT INTO `payroll_items` VALUES (1,'Basic Salary','allowance','fixed',200.00,'ff','2020-10-27 16:19:42','2020-10-27 16:21:43');
/*!40000 ALTER TABLE `payroll_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_items_meta`
--

DROP TABLE IF EXISTS `payroll_items_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll_items_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payroll_id` bigint unsigned DEFAULT NULL,
  `payroll_item_id` bigint unsigned DEFAULT NULL,
  `percentage` decimal(65,2) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('allowance','deduction') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(65,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_items_meta`
--

LOCK TABLES `payroll_items_meta` WRITE;
/*!40000 ALTER TABLE `payroll_items_meta` DISABLE KEYS */;
INSERT INTO `payroll_items_meta` VALUES (6,2,4,NULL,'Basic Salary','allowance','fixed',200.00,'2020-12-13 16:48:38','2020-12-13 16:48:38'),(7,2,5,NULL,'payee','deduction','fixed',10.00,'2020-12-13 16:48:39','2020-12-13 16:48:39');
/*!40000 ALTER TABLE `payroll_items_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_payments`
--

DROP TABLE IF EXISTS `payroll_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `payroll_id` bigint unsigned DEFAULT NULL,
  `payment_type_id` bigint unsigned DEFAULT NULL,
  `payment_detail_id` bigint unsigned DEFAULT NULL,
  `amount` decimal(65,2) NOT NULL,
  `submitted_on` date DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_payments`
--

LOCK TABLES `payroll_payments` WRITE;
/*!40000 ALTER TABLE `payroll_payments` DISABLE KEYS */;
INSERT INTO `payroll_payments` VALUES (1,1,1,2,NULL,7,70.00,'2020-11-27',NULL,'2020-11-27 08:35:07','2020-11-27 08:35:07');
/*!40000 ALTER TABLE `payroll_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_template_items`
--

DROP TABLE IF EXISTS `payroll_template_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll_template_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payroll_template_id` bigint unsigned DEFAULT NULL,
  `payroll_item_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_template_items`
--

LOCK TABLES `payroll_template_items` WRITE;
/*!40000 ALTER TABLE `payroll_template_items` DISABLE KEYS */;
INSERT INTO `payroll_template_items` VALUES (3,1,1,'2020-12-13 16:24:29','2020-12-13 16:24:29');
/*!40000 ALTER TABLE `payroll_template_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_templates`
--

DROP TABLE IF EXISTS `payroll_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_duration` decimal(65,2) NOT NULL DEFAULT '0.00',
  `duration_unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_per_duration` decimal(65,2) NOT NULL DEFAULT '0.00',
  `total_duration_amount` decimal(65,2) NOT NULL DEFAULT '0.00',
  `picture` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `items` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_templates`
--

LOCK TABLES `payroll_templates` WRITE;
/*!40000 ALTER TABLE `payroll_templates` DISABLE KEYS */;
INSERT INTO `payroll_templates` VALUES (1,'Default Template',8.00,'Day',10.00,80.00,NULL,'test',NULL,'2020-11-23 06:56:09','2020-12-13 16:24:29');
/*!40000 ALTER TABLE `payroll_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,NULL,'setting.setting.index','View settings','Setting',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(2,NULL,'setting.setting.edit','Edit Settings','Setting',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(3,NULL,'core.payment_types.index','View Payment Types','Core',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(4,NULL,'core.payment_types.create','Create Payment Types','Core',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(5,NULL,'core.payment_types.edit','Edit Payment Types','Core',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(6,NULL,'core.payment_types.destroy','Delete Payment Types','Core',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(7,NULL,'core.currencies.index','View Payment Details','Core',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(8,NULL,'core.currencies.create','Create Currencies','Core',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(9,NULL,'core.currencies.edit','Edit Currencies','Core',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(10,NULL,'core.currencies.destroy','Delete Currencies','Core',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(11,NULL,'core.modules.index','View Modules','Core',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(12,NULL,'core.modules.create','Create Modules','Core',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(13,NULL,'core.modules.destroy','Delete Modules','Core',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(14,NULL,'core.menu.index','Manage Menu','Core',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(15,NULL,'core.payment_gateways.index','View Payment Gateway','Core',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(16,NULL,'core.payment_gateways.create','Create Payment Gateway','Core',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(17,NULL,'core.payment_gateways.edit','Edit Payment Gateway','Core',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(18,NULL,'core.payment_gateways.destroy','Delete Payment Gateway','Core',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(19,NULL,'user.users.index','View Users','User',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(20,NULL,'user.users.create','Create Users','User',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(21,NULL,'user.users.edit','Edit Users','User',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(22,NULL,'user.users.destroy','Delete Users','User',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(23,NULL,'user.roles.index','View Roles','User',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(24,NULL,'user.roles.create','Create Roles','User',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(25,NULL,'user.roles.edit','Edit Roles','User',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(26,NULL,'user.roles.destroy','Delete Roles','User',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(27,NULL,'dashboard.index','View Dashboard','Dashboard',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(28,NULL,'dashboard.edit','Edit Dashboard','Dashboard',NULL,'web','2020-09-02 06:59:29','2020-09-02 06:59:29'),(29,NULL,'branch.branches.index','View Branches','Branch',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(30,NULL,'branch.branches.create','Create Branches','Branch',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(31,NULL,'branch.branches.edit','Edit Branches','Branch',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(32,NULL,'branch.branches.destroy','Delete Branches','Branch',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(33,NULL,'branch.branches.assign_user','Assign Users','Branch',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(34,NULL,'accounting.chart_of_accounts.index','View Chart of accounts','Accounting',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(35,NULL,'accounting.chart_of_accounts.create','Create Chart of accounts','Accounting',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(36,NULL,'accounting.chart_of_accounts.edit','Edit Chart of accounts','Accounting',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(37,NULL,'accounting.chart_of_accounts.destroy','Delete Chart of accounts','Accounting',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(38,NULL,'accounting.journal_entries.index','View Journal Entries','Accounting',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(39,NULL,'accounting.journal_entries.create','Create Journal Entries','Accounting',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(40,NULL,'accounting.journal_entries.edit','Edit Journal Entries','Accounting',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(41,NULL,'accounting.journal_entries.reverse','Reverse Journal Entries','Accounting',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(42,NULL,'accounting.reports.balance_sheet','View Balance Sheet','Accounting',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(43,NULL,'accounting.reports.trial_balance','View Trial Balance','Accounting',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(44,NULL,'accounting.reports.income_statement','View Income Statement','Accounting',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(45,NULL,'accounting.reports.ledger','View Ledger','Accounting',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(46,NULL,'asset.assets.index','View Assets','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(47,NULL,'asset.assets.create','Create Assets','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(48,NULL,'asset.assets.edit','Edit Assets','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(49,NULL,'asset.assets.destroy','Delete Assets','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(50,NULL,'asset.assets.types.index','View Asset Types','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(51,NULL,'asset.assets.types.create','Create Asset Types','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(52,NULL,'asset.assets.types.edit','Edit Asset Types','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(53,NULL,'asset.assets.types.destroy','Delete Asset Types','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(54,NULL,'asset.assets.notes.index','View Asset Notes','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(55,NULL,'asset.assets.notes.create','Create Asset Notes','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(56,NULL,'asset.assets.notes.edit','Edit Asset Notes','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(57,NULL,'asset.assets.notes.destroy','Delete Asset Notes','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(58,NULL,'asset.assets.maintenance.index','View Asset Maintenance','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(59,NULL,'asset.assets.maintenance.create','Create Asset Maintenance','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(60,NULL,'asset.assets.maintenance.edit','Edit Asset Maintenance','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(61,NULL,'asset.assets.maintenance.destroy','Delete Asset Maintenance','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(62,NULL,'asset.assets.files.index','View Asset Files','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(63,NULL,'asset.assets.files.create','Create Asset Files','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(64,NULL,'asset.assets.files.edit','Edit Asset Files','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(65,NULL,'asset.assets.files.destroy','Delete Asset Files','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(66,NULL,'asset.assets.pictures.index','View Asset Pictures','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(67,NULL,'asset.assets.pictures.create','Create Asset Pictures','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(68,NULL,'asset.assets.pictures.edit','Edit Asset Pictures','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(69,NULL,'asset.assets.pictures.destroy','Delete Asset Pictures','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(70,NULL,'asset.assets.valuations.index','View Asset Valuations','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(71,NULL,'asset.assets.valuations.create','Create Asset Valuations','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(72,NULL,'asset.assets.valuations.edit','Edit Asset Valuations','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(73,NULL,'asset.assets.valuations.destroy','Delete Asset Valuations','Asset',NULL,'web','2020-09-02 06:59:30','2020-09-02 06:59:30'),(74,NULL,'client.clients.index','View Clients','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(75,NULL,'client.clients.index_own','View Own Clients Only','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(76,NULL,'client.clients.create','Create Clients','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(77,NULL,'client.clients.edit','Edit Clients','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(78,NULL,'client.clients.edit_own','Edit Own Clients','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(79,NULL,'client.clients.activate','Activate Clients','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(80,NULL,'client.clients.activate_own','Activate Own Clients','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(81,NULL,'client.clients.destroy','Delete Clients','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(82,NULL,'client.clients.destroy_own','Delete Own Clients','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(83,NULL,'client.clients.user.create','Create Client Users','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(84,NULL,'client.clients.user.destroy','Delete Client Users','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(85,NULL,'client.clients.titles.index','View Titles','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(86,NULL,'client.clients.titles.create','Create Titles','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(87,NULL,'client.clients.titles.edit','Edit Titles','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(88,NULL,'client.clients.titles.destroy','Delete Titles','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(89,NULL,'client.clients.professions.index','View Professions','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(90,NULL,'client.clients.professions.create','Create Professions','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(91,NULL,'client.clients.professions.edit','Edit Professions','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(92,NULL,'client.clients.professions.destroy','Delete Professions','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(93,NULL,'client.clients.client_relationships.index','View Client Relationships','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(94,NULL,'client.clients.client_relationships.create','Create Client Relationships','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(95,NULL,'client.clients.client_relationships.edit','Edit Client Relationships','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(96,NULL,'client.clients.client_relationships.destroy','Delete Client Relationships','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(97,NULL,'client.clients.client_types.index','View Client Types','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(98,NULL,'client.clients.client_types.create','Create Client Types','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(99,NULL,'client.clients.client_types.edit','Edit Client Types','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(100,NULL,'client.clients.client_types.destroy','Delete Client Types','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(101,NULL,'client.clients.identification_types.index','View Identification Types','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(102,NULL,'client.clients.identification_types.create','Create Identification Types','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(103,NULL,'client.clients.identification_types.edit','Edit Identification Types','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(104,NULL,'client.clients.identification_types.destroy','Delete Identification Types','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(105,NULL,'client.clients.files.index','View Files','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(106,NULL,'client.clients.files.create','Create Files','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(107,NULL,'client.clients.files.edit','Edit Files','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(108,NULL,'client.clients.files.destroy','Delete Files','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(109,NULL,'client.clients.next_of_kin.index','View Next of kin','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(110,NULL,'client.clients.next_of_kin.create','Create Next of kin','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(111,NULL,'client.clients.next_of_kin.edit','Edit Next of kin','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(112,NULL,'client.clients.next_of_kin.destroy','Delete Next of kins','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(113,NULL,'client.clients.identification.index','View Identification','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(114,NULL,'client.clients.identification.create','Create Identification','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(115,NULL,'client.clients.identification.edit','Edit Identification','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(116,NULL,'client.clients.identification.destroy','Delete Identification','Client',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(117,NULL,'savings.savings.index','View Savings','Savings',NULL,'web','2020-09-02 06:59:31','2020-09-02 06:59:31'),(118,NULL,'savings.savings.create','Create Savings','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(119,NULL,'savings.savings.edit','Edit Savings','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(120,NULL,'savings.savings.destroy','Delete Savings','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(121,NULL,'savings.savings.approve_savings','Approve/Reject Savings','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(122,NULL,'savings.savings.activate_savings','Activate Savings','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(123,NULL,'savings.savings.withdraw_savings','Withdraw Savings','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(124,NULL,'savings.savings.inactive_savings','Inactive Savings','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(125,NULL,'savings.savings.dormant_savings','Dormant Savings','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(126,NULL,'savings.savings.close_savings','Close Savings','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(127,NULL,'savings.savings.products.index','View savings Products','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(128,NULL,'savings.savings.products.create','Create savings Products','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(129,NULL,'savings.savings.products.edit','Edit savings Products','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(130,NULL,'savings.savings.products.destroy','Delete savings Products','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(131,NULL,'savings.savings.transactions.index','View Transactions','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(132,NULL,'savings.savings.transactions.create','Create Transactions','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(133,NULL,'savings.savings.transactions.edit','Edit Transactions','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(134,NULL,'savings.savings.transactions.destroy','Delete/Reverse Transactions','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(135,NULL,'savings.savings.charges.index','View Charges','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(136,NULL,'savings.savings.charges.create','Create Charges','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(137,NULL,'savings.savings.charges.edit','Edit Charges','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(138,NULL,'savings.savings.charges.destroy','Delete Charges','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(139,NULL,'savings.savings.reports.transactions','View Transactions Report','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(140,NULL,'savings.savings.reports.balances','View Balances Report','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(141,NULL,'savings.savings.reports.accounts','View Accounts Report','Savings',NULL,'web','2020-09-02 06:59:32','2020-09-02 06:59:32'),(142,NULL,'reports.index','View Reports','Report',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(143,NULL,'loan.loans.index','View Loans','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(144,NULL,'loan.loans.create','Create Loans','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(145,NULL,'loan.loans.edit','Edit Loans','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(146,NULL,'loan.loans.destroy','Delete Loans','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(147,NULL,'loan.loans.approve_loan','Approve/Reject Loans','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(148,NULL,'loan.loans.disburse_loan','Disburse Loans','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(149,NULL,'loan.loans.withdraw_loan','Withdraw Loans','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(150,NULL,'loan.loans.write_off_loan','Write Off Loans','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(151,NULL,'loan.loans.reschedule_loan','Reschedule Loans','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(152,NULL,'loan.loans.close_loan','Close Loans','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(153,NULL,'loan.loans.calculator','Use Loan Calculator','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(154,NULL,'loan.loans.loan_history','View Loan History','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(155,NULL,'loan.loans.products.index','View Loan Products','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(156,NULL,'loan.loans.products.create','Create Loan Products','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(157,NULL,'loan.loans.products.edit','Edit Loan Products','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(158,NULL,'loan.loans.products.destroy','Delete Loan Products','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(159,NULL,'loan.loans.transactions.index','View Transactions','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(160,NULL,'loan.loans.transactions.create','Create Transactions','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(161,NULL,'loan.loans.transactions.edit','Edit Transactions','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(162,NULL,'loan.loans.transactions.destroy','Delete/Reverse Transactions','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(163,NULL,'loan.loans.charges.index','View Charges','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(164,NULL,'loan.loans.charges.create','Create Charges','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(165,NULL,'loan.loans.charges.edit','Edit Charges','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(166,NULL,'loan.loans.charges.destroy','Delete Charges','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(167,NULL,'loan.loans.funds.index','View Funds','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(168,NULL,'loan.loans.funds.create','Create Funds','Loan',NULL,'web','2020-09-02 06:59:33','2020-09-02 06:59:33'),(169,NULL,'loan.loans.funds.edit','Edit Funds','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(170,NULL,'loan.loans.funds.destroy','Delete Funds','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(171,NULL,'loan.loans.credit_checks.index','View Credit Checks','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(172,NULL,'loan.loans.credit_checks.create','Create Credit Checks','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(173,NULL,'loan.loans.credit_checks.edit','Edit Credit Checks','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(174,NULL,'loan.loans.credit_checks.destroy','Delete Credit Checks','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(175,NULL,'loan.loans.collateral.index','View Collateral','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(176,NULL,'loan.loans.collateral.create','Create Collateral','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(177,NULL,'loan.loans.collateral.edit','Edit Collateral','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(178,NULL,'loan.loans.collateral.destroy','Delete Collateral','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(179,NULL,'loan.loans.collateral_types.index','View Collateral Types','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(180,NULL,'loan.loans.collateral_types.create','Create Collateral Types','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(181,NULL,'loan.loans.collateral_types.edit','Edit Collateral Types','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(182,NULL,'loan.loans.collateral_types.destroy','Delete Collateral Types','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(183,NULL,'loan.loans.purposes.index','View Purposes','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(184,NULL,'loan.loans.purposes.create','Create Purposes','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(185,NULL,'loan.loans.purposes.edit','Edit Purposes','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(186,NULL,'loan.loans.purposes.destroy','Delete Purposes','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(187,NULL,'loan.loans.files.index','View Files','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(188,NULL,'loan.loans.files.create','Create Files','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(189,NULL,'loan.loans.files.edit','Edit Files','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(190,NULL,'loan.loans.files.destroy','Delete Files','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(191,NULL,'loan.loans.guarantors.index','View Guarantors','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(192,NULL,'loan.loans.guarantors.create','Create Guarantors','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(193,NULL,'loan.loans.guarantors.edit','Edit Guarantors','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(194,NULL,'loan.loans.guarantors.destroy','Delete Guarantors','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(195,NULL,'loan.loans.notes.index','View Notes','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(196,NULL,'loan.loans.notes.create','Create Notes','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(197,NULL,'loan.loans.notes.edit','Edit Notes','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(198,NULL,'loan.loans.notes.destroy','Delete Notes','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(199,NULL,'loan.loans.reports.collection_sheet','View Collection Sheet Reports','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(200,NULL,'loan.loans.reports.repayments','View Repayments Report','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(201,NULL,'loan.loans.reports.expected_repayments','View Expected Repayments Report','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(202,NULL,'loan.loans.reports.arrears','View Arrears Reports','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(203,NULL,'loan.loans.reports.disbursements','View Disbursements Report','Loan',NULL,'web','2020-09-02 06:59:34','2020-09-02 06:59:34'),(204,NULL,'communication.index','View Communication','Communication',NULL,'web','2020-09-02 06:59:35','2020-09-02 06:59:35'),(205,NULL,'communication.campaigns.index','View Campaigns','Communication',NULL,'web','2020-09-02 06:59:35','2020-09-02 06:59:35'),(206,NULL,'communication.campaigns.create','Create Campaigns','Communication',NULL,'web','2020-09-02 06:59:35','2020-09-02 06:59:35'),(207,NULL,'communication.campaigns.edit','Edit Campaigns','Communication',NULL,'web','2020-09-02 06:59:35','2020-09-02 06:59:35'),(208,NULL,'communication.campaigns.destroy','Delete Campaigns','Communication',NULL,'web','2020-09-02 06:59:35','2020-09-02 06:59:35'),(209,NULL,'communication.logs.index','View Logs','Communication',NULL,'web','2020-09-02 06:59:35','2020-09-02 06:59:35'),(210,NULL,'communication.logs.create','Create Logs','Communication',NULL,'web','2020-09-02 06:59:35','2020-09-02 06:59:35'),(211,NULL,'communication.logs.edit','Edit Logs','Communication',NULL,'web','2020-09-02 06:59:35','2020-09-02 06:59:35'),(212,NULL,'communication.logs.destroy','Delete Logs','Communication',NULL,'web','2020-09-02 06:59:35','2020-09-02 06:59:35'),(213,NULL,'communication.sms_gateways.index','View SMS Gateways','Communication',NULL,'web','2020-09-02 06:59:35','2020-09-02 06:59:35'),(214,NULL,'communication.sms_gateways.create','Create SMS Gateways','Communication',NULL,'web','2020-09-02 06:59:35','2020-09-02 06:59:35'),(215,NULL,'communication.sms_gateways.edit','Edit SMS Gateways','Communication',NULL,'web','2020-09-02 06:59:35','2020-09-02 06:59:35'),(216,NULL,'communication.sms_gateways.destroy','Delete SMS Gateways','Communication',NULL,'web','2020-09-02 06:59:35','2020-09-02 06:59:35'),(217,NULL,'payroll.payroll.index','View Payroll','Payroll',NULL,'web','2020-09-02 06:59:37','2020-09-02 06:59:37'),(218,NULL,'payroll.payroll.create','Create Payroll','Payroll',NULL,'web','2020-09-02 06:59:37','2020-09-02 06:59:37'),(219,NULL,'payroll.payroll.edit','Edit Payroll','Payroll',NULL,'web','2020-09-02 06:59:37','2020-09-02 06:59:37'),(220,NULL,'payroll.payroll.destroy','Delete Payroll','Payroll',NULL,'web','2020-09-02 06:59:37','2020-09-02 06:59:37'),(221,NULL,'payroll.payroll.items.index','View Payroll Items','Payroll',NULL,'web','2020-09-02 06:59:37','2020-09-02 06:59:37'),(222,NULL,'payroll.payroll.items.create','Create Payroll Items','Payroll',NULL,'web','2020-09-02 06:59:37','2020-09-02 06:59:37'),(223,NULL,'payroll.payroll.items.edit','Edit Payroll Items','Payroll',NULL,'web','2020-09-02 06:59:38','2020-09-02 06:59:38'),(224,NULL,'payroll.payroll.items.destroy','Delete Payroll Items','Payroll',NULL,'web','2020-09-02 06:59:38','2020-09-02 06:59:38'),(225,NULL,'payroll.payroll.templates.index','View Templates','Payroll',NULL,'web','2020-09-02 06:59:38','2020-09-02 06:59:38'),(226,NULL,'payroll.payroll.templates.create','Create Templates','Payroll',NULL,'web','2020-09-02 06:59:38','2020-09-02 06:59:38'),(227,NULL,'payroll.payroll.templates.edit','Edit Templates','Payroll',NULL,'web','2020-09-02 06:59:38','2020-09-02 06:59:38'),(228,NULL,'payroll.payroll.templates.destroy','Delete Templates','Payroll',NULL,'web','2020-09-02 06:59:38','2020-09-02 06:59:38'),(229,NULL,'customfield.custom_fields.index','View Custom Fields','CustomField',NULL,'web','2020-09-02 06:59:38','2020-09-02 06:59:38'),(230,NULL,'customfield.custom_fields.create','Create Custom Field','CustomField',NULL,'web','2020-09-02 06:59:38','2020-09-02 06:59:38'),(231,NULL,'customfield.custom_fields.edit','Edit Custom Field','CustomField',NULL,'web','2020-09-02 06:59:38','2020-09-02 06:59:38'),(232,NULL,'customfield.custom_fields.destroy','Delete Custom Field','CustomField',NULL,'web','2020-09-02 06:59:38','2020-09-02 06:59:38'),(233,NULL,'expense.expenses.index','View Expenses','Expense',NULL,'web','2020-09-02 06:59:39','2020-09-02 06:59:39'),(234,NULL,'expense.expenses.create','Create Expenses','Expense',NULL,'web','2020-09-02 06:59:39','2020-09-02 06:59:39'),(235,NULL,'expense.expenses.edit','Edit Expenses','Expense',NULL,'web','2020-09-02 06:59:39','2020-09-02 06:59:39'),(236,NULL,'expense.expenses.destroy','Delete Expenses','Expense',NULL,'web','2020-09-02 06:59:39','2020-09-02 06:59:39'),(237,NULL,'expense.expenses.types.index','View Expense Types','Expense',NULL,'web','2020-09-02 06:59:39','2020-09-02 06:59:39'),(238,NULL,'expense.expenses.types.create','Create Expense Types','Expense',NULL,'web','2020-09-02 06:59:39','2020-09-02 06:59:39'),(239,NULL,'expense.expenses.types.edit','Edit Expense Types','Expense',NULL,'web','2020-09-02 06:59:39','2020-09-02 06:59:39'),(240,NULL,'expense.expenses.types.destroy','Delete Expense Types','Expense',NULL,'web','2020-09-02 06:59:39','2020-09-02 06:59:39'),(241,NULL,'expense.expenses.notes.index','View Expense Notes','Expense',NULL,'web','2020-09-02 06:59:39','2020-09-02 06:59:39'),(242,NULL,'expense.expenses.notes.create','Create Expense Notes','Expense',NULL,'web','2020-09-02 06:59:39','2020-09-02 06:59:39'),(243,NULL,'expense.expenses.notes.edit','Edit Expense Notes','Expense',NULL,'web','2020-09-02 06:59:39','2020-09-02 06:59:39'),(244,NULL,'expense.expenses.notes.destroy','Delete Expense Notes','Expense',NULL,'web','2020-09-02 06:59:39','2020-09-02 06:59:39'),(245,NULL,'income.income.index','View Income','Income',NULL,'web','2020-09-02 06:59:40','2020-09-02 06:59:40'),(246,NULL,'income.income.create','Create Income','Income',NULL,'web','2020-09-02 06:59:40','2020-09-02 06:59:40'),(247,NULL,'income.income.edit','Edit Income','Income',NULL,'web','2020-09-02 06:59:40','2020-09-02 06:59:40'),(248,NULL,'income.income.destroy','Delete Income','Income',NULL,'web','2020-09-02 06:59:40','2020-09-02 06:59:40'),(249,NULL,'income.income.types.index','View Income Types','Income',NULL,'web','2020-09-02 06:59:40','2020-09-02 06:59:40'),(250,NULL,'income.income.types.create','Create Income Types','Income',NULL,'web','2020-09-02 06:59:40','2020-09-02 06:59:40'),(251,NULL,'income.income.types.edit','Edit Income Types','Income',NULL,'web','2020-09-02 06:59:40','2020-09-02 06:59:40'),(252,NULL,'income.income.types.destroy','Delete Income Types','Income',NULL,'web','2020-09-02 06:59:40','2020-09-02 06:59:40'),(253,NULL,'income.income.notes.index','View Income Notes','Income',NULL,'web','2020-09-02 06:59:40','2020-09-02 06:59:40'),(254,NULL,'income.income.notes.create','Create Income Notes','Income',NULL,'web','2020-09-02 06:59:40','2020-09-02 06:59:40'),(255,NULL,'income.income.notes.edit','Edit Income Notes','Income',NULL,'web','2020-09-02 06:59:40','2020-09-02 06:59:40'),(256,NULL,'income.income.notes.destroy','Delete Income Notes','Income',NULL,'web','2020-09-02 06:59:40','2020-09-02 06:59:40'),(257,NULL,'upgrade.upgrades.index','View Upgrade Page','Upgrade',NULL,'web','2020-09-02 06:59:43','2020-09-02 06:59:43'),(258,NULL,'upgrade.upgrades.manage','Manage Upgrades','Upgrade',NULL,'web','2020-09-02 06:59:43','2020-09-02 06:59:43'),(259,NULL,'activitylog.activity_logs.index','View Activity Logs','Activitylog',NULL,'web','2020-09-02 06:59:44','2020-09-02 06:59:44'),(260,NULL,'activitylog.activity_logs.destroy','Delete Activity Logs','Activitylog',NULL,'web','2020-09-02 06:59:44','2020-09-02 06:59:44'),(261,NULL,'wallet.wallets.index','View Wallet','Wallet',NULL,'web','2020-09-02 06:59:45','2020-09-02 06:59:45'),(262,NULL,'wallet.wallets.create','Create Wallet','Wallet',NULL,'web','2020-09-02 06:59:45','2020-09-02 06:59:45'),(263,NULL,'wallet.wallets.edit','Edit Wallet','Wallet',NULL,'web','2020-09-02 06:59:45','2020-09-02 06:59:45'),(264,NULL,'wallet.wallets.destroy','Delete Wallet','Wallet',NULL,'web','2020-09-02 06:59:45','2020-09-02 06:59:45'),(265,NULL,'wallet.wallets.approve_wallets','Approve/Reject Wallet','Wallet',NULL,'web','2020-09-02 06:59:45','2020-09-02 06:59:45'),(266,NULL,'wallet.wallets.activate_wallets','Activate Wallet','Wallet',NULL,'web','2020-09-02 06:59:45','2020-09-02 06:59:45'),(267,NULL,'wallet.wallets.withdraw_wallets','Withdraw Wallet','Wallet',NULL,'web','2020-09-02 06:59:45','2020-09-02 06:59:45'),(268,NULL,'wallet.wallets.inactive_wallets','Inactive Wallet','Wallet',NULL,'web','2020-09-02 06:59:45','2020-09-02 06:59:45'),(269,NULL,'wallet.wallets.close_wallets','Close Wallet','Wallet',NULL,'web','2020-09-02 06:59:45','2020-09-02 06:59:45'),(270,NULL,'wallet.wallets.transactions.index','View Transactions','Wallet',NULL,'web','2020-09-02 06:59:45','2020-09-02 06:59:45'),(271,NULL,'wallet.wallets.transactions.create','Create Transactions','Wallet',NULL,'web','2020-09-02 06:59:45','2020-09-02 06:59:45'),(272,NULL,'wallet.wallets.transactions.edit','Edit Transactions','Wallet',NULL,'web','2020-09-02 06:59:45','2020-09-02 06:59:45'),(273,NULL,'wallet.wallets.transactions.destroy','Delete/Reverse Transactions','Wallet',NULL,'web','2020-09-02 06:59:45','2020-09-02 06:59:45'),(274,NULL,'wallet.wallets.reports.transactions','View Transactions Report','Wallet',NULL,'web','2020-09-02 06:59:45','2020-09-02 06:59:45'),(275,NULL,'wallet.wallets.reports.balances','View Balances Report','Wallet',NULL,'web','2020-09-02 06:59:45','2020-09-02 06:59:45'),(276,NULL,'wallet.wallets.reports.accounts','View Accounts Report','Wallet',NULL,'web','2020-09-02 06:59:45','2020-09-02 06:59:45'),(277,NULL,'share.shares.index','View Shares','Share',NULL,'web','2020-09-15 10:10:41','2020-09-15 10:10:41'),(278,NULL,'share.shares.create','Create Shares','Share',NULL,'web','2020-09-15 10:10:41','2020-09-15 10:10:41'),(279,NULL,'share.shares.edit','Edit Shares','Share',NULL,'web','2020-09-15 10:10:41','2020-09-15 10:10:41'),(280,NULL,'share.shares.destroy','Delete Shares','Share',NULL,'web','2020-09-15 10:10:41','2020-09-15 10:10:41'),(281,NULL,'share.shares.approve_shares','Approve Shares','Share',NULL,'web','2020-09-15 10:10:41','2020-09-15 10:10:41'),(282,NULL,'share.shares.activate_shares','Activate Shares','Share',NULL,'web','2020-09-15 10:10:41','2020-09-15 10:10:41'),(283,NULL,'share.shares.close_shares','Close Shares','Share',NULL,'web','2020-09-15 10:10:41','2020-09-15 10:10:41'),(284,NULL,'share.shares.products.index','View Share Products','Share',NULL,'web','2020-09-15 10:10:41','2020-09-15 10:10:41'),(285,NULL,'share.shares.products.create','Create Share Products','Share',NULL,'web','2020-09-15 10:10:41','2020-09-15 10:10:41'),(286,NULL,'share.shares.products.edit','Edit Share Products','Share',NULL,'web','2020-09-15 10:10:41','2020-09-15 10:10:41'),(287,NULL,'share.shares.products.destroy','Delete Share Products','Share',NULL,'web','2020-09-15 10:10:41','2020-09-15 10:10:41'),(288,NULL,'share.shares.transactions.index','View Transactions','Share',NULL,'web','2020-09-15 10:10:41','2020-09-15 10:10:41'),(289,NULL,'share.shares.transactions.create','Create Transactions','Share',NULL,'web','2020-09-15 10:10:41','2020-09-15 10:10:41'),(290,NULL,'share.shares.transactions.edit','Edit Transactions','Share',NULL,'web','2020-09-15 10:10:41','2020-09-15 10:10:41'),(291,NULL,'share.shares.transactions.destroy','Delete/Reverse Transactions','Share',NULL,'web','2020-09-15 10:10:42','2020-09-15 10:10:42'),(292,NULL,'share.shares.notes.index','View Share Notes','Share',NULL,'web','2020-09-15 10:10:42','2020-09-15 10:10:42'),(293,NULL,'share.shares.notes.create','Create Share Notes','Share',NULL,'web','2020-09-15 10:10:42','2020-09-15 10:10:42'),(294,NULL,'share.shares.notes.edit','Edit Share Notes','Share',NULL,'web','2020-09-15 10:10:42','2020-09-15 10:10:42'),(295,NULL,'share.shares.notes.destroy','Delete Share Notes','Share',NULL,'web','2020-09-15 10:10:42','2020-09-15 10:10:42'),(296,NULL,'share.shares.charges.index','View Share Charges','Share',NULL,'web','2020-09-15 10:10:42','2020-09-15 10:10:42'),(297,NULL,'share.shares.charges.create','Create Share Charges','Share',NULL,'web','2020-09-15 10:10:42','2020-09-15 10:10:42'),(298,NULL,'share.shares.charges.edit','Edit Share Charges','Share',NULL,'web','2020-09-15 10:10:42','2020-09-15 10:10:42'),(299,NULL,'share.shares.charges.destroy','Delete Share Charges','Share',NULL,'web','2020-09-15 10:10:42','2020-09-15 10:10:42'),(300,NULL,'share.shares.files.index','View Share Files','Share',NULL,'web','2020-09-15 10:10:42','2020-09-15 10:10:42'),(301,NULL,'share.shares.files.create','Create Share Files','Share',NULL,'web','2020-09-15 10:10:42','2020-09-15 10:10:42'),(302,NULL,'share.shares.files.edit','Edit Share Files','Share',NULL,'web','2020-09-15 10:10:42','2020-09-15 10:10:42'),(303,NULL,'share.shares.files.destroy','Delete Share Files','Share',NULL,'web','2020-09-15 10:10:42','2020-09-15 10:10:42'),(304,NULL,'core.themes.index','Themes','Core',NULL,'web','2020-10-11 10:42:48','2020-10-11 10:42:48'),(305,NULL,'user.reports.index','View Reports','User',NULL,'web','2021-01-15 11:25:37','2021-01-15 11:25:37'),(306,NULL,'user.reports.performance','View Performance Reports','User',NULL,'web','2021-01-15 11:25:37','2021-01-15 11:25:37');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professions`
--

DROP TABLE IF EXISTS `professions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professions`
--

LOCK TABLES `professions` WRITE;
/*!40000 ALTER TABLE `professions` DISABLE KEYS */;
INSERT INTO `professions` VALUES (1,'Teacher');
/*!40000 ALTER TABLE `professions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(198,1),(199,1),(200,1),(201,1),(202,1),(203,1),(204,1),(205,1),(206,1),(207,1),(208,1),(209,1),(210,1),(211,1),(212,1),(213,1),(214,1),(215,1),(216,1),(217,1),(218,1),(219,1),(220,1),(221,1),(222,1),(223,1),(224,1),(225,1),(226,1),(227,1),(228,1),(229,1),(230,1),(231,1),(232,1),(233,1),(234,1),(235,1),(236,1),(237,1),(238,1),(239,1),(240,1),(241,1),(242,1),(243,1),(244,1),(245,1),(246,1),(247,1),(248,1),(249,1),(250,1),(251,1),(252,1),(253,1),(254,1),(255,1),(256,1),(257,1),(258,1),(259,1),(260,1),(261,1),(262,1),(263,1),(264,1),(265,1),(266,1),(267,1),(268,1),(269,1),(270,1),(271,1),(272,1),(273,1),(274,1),(275,1),(276,1),(277,1),(278,1),(279,1),(280,1),(281,1),(282,1),(283,1),(284,1),(285,1),(286,1),(287,1),(288,1),(289,1),(290,1),(291,1),(292,1),(293,1),(294,1),(295,1),(296,1),(297,1),(298,1),(299,1),(300,1),(301,1),(302,1),(303,1),(304,1),(305,1),(306,1),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3),(16,3),(17,3),(18,3),(19,3),(20,3),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,3),(31,3),(32,3),(33,3),(34,3),(35,3),(36,3),(37,3),(38,3),(39,3),(40,3),(41,3),(42,3),(43,3),(44,3),(45,3),(46,3),(47,3),(48,3),(49,3),(50,3),(51,3),(52,3),(53,3),(54,3),(55,3),(56,3),(57,3),(58,3),(59,3),(60,3),(61,3),(62,3),(63,3),(64,3),(65,3),(66,3),(67,3),(68,3),(69,3),(70,3),(71,3),(72,3),(73,3),(74,3),(75,3),(76,3),(77,3),(78,3),(79,3),(80,3),(81,3),(82,3),(83,3),(84,3),(85,3),(86,3),(87,3),(88,3),(89,3),(90,3),(91,3),(92,3),(93,3),(94,3),(95,3),(96,3),(97,3),(98,3),(99,3),(100,3),(101,3),(102,3),(103,3),(104,3),(105,3),(106,3),(107,3),(108,3),(109,3),(110,3),(111,3),(112,3),(113,3),(114,3),(115,3),(116,3),(233,3),(234,3),(235,3),(236,3),(237,3),(238,3),(239,3),(240,3),(241,3),(242,3),(243,3),(244,3),(277,3),(278,3),(279,3),(280,3),(281,3),(282,3),(283,3),(284,3),(285,3),(286,3),(287,3),(288,3),(289,3),(290,3),(291,3),(292,3),(293,3),(294,3),(295,3),(296,3),(297,3),(298,3),(299,3),(300,3),(301,3),(302,3),(303,3),(304,3);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `is_system` tinyint NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,1,'admin','web','2020-09-02 06:59:25','2020-09-02 06:59:25'),(2,1,'client','web','2020-09-02 06:59:25','2020-09-02 06:59:25'),(3,0,'Test','web','2020-10-18 09:54:43','2020-10-18 09:54:43');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings`
--

DROP TABLE IF EXISTS `savings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `savings_officer_id` bigint unsigned DEFAULT NULL,
  `savings_product_id` bigint unsigned DEFAULT NULL,
  `client_type` enum('client','group') COLLATE utf8mb4_unicode_ci DEFAULT 'client',
  `client_id` bigint unsigned DEFAULT NULL,
  `group_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimals` int DEFAULT NULL,
  `interest_rate` decimal(65,6) NOT NULL,
  `interest_rate_type` enum('day','week','month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year',
  `compounding_period` enum('daily','weekly','monthly','biannual','annually') COLLATE utf8mb4_unicode_ci NOT NULL,
  `interest_posting_period_type` enum('daily','weekly','monthly','biannual','annually') COLLATE utf8mb4_unicode_ci NOT NULL,
  `interest_calculation_type` enum('daily_balance','average_daily_balance') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'daily_balance',
  `balance_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `total_deposits_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `total_withdrawals_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `total_interest_posted_derived` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `minimum_balance_for_interest_calculation` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `lockin_period` int NOT NULL DEFAULT '0',
  `lockin_type` enum('days','weeks','months','years') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'days',
  `automatic_opening_balance` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `allow_overdraft` tinyint NOT NULL DEFAULT '0',
  `overdraft_limit` decimal(65,6) DEFAULT NULL,
  `overdraft_interest_rate` decimal(65,6) DEFAULT NULL,
  `minimum_overdraft_for_interest` decimal(65,6) DEFAULT NULL,
  `submitted_on_date` date DEFAULT NULL,
  `submitted_by_user_id` bigint unsigned DEFAULT NULL,
  `approved_on_date` date DEFAULT NULL,
  `approved_by_user_id` bigint unsigned DEFAULT NULL,
  `approved_notes` text COLLATE utf8mb4_unicode_ci,
  `activated_on_date` date DEFAULT NULL,
  `activated_by_user_id` bigint unsigned DEFAULT NULL,
  `activated_notes` text COLLATE utf8mb4_unicode_ci,
  `rejected_on_date` date DEFAULT NULL,
  `rejected_by_user_id` bigint unsigned DEFAULT NULL,
  `rejected_notes` text COLLATE utf8mb4_unicode_ci,
  `dormant_on_date` date DEFAULT NULL,
  `dormant_by_user_id` bigint unsigned DEFAULT NULL,
  `dormant_notes` text COLLATE utf8mb4_unicode_ci,
  `closed_on_date` date DEFAULT NULL,
  `closed_by_user_id` bigint unsigned DEFAULT NULL,
  `closed_notes` text COLLATE utf8mb4_unicode_ci,
  `inactive_on_date` date DEFAULT NULL,
  `inactive_by_user_id` bigint unsigned DEFAULT NULL,
  `inactive_notes` text COLLATE utf8mb4_unicode_ci,
  `withdrawn_on_date` date DEFAULT NULL,
  `withdrawn_by_user_id` bigint unsigned DEFAULT NULL,
  `withdrawn_notes` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','approved','active','withdrawn','rejected','closed','inactive','dormant','submitted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'submitted',
  `start_interest_posting_date` date DEFAULT NULL,
  `next_interest_posting_date` date DEFAULT NULL,
  `start_interest_calculation_date` date DEFAULT NULL,
  `next_interest_calculation_date` date DEFAULT NULL,
  `last_interest_calculation_date` date DEFAULT NULL,
  `last_interest_posting_date` date DEFAULT NULL,
  `calculated_interest` decimal(65,6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `savings_client_id_index` (`client_id`),
  KEY `savings_branch_id_index` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings`
--

LOCK TABLES `savings` WRITE;
/*!40000 ALTER TABLE `savings` DISABLE KEYS */;
INSERT INTO `savings` VALUES (1,1,1,1,1,'client',1,NULL,1,NULL,NULL,2,10.000000,'year','daily','monthly','daily_balance',0.000000,0.000000,0.000000,0.000000,0.000000,0,'days',0.000000,0,NULL,NULL,NULL,'2020-10-02',1,'2020-10-02',1,NULL,'2020-10-02',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2020-10-31','2020-10-31','2020-10-02','2020-10-02',NULL,NULL,NULL,'2020-10-02 06:28:35','2020-10-02 06:28:44'),(2,1,1,1,2,'client',2,NULL,1,'12002',NULL,0,10.000000,'year','daily','monthly','daily_balance',0.000000,0.000000,0.000000,0.000000,0.000000,0,'days',0.000000,0,NULL,NULL,NULL,'2020-12-06',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'submitted',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-06 17:11:55','2021-01-15 15:34:02'),(3,1,1,1,2,'client',2,NULL,1,'12003',NULL,0,10.000000,'year','daily','monthly','daily_balance',30.000000,0.000000,0.000000,0.000000,0.000000,0,'days',0.000000,0,NULL,NULL,NULL,'2020-12-06',1,'2020-12-06',1,NULL,'2020-12-06',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2020-12-31','2020-12-31','2020-12-06','2020-12-06',NULL,NULL,NULL,'2020-12-06 17:27:08','2021-01-15 15:30:42'),(4,1,1,3,1,'client',1,NULL,1,NULL,NULL,2,10.000000,'year','daily','monthly','daily_balance',0.000000,0.000000,0.000000,0.000000,0.000000,0,'days',0.000000,0,NULL,NULL,NULL,'2021-01-15',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'submitted',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-01-15 18:13:11','2021-01-15 18:13:11'),(5,1,1,3,1,'client',1,NULL,1,'11005',NULL,2,10.000000,'year','daily','monthly','daily_balance',0.000000,0.000000,0.000000,0.000000,0.000000,0,'days',0.000000,0,NULL,NULL,NULL,'2021-01-15',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'submitted',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-01-15 18:15:05','2021-01-15 18:15:05');
/*!40000 ALTER TABLE `savings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings_charge_options`
--

DROP TABLE IF EXISTS `savings_charge_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings_charge_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `translated_name` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_charge_options`
--

LOCK TABLES `savings_charge_options` WRITE;
/*!40000 ALTER TABLE `savings_charge_options` DISABLE KEYS */;
INSERT INTO `savings_charge_options` VALUES (1,'Flat','Flat',1),(2,'Percentage of amount','Percentage of amount',1),(3,'Percentage of savings balance','Percentage of savings balance',1);
/*!40000 ALTER TABLE `savings_charge_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings_charge_types`
--

DROP TABLE IF EXISTS `savings_charge_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings_charge_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `translated_name` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_charge_types`
--

LOCK TABLES `savings_charge_types` WRITE;
/*!40000 ALTER TABLE `savings_charge_types` DISABLE KEYS */;
INSERT INTO `savings_charge_types` VALUES (1,'Savings Activation','Savings Activation',1),(2,'Specified Due Date','Specified Due Date',1),(3,'Withdrawal Fee','Withdrawal Fee',1),(4,'Annual Fee','Annual Fee',1),(5,'Monthly Fee','Monthly Fee',1),(6,'Inactivity Fee','Inactivity Fee',1),(7,'Quarterly Fee','Quarterly Fee',1);
/*!40000 ALTER TABLE `savings_charge_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings_charges`
--

DROP TABLE IF EXISTS `savings_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings_charges` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `savings_charge_type_id` bigint unsigned NOT NULL,
  `savings_charge_option_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(65,6) NOT NULL,
  `min_amount` decimal(65,6) DEFAULT NULL,
  `max_amount` decimal(65,6) DEFAULT NULL,
  `payment_mode` enum('regular','account_transfer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'regular',
  `schedule` tinyint NOT NULL DEFAULT '0',
  `schedule_frequency` int DEFAULT NULL,
  `schedule_frequency_type` enum('days','weeks','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '0',
  `allow_override` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `savings_charges_currency_id_foreign` (`currency_id`),
  KEY `savings_charges_savings_charge_type_id_foreign` (`savings_charge_type_id`),
  KEY `savings_charges_savings_charge_option_id_foreign` (`savings_charge_option_id`),
  KEY `savings_charges_created_by_id_foreign` (`created_by_id`),
  CONSTRAINT `savings_charges_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `savings_charges_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `savings_charges_savings_charge_option_id_foreign` FOREIGN KEY (`savings_charge_option_id`) REFERENCES `savings_charge_options` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `savings_charges_savings_charge_type_id_foreign` FOREIGN KEY (`savings_charge_type_id`) REFERENCES `savings_charge_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_charges`
--

LOCK TABLES `savings_charges` WRITE;
/*!40000 ALTER TABLE `savings_charges` DISABLE KEYS */;
INSERT INTO `savings_charges` VALUES (1,1,1,1,1,'Test',40.000000,NULL,NULL,'regular',0,NULL,NULL,1,0,'2020-12-05 07:37:27','2020-12-05 07:37:27');
/*!40000 ALTER TABLE `savings_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings_linked_charges`
--

DROP TABLE IF EXISTS `savings_linked_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings_linked_charges` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `savings_id` bigint unsigned DEFAULT NULL,
  `savings_charge_id` bigint unsigned DEFAULT NULL,
  `savings_charge_type_id` bigint unsigned DEFAULT NULL,
  `savings_charge_option_id` bigint unsigned DEFAULT NULL,
  `savings_transaction_id` bigint unsigned DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `amount` decimal(65,6) NOT NULL,
  `calculated_amount` decimal(65,6) DEFAULT NULL,
  `paid_amount` decimal(65,6) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '0',
  `waived` tinyint NOT NULL DEFAULT '0',
  `is_paid` tinyint NOT NULL DEFAULT '0',
  `submitted_on` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_linked_charges`
--

LOCK TABLES `savings_linked_charges` WRITE;
/*!40000 ALTER TABLE `savings_linked_charges` DISABLE KEYS */;
INSERT INTO `savings_linked_charges` VALUES (4,NULL,NULL,3,1,1,1,NULL,'Test',40.000000,NULL,NULL,0,0,0,NULL,'2021-01-15 15:30:42','2021-01-15 15:30:42'),(5,NULL,NULL,2,1,1,1,NULL,'Test',40.000000,NULL,NULL,0,0,0,NULL,'2021-01-15 15:34:02','2021-01-15 15:34:02');
/*!40000 ALTER TABLE `savings_linked_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings_product_linked_charges`
--

DROP TABLE IF EXISTS `savings_product_linked_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings_product_linked_charges` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `savings_product_id` bigint unsigned NOT NULL,
  `savings_charge_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_product_linked_charges`
--

LOCK TABLES `savings_product_linked_charges` WRITE;
/*!40000 ALTER TABLE `savings_product_linked_charges` DISABLE KEYS */;
INSERT INTO `savings_product_linked_charges` VALUES (3,2,1,'2020-12-05 09:16:49','2020-12-05 09:16:49');
/*!40000 ALTER TABLE `savings_product_linked_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings_products`
--

DROP TABLE IF EXISTS `savings_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `savings_reference_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `overdraft_portfolio_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `savings_control_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `interest_on_savings_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `write_off_savings_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `income_from_fees_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `income_from_penalties_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `income_from_interest_overdraft_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `decimals` int DEFAULT NULL,
  `savings_category` enum('voluntary','compulsory') COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_create` tinyint NOT NULL DEFAULT '0',
  `minimum_interest_rate` decimal(65,6) NOT NULL,
  `default_interest_rate` decimal(65,6) NOT NULL,
  `maximum_interest_rate` decimal(65,6) NOT NULL,
  `interest_rate_type` enum('day','week','month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year',
  `compounding_period` enum('daily','weekly','monthly','biannual','annually') COLLATE utf8mb4_unicode_ci NOT NULL,
  `interest_posting_period_type` enum('daily','weekly','monthly','biannual','annually') COLLATE utf8mb4_unicode_ci NOT NULL,
  `interest_calculation_type` enum('daily_balance','average_daily_balance') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'daily_balance',
  `automatic_opening_balance` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `minimum_balance_for_interest_calculation` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `lockin_period` int NOT NULL DEFAULT '0',
  `lockin_type` enum('days','weeks','months','years') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'days',
  `minimum_balance` decimal(65,6) NOT NULL DEFAULT '0.000000',
  `allow_overdraft` tinyint NOT NULL DEFAULT '0',
  `overdraft_limit` decimal(65,6) DEFAULT NULL,
  `overdraft_interest_rate` decimal(65,6) DEFAULT NULL,
  `minimum_overdraft_for_interest` decimal(65,6) DEFAULT NULL,
  `days_in_year` enum('actual','360','365','364') COLLATE utf8mb4_unicode_ci DEFAULT '365',
  `days_in_month` enum('actual','30','31') COLLATE utf8mb4_unicode_ci DEFAULT '30',
  `accounting_rule` enum('none','cash') COLLATE utf8mb4_unicode_ci DEFAULT 'none',
  `active` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_products`
--

LOCK TABLES `savings_products` WRITE;
/*!40000 ALTER TABLE `savings_products` DISABLE KEYS */;
INSERT INTO `savings_products` VALUES (1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Test','test','Test',2,'voluntary',0,0.000000,10.000000,0.000000,'year','daily','monthly','daily_balance',0.000000,0.000000,0,'days',0.000000,0,NULL,NULL,NULL,'365','30','none',1,'2020-10-02 06:28:23','2020-10-02 06:28:23'),(2,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ecocash','default','default',0,'voluntary',0,0.000000,10.000000,0.000000,'year','daily','monthly','daily_balance',0.000000,0.000000,0,'days',0.000000,0,NULL,NULL,NULL,'365','30','none',1,'2020-12-05 09:06:44','2020-12-05 09:06:44');
/*!40000 ALTER TABLE `savings_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings_transaction_types`
--

DROP TABLE IF EXISTS `savings_transaction_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings_transaction_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `translated_name` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_transaction_types`
--

LOCK TABLES `savings_transaction_types` WRITE;
/*!40000 ALTER TABLE `savings_transaction_types` DISABLE KEYS */;
INSERT INTO `savings_transaction_types` VALUES (1,'Deposit','Deposit',1),(2,'Withdrawal','Withdrawal',1),(3,'Dividend','Dividend',1),(4,'Waive Interest','Waive Interest',1),(5,'Guarantee','Guarantee',1),(6,'Guarantee Restored','Guarantee Restored',1),(7,'Loan Repayment','Loan Repayment',1),(8,'Transfer','Transfer',1),(9,'Waive Charges','Waive Charges',1),(10,'Apply Charges','Apply Charges',1),(11,'Apply Interest','Apply Interest',1),(12,'Pay Charge','Pay Charge',1);
/*!40000 ALTER TABLE `savings_transaction_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings_transactions`
--

DROP TABLE IF EXISTS `savings_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `savings_id` bigint unsigned NOT NULL,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `savings_linked_charge_id` bigint unsigned DEFAULT NULL,
  `payment_detail_id` bigint unsigned DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `amount` decimal(65,6) NOT NULL,
  `credit` decimal(65,6) DEFAULT NULL,
  `debit` decimal(65,6) DEFAULT NULL,
  `balance` decimal(65,6) DEFAULT NULL,
  `savings_transaction_type_id` bigint unsigned NOT NULL,
  `reversed` tinyint NOT NULL DEFAULT '0',
  `reversible` tinyint NOT NULL DEFAULT '0',
  `submitted_on` date DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_gateway_data` text COLLATE utf8mb4_unicode_ci,
  `online_transaction` tinyint NOT NULL DEFAULT '0',
  `status` enum('pending','approved','declined') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `savings_transactions_savings_id_index` (`savings_id`),
  KEY `savings_transactions_branch_id_index` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_transactions`
--

LOCK TABLES `savings_transactions` WRITE;
/*!40000 ALTER TABLE `savings_transactions` DISABLE KEYS */;
INSERT INTO `savings_transactions` VALUES (1,3,1,1,3,NULL,'Pay Charge',40.000000,NULL,40.000000,-40.000000,12,0,1,'2020-12-06','2020-12-06',NULL,NULL,NULL,NULL,0,'pending','2020-12-06 18:01:10','2020-12-15 16:20:53'),(2,3,1,1,NULL,11,'Deposit',80.000000,80.000000,NULL,40.000000,1,0,1,'2020-12-06','2020-12-06',NULL,NULL,NULL,NULL,0,'pending','2020-12-06 18:09:38','2020-12-15 16:20:53'),(3,3,1,1,NULL,12,'Withdrawal',10.000000,NULL,10.000000,30.000000,2,0,1,'2020-12-06','2020-12-06',NULL,NULL,NULL,NULL,0,'pending','2020-12-06 18:13:21','2020-12-15 16:20:53');
/*!40000 ALTER TABLE `savings_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int DEFAULT NULL,
  `category` enum('email','sms','general','system','update','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('text','textarea','number','select','radio','date','select_db','radio_db','select_multiple','select_multiple_db','checkbox','checkbox_db','file','info') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `class` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `required` tinyint NOT NULL DEFAULT '0',
  `db_columns` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `displayed` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_setting_key_unique` (`setting_key`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'Company Name','core.company_name','Core','Ultimate Loan Manager',NULL,'general','text','','','',1,'',NULL,1,NULL,NULL),(2,'Company Address','core.company_address','Core','sd',NULL,'general','textarea','','','',0,'',NULL,1,NULL,'2020-10-18 17:32:13'),(3,'Company Country','core.company_country','Core','5',NULL,'general','select_db','countries','','select2',0,'id,name',NULL,1,NULL,'2020-10-18 17:34:43'),(4,'Timezone','core.timezone','Core','45',NULL,'general','select_db','timezones','','select2',1,'id,zone_name',NULL,1,NULL,'2020-10-18 17:32:13'),(5,'System Version','core.system_version','Core','3.0',NULL,'update','info','','','',1,'',NULL,1,NULL,NULL),(6,'Company Email','core.company_email','Core','nonreply@company.com',NULL,'general','text','','','',1,'',NULL,1,NULL,NULL),(7,'Company Logo','core.company_logo','Core',NULL,NULL,'general','file','jpeg,jpg,bmp,png','nullable|file|mimes:jpeg,jpg,bmp,png','',0,'',NULL,1,NULL,'2020-10-18 17:34:34'),(8,'Site Online','core.site_online','Core','yes',NULL,'system','select','yes,no','','',1,'',NULL,1,NULL,NULL),(9,'Console Last Run','core.console_last_run','Core',NULL,NULL,'system','info','','','',1,'',NULL,1,NULL,'2021-01-15 15:28:29'),(10,'Update Url','core.update_url','Core','http://webstudio.co.zw/ulm/update',NULL,'general','info','','','',1,'',NULL,0,NULL,NULL),(11,'Auto Download Update','core.auto_download_update','Core','no',NULL,'system','select','yes,no','','',1,'',NULL,1,NULL,NULL),(12,'Update last checked','core.update_last_checked','Core',NULL,NULL,'system','info','','','',1,'',NULL,1,NULL,'2021-01-15 15:28:29'),(13,'Extra Javascript','core.extra_javascript','Core',NULL,NULL,'system','textarea','','','',0,'',NULL,1,NULL,'2021-01-15 15:28:29'),(14,'Extra Styles','core.extra_styles','Core',NULL,NULL,'system','textarea','','','',0,'',NULL,1,NULL,'2021-01-15 15:28:29'),(15,'Demo Mode','core.demo_mode','Core','no',NULL,'system','select','yes,no','','',1,'',NULL,1,NULL,NULL),(16,'Purchase Code','core.purchase_code','Core',NULL,NULL,'system','text','','','',0,'',NULL,1,NULL,'2021-01-15 15:28:29'),(17,'Registration Enabled','user.enable_registration','User','no',NULL,'system','select','yes,no',NULL,'',1,'',NULL,1,NULL,NULL),(18,'Enable Google recaptcha','user.enable_google_recaptcha','User','no',NULL,'system','select','yes,no',NULL,'',1,'',NULL,1,NULL,NULL),(19,'Google recaptcha site key','user.google_recaptcha_site_key','User',NULL,NULL,'system','text','',NULL,'',0,'',NULL,1,NULL,'2021-01-15 15:28:29'),(20,'Google recaptcha secret key','user.google_recaptcha_secret_key','User',NULL,NULL,'system','text','',NULL,'',0,'',NULL,1,NULL,'2021-01-15 15:28:29'),(21,'SMS Enabled','communication.sms_enabled','Communication','no',NULL,'sms','select','yes,no','','',1,'',NULL,1,NULL,NULL),(22,'Active SMS Gateway','communication.active_sms_gateway','Communication','1',NULL,'sms','select_db','sms_gateways','','select2',0,'id,name',NULL,1,NULL,NULL),(23,'Active Theme','core.active_theme','Core','AdminLTE',NULL,'system','text','','','',0,'',NULL,0,NULL,'2020-12-19 02:37:11'),(24,'Status','mpesa.status',NULL,'active',NULL,'other','select','active,inactive','','',1,'',NULL,0,NULL,'2020-12-04 13:29:46'),(25,'Name','mpesa.gateway_name',NULL,'Mpesa',NULL,'other','text','','','',1,'',NULL,0,NULL,NULL),(26,'Logo','mpesa.logo',NULL,NULL,NULL,'other','file','','','',0,'',NULL,0,NULL,'2020-12-04 13:29:46'),(27,'Consumer Key','mpesa.consumer_key',NULL,'5WgKtWpluUIpPUwuzHP4WdY6dACzQffY',NULL,'other','text','','','',0,'',NULL,0,NULL,'2020-12-04 13:29:46'),(28,'Consumer Secret','mpesa.consumer_secret',NULL,'rNXAfVcoyFkil3He',NULL,'other','text','','','',0,'',NULL,0,NULL,'2020-12-04 13:29:46'),(29,'Passkey','mpesa.passkey',NULL,'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919',NULL,'other','text','','','',0,'',NULL,0,NULL,'2020-12-04 14:13:27'),(30,'Business Shortcode','mpesa.business_shortcode',NULL,'174379',NULL,'other','text','','','',0,'',NULL,0,NULL,'2020-12-04 14:13:27'),(31,'Sandbox URl','mpesa.sandbox_url',NULL,'https://sandbox.safaricom.co.ke',NULL,'other','text','','','',0,'',NULL,0,NULL,NULL),(32,'Live URl','mpesa.live_url',NULL,'https://sandbox.safaricom.co.ke',NULL,'other','text','','','',0,'',NULL,0,NULL,NULL),(33,'Test Mode','mpesa.test_mode',NULL,'yes',NULL,'other','select','yes,no','','',0,'',NULL,0,NULL,NULL),(34,'Currency Code','mpesa.currency_code',NULL,'USD',NULL,'other','text','','','',1,'',NULL,0,NULL,NULL),(35,'Savings Reference Prefix','savings.reference_prefix','Savings',NULL,NULL,'system','text','','','',0,'',NULL,1,NULL,'2021-01-15 15:28:29'),(36,'Savings Reference Format','savings.reference_format','Savings','Branch Product Sequence Number',NULL,'system','select','YEAR/Sequence Number (SL/2014/001),YEAR/MONTH/Sequence Number (SL/2014/08/001),Sequence Number,Random Number,Branch Product Sequence Number','','',1,'',NULL,1,NULL,'2021-01-15 15:28:29'),(37,'Loan Reference Prefix','loan.reference_prefix','Loan','L',NULL,'system','text','','','',0,'',NULL,1,NULL,NULL),(38,'Loan Reference Format','loan.reference_format','Loan','YEAR/Sequence Number (SL/2014/001)',NULL,'system','select','YEAR/Sequence Number (SL/2014/001),YEAR/MONTH/Sequence Number (SL/2014/08/001),Sequence Number,Random Number,Branch Product Sequence Number','','',1,'',NULL,1,NULL,NULL),(39,'Client Reference Prefix','client.reference_prefix','Client','CL',NULL,'system','text','','','',0,'',NULL,1,NULL,NULL),(40,'Client Reference Format','client.reference_format','Client','YEAR/Sequence Number (SL/2014/001)',NULL,'system','select','YEAR/Sequence Number (SL/2014/001),YEAR/MONTH/Sequence Number (SL/2014/08/001),Sequence Number,Random Number,Branch Sequence Number','','',1,'',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_charge_options`
--

DROP TABLE IF EXISTS `share_charge_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_charge_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translated_name` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_charge_options`
--

LOCK TABLES `share_charge_options` WRITE;
/*!40000 ALTER TABLE `share_charge_options` DISABLE KEYS */;
INSERT INTO `share_charge_options` VALUES (1,'Flat','Flat',1,NULL,NULL),(2,'Percentage of amount','Percentage of amount',1,NULL,NULL);
/*!40000 ALTER TABLE `share_charge_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_charge_types`
--

DROP TABLE IF EXISTS `share_charge_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_charge_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translated_name` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_charge_types`
--

LOCK TABLES `share_charge_types` WRITE;
/*!40000 ALTER TABLE `share_charge_types` DISABLE KEYS */;
INSERT INTO `share_charge_types` VALUES (1,'Share Account Activation','Share Account Activation',1,NULL,NULL),(2,'Share Purchase','Share Purchase',1,NULL,NULL),(3,'Share Redeem','Share Redeem',1,NULL,NULL);
/*!40000 ALTER TABLE `share_charge_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_charges`
--

DROP TABLE IF EXISTS `share_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_charges` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `share_charge_type_id` bigint unsigned NOT NULL,
  `share_charge_option_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(65,6) NOT NULL,
  `min_amount` decimal(65,6) DEFAULT NULL,
  `max_amount` decimal(65,6) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '0',
  `allow_override` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_charges`
--

LOCK TABLES `share_charges` WRITE;
/*!40000 ALTER TABLE `share_charges` DISABLE KEYS */;
INSERT INTO `share_charges` VALUES (1,1,1,1,2,'Test',20.000000,NULL,NULL,1,0,'2020-09-15 10:54:01','2020-09-15 10:54:01'),(2,1,1,1,1,'nice',40.000000,NULL,NULL,1,0,'2020-12-06 18:33:57','2020-12-06 18:33:57');
/*!40000 ALTER TABLE `share_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_linked_charges`
--

DROP TABLE IF EXISTS `share_linked_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_linked_charges` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `share_id` bigint unsigned DEFAULT NULL,
  `share_charge_id` bigint unsigned DEFAULT NULL,
  `share_charge_type_id` bigint unsigned DEFAULT NULL,
  `share_charge_option_id` bigint unsigned DEFAULT NULL,
  `share_transaction_id` bigint unsigned DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `amount` decimal(65,6) NOT NULL,
  `calculated_amount` decimal(65,6) DEFAULT NULL,
  `paid_amount` decimal(65,6) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '0',
  `waived` tinyint NOT NULL DEFAULT '0',
  `is_paid` tinyint NOT NULL DEFAULT '0',
  `submitted_on` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_linked_charges`
--

LOCK TABLES `share_linked_charges` WRITE;
/*!40000 ALTER TABLE `share_linked_charges` DISABLE KEYS */;
INSERT INTO `share_linked_charges` VALUES (2,NULL,NULL,1,1,1,2,2,'Test',20.000000,20.000000,20.000000,0,0,1,NULL,'2020-10-02 10:38:40','2020-10-07 11:15:10'),(4,NULL,NULL,2,1,1,2,6,'Test',20.000000,20.000000,20.000000,0,0,1,NULL,'2020-12-07 10:28:54','2020-12-07 12:49:45');
/*!40000 ALTER TABLE `share_linked_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_market_periods`
--

DROP TABLE IF EXISTS `share_market_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_market_periods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `share_product_id` bigint unsigned DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `nominal_price` decimal(65,6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_market_periods`
--

LOCK TABLES `share_market_periods` WRITE;
/*!40000 ALTER TABLE `share_market_periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `share_market_periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_product_linked_charges`
--

DROP TABLE IF EXISTS `share_product_linked_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_product_linked_charges` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `share_product_id` bigint unsigned NOT NULL,
  `share_charge_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_product_linked_charges`
--

LOCK TABLES `share_product_linked_charges` WRITE;
/*!40000 ALTER TABLE `share_product_linked_charges` DISABLE KEYS */;
INSERT INTO `share_product_linked_charges` VALUES (5,1,1,'2020-12-16 07:50:01','2020-12-16 07:50:01');
/*!40000 ALTER TABLE `share_product_linked_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_products`
--

DROP TABLE IF EXISTS `share_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `share_reference_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `share_suspense_control_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `equity_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `income_from_fees_chart_of_account_id` bigint unsigned DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `decimals` int DEFAULT NULL,
  `total_shares` int DEFAULT NULL,
  `shares_to_be_issued` int DEFAULT NULL,
  `nominal_price` decimal(65,6) DEFAULT NULL,
  `capital_value` decimal(65,6) DEFAULT NULL,
  `minimum_shares_per_client` decimal(65,6) DEFAULT NULL,
  `default_shares_per_client` decimal(65,6) DEFAULT NULL,
  `maximum_shares_per_client` decimal(65,6) DEFAULT NULL,
  `minimum_active_period` int DEFAULT NULL,
  `minimum_active_period_type` enum('days','weeks','months','years') COLLATE utf8mb4_unicode_ci DEFAULT 'days',
  `lockin_period` int NOT NULL DEFAULT '0',
  `lockin_type` enum('days','weeks','months','years') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'days',
  `allow_dividends_for_inactive_clients` tinyint NOT NULL DEFAULT '0',
  `accounting_rule` enum('none','cash') COLLATE utf8mb4_unicode_ci DEFAULT 'none',
  `active` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_products`
--

LOCK TABLES `share_products` WRITE;
/*!40000 ALTER TABLE `share_products` DISABLE KEYS */;
INSERT INTO `share_products` VALUES (1,1,1,NULL,NULL,NULL,NULL,'Test','test','test',2,400,350,40.000000,14000.000000,10.000000,200.000000,300.000000,1,'days',0,'days',0,'none',1,'2020-09-15 11:57:59','2020-12-16 07:50:01');
/*!40000 ALTER TABLE `share_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_transaction_types`
--

DROP TABLE IF EXISTS `share_transaction_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_transaction_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `translated_name` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_transaction_types`
--

LOCK TABLES `share_transaction_types` WRITE;
/*!40000 ALTER TABLE `share_transaction_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `share_transaction_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_transactions`
--

DROP TABLE IF EXISTS `share_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `share_id` bigint unsigned NOT NULL,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `share_linked_charge_id` bigint unsigned DEFAULT NULL,
  `payment_detail_id` bigint unsigned DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `amount` decimal(65,6) NOT NULL,
  `credit` decimal(65,6) DEFAULT NULL,
  `debit` decimal(65,6) DEFAULT NULL,
  `balance` decimal(65,6) DEFAULT NULL,
  `share_transaction_type_id` bigint unsigned NOT NULL,
  `reversed` tinyint NOT NULL DEFAULT '0',
  `reversible` tinyint NOT NULL DEFAULT '0',
  `submitted_on` date DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_gateway_data` text COLLATE utf8mb4_unicode_ci,
  `online_transaction` tinyint NOT NULL DEFAULT '0',
  `status` enum('pending','approved','declined') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `charge_amount` decimal(10,0) DEFAULT NULL,
  `total_shares` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `share_transactions_share_id_index` (`share_id`),
  KEY `share_transactions_branch_id_index` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_transactions`
--

LOCK TABLES `share_transactions` WRITE;
/*!40000 ALTER TABLE `share_transactions` DISABLE KEYS */;
INSERT INTO `share_transactions` VALUES (1,1,1,1,NULL,NULL,'Share Purchase',8000.000000,8000.000000,NULL,NULL,1,0,1,'2020-10-07','2020-10-07',NULL,NULL,NULL,NULL,0,'pending','2020-10-07 11:15:10','2020-10-07 11:15:10',NULL,200),(2,1,1,1,2,NULL,'Apply Charge',1600.000000,NULL,1600.000000,NULL,4,0,1,'2020-10-07','2020-10-07',NULL,NULL,NULL,NULL,0,'pending','2020-10-07 11:15:10','2020-10-07 11:15:10',NULL,NULL),(3,1,1,1,NULL,NULL,'Share Redeem',800.000000,800.000000,NULL,NULL,2,0,1,'2020-10-08','2020-10-08',NULL,NULL,NULL,NULL,0,'pending','2020-10-08 13:15:09','2020-10-08 13:15:09',NULL,20),(4,1,1,1,NULL,NULL,'Share Purchase',2000.000000,2000.000000,NULL,NULL,1,0,1,'2020-10-08','2020-10-08',NULL,NULL,NULL,NULL,0,'pending','2020-10-08 13:19:35','2020-10-08 13:19:35',NULL,50),(5,2,1,1,NULL,NULL,'Share Purchase',8000.000000,8000.000000,NULL,NULL,1,0,1,'2020-12-07','2020-12-07',NULL,NULL,NULL,NULL,0,'pending','2020-12-07 12:49:45','2020-12-07 12:49:45',NULL,200),(6,2,1,1,4,NULL,'Apply Charge',1600.000000,NULL,1600.000000,NULL,4,0,1,'2020-12-07','2020-12-07',NULL,NULL,NULL,NULL,0,'pending','2020-12-07 12:49:45','2020-12-07 12:49:45',NULL,NULL);
/*!40000 ALTER TABLE `share_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shares`
--

DROP TABLE IF EXISTS `shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shares` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `share_officer_id` bigint unsigned DEFAULT NULL,
  `share_product_id` bigint unsigned DEFAULT NULL,
  `savings_id` bigint unsigned DEFAULT NULL,
  `client_type` enum('client','group') COLLATE utf8mb4_unicode_ci DEFAULT 'client',
  `client_id` bigint unsigned DEFAULT NULL,
  `group_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimals` int DEFAULT NULL,
  `total_shares` int DEFAULT NULL,
  `nominal_price` decimal(65,6) DEFAULT NULL,
  `minimum_active_period` int DEFAULT NULL,
  `minimum_active_period_type` enum('days','weeks','months','years') COLLATE utf8mb4_unicode_ci DEFAULT 'days',
  `lockin_period` int NOT NULL DEFAULT '0',
  `lockin_type` enum('days','weeks','months','years') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'days',
  `allow_dividends_for_inactive_clients` tinyint NOT NULL DEFAULT '0',
  `submitted_on_date` date DEFAULT NULL,
  `application_date` date DEFAULT NULL,
  `submitted_by_user_id` bigint unsigned DEFAULT NULL,
  `approved_on_date` date DEFAULT NULL,
  `approved_by_user_id` bigint unsigned DEFAULT NULL,
  `approved_notes` text COLLATE utf8mb4_unicode_ci,
  `activated_on_date` date DEFAULT NULL,
  `activated_by_user_id` bigint unsigned DEFAULT NULL,
  `activated_notes` text COLLATE utf8mb4_unicode_ci,
  `rejected_on_date` date DEFAULT NULL,
  `rejected_by_user_id` bigint unsigned DEFAULT NULL,
  `rejected_notes` text COLLATE utf8mb4_unicode_ci,
  `dormant_on_date` date DEFAULT NULL,
  `dormant_by_user_id` bigint unsigned DEFAULT NULL,
  `dormant_notes` text COLLATE utf8mb4_unicode_ci,
  `closed_on_date` date DEFAULT NULL,
  `closed_by_user_id` bigint unsigned DEFAULT NULL,
  `closed_notes` text COLLATE utf8mb4_unicode_ci,
  `inactive_on_date` date DEFAULT NULL,
  `inactive_by_user_id` bigint unsigned DEFAULT NULL,
  `inactive_notes` text COLLATE utf8mb4_unicode_ci,
  `withdrawn_on_date` date DEFAULT NULL,
  `withdrawn_by_user_id` bigint unsigned DEFAULT NULL,
  `withdrawn_notes` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','approved','active','withdrawn','rejected','closed','inactive','dormant','submitted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'submitted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shares_client_id_index` (`client_id`),
  KEY `shares_branch_id_index` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shares`
--

LOCK TABLES `shares` WRITE;
/*!40000 ALTER TABLE `shares` DISABLE KEYS */;
INSERT INTO `shares` VALUES (1,1,1,NULL,1,1,'client',1,NULL,1,NULL,NULL,2,230,40.000000,1,'days',0,'days',0,'2020-10-02','2020-10-02',1,'2020-10-03',1,'ggg','2020-10-07',1,'ff',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2020-10-02 07:49:36','2020-10-08 13:19:35'),(2,1,1,3,1,3,'client',2,NULL,1,NULL,NULL,2,200,40.000000,1,'days',0,'days',0,'2020-12-07','2020-12-07',1,'2020-12-07',1,'f f','2020-12-07',1,'this is nc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2020-12-07 10:07:48','2020-12-07 12:49:44');
/*!40000 ALTER TABLE `shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_gateways`
--

DROP TABLE IF EXISTS `sms_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_gateways` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `to_name` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `msg_name` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint NOT NULL DEFAULT '0',
  `is_current` tinyint NOT NULL DEFAULT '0',
  `http_api` tinyint NOT NULL DEFAULT '1',
  `class_name` text COLLATE utf8mb4_unicode_ci,
  `key_one` text COLLATE utf8mb4_unicode_ci,
  `key_one_description` text COLLATE utf8mb4_unicode_ci,
  `key_two` text COLLATE utf8mb4_unicode_ci,
  `key_two_description` text COLLATE utf8mb4_unicode_ci,
  `key_three` text COLLATE utf8mb4_unicode_ci,
  `key_three_description` text COLLATE utf8mb4_unicode_ci,
  `key_four` text COLLATE utf8mb4_unicode_ci,
  `key_four_description` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_gateways_created_by_id_foreign` (`created_by_id`),
  CONSTRAINT `sms_gateways_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_gateways`
--

LOCK TABLES `sms_gateways` WRITE;
/*!40000 ALTER TABLE `sms_gateways` DISABLE KEYS */;
INSERT INTO `sms_gateways` VALUES (1,1,'Route','number','https://api.rmlconnect.net/bulksms/bulksms?username=webz-web&amp;amp;amp;password=heroes20&amp;amp;amp;type=0&amp;amp;amp;dlr=1&amp;amp;amp;destination=263774175438&amp;amp;amp;source=webstudio&amp;amp;amp;message=test','msg',1,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-10-22 12:16:41','2020-12-14 10:13:30');
/*!40000 ALTER TABLE `sms_gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci,
  `code` text COLLATE utf8mb4_unicode_ci,
  `amount` decimal(65,2) DEFAULT NULL,
  `type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `active` tinyint NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_entries`
--

DROP TABLE IF EXISTS `telescope_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_entries` (
  `sequence` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`),
  UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  KEY `telescope_entries_batch_id_index` (`batch_id`),
  KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`),
  KEY `telescope_entries_family_hash_index` (`family_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_entries`
--

LOCK TABLES `telescope_entries` WRITE;
/*!40000 ALTER TABLE `telescope_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_entries_tags`
--

DROP TABLE IF EXISTS `telescope_entries_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`),
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_entries_tags`
--

LOCK TABLES `telescope_entries_tags` WRITE;
/*!40000 ALTER TABLE `telescope_entries_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope_entries_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_monitoring`
--

DROP TABLE IF EXISTS `telescope_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_monitoring` (
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_monitoring`
--

LOCK TABLES `telescope_monitoring` WRITE;
/*!40000 ALTER TABLE `telescope_monitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope_monitoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timezones`
--

DROP TABLE IF EXISTS `timezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timezones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezones`
--

LOCK TABLES `timezones` WRITE;
/*!40000 ALTER TABLE `timezones` DISABLE KEYS */;
INSERT INTO `timezones` VALUES (1,'1','AD','Europe/Andorra'),(2,'2','AE','Asia/Dubai'),(3,'3','AF','Asia/Kabul'),(4,'4','AG','America/Antigua'),(5,'5','AI','America/Anguilla'),(6,'6','AL','Europe/Tirane'),(7,'7','AM','Asia/Yerevan'),(8,'8','AO','Africa/Luanda'),(9,'9','AQ','Antarctica/McMurdo'),(10,'10','AQ','Antarctica/Casey'),(11,'11','AQ','Antarctica/Davis'),(12,'12','AQ','Antarctica/DumontDUrville'),(13,'13','AQ','Antarctica/Mawson'),(14,'14','AQ','Antarctica/Palmer'),(15,'15','AQ','Antarctica/Rothera'),(16,'16','AQ','Antarctica/Syowa'),(17,'17','AQ','Antarctica/Troll'),(18,'18','AQ','Antarctica/Vostok'),(19,'19','AR','America/Argentina/Buenos_Aires'),(20,'20','AR','America/Argentina/Cordoba'),(21,'21','AR','America/Argentina/Salta'),(22,'22','AR','America/Argentina/Jujuy'),(23,'23','AR','America/Argentina/Tucuman'),(24,'24','AR','America/Argentina/Catamarca'),(25,'25','AR','America/Argentina/La_Rioja'),(26,'26','AR','America/Argentina/San_Juan'),(27,'27','AR','America/Argentina/Mendoza'),(28,'28','AR','America/Argentina/San_Luis'),(29,'29','AR','America/Argentina/Rio_Gallegos'),(30,'30','AR','America/Argentina/Ushuaia'),(31,'31','AS','Pacific/Pago_Pago'),(32,'32','AT','Europe/Vienna'),(33,'33','AU','Australia/Lord_Howe'),(34,'34','AU','Antarctica/Macquarie'),(35,'35','AU','Australia/Hobart'),(36,'36','AU','Australia/Currie'),(37,'37','AU','Australia/Melbourne'),(38,'38','AU','Australia/Sydney'),(39,'39','AU','Australia/Broken_Hill'),(40,'40','AU','Australia/Brisbane'),(41,'41','AU','Australia/Lindeman'),(42,'42','AU','Australia/Adelaide'),(43,'43','AU','Australia/Darwin'),(44,'44','AU','Australia/Perth'),(45,'45','AU','Australia/Eucla'),(46,'46','AW','America/Aruba'),(47,'47','AX','Europe/Mariehamn'),(48,'48','AZ','Asia/Baku'),(49,'49','BA','Europe/Sarajevo'),(50,'50','BB','America/Barbados'),(51,'51','BD','Asia/Dhaka'),(52,'52','BE','Europe/Brussels'),(53,'53','BF','Africa/Ouagadougou'),(54,'54','BG','Europe/Sofia'),(55,'55','BH','Asia/Bahrain'),(56,'56','BI','Africa/Bujumbura'),(57,'57','BJ','Africa/Porto-Novo'),(58,'58','BL','America/St_Barthelemy'),(59,'59','BM','Atlantic/Bermuda'),(60,'60','BN','Asia/Brunei'),(61,'61','BO','America/La_Paz'),(62,'62','BQ','America/Kralendijk'),(63,'63','BR','America/Noronha'),(64,'64','BR','America/Belem'),(65,'65','BR','America/Fortaleza'),(66,'66','BR','America/Recife'),(67,'67','BR','America/Araguaina'),(68,'68','BR','America/Maceio'),(69,'69','BR','America/Bahia'),(70,'70','BR','America/Sao_Paulo'),(71,'71','BR','America/Campo_Grande'),(72,'72','BR','America/Cuiaba'),(73,'73','BR','America/Santarem'),(74,'74','BR','America/Porto_Velho'),(75,'75','BR','America/Boa_Vista'),(76,'76','BR','America/Manaus'),(77,'77','BR','America/Eirunepe'),(78,'78','BR','America/Rio_Branco'),(79,'79','BS','America/Nassau'),(80,'80','BT','Asia/Thimphu'),(81,'81','BW','Africa/Gaborone'),(82,'82','BY','Europe/Minsk'),(83,'83','BZ','America/Belize'),(84,'84','CA','America/St_Johns'),(85,'85','CA','America/Halifax'),(86,'86','CA','America/Glace_Bay'),(87,'87','CA','America/Moncton'),(88,'88','CA','America/Goose_Bay'),(89,'89','CA','America/Blanc-Sablon'),(90,'90','CA','America/Toronto'),(91,'91','CA','America/Nipigon'),(92,'92','CA','America/Thunder_Bay'),(93,'93','CA','America/Iqaluit'),(94,'94','CA','America/Pangnirtung'),(95,'95','CA','America/Atikokan'),(96,'96','CA','America/Winnipeg'),(97,'97','CA','America/Rainy_River'),(98,'98','CA','America/Resolute'),(99,'99','CA','America/Rankin_Inlet'),(100,'100','CA','America/Regina'),(101,'101','CA','America/Swift_Current'),(102,'102','CA','America/Edmonton'),(103,'103','CA','America/Cambridge_Bay'),(104,'104','CA','America/Yellowknife'),(105,'105','CA','America/Inuvik'),(106,'106','CA','America/Creston'),(107,'107','CA','America/Dawson_Creek'),(108,'108','CA','America/Fort_Nelson'),(109,'109','CA','America/Vancouver'),(110,'110','CA','America/Whitehorse'),(111,'111','CA','America/Dawson'),(112,'112','CC','Indian/Cocos'),(113,'113','CD','Africa/Kinshasa'),(114,'114','CD','Africa/Lubumbashi'),(115,'115','CF','Africa/Bangui'),(116,'116','CG','Africa/Brazzaville'),(117,'117','CH','Europe/Zurich'),(118,'118','CI','Africa/Abidjan'),(119,'119','CK','Pacific/Rarotonga'),(120,'120','CL','America/Santiago'),(121,'121','CL','America/Punta_Arenas'),(122,'122','CL','Pacific/Easter'),(123,'123','CM','Africa/Douala'),(124,'124','CN','Asia/Shanghai'),(125,'125','CN','Asia/Urumqi'),(126,'126','CO','America/Bogota'),(127,'127','CR','America/Costa_Rica'),(128,'128','CU','America/Havana'),(129,'129','CV','Atlantic/Cape_Verde'),(130,'130','CW','America/Curacao'),(131,'131','CX','Indian/Christmas'),(132,'132','CY','Asia/Nicosia'),(133,'133','CY','Asia/Famagusta'),(134,'134','CZ','Europe/Prague'),(135,'135','DE','Europe/Berlin'),(136,'136','DE','Europe/Busingen'),(137,'137','DJ','Africa/Djibouti'),(138,'138','DK','Europe/Copenhagen'),(139,'139','DM','America/Dominica'),(140,'140','DO','America/Santo_Domingo'),(141,'141','DZ','Africa/Algiers'),(142,'142','EC','America/Guayaquil'),(143,'143','EC','Pacific/Galapagos'),(144,'144','EE','Europe/Tallinn'),(145,'145','EG','Africa/Cairo'),(146,'146','EH','Africa/El_Aaiun'),(147,'147','ER','Africa/Asmara'),(148,'148','ES','Europe/Madrid'),(149,'149','ES','Africa/Ceuta'),(150,'150','ES','Atlantic/Canary'),(151,'151','ET','Africa/Addis_Ababa'),(152,'152','FI','Europe/Helsinki'),(153,'153','FJ','Pacific/Fiji'),(154,'154','FK','Atlantic/Stanley'),(155,'155','FM','Pacific/Chuuk'),(156,'156','FM','Pacific/Pohnpei'),(157,'157','FM','Pacific/Kosrae'),(158,'158','FO','Atlantic/Faroe'),(159,'159','FR','Europe/Paris'),(160,'160','GA','Africa/Libreville'),(161,'161','GB','Europe/London'),(162,'162','GD','America/Grenada'),(163,'163','GE','Asia/Tbilisi'),(164,'164','GF','America/Cayenne'),(165,'165','GG','Europe/Guernsey'),(166,'166','GH','Africa/Accra'),(167,'167','GI','Europe/Gibraltar'),(168,'168','GL','America/Godthab'),(169,'169','GL','America/Danmarkshavn'),(170,'170','GL','America/Scoresbysund'),(171,'171','GL','America/Thule'),(172,'172','GM','Africa/Banjul'),(173,'173','GN','Africa/Conakry'),(174,'174','GP','America/Guadeloupe'),(175,'175','GQ','Africa/Malabo'),(176,'176','GR','Europe/Athens'),(177,'177','GS','Atlantic/South_Georgia'),(178,'178','GT','America/Guatemala'),(179,'179','GU','Pacific/Guam'),(180,'180','GW','Africa/Bissau'),(181,'181','GY','America/Guyana'),(182,'182','HK','Asia/Hong_Kong'),(183,'183','HN','America/Tegucigalpa'),(184,'184','HR','Europe/Zagreb'),(185,'185','HT','America/Port-au-Prince'),(186,'186','HU','Europe/Budapest'),(187,'187','ID','Asia/Jakarta'),(188,'188','ID','Asia/Pontianak'),(189,'189','ID','Asia/Makassar'),(190,'190','ID','Asia/Jayapura'),(191,'191','IE','Europe/Dublin'),(192,'192','IL','Asia/Jerusalem'),(193,'193','IM','Europe/Isle_of_Man'),(194,'194','IN','Asia/Kolkata'),(195,'195','IO','Indian/Chagos'),(196,'196','IQ','Asia/Baghdad'),(197,'197','IR','Asia/Tehran'),(198,'198','IS','Atlantic/Reykjavik'),(199,'199','IT','Europe/Rome'),(200,'200','JE','Europe/Jersey'),(201,'201','JM','America/Jamaica'),(202,'202','JO','Asia/Amman'),(203,'203','JP','Asia/Tokyo'),(204,'204','KE','Africa/Nairobi'),(205,'205','KG','Asia/Bishkek'),(206,'206','KH','Asia/Phnom_Penh'),(207,'207','KI','Pacific/Tarawa'),(208,'208','KI','Pacific/Enderbury'),(209,'209','KI','Pacific/Kiritimati'),(210,'210','KM','Indian/Comoro'),(211,'211','KN','America/St_Kitts'),(212,'212','KP','Asia/Pyongyang'),(213,'213','KR','Asia/Seoul'),(214,'214','KW','Asia/Kuwait'),(215,'215','KY','America/Cayman'),(216,'216','KZ','Asia/Almaty'),(217,'217','KZ','Asia/Qyzylorda'),(218,'218','KZ','Asia/Qostanay'),(219,'219','KZ','Asia/Aqtobe'),(220,'220','KZ','Asia/Aqtau'),(221,'221','KZ','Asia/Atyrau'),(222,'222','KZ','Asia/Oral'),(223,'223','LA','Asia/Vientiane'),(224,'224','LB','Asia/Beirut'),(225,'225','LC','America/St_Lucia'),(226,'226','LI','Europe/Vaduz'),(227,'227','LK','Asia/Colombo'),(228,'228','LR','Africa/Monrovia'),(229,'229','LS','Africa/Maseru'),(230,'230','LT','Europe/Vilnius'),(231,'231','LU','Europe/Luxembourg'),(232,'232','LV','Europe/Riga'),(233,'233','LY','Africa/Tripoli'),(234,'234','MA','Africa/Casablanca'),(235,'235','MC','Europe/Monaco'),(236,'236','MD','Europe/Chisinau'),(237,'237','ME','Europe/Podgorica'),(238,'238','MF','America/Marigot'),(239,'239','MG','Indian/Antananarivo'),(240,'240','MH','Pacific/Majuro'),(241,'241','MH','Pacific/Kwajalein'),(242,'242','MK','Europe/Skopje'),(243,'243','ML','Africa/Bamako'),(244,'244','MM','Asia/Yangon'),(245,'245','MN','Asia/Ulaanbaatar'),(246,'246','MN','Asia/Hovd'),(247,'247','MN','Asia/Choibalsan'),(248,'248','MO','Asia/Macau'),(249,'249','MP','Pacific/Saipan'),(250,'250','MQ','America/Martinique'),(251,'251','MR','Africa/Nouakchott'),(252,'252','MS','America/Montserrat'),(253,'253','MT','Europe/Malta'),(254,'254','MU','Indian/Mauritius'),(255,'255','MV','Indian/Maldives'),(256,'256','MW','Africa/Blantyre'),(257,'257','MX','America/Mexico_City'),(258,'258','MX','America/Cancun'),(259,'259','MX','America/Merida'),(260,'260','MX','America/Monterrey'),(261,'261','MX','America/Matamoros'),(262,'262','MX','America/Mazatlan'),(263,'263','MX','America/Chihuahua'),(264,'264','MX','America/Ojinaga'),(265,'265','MX','America/Hermosillo'),(266,'266','MX','America/Tijuana'),(267,'267','MX','America/Bahia_Banderas'),(268,'268','MY','Asia/Kuala_Lumpur'),(269,'269','MY','Asia/Kuching'),(270,'270','MZ','Africa/Maputo'),(271,'271','NA','Africa/Windhoek'),(272,'272','NC','Pacific/Noumea'),(273,'273','NE','Africa/Niamey'),(274,'274','NF','Pacific/Norfolk'),(275,'275','NG','Africa/Lagos'),(276,'276','NI','America/Managua'),(277,'277','NL','Europe/Amsterdam'),(278,'278','NO','Europe/Oslo'),(279,'279','NP','Asia/Kathmandu'),(280,'280','NR','Pacific/Nauru'),(281,'281','NU','Pacific/Niue'),(282,'282','NZ','Pacific/Auckland'),(283,'283','NZ','Pacific/Chatham'),(284,'284','OM','Asia/Muscat'),(285,'285','PA','America/Panama'),(286,'286','PE','America/Lima'),(287,'287','PF','Pacific/Tahiti'),(288,'288','PF','Pacific/Marquesas'),(289,'289','PF','Pacific/Gambier'),(290,'290','PG','Pacific/Port_Moresby'),(291,'291','PG','Pacific/Bougainville'),(292,'292','PH','Asia/Manila'),(293,'293','PK','Asia/Karachi'),(294,'294','PL','Europe/Warsaw'),(295,'295','PM','America/Miquelon'),(296,'296','PN','Pacific/Pitcairn'),(297,'297','PR','America/Puerto_Rico'),(298,'298','PS','Asia/Gaza'),(299,'299','PS','Asia/Hebron'),(300,'300','PT','Europe/Lisbon'),(301,'301','PT','Atlantic/Madeira'),(302,'302','PT','Atlantic/Azores'),(303,'303','PW','Pacific/Palau'),(304,'304','PY','America/Asuncion'),(305,'305','QA','Asia/Qatar'),(306,'306','RE','Indian/Reunion'),(307,'307','RO','Europe/Bucharest'),(308,'308','RS','Europe/Belgrade'),(309,'309','RU','Europe/Kaliningrad'),(310,'310','RU','Europe/Moscow'),(311,'311','UA','Europe/Simferopol'),(312,'312','RU','Europe/Kirov'),(313,'313','RU','Europe/Astrakhan'),(314,'314','RU','Europe/Volgograd'),(315,'315','RU','Europe/Saratov'),(316,'316','RU','Europe/Ulyanovsk'),(317,'317','RU','Europe/Samara'),(318,'318','RU','Asia/Yekaterinburg'),(319,'319','RU','Asia/Omsk'),(320,'320','RU','Asia/Novosibirsk'),(321,'321','RU','Asia/Barnaul'),(322,'322','RU','Asia/Tomsk'),(323,'323','RU','Asia/Novokuznetsk'),(324,'324','RU','Asia/Krasnoyarsk'),(325,'325','RU','Asia/Irkutsk'),(326,'326','RU','Asia/Chita'),(327,'327','RU','Asia/Yakutsk'),(328,'328','RU','Asia/Khandyga'),(329,'329','RU','Asia/Vladivostok'),(330,'330','RU','Asia/Ust-Nera'),(331,'331','RU','Asia/Magadan'),(332,'332','RU','Asia/Sakhalin'),(333,'333','RU','Asia/Srednekolymsk'),(334,'334','RU','Asia/Kamchatka'),(335,'335','RU','Asia/Anadyr'),(336,'336','RW','Africa/Kigali'),(337,'337','SA','Asia/Riyadh'),(338,'338','SB','Pacific/Guadalcanal'),(339,'339','SC','Indian/Mahe'),(340,'340','SD','Africa/Khartoum'),(341,'341','SE','Europe/Stockholm'),(342,'342','SG','Asia/Singapore'),(343,'343','SH','Atlantic/St_Helena'),(344,'344','SI','Europe/Ljubljana'),(345,'345','SJ','Arctic/Longyearbyen'),(346,'346','SK','Europe/Bratislava'),(347,'347','SL','Africa/Freetown'),(348,'348','SM','Europe/San_Marino'),(349,'349','SN','Africa/Dakar'),(350,'350','SO','Africa/Mogadishu'),(351,'351','SR','America/Paramaribo'),(352,'352','SS','Africa/Juba'),(353,'353','ST','Africa/Sao_Tome'),(354,'354','SV','America/El_Salvador'),(355,'355','SX','America/Lower_Princes'),(356,'356','SY','Asia/Damascus'),(357,'357','SZ','Africa/Mbabane'),(358,'358','TC','America/Grand_Turk'),(359,'359','TD','Africa/Ndjamena'),(360,'360','TF','Indian/Kerguelen'),(361,'361','TG','Africa/Lome'),(362,'362','TH','Asia/Bangkok'),(363,'363','TJ','Asia/Dushanbe'),(364,'364','TK','Pacific/Fakaofo'),(365,'365','TL','Asia/Dili'),(366,'366','TM','Asia/Ashgabat'),(367,'367','TN','Africa/Tunis'),(368,'368','TO','Pacific/Tongatapu'),(369,'369','TR','Europe/Istanbul'),(370,'370','TT','America/Port_of_Spain'),(371,'371','TV','Pacific/Funafuti'),(372,'372','TW','Asia/Taipei'),(373,'373','TZ','Africa/Dar_es_Salaam'),(374,'374','UA','Europe/Kiev'),(375,'375','UA','Europe/Uzhgorod'),(376,'376','UA','Europe/Zaporozhye'),(377,'377','UG','Africa/Kampala'),(378,'378','UM','Pacific/Midway'),(379,'379','UM','Pacific/Wake'),(380,'380','US','America/New_York'),(381,'381','US','America/Detroit'),(382,'382','US','America/Kentucky/Louisville'),(383,'383','US','America/Kentucky/Monticello'),(384,'384','US','America/Indiana/Indianapolis'),(385,'385','US','America/Indiana/Vincennes'),(386,'386','US','America/Indiana/Winamac'),(387,'387','US','America/Indiana/Marengo'),(388,'388','US','America/Indiana/Petersburg'),(389,'389','US','America/Indiana/Vevay'),(390,'390','US','America/Chicago'),(391,'391','US','America/Indiana/Tell_City'),(392,'392','US','America/Indiana/Knox'),(393,'393','US','America/Menominee'),(394,'394','US','America/North_Dakota/Center'),(395,'395','US','America/North_Dakota/New_Salem'),(396,'396','US','America/North_Dakota/Beulah'),(397,'397','US','America/Denver'),(398,'398','US','America/Boise'),(399,'399','US','America/Phoenix'),(400,'400','US','America/Los_Angeles'),(401,'401','US','America/Anchorage'),(402,'402','US','America/Juneau'),(403,'403','US','America/Sitka'),(404,'404','US','America/Metlakatla'),(405,'405','US','America/Yakutat'),(406,'406','US','America/Nome'),(407,'407','US','America/Adak'),(408,'408','US','Pacific/Honolulu'),(409,'409','UY','America/Montevideo'),(410,'410','UZ','Asia/Samarkand'),(411,'411','UZ','Asia/Tashkent'),(412,'412','VA','Europe/Vatican'),(413,'413','VC','America/St_Vincent'),(414,'414','VE','America/Caracas'),(415,'415','VG','America/Tortola'),(416,'416','VI','America/St_Thomas'),(417,'417','VN','Asia/Ho_Chi_Minh'),(418,'418','VU','Pacific/Efate'),(419,'419','WF','Pacific/Wallis'),(420,'420','WS','Pacific/Apia'),(421,'421','YE','Asia/Aden'),(422,'422','YT','Indian/Mayotte'),(423,'423','ZA','Africa/Johannesburg'),(424,'424','ZM','Africa/Lusaka'),(425,'425','ZW','Africa/Harare');
/*!40000 ALTER TABLE `timezones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES (1,'Mr');
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_google2fa` tinyint NOT NULL DEFAULT '0',
  `google2fa_secret` text COLLATE utf8mb4_unicode_ci,
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_expiry_date` timestamp NULL DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `photo` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,1,'Admin','admin','admin@webstudio.co.zw','2020-09-02 06:59:25','$2y$10$T2q15LNsxs8ESY81K2Dyruk5Tj16rJoIdSyf7Rj/JQUVM0Gj1FtZi','k3gqUEHb5MaFHBG6S4O6zx7Wc6Riz70T2CisWvoPbHYM11znvXPZeRTs5z9d',NULL,'Admin','Admin','077',NULL,NULL,'male',0,'3UPQ7XOZGQD5LLNT',NULL,NULL,NULL,NULL,'qaGy1M2rqgxBp0kEctx6Qtd9V8dz2SOuylthdvOWa3SJgBBnMvibZPAsl8jc','2020-09-02 06:59:25','2020-10-15 19:33:18'),(2,NULL,NULL,'',NULL,'tjmugova@localhost.com','2020-10-14 07:36:47','$2y$10$2ztriAtdb9EaqywPp8oQkuNygIazjqSFeDsm64xto.YXryARIL3ya',NULL,NULL,'Tererai','Mugova','+263774175438','933 13th street\r\nGlenview 1',NULL,'male',0,NULL,NULL,NULL,'dd',NULL,'2RTLhsAEAMsqSohkKWh7R1azSUi2hfYCVNkyoN7KksTpVGflDuV3iIU6r85H','2020-10-14 07:36:47','2020-10-15 14:23:11'),(3,NULL,NULL,'',NULL,'maclaven@localhost.com','2020-10-14 07:37:30','$2y$10$JrDBboWv411pvXYf/FnSNOXVs.v/H.NtwYgvAufjcYM35O.9vqcBy',NULL,NULL,'Maclaven','Mugova','0774175438','933 13th street, Glenview 1',NULL,'male',0,NULL,NULL,NULL,NULL,NULL,NULL,'2020-10-14 07:37:30','2020-10-14 07:37:30'),(5,NULL,NULL,'',NULL,'tjmugova@local.com','2020-10-15 13:09:08','$2y$10$8M8FlCRE3xLJlNeryx.VCeVsvW7yaAVBY8DWEmM8KKU4aj5KES7iC',NULL,NULL,'Tererai','Mugova','+26377417543','ff',NULL,'male',0,NULL,NULL,NULL,'ff',NULL,NULL,'2020-10-15 13:09:08','2020-10-15 13:09:08'),(7,NULL,NULL,'',NULL,'tj@localhost.com','2020-10-21 14:23:51','$2y$10$5YMugFjnPLUlf/68E.Pz5e45bTkM9R.YkguFZV7sHf9E02RKlD9W6',NULL,NULL,'Maclaven','Mugova','0774175438','933 13th street, Glenview 1',NULL,'male',0,NULL,NULL,NULL,NULL,NULL,NULL,'2020-10-21 14:23:51','2020-10-21 14:23:51');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_transactions`
--

DROP TABLE IF EXISTS `wallet_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `wallet_id` bigint unsigned NOT NULL,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `payment_detail_id` bigint unsigned DEFAULT NULL,
  `transaction_type` enum('deposit','withdrawal','savings_transfer','loan_transfer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deposit',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(65,6) NOT NULL,
  `credit` decimal(65,6) DEFAULT NULL,
  `debit` decimal(65,6) DEFAULT NULL,
  `balance` decimal(65,6) DEFAULT NULL,
  `reversed` tinyint NOT NULL DEFAULT '0',
  `reversible` tinyint NOT NULL DEFAULT '0',
  `submitted_on` date DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_gateway_data` text COLLATE utf8mb4_unicode_ci,
  `online_transaction` tinyint NOT NULL DEFAULT '0',
  `status` enum('pending','approved','declined') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallet_transactions_wallet_id_index` (`wallet_id`),
  KEY `wallet_transactions_branch_id_index` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_transactions`
--

LOCK TABLES `wallet_transactions` WRITE;
/*!40000 ALTER TABLE `wallet_transactions` DISABLE KEYS */;
INSERT INTO `wallet_transactions` VALUES (1,1,1,1,10,'deposit','Deposit',40.000000,40.000000,NULL,40.000000,0,1,'2020-12-04','2020-12-04',NULL,NULL,NULL,NULL,0,'pending','2020-12-04 18:16:07','2020-12-04 18:20:06');
/*!40000 ALTER TABLE `wallet_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` bigint unsigned NOT NULL,
  `created_by_id` bigint unsigned DEFAULT NULL,
  `client_type` enum('client','group') COLLATE utf8mb4_unicode_ci DEFAULT 'client',
  `client_id` bigint unsigned DEFAULT NULL,
  `group_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `status` enum('pending','active','inactive','closed','suspended','rejected','approved') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `balance` decimal(65,6) DEFAULT NULL,
  `decimals` int NOT NULL DEFAULT '2',
  `description` text COLLATE utf8mb4_unicode_ci,
  `submitted_on_date` date DEFAULT NULL,
  `submitted_by_user_id` bigint unsigned DEFAULT NULL,
  `approved_on_date` date DEFAULT NULL,
  `approved_by_user_id` bigint unsigned DEFAULT NULL,
  `approved_notes` text COLLATE utf8mb4_unicode_ci,
  `rejected_on_date` date DEFAULT NULL,
  `rejected_by_user_id` bigint unsigned DEFAULT NULL,
  `rejected_notes` text COLLATE utf8mb4_unicode_ci,
  `closed_on_date` date DEFAULT NULL,
  `closed_by_user_id` bigint unsigned DEFAULT NULL,
  `closed_notes` text COLLATE utf8mb4_unicode_ci,
  `activated_on_date` date DEFAULT NULL,
  `activated_by_user_id` bigint unsigned DEFAULT NULL,
  `activated_notes` text COLLATE utf8mb4_unicode_ci,
  `suspended_on_date` date DEFAULT NULL,
  `suspended_by_user_id` bigint unsigned DEFAULT NULL,
  `suspended_notes` text COLLATE utf8mb4_unicode_ci,
  `inactive_on_date` date DEFAULT NULL,
  `inactive_by_user_id` bigint unsigned DEFAULT NULL,
  `inactive_notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallets_client_id_index` (`client_id`),
  KEY `wallets_branch_id_index` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT INTO `wallets` VALUES (1,1,1,'client',1,NULL,1,'active',40.000000,2,NULL,'2020-12-04',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-04 17:48:10','2020-12-04 18:20:06');
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `widgets` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `widgets_user_id_foreign` (`user_id`),
  CONSTRAINT `widgets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (2,1,'{\"LoanStatistics\":{\"class\":\"Loan::LoanStatistics\",\"name\":\"Loan Statistics\",\"x\":0,\"y\":0,\"width\":12,\"height\":2},\"LoanStatusOverview\":{\"class\":\"Loan::LoanStatusOverview\",\"name\":\"Loan Status Overview\",\"x\":0,\"y\":2,\"width\":4,\"height\":4},\"LoanCollectionOverview\":{\"class\":\"Loan::LoanCollectionOverview\",\"name\":\"Loan Collection Overview\",\"x\":4,\"y\":2,\"width\":8,\"height\":5}}','2020-12-09 07:26:10','2020-12-11 13:08:03');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-18  7:46:01
