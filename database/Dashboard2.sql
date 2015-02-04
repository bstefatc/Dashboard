-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: dashboard
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_text` varchar(2550) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `picture` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `picture_idx` (`picture`),
  CONSTRAINT `comment_picture` FOREIGN KEY (`picture`) REFERENCES `picture` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'<p style=\"text-align: right;\">The name</p>','mark','2015-01-15 13:23:05',1),(3,'Some comment text','name','2015-01-15 16:20:42',3),(4,'else<b>Bar</b>','Some Name','2015-01-15 18:39:26',1),(5,'qwe <b>qwe <i>qwe <u>qwe<sup> qwe qwe qwe&nbsp;&nbsp;</sup></u></i></b><p><b style=\"line-height: 0px;\"><i><u>qwewqwe<sub>qwewq</sub><sup>qwewqqwe</sup><sub>qwewq</sub><sup>qwe</sup><sub>qwe</sub><sup style=\"vertical-align: super;\">qweqweqweqweqwe</sup><sub>qwe<sub>qwe<sub>qwe <strike>qwewq</strike></sub></sub></sub></u></i></b><br><p><b><i><u><sup>&nbsp; &nbsp;&nbsp;<span style=\"color:rgb(162,196,201);\">&nbsp;</span></sup></u></i></b></p></p>','Name','2015-01-15 18:50:46',1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(45) DEFAULT NULL,
  `POST_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
INSERT INTO `picture` VALUES (1,'resources/img/img (1).jpg',NULL),(2,'resources/img/img (3).jpg',NULL),(3,'resources/img/img (4).jpg',NULL),(4,'resources/img/img (5).jpg',NULL),(5,'resources/img/img (6).jpg',NULL),(6,'resources/img/img (7).jpg',NULL),(7,'resources/img/img (8).jpg',NULL),(8,'resources/img/img (9).jpg',NULL),(9,'resources/img/img (10).jpg',NULL),(10,'resources/img/img (11).jpg',NULL);
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subtask`
--

DROP TABLE IF EXISTS `subtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `task` int(11) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_subtask_idx` (`task`),
  CONSTRAINT `task_subtask` FOREIGN KEY (`task`) REFERENCES `task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subtask`
--

LOCK TABLES `subtask` WRITE;
/*!40000 ALTER TABLE `subtask` DISABLE KEYS */;
INSERT INTO `subtask` VALUES (1,'as',11,NULL,NULL),(2,'sa',11,NULL,NULL),(3,'subtask',11,'2015-01-15 16:15:21',NULL),(4,'sdf',11,'2015-01-15 16:16:21',NULL),(5,'add some subtask',12,'2015-01-15 16:21:03',NULL),(6,'sdf',14,'2015-01-15 17:19:08',NULL);
/*!40000 ALTER TABLE `subtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `picture` int(11) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_picture_idx` (`picture`),
  CONSTRAINT `task_picture` FOREIGN KEY (`picture`) REFERENCES `picture` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (9,'new list',2,'2015-01-15 13:51:03'),(10,'new list 2',2,'2015-01-15 13:51:13'),(11,'new',1,'2015-01-15 14:48:30'),(12,'new todo',3,'2015-01-15 16:20:49'),(13,'todo 2',3,'2015-01-15 16:21:39'),(14,'new todo',4,'2015-01-15 17:18:38'),(15,'qwe',1,'2015-01-15 17:24:43'),(16,'asd',8,'2015-01-15 18:55:37');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-15 19:08:28
