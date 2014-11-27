CREATE DATABASE  IF NOT EXISTS `calendar` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `calendar`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: calendar
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Table structure for table `calendar_users`
--

DROP TABLE IF EXISTS `calendar_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_users` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_users`
--

LOCK TABLES `calendar_users` WRITE;
/*!40000 ALTER TABLE `calendar_users` DISABLE KEYS */;
INSERT INTO `calendar_users` VALUES (0,'admin@example.com','admin','Admin'),(1,'user1@example.com','user1','User1'),(2,'user2@example.com','user2','User2'),(3,'user3@example.com','user3','User3'),(4,'user4@example.com','user4','User4'),(5,'user5@example.com','user5','User5'),(6,'user6@example.com','user6','User6'),(7,'user7@example.com','user7','User7'),(8,'user8@example.com','user8','User8'),(9,'user9@example.com','user9','User9'),(10,'user10@example.com','user10','User10'),(11,'user11@example.com','user11','User11');
/*!40000 ALTER TABLE `calendar_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `when` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `summary` varchar(255) NOT NULL,
  `description` varchar(500) NOT NULL,
  `owner` int(32) unsigned NOT NULL,
  `num_likes` int(32) unsigned NOT NULL,
  `event_level` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_events_owner` (`owner`),
  CONSTRAINT `constraints_events_owner` FOREIGN KEY (`owner`) REFERENCES `calendar_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (0,'2014-11-27 01:30:54','Event Summary - 0','Event Description - 0',0,0,1),(1,'2014-11-27 01:30:54','Event Summary - 1','Event Description - 1',8,9,1),(2,'2014-11-27 01:30:54','Event Summary - 2','Event Description - 2',6,10,2),(3,'2014-11-27 01:30:54','Event Summary - 3','Event Description - 3',0,10,2);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_attendees`
--

DROP TABLE IF EXISTS `events_attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_attendees` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(32) unsigned NOT NULL,
  `attendee` int(32) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_events_id` (`event_id`),
  KEY `fk_events_attendee` (`attendee`),
  CONSTRAINT `constraints_events_attendee` FOREIGN KEY (`attendee`) REFERENCES `calendar_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `constraints_events_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_attendees`
--

LOCK TABLES `events_attendees` WRITE;
/*!40000 ALTER TABLE `events_attendees` DISABLE KEYS */;
INSERT INTO `events_attendees` VALUES (0,0,2),(1,1,5),(2,2,8),(3,3,11),(4,0,10);
/*!40000 ALTER TABLE `events_attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_username_role` (`role`,`email`),
  KEY `fk_users_email` (`email`),
  CONSTRAINT `constraints_users_email` FOREIGN KEY (`email`) REFERENCES `calendar_users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (0,'admin@example.com','ROLE_ADMIN'),(10,'user10@example.com','ROLE_USER'),(11,'user11@example.com','ROLE_USER'),(1,'user1@example.com','ROLE_USER'),(2,'user2@example.com','ROLE_USER'),(3,'user3@example.com','ROLE_USER'),(4,'user4@example.com','ROLE_USER'),(5,'user5@example.com','ROLE_USER'),(6,'user6@example.com','ROLE_USER'),(7,'user7@example.com','ROLE_USER'),(8,'user8@example.com','ROLE_USER'),(9,'user9@example.com','ROLE_USER');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-27 10:37:50