CREATE DATABASE  IF NOT EXISTS `bebegoods` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bebegoods`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: bebegoods
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `chatcode` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(45) NOT NULL,
  `senddate` datetime DEFAULT NULL,
  `message` text,
  `room_roomcode` int NOT NULL,
  PRIMARY KEY (`chatcode`),
  UNIQUE KEY `chatcode_UNIQUE` (`chatcode`),
  KEY `fk_chat_room_idx` (`room_roomcode`),
  KEY `fk_chat_user_idx` (`user_email`),
  CONSTRAINT `fk_chat_room` FOREIGN KEY (`room_roomcode`) REFERENCES `room` (`roomcode`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_chat_user` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,'buyer','2021-07-31 14:12:39','buyer -> user (x)',1),(2,'user','2021-08-01 14:13:13','user -> buyer (x)',1),(3,'buyer','2021-08-02 10:13:13','buyer -> user (나와야함)',1),(4,'test','2021-08-02 12:14:37','test -> user (나와야함)',2),(5,'user','2021-08-02 13:14:37','user -> abc (나와야함)',3),(6,'test','2021-08-02 14:14:37','test -> abc (x)',4),(7,'user','2021-08-04 17:22:53','보내지는지 테스트',1),(8,'user','2021-08-04 17:24:38','보내지는거 잘 뜨는지, 텍스트필드 잘 클리어 되는지 테스트',1),(9,'buyer','2021-08-04 17:25:38','받는 메세지 실시간 잘 뜨는지 테스트',1),(10,'user','2021-08-04 17:56:16','aldkfjalsdfj',1),(11,'user','2021-08-04 17:56:30','asdfasdfsf',1),(12,'user','2021-08-04 18:08:50','asdfasdfasdfasdadfafsdasdfasdfasdfasdfasdfadsfadf',1),(13,'user','2021-08-04 18:17:21','ㅇㅇㄹㅇㅇㅇ',1),(14,'user','2021-08-04 18:18:40','ㅁㄴㅇㅁㄴㅇㄹ',2),(15,'user','2021-08-04 18:18:42','ㅁㅇㅁㅇㄹ',2),(16,'user','2021-08-04 21:45:47','asdasdfadsf',3),(17,'user','2021-08-05 18:25:56','테스트에서는',3),(18,'user','2021-08-05 18:35:05','adfasdfadf',1),(19,'user','2021-08-06 16:20:41','asdfasdfdsf',1),(20,'user','2021-08-06 16:20:51','왜안돼',1),(21,'user','2021-08-06 17:15:55','gggg',1),(22,'user','2021-08-09 00:37:40','메세지 보내기 테스트',5),(23,'b@bebegoods.com','2021-08-09 00:40:40','메세지 받기 테스트',5),(24,'user','2021-08-09 00:39:15','메세지 보내기 테스트',1);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal`
--

DROP TABLE IF EXISTS `deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal` (
  `dealcode` int NOT NULL AUTO_INCREMENT,
  `buyer` varchar(40) NOT NULL,
  `seller` varchar(40) DEFAULT NULL,
  `dealdate` date NOT NULL,
  `buyerscore` int DEFAULT '0',
  `sellerscore` int DEFAULT '0',
  `user_email` varchar(40) NOT NULL,
  `item_itemcode` int NOT NULL,
  PRIMARY KEY (`dealcode`),
  KEY `fk_deal_user_idx` (`user_email`),
  KEY `fk_deal_item_idx` (`item_itemcode`),
  CONSTRAINT `fk_deal_item` FOREIGN KEY (`item_itemcode`) REFERENCES `item` (`itemcode`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_deal_user` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal`
--

LOCK TABLES `deal` WRITE;
/*!40000 ALTER TABLE `deal` DISABLE KEYS */;
INSERT INTO `deal` VALUES (1,'b@bebegoods.com','a@bebegoods.com','2021-08-02',1,1,'a@bebegoods.com',2),(2,'b@bebegoods.com','a@bebegoods.com','2021-08-02',1,1,'a@bebegoods.com',3),(3,'b@bebegoods.com','a@bebegoods.com','2021-08-02',0,0,'a@bebegoods.com',4),(4,'b@bebegoods.com','a@bebegoods.com','2021-08-02',0,0,'a@bebegoods.com',5),(5,'a@bebegoods.com','b@bebegoods.com','2021-08-02',1,1,'b@bebegoods.com',6),(6,'a@bebegoods.com','b@bebegoods.com','2021-08-02',1,1,'b@bebegoods.com',7),(7,'a@bebegoods.com','b@bebegoods.com','2021-08-02',0,1,'b@bebegoods.com',8),(8,'a@bebegoods.com','b@bebegoods.com','2021-08-02',1,0,'b@bebegoods.com',11),(9,'b@bebegoods.com','c@bebegoods.com','2021-08-03',0,0,'c@bebegoods.com',12),(10,'b@bebegoods.com','d@bebegoods.com','2021-08-04',1,1,'d@bebegoods.com',14),(11,'a@bebegoods.com','d@bebegoods.com','2021-08-04',1,0,'d@bebegoods.com',15),(12,'c@bebegoods.com','b@bebegoods.com','2021-08-04',1,1,'b@bebegoods.com',16),(13,'b@bebegoods.com','c@bebegoods.com','2021-08-04',0,0,'c@bebegoods.com',18),(14,'a@bebegoods.com','c@bebegoods.com','2021-08-04',1,0,'c@bebegoods.com',19),(24,'buyer','user','2021-08-08',2,0,'user',1),(25,'user','b@bebegoods.com','2021-08-09',0,2,'b@bebegoods.com',9);
/*!40000 ALTER TABLE `deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemcode` int NOT NULL AUTO_INCREMENT,
  `category` varchar(40) NOT NULL,
  `useage` varchar(40) NOT NULL,
  `itemtitle` varchar(60) NOT NULL,
  `itemcontent` text,
  `itemimage` varchar(100) DEFAULT NULL,
  `itemprice` int DEFAULT '0',
  `usernickname` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `uploaddate` date NOT NULL,
  `dealcompletedate` date DEFAULT NULL,
  `deletedate` date DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`itemcode`),
  UNIQUE KEY `itemcode_UNIQUE` (`itemcode`),
  KEY `fk_item_user_idx` (`user_email`),
  CONSTRAINT `fk_item_user` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'침구류','3','이불 팝니다','이불 팝니다','1.png',8,'a','서울','서울','2021-08-01',NULL,NULL,'a@bebegoods.com'),(2,'침구류','3','베개 팝니다','베개 팝니다','2.png',9,'a','서울','서울','2021-08-01','2021-08-02',NULL,'a@bebegoods.com'),(3,'식품','3','유기농분유 팝니다','유기농분유 팝니다','3.png',10,'a','서울','서울','2021-08-01','2021-08-02',NULL,'a@bebegoods.com'),(4,'의류','3','순면옷 팝니다','순면옷 팝니다','4.png',11,'a','서울','서울','2021-08-02','2021-08-03',NULL,'a@bebegoods.com'),(5,'의류','3','모자 팝니다','모자 팝니다','5.png',12,'a','서울','서울','2021-08-02','2021-08-03',NULL,'a@bebegoods.com'),(6,'의류','6','아기옷 팝니다','아기옷 팝니다','6.png',13,'b','대구','대구','2021-08-02','2021-08-02',NULL,'b@bebegoods.com'),(7,'일회용품','6','아기물티슈 팝니다','아기물티슈 팝니다','7.png',14,'b','대구','대구','2021-08-02','2021-08-02',NULL,'b@bebegoods.com'),(8,'일회용품','6','아기기저귀 팝니다','아기기저귀 팝니다','8.png',15,'b','대구','대구','2021-08-03',NULL,NULL,'b@bebegoods.com'),(9,'의류','6','아기양말 팝니다','아기양말 팝니다','9.png',16,'b','대구','대구','2021-08-04',NULL,NULL,'b@bebegoods.com'),(10,'의류','3','아기양말 팝니다','아기양말 팝니다','10.png',17,'a','서울','서울','2021-08-04',NULL,NULL,'a@bebegoods.com'),(11,'침구류','6','애기침대 팝니다','애기침대 팝니다','11.png',18,'b','대구','대구','2021-08-04','2021-08-04',NULL,'b@bebegoods.com'),(12,'침구류','9','애기 카시트 팝니다','애기 카시트 팝니다','12.png',19,'c','전주','전주','2021-08-04','2021-08-04',NULL,'c@bebegoods.com'),(13,'침구류','12','아기 소파 팝니다','아기 소파 팝니다','13.png',20,'d','부산','부산','2021-08-04',NULL,NULL,'d@bebegoods.com'),(14,'침구류','12','아기 테이블 팝니다','아기 테이블 팝니다','14.png',21,'d','부산','부산','2021-08-04','2021-08-04',NULL,'d@bebegoods.com'),(15,'식품','12','아기 비타민분유 팝니다','아기 비타민분유 팝니다','15.png',22,'d','부산','부산','2021-08-04','2021-08-04',NULL,'d@bebegoods.com'),(16,'식품','6','아기 칼슘분유 팝니다','아기 칼슘분유 팝니다','16.png',23,'b','대구','대구','2021-08-04',NULL,NULL,'b@bebegoods.com'),(17,'의류','6','아기옷 팝니다','아기옷 팝니다','17.png',24,'b','대구','대구','2021-08-04',NULL,NULL,'b@bebegoods.com'),(18,'식품','9','아기 분유 팝니다','아기 분유 팝니다','18.png',25,'c','전주','전주','2021-08-04','2021-08-04',NULL,'c@bebegoods.com'),(19,'의류','9','아기 옷 팝니다.','아기 옷 팝니다.','19.png',26,'c','전주','전주','2021-08-04','2021-08-04',NULL,'c@bebegoods.com');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `roomcode` int NOT NULL AUTO_INCREMENT,
  `buyer` varchar(45) NOT NULL,
  `seller` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `item_itemcode` int NOT NULL,
  PRIMARY KEY (`roomcode`),
  KEY `fk_room_item_idx` (`item_itemcode`),
  CONSTRAINT `fk_room_item` FOREIGN KEY (`item_itemcode`) REFERENCES `item` (`itemcode`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'buyer','user','2021-07-31 14:12:39',1),(2,'test','user','2021-08-02 12:14:37',1),(3,'user','abc','2021-08-02 13:14:37',2),(4,'test','abc','2021-08-02 14:14:37',2),(5,'user','b@bebegoods.com','2021-08-08 23:59:52',9),(6,'user','','2021-08-09 00:33:50',9);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nickname` varchar(40) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `babyage` varchar(20) DEFAULT '없음',
  `rating` int DEFAULT '0',
  `signupdate` date NOT NULL,
  `signoutdate` date DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('a@bebegoods.com','a','a','01011112222','3',0,'2021-08-01',NULL),('abc','qwer1234','abc','01011112222','24개월',0,'2021-08-06',NULL),('b@bebegoods.com','b','b','01022223333','6',2,'2021-08-02',NULL),('buyer','qwer1234','구매자','01011112222','24개월',2,'2021-08-06',NULL),('c@bebegoods.com','c','c','01033334444','9',0,'2021-08-02',NULL),('d@bebegoods.com','d','d','01044445555','12',0,'2021-08-03',NULL),('e@bebegoods.com','e','e','01055556666','15',0,'2021-08-04','2021-08-06'),('qwer@qwer.com','qwer1234','qwer','01011112222','24개월',0,'2021-08-06',NULL),('test','qwer1234','test','01011112222','24개월',0,'2021-08-06',NULL),('user','qwer1234','판매자','01011112222','24개월',0,'2021-08-06',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-09  1:31:22
