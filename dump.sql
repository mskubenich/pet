-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pet_development
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `file_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_file_size` int(11) DEFAULT NULL,
  `file_updated_at` datetime DEFAULT NULL,
  `entity_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (61,18,'2015-06-11 07:26:16','2015-06-11 07:26:16','marketing-icon.png','image/png',4933,'2015-06-11 07:26:15','Copulation'),(62,18,'2015-06-11 07:26:16','2015-06-11 07:26:16','11356446_432182946960019_241246363_n.jpg','image/jpeg',82365,'2015-06-11 07:26:16','Copulation'),(63,18,'2015-06-11 07:26:16','2015-06-11 07:26:16','dog.png','image/png',3720,'2015-06-11 07:26:16','Copulation'),(64,18,'2015-06-11 07:26:16','2015-06-11 07:26:16','cat.png','image/png',2993,'2015-06-11 07:26:16','Copulation'),(65,18,'2015-06-11 07:26:16','2015-06-11 07:26:16','questions.png','image/png',183392,'2015-06-11 07:26:16','Copulation'),(66,18,'2015-06-11 07:26:16','2015-06-11 07:26:16','Tron-Legacy-promo.jpg','image/jpeg',49677,'2015-06-11 07:26:16','Copulation'),(67,18,'2015-06-11 07:26:16','2015-06-11 07:26:16','try.png','image/png',2727,'2015-06-11 07:26:16','Copulation'),(68,18,'2015-06-11 07:26:16','2015-06-11 07:26:16','our-first-look-at-colossus-on-the-deadpool-set.jpg','image/jpeg',29399,'2015-06-11 07:26:16','Copulation'),(69,18,'2015-06-11 07:26:16','2015-06-11 07:26:16','pes.png','image/png',214942,'2015-06-11 07:26:16','Copulation'),(70,18,'2015-06-11 07:26:16','2015-06-11 07:26:16','11356446_432182946960019_241246363_n.jpg','image/jpeg',82365,'2015-06-11 07:26:16','Copulation'),(71,18,'2015-06-11 07:26:17','2015-06-11 07:26:17','questions.png','image/png',183392,'2015-06-11 07:26:16','Copulation'),(72,18,'2015-06-11 07:26:17','2015-06-11 07:26:17','robert-downey-jr.jpg','image/jpeg',23661,'2015-06-11 07:26:17','Copulation'),(73,18,'2015-06-11 07:26:17','2015-06-11 07:26:17','Tron-Legacy-promo.jpg','image/jpeg',49677,'2015-06-11 07:26:17','Copulation'),(74,18,'2015-06-11 07:26:17','2015-06-11 07:26:17','try.png','image/png',2727,'2015-06-11 07:26:17','Copulation'),(75,18,'2015-06-11 07:26:17','2015-06-11 07:26:17','font.png','image/png',20783,'2015-06-11 07:26:17','Copulation'),(76,18,'2015-06-11 07:26:17','2015-06-11 07:26:17','EntityDesignerDiagram-1.jpg','image/jpeg',368178,'2015-06-11 07:26:17','Copulation'),(77,18,'2015-06-11 07:26:17','2015-06-11 07:26:17','dob_ui.png','image/png',686079,'2015-06-11 07:26:17','Copulation'),(78,18,'2015-06-11 07:26:17','2015-06-11 07:26:17','dob_ui1.png','image/png',965778,'2015-06-11 07:26:17','Copulation'),(79,18,'2015-06-11 07:26:17','2015-06-11 07:26:17','dog.png','image/png',3720,'2015-06-11 07:26:17','Copulation'),(100,19,'2015-06-16 14:14:59','2015-06-16 14:14:59','cat1.jpg','image/jpeg',13569,'2015-06-16 14:14:59','Copulation'),(101,20,'2015-06-16 14:15:11','2015-06-16 14:15:11','cat1.jpg','image/jpeg',13569,'2015-06-16 14:15:11','Copulation'),(104,21,'2015-06-16 15:15:47','2015-06-16 15:16:11','dog.png','image/png',3720,'2015-06-16 15:15:47','copulation_description'),(105,21,'2015-06-16 15:16:11','2015-06-16 15:16:11','cat3.jpg','image/jpeg',20636,'2015-06-16 15:16:11','Copulation'),(110,24,'2015-06-17 07:20:03','2015-06-17 07:20:19','Big_Wood__N2.JPG','image/jpeg',3829265,'2015-06-17 07:20:03','news'),(111,24,'2015-06-17 07:20:10','2015-06-17 07:20:19','avatar.png','image/png',92494,'2015-06-17 07:20:10','news'),(116,22,'2015-06-19 11:50:02','2015-06-19 11:50:02','cat1.jpg','image/jpeg',13569,'2015-06-19 11:50:02','Copulation'),(117,22,'2015-06-19 11:50:02','2015-06-19 11:50:02','cat2.jpg','image/jpeg',16785,'2015-06-19 11:50:02','Copulation'),(118,22,'2015-06-19 11:50:02','2015-06-19 11:50:02','cat3.jpg','image/jpeg',20636,'2015-06-19 11:50:02','Copulation'),(119,22,'2015-06-19 11:50:02','2015-06-19 11:50:02','cat4.jpg','image/jpeg',18636,'2015-06-19 11:50:02','Copulation'),(120,2,'2015-07-01 17:01:30','2015-07-01 17:01:30','cat1.jpg','image/jpeg',13569,'2015-07-01 17:01:30','GoodHand'),(121,4,'2015-07-01 17:05:55','2015-07-01 17:05:55','cat.png','image/png',2993,'2015-07-01 17:05:55','GoodHand'),(122,5,'2015-07-01 17:14:03','2015-07-01 17:14:03','key-icon.png','image/png',5742,'2015-07-01 17:14:03','GoodHand'),(128,14,'2015-07-01 18:18:43','2015-07-01 18:18:43','key.png','image/png',2657,'2015-07-01 18:18:43','GoodHand'),(129,15,'2015-07-02 08:52:52','2015-07-02 08:52:52','cat3.jpg','image/jpeg',20636,'2015-07-02 08:52:52','GoodHand'),(130,16,'2015-07-02 08:52:55','2015-07-02 08:52:55','cat3.jpg','image/jpeg',20636,'2015-07-02 08:52:55','GoodHand'),(131,17,'2015-07-02 08:52:57','2015-07-02 08:52:57','cat3.jpg','image/jpeg',20636,'2015-07-02 08:52:57','GoodHand'),(132,18,'2015-07-02 08:57:57','2015-07-02 08:57:57','Tron-Legacy-promo.jpg','image/jpeg',49677,'2015-07-02 08:57:57','GoodHand'),(133,19,'2015-07-02 08:58:55','2015-07-02 08:58:55','key.png','image/png',2657,'2015-07-02 08:58:55','GoodHand'),(136,19,'2015-07-04 14:14:10','2015-07-04 14:14:10','cat.png','image/png',2993,'2015-07-04 14:14:10','GoodHand'),(137,19,'2015-07-04 14:14:10','2015-07-04 14:14:10','cat3.jpg','image/jpeg',20636,'2015-07-04 14:14:10','GoodHand'),(144,6,'2015-07-05 14:43:59','2015-07-05 14:43:59','Big_Wood__N2.JPG','image/jpeg',3829265,'2015-07-05 14:43:58','Product'),(145,7,'2015-07-05 14:44:05','2015-07-05 14:44:05','Big_Wood__N2.JPG','image/jpeg',3829265,'2015-07-05 14:44:04','Product'),(146,8,'2015-07-05 14:44:09','2015-07-05 14:44:09','Big_Wood__N2.JPG','image/jpeg',3829265,'2015-07-05 14:44:09','Product'),(147,9,'2015-07-05 14:44:17','2015-07-05 14:44:17','Big_Wood__N2.JPG','image/jpeg',3829265,'2015-07-05 14:44:17','Product'),(148,10,'2015-07-05 14:44:22','2015-07-05 14:44:22','Big_Wood__N2.JPG','image/jpeg',3829265,'2015-07-05 14:44:21','Product'),(149,11,'2015-07-05 14:44:29','2015-07-05 14:44:29','Big_Wood__N2.JPG','image/jpeg',3829265,'2015-07-05 14:44:29','Product'),(150,12,'2015-07-05 14:44:39','2015-07-05 14:44:39','Big_Wood__N2.JPG','image/jpeg',3829265,'2015-07-05 14:44:39','Product'),(151,13,'2015-07-05 14:44:43','2015-07-05 14:44:43','cat1.jpg','image/jpeg',13569,'2015-07-05 14:44:43','Product'),(152,14,'2015-07-05 14:44:50','2015-07-05 14:44:50','11356446_432182946960019_241246363_n.jpg','image/jpeg',82365,'2015-07-05 14:44:50','Product'),(153,15,'2015-07-05 14:45:15','2015-07-05 14:45:15','shop1.png','image/png',44482,'2015-07-05 14:45:14','Product'),(154,16,'2015-07-05 14:45:23','2015-07-05 14:45:23','shop2.png','image/png',38509,'2015-07-05 14:45:23','Product'),(155,16,'2015-07-05 14:45:23','2015-07-05 14:45:23','shop1.png','image/png',44482,'2015-07-05 14:45:23','Product'),(156,17,'2015-07-05 14:45:24','2015-07-05 14:45:24','shop2.png','image/png',38509,'2015-07-05 14:45:24','Product'),(157,17,'2015-07-05 14:45:25','2015-07-05 14:45:25','shop1.png','image/png',44482,'2015-07-05 14:45:25','Product'),(158,18,'2015-07-05 14:45:26','2015-07-05 14:45:26','shop2.png','image/png',38509,'2015-07-05 14:45:26','Product'),(159,18,'2015-07-05 14:45:27','2015-07-05 14:45:27','shop1.png','image/png',44482,'2015-07-05 14:45:26','Product'),(160,19,'2015-07-05 14:45:30','2015-07-05 14:45:30','shop2.png','image/png',38509,'2015-07-05 14:45:30','Product'),(161,19,'2015-07-05 14:45:30','2015-07-05 14:45:30','shop1.png','image/png',44482,'2015-07-05 14:45:30','Product'),(162,20,'2015-07-05 14:45:31','2015-07-05 14:45:31','shop2.png','image/png',38509,'2015-07-05 14:45:31','Product'),(163,20,'2015-07-05 14:45:31','2015-07-05 14:45:31','shop1.png','image/png',44482,'2015-07-05 14:45:31','Product'),(164,21,'2015-07-05 14:45:33','2015-07-05 14:45:33','shop2.png','image/png',38509,'2015-07-05 14:45:33','Product'),(165,21,'2015-07-05 14:45:33','2015-07-05 14:45:33','shop1.png','image/png',44482,'2015-07-05 14:45:33','Product'),(166,22,'2015-07-05 14:45:35','2015-07-05 14:45:35','shop2.png','image/png',38509,'2015-07-05 14:45:35','Product'),(167,22,'2015-07-05 14:45:35','2015-07-05 14:45:35','shop1.png','image/png',44482,'2015-07-05 14:45:35','Product'),(168,23,'2015-07-05 14:45:36','2015-07-05 14:45:36','shop2.png','image/png',38509,'2015-07-05 14:45:36','Product'),(169,23,'2015-07-05 14:45:36','2015-07-05 14:45:36','shop1.png','image/png',44482,'2015-07-05 14:45:36','Product'),(170,24,'2015-07-05 14:45:38','2015-07-05 14:45:38','shop2.png','image/png',38509,'2015-07-05 14:45:38','Product'),(171,24,'2015-07-05 14:45:38','2015-07-05 14:45:38','shop1.png','image/png',44482,'2015-07-05 14:45:38','Product'),(172,25,'2015-07-05 15:07:16','2015-07-05 15:07:16','shop1.png','image/png',44482,'2015-07-05 15:07:16','Product'),(173,26,'2015-07-07 09:54:49','2015-07-07 09:54:49','shop1.png','image/png',44482,'2015-07-07 09:54:49','Product'),(174,27,'2015-07-07 09:54:52','2015-07-07 09:54:52','shop1.png','image/png',44482,'2015-07-07 09:54:52','Product'),(175,28,'2015-07-07 09:54:53','2015-07-07 09:54:53','shop1.png','image/png',44482,'2015-07-07 09:54:53','Product'),(176,29,'2015-07-07 09:54:55','2015-07-07 09:54:55','shop1.png','image/png',44482,'2015-07-07 09:54:55','Product'),(177,30,'2015-07-07 09:54:57','2015-07-07 09:54:57','shop1.png','image/png',44482,'2015-07-07 09:54:57','Product'),(178,31,'2015-07-07 09:54:58','2015-07-07 09:54:58','shop1.png','image/png',44482,'2015-07-07 09:54:58','Product'),(179,32,'2015-07-07 09:55:00','2015-07-07 09:55:00','shop1.png','image/png',44482,'2015-07-07 09:55:00','Product'),(180,33,'2015-07-07 21:18:28','2015-07-07 21:18:28','toy1.jpg','image/jpeg',71665,'2015-07-07 21:18:28','Product'),(181,34,'2015-07-07 21:18:30','2015-07-07 21:18:30','toy1.jpg','image/jpeg',71665,'2015-07-07 21:18:30','Product'),(182,35,'2015-07-07 21:18:31','2015-07-07 21:18:31','toy1.jpg','image/jpeg',71665,'2015-07-07 21:18:31','Product'),(183,36,'2015-07-07 21:19:03','2015-07-07 21:19:03','toy2.jpg','image/jpeg',140553,'2015-07-07 21:19:02','Product'),(184,37,'2015-07-07 21:19:05','2015-07-07 21:19:05','toy2.jpg','image/jpeg',140553,'2015-07-07 21:19:04','Product'),(185,38,'2015-07-07 21:19:08','2015-07-07 21:19:08','toy1.jpg','image/jpeg',71665,'2015-07-07 21:19:08','Product'),(186,39,'2015-07-07 21:19:10','2015-07-07 21:19:10','toy1.jpg','image/jpeg',71665,'2015-07-07 21:19:10','Product'),(187,40,'2015-07-07 21:19:12','2015-07-07 21:19:12','toy2.jpg','image/jpeg',140553,'2015-07-07 21:19:12','Product'),(188,41,'2015-07-07 21:19:25','2015-07-07 21:19:25','toy3.jpg','image/jpeg',12559,'2015-07-07 21:19:25','Product'),(189,42,'2015-07-08 21:32:12','2015-07-08 21:32:12','toy1.jpg','image/jpeg',71665,'2015-07-08 21:32:12','Product'),(190,43,'2015-07-08 21:33:45','2015-07-08 21:33:45','toy1.jpg','image/jpeg',71665,'2015-07-08 21:33:45','Product'),(191,44,'2015-07-08 21:34:23','2015-07-08 21:34:23','toy1.jpg','image/jpeg',71665,'2015-07-08 21:34:23','Product'),(192,45,'2015-07-08 21:35:26','2015-07-08 21:35:26','toy1.jpg','image/jpeg',71665,'2015-07-08 21:35:26','Product'),(193,46,'2015-07-08 21:35:29','2015-07-08 21:35:29','toy1.jpg','image/jpeg',71665,'2015-07-08 21:35:29','Product'),(194,47,'2015-07-08 21:36:08','2015-07-08 21:36:08','toy1.jpg','image/jpeg',71665,'2015-07-08 21:36:08','Product'),(195,48,'2015-07-08 21:36:11','2015-07-08 21:36:11','toy1.jpg','image/jpeg',71665,'2015-07-08 21:36:11','Product'),(197,23,'2015-07-08 22:30:26','2015-07-08 22:30:26','works.png','image/png',4828,'2015-07-08 22:30:26','Copulation'),(198,24,'2015-07-08 22:30:32','2015-07-08 22:30:32','works.png','image/png',4828,'2015-07-08 22:30:32','Copulation'),(199,20,'2015-07-08 22:37:30','2015-07-08 22:37:30','linkedin-icon.png','image/png',455,'2015-07-08 22:37:30','GoodHand'),(200,40,'2015-07-09 10:33:29','2015-07-09 10:33:29','toy3.jpg','image/jpeg',12559,'2015-07-09 10:33:29','Product'),(201,40,'2015-07-09 10:33:29','2015-07-09 10:33:29','toy2.jpg','image/jpeg',140553,'2015-07-09 10:33:29','Product'),(202,40,'2015-07-09 10:33:29','2015-07-09 10:33:29','works-bw.png','image/png',4741,'2015-07-09 10:33:29','Product'),(203,40,'2015-07-09 10:33:29','2015-07-09 10:33:29','outstuffing-icon.png','image/png',6547,'2015-07-09 10:33:29','Product'),(204,49,'2015-07-09 22:02:38','2015-07-09 22:02:38','shop1.png','image/png',44482,'2015-07-09 22:02:38','Product'),(205,49,'2015-07-09 22:02:38','2015-07-09 22:02:38','shop2.png','image/png',38509,'2015-07-09 22:02:38','Product'),(206,50,'2015-07-09 22:02:40','2015-07-09 22:02:40','shop1.png','image/png',44482,'2015-07-09 22:02:40','Product'),(207,50,'2015-07-09 22:02:40','2015-07-09 22:02:40','shop2.png','image/png',38509,'2015-07-09 22:02:40','Product'),(208,51,'2015-07-09 22:02:42','2015-07-09 22:02:42','shop1.png','image/png',44482,'2015-07-09 22:02:42','Product'),(209,51,'2015-07-09 22:02:42','2015-07-09 22:02:42','shop2.png','image/png',38509,'2015-07-09 22:02:42','Product'),(210,52,'2015-07-09 22:02:58','2015-07-09 22:02:58','shop1.png','image/png',44482,'2015-07-09 22:02:58','Product'),(211,52,'2015-07-09 22:02:58','2015-07-09 22:02:58','shop2.png','image/png',38509,'2015-07-09 22:02:58','Product'),(212,53,'2015-07-09 22:03:00','2015-07-09 22:03:00','shop1.png','image/png',44482,'2015-07-09 22:03:00','Product'),(213,53,'2015-07-09 22:03:00','2015-07-09 22:03:00','shop2.png','image/png',38509,'2015-07-09 22:03:00','Product'),(214,54,'2015-07-09 22:03:01','2015-07-09 22:03:01','shop1.png','image/png',44482,'2015-07-09 22:03:01','Product'),(215,54,'2015-07-09 22:03:02','2015-07-09 22:03:02','shop2.png','image/png',38509,'2015-07-09 22:03:01','Product'),(218,28,'2015-07-10 13:09:31','2015-07-10 13:09:31','cat1.jpg','image/jpeg',13569,'2015-07-10 13:09:30','Sale'),(219,29,'2015-07-10 13:15:02','2015-07-10 13:15:02','cat.png','image/png',2993,'2015-07-10 13:15:02','Sale'),(220,30,'2015-07-10 13:25:29','2015-07-10 13:25:29','cat.png','image/png',2993,'2015-07-10 13:25:29','Sale'),(221,32,'2015-07-10 13:58:55','2015-07-10 13:58:55','cat1.jpg','image/jpeg',13569,'2015-07-10 13:58:55','Sale'),(222,33,'2015-07-10 13:59:21','2015-07-10 13:59:21','cat1.jpg','image/jpeg',13569,'2015-07-10 13:59:21','Sale'),(223,34,'2015-07-10 14:00:19','2015-07-10 14:00:19','cat1.jpg','image/jpeg',13569,'2015-07-10 14:00:19','Sale'),(224,25,'2015-07-10 14:09:51','2015-07-10 14:09:51','cat1.jpg','image/jpeg',13569,'2015-07-10 14:09:51','Copulation'),(225,26,'2015-07-10 15:14:29','2015-07-10 15:14:29','font2.png','image/png',7433,'2015-07-10 15:14:29','Copulation'),(226,21,'2015-07-10 15:34:11','2015-07-10 15:34:11','font2.png','image/png',7433,'2015-07-10 15:34:11','GoodHand'),(227,22,'2015-07-11 15:37:45','2015-07-11 15:37:45','cat4.jpg','image/jpeg',18636,'2015-07-11 15:37:44','GoodHand'),(228,23,'2015-07-11 16:00:52','2015-07-11 16:00:52','key.png','image/png',2657,'2015-07-11 16:00:52','GoodHand'),(229,55,'2015-07-15 20:11:26','2015-07-15 20:11:26','cat4.jpg','image/jpeg',18636,'2015-07-15 20:11:25','Product'),(230,55,'2015-07-15 20:11:26','2015-07-15 20:11:26','cat3.jpg','image/jpeg',20636,'2015-07-15 20:11:26','Product'),(231,55,'2015-07-15 20:11:26','2015-07-15 20:11:26','cat1.jpg','image/jpeg',13569,'2015-07-15 20:11:26','Product'),(232,55,'2015-07-15 20:11:26','2015-07-15 20:11:26','close-icon.png','image/png',373,'2015-07-15 20:11:26','Product');
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breeds`
--

DROP TABLE IF EXISTS `breeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `breeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_ru` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `family` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breeds`
--

LOCK TABLES `breeds` WRITE;
/*!40000 ALTER TABLE `breeds` DISABLE KEYS */;
INSERT INTO `breeds` VALUES (2,'Йоркшир','Duplo','dog'),(3,'Перс','Duplo2','dog'),(4,'Дупло','Duplo2','cat'),(6,'Кошака','Кошака','cat'),(7,'Пес','Апечс','dog');
/*!40000 ALTER TABLE `breeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (4,1,54,3,NULL),(5,1,48,2,NULL),(6,1,49,1,NULL),(7,1,50,1,NULL),(8,5,52,1,NULL),(9,5,49,1,NULL),(10,5,48,2,NULL),(11,8,54,3,NULL),(12,8,54,3,NULL),(13,8,24,2,NULL),(14,11,52,1,NULL),(15,11,53,1,NULL),(16,11,40,0,NULL),(17,11,52,2,NULL),(18,11,53,2,NULL),(19,11,52,3,NULL);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (11,1),(12,18),(13,2),(14,19),(15,20),(16,21);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_ru` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (3,'Политика','Politics'),(4,'География','Geography'),(5,'Полином','Polynom'),(6,'Полином','Polynom'),(7,'Категория товара','Prod category'),(8,'afsdf','adfadfafa'),(9,'sdca','adfad'),(10,'test','test');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_news`
--

DROP TABLE IF EXISTS `categories_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_news`
--

LOCK TABLES `categories_news` WRITE;
/*!40000 ALTER TABLE `categories_news` DISABLE KEYS */;
INSERT INTO `categories_news` VALUES (1,28,3),(2,28,5),(5,28,4),(6,30,5);
/*!40000 ALTER TABLE `categories_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci,
  `author_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `entity_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'My first comment.',17,30,'News','2015-07-01 08:36:06','2015-07-01 08:36:06'),(2,NULL,NULL,30,'News','2015-07-01 10:45:00','2015-07-01 10:45:00'),(3,'Дерево росте',1,30,'News','2015-07-01 10:48:39','2015-07-01 10:48:39'),(4,'Дерево ростеDerevo ooo',1,30,'News','2015-07-01 10:48:52','2015-07-01 10:48:52'),(5,'Шо робити ?',1,30,'News','2015-07-01 10:49:40','2015-07-01 10:49:40'),(6,'Derevo',1,30,'News','2015-07-01 10:50:45','2015-07-01 10:50:45'),(7,'{f {F',1,30,'News','2015-07-01 10:50:53','2015-07-01 10:50:53'),(8,'ОТООО',1,30,'News','2015-07-01 10:50:59','2015-07-01 10:50:59'),(9,'фваявпфіпі',1,30,'News','2015-07-01 10:51:07','2015-07-01 10:51:07'),(10,'фвафвіпівапівп',1,30,'News','2015-07-01 10:51:09','2015-07-01 10:51:09'),(11,'фваівпіапіп',1,30,'News','2015-07-01 10:51:13','2015-07-01 10:51:13'),(12,'test',1,30,'News','2015-07-01 10:53:06','2015-07-01 10:53:06'),(13,'1111111111111111111',1,30,'News','2015-07-01 10:53:11','2015-07-01 10:53:11'),(14,'adgarg',1,30,'News','2015-07-04 17:08:23','2015-07-04 17:08:23'),(15,'хороші руки',1,20,'GoodHand','2015-07-09 22:38:40','2015-07-09 22:38:40'),(16,'дупло',1,20,'GoodHand','2015-07-09 22:38:46','2015-07-09 22:38:46'),(17,'продажва',1,25,'Sale','2015-07-09 22:44:15','2015-07-09 22:44:15'),(18,'cop',1,20,'Copulation','2015-07-09 23:01:19','2015-07-09 23:01:19'),(19,'ojo',1,54,'Product','2015-07-09 23:09:20','2015-07-09 23:09:20'),(20,'sdsa',1,54,'Product','2015-07-09 23:15:06','2015-07-09 23:15:06'),(21,'АНУ',1,50,'Product','2015-07-11 17:44:30','2015-07-11 17:44:30'),(22,'sdfsd gsd gd gsd',1,44,'Product','2015-07-13 16:04:25','2015-07-13 16:04:25'),(23,'fdsvsdgsfs',1,44,'Product','2015-07-13 16:04:32','2015-07-13 16:04:32'),(24,'dgvsdf',1,31,'News','2015-07-13 16:07:40','2015-07-13 16:07:40'),(25,'dfsfs f dsf',1,31,'News','2015-07-13 16:07:44','2015-07-13 16:07:44'),(26,'adfs sdgfsfgsfg',1,33,'News','2015-07-14 12:51:53','2015-07-14 12:51:53'),(27,'edfaeg',1,33,'News','2015-07-14 12:51:58','2015-07-14 12:51:58');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copulations`
--

DROP TABLE IF EXISTS `copulations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `copulations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `scorp` tinyint(1) DEFAULT NULL,
  `rkf` tinyint(1) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `price` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `prize_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prize_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prize_file_size` int(11) DEFAULT NULL,
  `prize_updated_at` datetime DEFAULT NULL,
  `bloodline_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bloodline_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bloodline_file_size` int(11) DEFAULT NULL,
  `bloodline_updated_at` datetime DEFAULT NULL,
  `mothers_photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mothers_photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mothers_photo_file_size` int(11) DEFAULT NULL,
  `mothers_photo_updated_at` datetime DEFAULT NULL,
  `fathers_photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fathers_photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fathers_photo_file_size` int(11) DEFAULT NULL,
  `fathers_photo_updated_at` datetime DEFAULT NULL,
  `reject_reason` text COLLATE utf8_unicode_ci,
  `breed_id` int(11) DEFAULT NULL,
  `views_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copulations`
--

LOCK TABLES `copulations` WRITE;
/*!40000 ALTER TABLE `copulations` DISABLE KEYS */;
INSERT INTO `copulations` VALUES (5,'dog','Putin',34,1,0,'Files to download\r\nBuild files for all directives are distributed in several flavours: minified for production usage, un-minified for development, with or without templates. All the options are described and can be downloaded from here.\r\n\r\nAlternativelly, if you are only interested in a subset of directives, you can create your own build.\r\n\r\nWhichever method you choose the good news that the overall size of a download is very small: <20kB for all directives (~5kB with gzip compression!)',45000,1,NULL,'2015-06-07 17:00:30','2015-06-07 17:00:30','EntityDesignerDiagram-1.jpg','image/jpeg',368178,'2015-06-07 17:00:30','dob_ui.png','image/png',686079,'2015-06-07 17:00:30','robert-downey-jr.jpg','image/jpeg',23661,'2015-06-07 17:00:30','questions.png','image/png',183392,'2015-06-07 17:00:30',NULL,NULL,0),(6,'cat','Wolverine',45,1,0,'Геннадий Григорьевич Онищенко (Гигиененфюрер Всея Руси, 21 октября 1950 — присно и во веки веков) — всея Великыя, Малыя и Белыя Руси лекарь, врачеватель и радетель за непрекращающееся здоровье нации. Немногим известно, что Геннадий Григорьевич, работая наравне с ядерным щитом, служит секретным биологическим зонтиком России и на протяжении многих лет в одиночку защищает границы страны и ее граждан от чумы, свиного и птичьего гриппа, кори, сибирской язвы и энуреза.',43000,1,NULL,'2015-06-07 17:02:05','2015-06-07 17:02:05',NULL,NULL,NULL,NULL,'dob_ui1.png','image/png',965778,'2015-06-07 17:02:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(7,'cat','Wolverine',45,1,0,'Геннадий Григорьевич Онищенко (Гигиененфюрер Всея Руси, 21 октября 1950 — присно и во веки веков) — всея Великыя, Малыя и Белыя Руси лекарь, врачеватель и радетель за непрекращающееся здоровье нации. Немногим известно, что Геннадий Григорьевич, работая наравне с ядерным щитом, служит секретным биологическим зонтиком России и на протяжении многих лет в одиночку защищает границы страны и ее граждан от чумы, свиного и птичьего гриппа, кори, сибирской язвы и энуреза.',43000,1,NULL,'2015-06-07 17:02:09','2015-06-07 17:02:09',NULL,NULL,NULL,NULL,'dob_ui1.png','image/png',965778,'2015-06-07 17:02:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(8,'dog','Derevo',67,1,0,'Ехал домой, смотрю, стоит девчушка с книгой — «Солнце землю целовало. Стихи поэтов Серебряного века». Лицо тонкое, прозрачное — одухотворённое. Ну, думаю, надо знакомиться, эт-то мой клиент. Собрался с духом её на выходе перехватить; и тут она книжку закрывает — и заламывает уголок страницы, вместо закладки.\r\n\r\nМеня как из ушата окатили. Так гадко стало. И обидно.\r\nПустышка.',65000,2,NULL,'2015-06-07 17:10:13','2015-06-07 17:10:13','dog.png','image/png',3720,'2015-06-07 17:10:13','cat.png','image/png',2993,'2015-06-07 17:10:13','our-first-look-at-colossus-on-the-deadpool-set.jpg','image/jpeg',29399,'2015-06-07 17:10:13','EntityDesignerDiagram-1.jpg','image/jpeg',368178,'2015-06-07 17:10:13',NULL,NULL,0),(9,'dog','Derevo',67,1,0,'Ехал домой, смотрю, стоит девчушка с книгой — «Солнце землю целовало. Стихи поэтов Серебряного века». Лицо тонкое, прозрачное — одухотворённое. Ну, думаю, надо знакомиться, эт-то мой клиент. Собрался с духом её на выходе перехватить; и тут она книжку закрывает — и заламывает уголок страницы, вместо закладки.\r\n\r\nМеня как из ушата окатили. Так гадко стало. И обидно.\r\nПустышка.',65000,2,NULL,'2015-06-07 17:10:16','2015-06-07 17:10:16','dog.png','image/png',3720,'2015-06-07 17:10:16','cat.png','image/png',2993,'2015-06-07 17:10:16','our-first-look-at-colossus-on-the-deadpool-set.jpg','image/jpeg',29399,'2015-06-07 17:10:16','EntityDesignerDiagram-1.jpg','image/jpeg',368178,'2015-06-07 17:10:16',NULL,NULL,0),(10,'dog','Король и шут',34,1,0,'фвафваф',34,1,NULL,'2015-06-07 21:01:27','2015-06-07 21:01:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(11,'dog','derevo',45,1,0,'dfad',342,1,NULL,'2015-06-07 21:43:14','2015-07-13 12:49:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dob_ui1.png','image/png',965778,'2015-06-07 21:43:14',NULL,NULL,NULL,NULL,NULL,NULL,1),(13,'dog','sdaa',21,0,1,'adfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssss',1212,1,NULL,'2015-06-10 14:51:38','2015-06-10 14:51:38','meta-moskow-logo.svg','image/svg+xml',2383,'2015-06-10 14:51:38','device-icon.png','image/png',24335,'2015-06-10 14:51:38','outstuffing-icon.png','image/png',6547,'2015-06-10 14:51:38','device-icon.png','image/png',24335,'2015-06-10 14:51:38',NULL,NULL,0),(14,'dog','sdaa',21,0,1,'adfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssssadfadfa sd sd sds sssss',1212,1,NULL,'2015-06-10 14:51:41','2015-06-10 14:51:41','meta-moskow-logo.svg','image/svg+xml',2383,'2015-06-10 14:51:41','device-icon.png','image/png',24335,'2015-06-10 14:51:41','outstuffing-icon.png','image/png',6547,'2015-06-10 14:51:41','device-icon.png','image/png',24335,'2015-06-10 14:51:41',NULL,NULL,0),(15,'cat','1',1,0,0,'adf',1221,1,NULL,'2015-06-10 14:52:59','2015-06-10 14:52:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'outstuffing-icon.png','image/png',6547,'2015-06-10 14:52:59',NULL,NULL,NULL,NULL,NULL,NULL,0),(16,'dog','нормальна случка',21,0,0,'1 фото',12,1,NULL,'2015-06-10 15:48:27','2015-06-10 15:48:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(17,'dog','Типир точно',21,0,0,'два контакта',21,1,NULL,'2015-06-10 15:50:49','2015-06-10 15:50:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(18,'dog','нормальная сучка',12,0,0,'фвпіапіапіапіа',2323,1,NULL,'2015-06-11 07:26:15','2015-06-11 07:26:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(19,'dog','sdfgsg',214,0,1,'<p> dfsfd Sfa\r\n</p> dfsfd Sfa  dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"><img src=\"/system/attachments/files/000/000/099/original/cat4.jpg?1434464091\"><span class=\"redactor-invisible-space\"></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span>',12343,1,NULL,'2015-06-16 14:14:59','2015-06-16 14:14:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cat2.jpg','image/jpeg',16785,'2015-06-16 14:14:59','cat4.jpg','image/jpeg',18636,'2015-06-16 14:14:59',NULL,NULL,0),(20,'dog','Редактор',214,0,1,'<p> dfsfd Sfa\r\n</p> dfsfd Sfa  dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"> dfsfd Sfa <span class=\"redactor-invisible-space\"><img src=\"/system/attachments/files/000/000/099/original/cat4.jpg?1434464091\"><img src=\"/system/attachments/files/000/000/103/original/Big_Wood__N2.JPG?1434467298\"><span class=\"redactor-invisible-space\"></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span>',12343,1,0,'2015-06-16 14:15:11','2015-07-13 12:49:43',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cat2.jpg','image/jpeg',16785,'2015-06-16 14:15:11','cat4.jpg','image/jpeg',18636,'2015-06-16 14:15:11','srgsdfhdghf',NULL,1),(21,'cat','Сучка',12000,1,0,'<p><img src=\"/system/attachments/files/000/000/104/original/dog.png?1434467747\"> така мала хуйня<span></span>\r\n</p>',34000,1,1,'2015-06-16 15:16:11','2015-06-18 15:46:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(22,'cat','Котик',23,1,1,'<p>ів іввіавпі іввав\r\n</p>ів іввіавпі іввавів іввіавпі іввав<span class=\"redactor-invisible-space\">ів іввіавпі іввав<span class=\"redactor-invisible-space\">ів іввіавпі іввав<span class=\"redactor-invisible-space\">ів іввіавпі іввав<span class=\"redactor-invisible-space\">ів іввіавпі іввав<span class=\"redactor-invisible-space\">ів іввіавпі іввав<span class=\"redactor-invisible-space\">ів іввіавпі іввав<span class=\"redactor-invisible-space\">ів іввіавпі іввав<span class=\"redactor-invisible-space\">ів іввіавпі іввав<span class=\"redactor-invisible-space\">ів іввіавпі іввав<span class=\"redactor-invisible-space\">ів іввіавпі іввав<span class=\"redactor-invisible-space\">ів іввіавпі іввав<span class=\"redactor-invisible-space\">ів іввіавпі іввав<span class=\"redactor-invisible-space\"></span></span></span></span></span></span></span></span></span></span></span></span></span>',23000,1,1,'2015-06-19 11:50:02','2015-07-01 17:14:43','11356446_432182946960019_241246363_n.jpg','image/jpeg',82365,'2015-06-19 11:50:02','cat2.jpg','image/jpeg',16785,'2015-07-01 17:14:37','Big_Wood__N2.JPG','image/jpeg',3829265,'2015-06-19 11:50:02','robert-downey-jr.jpg','image/jpeg',23661,'2015-06-19 11:50:02',NULL,NULL,0),(23,'dog','Fart',12345,1,0,'<p>sdfad sdgsfg sfgsd d sdfad sdgsfg sfgsd d<span></span>sdfad sdgsfg sfgsd dsdfad sdgsfg sfgsd d\r\n</p>',12345,1,NULL,'2015-07-08 22:30:26','2015-07-08 22:30:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(24,'cat','Fart',12345,1,0,'<p>sdfad sdgsfg sfgsd d sdfad sdgsfg sfgsd d<span></span>sdfad sdgsfg sfgsd dsdfad sdgsfg sfgsd d\r\n</p>',12345,1,NULL,'2015-07-08 22:30:32','2015-07-12 23:22:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(25,'dog','Кошака',21,0,0,'<p>фіаф\r\n</p>',21,1,1,'2015-07-10 14:09:51','2015-07-13 13:30:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,2),(26,'dog','Degf',21,0,0,'<p>sdsf df ddgdf\r\n</p>',12,1,1,'2015-07-10 15:14:29','2015-07-12 23:22:40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,2);
/*!40000 ALTER TABLE `copulations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendships`
--

DROP TABLE IF EXISTS `friendships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendships`
--

LOCK TABLES `friendships` WRITE;
/*!40000 ALTER TABLE `friendships` DISABLE KEYS */;
INSERT INTO `friendships` VALUES (7,1,13,'pending','2015-07-15 14:40:01','2015-07-15 14:40:01'),(8,13,1,'requested','2015-07-15 14:40:01','2015-07-15 14:40:01'),(9,1,12,'pending','2015-07-15 14:40:03','2015-07-15 14:40:03'),(10,12,1,'requested','2015-07-15 14:40:03','2015-07-15 14:40:03'),(11,1,15,'pending','2015-07-15 14:40:05','2015-07-15 14:40:05'),(12,15,1,'requested','2015-07-15 14:40:05','2015-07-15 14:40:05'),(17,1,20,'accepted','2015-07-15 15:28:09','2015-07-15 15:30:17'),(18,20,1,'accepted','2015-07-15 15:28:09','2015-07-15 15:30:17'),(23,1,14,'pending','2015-07-15 19:36:05','2015-07-15 19:36:05'),(24,14,1,'requested','2015-07-15 19:36:05','2015-07-15 19:36:05');
/*!40000 ALTER TABLE `friendships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good_hands`
--

DROP TABLE IF EXISTS `good_hands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good_hands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `scorp` tinyint(1) DEFAULT NULL,
  `rkf` tinyint(1) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `prize_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prize_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prize_file_size` int(11) DEFAULT NULL,
  `prize_updated_at` datetime DEFAULT NULL,
  `bloodline_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bloodline_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bloodline_file_size` int(11) DEFAULT NULL,
  `bloodline_updated_at` datetime DEFAULT NULL,
  `mothers_photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mothers_photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mothers_photo_file_size` int(11) DEFAULT NULL,
  `mothers_photo_updated_at` datetime DEFAULT NULL,
  `fathers_photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fathers_photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fathers_photo_file_size` int(11) DEFAULT NULL,
  `fathers_photo_updated_at` datetime DEFAULT NULL,
  `reject_reason` text COLLATE utf8_unicode_ci,
  `breed_id` int(11) DEFAULT NULL,
  `views_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good_hands`
--

LOCK TABLES `good_hands` WRITE;
/*!40000 ALTER TABLE `good_hands` DISABLE KEYS */;
INSERT INTO `good_hands` VALUES (1,'dog','aefaef',123412352,0,0,'',1,1,'2015-07-01 16:56:58','2015-07-02 07:34:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(2,'cat','дупло',23234234,0,0,'',1,1,'2015-07-01 17:01:30','2015-07-02 07:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(3,'cat','adfvadfv',214134,0,0,'',1,1,'2015-07-01 17:05:25','2015-07-02 07:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(4,'dog','песик',1223232,0,0,'',1,1,'2015-07-01 17:05:55','2015-07-02 07:35:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(5,'dog','Міша',24,1,1,'<p>вукумщ\r\n</p>',1,1,'2015-07-01 17:14:03','2015-07-02 07:35:17','log111.png','image/png',13530,'2015-07-01 17:14:03','cat1.jpg','image/jpeg',13569,'2015-07-01 17:14:03','cat4.jpg','image/jpeg',18636,'2015-07-01 17:14:03','cat4.jpg','image/jpeg',18636,'2015-07-01 17:14:03',NULL,NULL,0),(6,'dog','Міша',24,1,1,'<p>вукумщ\r\n</p>',1,1,'2015-07-01 17:31:33','2015-07-14 11:45:37',NULL,NULL,NULL,NULL,'key.png','image/png',2657,'2015-07-01 17:31:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(7,'dog','Міша',24,1,1,'<p>вукумщ\r\n</p>',1,1,'2015-07-01 17:31:44','2015-07-02 07:34:53',NULL,NULL,NULL,NULL,'key.png','image/png',2657,'2015-07-01 17:31:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(13,'dog','Міша',24,1,1,'<p>вукумщ\r\n</p>',1,1,'2015-07-01 17:37:57','2015-07-12 16:52:40',NULL,NULL,NULL,NULL,'cat3.jpg','image/jpeg',20636,'2015-07-01 17:41:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(14,'cat','Горшок',12000,1,0,'<p>Duplo\r\n</p>',1,1,'2015-07-01 17:43:56','2015-07-02 07:34:28','key.png','image/png',2657,'2015-07-01 17:46:12','cat2.jpg','image/jpeg',16785,'2015-07-01 17:44:14','cat2.jpg','image/jpeg',16785,'2015-07-01 18:07:57','cat4.jpg','image/jpeg',18636,'2015-07-01 18:07:57',NULL,NULL,0),(15,'dog','sfdgxfgbsx',1245,1,0,'<p>Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\"></span></span></span></span></span></span></span></span></span></span></span></span></span>\r\n</p>',1,NULL,'2015-07-02 08:52:52','2015-07-02 08:52:52',NULL,NULL,NULL,NULL,'log111.png','image/png',13530,'2015-07-02 08:52:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(16,'dog','sfdgxfgbsx',1245,1,0,'<p>Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\"></span></span></span></span></span></span></span></span></span></span></span></span></span>\r\n</p>',1,NULL,'2015-07-02 08:52:55','2015-07-02 08:52:55',NULL,NULL,NULL,NULL,'log111.png','image/png',13530,'2015-07-02 08:52:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(17,'dog','sfdgxfgbsx',1245,1,0,'<p>Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\">Lorem ipsum lorem <span class=\"redactor-invisible-space\"></span></span></span></span></span></span></span></span></span></span></span></span></span>\r\n</p>',1,NULL,'2015-07-02 08:52:57','2015-07-02 08:52:57',NULL,NULL,NULL,NULL,'log111.png','image/png',13530,'2015-07-02 08:52:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(18,'cat','Derevo',12000,1,0,'<p>df aadfadf adfa\r\n</p>',1,NULL,'2015-07-02 08:57:57','2015-07-02 08:57:57',NULL,NULL,NULL,NULL,'font2.png','image/png',7433,'2015-07-02 08:57:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(19,'cat','Derevo 2',11000,1,1,'<p>Lorem inpsd Lorem inpsd Lorem inpsd <span class=\"redactor-invisible-space\">Lorem inpsd <span class=\"redactor-invisible-space\">Lorem inpsd <span class=\"redactor-invisible-space\">Lorem inpsd <span class=\"redactor-invisible-space\">Lorem inpsd <span class=\"redactor-invisible-space\">Lorem inpsd <span class=\"redactor-invisible-space\">Lorem inpsd <span class=\"redactor-invisible-space\">Lorem inpsd <span class=\"redactor-invisible-space\">Lorem inpsd <span class=\"redactor-invisible-space\">Lorem inpsd <span class=\"redactor-invisible-space\">Lorem inpsd <span class=\"redactor-invisible-space\">Lorem inpsd <span class=\"redactor-invisible-space\">Lorem inpsd <span class=\"redactor-invisible-space\"></span></span></span></span></span></span></span></span></span></span></span></span></span>\r\n</p>',1,NULL,'2015-07-02 08:58:55','2015-07-02 08:58:55','key.png','image/png',2657,'2015-07-02 08:58:55','cat3.jpg','image/jpeg',20636,'2015-07-02 08:58:55','dob_ui.png','image/png',686079,'2015-07-02 08:58:55','dog.png','image/png',3720,'2015-07-02 08:58:55',NULL,NULL,0),(20,'dog','fert',2345,0,1,'<p>sfg er\r\n</p>',1,NULL,'2015-07-08 22:37:30','2015-07-08 22:37:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(21,'dog','aef',21,1,0,'<p>saf adf\r\n</p>',1,NULL,'2015-07-10 15:34:11','2015-07-10 15:34:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0),(22,'cat','def',21,0,0,'<p>ef sdf df\r\n</p>',1,NULL,'2015-07-11 15:37:44','2015-07-11 19:41:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1),(23,'cat','adf',21,0,0,'<p>dsgs\r\n</p>',1,NULL,'2015-07-11 16:00:52','2015-07-11 16:00:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0);
/*!40000 ALTER TABLE `good_hands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_slides`
--

DROP TABLE IF EXISTS `main_slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_slides`
--

LOCK TABLES `main_slides` WRITE;
/*!40000 ALTER TABLE `main_slides` DISABLE KEYS */;
INSERT INTO `main_slides` VALUES (3,NULL,'shapka.png','image/png',565592,'2015-07-09 07:56:34'),(8,NULL,'Big_Wood__N2.JPG','image/jpeg',1331926,'2015-07-09 23:25:31');
/*!40000 ALTER TABLE `main_slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `author_name` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,14,'Привет',NULL,'2015-07-15 21:09:39','2015-07-15 21:09:39'),(2,14,1,'ок',NULL,'2015-07-15 21:16:22','2015-07-15 21:16:22'),(3,1,16,'Здоров',NULL,'2015-07-15 22:11:23','2015-07-15 22:11:23'),(4,1,16,'здоров 2',NULL,'2015-07-15 22:59:34','2015-07-15 22:59:34');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rkf` tinyint(1) DEFAULT NULL,
  `scorp` tinyint(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `preview_image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preview_image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preview_image_file_size` int(11) DEFAULT NULL,
  `preview_image_updated_at` datetime DEFAULT NULL,
  `body_ru` text COLLATE utf8_unicode_ci,
  `body_en` text COLLATE utf8_unicode_ci,
  `title_ru` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `views_count` int(11) DEFAULT '0',
  `news_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (19,1,1,1,'2015-05-31 12:45:21','2015-07-12 22:30:50','robert-downey-jr.jpg','image/jpeg',23661,'2015-05-31 17:31:32','<p>Любимчик публики Роберт Дауни мл. вновь прибыл на съемочную площадку в Джорджии, но на этот раз уже по работе.\r\n</p>\r\n<p><img src=\"/system/attachments/files/000/000/003/original/11356446_432182946960019_241246363_n.jpg?1433093406\">\r\n</p>\r\n<p>Ранее мы уже видели Роберта на съемках фильма «Первый Мститель: Гражданская Война», однако, на тот момент это был скорее гостевой визит. Теперь же судя по инстаграму актера, он готов хорошенько поработать в этот уикенд. Вероятно в скором времени можно будет ожидать первые кадры с Железным Человеком.\r\n</p>','<p>Earlier today, Robert Downey Jr. shared a new photo with his followers on Instagram, indicating that he was arriving in Georgia for <em>Captain America: Civil War</em> filming. While Downey Jr. was spotted on the <em>Civil War</em> set earlier this month, he was in his civilian clothes and wasn\'t photographed participating in the filming.\r\n</p>\r\n<p><img src=\"/system/attachments/files/000/000/004/original/11356446_432182946960019_241246363_n.jpg?1433093489\">\r\n</p>\r\n<p>However, with his Instagram photo, Downey Jr. wrote, \"We work weekends ..for your viewing pleasure... #marvel #civilwar #pickyourside.\" It certainly sounds like he\'s indicating that he\'s going to be filming some scenes this weekend. Could we get our first shots of Downey Jr. in his new Iron Man armor some time very soon?\r\n</p>','Роберт Дауни мл. прибыл на съемки «Гражданской Войны»','Robert Downey Jr. Arrives In Style For Captain America: Civil War Filming',1,NULL),(20,1,1,1,'2015-05-31 15:58:42','2015-05-31 17:19:17','Tron-Legacy-promo.jpg','image/jpeg',49677,'2015-05-31 17:19:17','<p>Фанаты франшизы «Трон» не оставляют надежды увидеть триквел.\r\n</p>\r\n<p>Только вчера мы писали о том, что студия Disney приняла решение отказаться от фильма «Трон 3», как очередная фанатская петиция уже увидела свет на сайте <em>Change.org</em>.\r\n</p>\r\n<blockquote>«Трон: Наследие» заработал свыше $400 млн. в мировом прокате и помог шире раскрыть мир, созданный в оригинальном «Троне». Это позор, что Disney решила не снимать «Трон 3» и не исследовать эту бескрайнюю вселенную дальше. Подпиши петицию и мы покажем Disney, что Грид слишком крут, чтобы быть забытым, докажи, что Флинн жив!\r\n</blockquote>\r\n<p>Подписать петицию можно <a href=\"https://www.change.org/p/walt-disney-revive-tron-3\" target=\"_blank\">здесь</a>.\r\n</p>','<p>Fans have created a <a href=\"https://www.change.org/p/walt-disney-revive-tron-3\" target=\"_blank\">Change.org petition</a> to the save the now cancelled <em>Tron 3</em>.\r\n</p>\r\n<p>Yesterday, <em>Tron</em> fans everywhere were heartbroken to learn that Disney had <a href=\"http://comicbook.com/2015/05/30/disney-reportedly-pulls-the-plug-on-tron-3/\">pulled the plug</a> on the third <em>Tron</em> film. It appeared to be moving forward, bringing back <span class=\"s1\">director Joseph Kosinski (<em>Oblivion</em>) and stars Olivia Wilde (<em>Lazarus</em>) and Garrett Hedlund (<em>Pan</em>). Much of the plot was kept under wraps, but we do know some of it would\'ve focused on Quorra (Wilde) adjusting to the world beyond the Grid.</span>\r\n</p>\r\n<p>While the last film did earn over $400M at the worldwide box office, its production and marketing costs ate up a lot of those profits. So you can understand why Disney is reluctant to take another financial risk on special effects-heavy film like <em>Tron</em>, despite it having a very loyal fanbase.\r\n</p>\r\n<p>If you\'d like to sign the petition, <a href=\"https://www.change.org/p/walt-disney-revive-tron-3\">click here</a>.\r\n</p>','Петиция в поддержку фильма «Трон 3»','Tron Fans Start Petition To Revive Tron 3',0,NULL),(21,0,0,1,'2015-05-31 17:47:17','2015-05-31 17:47:17',NULL,NULL,NULL,NULL,'<p>Стало известно кто сыграет Петра Распутина, более известного как Колосс в фильме «Дэдпул».\r\n</p>\r\n<p>Известная экшен-актриса Джина Карано, которая также задействована в картине, официально подтвердила, что ее друг Андре Трикоте сыграет стального русского мутанта.\r\n</p>\r\n<p><br>\r\n</p>\r\n<p><img src=\"/system/attachments/files/000/000/005/original/our-first-look-at-colossus-on-the-deadpool-set.jpg?1433094360\">\r\n</p>\r\n<p>Немалого роста актер известен по своим ролям в сериале «Однажды в сказке»  и фильме «Седьмой Сын». Именно он попал в объективы камер на съемочной площадке вместе с Райаном Рейнольдсом. Напомним, что ранее эту роль играл Дэниел Кадмор.\r\n</p>\r\n<p>На днях съемки фильма «Дэдпул» завершились и теперь креативной команде предстоит увлекательный процесс пост-продакшена, а мы с вами сможем посмотреть на результат уже 12 февраля 2016 года.\r\n</p>','<p><em>Deadpool</em> actress Gina Carano (\'Angel Dust\') has confirmed that <span class=\"st\">Andre Tricoteux is playing the metal-skinned mutant known as Colossus (Piotr Nikolaievitch Rasputin).</span>\r\n</p>\r\n<p>Yesterday, members of the <em>Deadpool</em> cast sent out messages confirming that the film had wrapped. One of the messages was from Carano to Tricoteux in which she declared him \"the best Colossus a person could ask for Andre.\"\r\n</p>','«Дэдпул». Андре Трикоте сыграет Колосса','Andre Tricoteux Confirmed As Colossus In Deadpool',0,NULL),(22,0,0,1,'2015-05-31 17:50:45','2015-05-31 17:50:45','Tron-Legacy-promo.jpg','image/jpeg',49677,'2015-05-31 17:50:45','<p>Фанаты франшизы «Трон» не оставляют надежды увидеть триквел.\r\n</p>\r\n<p>Только вчера мы писали о том, что студия Disney приняла решение отказаться от фильма «Трон 3», как очередная фанатская петиция уже увидела свет на сайте <em>Change.org</em>.\r\n</p>\r\n<blockquote>«Трон: Наследие» заработал свыше $400 млн. в мировом прокате и помог шире раскрыть мир, созданный в оригинальном «Троне». Это позор, что Disney решила не снимать «Трон 3» и не исследовать эту бескрайнюю вселенную дальше. Подпиши петицию и мы покажем Disney, что Грид слишком крут, чтобы быть забытым, докажи, что Флинн жив!<br>\r\n</blockquote>','<p>er\r\n</p>','Петиция в поддержку фильма «Трон 3»','er',0,NULL),(23,1,1,1,'2015-05-31 17:52:06','2015-05-31 17:52:06','Tron-Legacy-promo.jpg','image/jpeg',49677,'2015-05-31 17:52:06','<p>Фанаты франшизы «Трон» не оставляют надежды увидеть триквел.\r\n</p>\r\n<p>Только вчера мы писали о том, что студия Disney приняла решение отказаться от фильма «Трон 3», как очередная фанатская петиция уже увидела свет на сайте <em>Change.org</em>.\r\n</p>\r\n<blockquote>«Трон: Наследие» заработал свыше $400 млн. в мировом прокате и помог шире раскрыть мир, созданный в оригинальном «Троне». Это позор, что Disney решила не снимать «Трон 3» и не исследовать эту бескрайнюю вселенную дальше. Подпиши петицию и мы покажем Disney, что Грид слишком крут, чтобы быть забытым, докажи, что Флинн жив!<br>\r\n</blockquote>','<p>Fans have created a <a href=\"https://www.change.org/p/walt-disney-revive-tron-3\" target=\"_blank\">Change.org petition</a> to the save the now cancelled <em>Tron 3</em>.\r\n</p>\r\n<p>Yesterday, <em>Tron</em> fans everywhere were heartbroken to learn that Disney had <a href=\"http://comicbook.com/2015/05/30/disney-reportedly-pulls-the-plug-on-tron-3/\">pulled the plug</a> on the third <em>Tron</em> film. It appeared to be moving forward, bringing back <span class=\"s1\">director Joseph Kosinski (<em>Oblivion</em>) and stars Olivia Wilde (<em>Lazarus</em>) and Garrett Hedlund (<em>Pan</em>). Much of the plot was kept under wraps, but we do know some of it would\'ve focused on Quorra (Wilde) adjusting to the world beyond the Grid.</span>\r\n</p>\r\n<p>While the last film did earn over $400M at the worldwide box office, its production and marketing costs ate up a lot of those profits. So you can understand why Disney is reluctant to take another financial risk on special effects-heavy film like <em>Tron</em>, despite it having a very loyal fanbase.\r\n</p>\r\n<p>If you\'d like to sign the petition, <a href=\"https://www.change.org/p/walt-disney-revive-tron-3\">click here</a>.\r\n</p>','Петиция в поддержку фильма «Трон 3»','Tron Fans Start Petition To Revive Tron 3',0,NULL),(24,0,0,1,'2015-06-17 07:20:19','2015-06-17 07:20:19','cat1.jpg','image/jpeg',13569,'2015-06-17 07:20:19','<p><img src=\"/system/attachments/files/000/000/110/original/Big_Wood__N2.JPG?1434525603\">\r\n</p>','<p><img src=\"/system/attachments/files/000/000/111/original/avatar.png?1434525610\">\r\n</p>','fsgsrfhrf','aegfaega',0,NULL),(25,0,0,1,'2015-06-17 07:33:40','2015-06-17 07:33:40','Big_Wood__N2.JPG','image/jpeg',3829265,'2015-06-17 07:33:40','<p>af\r\n</p>','<p>afd\r\n</p>','test','afd',0,NULL),(26,1,0,1,'2015-06-17 16:01:15','2015-06-17 16:01:15','cat2.jpg','image/jpeg',16785,'2015-06-17 16:01:15','<p>Дупло\r\n</p>','<p>Duplo\r\n</p>','Дупло','Duplo',0,NULL),(27,1,0,1,'2015-06-17 16:09:25','2015-06-17 16:09:25','cat1.jpg','image/jpeg',13569,'2015-06-17 16:09:24','<p>фвмівпіави\r\n</p>','<p>впміавиіаиі\r\n</p>','aefaf','adgfdfs',0,NULL),(28,1,0,1,'2015-06-17 16:20:48','2015-06-17 16:20:48','cat1.jpg','image/jpeg',13569,'2015-06-17 16:20:48','<p>фвмівпіави\r\n</p>','<p>впміавиіаиі\r\n</p>','aefaf','adgfdfs',0,NULL),(29,1,0,1,'2015-06-17 16:25:55','2015-07-11 18:21:05','cat.png','image/png',2993,'2015-06-17 16:25:55','<h1>«Раскол Мстителей». Кадры со съемок и ситуация с Руффало</h1>','<h1>«Раскол Мстителей». Кадры со съемок и ситуация с Руффало</h1>','«Раскол Мстителей». Кадры со съемок и ситуация с Руффало','«Раскол Мстителей». Кадры со съемок и ситуация с Руффало',1,NULL),(30,0,0,1,'2015-06-17 18:19:24','2015-06-17 18:19:24','cat2.jpg','image/jpeg',16785,'2015-06-17 18:19:24','<p>фваіап\r\n</p>','<p>фвпміап\r\n</p>','sdfgbsfbsf','dgfsdgas',0,NULL),(31,1,0,1,'2015-07-12 22:55:22','2015-07-13 16:07:35','cat1.jpg','image/jpeg',13569,'2015-07-12 22:55:22','<p>test test test test test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\"></span></span></span></span></span></span></span></span></span></span>\r\n</p>','<p>test test test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test </span></span></span></span></span></span></span></span></span></span>\r\n</p>','Новая новость','New News',1,NULL),(32,1,0,1,'2015-07-12 22:56:40','2015-07-12 22:56:40','cat1.jpg','image/jpeg',13569,'2015-07-12 22:56:40','<p>test test test test test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\"></span></span></span></span></span></span></span></span></span></span>\r\n</p>','<p>test test test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test <span class=\"redactor-invisible-space\">test test </span></span></span></span></span></span></span></span></span></span>\r\n</p>','Новая новость','New News',0,NULL),(33,1,0,1,'2015-07-12 22:57:48','2015-07-14 12:51:33','cat3.jpg','image/jpeg',20636,'2015-07-12 22:57:48','<p>news_categor y_id<span class=\"redactor-invisible-space\">news_c ategory_id<span class=\"redactor-invisible-space\">news_categ ory_id<span class=\"redactor-invisible-space\">news_category_i d<span class=\"redactor-invisible-space\">news_category_id<span class=\"redactor-invisible-space\">ne ws_cat egory_id</span></span></span></span></span>\r\n</p>','<p>news_categor y_idnews_c ategory_id<span class=\"redactor-invisible-space\">news_categ ory_id<span class=\"redactor-invisible-space\">news_category_i d<span class=\"redactor-invisible-space\">news_category_id<span class=\"redactor-invisible-space\">ne ws_cat egory_id<span class=\"redactor-invisible-space\"></span></span></span></span></span>\r\n</p>','Новая новость 2','New News 2',3,4);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `entity_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,NULL,1,34,'Sale'),(2,3,1,34,'Sale'),(3,4,1,34,'Sale'),(4,2,1,34,'Sale'),(5,5,1,34,'Sale'),(6,2,1,34,'Sale'),(7,5,1,34,'Sale'),(8,3,1,34,'Sale'),(9,5,1,34,'Sale'),(10,3,1,34,'Sale'),(11,5,1,34,'Sale'),(12,3,1,34,'Sale'),(13,5,1,34,'Sale'),(14,3,1,34,'Sale'),(15,5,1,34,'Sale'),(16,3,1,34,'Sale'),(17,5,1,34,'Sale'),(18,5,1,34,'Sale'),(19,4,1,31,'Sale'),(20,4,1,24,'Copulation'),(21,3,1,22,'GoodHand'),(22,4,1,53,'Product'),(23,4,1,42,'Product'),(24,4,1,42,'Product'),(25,0,1,42,'Product'),(26,0,1,42,'Product'),(27,0,1,42,'Product'),(28,0,1,42,'Product'),(29,0,1,42,'Product'),(30,0,1,42,'Product'),(31,0,1,42,'Product'),(32,0,1,42,'Product'),(33,0,1,42,'Product'),(34,0,1,42,'Product'),(35,0,1,42,'Product'),(36,0,1,42,'Product'),(37,0,1,42,'Product'),(38,4,1,42,'Product'),(39,4,1,42,'Product'),(40,0,1,42,'Product'),(41,0,1,42,'Product'),(42,0,1,42,'Product'),(43,0,1,42,'Product'),(44,0,1,42,'Product'),(45,0,1,42,'Product'),(46,0,1,42,'Product'),(47,0,1,42,'Product'),(48,0,1,42,'Product'),(49,0,1,42,'Product'),(50,0,1,42,'Product'),(51,0,1,42,'Product'),(52,0,1,42,'Product'),(53,0,1,42,'Product'),(54,0,1,42,'Product'),(55,0,1,42,'Product'),(56,0,1,42,'Product'),(57,0,1,42,'Product'),(58,0,1,42,'Product'),(59,0,1,42,'Product'),(60,0,1,42,'Product'),(61,0,1,42,'Product'),(62,0,1,42,'Product'),(63,0,1,42,'Product'),(64,0,1,42,'Product'),(65,4,1,42,'Product'),(66,4,1,42,'Product'),(67,0,1,42,'Product'),(68,0,1,42,'Product'),(69,0,1,42,'Product'),(70,0,1,42,'Product'),(71,0,1,42,'Product'),(72,0,1,42,'Product'),(73,0,1,42,'Product'),(74,0,1,42,'Product'),(75,0,1,42,'Product'),(76,0,1,42,'Product'),(77,0,1,42,'Product'),(78,0,1,42,'Product'),(79,0,1,42,'Product'),(80,4,1,42,'Product'),(81,4,1,42,'Product'),(82,0,1,42,'Product'),(83,0,1,42,'Product'),(84,0,1,42,'Product'),(85,0,1,42,'Product'),(86,0,1,42,'Product'),(87,0,1,42,'Product'),(88,0,1,42,'Product'),(89,0,1,42,'Product'),(90,0,1,42,'Product'),(91,0,1,42,'Product'),(92,0,1,42,'Product'),(93,0,1,42,'Product'),(94,0,1,42,'Product'),(95,0,1,42,'Product'),(96,0,1,42,'Product'),(97,0,1,42,'Product'),(98,0,1,42,'Product'),(99,0,1,42,'Product'),(100,0,1,42,'Product'),(101,0,1,42,'Product'),(102,0,1,42,'Product'),(103,0,1,42,'Product'),(104,0,1,42,'Product'),(105,0,1,42,'Product'),(106,0,1,42,'Product'),(107,4,1,42,'Product'),(108,4,1,42,'Product'),(109,4,1,42,'Product'),(110,0,1,42,'Product'),(111,0,1,42,'Product'),(112,0,1,42,'Product'),(113,0,1,42,'Product'),(114,0,1,42,'Product'),(115,0,1,42,'Product'),(116,0,1,42,'Product'),(117,0,1,42,'Product'),(118,0,1,42,'Product'),(119,0,1,42,'Product'),(120,0,1,42,'Product'),(121,0,1,42,'Product'),(122,0,1,42,'Product'),(123,4,1,42,'Product'),(124,4,1,42,'Product'),(125,0,1,42,'Product'),(126,0,1,42,'Product'),(127,0,1,42,'Product'),(128,0,1,42,'Product'),(129,0,1,42,'Product'),(130,0,1,42,'Product'),(131,0,1,42,'Product'),(132,0,1,42,'Product'),(133,0,1,42,'Product'),(134,0,1,42,'Product'),(135,0,1,42,'Product'),(136,0,1,42,'Product'),(137,0,1,42,'Product'),(138,0,1,42,'Product'),(139,0,1,42,'Product'),(140,0,1,42,'Product'),(141,0,1,42,'Product'),(142,0,1,42,'Product'),(143,0,1,42,'Product'),(144,0,1,42,'Product'),(145,0,1,42,'Product'),(146,0,1,42,'Product'),(147,0,1,42,'Product'),(148,0,1,42,'Product'),(149,0,1,42,'Product'),(150,5,1,54,'Product'),(151,4,1,13,'Product'),(152,4,1,42,'Product'),(153,4,1,42,'Product'),(154,0,1,42,'Product'),(155,0,1,42,'Product'),(156,0,1,42,'Product'),(157,0,1,42,'Product'),(158,0,1,42,'Product'),(159,0,1,42,'Product'),(160,0,1,42,'Product'),(161,0,1,42,'Product'),(162,0,1,42,'Product'),(163,0,1,42,'Product'),(164,0,1,42,'Product'),(165,0,1,42,'Product'),(166,0,1,42,'Product'),(167,4,1,42,'Product'),(168,4,1,42,'Product'),(169,4,1,42,'Product'),(170,4,1,42,'Product'),(171,4,1,42,'Product'),(172,4,1,42,'Product'),(173,4,1,42,'Product'),(174,4,1,42,'Product'),(175,4,1,42,'Product'),(176,4,1,42,'Product'),(177,4,1,42,'Product'),(178,4,1,42,'Product'),(179,4,1,42,'Product'),(180,4,1,42,'Product'),(181,4,1,42,'Product'),(182,0,1,42,'Product'),(183,0,1,42,'Product'),(184,0,1,42,'Product'),(185,0,1,42,'Product'),(186,0,1,42,'Product'),(187,0,1,42,'Product'),(188,0,1,42,'Product'),(189,0,1,42,'Product'),(190,0,1,42,'Product'),(191,0,1,42,'Product'),(192,0,1,42,'Product'),(193,0,1,42,'Product'),(194,0,1,42,'Product'),(195,0,1,42,'Product'),(196,0,1,42,'Product'),(197,0,1,42,'Product'),(198,0,1,42,'Product'),(199,0,1,42,'Product'),(200,0,1,42,'Product'),(201,0,1,42,'Product'),(202,0,1,42,'Product'),(203,0,1,42,'Product'),(204,0,1,42,'Product'),(205,0,1,42,'Product'),(206,0,1,42,'Product'),(207,0,1,42,'Product'),(208,4,1,42,'Product'),(209,4,1,42,'Product'),(210,0,1,42,'Product'),(211,0,1,42,'Product'),(212,0,1,42,'Product'),(213,0,1,42,'Product'),(214,0,1,42,'Product'),(215,0,1,42,'Product'),(216,0,1,42,'Product'),(217,0,1,42,'Product'),(218,0,1,42,'Product'),(219,0,1,42,'Product'),(220,0,1,42,'Product'),(221,0,1,42,'Product'),(222,0,1,42,'Product'),(223,4,1,42,'Product'),(224,4,1,42,'Product'),(225,4,1,42,'Product'),(226,4,1,42,'Product'),(227,4,1,42,'Product'),(228,4,1,42,'Product'),(229,4,1,42,'Product'),(230,4,1,42,'Product'),(231,4,1,42,'Product'),(232,4,1,42,'Product'),(233,4,1,42,'Product'),(234,4,1,42,'Product'),(235,4,1,42,'Product'),(236,4,1,42,'Product'),(237,4,1,42,'Product'),(238,0,1,42,'Product'),(239,0,1,42,'Product'),(240,0,1,42,'Product'),(241,0,1,42,'Product'),(242,0,1,42,'Product'),(243,0,1,42,'Product'),(244,0,1,42,'Product'),(245,0,1,42,'Product'),(246,0,1,42,'Product'),(247,0,1,42,'Product'),(248,0,1,42,'Product'),(249,0,1,42,'Product'),(250,0,1,42,'Product'),(251,0,1,42,'Product'),(252,0,1,42,'Product'),(253,0,1,42,'Product'),(254,0,1,42,'Product'),(255,0,1,42,'Product'),(256,0,1,42,'Product'),(257,0,1,42,'Product'),(258,0,1,42,'Product'),(259,0,1,42,'Product'),(260,0,1,42,'Product'),(261,0,1,42,'Product'),(262,0,1,42,'Product'),(263,0,1,42,'Product'),(264,4,1,42,'Product'),(265,4,1,42,'Product'),(266,0,1,42,'Product'),(267,0,1,42,'Product'),(268,0,1,42,'Product'),(269,0,1,42,'Product'),(270,0,1,42,'Product'),(271,0,1,42,'Product'),(272,0,1,42,'Product'),(273,0,1,42,'Product'),(274,0,1,42,'Product'),(275,0,1,42,'Product'),(276,0,1,42,'Product'),(277,0,1,42,'Product'),(278,0,1,42,'Product'),(279,4,1,42,'Product'),(280,4,1,42,'Product'),(281,4,1,42,'Product'),(282,4,1,42,'Product'),(283,4,1,42,'Product'),(284,4,1,42,'Product'),(285,4,1,42,'Product'),(286,4,1,42,'Product'),(287,4,1,42,'Product'),(288,4,1,42,'Product'),(289,4,1,42,'Product'),(290,4,1,42,'Product'),(291,4,1,42,'Product'),(292,4,1,42,'Product'),(293,4,1,42,'Product'),(294,0,1,42,'Product'),(295,0,1,42,'Product'),(296,0,1,42,'Product'),(297,0,1,42,'Product'),(298,0,1,42,'Product'),(299,0,1,42,'Product'),(300,0,1,42,'Product'),(301,0,1,42,'Product'),(302,0,1,42,'Product'),(303,0,1,42,'Product'),(304,0,1,42,'Product'),(305,0,1,42,'Product'),(306,0,1,42,'Product'),(307,0,1,42,'Product'),(308,0,1,42,'Product'),(309,0,1,42,'Product'),(310,0,1,42,'Product'),(311,0,1,42,'Product'),(312,0,1,42,'Product'),(313,0,1,42,'Product'),(314,0,1,42,'Product'),(315,0,1,42,'Product'),(316,0,1,42,'Product'),(317,0,1,42,'Product'),(318,0,1,42,'Product'),(319,0,1,42,'Product'),(320,5,1,52,'Product'),(321,0,1,14,'Product'),(322,0,1,15,'Product'),(323,4,1,13,'Product'),(324,4,1,13,'Product'),(325,0,1,26,'Product'),(326,0,1,18,'Product'),(327,0,1,17,'Product'),(328,0,1,16,'Product'),(329,4,1,39,'Product'),(330,4,1,39,'Product'),(331,4,1,39,'Product'),(332,4,1,39,'Product'),(333,4,1,40,'Product'),(334,4,1,40,'Product'),(335,4,1,40,'Product'),(336,4,1,40,'Product'),(337,0,1,28,'Product'),(338,0,1,26,'Product'),(339,0,1,27,'Product'),(340,4,1,13,'Product'),(341,4,1,13,'Product'),(342,4,1,13,'Product'),(343,4,1,13,'Product'),(344,0,1,14,'Product'),(345,5,1,6,'Product'),(346,5,1,6,'Product'),(347,5,1,6,'Product'),(348,5,1,6,'Product'),(349,5,1,7,'Product'),(350,5,1,7,'Product'),(351,5,1,7,'Product'),(352,5,1,7,'Product'),(353,4,1,39,'Product'),(354,4,1,39,'Product'),(355,4,1,39,'Product'),(356,4,1,39,'Product'),(357,4,1,39,'Product'),(358,0,1,33,'Product'),(359,0,1,32,'Product'),(360,0,1,31,'Product'),(361,0,1,30,'Product'),(362,0,1,29,'Product'),(363,4,1,26,'Product'),(364,4,1,26,'Product'),(365,4,1,26,'Product'),(366,4,1,26,'Product'),(367,4,1,26,'Product'),(368,0,1,27,'Product'),(369,0,1,26,'Product'),(370,0,1,26,'Product'),(371,0,1,26,'Product'),(372,0,1,26,'Product'),(373,0,1,26,'Product'),(374,0,1,26,'Product'),(375,4,1,26,'Product'),(376,4,1,26,'Product'),(377,4,1,26,'Product'),(378,4,1,26,'Product'),(379,4,1,26,'Product'),(380,4,1,26,'Product'),(381,4,1,26,'Product'),(382,4,1,26,'Product'),(383,4,1,26,'Product'),(384,4,1,26,'Product'),(385,4,1,26,'Product'),(386,4,1,26,'Product'),(387,2,1,26,'Product'),(388,2,1,26,'Product'),(389,2,1,26,'Product'),(390,2,1,26,'Product'),(391,2,1,26,'Product'),(392,2,1,26,'Product'),(393,4,1,26,'Product'),(394,4,1,26,'Product'),(395,4,1,26,'Product'),(396,4,1,26,'Product'),(397,4,1,26,'Product'),(398,4,1,26,'Product'),(399,5,1,22,'Product'),(400,5,1,22,'Product'),(401,5,1,22,'Product'),(402,5,1,22,'Product'),(403,5,1,22,'Product'),(404,5,1,22,'Product'),(405,4,1,49,'Product'),(406,4,1,48,'Product'),(407,3,1,47,'Product'),(408,4,1,51,'Product'),(409,5,1,36,'Product'),(410,5,1,36,'Product'),(411,5,1,36,'Product'),(412,5,1,36,'Product'),(413,4,1,43,'Product'),(414,4,1,23,'Product'),(415,5,1,25,'Product'),(416,3,1,24,'Product'),(417,4,1,26,'Copulation'),(418,4,1,25,'Copulation'),(419,4,1,20,'Copulation'),(420,5,1,44,'Product');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,2,54,'Lorem ipsum ipsum ipsum',12345,NULL),(2,2,48,'Косточка5',3454,NULL),(3,3,54,'Lorem ipsum ipsum ipsum',12345,NULL),(4,3,48,'Косточка5',3454,NULL),(5,3,49,'Lorem ipsum ipsum ipsum',12345,NULL),(6,3,50,'Lorem ipsum ipsum ipsum',12345,NULL),(7,4,52,'Lorem ipsum ipsum ipsum',12345,1),(8,4,49,'Lorem ipsum ipsum ipsum',12345,1),(9,4,48,'Косточка5',3454,2),(10,5,54,'Lorem ipsum ipsum ipsum',12345,3),(11,5,54,'Lorem ipsum ipsum ipsum',12345,3),(12,5,24,'Samsung',10000,2);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'gdfgdf','gdfgd','fgdfgdf','aef','sdfsg','dfgdf','fgdfgd','fgdf'),(2,1,'gdfgdf','gdfgd','fgdfgdf','aef','sdfsg','dfgdf','fgdfgd','fgdf'),(3,1,'Uzhgorod','Ukraine','misha@gmail.com','Misha','Skubenych','3245245245','test 34','88000'),(4,1,'sfgsf','fadf','desfd','Misha','Misha','3423525','sfgsfg','2342'),(5,1,NULL,NULL,NULL,'rthsrths',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `scorp` tinyint(1) DEFAULT NULL,
  `rkf` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Стаття 1','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,0,0,'2015-07-14 19:20:19','2015-07-14 19:20:19',NULL,NULL,NULL,NULL),(3,'Стаття 2','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,0,1,'2015-07-14 19:20:52','2015-07-14 19:20:52','cat1.jpg','image/jpeg',13569,'2015-07-14 19:20:52');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `family` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `shop_subcategory_id` int(11) DEFAULT NULL,
  `views_count` int(11) DEFAULT '0',
  `material` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (6,'Доска','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',12000,'cat','2015-07-05 14:43:58','2015-07-05 14:43:58',NULL,0,NULL,NULL,NULL,NULL),(7,'Доска2','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',12000,'dog','2015-07-05 14:44:04','2015-07-05 14:44:04',NULL,0,NULL,NULL,NULL,NULL),(8,'Доска2','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',16000,'dog','2015-07-05 14:44:09','2015-07-05 14:44:09',NULL,0,NULL,NULL,NULL,NULL),(9,'iPhone','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',16000,'dog','2015-07-05 14:44:17','2015-07-05 14:44:17',NULL,0,NULL,NULL,NULL,NULL),(10,'iPhone','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',32000,'dog','2015-07-05 14:44:21','2015-07-05 14:44:21',NULL,0,NULL,NULL,NULL,NULL),(11,'iPhone 6S','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',32000,'dog','2015-07-05 14:44:29','2015-07-05 14:44:29',NULL,0,NULL,NULL,NULL,NULL),(12,'Samsung','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',10000,'dog','2015-07-05 14:44:39','2015-07-05 14:44:39',NULL,0,NULL,NULL,NULL,NULL),(13,'Samsung','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',10000,'dog','2015-07-05 14:44:43','2015-07-12 23:42:51',NULL,2,NULL,NULL,NULL,NULL),(14,'Samsung','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',10000,'dog','2015-07-05 14:44:50','2015-07-05 14:44:50',NULL,0,NULL,NULL,NULL,NULL),(15,'Samsung','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',10000,'dog','2015-07-05 14:45:14','2015-07-05 14:45:14',NULL,0,NULL,NULL,NULL,NULL),(16,'Samsung','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',10000,'dog','2015-07-05 14:45:22','2015-07-05 14:45:22',NULL,0,NULL,NULL,NULL,NULL),(17,'Samsung','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',10000,'dog','2015-07-05 14:45:24','2015-07-05 14:45:24',NULL,0,NULL,NULL,NULL,NULL),(18,'Samsung','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',10000,'dog','2015-07-05 14:45:26','2015-07-05 14:45:26',NULL,0,NULL,NULL,NULL,NULL),(19,'Samsung','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',10000,'cat','2015-07-05 14:45:29','2015-07-05 14:45:29',NULL,0,NULL,NULL,NULL,NULL),(20,'Samsung','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',10000,'cat','2015-07-05 14:45:31','2015-07-05 14:45:31',NULL,0,NULL,NULL,NULL,NULL),(21,'Samsung','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',10000,'cat','2015-07-05 14:45:33','2015-07-05 14:45:33',NULL,0,NULL,NULL,NULL,NULL),(22,'Samsung','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',10000,'cat','2015-07-05 14:45:35','2015-07-05 14:45:35',NULL,0,NULL,NULL,NULL,NULL),(23,'Samsung','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',10000,'cat','2015-07-05 14:45:36','2015-07-05 14:45:36',NULL,0,NULL,NULL,NULL,NULL),(24,'Samsung','lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',10000,'cat','2015-07-05 14:45:38','2015-07-12 16:22:58',NULL,1,NULL,NULL,NULL,NULL),(25,'Lorem ipsum dolor','adfff sdf dfs  sd',12000,'dog','2015-07-05 15:07:16','2015-07-12 16:22:30',NULL,1,NULL,NULL,NULL,NULL),(26,'Кость','Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',12000,'dog','2015-07-07 09:54:49','2015-07-07 09:54:49',NULL,0,NULL,NULL,NULL,NULL),(27,'Кость','Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',12000,'dog','2015-07-07 09:54:52','2015-07-07 09:54:52',NULL,0,NULL,NULL,NULL,NULL),(28,'Кость','Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',12000,'dog','2015-07-07 09:54:53','2015-07-07 09:54:53',NULL,0,NULL,NULL,NULL,NULL),(29,'Кость','Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',12000,'dog','2015-07-07 09:54:55','2015-07-07 09:54:55',NULL,0,NULL,NULL,NULL,NULL),(30,'Кость','Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',12000,'dog','2015-07-07 09:54:57','2015-07-07 09:54:57',NULL,0,NULL,NULL,NULL,NULL),(31,'Кость','Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',12000,'dog','2015-07-07 09:54:58','2015-07-07 09:54:58',NULL,0,NULL,NULL,NULL,NULL),(32,'Кость','Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',12000,'dog','2015-07-07 09:55:00','2015-07-07 09:55:00',NULL,0,NULL,NULL,NULL,NULL),(33,'Косточка','Якась бля косточка Якась бля косточка Якась бля косточка Якась бля косточка Якась бля косточка Якась бля косточка',12,'dog','2015-07-07 21:18:28','2015-07-07 21:18:28',NULL,0,NULL,NULL,NULL,NULL),(34,'Косточка','Якась бля косточка Якась бля косточка Якась бля косточка Якась бля косточка Якась бля косточка Якась бля косточка',12,'dog','2015-07-07 21:18:29','2015-07-07 21:18:29',NULL,0,NULL,NULL,NULL,NULL),(35,'Косточка','Якась бля косточка Якась бля косточка Якась бля косточка Якась бля косточка Якась бля косточка Якась бля косточка',12,'dog','2015-07-07 21:18:31','2015-07-07 21:18:31',NULL,0,NULL,NULL,NULL,NULL),(36,'Мячик','Мячик мячик мячик мячик мячик мячик мячик мячик мячик мячик мячик',456,'dog','2015-07-07 21:19:02','2015-07-07 21:19:02',NULL,0,NULL,NULL,NULL,NULL),(37,'Мячик','Мячик мячик мячик мячик мячик мячик мячик мячик мячик мячик мячик',456,'dog','2015-07-07 21:19:04','2015-07-07 21:19:04',NULL,0,NULL,NULL,NULL,NULL),(38,'Косточка','Якась бля косточка Якась бля косточка Якась бля косточка Якась бля косточка Якась бля косточка Якась бля косточка',12,'dog','2015-07-07 21:19:08','2015-07-07 21:19:08',NULL,0,NULL,NULL,NULL,NULL),(39,'Косточка','Якась бля косточка Якась бля косточка Якась бля косточка Якась бля косточка Якась бля косточка Якась бля косточка',12,'dog','2015-07-07 21:19:10','2015-07-07 21:19:10',NULL,0,NULL,NULL,NULL,NULL),(40,'Lorem ipsum ipsum ipsum','Мячик мячик мячик мячик мячик мячик мячик мячик мячик мячик мячик',456,'dog','2015-07-07 21:19:12','2015-07-13 09:21:44',13,2,NULL,NULL,NULL,NULL),(41,'Якась хуйня','Мячик мячик мячик мячик мячик мячик мячик мячик мячик мячик мячик',456,'dog','2015-07-07 21:19:25','2015-07-07 21:19:25',NULL,0,NULL,NULL,NULL,NULL),(42,'Косточка','рг ргрргрг рг ргрргрг рг ргрргрг рг ргрргрг рг ргрргрг рг ргрргрг рг ргрргрг рг ргрргрг рг ргрргрг',4589,'dog','2015-07-08 21:32:12','2015-07-08 21:32:12',NULL,0,NULL,NULL,NULL,NULL),(43,'Косточка2','рг ргрргрг рг ргрргрг рг ргрргрг рг ргрргрг рг ргрргрг рг ргрргрг рг ргрргрг рг ргрргрг рг ргрргрг',4589,'dog','2015-07-08 21:33:45','2015-07-08 21:33:45',NULL,0,NULL,NULL,NULL,NULL),(44,'Косточка3','яаів фваі авіва яаів фваі авіва яаів фваі авіва яаів фваі авіва яаів фваі авіва яаів фваі авіва',34000,'dog','2015-07-08 21:34:23','2015-07-13 16:04:06',NULL,1,NULL,NULL,NULL,NULL),(45,'Косточка4','яаів фваі авіва яаів фваі авіва яаів фваі авіва яаів фваі авіва яаів фваі авіва яаів фваі авіва',34000,'dog','2015-07-08 21:35:26','2015-07-08 21:35:26',NULL,0,NULL,NULL,NULL,NULL),(46,'Косточка4','яаів фваі авіва яаів фваі авіва яаів фваі авіва яаів фваі авіва яаів фваі авіва яаів фваі авіва',34000,'dog','2015-07-08 21:35:29','2015-07-08 21:35:29',NULL,0,NULL,NULL,NULL,NULL),(47,'Косточка5','ва івпаі іава івпаі іава івпаі іава івпаі іава івпаі іа',3454,'dog','2015-07-08 21:36:08','2015-07-08 21:36:08',12,0,NULL,NULL,NULL,NULL),(48,'Косточка5','ва івпаі іава івпаі іава івпаі іава івпаі іава івпаі іа',3454,'dog','2015-07-08 21:36:11','2015-07-08 21:43:46',12,0,NULL,NULL,NULL,NULL),(49,'Lorem ipsum ipsum ipsum','Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem',12345,'dog','2015-07-09 22:02:38','2015-07-09 22:02:38',4,0,NULL,NULL,NULL,NULL),(50,'Lorem ipsum ipsum ipsum','Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem',12345,'dog','2015-07-09 22:02:40','2015-07-09 22:02:40',4,0,NULL,NULL,NULL,NULL),(51,'Lorem ipsum ipsum ipsum','Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem',12345,'dog','2015-07-09 22:02:42','2015-07-09 22:02:42',4,0,NULL,NULL,NULL,NULL),(52,'Lorem ipsum ipsum ipsum','Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem',12345,'dog','2015-07-09 22:02:58','2015-07-14 12:55:04',4,4,NULL,NULL,NULL,NULL),(53,'Lorem ipsum ipsum ipsum','Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem',12345,'dog','2015-07-09 22:03:00','2015-07-13 09:14:45',4,5,NULL,NULL,NULL,NULL),(54,'Lorem ipsum ipsum ipsum','Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem Lorem ipsum lorem',12345,'dog','2015-07-09 22:03:01','2015-07-12 11:00:27',4,2,NULL,NULL,NULL,NULL),(55,'Супер категория','Какой то товар Какой то товар Какой то товар Какой то товар Какой то товар Какой то товар',3412,'cat','2015-07-15 20:11:25','2015-07-15 20:11:45',12,1,'дерево','10 см','1кг','Япония');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'user'),(2,'admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1,1),(2,1,1),(3,1,2),(4,2,1),(5,2,1),(6,3,1),(7,3,1),(14,7,1),(15,7,1),(24,12,1),(25,12,1),(26,13,1),(27,13,1),(28,14,1),(29,14,1),(30,15,1),(31,15,1),(32,16,1),(33,16,1),(34,17,1),(35,17,1),(36,18,1),(37,18,1),(38,19,1),(39,19,1),(40,19,1),(41,20,1),(42,20,1),(43,20,1),(44,21,1),(45,21,1),(46,21,1),(47,22,1),(48,22,1),(49,22,1),(50,23,1),(51,23,1),(52,23,1),(53,24,1),(54,24,1),(55,24,1),(56,25,1),(57,25,1),(58,25,1),(59,26,1),(60,26,1),(61,26,1),(62,27,1),(63,27,1),(64,27,1),(65,28,1),(66,28,1),(67,28,1),(68,29,1),(69,29,1),(70,29,1),(71,30,1),(72,30,1),(73,30,1),(74,31,1),(75,31,1),(76,31,1),(77,32,1),(78,32,1),(79,32,1),(80,33,1),(81,33,1),(82,33,1),(83,34,1),(84,34,1),(85,34,1),(86,35,1),(87,35,1),(88,35,1),(89,36,1),(90,36,1),(91,36,1),(92,37,1),(93,37,1),(94,37,1),(95,38,1),(96,38,1),(97,38,1),(98,39,1),(99,39,1),(100,39,1),(101,40,1),(102,40,1),(103,40,1),(104,41,1),(105,41,1),(106,41,1),(107,42,1),(108,42,1),(109,42,1),(110,43,1),(111,43,1),(112,43,1),(113,44,1),(114,44,1),(115,44,1),(116,45,1),(117,45,1),(118,45,1),(119,46,1),(120,46,1),(121,46,1),(122,47,1),(123,47,1),(124,47,1),(125,48,1),(126,48,1),(127,48,1),(128,49,1),(129,49,1),(130,49,1),(131,50,1),(132,50,1),(133,50,1),(134,51,1),(135,51,1),(136,51,1),(137,52,1),(138,52,1),(139,52,1),(140,53,1),(141,53,1),(142,53,1),(143,54,1),(144,54,1),(145,54,1),(146,55,1),(147,55,1),(148,55,1),(149,56,1),(150,56,1),(151,56,1),(152,57,1),(153,57,1),(154,57,1),(155,58,1),(156,58,1),(157,58,1),(158,59,1),(159,59,1),(160,59,1),(161,60,1),(162,60,1),(163,60,1),(164,61,1),(165,61,1),(166,61,1),(167,62,1),(168,62,1),(169,62,1),(170,63,1),(171,63,1),(172,63,1),(173,64,1),(174,64,1),(175,64,1),(176,65,1),(177,65,1),(178,65,1),(179,66,1),(180,66,1),(181,66,1),(182,67,1),(183,67,1),(184,67,1),(185,68,1),(186,68,1),(187,68,1);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `scorp` tinyint(1) DEFAULT NULL,
  `rkf` tinyint(1) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `price` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `prize_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prize_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prize_file_size` int(11) DEFAULT NULL,
  `prize_updated_at` datetime DEFAULT NULL,
  `bloodline_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bloodline_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bloodline_file_size` int(11) DEFAULT NULL,
  `bloodline_updated_at` datetime DEFAULT NULL,
  `mothers_photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mothers_photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mothers_photo_file_size` int(11) DEFAULT NULL,
  `mothers_photo_updated_at` datetime DEFAULT NULL,
  `fathers_photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fathers_photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fathers_photo_file_size` int(11) DEFAULT NULL,
  `fathers_photo_updated_at` datetime DEFAULT NULL,
  `reject_reason` text COLLATE utf8_unicode_ci,
  `breed_id` int(11) DEFAULT NULL,
  `views_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'dog','Barsik',24,1,0,'Прикольный клип на мотивы из фильма Властелин колец (Lord Of The Rings).\r\nКлип не мой, респект ребятам сделавшим его и опубликовавшим на своем сайте.',34344,1,NULL,'2015-06-07 22:05:27','2015-07-13 11:09:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(2,'cat','Barsik',12,1,0,'Прикольный клип на мотивы из фильма Властелин колец (Lord Of The Rings).\r\nКлип не мой, респект ребятам сделавшим его и опубликовавшим на своем сайте.',12,1,NULL,'2015-06-07 22:06:25','2015-07-13 11:09:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(3,'dog','Barsik',354,1,0,'sfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fd',34555,1,NULL,'2015-06-10 13:04:50','2015-07-13 11:09:32','meta-moskow-logo.png','image/png',14021,'2015-06-10 13:04:50','marketing-icon.png','image/png',4933,'2015-06-10 13:04:50','scroll-icon.svg','image/svg+xml',1029,'2015-06-10 13:04:50','meta-moskow-logo.svg','image/svg+xml',2383,'2015-06-10 13:04:50',NULL,NULL,0),(10,'dog','Barsik',34,0,0,'sfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fd',233333,1,NULL,'2015-06-10 13:05:45','2015-07-13 11:09:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'device-icon.png','image/png',24335,'2015-06-10 13:05:45',NULL,NULL,NULL,NULL,NULL,NULL,0),(11,'dog','Barsik',34,0,0,'sfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fdsfdgsgsrfgsgse safas fd',233333,1,NULL,'2015-06-10 13:05:46','2015-07-13 11:09:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'device-icon.png','image/png',24335,'2015-06-10 13:05:46',NULL,NULL,NULL,NULL,NULL,NULL,0),(28,'cat','Barsik',12,1,0,'<p>фіавфа іфваф ваі  фіавфа іфваф ваі <span></span>фіавфа іфваф ваі\r\n</p>',340,1,NULL,'2015-07-10 13:09:30','2015-07-13 11:09:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,0),(29,'dog','Barsik',34,1,0,'<p>sadfd adf df\r\n</p>',23,1,NULL,'2015-07-10 13:15:02','2015-07-14 11:44:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1),(30,'dog','Barsik',34,1,0,'<p>adfsad\r\n</p>',34,1,1,'2015-07-10 13:25:29','2015-07-13 11:09:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,0),(31,'cat','Barsik',21,1,0,'<p>ІВФ\r\n</p>',21,1,NULL,'2015-07-10 13:55:12','2015-07-13 11:09:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1),(32,'dog','Barsik',21,1,0,'<p>sfdas asf a\r\n</p>',34,1,NULL,'2015-07-10 13:58:55','2015-07-13 11:09:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(33,'dog','Barsik',21,0,0,'<p>SFADF\r\n</p>',34,1,1,'2015-07-10 13:59:21','2015-07-13 11:09:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(34,'dog','Barsik',2,1,0,'<p>ASFDS ADF\r\n</p>',34,1,1,'2015-07-10 14:00:19','2015-07-13 11:16:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,3);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150524163833'),('20150524170357'),('20150526141928'),('20150526164344'),('20150528103307'),('20150529133959'),('20150529134049'),('20150530105445'),('20150530105659'),('20150531123941'),('20150604201953'),('20150604212957'),('20150606180938'),('20150607132636'),('20150607214803'),('20150607214841'),('20150617115622'),('20150618143750'),('20150619101153'),('20150701080717'),('20150701163248'),('20150701165205'),('20150702073355'),('20150702092855'),('20150702114802'),('20150702151423'),('20150704140000'),('20150708204136'),('20150709065636'),('20150709070202'),('20150710120402'),('20150711162651'),('20150711172857'),('20150711182748'),('20150712092120'),('20150712124611'),('20150712224951'),('20150714162345'),('20150714191929'),('20150715102029'),('20150715195434'),('20150715201935');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,'0a2651b8f8eeb52c155376b4d8db55811630cb5f0708c5b7b25127708a26f3eb',2,'2015-05-27 10:13:30','2015-05-27 10:13:46'),(3,'fa99981ac317c68e687bca1b33fd25070ae170f6ae8badcd55f7ba9bab1d9594',1,'2015-05-27 10:44:34','2015-05-27 11:14:13'),(8,'3a83b9df8a9bd1ccdc74fb2753ef28114b872fb3611e8228a65e73a1fb3aabba',6,'2015-05-28 10:20:44','2015-05-28 10:20:44'),(9,'f66f67a5b2bbe1baa80d26cbfa7acb898a585a1899bba5be0d5c13b9bdbcc07a',7,'2015-05-28 11:35:53','2015-05-28 11:35:53'),(10,'644ae57acf17dd0cf84e06e6d1d825c51eda3fe922407629300a3d0f8a9e6e69',8,'2015-05-28 11:36:41','2015-05-28 11:37:58'),(12,'d2b372643550092427d452ecf2b3967833ddc1e7a3f0c617c13ddba675173e4e',10,'2015-05-28 11:39:01','2015-05-28 11:39:01'),(13,'1ef445260dcb4df556bf77e6a103bec67f44bcb9ee849de5d41d204bb4d95f6f',11,'2015-05-28 11:40:06','2015-05-28 11:40:06'),(14,'9cbac2b9e0d224bc4112c84aecac3a7b49256c6fad96b1a5e17791e2838532b3',12,'2015-05-28 11:41:06','2015-05-28 11:41:06'),(17,'8dc1eb271524bef08306398e37cf5211dd8e303698b512061b6f17b0ab4c8290',13,'2015-05-28 13:09:46','2015-05-28 13:09:46'),(18,'b9a3710c4b45408839512473adcedf4edca6a7adad5209dc17fed64589e34b03',1,'2015-06-04 19:13:55','2015-06-04 21:49:56'),(24,'5592576b973936efa4fd4846304d2d2479fad8e3c541b826e62306e9ca7705a8',14,'2015-06-07 17:08:12','2015-06-07 17:08:13'),(26,'d8dea7343368c93b8f0d82b8b8762a0063c1495746f7fa9a2ba13a7757057230',1,'2015-06-07 21:00:58','2015-06-07 22:47:24'),(29,'77b40ab0da3c7a56d407bdf13453d016c43ecc241c37854101f986bb26467829',1,'2015-06-11 07:25:04','2015-06-11 11:58:48'),(36,'77975d1cf095ed31e5260a483757772e3f053aa9d7b7baef0f90e521d559293a',15,'2015-06-16 19:29:57','2015-06-16 19:29:57'),(39,'1d80a1234b1220043d95bb8d6b9cee86f2a268e02e037dce641ab40f0788867b',16,'2015-06-17 06:02:00','2015-06-17 06:02:01'),(48,'e3132354547f799b9c91a00c1c7063a35ac49ee115d7ec5f004f6b1667ca9c27',17,'2015-06-18 18:07:32','2015-06-18 18:07:33'),(52,'da62ab254a08974ea5b29b5a3034d6d231fd755ed33e3cba23f78a4ed7ef66fe',1,'2015-06-19 13:05:53','2015-06-19 13:09:05'),(53,'43deda88797bca738a571b8538ead463ee71367964267c28053d3d2a88424baa',1,'2015-07-01 08:05:45','2015-07-01 10:55:45'),(54,'ced69638e55045929ef491884b7c7f00d6751bbfcb158303f4caa86b2df94dc7',1,'2015-07-01 15:53:22','2015-07-01 15:53:34'),(56,'33cfa953934c93386176cff44dda5db63f25e324d96449d70a65d7e2b4357ba1',1,'2015-07-02 07:32:24','2015-07-02 07:40:35'),(57,'b409cd52df3419743cb65ba6a77b4a53f5127fc8cf378a7a82162d2152384215',1,'2015-07-02 08:52:04','2015-07-02 12:25:17'),(59,'42a1a11de55c90f10f67269318e3193e73227fdb6d7a1e14cacffec44054953f',1,'2015-07-05 13:41:20','2015-07-05 16:10:46'),(60,'a0a5bce2c4b43db124e2e1bbe3215ceb4405434d56cc4ee99358a4d077a1a1c9',1,'2015-07-07 09:53:53','2015-07-07 10:20:26'),(66,'cc7606f1d2e25a7aa6740392211324fdf934fc80e4c0a0e97c29b2ec3d55a687',1,'2015-07-09 13:49:38','2015-07-09 14:31:04'),(72,'76cacb37184b189c419da2368404f920622f51ab33b4ef9f853f539f62492d2c',1,'2015-07-10 12:05:55','2015-07-10 14:12:05'),(74,'8903e4856458b85103d420ba59d5370a6fe2cb15524f84eb4a8e98017ccb9d75',1,'2015-07-10 15:04:13','2015-07-10 15:11:03'),(89,'598d90844f3b63bc82a11018bf8f1a88848ad84ff191b51c7e950addd5b0c791',1,'2015-07-13 09:09:43','2015-07-13 09:27:12'),(90,'e49e8098c29e039679d265d96ba3734c8a13eb17dd7b484b65e95d96b557a786',1,'2015-07-13 10:34:02','2015-07-13 10:35:02'),(91,'126ce750fac6229125fa7377c7db40e24f85106c32f5bdef5d3ceab900bacd4c',1,'2015-07-13 12:49:39','2015-07-13 12:49:46'),(92,'e89af21885ad238fa26316866888bbf4f4d0c98c1a42bec84b8d1b78a2c58836',1,'2015-07-13 16:02:04','2015-07-13 16:08:06'),(94,'65c71efbd663a54078bbab59b8648e8c7174e543968ef2072e9a7121fe4b3f7c',1,'2015-07-14 11:46:51','2015-07-14 12:54:50'),(96,'f349a9a16dae459774ebc0ae0ec3164660e5f235edf642f6f6728867ace7a79b',18,'2015-07-14 16:02:59','2015-07-14 16:03:00'),(98,'db8d6438fbc8a0c441326189edfc590768f2ba3e34fd7b236d2b2560e3792e9e',1,'2015-07-14 18:56:23','2015-07-14 20:05:36'),(103,'6140e77707268c015c5628d0dfb8f563ba289b1d9ff006a9df22669d18b676b2',21,'2015-07-15 15:32:55','2015-07-15 15:33:31'),(105,'a9259fd544d64ea0fd9c52756bc93484916a3168527bfa82aa75ddd343642c3d',21,'2015-07-15 18:58:01','2015-07-15 19:08:04'),(106,'594c045ce3248b4f2b84277535721be88c3fa8dddabca656c311bf559ce5864f',1,'2015-07-16 13:52:49','2015-07-16 13:52:54');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_categories`
--

DROP TABLE IF EXISTS `shop_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_ru` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_categories`
--

LOCK TABLES `shop_categories` WRITE;
/*!40000 ALTER TABLE `shop_categories` DISABLE KEYS */;
INSERT INTO `shop_categories` VALUES (2,'Одежда','Dress'),(3,'Игрушки','Toys'),(4,'Домик','Domik');
/*!40000 ALTER TABLE `shop_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_categories_news`
--

DROP TABLE IF EXISTS `shop_categories_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_categories_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `shop_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_categories_news`
--

LOCK TABLES `shop_categories_news` WRITE;
/*!40000 ALTER TABLE `shop_categories_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_categories_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_subcategories`
--

DROP TABLE IF EXISTS `shop_subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_ru` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shop_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_subcategories`
--

LOCK TABLES `shop_subcategories` WRITE;
/*!40000 ALTER TABLE `shop_subcategories` DISABLE KEYS */;
INSERT INTO `shop_subcategories` VALUES (1,'subc games','subc games',NULL),(2,'ascad','adsfasfda',NULL),(4,'Просто','Simple',3),(5,'asdfasd','asfdafad',5),(6,'asdfasd','asfdafadasdfasf',5),(9,'adfsdf','dfsdfs',2),(10,'sdafsd','dfsdfsdf',4),(11,'adfasf','adfad',4),(12,'Кости','Bones',3),(13,'Мячики','Balls',3);
/*!40000 ALTER TABLE `shop_subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_subcategories_news`
--

DROP TABLE IF EXISTS `shop_subcategories_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_subcategories_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `shop_subcategory_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_subcategories_news`
--

LOCK TABLES `shop_subcategories_news` WRITE;
/*!40000 ALTER TABLE `shop_subcategories_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_subcategories_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_pages`
--

DROP TABLE IF EXISTS `static_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body_ru` text COLLATE utf8_unicode_ci,
  `body_en` text COLLATE utf8_unicode_ci,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_pages`
--

LOCK TABLES `static_pages` WRITE;
/*!40000 ALTER TABLE `static_pages` DISABLE KEYS */;
INSERT INTO `static_pages` VALUES (1,'<p>дупло хелп\n</p>\n<p><img src=\"/system/attachments/files/000/000/001/original/11356446_432182946960019_241246363_n.jpg?1433453810\">\n</p>','<p>duplo help\n</p>','help'),(2,'<p>Контакти по руски\n</p>','<p>the contacts page\n</p>','contacts'),(3,'<p>правила\n</p>','<p>rrrrrruled\n</p>','rules'),(4,'<p>тима\n</p>','<p>team\n</p>','team');
/*!40000 ALTER TABLE `static_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `rkf` tinyint(1) DEFAULT '0',
  `scorp` tinyint(1) DEFAULT '0',
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin@petmode.com','admin','+0997654193','9f85058b819b387e60a64e4a03b78459fbf185dc8e7a61e9d44daa221b164362','f48fcdc1133f0a1721f7c3df97ef1e56d613261909471e5a9d1a6c91eb4135c7','2015-05-27 10:10:08','2015-06-19 10:22:36',0,0,NULL,NULL,NULL,NULL,0),(2,'Misha','Skubenych','misha@gmail.com','misha','+0997654193','06768028ca41771bc9f6b6fbe9c92ef7d3e5fcd961410056d9863341be4739e2','5e5b804ed237e1de186aa011788c472d77f5e0c7c7ed82b40599aca172ca46cb','2015-05-27 10:13:30','2015-06-19 10:22:35',0,1,NULL,NULL,NULL,NULL,0),(3,'zdvfdz','vzdvz','zvdzvv@dgsdf.com','sdfgsdf','+0997654193','d1c8c66c8030f5e3a9252c06443365bfb16be6f551f3cb8ce1e677f0f1ee8687','44db3153626e29d299588ce64553455c8af05a60e68603bf4f556d4ca5720f7f','2015-05-28 10:04:50','2015-06-19 10:22:34',1,0,NULL,NULL,NULL,NULL,0),(7,'dafsg','sdagsg','sfdgsd@dsgdf.com','adsfafd','+0997654193','1f1e268c4b918d805d89d11b0c362c6c6c498d66a99a7e97b19ebcf1bc8a89cb','3c8a35bd955ce535ae81cb84665a725921be10221b4dea0e51886294672f1bb0','2015-05-28 11:35:53','2015-06-19 10:22:24',1,0,NULL,NULL,NULL,NULL,0),(12,'ASDF','aSDA','adaf@safa.com','adfa','+0997654193','0225c07f66ddcada8e36808fe1d7cb068d51ddacbfac43f1701f2f0dbda96a74','02d6834609184ca69291c9d9cbe3948a24fd7acfefeed3ad5816474734890dad','2015-05-28 11:41:06','2015-06-07 17:11:58',0,1,'font.png','image/png',20783,'2015-05-28 11:41:06',NULL),(13,'des','sdsds','asdaf@dfsadf.com','sadffa','+0997654193','bf565632b8aa707a6131dc4a4982f38ab7a4a5a42efe58b22d8676ab948f0d2a','daf095a8e90201ad4e8a43d0650450435e8529f5ee60541826cef76daaf11658','2015-05-28 13:09:46','2015-06-07 17:11:58',0,1,'dog.png','image/png',3720,'2015-05-28 13:09:46',NULL),(14,'Misha','Skubenych','misha9@gmail.com','misha','+0997654193','44e49b79ffd87d6497b5b8a87225632dd7437bd12c11d18e8f082e938c3c5853','8d85aa9db45593aec88d6e819816ff5bde25448dfa233a8858cfbbc588224f98','2015-06-07 17:08:12','2015-06-19 10:22:46',0,1,'11356446_432182946960019_241246363_n.jpg','image/jpeg',82365,'2015-06-07 17:08:12',1),(15,'Misha','Skubenych','derevo@gmail.com','adfadgsd','32634563573','f240432e179bfce30b9b419ae2d5f0fc89cce5cd33e797632025962eb4f1459e','6a6b8bcb04a2925b59b73e3e183d65e071ed32c365aed9f216741fd2832883e8','2015-06-16 19:29:56','2015-06-19 10:22:40',0,1,'avatar.png','image/png',92494,'2015-06-16 19:29:57',1),(16,'misha','Skubenych','misah@hb.com','misha','453634','543ca949a0f510dd9e9950c954958465963fd625d80fab17712d3992863a5beb','b6aaa1bf1d57d07c0212d489d1a5550541180d42ceca963414f85e0c0f01bb41','2015-06-17 06:02:00','2015-06-17 06:02:00',0,1,'avatar.png','image/png',92494,'2015-06-17 06:02:00',NULL),(17,'Misha','Skubenych','misha@defsfgvs.com','loginmy','234546545','1853722c8cf7efbfe8bf5bee3b450c3e7684629ea02fa4f7b2719e0e19c6818f','32c60798bb82ded1dc7b54d29c867e5b990e18499700cc3b6cc2fe6d355f5574','2015-06-18 18:07:32','2015-06-19 10:07:51',1,1,'cat.png','image/png',2993,'2015-06-19 10:07:51',NULL),(18,'Misha','Skubenych','mykhaylo.skubenych@gmail.com','misha','0997654193','d5c0aac09ae1cf1492424911e0464ad4e359751271d81b2cee275885b8b12761','fb777b96e3f3dff029c8b4aeeda30b1323fb533df5bb03c5038e51ef23f71beb','2015-07-14 16:02:59','2015-07-14 16:03:00',1,0,'11356446_432182946960019_241246363_n.jpg','image/jpeg',82365,'2015-07-14 16:02:59',NULL),(19,'user_0','user_0','user_0@petmode.com','user_0',NULL,'df9a5f4c8c6c57781115d1a0070d3b046badf4c23c1194768872f475a82d51f8','ed646ec2759dc1d56e152aa84951214f3016160fa91148424927f4fd17837b33','2015-07-15 10:59:58','2015-07-15 10:59:58',0,0,NULL,NULL,NULL,NULL,NULL),(20,'user_1','user_1','user_1@petmode.com','user_1',NULL,'df9a5f4c8c6c57781115d1a0070d3b046badf4c23c1194768872f475a82d51f8','ed646ec2759dc1d56e152aa84951214f3016160fa91148424927f4fd17837b33','2015-07-15 10:59:58','2015-07-15 10:59:58',0,0,NULL,NULL,NULL,NULL,NULL),(21,'user_2','user_2','user_2@petmode.com','user_2',NULL,'df9a5f4c8c6c57781115d1a0070d3b046badf4c23c1194768872f475a82d51f8','ed646ec2759dc1d56e152aa84951214f3016160fa91148424927f4fd17837b33','2015-07-15 10:59:58','2015-07-15 10:59:58',0,0,NULL,NULL,NULL,NULL,NULL),(22,'user_3','user_3','user_3@petmode.com','user_3',NULL,'c15e945f31d59f4d53d829eec43a21fba18a02c7c4feec19412ca80c345d2d60','a78d3b848cb870049cbb80518a1c2ce55d20ad1abd421caeafe05d786e1c8c0d','2015-07-15 10:59:59','2015-07-15 10:59:59',0,0,NULL,NULL,NULL,NULL,NULL),(23,'user_4','user_4','user_4@petmode.com','user_4',NULL,'c15e945f31d59f4d53d829eec43a21fba18a02c7c4feec19412ca80c345d2d60','a78d3b848cb870049cbb80518a1c2ce55d20ad1abd421caeafe05d786e1c8c0d','2015-07-15 10:59:59','2015-07-15 10:59:59',0,0,NULL,NULL,NULL,NULL,NULL),(24,'user_5','user_5','user_5@petmode.com','user_5',NULL,'c15e945f31d59f4d53d829eec43a21fba18a02c7c4feec19412ca80c345d2d60','a78d3b848cb870049cbb80518a1c2ce55d20ad1abd421caeafe05d786e1c8c0d','2015-07-15 10:59:59','2015-07-15 10:59:59',0,0,NULL,NULL,NULL,NULL,NULL),(25,'user_6','user_6','user_6@petmode.com','user_6',NULL,'c15e945f31d59f4d53d829eec43a21fba18a02c7c4feec19412ca80c345d2d60','a78d3b848cb870049cbb80518a1c2ce55d20ad1abd421caeafe05d786e1c8c0d','2015-07-15 10:59:59','2015-07-15 10:59:59',0,0,NULL,NULL,NULL,NULL,NULL),(26,'user_7','user_7','user_7@petmode.com','user_7',NULL,'c15e945f31d59f4d53d829eec43a21fba18a02c7c4feec19412ca80c345d2d60','a78d3b848cb870049cbb80518a1c2ce55d20ad1abd421caeafe05d786e1c8c0d','2015-07-15 10:59:59','2015-07-15 10:59:59',0,0,NULL,NULL,NULL,NULL,NULL),(27,'user_8','user_8','user_8@petmode.com','user_8',NULL,'c15e945f31d59f4d53d829eec43a21fba18a02c7c4feec19412ca80c345d2d60','a78d3b848cb870049cbb80518a1c2ce55d20ad1abd421caeafe05d786e1c8c0d','2015-07-15 10:59:59','2015-07-15 10:59:59',0,0,NULL,NULL,NULL,NULL,NULL),(28,'user_9','user_9','user_9@petmode.com','user_9',NULL,'c15e945f31d59f4d53d829eec43a21fba18a02c7c4feec19412ca80c345d2d60','a78d3b848cb870049cbb80518a1c2ce55d20ad1abd421caeafe05d786e1c8c0d','2015-07-15 10:59:59','2015-07-15 10:59:59',0,0,NULL,NULL,NULL,NULL,NULL),(29,'user_10','user_10','user_10@petmode.com','user_10',NULL,'c15e945f31d59f4d53d829eec43a21fba18a02c7c4feec19412ca80c345d2d60','a78d3b848cb870049cbb80518a1c2ce55d20ad1abd421caeafe05d786e1c8c0d','2015-07-15 10:59:59','2015-07-15 10:59:59',0,0,NULL,NULL,NULL,NULL,NULL),(30,'user_11','user_11','user_11@petmode.com','user_11',NULL,'c15e945f31d59f4d53d829eec43a21fba18a02c7c4feec19412ca80c345d2d60','a78d3b848cb870049cbb80518a1c2ce55d20ad1abd421caeafe05d786e1c8c0d','2015-07-15 10:59:59','2015-07-15 10:59:59',0,0,NULL,NULL,NULL,NULL,NULL),(31,'user_12','user_12','user_12@petmode.com','user_12',NULL,'c15e945f31d59f4d53d829eec43a21fba18a02c7c4feec19412ca80c345d2d60','a78d3b848cb870049cbb80518a1c2ce55d20ad1abd421caeafe05d786e1c8c0d','2015-07-15 10:59:59','2015-07-15 10:59:59',0,0,NULL,NULL,NULL,NULL,NULL),(32,'user_13','user_13','user_13@petmode.com','user_13',NULL,'c15e945f31d59f4d53d829eec43a21fba18a02c7c4feec19412ca80c345d2d60','a78d3b848cb870049cbb80518a1c2ce55d20ad1abd421caeafe05d786e1c8c0d','2015-07-15 10:59:59','2015-07-15 10:59:59',0,0,NULL,NULL,NULL,NULL,NULL),(33,'user_14','user_14','user_14@petmode.com','user_14',NULL,'c15e945f31d59f4d53d829eec43a21fba18a02c7c4feec19412ca80c345d2d60','a78d3b848cb870049cbb80518a1c2ce55d20ad1abd421caeafe05d786e1c8c0d','2015-07-15 10:59:59','2015-07-15 10:59:59',0,0,NULL,NULL,NULL,NULL,NULL),(34,'user_15','user_15','user_15@petmode.com','user_15',NULL,'c15e945f31d59f4d53d829eec43a21fba18a02c7c4feec19412ca80c345d2d60','a78d3b848cb870049cbb80518a1c2ce55d20ad1abd421caeafe05d786e1c8c0d','2015-07-15 10:59:59','2015-07-15 10:59:59',0,0,NULL,NULL,NULL,NULL,NULL),(35,'user_16','user_16','user_16@petmode.com','user_16',NULL,'c15e945f31d59f4d53d829eec43a21fba18a02c7c4feec19412ca80c345d2d60','a78d3b848cb870049cbb80518a1c2ce55d20ad1abd421caeafe05d786e1c8c0d','2015-07-15 10:59:59','2015-07-15 10:59:59',0,0,NULL,NULL,NULL,NULL,NULL),(36,'user_17','user_17','user_17@petmode.com','user_17',NULL,'c15e945f31d59f4d53d829eec43a21fba18a02c7c4feec19412ca80c345d2d60','a78d3b848cb870049cbb80518a1c2ce55d20ad1abd421caeafe05d786e1c8c0d','2015-07-15 10:59:59','2015-07-15 10:59:59',0,0,NULL,NULL,NULL,NULL,NULL),(37,'user_18','user_18','user_18@petmode.com','user_18',NULL,'9b49a1af0d618f6557750787b1db5c58ca34a613f0b3e0d979017dd5ec00b81e','3a2dfaf0d6fe6849f805892e1ec4974f91049dfc1a4624e8f4ae5d7ae47b9d10','2015-07-15 11:00:00','2015-07-15 11:00:00',0,0,NULL,NULL,NULL,NULL,NULL),(38,'user_19','user_19','user_19@petmode.com','user_19',NULL,'9b49a1af0d618f6557750787b1db5c58ca34a613f0b3e0d979017dd5ec00b81e','3a2dfaf0d6fe6849f805892e1ec4974f91049dfc1a4624e8f4ae5d7ae47b9d10','2015-07-15 11:00:00','2015-07-15 11:00:00',0,0,NULL,NULL,NULL,NULL,NULL),(39,'user_20','user_20','user_20@petmode.com','user_20',NULL,'9b49a1af0d618f6557750787b1db5c58ca34a613f0b3e0d979017dd5ec00b81e','3a2dfaf0d6fe6849f805892e1ec4974f91049dfc1a4624e8f4ae5d7ae47b9d10','2015-07-15 11:00:00','2015-07-15 11:00:00',0,0,NULL,NULL,NULL,NULL,NULL),(40,'user_21','user_21','user_21@petmode.com','user_21',NULL,'9b49a1af0d618f6557750787b1db5c58ca34a613f0b3e0d979017dd5ec00b81e','3a2dfaf0d6fe6849f805892e1ec4974f91049dfc1a4624e8f4ae5d7ae47b9d10','2015-07-15 11:00:00','2015-07-15 11:00:00',0,0,NULL,NULL,NULL,NULL,NULL),(41,'user_22','user_22','user_22@petmode.com','user_22',NULL,'9b49a1af0d618f6557750787b1db5c58ca34a613f0b3e0d979017dd5ec00b81e','3a2dfaf0d6fe6849f805892e1ec4974f91049dfc1a4624e8f4ae5d7ae47b9d10','2015-07-15 11:00:00','2015-07-15 11:00:00',0,0,NULL,NULL,NULL,NULL,NULL),(42,'user_23','user_23','user_23@petmode.com','user_23',NULL,'9b49a1af0d618f6557750787b1db5c58ca34a613f0b3e0d979017dd5ec00b81e','3a2dfaf0d6fe6849f805892e1ec4974f91049dfc1a4624e8f4ae5d7ae47b9d10','2015-07-15 11:00:00','2015-07-15 11:00:00',0,0,NULL,NULL,NULL,NULL,NULL),(43,'user_24','user_24','user_24@petmode.com','user_24',NULL,'9b49a1af0d618f6557750787b1db5c58ca34a613f0b3e0d979017dd5ec00b81e','3a2dfaf0d6fe6849f805892e1ec4974f91049dfc1a4624e8f4ae5d7ae47b9d10','2015-07-15 11:00:00','2015-07-15 11:00:00',0,0,NULL,NULL,NULL,NULL,NULL),(44,'user_25','user_25','user_25@petmode.com','user_25',NULL,'9b49a1af0d618f6557750787b1db5c58ca34a613f0b3e0d979017dd5ec00b81e','3a2dfaf0d6fe6849f805892e1ec4974f91049dfc1a4624e8f4ae5d7ae47b9d10','2015-07-15 11:00:00','2015-07-15 11:00:00',0,0,NULL,NULL,NULL,NULL,NULL),(45,'user_26','user_26','user_26@petmode.com','user_26',NULL,'9b49a1af0d618f6557750787b1db5c58ca34a613f0b3e0d979017dd5ec00b81e','3a2dfaf0d6fe6849f805892e1ec4974f91049dfc1a4624e8f4ae5d7ae47b9d10','2015-07-15 11:00:00','2015-07-15 11:00:00',0,0,NULL,NULL,NULL,NULL,NULL),(46,'user_27','user_27','user_27@petmode.com','user_27',NULL,'9b49a1af0d618f6557750787b1db5c58ca34a613f0b3e0d979017dd5ec00b81e','3a2dfaf0d6fe6849f805892e1ec4974f91049dfc1a4624e8f4ae5d7ae47b9d10','2015-07-15 11:00:00','2015-07-15 11:00:00',0,0,NULL,NULL,NULL,NULL,NULL),(47,'user_28','user_28','user_28@petmode.com','user_28',NULL,'9b49a1af0d618f6557750787b1db5c58ca34a613f0b3e0d979017dd5ec00b81e','3a2dfaf0d6fe6849f805892e1ec4974f91049dfc1a4624e8f4ae5d7ae47b9d10','2015-07-15 11:00:00','2015-07-15 11:00:00',0,0,NULL,NULL,NULL,NULL,NULL),(48,'user_29','user_29','user_29@petmode.com','user_29',NULL,'9b49a1af0d618f6557750787b1db5c58ca34a613f0b3e0d979017dd5ec00b81e','3a2dfaf0d6fe6849f805892e1ec4974f91049dfc1a4624e8f4ae5d7ae47b9d10','2015-07-15 11:00:00','2015-07-15 11:00:00',0,0,NULL,NULL,NULL,NULL,NULL),(49,'user_30','user_30','user_30@petmode.com','user_30',NULL,'9b49a1af0d618f6557750787b1db5c58ca34a613f0b3e0d979017dd5ec00b81e','3a2dfaf0d6fe6849f805892e1ec4974f91049dfc1a4624e8f4ae5d7ae47b9d10','2015-07-15 11:00:00','2015-07-15 11:00:00',0,0,NULL,NULL,NULL,NULL,NULL),(50,'user_31','user_31','user_31@petmode.com','user_31',NULL,'9b49a1af0d618f6557750787b1db5c58ca34a613f0b3e0d979017dd5ec00b81e','3a2dfaf0d6fe6849f805892e1ec4974f91049dfc1a4624e8f4ae5d7ae47b9d10','2015-07-15 11:00:00','2015-07-15 11:00:00',0,0,NULL,NULL,NULL,NULL,NULL),(51,'user_32','user_32','user_32@petmode.com','user_32',NULL,'9b49a1af0d618f6557750787b1db5c58ca34a613f0b3e0d979017dd5ec00b81e','3a2dfaf0d6fe6849f805892e1ec4974f91049dfc1a4624e8f4ae5d7ae47b9d10','2015-07-15 11:00:00','2015-07-15 11:00:00',0,0,NULL,NULL,NULL,NULL,NULL),(52,'user_33','user_33','user_33@petmode.com','user_33',NULL,'594c68de5b2cf13041645e2cbced3675f0a9ee82ce2112336b565afb5b7c49f1','54e8c9d000e9c69052c638063a76ae4c0eb65c92997ff0e391774b52492421c7','2015-07-15 11:00:01','2015-07-15 11:00:01',0,0,NULL,NULL,NULL,NULL,NULL),(53,'user_34','user_34','user_34@petmode.com','user_34',NULL,'594c68de5b2cf13041645e2cbced3675f0a9ee82ce2112336b565afb5b7c49f1','54e8c9d000e9c69052c638063a76ae4c0eb65c92997ff0e391774b52492421c7','2015-07-15 11:00:01','2015-07-15 11:00:01',0,0,NULL,NULL,NULL,NULL,NULL),(54,'user_35','user_35','user_35@petmode.com','user_35',NULL,'594c68de5b2cf13041645e2cbced3675f0a9ee82ce2112336b565afb5b7c49f1','54e8c9d000e9c69052c638063a76ae4c0eb65c92997ff0e391774b52492421c7','2015-07-15 11:00:01','2015-07-15 11:00:01',0,0,NULL,NULL,NULL,NULL,NULL),(55,'user_36','user_36','user_36@petmode.com','user_36',NULL,'594c68de5b2cf13041645e2cbced3675f0a9ee82ce2112336b565afb5b7c49f1','54e8c9d000e9c69052c638063a76ae4c0eb65c92997ff0e391774b52492421c7','2015-07-15 11:00:01','2015-07-15 11:00:01',0,0,NULL,NULL,NULL,NULL,NULL),(56,'user_37','user_37','user_37@petmode.com','user_37',NULL,'594c68de5b2cf13041645e2cbced3675f0a9ee82ce2112336b565afb5b7c49f1','54e8c9d000e9c69052c638063a76ae4c0eb65c92997ff0e391774b52492421c7','2015-07-15 11:00:01','2015-07-15 11:00:01',0,0,NULL,NULL,NULL,NULL,NULL),(57,'user_38','user_38','user_38@petmode.com','user_38',NULL,'594c68de5b2cf13041645e2cbced3675f0a9ee82ce2112336b565afb5b7c49f1','54e8c9d000e9c69052c638063a76ae4c0eb65c92997ff0e391774b52492421c7','2015-07-15 11:00:01','2015-07-15 11:00:01',0,0,NULL,NULL,NULL,NULL,NULL),(58,'user_39','user_39','user_39@petmode.com','user_39',NULL,'594c68de5b2cf13041645e2cbced3675f0a9ee82ce2112336b565afb5b7c49f1','54e8c9d000e9c69052c638063a76ae4c0eb65c92997ff0e391774b52492421c7','2015-07-15 11:00:01','2015-07-15 11:00:01',0,0,NULL,NULL,NULL,NULL,NULL),(59,'user_40','user_40','user_40@petmode.com','user_40',NULL,'594c68de5b2cf13041645e2cbced3675f0a9ee82ce2112336b565afb5b7c49f1','54e8c9d000e9c69052c638063a76ae4c0eb65c92997ff0e391774b52492421c7','2015-07-15 11:00:01','2015-07-15 11:00:01',0,0,NULL,NULL,NULL,NULL,NULL),(60,'user_41','user_41','user_41@petmode.com','user_41',NULL,'594c68de5b2cf13041645e2cbced3675f0a9ee82ce2112336b565afb5b7c49f1','54e8c9d000e9c69052c638063a76ae4c0eb65c92997ff0e391774b52492421c7','2015-07-15 11:00:01','2015-07-15 11:00:01',0,0,NULL,NULL,NULL,NULL,NULL),(61,'user_42','user_42','user_42@petmode.com','user_42',NULL,'594c68de5b2cf13041645e2cbced3675f0a9ee82ce2112336b565afb5b7c49f1','54e8c9d000e9c69052c638063a76ae4c0eb65c92997ff0e391774b52492421c7','2015-07-15 11:00:01','2015-07-15 11:00:01',0,0,NULL,NULL,NULL,NULL,NULL),(62,'user_43','user_43','user_43@petmode.com','user_43',NULL,'594c68de5b2cf13041645e2cbced3675f0a9ee82ce2112336b565afb5b7c49f1','54e8c9d000e9c69052c638063a76ae4c0eb65c92997ff0e391774b52492421c7','2015-07-15 11:00:01','2015-07-15 11:00:01',0,0,NULL,NULL,NULL,NULL,NULL),(63,'user_44','user_44','user_44@petmode.com','user_44',NULL,'594c68de5b2cf13041645e2cbced3675f0a9ee82ce2112336b565afb5b7c49f1','54e8c9d000e9c69052c638063a76ae4c0eb65c92997ff0e391774b52492421c7','2015-07-15 11:00:01','2015-07-15 11:00:01',0,0,NULL,NULL,NULL,NULL,NULL),(64,'user_45','user_45','user_45@petmode.com','user_45',NULL,'594c68de5b2cf13041645e2cbced3675f0a9ee82ce2112336b565afb5b7c49f1','54e8c9d000e9c69052c638063a76ae4c0eb65c92997ff0e391774b52492421c7','2015-07-15 11:00:01','2015-07-15 11:00:01',0,0,NULL,NULL,NULL,NULL,NULL),(65,'user_46','user_46','user_46@petmode.com','user_46',NULL,'594c68de5b2cf13041645e2cbced3675f0a9ee82ce2112336b565afb5b7c49f1','54e8c9d000e9c69052c638063a76ae4c0eb65c92997ff0e391774b52492421c7','2015-07-15 11:00:01','2015-07-15 11:00:01',0,0,NULL,NULL,NULL,NULL,NULL),(66,'user_47','user_47','user_47@petmode.com','user_47',NULL,'594c68de5b2cf13041645e2cbced3675f0a9ee82ce2112336b565afb5b7c49f1','54e8c9d000e9c69052c638063a76ae4c0eb65c92997ff0e391774b52492421c7','2015-07-15 11:00:01','2015-07-15 11:00:01',0,0,NULL,NULL,NULL,NULL,NULL),(67,'user_48','user_48','user_48@petmode.com','user_48',NULL,'594c68de5b2cf13041645e2cbced3675f0a9ee82ce2112336b565afb5b7c49f1','54e8c9d000e9c69052c638063a76ae4c0eb65c92997ff0e391774b52492421c7','2015-07-15 11:00:01','2015-07-15 11:00:01',0,0,NULL,NULL,NULL,NULL,NULL),(68,'user_49','user_49','user_49@petmode.com','user_49',NULL,'f673332afb848e39952b17e74cf1fd254f108a9bc918e351dafd276829bdfebd','b67c89a67667600e80fcc320de26282c149901ee9165508587924b7007ffdd30','2015-07-15 11:00:02','2015-07-15 11:00:02',0,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL,
  `entity_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
INSERT INTO `views` VALUES (1,34,'Sale','127.0.0.1','2015-07-10 16:39:01','2015-07-11 16:39:01'),(2,34,'Sale','127.0.0.1','2015-07-11 16:39:10','2015-07-11 16:39:10'),(3,33,'Sale','127.0.0.1','2015-07-11 16:39:21','2015-07-11 16:39:21'),(4,26,'Copulation','127.0.0.1','2015-07-11 16:44:35','2015-07-11 16:44:35'),(5,30,'News','127.0.0.1','2015-07-11 16:49:06','2015-07-11 16:49:06'),(6,23,'GoodHand','127.0.0.1','2015-07-11 16:54:36','2015-07-11 16:54:36'),(7,53,'Product','127.0.0.1','2015-07-11 16:57:00','2015-07-11 16:57:00'),(8,50,'Product','127.0.0.1','2015-07-11 17:11:55','2015-07-11 17:11:55'),(9,29,'News','127.0.0.1','2015-07-11 18:21:05','2015-07-11 18:21:05'),(10,31,'Sale','127.0.0.1','2015-07-11 19:31:36','2015-07-11 19:31:36'),(11,24,'Copulation','127.0.0.1','2015-07-11 19:33:38','2015-07-11 19:33:38'),(12,22,'GoodHand','127.0.0.1','2015-07-11 19:41:53','2015-07-11 19:41:53'),(13,53,'Product','127.0.0.1','2015-07-11 19:57:56','2015-07-11 19:57:56'),(14,54,'Product','127.0.0.1','2015-07-11 20:18:16','2015-07-11 20:18:16'),(15,40,'Product','127.0.0.1','2015-07-11 20:21:52','2015-07-11 20:21:52'),(16,13,'Product','127.0.0.1','2015-07-11 20:22:08','2015-07-11 20:22:08'),(17,53,'Product','127.0.0.1','2015-07-12 10:24:50','2015-07-12 10:24:50'),(18,54,'Product','127.0.0.1','2015-07-12 11:00:27','2015-07-12 11:00:27'),(19,52,'Product','127.0.0.1','2015-07-12 12:24:03','2015-07-12 12:24:03'),(20,25,'Product','127.0.0.1','2015-07-12 16:22:30','2015-07-12 16:22:30'),(21,24,'Product','127.0.0.1','2015-07-12 16:22:58','2015-07-12 16:22:58'),(22,52,'Product','127.0.0.1','2015-07-12 16:43:38','2015-07-12 16:43:38'),(23,13,'GoodHand','127.0.0.1','2015-07-12 16:52:40','2015-07-12 16:52:40'),(24,53,'Product','127.0.0.1','2015-07-12 16:57:01','2015-07-12 16:57:01'),(25,19,'News','127.0.0.1','2015-07-12 22:30:50','2015-07-12 22:30:50'),(26,33,'News','127.0.0.1','2015-07-12 22:58:48','2015-07-12 22:58:48'),(27,26,'Copulation','127.0.0.1','2015-07-12 23:22:40','2015-07-12 23:22:40'),(28,25,'Copulation','127.0.0.1','2015-07-12 23:22:49','2015-07-12 23:22:49'),(29,24,'Copulation','127.0.0.1','2015-07-12 23:22:57','2015-07-12 23:22:57'),(30,13,'Product','127.0.0.1','2015-07-12 23:42:51','2015-07-12 23:42:51'),(31,33,'News','127.0.0.1','2015-07-13 09:10:45','2015-07-13 09:10:45'),(32,52,'Product','127.0.0.1','2015-07-13 09:14:23','2015-07-13 09:14:23'),(33,53,'Product','127.0.0.1','2015-07-13 09:14:45','2015-07-13 09:14:45'),(34,40,'Product','127.0.0.1','2015-07-13 09:21:44','2015-07-13 09:21:44'),(35,34,'Sale','127.0.0.1','2015-07-13 11:16:05','2015-07-13 11:16:05'),(36,11,'Copulation','127.0.0.1','2015-07-13 12:49:30','2015-07-13 12:49:30'),(37,20,'Copulation','127.0.0.1','2015-07-13 12:49:43','2015-07-13 12:49:43'),(38,25,'Copulation','127.0.0.1','2015-07-13 13:30:49','2015-07-13 13:30:49'),(39,44,'Product','127.0.0.1','2015-07-13 16:04:06','2015-07-13 16:04:06'),(40,31,'News','127.0.0.1','2015-07-13 16:07:35','2015-07-13 16:07:35'),(41,29,'Sale','127.0.0.1','2015-07-14 11:44:51','2015-07-14 11:44:51'),(42,6,'GoodHand','127.0.0.1','2015-07-14 11:45:37','2015-07-14 11:45:37'),(43,33,'News','127.0.0.1','2015-07-14 12:51:33','2015-07-14 12:51:33'),(44,52,'Product','127.0.0.1','2015-07-14 12:55:04','2015-07-14 12:55:04'),(45,55,'Product','127.0.0.1','2015-07-15 20:11:45','2015-07-15 20:11:45');
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-16 16:55:43
