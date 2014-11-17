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
) ENGINE=InnoDB AUTO_INCREMENT=2305 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_users`
--

LOCK TABLES `calendar_users` WRITE;
/*!40000 ALTER TABLE `calendar_users` DISABLE KEYS */;
INSERT INTO `calendar_users` VALUES (2293,'user0@example.com','user0','User0'),(2294,'user1@example.com','user1','User1'),(2295,'user2@example.com','user2','User2'),(2296,'user3@example.com','user3','User3'),(2297,'user4@example.com','user4','User4'),(2298,'user5@example.com','user5','User5'),(2299,'user6@example.com','user6','User6'),(2300,'user7@example.com','user7','User7'),(2301,'user8@example.com','user8','User8'),(2302,'user9@example.com','user9','User9'),(2303,'user10@example.com','user10','User10'),(2304,'user11@example.com','user11','User11');
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
) ENGINE=InnoDB AUTO_INCREMENT=769 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (765,'2014-11-10 16:05:01','Event Summary - 0','Event Description - 0',2293,0,1),(766,'2014-11-10 16:05:01','Event Summary - 1','Event Description - 1',2301,9,1),(767,'2014-11-10 16:05:01','Event Summary - 2','Event Description - 2',2299,10,2),(768,'2014-11-10 16:05:01','Event Summary - 3','Event Description - 3',2293,10,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=889 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_attendees`
--

LOCK TABLES `events_attendees` WRITE;
/*!40000 ALTER TABLE `events_attendees` DISABLE KEYS */;
INSERT INTO `events_attendees` VALUES (885,765,2295),(886,766,2298),(887,767,2301),(888,768,2304);
/*!40000 ALTER TABLE `events_attendees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-17 17:55:23