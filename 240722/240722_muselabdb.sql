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
-- Table structure for table `ad`
--

DROP TABLE IF EXISTS `ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad` (
  `ad_id` int NOT NULL AUTO_INCREMENT,
  `ad_title` varchar(45) NOT NULL,
  `ad_start` timestamp NOT NULL,
  `ad_end` timestamp NOT NULL,
  `ad_image` varchar(200) NOT NULL,
  `ad_memo` varchar(1000) DEFAULT NULL,
  `ad_position` varchar(45) NOT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad`
--

LOCK TABLES `ad` WRITE;
/*!40000 ALTER TABLE `ad` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` varchar(30) NOT NULL,
  `admin_pwd` varchar(30) NOT NULL,
  `admin_name` varchar(20) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `article_id` int NOT NULL,
  `article_title` varchar(100) NOT NULL,
  `article_content` varchar(1000) NOT NULL,
  `article_image1` varchar(200) DEFAULT NULL,
  `article_image2` varchar(200) DEFAULT NULL,
  `article_image3` varchar(200) DEFAULT NULL,
  `article_image4` varchar(200) DEFAULT NULL,
  `article_image5` varchar(200) DEFAULT NULL,
  `article_views` int NOT NULL,
  `article_admin_id` varchar(30) NOT NULL,
  PRIMARY KEY (`article_id`,`article_admin_id`),
  KEY `fk_article_admin1_idx` (`article_admin_id`),
  CONSTRAINT `fk_article_admin1` FOREIGN KEY (`article_admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy` (
  `buy_id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(20) NOT NULL,
  `buy_count` int NOT NULL,
  `buy_status` varchar(45) NOT NULL,
  `buy_date` timestamp NOT NULL,
  `buy_user_id` varchar(20) NOT NULL,
  `buy_market_id` int NOT NULL,
  PRIMARY KEY (`buy_id`,`buy_user_id`,`buy_market_id`),
  KEY `fk_buy_user1_idx` (`buy_user_id`),
  KEY `fk_buy_market1_idx` (`buy_market_id`),
  CONSTRAINT `fk_buy_market1` FOREIGN KEY (`buy_market_id`) REFERENCES `market` (`market_id`),
  CONSTRAINT `fk_buy_user1` FOREIGN KEY (`buy_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comm_comment`
--

DROP TABLE IF EXISTS `comm_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comm_comment` (
  `comm_comment_id` int NOT NULL AUTO_INCREMENT,
  `comm_comment_content` varchar(500) NOT NULL,
  `comm_comment_date` timestamp NOT NULL,
  `comm_comment_comm` int NOT NULL,
  `comm_comment_user` varchar(20) NOT NULL,
  PRIMARY KEY (`comm_comment_id`,`comm_comment_comm`,`comm_comment_user`),
  KEY `fk_comment_community1_idx` (`comm_comment_comm`),
  KEY `fk_comment_user1_idx` (`comm_comment_user`),
  CONSTRAINT `fk_comment_community1` FOREIGN KEY (`comm_comment_comm`) REFERENCES `community` (`community_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_user1` FOREIGN KEY (`comm_comment_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  CONSTRAINT `fk_comm_like_community1` FOREIGN KEY (`comm_like_post`) REFERENCES `community` (`community_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comm_like_user1` FOREIGN KEY (`comm_like_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  PRIMARY KEY (`community_id`,`community_user`),
  KEY `fk_community_user1_idx` (`community_user`),
  CONSTRAINT `fk_community_user1` FOREIGN KEY (`community_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
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
  `market_description` varchar(100) NOT NULL,
  `market_content` varchar(3000) NOT NULL,
  `market_image1` varchar(200) DEFAULT NULL,
  `market_image2` varchar(200) DEFAULT NULL,
  `market_image3` varchar(200) DEFAULT NULL,
  `market_image4` varchar(200) DEFAULT NULL,
  `market_image5` varchar(200) DEFAULT NULL,
  `market_price` int NOT NULL,
  `market_category` varchar(20) NOT NULL,
  `market_user` varchar(20) NOT NULL,
  `market_views` int NOT NULL,
  `market_stock` int NOT NULL,
  `market_status` varchar(45) NOT NULL,
  PRIMARY KEY (`market_id`,`market_user`),
  KEY `fk_market_user_idx` (`market_user`),
  CONSTRAINT `fk_market_user` FOREIGN KEY (`market_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  CONSTRAINT `fk_mk_like_market1` FOREIGN KEY (`mk_like_mk`) REFERENCES `market` (`market_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mk_like_user1` FOREIGN KEY (`mk_like_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `mk_review`
--

DROP TABLE IF EXISTS `mk_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mk_review` (
  `mk_review_id` int NOT NULL AUTO_INCREMENT,
  `mk_review_content` varchar(1000) NOT NULL,
  `mk_review_date` timestamp NOT NULL,
  `mk_review_market` int NOT NULL,
  `mk_review_user` varchar(20) NOT NULL,
  `mk_review_score` double NOT NULL,
  PRIMARY KEY (`mk_review_id`,`mk_review_market`,`mk_review_user`),
  KEY `fk_mk_comment_market1_idx` (`mk_review_market`),
  KEY `fk_mk_comment_user1_idx` (`mk_review_user`),
  CONSTRAINT `fk_mk_comment_market1` FOREIGN KEY (`mk_review_market`) REFERENCES `market` (`market_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mk_comment_user1` FOREIGN KEY (`mk_review_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mk_review`
--

LOCK TABLES `mk_review` WRITE;
/*!40000 ALTER TABLE `mk_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `mk_review` ENABLE KEYS */;
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
  `music_info` varchar(1000) NOT NULL,
  `music_genre` varchar(40) NOT NULL,
  `music_album` varchar(45) DEFAULT NULL,
  `music_date` timestamp NOT NULL,
  `music_file` varchar(200) NOT NULL,
  `music_image` varchar(200) DEFAULT NULL,
  `music_user` varchar(20) NOT NULL,
  `music_views` int NOT NULL,
  PRIMARY KEY (`music_id`,`music_user`),
  KEY `fk_music_user1_idx` (`music_user`),
  CONSTRAINT `fk_music_user1` FOREIGN KEY (`music_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES (14,'Song 1','This is song 1','Pop','Album 1','2024-07-20 03:00:00','song1.mp3','song1.jpg','user01',0),(15,'Song 2','This is song 2','Rock','Album 2','2024-07-20 04:00:00','song2.mp3','song2.jpg','user01',0),(16,'Song 3','This is song 3','Jazz','Album 3','2024-07-20 05:00:00','song3.mp3','song3.jpg','user02',0),(17,'Song 4','This is song 4','Hip Hop','Album 4','2024-07-20 06:00:00','song4.mp3','song4.jpg','user02',0),(18,'Song 5','This is song 5','Classical','Album 5','2024-07-20 07:00:00','song5.mp3','song5.jpg','user02',0),(19,'Song 6','This is song 6','Pop','Album 6','2024-07-20 08:00:00','song6.mp3','song6.jpg','user03',0),(20,'Song 7','This is song 7','Rock','Album 7','2024-07-20 09:00:00','song7.mp3','song7.jpg','user03',0),(21,'Song 8','This is song 8','Jazz','Album 8','2024-07-20 10:00:00','song8.mp3','song8.jpg','user04',0),(22,'Song 9','This is song 9','Hip Hop','Album 9','2024-07-20 11:00:00','song9.mp3','song9.jpg','user04',0),(23,'Song 10','This is song 10','Classical','Album 10','2024-07-20 12:00:00','song10.mp3','song10.jpg','user05',0),(24,'Song 11','This is song 11','Pop',NULL,'2024-07-20 13:00:00','song11.mp3','song11.jpg','user06',0),(25,'Song 12','This is song 12','Rock',NULL,'2024-07-20 14:00:00','song12.mp3','song12.jpg','user06',0),(26,'Song 13','This is song 13','Jazz',NULL,'2024-07-20 15:00:00','song13.mp3','song13.jpg','user07',0),(27,'Song 14','This is song 14','Hip Hop',NULL,'2024-07-20 16:00:00','song14.mp3','song14.jpg','user08',0),(28,'Song 15','This is song 15','Classical',NULL,'2024-07-20 17:00:00','song15.mp3','song15.jpg','user08',0),(29,'Song 16','This is song 16','Pop','Album 16','2024-07-20 18:00:00','song16.mp3','song16.jpg','user09',0),(30,'Song 17','This is song 17','Rock','Album 17','2024-07-20 19:00:00','song17.mp3','song17.jpg','user09',0),(31,'Song 18','This is song 18','Jazz','Album 18','2024-07-20 20:00:00','song18.mp3','song18.jpg','user10',0),(32,'Song 19','This is song 19','Hip Hop','Album 19','2024-07-20 21:00:00','song19.mp3','song19.jpg','user10',0),(33,'Song 20','This is song 20','Classical','Album 20','2024-07-20 22:00:00','song20.mp3','song20.jpg','user11',0);
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
  `music_comment_content` varchar(500) NOT NULL,
  `music_comment_date` timestamp NOT NULL,
  `music_comment_music` int NOT NULL,
  `music_comment_user` varchar(20) NOT NULL,
  PRIMARY KEY (`music_comment_id`,`music_comment_music`,`music_comment_user`),
  KEY `fk_music_comment_music1_idx` (`music_comment_music`),
  KEY `fk_music_comment_user1_idx` (`music_comment_user`),
  CONSTRAINT `fk_music_comment_music1` FOREIGN KEY (`music_comment_music`) REFERENCES `music` (`music_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_music_comment_user1` FOREIGN KEY (`music_comment_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_comment`
--

LOCK TABLES `music_comment` WRITE;
/*!40000 ALTER TABLE `music_comment` DISABLE KEYS */;
INSERT INTO `music_comment` VALUES (5,'111','2024-07-22 01:05:49',33,'aaa');
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
  CONSTRAINT `fk_music_like_music1` FOREIGN KEY (`music_like_music`) REFERENCES `music` (`music_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_music_like_user1` FOREIGN KEY (`music_like_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
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
  `notice_title` varchar(100) NOT NULL,
  `notice_content` varchar(1000) NOT NULL,
  `notice_image1` varchar(200) DEFAULT NULL,
  `notice_image2` varchar(200) DEFAULT NULL,
  `notice_image3` varchar(200) DEFAULT NULL,
  `notice_image4` varchar(200) DEFAULT NULL,
  `notice_image5` varchar(200) DEFAULT NULL,
  `notice_views` int NOT NULL,
  `notice_admin_id` varchar(30) NOT NULL,
  PRIMARY KEY (`notice_id`,`notice_admin_id`),
  KEY `fk_notice_admin1_idx` (`notice_admin_id`),
  CONSTRAINT `fk_notice_admin1` FOREIGN KEY (`notice_admin_id`) REFERENCES `admin` (`admin_id`)
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
  CONSTRAINT `fk_playlist_music1` FOREIGN KEY (`playlist_music`) REFERENCES `music` (`music_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_user1` FOREIGN KEY (`playlist_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `user_bank` varchar(100) DEFAULT NULL,
  `user_account` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_phone_UNIQUE` (`user_phone`),
  UNIQUE KEY `user_nickname_UNIQUE` (`user_nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('aaa','1234','010-1111-1111','aaa@naver.com','집에가고싶다','사진','반갑습니다.','대전광역시','일반회원','국민은행','111111-11-111111'),('user01','pwd1','010-1234-5678','user01@example.com','nick01','profile001.jpg','This is user 01','Seoul, Korea','A','Bank A','123-456-7890'),('user02','pwd2','010-2345-6789','user02@example.com','nick02','profile002.jpg','This is user 02','Busan, Korea','B','Bank B','234-567-8901'),('user03','pwd3','010-3456-7890','user03@example.com','nick03','profile003.jpg','This is user 03','Incheon, Korea','C','Bank C','345-678-9012'),('user04','pwd4','010-4567-8901','user04@example.com','nick04','profile004.jpg','This is user 04','Daegu, Korea','D','Bank D','456-789-0123'),('user05','pwd5','010-5678-9012','user05@example.com','nick05','profile005.jpg','This is user 05','Daejeon, Korea','E','Bank E','567-890-1234'),('user06','pwd6','010-6789-0123','user06@example.com','nick06','profile006.jpg','This is user 06','Gwangju, Korea','A','Bank F','678-901-2345'),('user07','pwd7','010-7890-1234','user07@example.com','nick07','profile007.jpg','This is user 07','Ulsan, Korea','B','Bank G','789-012-3456'),('user08','pwd8','010-8901-2345','user08@example.com','nick08','profile008.jpg','This is user 08','Suwon, Korea','C','Bank H','890-123-4567'),('user09','pwd9','010-9012-3456','user09@example.com','nick09','profile009.jpg','This is user 09','Changwon, Korea','D','Bank I','901-234-5678'),('user10','pwd10','010-0123-4567','user10@example.com','nick10','profile010.jpg','This is user 10','Jeonju, Korea','E','Bank J','012-345-6789'),('user11','pwd11','010-1234-5679','user11@example.com','nick11','profile011.jpg','This is user 11','Cheonan, Korea','A','Bank K','123-456-7891'),('user12','pwd12','010-2345-6780','user12@example.com','nick12','profile012.jpg','This is user 12','Gyeongju, Korea','B','Bank L','234-567-8902'),('user13','pwd13','010-3456-7891','user13@example.com','nick13','profile013.jpg','This is user 13','Gangneung, Korea','C','Bank M','345-678-9013'),('user14','pwd14','010-4567-8902','user14@example.com','nick14','profile014.jpg','This is user 14','Chuncheon, Korea','D','Bank N','456-789-0124'),('user15','pwd15','010-5678-9013','user15@example.com','nick15','profile015.jpg','This is user 15','Andong, Korea','E','Bank O','567-890-1235'),('user16','pwd16','010-6789-0124','user16@example.com','nick16','profile016.jpg','This is user 16','Pohang, Korea','A','Bank P','678-901-2346'),('user17','pwd17','010-7890-1235','user17@example.com','nick17','profile017.jpg','This is user 17','Jeju, Korea','B','Bank Q','789-012-3457'),('user18','pwd18','010-8901-2346','user18@example.com','nick18','profile018.jpg','This is user 18','Yeosu, Korea','C','Bank R','890-123-4568'),('user19','pwd19','010-9012-3457','user19@example.com','nick19','profile019.jpg','This is user 19','Gimhae, Korea','D','Bank S','901-234-5679'),('user20','pwd20','010-0123-4568','user20@example.com','nick20','profile020.jpg','This is user 20','Geoje, Korea','E','Bank T','012-345-6790');
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
  `user_msg_content` varchar(500) NOT NULL,
  `user_msg_date` timestamp NOT NULL,
  `user_msg_sender` varchar(20) NOT NULL,
  `user_msg_receiver` varchar(20) NOT NULL,
  PRIMARY KEY (`user_msg_id`,`user_msg_sender`,`user_msg_receiver`),
  KEY `fk_user_msg_user1_idx` (`user_msg_sender`),
  KEY `fk_user_msg_user2_idx` (`user_msg_receiver`),
  CONSTRAINT `fk_user_msg_user1` FOREIGN KEY (`user_msg_sender`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_msg_user2` FOREIGN KEY (`user_msg_receiver`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
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

-- Dump completed on 2024-07-22 10:11:02
