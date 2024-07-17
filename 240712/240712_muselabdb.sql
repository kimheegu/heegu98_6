-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: muselabdb
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `comm_comment`
--

DROP TABLE IF EXISTS `comm_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comm_comment` (
  `comm_comment_id` int NOT NULL AUTO_INCREMENT,
  `comm_comment_content` varchar(10000) NOT NULL,
  `comm_comment_date` timestamp NOT NULL,
  `comm_comment_comm` int NOT NULL,
  `comm_comment_user` varchar(20) NOT NULL,
  PRIMARY KEY (`comm_comment_id`,`comm_comment_comm`,`comm_comment_user`),
  KEY `fk_comment_community1_idx` (`comm_comment_comm`),
  KEY `fk_comment_user1_idx` (`comm_comment_user`),
  CONSTRAINT `fk_comment_community1` FOREIGN KEY (`comm_comment_comm`) REFERENCES `community` (`community_id`),
  CONSTRAINT `fk_comment_user1` FOREIGN KEY (`comm_comment_user`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comm_comment`
--

LOCK TABLES `comm_comment` WRITE;
/*!40000 ALTER TABLE `comm_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comm_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comm_like`
--

DROP TABLE IF EXISTS `comm_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comm_like` (
  `comm_like_id` int NOT NULL AUTO_INCREMENT,
  `comm_like_user` varchar(20) NOT NULL,
  `comm_like_post` int NOT NULL,
  PRIMARY KEY (`comm_like_id`,`comm_like_user`,`comm_like_post`),
  KEY `fk_comm_like_user1_idx` (`comm_like_user`),
  KEY `fk_comm_like_community1_idx` (`comm_like_post`),
  CONSTRAINT `fk_comm_like_community1` FOREIGN KEY (`comm_like_post`) REFERENCES `community` (`community_id`),
  CONSTRAINT `fk_comm_like_user1` FOREIGN KEY (`comm_like_user`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comm_like`
--

LOCK TABLES `comm_like` WRITE;
/*!40000 ALTER TABLE `comm_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `comm_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `community_id` int NOT NULL AUTO_INCREMENT,
  `community_category` varchar(20) NOT NULL,
  `community_title` varchar(45) NOT NULL,
  `community_content` varchar(10000) NOT NULL,
  `community_date` timestamp NOT NULL,
  `community_image1` varchar(200) DEFAULT NULL,
  `community_image2` varchar(200) DEFAULT NULL,
  `community_image3` varchar(200) DEFAULT NULL,
  `community_image4` varchar(200) DEFAULT NULL,
  `community_image5` varchar(200) DEFAULT NULL,
  `community_user` varchar(20) NOT NULL,
  `community_views` int NOT NULL,
  `community_like` int NOT NULL,
  PRIMARY KEY (`community_id`,`community_user`),
  KEY `fk_community_user1_idx` (`community_user`),
  CONSTRAINT `fk_community_user1` FOREIGN KEY (`community_user`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market`
--

DROP TABLE IF EXISTS `market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `market` (
  `market_id` int NOT NULL AUTO_INCREMENT,
  `market_title` varchar(50) NOT NULL,
  `market_content` varchar(500) NOT NULL,
  `market_image1` varchar(200) DEFAULT NULL,
  `market_image2` varchar(200) DEFAULT NULL,
  `market_image3` varchar(200) DEFAULT NULL,
  `market_image4` varchar(200) DEFAULT NULL,
  `market_image5` varchar(200) DEFAULT NULL,
  `market_price` int NOT NULL,
  `market_condition` varchar(20) DEFAULT NULL,
  `market_category` varchar(20) NOT NULL,
  `market_user` varchar(20) NOT NULL,
  `market_views` int NOT NULL,
  `market_like` int NOT NULL,
  PRIMARY KEY (`market_id`,`market_user`),
  KEY `fk_market_user_idx` (`market_user`),
  CONSTRAINT `fk_market_user` FOREIGN KEY (`market_user`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market`
--

LOCK TABLES `market` WRITE;
/*!40000 ALTER TABLE `market` DISABLE KEYS */;
/*!40000 ALTER TABLE `market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mk_comment`
--

DROP TABLE IF EXISTS `mk_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mk_comment` (
  `mk_comment_id` int NOT NULL AUTO_INCREMENT,
  `mk_comment_content` varchar(10000) NOT NULL,
  `mk_comment_date` timestamp NOT NULL,
  `mk_comment_market` int NOT NULL,
  `mk_comment_user` varchar(20) NOT NULL,
  PRIMARY KEY (`mk_comment_id`,`mk_comment_market`,`mk_comment_user`),
  KEY `fk_mk_comment_market1_idx` (`mk_comment_market`),
  KEY `fk_mk_comment_user1_idx` (`mk_comment_user`),
  CONSTRAINT `fk_mk_comment_market1` FOREIGN KEY (`mk_comment_market`) REFERENCES `market` (`market_id`),
  CONSTRAINT `fk_mk_comment_user1` FOREIGN KEY (`mk_comment_user`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mk_comment`
--

LOCK TABLES `mk_comment` WRITE;
/*!40000 ALTER TABLE `mk_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mk_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mk_like`
--

DROP TABLE IF EXISTS `mk_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mk_like` (
  `mk_like_id` int NOT NULL AUTO_INCREMENT,
  `mk_like_mk` int NOT NULL,
  `mk_like_user` varchar(20) NOT NULL,
  PRIMARY KEY (`mk_like_id`,`mk_like_mk`,`mk_like_user`),
  KEY `fk_mk_like_market1_idx` (`mk_like_mk`),
  KEY `fk_mk_like_user1_idx` (`mk_like_user`),
  CONSTRAINT `fk_mk_like_market1` FOREIGN KEY (`mk_like_mk`) REFERENCES `market` (`market_id`),
  CONSTRAINT `fk_mk_like_user1` FOREIGN KEY (`mk_like_user`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mk_like`
--

LOCK TABLES `mk_like` WRITE;
/*!40000 ALTER TABLE `mk_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `mk_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music` (
  `music_id` int NOT NULL AUTO_INCREMENT,
  `music_title` varchar(45) NOT NULL,
  `music_info` varchar(200) NOT NULL,
  `music_genre` varchar(40) NOT NULL,
  `music_album` varchar(45) DEFAULT NULL,
  `music_date` timestamp NOT NULL,
  `music_image` varchar(200) DEFAULT NULL,
  `music_user` varchar(20) NOT NULL,
  `music_views` int NOT NULL,
  `music_like` int NOT NULL,
  PRIMARY KEY (`music_id`,`music_user`),
  KEY `fk_music_user1_idx` (`music_user`),
  CONSTRAINT `fk_music_user1` FOREIGN KEY (`music_user`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_comment`
--

DROP TABLE IF EXISTS `music_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music_comment` (
  `music_comment_id` int NOT NULL AUTO_INCREMENT,
  `music_comment_content` varchar(10000) NOT NULL,
  `music_comment_date` timestamp NOT NULL,
  `music_comment_music` int NOT NULL,
  `music_comment_user` varchar(20) NOT NULL,
  PRIMARY KEY (`music_comment_id`,`music_comment_music`,`music_comment_user`),
  KEY `fk_music_comment_music1_idx` (`music_comment_music`),
  KEY `fk_music_comment_user1_idx` (`music_comment_user`),
  CONSTRAINT `fk_music_comment_music1` FOREIGN KEY (`music_comment_music`) REFERENCES `music` (`music_id`),
  CONSTRAINT `fk_music_comment_user1` FOREIGN KEY (`music_comment_user`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_comment`
--

LOCK TABLES `music_comment` WRITE;
/*!40000 ALTER TABLE `music_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `music_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_like`
--

DROP TABLE IF EXISTS `music_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music_like` (
  `music_like_id` int NOT NULL AUTO_INCREMENT,
  `music_like_user` varchar(20) NOT NULL,
  `music_like_music` int NOT NULL,
  PRIMARY KEY (`music_like_id`,`music_like_user`,`music_like_music`),
  KEY `fk_music_like_user1_idx` (`music_like_user`),
  KEY `fk_music_like_music1_idx` (`music_like_music`),
  CONSTRAINT `fk_music_like_music1` FOREIGN KEY (`music_like_music`) REFERENCES `music` (`music_id`),
  CONSTRAINT `fk_music_like_user1` FOREIGN KEY (`music_like_user`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_like`
--

LOCK TABLES `music_like` WRITE;
/*!40000 ALTER TABLE `music_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `music_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation` (
  `operation_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`operation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `playlist_id` int NOT NULL AUTO_INCREMENT,
  `playlist_folder` varchar(20) NOT NULL,
  `playlist_user` varchar(20) NOT NULL,
  `playlist_music` int NOT NULL,
  PRIMARY KEY (`playlist_id`,`playlist_user`,`playlist_music`),
  KEY `fk_playlist_user1_idx` (`playlist_user`),
  KEY `fk_playlist_music1_idx` (`playlist_music`),
  CONSTRAINT `fk_playlist_music1` FOREIGN KEY (`playlist_music`) REFERENCES `music` (`music_id`),
  CONSTRAINT `fk_playlist_user1` FOREIGN KEY (`playlist_user`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `user_pwd` varchar(20) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_email` varchar(40) NOT NULL,
  `user_nickname` varchar(30) NOT NULL,
  `user_profile` varchar(200) DEFAULT NULL,
  `user_info` varchar(500) DEFAULT NULL,
  `user_address` varchar(50) DEFAULT NULL,
  `user_grade` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_phone_UNIQUE` (`user_phone`),
  UNIQUE KEY `user_nickname_UNIQUE` (`user_nickname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_msg`
--

DROP TABLE IF EXISTS `user_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_msg` (
  `user_msg_id` int NOT NULL AUTO_INCREMENT,
  `user_msg_title` varchar(45) NOT NULL,
  `user_msg_content` varchar(200) NOT NULL,
  `user_msg_date` timestamp NOT NULL,
  `user_msg_sender` varchar(20) NOT NULL,
  `user_msg_receiver` varchar(20) NOT NULL,
  PRIMARY KEY (`user_msg_id`,`user_msg_sender`,`user_msg_receiver`),
  KEY `fk_user_msg_user1_idx` (`user_msg_sender`),
  KEY `fk_user_msg_user2_idx` (`user_msg_receiver`),
  CONSTRAINT `fk_user_msg_user1` FOREIGN KEY (`user_msg_sender`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_user_msg_user2` FOREIGN KEY (`user_msg_receiver`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_msg`
--

LOCK TABLES `user_msg` WRITE;
/*!40000 ALTER TABLE `user_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_msg` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-12 15:30:58
