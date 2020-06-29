-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: spotify
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_type` (
  `account_type_id` int NOT NULL,
  `account_type_name` varchar(45) DEFAULT NULL,
  `ads_id` int DEFAULT NULL,
  PRIMARY KEY (`account_type_id`),
  KEY `ads_id_idx` (`ads_id`),
  CONSTRAINT `account_type_ibfk_1` FOREIGN KEY (`ads_id`) REFERENCES `ads` (`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
INSERT INTO `account_type` VALUES (1,'premium',1),(2,'free',2),(3,'familiar',1),(4,'estudiante',3);
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `ads_id` int NOT NULL,
  `ads_frecuency` int DEFAULT NULL,
  PRIMARY KEY (`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,255),(2,300),(3,450),(4,590);
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `album_id` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `artist_id` int DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `artist_id_idx` (`artist_id`),
  CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'salio el sol','2000',1),(2,'el abayarde','1999',2),(3,'mi musica','2018',3),(4,'luna','2012',4),(5,'party rock','2015',5),(6,'aye','2016',6);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `artist_id` int NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `followers` int DEFAULT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (1,'david guetta',200),(2,'farruko',100),(3,'afrojack',2000),(4,'steve aoki',444),(5,'don omar',922),(6,'tego calderon',999),(7,'elvis crespo',222),(8,'kurt cobain',313),(9,'calle 13',264);
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_tracks`
--

DROP TABLE IF EXISTS `favorite_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_tracks` (
  `favorite_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`favorite_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `favorite_tracks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_tracks`
--

LOCK TABLES `favorite_tracks` WRITE;
/*!40000 ALTER TABLE `favorite_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites_tracks_list`
--

DROP TABLE IF EXISTS `favorites_tracks_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites_tracks_list` (
  `track_id` int NOT NULL,
  `favorite_id` int NOT NULL,
  PRIMARY KEY (`track_id`,`favorite_id`),
  KEY `favorite_id_idx` (`favorite_id`),
  CONSTRAINT `favorites_tracks_list_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`),
  CONSTRAINT `favorites_tracks_list_ibfk_2` FOREIGN KEY (`favorite_id`) REFERENCES `favorite_tracks` (`favorite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites_tracks_list`
--

LOCK TABLES `favorites_tracks_list` WRITE;
/*!40000 ALTER TABLE `favorites_tracks_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites_tracks_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` int NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'reggae'),(2,'perreo'),(3,'reggaeton'),(4,'electronica'),(5,'salsa'),(6,'bachata'),(7,'merengue'),(8,'baladas'),(9,'rock');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `log_id` int NOT NULL,
  `login_time` timestamp(2) NULL DEFAULT NULL,
  `logout_time` timestamp(2) NULL DEFAULT NULL,
  `logout_count` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'2019-07-01 09:36:01.00','2019-06-13 06:07:20.00',71,8),(2,'2019-11-05 13:44:24.00','2020-03-02 14:28:12.00',63,8),(3,'2020-04-18 13:32:39.00','2019-12-10 05:53:34.00',21,8),(4,'2020-03-29 20:11:17.00','2020-05-02 14:03:19.00',24,9),(5,'2020-04-14 09:37:29.00','2019-09-14 19:50:34.00',17,9),(6,'2019-11-29 14:51:05.00','2020-06-05 16:05:08.00',74,9),(7,'2019-11-21 14:01:11.00','2020-05-26 01:38:16.00',39,10),(8,'2020-04-29 23:42:10.00','2020-02-17 19:09:09.00',73,10),(9,'2020-04-30 19:31:44.00','2020-06-07 23:56:13.00',23,12),(10,'2019-11-27 09:42:30.00','2019-10-27 04:37:27.00',9,12),(11,'2019-04-22 05:34:31.00','2020-05-22 01:47:27.00',35,12),(12,'2019-09-27 23:30:23.00','2019-10-08 22:08:59.00',57,12),(13,'2019-06-15 23:33:44.00','2019-12-04 07:57:41.00',1,14),(14,'2020-06-03 18:49:50.00','2019-06-12 12:19:36.00',24,12),(15,'2020-02-29 14:32:51.00','2020-02-12 20:49:45.00',29,12),(16,'2019-05-26 04:59:51.00','2019-10-19 21:12:53.00',47,8),(17,'2019-12-30 23:00:07.00','2020-05-22 15:17:05.00',33,8),(18,'2019-07-12 01:25:31.00','2020-05-25 06:15:13.00',66,20),(19,'2019-09-18 03:05:25.00','2020-01-02 14:39:11.00',26,20),(20,'2020-03-27 04:41:17.00','2020-02-10 11:08:00.00',34,20),(21,'2019-10-19 18:25:59.00','2020-01-29 10:24:07.00',67,20),(22,'2019-02-10 14:27:49.00','2019-10-30 06:56:52.00',26,20),(23,'2019-05-01 11:21:46.00','2020-05-18 00:01:01.00',13,20),(24,'2019-06-19 12:18:40.00','2020-02-28 12:37:16.00',60,20),(25,'2019-04-12 22:57:35.00','2020-03-30 22:45:32.00',47,20);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `payment_token` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (2,5,'1313123'),(3,9,'21141123');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `played_tracks`
--

DROP TABLE IF EXISTS `played_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `played_tracks` (
  `played_tracks_id` int NOT NULL,
  `track_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`played_tracks_id`),
  KEY `track_id` (`track_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `played_tracks_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`),
  CONSTRAINT `played_tracks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `played_tracks`
--

LOCK TABLES `played_tracks` WRITE;
/*!40000 ALTER TABLE `played_tracks` DISABLE KEYS */;
INSERT INTO `played_tracks` VALUES (1,2,9),(2,3,9),(3,3,10),(4,2,13),(5,2,9),(6,2,5),(7,7,12);
/*!40000 ALTER TABLE `played_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_track`
--

DROP TABLE IF EXISTS `playlist_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_track` (
  `playlist_id` int NOT NULL,
  `track_id` int NOT NULL,
  PRIMARY KEY (`track_id`,`playlist_id`),
  KEY `playlist_id` (`playlist_id`),
  KEY `track_id_idx` (`track_id`),
  CONSTRAINT `playlist_track_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`),
  CONSTRAINT `playlist_track_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_track`
--

LOCK TABLES `playlist_track` WRITE;
/*!40000 ALTER TABLE `playlist_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `playlist_id` int NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracks` (
  `track_id` int NOT NULL,
  `title` varchar(15) DEFAULT NULL,
  `album_id` int DEFAULT NULL,
  `genre_id` int DEFAULT NULL,
  `track_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`track_id`),
  KEY `genre_id_idx` (`genre_id`),
  KEY `album_id_idx` (`album_id`),
  CONSTRAINT `tracks_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`),
  CONSTRAINT `tracks_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` VALUES (1,'me acuerdo',1,2,'21'),(2,'mirame',2,4,'4'),(3,'fresh',2,3,'3'),(4,'emono',4,2,'2'),(5,'saoc',2,3,'21'),(6,'hooka',2,3,'21'),(7,'angelito',1,4,'90'),(8,'dale don',4,5,'9'),(9,'bandolero',5,5,'6'),(10,'hasta abajo',6,7,'9');
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `user_name` varchar(10) DEFAULT NULL,
  `e-mail` varchar(25) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  `user_role_id` int DEFAULT NULL,
  `account_type_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_role_id_idx` (`user_role_id`),
  KEY `account_type_id_idx` (`account_type_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`user_role_id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`account_type_id`) REFERENCES `account_type` (`account_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'vbottrill4','vbottrill4@cbslocal.com','iou8MF','Vivia','Bottrill','2000-05-30','Colombia',1,1),(8,'ihearne7','iheare7@techcrunch.com','cRD9Pe','Ilene','Hearne','1995-10-08','Russia',5,1),(9,'cakead8','caken8@booking.com','fPiEIyzM','Culver','Akenhead','1995-06-11','Panama',5,2),(10,'dmagett9','dmart9@digg.com','K5EZnNA','Dionis','Margett','1996-08-26','Canada',1,3),(11,'ajedzeka','ajedraa@livejournal.com','Xh9Ib185MU5','Avigdor','Jedraszek','1996-09-20','Russia',4,3),(12,'chendnb','chenonb@cocolog-nifty.com','in8nIZ2td2e7','Coleen','Hendrickson','1998-11-03','Iran',3,3),(13,'awickyc','awicyc@xing.com','ZBa0c3z','Avigdor','Wickersley','1995-04-29','China',1,3),(14,'mpolakd','mpolakd@google.it','QVnsKr1ybrEj','Matthus','Polak','1999-03-16','Nicaragua',5,3),(15,'jloueade','jlode@simplemhines.org','atmkDicdonB','Julia','Loughhead','1997-04-26','Malaysia',1,2),(16,'vref','vrphf@tinypic.com','t6w529Fa3jpC','Veronica','Realph','1999-01-10','Thailand',1,3),(17,'ystsg','ysto@cnbc.com','Lza4r7','Yolanthe','Stops','1996-12-16','Ukraine',3,2),(18,'bsexh','bsexh@spiegel.de','lzVI5yrFupbv','Bonni','Sex','1995-02-05','China',5,2),(19,'wluni','wlufki@tinypic.com','4sZ77uK8','Windham','Lufkin','1997-03-24','China',4,2),(20,'kkneeyj','kknseyj@geoes.jp','N6lYCN','Korie','Kneafsey','1997-08-28','China',5,2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_role_id` int NOT NULL,
  `user_role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'admin'),(2,'developer'),(3,'tester'),(4,'normal'),(5,'artista'),(6,'prueba');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista1`
--

DROP TABLE IF EXISTS `vista1`;
/*!50001 DROP VIEW IF EXISTS `vista1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista1` AS SELECT 
 1 AS `first_name`,
 1 AS `logout_time`,
 1 AS `logout_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista2`
--

DROP TABLE IF EXISTS `vista2`;
/*!50001 DROP VIEW IF EXISTS `vista2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista2` AS SELECT 
 1 AS `Cancion`,
 1 AS `Album`,
 1 AS `Artista`,
 1 AS `Reproducciones_totales`,
 1 AS `Reproducciones_usuarios_diferentes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista3`
--

DROP TABLE IF EXISTS `vista3`;
/*!50001 DROP VIEW IF EXISTS `vista3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista3` AS SELECT 
 1 AS `user_name`,
 1 AS `account_type_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista1`
--

/*!50001 DROP VIEW IF EXISTS `vista1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista1` AS select `user`.`first_name` AS `first_name`,`log`.`logout_time` AS `logout_time`,`log`.`logout_count` AS `logout_count` from (`user` join `log`) where (`user`.`user_id` = `log`.`user_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista2`
--

/*!50001 DROP VIEW IF EXISTS `vista2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista2` AS select `tracks`.`title` AS `Cancion`,`albums`.`title` AS `Album`,`artist`.`name` AS `Artista`,count(`played_tracks`.`track_id`) AS `Reproducciones_totales`,count(distinct `played_tracks`.`user_id`) AS `Reproducciones_usuarios_diferentes` from ((((`tracks` join `played_tracks`) join `albums`) join `artist`) join `user`) where ((`artist`.`artist_id` = `albums`.`artist_id`) and (`albums`.`album_id` = `tracks`.`album_id`) and (`tracks`.`track_id` = `played_tracks`.`track_id`) and (`user`.`user_id` = `played_tracks`.`user_id`)) group by `played_tracks`.`track_id` order by `Reproducciones_totales` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista3`
--

/*!50001 DROP VIEW IF EXISTS `vista3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista3` AS select `user`.`user_name` AS `user_name`,`account_type`.`account_type_name` AS `account_type_name` from (`account_type` join `user`) where (`account_type`.`account_type_id` = `user`.`account_type_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-29 20:44:32
