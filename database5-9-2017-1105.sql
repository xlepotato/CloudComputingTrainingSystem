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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `userId` varchar(60) NOT NULL,
  `chosenOptionLetter` varchar(45) DEFAULT NULL,
  `questionId` int(11) NOT NULL,
  `exerciseNo` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`questionId`,`exerciseNo`),
  KEY `questionId_idx` (`questionId`),
  CONSTRAINT `question` FOREIGN KEY (`questionId`) REFERENCES `question` (`questionId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user` FOREIGN KEY (`userId`) REFERENCES `score` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `exercise` VALUES (1,'云计算'),(2,'云计算技术'),(3,'java');
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
  `optionLetter` varchar(200) NOT NULL,
  `optionDetail` varchar(200) NOT NULL,
  `questionNo` int(11) NOT NULL,
  PRIMARY KEY (`mcqId`),
  KEY `questionNo_idx` (`questionNo`),
  CONSTRAINT `questionId` FOREIGN KEY (`questionNo`) REFERENCES `question` (`questionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcq`
--

LOCK TABLES `mcq` WRITE;
/*!40000 ALTER TABLE `mcq` DISABLE KEYS */;
INSERT INTO `mcq` VALUES (1,'A','并行计算',1),(2,'B','网格计算 ',1),(3,'C','分布式计算',1),(4,'D','三个选项都是',1),(5,'A','超大规模',2),(6,'B','虚拟化',2),(7,'C','私有化',2),(8,'D','高可靠性',2),(9,'A','资源高度共享',3),(10,'B','适合紧耦合科学计算',3),(11,'C','支持虚拟机 ',3),(12,'D','适用于商业领域',3),(13,'A','蓝云',4),(14,'B','蓝天',4),(15,'C','Azure ',4),(16,'D','Amazon EC2',4),(17,'A','Google App Engine ',5),(18,'B','蓝云',5),(19,'C','Azure ',5),(20,'D','Amazon EC2',5),(21,'A','IBM',6),(22,'B','Google',6),(23,'C','Amazon',6),(24,'D','微软',6),(25,'A','IaaS',7),(26,'B','PaaS',7),(27,'C','SaaS ',7),(28,'D','三个选项都是',7),(29,'A','IaaS ',8),(30,'B','PaaS ',8),(31,'C','SaaS ',8),(32,'D','三个选项都是',8),(33,'A','IaaS ',9),(34,'B','PaaS ',9),(35,'C','SaaS ',9),(36,'D','三个选项都不是',9),(37,'A','负载均衡',10),(38,'B','监视节点的运行状态',10),(39,'C','应用API ',10),(40,'D','节点环境配置',10),(41,'A','物理资源层 ',11),(42,'B','资源池层 ',11),(43,'C','管理中间件层',11),(44,'D','SOA构建层',11),(45,'A','并行数据处理MapReduce',12),(46,'B','分布式锁Chubby',12),(47,'C','结构化数据表BigTable',12),(48,'D','弹性云计算EC2',12),(49,'A','Google GFS',13),(50,'B','Google MapReduce',13),(51,'C','Google Bigtable',13),(52,'D','Google Chubby',13),(53,'A','32MB',14),(54,'B','64MB',14),(55,'C','128MB',14),(56,'D','16MB',14),(57,'A','代理',15),(58,'B','结点',15),(59,'C','索引号',15),(60,'D','计数器',15),(61,'A','专用接口',16),(62,'B','遵守POSIX规范的接口',16),(63,'C','网络文件系统接口 ',16),(64,'D','Web网页接口',16),(65,'A','硬件出错正常',17),(66,'B','主要负载是流数据读写',17),(67,'C','数据写主要是“插入写”',17),(68,'D','需要存储大尺寸的文件',17),(69,'A','双备份 ',18),(70,'B','冗余',18),(71,'C','日志',18),(72,'D','校验码',18),(73,'A','2',19),(74,'B','3',19),(75,'C','4',19),(76,'D','5',19),(77,'A','主服务器',20),(78,'B','桶',20),(79,'C','数据块服务器',20),(80,'D','管理块服务器',20),(81,'A','存储元数据',21),(82,'B','文件系统目录管理',21),(83,'C','与数据块服务器进行周期性通信',21),(84,'D','向客户端传输数据',21),(85,'A','命名空间 ',22),(86,'B','Ｃｈｕｎｋ与文件名的映射表',22),(87,'C','与数据块服务器进行周期性通信',22),(88,'D','文件系统目录管理',22),(89,'A','8',23),(90,'B','16',23),(91,'C','32',23),(92,'D','64',23),(93,'A','TB',24),(94,'B','GB',24),(95,'C','PB',24),(96,'D','MB',24),(97,'A','几百个',25),(98,'B','几千个',25),(99,'C','几十个',25),(100,'D','几十万个',25),(101,'A','不易成为整个系统的瓶颈',26),(102,'B','可以方便增加数据块服务器 ',26),(103,'C','不存在元数据的一致性问题',26),(104,'D','方便进行负载均衡',26),(105,'A','调试简单',27),(106,'B','不影响数据块服务器的稳定性',27),(107,'C','降低实现难度，提高通用性',27),(108,'D','容易扩展',27),(109,'A','GFS',28),(110,'B','MapReduce',28),(111,'C','Chubby',28),(112,'D','BitTable',28),(113,'A','任意应用程序',29),(114,'B','任意可在windows servet2008上运行的程序',29),(115,'C','可以串行处理的应用程序',29),(116,'D','可以并行处理的应用程序',29),(117,'A','一个Map函数就是对一部分原始数据进行指定的操作',30),(118,'B','一个Map操作就是对每个Reduce所产生的一部分中间结果进行合并操作',30),(119,'C','Map与Map之间不是相互独立的',30),(120,'D','Reduce与Reduce之间不是相互独立的',30),(121,'A','Map处理结果',31),(122,'B','ReD.uce处理结果',31),(123,'C','日志',31),(124,'D','Reduce处理结果',31),(125,'A','16',32),(126,'B','32',32),(127,'C','64',32),(128,'D','128',32),(129,'A','GFS',33),(130,'B','MapReduce',33),(131,'C','Chubby',33),(132,'D','BigTable',33),(133,'A','为每个子表服务器分配子表，对外提供服务',34),(134,'B','对bigtable表中的数据进行存储',34),(135,'C','探测子表服务器的故障和管理',34),(136,'D','负载均衡',34),(137,'A','32',35),(138,'B','48',35),(139,'C','56',35),(140,'D','64',35),(141,'A','2',36),(142,'B','3',36),(143,'C','4',36),(144,'D','5',36),(145,'A','16',37),(146,'B','32',37),(147,'C','48',37),(148,'D','64',37),(149,'A','行',38),(150,'B','列',38),(151,'C','列族',38),(152,'D','子表',38),(153,'A','行',39),(154,'B','列',39),(155,'C','列族',39),(156,'D','子表',39),(157,'A','行',40),(158,'B','SSTable',40),(159,'C','列族',40),(160,'D','子表',40),(161,'A','SSTable中块的位置',41),(162,'B','SSTable的位置',41),(163,'C','SSTable中块的大小',41),(164,'D','Sstable的大小',41),(165,'A','GFS',42),(166,'B','Chubby',42),(167,'C','SSTable',42),(168,'D','MapReduce',42),(169,'A','改进的SQLServer ',43),(170,'B','Oracle',43),(171,'C','Date store',43),(172,'D','亚马逊的SimpleDB',43),(173,'A','公共AMI',44),(174,'B','私有AMI',44),(175,'C','通用AMI',44),(176,'D','共享AMI',44),(177,'A','未使用',45),(178,'B','Hyper-V',45),(179,'C','Vmware',45),(180,'D','Xen',45),(181,'A','创建或选用AMI',46),(182,'B','运行实例',46),(183,'C','选择区域',46),(184,'D','建立对象',46),(185,'A','公共IP地址',47),(186,'B','私有IP地址',47),(187,'C','隧道IP地址',47),(188,'D','弹性IP地址',47),(189,'A','10',48),(190,'B','20',48),(191,'C','30',48),(192,'D','40',48),(193,'A','1',49),(194,'B','2',49),(195,'C','3',49),(196,'D','4',49),(197,'A','4',50),(198,'B','5',50),(199,'C','6',50),(200,'D','7',50),(201,'A','50',51),(202,'B','100',51),(203,'C','150',51),(204,'D','200',51),(205,'A','Large',52),(206,'B','Small',52),(207,'C','Extra Large',52),(208,'D','High-CPUMedium',52),(209,'A','10',53),(210,'B','20',53),(211,'C','30',53),(212,'D','40',53),(213,'A','快照',54),(214,'B','0负载均衡  ',54),(215,'C','队列',54),(216,'D','映像',54),(217,'A','服务',55),(218,'B','对象',55),(219,'C','卷',55),(220,'D','组',55),(221,'A','创建桶',56),(222,'B','读取对象',56),(223,'C','运行实例',56),(224,'D','设置访问控制策略',56),(225,'A','10',57),(226,'B','50',57),(227,'C','80',57),(228,'D','100',57),(229,'A','支持数据查找、删除等操作',58),(230,'B','专为大型、非结构化的数据块设计',58),(231,'C','为复杂的数据建立',58),(232,'D','为结构化的数据建立',58),(233,'A','先进先出模式 ',59),(234,'B','堆栈模式',59),(235,'C','权重模式',59),(236,'D','后进先出模式',59),(237,'A','IBM',60),(238,'B','Google',60),(239,'C','Amazon',60),(240,'D','微软',60),(241,'A','LIVE框架的核心组件是live操作系统',61),(242,'B','开发者可以使用基于浏览器的live服务开发者入口创建和管理应用程序所需的live服务',61),(243,'C','Live操作环境不可以运行在桌面操作系统上。',61),(244,'D','Live操作环境既可以运行在云端，也可以运行在网络中的任何操作系统上。',61),(245,'A','亚马逊AWS  ',62),(246,'B','微软AZURE',62),(247,'C','Google APP Engine',62),(248,'D','IBM的“蓝云”',62),(249,'A','SELECT p.url, COUNT(1) as clicks',63),(250,'B','SELECT p.url, COUNT(1) as clicks FROM users u JOIN page_views p WHERE u.age >= 18 AND u.age <= 25 GROUP BY p.url ORDER BY clicks LIMIT 5;',63),(251,'C','SELECT p.url, COUNT(1) as clicks FROM page_views p ON (u.name = p.user) ORDER BY clicks LIMIT 5;',63),(252,'D','SELECT p.url, COUNT(1) as clicks',63),(253,'A','物力资源层 ',64),(254,'B','资源池层 ',64),(255,'C','管理中间件 ',64),(256,'D','SOA构建层',64),(257,'A','物力资源层 ',65),(258,'B','资源池层',65),(259,'C','管理中间件 ',65),(260,'D','SOA构建层',65),(261,'A','IaaS',66),(262,'B','PaaS',66),(263,'C','SaaS',66),(264,'D','效用计算',66),(265,'A','客户端',67),(266,'B','主服务器',67),(267,'C','数据块服务器 ',67),(268,'D','监测服务器',67),(269,'A','采用中心服务器模式 ',68),(270,'B','不缓存数据',68),(271,'C','采用边缘服务器模式',68),(272,'D','在用户态下实现',68),(273,'A','OFS的文件操作大部门是流式读写',69),(274,'B','维护缓存与实际数据之间的一致性太复杂',69),(275,'C','不存在大量的重复读写',69),(276,'D','数据块服务器上的数据存取使用本地文件系统',69),(277,'A','文件副本的位置信息',70),(278,'B','命名空间',70),(279,'C','Chunk与文件名的映射',70),(280,'D','Chunk副本的位置信息',70),(281,'A','减少其在数据存储中的参与程度',71),(282,'B','不适用Master读取数据',71),(283,'C','客户端缓存元数据',71),(284,'D','采用大尺寸的数据块',71),(285,'A','并行处理',72),(286,'B','容错处理',72),(287,'C','本地化计算 ',72),(288,'D','负载均衡',72),(289,'A','需要存储的数据种类繁多',73),(290,'B','海量的服务请求',73),(291,'C','商用数据库无法满足Google的需求 ',73),(292,'D','需要频繁的修改数据',73),(293,'A','客户端程序库 ',74),(294,'B','一个主服务器',74),(295,'C','多个子表服务器',74),(296,'D','数据管理服务器',74),(297,'A','行关键字 ',75),(298,'B','列关键字',75),(299,'C','子表地址',75),(300,'D','时间戳',75),(301,'A','广泛的适用性',76),(302,'B','很强的可扩展性',76),(303,'C','高可用性',76),(304,'D','简单性',76),(305,'A','Python语言 ',77),(306,'B','C++语言',77),(307,'C','汇编语言',77),(308,'D','JAVA语言',77),(309,'A','地理区域',78),(310,'B','不可用区域 ',78),(311,'C','可用区域 ',78),(312,'D','隔离区域',78),(313,'A','弹性云计算EC2',79),(314,'B','简单存储服务S3',79),(315,'C','简单队列服务SQS',79),(316,'D','Net服务',79),(317,'A','AMI',80),(318,'B','安全组',80),(319,'C','实例',80),(320,'D','弹性IP地址',80),(321,'A','身份认证 ',81),(322,'B','访问控制列表',81),(323,'C','防火墙',81),(324,'D','防木马病毒技术',81),(325,'A','键',82),(326,'B','数据',82),(327,'C','元数据',82),(328,'D','访问控制',82),(329,'A','无需预定义模式 ',83),(330,'B','具有事物的概念',83),(331,'C','支持自动索引',83),(332,'D','单个属性允许有多个值',83),(333,'A','没有事物的概念',84),(334,'B','不支持连接操作',84),(335,'C','实际存储的数据类型过于单一',84),(336,'D','查询结果只包含条目名称而不包含相应属性值，且返回结果不支持排序操作',84),(337,'A','系统组件 ',85),(338,'B','队列',85),(339,'C','消息',85),(340,'A','队列管理 ',86),(341,'B','消息管理 ',86),(342,'C','访问控制',86),(343,'D','可见性设置',86),(344,'A','数据处理服务 ',87),(345,'B','格处理服务',87),(346,'C','高性能计算服务 ',87),(347,'D','协作服务',87),(348,'A','大规模',88),(349,'B','平滑扩展 ',88),(350,'C','资源共享',88),(351,'D','动态分配',88),(352,'E','跨地域',88),(353,'A','Xen',89),(354,'B','VMware',89),(355,'C','Hyper-v  ',89),(356,'D','Citrix',89),(357,'A','服务器虚拟化 ',90),(358,'B','存储虚拟化 ',90),(359,'C','网络虚拟化 ',90),(360,'D','桌面虚拟化',90);
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
  `questionId` int(11) NOT NULL,
  PRIMARY KEY (`questionId`),
  KEY `exerciseNo_idx` (`exerciseNo`),
  CONSTRAINT `exerciseNo` FOREIGN KEY (`exerciseNo`) REFERENCES `exercise` (`exerciseNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'云计算是对（ ）技术的发展与运用','D',1,1),(2,'从研究现状上看，下面不属于云计算特点的是（ ）','C',1,2),(3,'与网络计算相比，不属于云计算特征的是（ ）','B',1,3),(4,'IBM在2007年11月退出了“改进游戏规则”的 （ ）计算平台，为客户带来即买即用的云计算平台。','A',1,4),(5,'微软于2008年10月推出云计算操作系统是 （ ）','C',1,5),(6,'2008年，（ ）先后在无锡和北京建立了两个云计算中心','A',1,6),(7,'亚马逊AWS提供的云计算服务类型是（ ）','D',1,7),(8,'将平台作为服务的云计算服务类型是（ ）','B',1,8),(9,'将基础设施作为服务的云计算服务类型是（ ）','A',1,9),(10,'IaaS计算实现机制中，系统管理模块的核心功能是（ ）','A',1,10),(11,'云计算体系结构的（ ）负责资源管理、任务管理用户管理和安全管理等工作','C',1,11),(12,'下列不属于Google云计算平台技术架构的是（ ）','D',1,12),(13,'与开源云计算系统Hadoop HDFS相对应的商用云计算软件系统是（ ）','A',1,13),(14,'Google文件系统（GFS）分块默认的块大小是（ ）','B',1,14),(15,'Google文件系统（GFS）分成固定大小的块，每个块都有一个对应的（ ）','C',1,15),(16,'下列不属于GFS的假设和目标是（ ）','C',1,16),(17,'Google文件系统（GFS）通过（ ）方式提高可靠性','B',1,17),(18,'Google文件系统（GFS）中每个数据块默认是在（ ）个数据块服务器上冗余','B',1,18),(19,'Google文件系统（GFS）中客户端直接从（ ）角色完成数据存取','C',1,19),(20,'下列不属于文件系统（GFS）中主服务器节点任务的是（ ）','D',1,20),(21,'在主服务器节点容错中，采用日志进行容错的是（ ）','C',1,21),(22,'在数据块服务器容错中，每个Block对应（ ）Ｂｉｔ的校验码','C',1,22),(23,'GFS在Google中管理着（ ）级别的数据','C',1,23),(24,'在目前GFS集群中，每个集群包含（ ）个存储节点','B',1,24),(25,'下列选项中，哪条不是GFS次啊用中心服务器模式的原因（ ）','A',1,25),(26,'下列选项中，哪条不是GFS选择在用户态下实现的原因（ ）','D',1,26),(27,'（ ）是Google提出的用于处理海量数据的并行编程模式和大规模数据集的并行运算的软件架构。','B',1,27),(28,'Mapreduce适用于 （ ）','D',1,28),(29,'下面关于MapReduce模型中Map函数与Reduce函数的描述正确的是(  )','A',1,29),(30,'MapReduce执行过程中，数据存储位置不是在GFS上的是（ ）','A',1,30),(31,'MapReduce通常把输入文件按照（ ）MB来划分','C',1,31),(32,'（ ）是Google的分布式数据存储于管理系统','D',1,32),(33,'下面哪条不是bigtable主服务器作用 （ ）','B',1,33),(34,'Bigtable中时间戳是 （ ）位整型数。','D',1,34),(35,'Bigtable中的数据压缩形式有 （ ）种','B',1,35),(36,'Bigtable中行关键字的大小不能超过（ ）KB','D',1,36),(37,'（ ）是Bigtable中数据划分和负载均衡的基本单位','D',1,37),(38,'（ ）是Bigtable中访问控制的基本单元','C',1,38),(39,'（ ）是Google为Bigtable设计的内部数据存储格式','B',1,39),(40,'SSTable结尾的索引保存的是（ ）信息','A',1,40),(41,'在Bigtable中，（ ）主要用来存储子表数据以及一些日志文件','A',1,41),(42,'Google APP Engine使用的数据库是 （ ）','C',1,42),(43,'下列不属于亚马逊及其映像（AMI）类型的是（ ）','C',1,43),(44,'亚马逊AWS采用 （ ）虚拟化技术','A',1,44),(45,'在使用弹性计算云EC2服务时，第一步要做的是（ ）','A',1,45),(46,'不属于弹性计算云EC2包含的IP地址的是（ ）','C',1,46),(47,'在EC2中用户最多可以拥有（ ）个实例','B',1,47),(48,'在EC2 服务中，每个实例自身携带（ ）个存储模块','A',1,48),(49,'在EC2服务的通信机制中，每个账户限制由 （ ）个弹性IP.','B',1,49),(50,'在EC2的安全与容错机制中，一个用户目前最多可以创建 （ ）安全组。','B',1,50),(51,'EC2定义了CPU的计算单元ECU，下列资源中使用一个计算单元的是（ ）','B',1,51),(52,'每个弹性存储EBS最多可以创建（ ）个卷','B',1,52),(53,'下列选项属于弹性块存储EBS功能的是（ ）','A',1,53),(54,'S3的基本存储单元是（ ）','B',1,54),(55,'下列操作类型不属于S3API范畴的是（ ）','C',1,55),(56,'桶是S3用于存储对象的容器，每个用户最多可以创建（ ）个桶','D',1,56),(57,'与SDB相比较，下列选项属于S3范畴的是（ ）','B',1,57),(58,'简单队列服务SQS中采用的是（ ）队列方式','A',1,58),(59,'在云计算系统中，提供“云端”服务模式是（ ） 公司的云计算服务平台。','D',1,59),(60,'下面关于Live服务的描述不正确的是 （  ）','C',1,60),(61,'下列四种云计算方案中，服务间的耦合度最高的是 （  ）','C',1,61),(62,'下列哪个选项能正确地在Hive中返回“查询年龄在 18到25岁之间的用户返回的前5页”的结果（ ）','A',1,62),(63,'Google文件系统（GFS）提供给应用程序的访问接口是（ ）','A',1,63),(1,'云计算技术的层次结构中包含（ ）下层','ABCD',2,64),(2,'云计算体系结构中，最关键的两层是（ ）','BC',2,65),(3,'云计算按照服务类型大致可分为以下类（ ）','ABC',2,66),(4,'Google文件系统将整个系统的节点分为（ ）的角色','ABC',2,67),(5,'Google文件系统具有（ ）特点','ABD',2,68),(6,'Google不缓存数据的原因是 （ ）','ABCD',2,69),(7,'GFS中主服务器节点存储的元数据包含这些信息（ ）','BCD',2,70),(8,'单一主服务器（Master）解决性能瓶颈的方法是（ ）','ABCD',2,71),(9,'与传统的分布式程序设计相比，Mapreduce封装了 （ ）等细节，还提供了一个简单而强大的接口。','ABCD',2,72),(10,'Google设计Bigtable的动机主要是（ ）','ABC',2,73),(11,'Bigtable主要由（ ）三个部分组成','ABC',2,74),(12,'Bigtable表中的数据是通过（ ）来进行索引的','ABD',2,75),(13,'Bigtable开发团队确定了Bigtable设计所需达到的基本目标（ ）','ABCD',2,76),(14,'Google APP Engine目前支持的编程语言有 （ ）','AD',2,77),(15,'亚马逊将区域分为（ ）','AC',2,78),(16,'下面选项属于Amazon提供的云计算服务是（ ）','ABC',2,79),(17,'EC2常用的API包含下列哪些类型的操作（）','ABCD',2,80),(18,'S3采用的专门安全措施是（）','AB',2,81),(19,'S3中对象有下面的（ ）组成','ABCD',2,82),(20,'与关系数据库比较，下列选项属于SDB特性的是（ ）','ACD',2,83),(21,'SDB不能完成的操作有（ ）','ABCD',2,84),(22,'SQS由三个基本部分组成（ ）','ABC',2,85),(23,'SQS常用的API有（ ）','ABCD',2,86),(24,'云格可以完成的服务有 （）','ACD',2,87),(25,'云计算的特点？( )','ABCDE',2,88),(26,'目前，选用开源的虚拟化产品组建虚拟化平台，构建基于硬件的虚拟化层，可以选用（ ）','BCD',2,89),(27,'在云计算中，虚拟层主要包括（ ）','ABC',2,90);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score` (
  `userId` varchar(60) NOT NULL,
  `exerciseNo` int(11) NOT NULL,
  `quizScore` double DEFAULT NULL,
  `quizOverall` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`,`exerciseNo`),
  KEY `exerciseNo_idx` (`exerciseNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES ('0a6b3cd5-666f-4135-8717-541032c78455',1,30,30),('c729461a-7e95-4b7b-aec4-8008b6244557',1,20,30),('c729461a-7e95-4b7b-aec4-8008b6244557',2,50,80);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
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
INSERT INTO `user` VALUES ('0a6b3cd5-666f-4135-8717-541032c78455','Foxiquora','123',0,'Quinn','asd@gmail.com'),('1','Admin','Admin123',1,'Admin',NULL),('10','Joanne','555666777',0,'Jo44Anne',NULL),('11','Anne','44455599',0,'Anne44',NULL),('12','Belle','33445566',0,'Belle',NULL),('13','Anne','123456',0,'Anne123',NULL),('14','Joe','55667788',0,'JoeJoe',NULL),('15','Lim','55667788',0,'LimLim',NULL),('16','LingLing','11223344',0,'LingLing',NULL),('17','Ken','11223344',0,'KenKen',NULL),('18','Clarence','Clarence',0,'Clarence',NULL),('19','Tang','TangTang',0,'Tang',NULL),('2','test','654321',0,'test',NULL),('20','Kenrick','KenKen',0,'Kenrick',NULL),('21','Happy','Happy123',0,'Happy',NULL),('22','Hank','Hank123',0,'Hank',NULL),('23','Rick','Rick123',0,'Rick',NULL),('24','Kenneth','Ken123',0,'Kenneth',NULL),('25','Derrick','Derrick123',0,'Derick',NULL),('26','Sam','Sam123',0,'Sam',NULL),('27','Samantha','Samsam123',0,'Samantha',NULL),('28','Martha','Martha123',0,'Martha',NULL),('29','Bruce','Bruce123',0,'Bruce',NULL),('3','feifei','123456',0,'fei123',NULL),('30','Clark','Clark123',0,'Clark',NULL),('31','Ben','Ben123',0,'Ben',NULL),('32','Bennedict','BenBen123',0,'Bennedict',NULL),('33','Stark','Stark123',0,'Stark',NULL),('34','Tony','Tony123',0,'Tony',NULL),('35','Tonny','Tonny123',0,'Tonny',NULL),('36','Clint','Clint123',0,'Clint',NULL),('37','Henry','Henry123',0,'Henry',NULL),('38','Emily','Emily123',0,'Emily',NULL),('39','Emilia','Emilia123',0,'Emilia',NULL),('4','huihui','123456',0,'huihui123',NULL),('40','David','David123',0,'David',NULL),('41','Jax','Jax123',0,'Jax',NULL),('42','Jarvan','Jarvan4',0,'Jarvan',NULL),('43','Terry','Terry123',0,'Terry',NULL),('44','TenTen','TenTen123',0,'TenTen',NULL),('45','Joko','Joko123',0,'Joko',NULL),('46','Ryu','Ryu123',0,'Ryu',NULL),('47','Jackson','Jackson123',0,'Jackson',NULL),('48','Armstrong','Armstrong123',0,'Armstrong',NULL),('49','Jacob','Jacob123',0,'Jacob',NULL),('5','xinxin','654321',0,'xinxin00',NULL),('6','yifei','654321',0,'yifei',NULL),('7','jason','123456',0,'jason321',NULL),('8','Jacky','1234567',0,'Jackk',NULL),('9','John','0987655',0,'Johnny',NULL),('9cf11887-faa5-4152-a9fe-93351c6f6887','test','asd',0,'Test Only','test@qq.com'),('c729461a-7e95-4b7b-aec4-8008b6244557','zack','asd',0,'Zack Lim','ssd@gmail.com');
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
  `totalScore` double DEFAULT NULL,
  `totalScoreOverall` int(10) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdetail`
--

LOCK TABLES `userdetail` WRITE;
/*!40000 ALTER TABLE `userdetail` DISABLE KEYS */;
INSERT INTO `userdetail` VALUES ('1',2,'10%','2017-09-12 03:36:00.000000','2017-09-12 11:36:00',NULL,NULL),('9cf11887-faa5-4152-a9fe-93351c6f6887',0,'0%','2017-10-30 02:23:28.000000','-',1,30),('c729461a-7e95-4b7b-aec4-8008b6244557',1,'25%','2017-09-12 03:36:00.000000','Java Chapter 1',17,63);
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

-- Dump completed on 2017-10-30 14:19:21
