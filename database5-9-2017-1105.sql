-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: cloudcomputesystem
-- ------------------------------------------------------
-- Server version	5.6.22-log

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` varchar(60) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL COMMENT '0- Normal User\n1- Admin',
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('0a6b3cd5-666f-4135-8717-541032c78455','Foxiquora','123',0,'Quinn','asd@gmail.com'),('1','Admin','Admin123',1,'Admin',NULL),('10','Joanne','555666777',0,'Jo44Anne',NULL),('11','Anne','44455599',0,'Anne44',NULL),('12','Belle','33445566',0,'Belle',NULL),('13','Anne','123456',0,'Anne123',NULL),('14','Joe','55667788',0,'JoeJoe',NULL),('15','Lim','55667788',0,'LimLim',NULL),('16','LingLing','11223344',0,'LingLing',NULL),('17','Ken','11223344',0,'KenKen',NULL),('18','Clarence','Clarence',0,'Clarence',NULL),('19','Tang','TangTang',0,'Tang',NULL),('2','test','654321',0,'test',NULL),('20','Kenrick','KenKen',0,'Kenrick',NULL),('21','Happy','Happy123',0,'Happy',NULL),('22','Hank','Hank123',0,'Hank',NULL),('23','Rick','Rick123',0,'Rick',NULL),('24','Kenneth','Ken123',0,'Kenneth',NULL),('25','Derrick','Derrick123',0,'Derick',NULL),('26','Sam','Sam123',0,'Sam',NULL),('27','Samantha','Samsam123',0,'Samantha',NULL),('28','Martha','Martha123',0,'Martha',NULL),('29','Bruce','Bruce123',0,'Bruce',NULL),('3','feifei','123456',0,'fei123',NULL),('30','Clark','Clark123',0,'Clark',NULL),('31','Ben','Ben123',0,'Ben',NULL),('32','Bennedict','BenBen123',0,'Bennedict',NULL),('33','Stark','Stark123',0,'Stark',NULL),('34','Tony','Tony123',0,'Tony',NULL),('35','Tonny','Tonny123',0,'Tonny',NULL),('36','Clint','Clint123',0,'Clint',NULL),('37','Henry','Henry123',0,'Henry',NULL),('38','Emily','Emily123',0,'Emily',NULL),('39','Emilia','Emilia123',0,'Emilia',NULL),('4','huihui','123456',0,'huihui123',NULL),('40','David','David123',0,'David',NULL),('41','Jax','Jax123',0,'Jax',NULL),('42','Jarvan','Jarvan4',0,'Jarvan',NULL),('43','Terry','Terry123',0,'Terry',NULL),('44','TenTen','TenTen123',0,'TenTen',NULL),('45','Joko','Joko123',0,'Joko',NULL),('46','Ryu','Ryu123',0,'Ryu',NULL),('47','Jackson','Jackson123',0,'Jackson',NULL),('48','Armstrong','Armstrong123',0,'Armstrong',NULL),('49','Jacob','Jacob123',0,'Jacob',NULL),('5','xinxin','654321',0,'xinxin00',NULL),('6','yifei','654321',0,'yifei',NULL),('7','jason','123456',0,'jason321',NULL),('8','Jacky','1234567',0,'Jackk',NULL),('9','John','0987655',0,'Johnny',NULL),('c729461a-7e95-4b7b-aec4-8008b6244557','zack','asd',0,'Zack Lim','ssd@gmail.com');
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

-- Dump completed on 2017-09-12 11:30:18
