-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: cloudcomputesystem
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise` (
  `exerciseNo` int(11) NOT NULL,
  `exerciseName` varchar(60) NOT NULL,
  PRIMARY KEY (`exerciseNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,'C#'),(2,'C++');
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcq`
--

DROP TABLE IF EXISTS `mcq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcq` (
  `mcqId` int(11) NOT NULL AUTO_INCREMENT,
  `option` varchar(200) NOT NULL,
  `optionDetail` varchar(200) NOT NULL,
  `questionNo` int(11) NOT NULL,
  PRIMARY KEY (`mcqId`),
  KEY `questionNo_idx` (`questionNo`),
  CONSTRAINT `questionNo` FOREIGN KEY (`questionNo`) REFERENCES `question` (`questionNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcq`
--

LOCK TABLES `mcq` WRITE;
/*!40000 ALTER TABLE `mcq` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `questionNo` int(11) NOT NULL,
  `questionDetail` varchar(250) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `exerciseNo` int(11) NOT NULL,
  PRIMARY KEY (`questionNo`),
  KEY `exerciseNo_idx` (`exerciseNo`),
  CONSTRAINT `exerciseNo` FOREIGN KEY (`exerciseNo`) REFERENCES `exercise` (`exerciseNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'云计算是对（ ）技术的发展与运用','D',1),(2,'从研究现状上看，下面不属于云计算特点的是（ ）','C',1),(3,'与网络计算相比，不属于云计算特征的是（ ）','B',1),(4,'IBM在2007年11月退出了“改进游戏规则”的 （ ）计算平台，为客户带来即买即用的云计算平台。','A',1),(5,'微软于2008年10月推出云计算操作系统是 （ ）','C',1),(6,'2008年，（ ）先后在无锡和北京建立了两个云计算中心','A',1),(7,'亚马逊AWS提供的云计算服务类型是（ ）','D',1),(8,'将平台作为服务的云计算服务类型是（ ）','B',1),(9,'将基础设施作为服务的云计算服务类型是（ ）','A',1),(10,'IaaS计算实现机制中，系统管理模块的核心功能是（ ）','A',1),(11,'云计算体系结构的（ ）负责资源管理、任务管理用户管理和安全管理等工作','C',1),(12,'下列不属于Google云计算平台技术架构的是（ ）','D',1),(13,'与开源云计算系统Hadoop HDFS相对应的商用云计算软件系统是（ ）','A',1),(14,'Google文件系统（GFS）分块默认的块大小是（ ）','B',1),(15,'Google文件系统（GFS）分成固定大小的块，每个块都有一个对应的（ ）','C',1),(16,'下列不属于GFS的假设和目标是（ ）','C',1),(17,'Google文件系统（GFS）通过（ ）方式提高可靠性','B',1),(18,'Google文件系统（GFS）中每个数据块默认是在（ ）个数据块服务器上冗余','B',1),(19,'Google文件系统（GFS）中客户端直接从（ ）角色完成数据存取','C',1),(20,'下列不属于文件系统（GFS）中主服务器节点任务的是（ ）','D',1),(21,'在主服务器节点容错中，采用日志进行容错的是（ ）','C',1),(22,'在数据块服务器容错中，每个Block对应（ ）Ｂｉｔ的校验码','C',1),(23,'GFS在Google中管理着（ ）级别的数据','C',1),(24,'在目前GFS集群中，每个集群包含（ ）个存储节点','B',1),(25,'下列选项中，哪条不是GFS次啊用中心服务器模式的原因（ ）','A',1),(26,'下列选项中，哪条不是GFS选择在用户态下实现的原因（ ）','D',1),(27,'（ ）是Google提出的用于处理海量数据的并行编程模式和大规模数据集的并行运算的软件架构。','B',1),(28,'Mapreduce适用于 （ ）','D',1),(29,'下面关于MapReduce模型中Map函数与Reduce函数的描述正确的是(  )','A',1),(30,'MapReduce执行过程中，数据存储位置不是在GFS上的是（ ）','A',1),(31,'MapReduce通常把输入文件按照（ ）MB来划分','C',1),(32,'（ ）是Google的分布式数据存储于管理系统','D',1),(33,'下面哪条不是bigtable主服务器作用 （ ）','B',1),(34,'Bigtable中时间戳是 （ ）位整型数。','D',1),(35,'Bigtable中的数据压缩形式有 （ ）种','B',1),(36,'Bigtable中行关键字的大小不能超过（ ）KB','D',1),(37,'（ ）是Bigtable中数据划分和负载均衡的基本单位','D',1),(38,'（ ）是Bigtable中访问控制的基本单元','C',1),(39,'（ ）是Google为Bigtable设计的内部数据存储格式','B',1),(40,'SSTable结尾的索引保存的是（ ）信息','A',1),(41,'在Bigtable中，（ ）主要用来存储子表数据以及一些日志文件','A',1),(42,'Google APP Engine使用的数据库是 （ ）','C',1),(43,'下列不属于亚马逊及其映像（AMI）类型的是（ ）','C',1),(44,'亚马逊AWS采用 （ ）虚拟化技术','A',1),(45,'在使用弹性计算云EC2服务时，第一步要做的是（ ）','A',1),(46,'不属于弹性计算云EC2包含的IP地址的是（ ）','C',1),(47,'在EC2中用户最多可以拥有（ ）个实例','B',1),(48,'在EC2 服务中，每个实例自身携带（ ）个存储模块','A',1),(49,'在EC2服务的通信机制中，每个账户限制由 （ ）个弹性IP.','B',1),(50,'在EC2的安全与容错机制中，一个用户目前最多可以创建 （ ）安全组。','B',1),(51,'EC2定义了CPU的计算单元ECU，下列资源中使用一个计算单元的是（ ）','B',1),(52,'每个弹性存储EBS最多可以创建（ ）个卷','B',1),(53,'下列选项属于弹性块存储EBS功能的是（ ）','A',1),(54,'S3的基本存储单元是（ ）','B',1),(55,'下列操作类型不属于S3API范畴的是（ ）','C',1),(56,'桶是S3用于存储对象的容器，每个用户最多可以创建（ ）个桶','D',1),(57,'与SDB相比较，下列选项属于S3范畴的是（ ）','B',1),(58,'简单队列服务SQS中采用的是（ ）队列方式','A',1),(59,'在云计算系统中，提供“云端”服务模式是（ ） 公司的云计算服务平台。','D',1),(60,'下面关于Live服务的描述不正确的是 （  ）','C',1),(61,'下列四种云计算方案中，服务间的耦合度最高的是 （  ）','C',1),(62,'下列哪个选项能正确地在Hive中返回“查询年龄在 18到25岁之间的用户返回的前5页”的结果（ ）','A',1),(63,'Google文件系统（GFS）提供给应用程序的访问接口是（ ）','A',1),(64,'云计算技术的层次结构中包含（ ）下层','ABCD',2),(65,'云计算体系结构中，最关键的两层是（ ）','BC',2),(66,'云计算按照服务类型大致可分为以下类（ ）','ABC',2),(67,'Google文件系统将整个系统的节点分为（ ）的角色','ABC',2),(68,'Google文件系统具有（ ）特点','ABD',2),(69,'Google不缓存数据的原因是 （ ）','ABCD',2),(70,'GFS中主服务器节点存储的元数据包含这些信息（ ）','BCD',2),(71,'单一主服务器（Master）解决性能瓶颈的方法是（ ）','ABCD',2),(72,'与传统的分布式程序设计相比，Mapreduce封装了 （ ）等细节，还提供了一个简单而强大的接口。','ABCD',2),(73,'Google设计Bigtable的动机主要是（ ）','ABC',2),(74,'Bigtable主要由（ ）三个部分组成','ABC',2),(75,'Bigtable表中的数据是通过（ ）来进行索引的','ABD',2),(76,'Bigtable开发团队确定了Bigtable设计所需达到的基本目标（ ）','ABCD',2),(77,'Google APP Engine目前支持的编程语言有 （ ）','AD',2),(78,'亚马逊将区域分为（ ）','AC',2),(79,'下面选项属于Amazon提供的云计算服务是（ ）','ABC',2),(80,'EC2常用的API包含下列哪些类型的操作（）','ABCD',2),(81,'S3采用的专门安全措施是（）','AB',2),(82,'S3中对象有下面的（ ）组成','ABCD',2),(83,'与关系数据库比较，下列选项属于SDB特性的是（ ）','ACD',2),(84,'SDB不能完成的操作有（ ）','ABCD',2),(85,'SQS由三个基本部分组成（ ）','ABC',2),(86,'SQS常用的API有（ ）','ABCD',2),(87,'云格可以完成的服务有 （）','ACD',2),(88,'云计算的特点？( )','ABCDE',2),(89,'目前，选用开源的虚拟化产品组建虚拟化平台，构建基于硬件的虚拟化层，可以选用（ ）','BCD',2),(90,'在云计算中，虚拟层主要包括（ ）','ABC',2);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `userdetail`
--

DROP TABLE IF EXISTS `userdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userdetail` (
  `userId` varchar(60) NOT NULL,
  `userlevel` int(11) NOT NULL,
  `progress` varchar(60) DEFAULT NULL,
  `lastLogin` timestamp(6) NULL DEFAULT NULL,
  `lastBrowse` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdetail`
--

LOCK TABLES `userdetail` WRITE;
/*!40000 ALTER TABLE `userdetail` DISABLE KEYS */;
INSERT INTO `userdetail` VALUES ('1',2,'10%','2017-09-12 03:36:00.000000','2017-09-12 11:36:00'),('c729461a-7e95-4b7b-aec4-8008b6244557',1,'25%','2017-09-12 03:36:00.000000','Java Chapter 1');
/*!40000 ALTER TABLE `userdetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-15 11:46:26
