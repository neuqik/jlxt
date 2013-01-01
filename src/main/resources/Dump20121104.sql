CREATE DATABASE  IF NOT EXISTS `solidbase` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `solidbase`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: solidbase
-- ------------------------------------------------------
-- Server version	5.5.28

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
-- Table structure for table `t_code`
--

DROP TABLE IF EXISTS `t_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_code` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE_VALUE` varchar(32) NOT NULL,
  `TYPE_ID` bigint(10) DEFAULT NULL,
  `PARENT_ID` bigint(10) DEFAULT NULL,
  `REMARK` varchar(50) NOT NULL DEFAULT '无',
  `ADD_TIME` varchar(20) DEFAULT NULL,
  `MODIFY_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CODE_VALUE` (`CODE_VALUE`),
  KEY `TYPE_ID` (`TYPE_ID`),
  KEY `PARENT_ID` (`PARENT_ID`),
  CONSTRAINT `t_code_ibfk_1` FOREIGN KEY (`TYPE_ID`) REFERENCES `t_code` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `t_code_ibfk_2` FOREIGN KEY (`PARENT_ID`) REFERENCES `t_code` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_code`
--

LOCK TABLES `t_code` WRITE;
/*!40000 ALTER TABLE `t_code` DISABLE KEYS */;
INSERT INTO `t_code` VALUES (1,'元类型代码',1,1,'元类型代码',NULL,NULL),(3,'depart-level',1,1,'部门级别',NULL,'2012-02-28 22:01:47'),(4,'depart',1,1,'部门',NULL,'2012-02-28 22:01:25'),(5,'depart-cate',1,1,'部门类别',NULL,'2012-02-28 22:01:30'),(10,'business',5,1,'业务部门','2012-02-28 22:18:36','2012-06-09 22:47:32'),(11,'level-1',3,1,'一级','2012-02-28 22:18:59','2012-02-28 22:27:19'),(17,'http-method',1,1,'资源操作',NULL,'2012-02-28 23:46:35'),(18,'perm-cate',1,1,'权限分类',NULL,'2012-02-28 23:49:20'),(19,'GET',17,1,'获取资源','2012-02-28 23:46:53','2012-02-28 23:46:53'),(20,'POST',17,1,'添加资源','2012-02-28 23:47:04','2012-02-28 23:47:04'),(21,'PUT',17,1,'更新资源','2012-02-28 23:47:16','2012-02-28 23:47:16'),(22,'DELETE',17,1,'删除资源','2012-02-28 23:47:29','2012-02-28 23:47:29'),(23,'user-module',18,1,'用户模块','2012-02-28 23:49:54','2012-03-08 08:29:46'),(25,'tech',5,1,'技术部门','2012-03-06 22:05:58','2012-03-06 22:05:58'),(27,'default-dev',4,31,'默认开发部',NULL,NULL),(28,'default-mark',4,31,'默认市场部',NULL,NULL),(30,'company',5,1,'公司','2012-03-07 13:57:30','2012-03-07 13:57:30'),(31,'xx-company',4,4,'XX公司',NULL,NULL),(35,'code-module',18,1,'代码模块','2012-03-08 07:13:32','2012-03-08 08:28:30'),(36,'depart-module',18,1,'部门模块','2012-03-08 07:17:53','2012-03-08 08:28:44'),(37,'main-module',18,1,'主模块','2012-03-08 07:43:31','2012-03-08 08:28:57'),(38,'navmenu-module',18,1,'导航菜单模块','2012-03-08 07:45:20','2012-03-08 08:29:17'),(39,'treemenu-module',18,1,'树形菜单模块','2012-03-08 07:45:33','2012-03-08 08:29:31'),(40,'perm-module',18,1,'权限模块','2012-03-08 08:29:57','2012-03-08 08:29:57'),(41,'preference-module',18,1,'系统参数模块','2012-03-08 08:30:40','2012-03-08 08:30:40'),(42,'role-module',18,1,'角色模块','2012-03-08 08:30:51','2012-03-08 08:30:51'),(43,'resource-module',18,1,'资源模块','2012-03-08 08:31:37','2012-03-08 08:31:37'),(44,'winon-tech-company',4,4,'万安科技有限公司',NULL,NULL),(45,'dev-dept',4,44,'开发部',NULL,NULL),(46,'business-dept',4,44,'业务部',NULL,NULL),(47,'level-2',3,1,'二级','2012-06-09 19:29:40','2012-06-09 19:29:53'),(48,'test',4,44,'测试部门',NULL,NULL);
/*!40000 ALTER TABLE `t_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_department`
--

DROP TABLE IF EXISTS `t_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_department` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE_ID` bigint(20) NOT NULL,
  `DEPART_LEVEL` bigint(20) NOT NULL,
  `DEPART_CATE` bigint(20) NOT NULL,
  `ADD_TIME` varchar(20) DEFAULT NULL,
  `MODIFY_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CODE_ID` (`CODE_ID`) USING BTREE,
  KEY `DEPART_LEVEL` (`DEPART_LEVEL`),
  KEY `DEPART_CATE` (`DEPART_CATE`),
  CONSTRAINT `t_department_ibfk_1` FOREIGN KEY (`CODE_ID`) REFERENCES `t_code` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `t_department_ibfk_2` FOREIGN KEY (`DEPART_LEVEL`) REFERENCES `t_code` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `t_department_ibfk_3` FOREIGN KEY (`DEPART_CATE`) REFERENCES `t_code` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_department`
--

LOCK TABLES `t_department` WRITE;
/*!40000 ALTER TABLE `t_department` DISABLE KEYS */;
INSERT INTO `t_department` VALUES (14,44,11,30,'2012-03-14 13:48:29','2012-03-14 13:48:29'),(15,45,11,25,'2012-03-14 13:48:51','2012-03-14 13:48:51'),(16,46,11,10,'2012-03-14 13:49:17','2012-06-09 19:25:38'),(17,48,47,10,'2012-06-09 19:30:19','2012-06-09 22:48:06');
/*!40000 ALTER TABLE `t_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_department_ext`
--

DROP TABLE IF EXISTS `t_department_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_department_ext` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SEAL_NAME` varchar(100) DEFAULT NULL,
  `CONTACT` varchar(20) DEFAULT NULL,
  `CONTACT_PHONE` varchar(20) DEFAULT NULL,
  `FAX` varchar(20) DEFAULT NULL,
  `ZIP` varchar(20) DEFAULT NULL,
  `CONTACT_ADDR` varchar(100) DEFAULT NULL,
  `POLICE_NUMBER` int(11) DEFAULT NULL,
  `ASSIST_NUMBER` int(11) DEFAULT NULL,
  `POLICE_KIND` bigint(20) NOT NULL,
  `IS_TEMPORARY` enum('no','yes') NOT NULL DEFAULT 'no',
  `DEPARTMENT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `DEPARTMENT_ID` (`DEPARTMENT_ID`) USING BTREE,
  KEY `POLICE_KIND` (`POLICE_KIND`),
  CONSTRAINT `t_department_ext_ibfk_4` FOREIGN KEY (`POLICE_KIND`) REFERENCES `t_code` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `t_department_ext_ibfk_5` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `t_department` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_department_ext`
--

LOCK TABLES `t_department_ext` WRITE;
/*!40000 ALTER TABLE `t_department_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_department_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_nav_menu`
--

DROP TABLE IF EXISTS `t_nav_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_nav_menu` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(16) NOT NULL,
  `HREF` varchar(255) DEFAULT NULL,
  `RANK` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_nav_menu`
--

LOCK TABLES `t_nav_menu` WRITE;
/*!40000 ALTER TABLE `t_nav_menu` DISABLE KEYS */;
INSERT INTO `t_nav_menu` VALUES (1,'系统管理','main/switchEnv/1',0),(4,'文章发布','main/switchEnv/4',1),(5,'站点维护','main/switchEnv/5',2),(6,'数据采集','main/switchEnv/6',3),(8,'打开JSP','main/switchEnv/hello.jsp',5),(9,'打开HTML','main/switchEnv/hello.html',4),(14,'我的菜单','main/switchEnv/14',6);
/*!40000 ALTER TABLE `t_nav_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_perm_http_method`
--

DROP TABLE IF EXISTS `t_perm_http_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_perm_http_method` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `perm_id` bigint(20) NOT NULL,
  `http_method` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `perm_id` (`perm_id`),
  KEY `http_method` (`http_method`),
  CONSTRAINT `t_perm_http_method_ibfk_1` FOREIGN KEY (`perm_id`) REFERENCES `t_permission` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_perm_http_method_ibfk_2` FOREIGN KEY (`http_method`) REFERENCES `t_code` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_perm_http_method`
--

LOCK TABLES `t_perm_http_method` WRITE;
/*!40000 ALTER TABLE `t_perm_http_method` DISABLE KEYS */;
INSERT INTO `t_perm_http_method` VALUES (152,185,20),(153,186,22),(154,187,19),(155,187,20),(156,188,19),(157,188,20),(158,189,19),(159,189,20),(160,190,19),(161,190,20),(162,191,22),(163,192,19),(164,192,20),(165,193,19),(166,193,20),(167,194,21),(169,195,20),(170,196,22),(171,197,19),(172,197,20),(173,198,19),(174,198,20),(175,199,21),(176,200,22),(177,201,19),(178,201,20),(179,183,19),(180,202,19),(181,202,20),(182,203,19),(183,203,20),(184,204,19),(185,204,20),(186,205,19),(187,205,20),(188,206,20),(189,207,22),(190,208,19),(191,208,20),(192,209,19),(193,209,20),(194,210,19),(195,210,20),(196,211,19),(197,211,20),(198,212,19),(199,212,20),(200,213,19),(201,213,20),(202,214,22),(203,215,19),(204,215,20),(205,216,21),(206,217,19),(207,217,20),(208,218,19),(209,218,20),(210,219,22),(211,220,20),(212,221,19),(213,221,20),(214,222,19),(215,222,20),(216,223,22),(217,224,21),(218,225,19),(219,225,20),(220,226,20),(221,226,21),(222,227,19),(223,227,20),(224,228,19),(225,228,20),(226,229,20),(227,230,22),(228,231,19),(229,231,20),(230,232,20),(232,234,19),(233,234,20),(234,233,20),(235,235,20),(236,236,22),(237,237,20),(238,238,20),(239,239,19),(240,239,20),(241,240,22),(242,241,19),(243,241,20),(244,242,19),(245,242,20),(246,243,19),(247,243,20),(248,244,22),(249,245,19),(250,245,20),(251,246,19),(252,246,20),(253,247,19),(254,247,20),(255,248,19),(256,248,20),(257,249,21),(258,250,19),(259,250,20),(260,251,21),(263,254,21),(266,257,21),(267,258,21),(268,259,21),(269,260,21),(270,261,22),(271,262,19),(272,262,20),(273,263,19),(274,263,20),(276,265,19),(277,265,20),(278,266,20),(279,267,22),(280,268,20),(281,269,22),(282,270,19),(283,270,20),(284,271,19),(285,271,20),(286,272,22),(287,273,19),(288,273,20),(289,274,19),(290,274,20),(291,275,22),(292,276,21),(293,277,19),(294,277,20),(295,278,20),(296,279,22),(297,280,19),(298,280,20),(299,281,20),(300,282,22),(301,283,19),(302,283,20),(303,284,19),(304,284,20),(305,285,22),(306,286,21),(307,287,19),(308,287,20),(309,288,19),(310,288,20),(311,289,19),(312,289,20),(313,264,19),(314,264,20);
/*!40000 ALTER TABLE `t_perm_http_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_permission`
--

DROP TABLE IF EXISTS `t_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_permission` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) NOT NULL,
  `RESOURCE_ID` bigint(20) NOT NULL,
  `TYPE` bigint(20) NOT NULL,
  `REMARK` varchar(255) DEFAULT '无',
  `ADD_TIME` varchar(20) DEFAULT NULL,
  `MODIFY_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`),
  KEY `TYPE` (`TYPE`),
  KEY `RESOURCE_ID` (`RESOURCE_ID`),
  CONSTRAINT `t_permission_ibfk_1` FOREIGN KEY (`TYPE`) REFERENCES `t_code` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `t_permission_ibfk_2` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `t_resource` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_permission`
--

LOCK TABLES `t_permission` WRITE;
/*!40000 ALTER TABLE `t_permission` DISABLE KEYS */;
INSERT INTO `t_permission` VALUES (183,'访问后台主页',5,37,'','2012-03-06 23:24:08','2012-03-08 07:43:42'),(185,'添加代码信息',7,35,'','2012-03-08 07:13:54','2012-03-08 07:13:54'),(186,'批量删除代码',8,35,'','2012-03-08 07:14:05','2012-03-08 07:14:05'),(187,'查看代码列表',9,35,'','2012-03-08 07:14:23','2012-03-08 07:14:23'),(188,'访问添加代码页面',10,35,'','2012-03-08 07:14:44','2012-03-08 07:14:44'),(189,'查询代码',11,35,'','2012-03-08 07:14:57','2012-03-08 07:14:57'),(190,'获取代码类型Json格式数据',12,35,'','2012-03-08 07:15:27','2012-03-08 07:15:27'),(191,'删除某项代码',13,35,'','2012-03-08 07:15:45','2012-03-08 07:15:45'),(192,'编辑某项代码',14,35,'','2012-03-08 07:16:01','2012-03-08 07:16:01'),(193,'获取某类型父代码',15,35,'','2012-03-08 07:16:17','2012-03-08 07:16:17'),(194,'更新某代码',16,35,'','2012-03-08 07:16:34','2012-03-08 07:16:34'),(195,'添加部门',17,36,'','2012-03-08 07:16:43','2012-03-08 07:25:22'),(196,'批量删除部门',18,36,'\n','2012-03-08 07:25:53','2012-03-08 07:25:53'),(197,'查看部门列表',19,36,'','2012-03-08 07:26:35','2012-03-08 07:26:35'),(198,'访问添加部门页面',20,36,'','2012-03-08 07:26:50','2012-03-08 07:26:50'),(199,'更新某部门',21,36,'','2012-03-08 07:27:02','2012-03-08 07:27:02'),(200,'删除某部门',21,36,'','2012-03-08 07:27:38','2012-03-08 07:27:38'),(201,'编辑某部门',22,36,'','2012-03-08 07:42:12','2012-03-08 07:42:12'),(202,'关于我们',23,37,'','2012-03-08 07:43:59','2012-03-08 07:43:59'),(203,'切换左边树形菜单',24,37,'','2012-03-08 07:44:17','2012-03-08 07:44:17'),(204,'切换左边显示html页面',25,37,'','2012-03-08 07:44:39','2012-03-08 07:44:39'),(205,'切换左边显示JSP页面',26,37,'','2012-03-08 07:44:53','2012-03-08 07:44:53'),(206,'添加导航菜单',27,38,'','2012-03-08 07:45:48','2012-03-08 07:45:48'),(207,'批量删除导航菜单',28,38,'','2012-03-08 07:46:01','2012-03-08 07:46:01'),(208,'查看导航菜单列表',29,38,'','2012-03-08 08:22:50','2012-03-08 08:22:50'),(209,'查找带回导航菜单',30,38,'','2012-03-08 08:23:09','2012-03-08 08:23:09'),(210,'查找搜索带回导航菜单',31,38,'','2012-03-08 08:23:29','2012-03-08 08:23:29'),(211,'访问添加导航菜单页面',32,38,'','2012-03-08 08:23:44','2012-03-08 08:23:44'),(212,'查询导航菜单',33,38,'','2012-03-08 08:23:56','2012-03-08 08:23:56'),(213,'下拉获取导航菜单Json格式信息',34,38,'','2012-03-08 08:24:37','2012-03-08 08:24:37'),(214,'删除某导航菜单',35,38,'','2012-03-08 08:24:57','2012-03-08 08:24:57'),(215,'编辑某导航菜单',36,38,'','2012-03-08 08:25:11','2012-03-08 08:25:11'),(216,'更新某导航菜单',37,38,'','2012-03-08 08:25:25','2012-03-08 08:25:25'),(217,'查看用户日志',38,23,'','2012-03-08 08:33:00','2012-03-08 08:33:00'),(218,'获取某用户的角色',39,23,'','2012-03-08 08:34:02','2012-03-08 08:34:02'),(219,'批量删除权限',40,40,'','2012-03-08 08:34:26','2012-03-08 08:34:26'),(220,'添加权限',41,40,'','2012-03-08 08:34:38','2012-03-08 08:34:38'),(221,'查看权限列表',42,40,'','2012-03-08 08:34:52','2012-03-08 08:34:52'),(222,'访问添加权限页面',43,40,'','2012-03-08 08:35:09','2012-03-08 08:35:09'),(223,'删除某权限',44,40,'','2012-03-08 08:35:25','2012-03-08 08:35:25'),(224,'更新某权限',44,40,'','2012-03-08 08:35:36','2012-03-08 08:35:36'),(225,'编辑某权限',45,40,'','2012-03-08 08:35:49','2012-03-08 08:35:49'),(226,'更新系统参数',46,41,'','2012-03-08 08:36:19','2012-03-08 08:36:19'),(227,'查看系统参数列表',47,41,'','2012-03-08 08:36:32','2012-03-08 08:36:32'),(228,'编辑某系统参数',48,41,'','2012-03-08 08:36:43','2012-03-08 08:36:43'),(229,'添加资源',49,43,'','2012-03-08 08:36:53','2012-03-08 08:36:53'),(230,'批量删除资源',50,43,'','2012-03-08 08:37:32','2012-03-08 08:37:32'),(231,'查看资源列表',51,43,'','2012-03-08 08:37:48','2012-03-08 08:37:48'),(232,'添加角色',52,42,'','2012-03-08 08:38:01','2012-03-08 08:38:01'),(233,'访问分配权限页面',53,40,'','2012-03-08 08:38:18','2012-03-08 08:39:07'),(234,'查看角色列表',54,42,'','2012-03-08 08:38:35','2012-03-08 08:38:35'),(235,'分配权限',55,40,'','2012-03-08 08:39:25','2012-03-08 08:39:25'),(236,'删除角色权限',56,40,'','2012-03-08 08:39:51','2012-03-08 08:39:51'),(237,'添加树形菜单',57,39,'','2012-03-08 08:40:09','2012-03-08 08:40:09'),(238,'添加用户',58,23,'','2012-03-08 08:40:26','2012-03-08 08:40:26'),(239,'查看用户列表',59,23,'','2012-03-08 08:40:42','2012-03-08 08:40:42'),(240,'批量删除树形菜单',61,39,'','2012-06-09 23:31:29','2012-06-09 23:31:29'),(241,'查看树形菜单列表',62,39,'','2012-06-09 23:32:48','2012-06-09 23:32:48'),(242,'访问添加树形菜单页面',63,39,'','2012-06-09 23:33:10','2012-06-09 23:33:10'),(243,'查询树形菜单',64,39,'','2012-06-09 23:33:29','2012-06-09 23:33:29'),(244,'删除某树形菜单',65,39,'','2012-06-09 23:33:50','2012-06-09 23:33:50'),(245,'编辑某树形菜单',66,39,'','2012-06-09 23:34:53','2012-06-09 23:34:53'),(246,'查找带回某导航菜单下的树形菜单',67,39,'','2012-06-09 23:35:28','2012-06-09 23:35:28'),(247,'在查找带回中查询树形菜单',68,39,'','2012-06-09 23:37:10','2012-06-09 23:37:10'),(248,'获取某导航菜单下的树形菜单JSON数据',69,39,'','2012-06-09 23:37:41','2012-06-09 23:37:41'),(249,'更新某树形菜单',70,39,'','2012-06-09 23:37:56','2012-06-09 23:37:56'),(250,'查看我的资料',71,23,'','2012-06-09 23:42:10','2012-06-09 23:42:10'),(251,'更新某用户',72,23,'','2012-06-09 23:42:32','2012-06-09 23:42:32'),(254,'退出后台',74,23,'','2012-06-10 00:35:03','2012-06-10 00:35:03'),(257,'锁定用户',76,23,'','2012-06-10 00:35:55','2012-06-10 00:35:55'),(258,'解锁用户',77,23,'','2012-06-10 00:36:14','2012-06-10 00:36:14'),(259,'批量锁定用户',78,23,'','2012-06-10 00:36:35','2012-06-10 00:36:35'),(260,'批量解锁用户',79,23,'','2012-06-10 00:36:48','2012-06-10 00:36:48'),(261,'批量删除用户',80,23,'','2012-06-10 00:37:03','2012-06-10 00:37:03'),(262,'分配部门',81,23,'','2012-06-10 00:37:16','2012-06-10 00:37:16'),(263,'分配角色',82,23,'','2012-06-10 00:37:28','2012-06-10 00:37:28'),(264,'访问添加用户页',83,23,'','2012-06-10 00:38:22','2012-06-10 01:34:03'),(265,'查询用户',84,23,'','2012-06-10 00:38:32','2012-06-10 00:38:32'),(266,'为用户分配部门',85,23,'','2012-06-10 00:38:59','2012-06-10 00:38:59'),(267,'删除用户分配的部门',86,23,'','2012-06-10 00:39:23','2012-06-10 00:39:23'),(268,'为用户分配角色',87,23,'','2012-06-10 00:39:38','2012-06-10 00:39:38'),(269,'删除用户分配的角色',88,23,'','2012-06-10 00:39:54','2012-06-10 00:39:54'),(270,'编辑某用户',89,23,'','2012-06-10 00:41:00','2012-06-10 00:41:00'),(271,'获取为某用户已分配的部门',90,23,'','2012-06-10 00:41:32','2012-06-10 00:41:32'),(272,'删除某用户',72,23,'','2012-06-10 01:15:17','2012-06-10 01:15:17'),(273,'获取URI资源JSON格式',91,43,'','2012-06-10 01:15:54','2012-06-10 01:15:54'),(274,'访问添加URI资源页',92,43,'','2012-06-10 01:16:10','2012-06-10 01:16:10'),(275,'删除某URI资源',60,43,'','2012-06-10 01:16:26','2012-06-10 01:16:26'),(276,'更新某URI资源',60,43,'','2012-06-10 01:17:03','2012-06-10 01:17:03'),(277,'编辑某URI资源',93,43,'','2012-06-10 01:17:18','2012-06-10 01:17:18'),(278,'分配菜单',94,40,'','2012-06-10 01:20:11','2012-06-10 01:20:11'),(279,'批量删除角色',95,42,'','2012-06-10 01:20:24','2012-06-10 01:20:24'),(280,'访问添加角色页',96,42,'','2012-06-10 01:20:37','2012-06-10 01:20:37'),(281,'为角色分配菜单',97,40,'','2012-06-10 01:20:54','2012-06-10 01:20:54'),(282,'删除角色已分配的菜单',98,40,'','2012-06-10 01:21:15','2012-06-10 01:21:15'),(283,'查询角色',99,42,'','2012-06-10 01:21:26','2012-06-10 01:21:26'),(284,'获取角色JSON数据',100,42,'','2012-06-10 01:21:42','2012-06-10 01:21:42'),(285,'删除某角色',101,42,'','2012-06-10 01:21:53','2012-06-10 01:21:53'),(286,'更新某角色',102,42,'','2012-06-10 01:22:06','2012-06-10 01:22:06'),(287,'编辑某角色',103,42,'','2012-06-10 01:22:17','2012-06-10 01:22:17'),(288,'获取某角色已分配的菜单',104,42,'','2012-06-10 01:22:42','2012-06-10 01:22:42'),(289,'获取某角色已分配的权限',105,42,'','2012-06-10 01:23:00','2012-06-10 01:23:00');
/*!40000 ALTER TABLE `t_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_preference`
--

DROP TABLE IF EXISTS `t_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_preference` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prop_id` varchar(255) NOT NULL,
  `param` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_preference`
--

LOCK TABLES `t_preference` WRITE;
/*!40000 ALTER TABLE `t_preference` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_resource`
--

DROP TABLE IF EXISTS `t_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uri` (`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_resource`
--

LOCK TABLES `t_resource` WRITE;
/*!40000 ALTER TABLE `t_resource` DISABLE KEYS */;
INSERT INTO `t_resource` VALUES (7,'codes'),(8,'codes/batchRemove'),(9,'codes/list'),(10,'codes/new'),(11,'codes/search'),(12,'codes/types.json'),(13,'codes/{codeId}'),(14,'codes/{codeId}/edit'),(15,'codes/{codeTypeId}/parents.json'),(16,'codes/{editCodeId}'),(17,'departments'),(18,'departments/batchRemove'),(19,'departments/list'),(20,'departments/new'),(21,'departments/{departId}'),(22,'departments/{departId}/edit'),(5,'main'),(23,'main/about-us'),(24,'main/switchEnv/{navMenuId}'),(25,'main/switchEnv/{pageName}.html'),(26,'main/switchEnv/{pageName}.jsp'),(27,'navmenus'),(28,'navmenus/batchRemove'),(29,'navmenus/list'),(30,'navmenus/lookup'),(31,'navmenus/lookupSearch'),(32,'navmenus/new'),(33,'navmenus/search'),(34,'navmenus/suggest.json'),(35,'navmenus/{id}'),(36,'navmenus/{id}/edit'),(37,'navmenus/{navMenuId}'),(41,'permissions'),(40,'permissions/batchRemove'),(42,'permissions/list'),(43,'permissions/new'),(44,'permissions/{permId}'),(45,'permissions/{permId}/edit'),(46,'preferences'),(47,'preferences/list'),(48,'preferences/{preferId}/edit'),(49,'resources'),(50,'resources/batchRemove'),(91,'resources/json'),(51,'resources/list'),(92,'resources/new'),(60,'resources/{resId}'),(93,'resources/{resId}/edit'),(52,'roles'),(94,'roles/alloc-menu'),(53,'roles/alloc-permission'),(95,'roles/batchRemove'),(54,'roles/list'),(96,'roles/new'),(97,'roles/role-menu'),(98,'roles/role-menu/remove'),(55,'roles/role-permission'),(56,'roles/role-permission/remove'),(99,'roles/search'),(100,'roles/suggest.json'),(101,'roles/{id}'),(102,'roles/{roleId}'),(103,'roles/{roleId}/edit'),(104,'roles/{roleId}/menus'),(105,'roles/{roleId}/permissions'),(57,'treemenus'),(61,'treemenus/batchRemove'),(62,'treemenus/list'),(63,'treemenus/new'),(64,'treemenus/search'),(65,'treemenus/{id}'),(66,'treemenus/{id}/edit'),(67,'treemenus/{navMenuId}/lookup'),(68,'treemenus/{navMenuId}/lookupSearch'),(69,'treemenus/{navMenuId}/suggest.json'),(70,'treemenus/{treeMenuId}'),(58,'users'),(81,'users/alloc-department'),(82,'users/alloc-role'),(78,'users/batchLock'),(80,'users/batchRemove'),(79,'users/batchUnLock'),(59,'users/list'),(73,'users/login'),(74,'users/logout'),(38,'users/logs'),(83,'users/new'),(71,'users/profile'),(75,'users/register'),(84,'users/search'),(85,'users/user-department'),(86,'users/user-department/remove'),(87,'users/user-role'),(88,'users/user-role/remove'),(72,'users/{id}'),(89,'users/{id}/edit'),(76,'users/{id}/lock'),(77,'users/{id}/unLock'),(90,'users/{userId}/departments'),(39,'users/{userId}/roles');
/*!40000 ALTER TABLE `t_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) NOT NULL,
  `DESCRIPTION` varchar(50) NOT NULL DEFAULT '无',
  `ADD_TIME` varchar(20) DEFAULT NULL,
  `MODIFY_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (5,'默认角色','用来配置权限的角色','2012-03-07 00:07:32','2012-03-30 14:34:16'),(6,'代码管理员','只能看到代码管理部分的菜单','2012-03-28 01:50:43','2012-03-28 01:50:43'),(7,'网站管理员','网站管理','2012-03-28 13:31:38','2012-03-28 13:31:38'),(8,'文章发布员','文章发布','2012-03-28 13:31:48','2012-03-28 13:31:48');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_menu`
--

DROP TABLE IF EXISTS `t_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_menu` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` bigint(20) NOT NULL,
  `MENU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROLE_ID` (`ROLE_ID`),
  KEY `MENU_ID` (`MENU_ID`),
  CONSTRAINT `t_role_menu_ibfk_3` FOREIGN KEY (`ROLE_ID`) REFERENCES `t_role` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `t_role_menu_ibfk_4` FOREIGN KEY (`MENU_ID`) REFERENCES `t_tree_menu` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_menu`
--

LOCK TABLES `t_role_menu` WRITE;
/*!40000 ALTER TABLE `t_role_menu` DISABLE KEYS */;
INSERT INTO `t_role_menu` VALUES (166,8,381),(167,8,382),(168,7,384),(169,7,385),(170,7,387),(171,7,389),(172,6,192),(173,6,193),(176,6,185),(177,6,186),(178,5,185),(179,5,186),(180,5,379),(181,5,192),(182,5,193),(183,5,342),(184,5,343),(185,5,180),(186,5,367),(187,5,187),(188,5,361),(189,5,362),(190,5,370),(191,5,377),(192,5,188),(193,5,375),(194,5,376),(195,5,368),(196,5,369),(197,5,380),(198,5,189),(199,5,381),(200,5,382),(201,5,384),(202,5,385),(203,5,387),(204,5,389),(205,5,395);
/*!40000 ALTER TABLE `t_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_navmenu`
--

DROP TABLE IF EXISTS `t_role_navmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_navmenu` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` bigint(20) NOT NULL,
  `NAVMENU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROLE_ID` (`ROLE_ID`),
  KEY `NAVMENU_ID` (`NAVMENU_ID`),
  CONSTRAINT `t_role_navmenu_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `t_role` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `t_role_navmenu_ibfk_2` FOREIGN KEY (`NAVMENU_ID`) REFERENCES `t_nav_menu` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_navmenu`
--

LOCK TABLES `t_role_navmenu` WRITE;
/*!40000 ALTER TABLE `t_role_navmenu` DISABLE KEYS */;
INSERT INTO `t_role_navmenu` VALUES (10,8,8),(11,5,9),(12,5,8);
/*!40000 ALTER TABLE `t_role_navmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_permission`
--

DROP TABLE IF EXISTS `t_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_permission` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` bigint(20) NOT NULL,
  `PERM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROLE_ID` (`ROLE_ID`),
  KEY `PERM_ID` (`PERM_ID`),
  CONSTRAINT `t_role_permission_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `t_role` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `t_role_permission_ibfk_2` FOREIGN KEY (`PERM_ID`) REFERENCES `t_permission` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=458 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_permission`
--

LOCK TABLES `t_role_permission` WRITE;
/*!40000 ALTER TABLE `t_role_permission` DISABLE KEYS */;
INSERT INTO `t_role_permission` VALUES (203,7,194),(204,7,193),(205,7,192),(206,7,191),(207,7,190),(208,7,189),(209,7,188),(210,7,187),(211,7,186),(212,7,185),(213,7,201),(214,7,200),(215,7,199),(216,7,198),(217,7,197),(218,7,196),(219,7,195),(220,7,205),(221,7,204),(222,7,203),(223,7,202),(224,7,183),(225,7,216),(226,7,215),(227,7,214),(228,7,213),(229,7,212),(230,7,211),(231,7,210),(232,7,209),(233,7,208),(234,7,207),(235,7,206),(236,7,236),(237,7,235),(238,7,233),(239,7,225),(240,7,224),(241,7,223),(242,7,222),(243,7,221),(244,7,220),(245,7,219),(246,7,228),(247,7,227),(248,7,226),(249,7,231),(250,7,230),(251,7,229),(252,7,234),(253,7,232),(254,7,237),(255,7,239),(256,7,238),(257,7,218),(258,7,217),(259,6,194),(260,6,193),(261,6,192),(262,6,191),(263,6,190),(264,6,189),(265,6,188),(266,6,187),(267,6,186),(268,6,185),(280,6,183),(292,6,236),(293,6,235),(294,6,233),(302,6,228),(303,6,227),(305,6,231),(306,6,230),(307,6,229),(308,6,234),(309,6,232),(310,6,237),(311,6,239),(312,6,238),(427,6,208),(428,6,250),(429,6,197),(430,6,203),(431,6,202),(432,6,212),(433,6,221),(434,6,283),(435,6,241),(436,6,265),(437,6,254),(438,6,251),(439,5,189),(440,5,187),(441,5,197),(442,5,203),(443,5,202),(444,5,183),(445,5,212),(446,5,208),(447,5,221),(448,5,227),(449,5,231),(450,5,283),(451,5,234),(452,5,241),(453,5,265),(454,5,254),(455,5,251),(456,5,250),(457,5,239);
/*!40000 ALTER TABLE `t_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_setting`
--

DROP TABLE IF EXISTS `t_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_default_role` bigint(20) DEFAULT NULL,
  `user_perm_control` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_default_role` (`user_default_role`),
  CONSTRAINT `user_default_role` FOREIGN KEY (`user_default_role`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_setting`
--

LOCK TABLES `t_setting` WRITE;
/*!40000 ALTER TABLE `t_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tree_menu`
--

DROP TABLE IF EXISTS `t_tree_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tree_menu` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(16) NOT NULL,
  `TARGET` varchar(20) DEFAULT NULL,
  `REL` varchar(20) DEFAULT NULL,
  `RELOAD_FLAG` varchar(1) NOT NULL DEFAULT '1',
  `HREF` varchar(255) DEFAULT NULL,
  `PID` bigint(20) DEFAULT NULL,
  `RANK` int(11) NOT NULL DEFAULT '0',
  `NAV_MENU_ID` bigint(20) DEFAULT NULL,
  `EXTERNAL` varchar(5) NOT NULL DEFAULT 'false',
  `WIDTH` int(11) NOT NULL DEFAULT '400',
  `HEIGHT` int(11) NOT NULL DEFAULT '200',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`),
  KEY `NAV_MENU_ID` (`NAV_MENU_ID`),
  KEY `PID` (`PID`),
  CONSTRAINT `t_tree_menu_ibfk_1` FOREIGN KEY (`NAV_MENU_ID`) REFERENCES `t_nav_menu` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `t_tree_menu_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `t_tree_menu` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tree_menu`
--

LOCK TABLES `t_tree_menu` WRITE;
/*!40000 ALTER TABLE `t_tree_menu` DISABLE KEYS */;
INSERT INTO `t_tree_menu` VALUES (1,'顶级菜单',NULL,NULL,'1',NULL,1,0,1,'false',400,200),(150,'角色管理','navTab','','0','#',1,3,1,'false',400,300),(151,'用户管理','navTab','','1','',1,4,1,'false',400,300),(152,'菜单管理','navTab','','0','',1,0,1,'false',400,300),(153,'权限管理','navTab','','0','',1,6,1,'false',400,300),(155,'代码管理','navTab','','0','',1,1,1,'false',400,300),(180,'列出所有角色','navTab','xssyjs','1','roles/list',150,0,1,' ',400,300),(185,'导航菜单','navTab','xssydhcd','1','navmenus/list',152,0,1,' ',400,300),(186,'树形菜单','navTab','xssysxcd','1','treemenus/list',152,1,1,' ',400,300),(187,'列出所有用户','navTab','xssyyh','1','users/list',151,0,1,' ',400,300),(188,'我的个人资料','dialog','wdgrzl','1','users/profile',151,2,1,' ',400,300),(189,'定义权限','dialog','dyqx','1','permissions/new',153,3,1,'false',800,300),(192,'列出所有代码','navTab','xssydm','1','codes/list',155,0,1,' ',400,300),(193,'新增代码','dialog','xzdm','0','codes/new',155,0,1,' ',400,300),(341,'部门管理','navTab','bmgl','0','',1,2,1,'false',500,300),(342,'列出全部部门','navTab','xssybm','1','departments/list',341,0,1,'false',500,300),(343,'添加部门','dialog','tjbm','0','departments/new',341,0,1,'false',500,300),(361,'分配部门','navTab','fpbm','1','users/alloc-department',151,0,1,'false',100,100),(362,'分配角色','navTab','fpjs','1','users/alloc-role',151,0,1,'false',100,100),(364,'文章管理','navTab','','0','',1,7,4,'false',1,1),(367,'新增角色','dialog','xzjs','0','roles/new',150,0,1,'false',300,200),(368,'分配权限','navTab','fpqx','0','roles/alloc-permission',153,0,1,'false',1,1),(369,'列出全部权限定义','navTab','xssyqxdy','0','permissions/list',153,0,1,'false',1,1),(370,'添加用户','dialog','xzyh','0','users/new',151,0,1,'false',500,600),(374,'资源管理','navTab','','0','',1,5,1,'false',0,0),(375,'列出所有资源','navTab','xssyzy','0','resources/list',374,0,1,'false',0,0),(376,'新增资源','dialog','xzzy','0','resources/new',374,0,1,'false',300,150),(377,'查看用户日志','navTab','xssyyhrz','1','users/logs',151,0,1,'false',0,0),(378,'系统参数','navTab','','0','',1,0,1,'false',0,0),(379,'全部参数','navTab','xssyxtcs','0','preferences/list',378,0,1,'false',0,0),(380,'分配菜单','navTab','fpcd','0','roles/alloc-menu',153,0,1,'false',0,0),(381,'全部文章','navTab','xssywz','0','articles/list',364,0,4,'false',0,0),(382,'发表文章','navTab','xzwz','0','articles/new',364,0,4,'false',0,0),(383,'网站栏目','navTab','','0','',1,0,5,'false',0,0),(384,'全部栏目','navTab','xssylm','0','columns/list',383,0,5,'false',0,0),(385,'新增栏目','navTab','xzlm','0','columns/new',383,0,5,'false',500,400),(386,'信息维护','navTab','','0','',1,0,5,'false',0,0),(387,'基础信息设置','navTab','jcxxsz','0','infos/setting',386,0,5,'false',0,0),(388,'SEO设置','navTab','','0','',1,0,5,'false',0,0),(389,'关键词设置','navTab','gjcsz','0','keywords/setting',388,0,5,'false',0,0),(390,'数据采集','navTab','','0','',1,0,6,'false',0,0),(395,'Web爬虫抓取','navTab','','0','',390,0,6,'false',0,0);
/*!40000 ALTER TABLE `t_tree_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACCOUNT` varchar(16) NOT NULL,
  `PASSWORD` varchar(32) NOT NULL,
  `STATUS` enum('锁定','正常') NOT NULL DEFAULT '正常',
  `LAST_LOGIN_TIME` varchar(19) DEFAULT NULL,
  `LAST_LOGIN_IP` varchar(19) NOT NULL DEFAULT '',
  `REGISTER_TIME` varchar(20) DEFAULT NULL,
  `ADD_TIME` varchar(20) DEFAULT NULL,
  `MODIFY_TIME` varchar(20) DEFAULT NULL,
  `TRUE_NAME` varchar(20) NOT NULL DEFAULT '匿名',
  `EMAIL` varchar(20) NOT NULL DEFAULT '无',
  `FAX` varchar(20) NOT NULL DEFAULT '无',
  `ADDR` varchar(20) DEFAULT NULL,
  `OFFICE_PHONE` varchar(20) DEFAULT NULL,
  `MOBILE_NUM` varchar(20) DEFAULT NULL,
  `HOME_PHONE` varchar(20) DEFAULT NULL,
  `AVAILABLE_PERIOD` varchar(20) DEFAULT NULL,
  `ID_NUM` varchar(20) DEFAULT NULL,
  `SUPER_POWER` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ACCOUNT` (`ACCOUNT`),
  KEY `TRUE_NAME` (`TRUE_NAME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (9,'solidbase','4c5531126fd5b96261ebb2637c299e34','正常','2012-06-10 01:33:04','127.0.0.1','2012-03-06 21:55:51','2012-03-06 21:55:51','2012-06-10 01:32:52','演示账号','eweb4j@163.com','','中国广东','','','','','','yes'),(17,'weiwei','7bc16d8f67f52d74f0fc2df48096204a','正常','2012-06-10 11:09:34','127.0.0.1','2012-03-07 20:33:21','2012-03-07 20:33:21','2012-06-10 11:10:06','匿名','无','无','','','','','','44162544554878985','no'),(18,'code','c13367945d5d4c91047b3b50234aa7ab','正常','2012-06-10 00:42:14','127.0.0.1','2012-03-28 01:51:02','2012-03-28 01:51:02','2012-06-09 23:43:25','weiwei2','','','','','','','','','no'),(19,'article','92a2b5cb9c6906035c2864fa225e1940','正常','2012-03-30 17:03:44','192.168.0.25','2012-03-28 13:32:38','2012-03-28 13:32:38','2012-03-28 22:31:19','','','','','','','','','','no'),(20,'website','d1befa03c79ca0b84ecc488dea96bc68','正常','2012-03-30 14:58:22','192.168.0.25','2012-03-28 13:32:50','2012-03-28 13:32:50','2012-03-28 21:59:57','','','','','','','','','','no'),(21,'test','098f6bcd4621d373cade4e832627b4f6','正常','2012-11-04 22:28:19','0:0:0:0:0:0:0:1','2012-03-28 14:03:22','2012-03-28 14:03:22','2012-03-28 14:03:22','','','','','','','','','','yes'),(22,'testweiwei','71f62e874c426cfc9169e58a4e87cb4a','正常','2012-06-09 18:34:19','127.0.0.1','2012-06-09 18:34:10','2012-06-09 18:34:10','2012-06-09 18:36:35','匿名','无','无','','','','','','','yes'),(23,'test2','e10adc3949ba59abbe56e057f20f883e','锁定','2012-06-09 22:46:51','127.0.0.1','2012-06-09 22:46:40','2012-06-09 22:46:40','2012-06-09 22:46:40','匿名','无','无',NULL,NULL,NULL,NULL,NULL,NULL,'yes');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_activity_log`
--

DROP TABLE IF EXISTS `t_user_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_activity_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) DEFAULT NULL,
  `TIME` varchar(20) NOT NULL,
  `ACTIVITY` varchar(500) NOT NULL DEFAULT '',
  `RESULT` enum('success','false') NOT NULL,
  `FAILURE_CAUSE` varchar(1000) NOT NULL DEFAULT '',
  `USER_NAME` varchar(20) NOT NULL DEFAULT '''佚名''',
  `USER_ACCOUNT` varchar(32) NOT NULL DEFAULT '''匿名账号''',
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `t_user_activity_log_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `t_user` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_activity_log`
--

LOCK TABLES `t_user_activity_log` WRITE;
/*!40000 ALTER TABLE `t_user_activity_log` DISABLE KEYS */;
INSERT INTO `t_user_activity_log` VALUES (1,9,'2012-03-07 14:04:17','访问后台主页','false','用户权限不足, 无法执行[访问后台主页]功能','演示账号','solidbase'),(2,9,'2012-03-07 14:11:04','访问后台主页','success','','演示账号','solidbase'),(3,9,'2012-03-07 14:11:05','访问后台主页','success','','演示账号','solidbase'),(4,9,'2012-03-07 14:11:31','访问后台主页','false','用户权限不足, 无法执行[访问后台主页]功能','演示账号','solidbase'),(5,9,'2012-03-07 14:15:11','访问后台主页','false','用户权限不足, 无法执行[访问后台主页]功能','演示账号','solidbase'),(6,9,'2012-03-07 14:15:15','访问后台主页','false','用户权限不足, 无法执行[访问后台主页]功能','演示账号','solidbase'),(7,9,'2012-03-07 18:24:16','访问后台主页','success','','演示账号','solidbase'),(8,9,'2012-03-07 18:24:31','访问后台主页','success','','演示账号','solidbase'),(9,9,'2012-03-07 18:54:44','访问后台主页','success','','演示账号','solidbase'),(10,9,'2012-03-07 18:55:03','访问后台主页','success','','演示账号','solidbase'),(11,9,'2012-03-07 18:56:03','访问后台主页','success','','演示账号','solidbase'),(12,9,'2012-03-07 19:02:01','访问后台主页','success','','演示账号','solidbase'),(13,9,'2012-03-07 19:02:09','访问后台主页','success','','演示账号','solidbase'),(14,9,'2012-03-07 19:08:44','访问后台主页','success','','演示账号','solidbase'),(15,9,'2012-03-07 19:22:52','访问后台主页','success','','演示账号','solidbase'),(16,9,'2012-03-07 19:25:12','访问后台主页','success','','演示账号','solidbase'),(17,9,'2012-03-07 19:25:37','访问后台主页','success','','演示账号','solidbase'),(18,9,'2012-03-07 19:25:38','访问后台主页','success','','演示账号','solidbase'),(19,9,'2012-03-07 19:25:43','访问后台主页','success','','演示账号','solidbase'),(20,9,'2012-03-07 19:25:54','访问后台主页','success','','演示账号','solidbase'),(21,9,'2012-03-07 19:26:59','访问后台主页','success','','演示账号','solidbase'),(22,9,'2012-03-07 19:27:28','访问后台主页','success','','演示账号','solidbase'),(23,9,'2012-03-07 19:27:41','访问后台主页','success','','演示账号','solidbase'),(24,9,'2012-03-07 19:28:22','访问后台主页','success','','演示账号','solidbase'),(25,9,'2012-03-07 19:28:29','访问后台主页','success','','演示账号','solidbase'),(26,9,'2012-03-07 19:28:39','访问后台主页','success','','演示账号','solidbase'),(27,9,'2012-03-07 19:29:09','访问后台主页','success','','演示账号','solidbase'),(28,9,'2012-03-07 19:29:22','访问后台主页','success','','演示账号','solidbase'),(29,9,'2012-03-07 19:30:17','访问后台主页','success','','演示账号','solidbase'),(30,9,'2012-03-07 19:30:23','访问后台主页','success','','演示账号','solidbase'),(31,9,'2012-03-07 19:30:50','访问后台主页','success','','演示账号','solidbase'),(32,9,'2012-03-07 19:31:58','访问后台主页','success','','演示账号','solidbase'),(33,9,'2012-03-07 19:45:59','访问后台主页','success','','演示账号','solidbase'),(34,9,'2012-03-07 19:46:05','访问后台主页','success','','演示账号','solidbase'),(35,9,'2012-03-07 20:49:27','访问后台主页','success','','演示账号','solidbase'),(36,9,'2012-03-07 20:52:25','访问后台主页','success','','演示账号','solidbase'),(37,9,'2012-03-07 20:59:09','访问后台主页','success','','演示账号','solidbase'),(38,9,'2012-03-07 21:11:25','访问后台主页','success','','演示账号','solidbase'),(39,9,'2012-03-07 21:12:26','访问后台主页','success','','演示账号','solidbase'),(40,9,'2012-03-07 21:16:02','访问后台主页','success','','演示账号','solidbase'),(41,9,'2012-03-07 21:16:22','访问后台主页','success','','演示账号','solidbase'),(42,9,'2012-03-08 06:25:02','访问后台主页','success','','演示账号','solidbase'),(43,9,'2012-03-08 06:25:06','访问后台主页','success','','演示账号','solidbase'),(44,9,'2012-03-08 06:26:05','访问后台主页','success','','演示账号','solidbase'),(45,9,'2012-03-08 06:26:17','访问后台主页','success','','演示账号','solidbase'),(46,9,'2012-03-08 06:27:02','访问后台主页','success','','演示账号','solidbase'),(47,9,'2012-03-08 06:27:41','访问后台主页','success','','演示账号','solidbase'),(48,9,'2012-03-08 06:40:32','访问后台主页','success','','演示账号','solidbase'),(49,9,'2012-03-08 07:12:33','访问后台主页','success','','演示账号','solidbase'),(50,9,'2012-03-08 07:16:59','访问添加代码页面','false','用户权限不足, 无法执行[访问添加代码页面]功能','演示账号','solidbase'),(51,9,'2012-03-28 21:56:38','访问后台主页','success','','演示账号','solidbase'),(52,9,'2012-03-28 21:56:44','查看导航菜单列表','success','','演示账号','solidbase'),(53,9,'2012-03-28 21:56:45','访问添加导航菜单页面','success','','演示账号','solidbase'),(54,9,'2012-03-28 21:56:51','添加导航菜单','success','','演示账号','solidbase'),(55,9,'2012-03-28 21:56:52','查看导航菜单列表','success','','演示账号','solidbase'),(56,9,'2012-03-28 21:56:54','访问后台主页','success','','演示账号','solidbase'),(57,9,'2012-03-28 21:56:56','查看导航菜单列表','success','','演示账号','solidbase'),(58,9,'2012-03-28 21:57:13','访问后台主页','success','','演示账号','solidbase'),(59,20,'2012-03-28 22:00:14','访问后台主页','false','用户权限不足, 无法执行[访问后台主页]功能','','website'),(60,20,'2012-03-28 22:00:20','访问后台主页','false','用户权限不足, 无法执行[访问后台主页]功能','','website'),(61,20,'2012-03-28 22:21:57','访问后台主页','success','','','website'),(62,20,'2012-03-28 22:22:00','查看导航菜单列表','success','','','website'),(63,9,'2012-03-28 22:25:21','访问后台主页','success','','演示账号','solidbase'),(64,19,'2012-03-28 22:31:27','访问后台主页','success','','','article'),(65,19,'2012-03-28 22:34:11','访问后台主页','success','','','article'),(66,19,'2012-03-28 22:35:59','访问后台主页','success','','','article'),(67,20,'2012-03-28 23:20:39','访问后台主页','success','','','website'),(68,19,'2012-03-28 23:52:13','访问后台主页','success','','','article'),(69,18,'2012-03-28 23:53:45','访问后台主页','success','','','code'),(70,18,'2012-03-28 23:54:40','访问后台主页','success','','','code'),(71,18,'2012-03-28 23:55:46','访问后台主页','success','','','code'),(72,18,'2012-03-28 23:56:19','查看代码列表','success','','','code'),(73,18,'2012-03-29 19:22:21','访问后台主页','success','','','code'),(74,18,'2012-03-29 19:23:05','访问后台主页','success','','','code'),(75,18,'2012-03-29 19:23:58','访问后台主页','success','','','code'),(76,18,'2012-03-29 19:31:26','查看代码列表','success','','','code'),(77,18,'2012-03-30 11:53:13','访问后台主页','success','','','code'),(78,9,'2012-03-30 11:53:36','访问后台主页','success','','演示账号','solidbase'),(79,18,'2012-03-30 11:54:08','访问后台主页','success','','','code'),(80,18,'2012-03-30 11:55:46','访问后台主页','success','','','code'),(81,18,'2012-03-30 12:03:40','访问后台主页','success','','','code'),(82,18,'2012-03-30 12:07:14','访问后台主页','success','','','code'),(83,18,'2012-03-30 12:07:46','访问后台主页','success','','','code'),(84,18,'2012-03-30 12:09:10','访问后台主页','success','','','code'),(85,18,'2012-03-30 12:11:42','访问后台主页','success','','','code'),(86,18,'2012-03-30 12:11:46','查看代码列表','success','','','code'),(87,18,'2012-03-30 12:11:47','访问添加代码页面','success','','','code'),(88,18,'2012-03-30 12:11:48','获取代码类型Json格式数据','success','','','code'),(89,18,'2012-03-30 12:11:52','添加代码信息','success','','','code'),(90,18,'2012-03-30 12:11:52','查看代码列表','success','','','code'),(91,18,'2012-03-30 12:11:57','查看代码列表','success','','','code'),(92,18,'2012-03-30 12:12:00','批量删除代码','success','','','code'),(93,18,'2012-03-30 12:12:00','查看代码列表','success','','','code'),(94,18,'2012-03-30 12:12:01','获取代码类型Json格式数据','success','','','code'),(95,18,'2012-03-30 12:12:03','查询代码','success','','','code'),(96,19,'2012-03-30 12:12:18','访问后台主页','success','','','article'),(97,18,'2012-03-30 12:13:28','访问后台主页','false','用户权限不足, 无法执行[访问后台主页]功能','','code'),(98,18,'2012-03-30 14:34:25','访问后台主页','success','','','code'),(99,19,'2012-03-30 14:34:36','访问后台主页','success','','','article'),(100,19,'2012-03-30 14:34:47','访问后台主页','success','','','article'),(101,19,'2012-03-30 14:42:24','访问后台主页','success','','','article'),(102,18,'2012-03-30 14:44:43','访问后台主页','success','','','code'),(103,18,'2012-03-30 14:44:45','查看代码列表','success','','','code'),(104,18,'2012-03-30 14:57:48','访问后台主页','success','','','code'),(105,18,'2012-03-30 14:57:51','查看代码列表','success','','','code'),(106,19,'2012-03-30 14:58:05','访问后台主页','success','','','article'),(107,20,'2012-03-30 14:58:22','访问后台主页','success','','','website'),(108,18,'2012-03-30 14:59:39','访问后台主页','success','','','code'),(109,18,'2012-03-30 14:59:43','查看导航菜单列表','success','','','code'),(110,19,'2012-03-30 17:03:44','访问后台主页','success','','','article'),(111,18,'2012-06-09 22:51:35','访问后台主页','success','','','code'),(112,18,'2012-06-09 22:51:37','查看导航菜单列表','success','','','code'),(113,18,'2012-06-09 22:51:40','查看代码列表','success','','','code'),(114,18,'2012-06-09 22:51:41','访问添加代码页面','success','','','code'),(115,18,'2012-06-09 22:51:44','查看导航菜单列表','success','','','code'),(116,18,'2012-06-09 22:51:45','访问添加导航菜单页面','success','','','code'),(117,18,'2012-06-09 22:51:47','添加导航菜单','success','','','code'),(118,18,'2012-06-09 22:51:48','查看导航菜单列表','success','','','code'),(119,18,'2012-06-09 22:51:51','批量删除导航菜单','success','','','code'),(120,18,'2012-06-09 22:51:51','查看导航菜单列表','success','','','code'),(121,18,'2012-06-09 22:54:54','访问后台主页','success','','','code'),(122,18,'2012-06-09 22:54:56','查看导航菜单列表','success','','','code'),(123,18,'2012-06-09 22:54:57','访问添加导航菜单页面','success','','','code'),(124,18,'2012-06-09 22:54:59','添加导航菜单','success','','','code'),(125,18,'2012-06-09 22:54:59','查看导航菜单列表','success','','','code'),(126,18,'2012-06-09 22:55:03','批量删除导航菜单','success','','','code'),(127,18,'2012-06-09 22:55:03','查看导航菜单列表','success','','','code'),(128,18,'2012-06-09 22:55:12','访问后台主页','success','','','code'),(129,18,'2012-06-09 22:55:22','查看导航菜单列表','success','','','code'),(130,18,'2012-06-09 22:55:27','查看导航菜单列表','success','','','code'),(131,18,'2012-06-09 22:55:32','查看导航菜单列表','success','','','code'),(132,18,'2012-06-09 22:55:38','查看代码列表','success','','','code'),(133,18,'2012-06-09 22:55:41','关于我们','success','','','code'),(134,18,'2012-06-09 22:57:28','访问后台主页','success','','','code'),(135,18,'2012-06-09 22:57:34','关于我们','success','','','code'),(136,18,'2012-06-09 22:57:53','查看导航菜单列表','success','','','code'),(137,18,'2012-06-09 22:57:54','访问添加导航菜单页面','success','','','code'),(138,18,'2012-06-09 22:57:58','添加导航菜单','success','','','code'),(139,18,'2012-06-09 22:57:58','查看导航菜单列表','success','','','code'),(140,18,'2012-06-09 22:58:01','批量删除导航菜单','success','','','code'),(141,18,'2012-06-09 22:58:01','查看导航菜单列表','success','','','code'),(142,18,'2012-06-09 22:58:03','查看代码列表','success','','','code'),(143,18,'2012-06-09 23:12:29','访问后台主页','success','','','code'),(144,18,'2012-06-09 23:13:31','访问后台主页','success','','','code'),(145,18,'2012-06-09 23:14:18','查看导航菜单列表','success','','','code'),(146,18,'2012-06-09 23:19:47','访问后台主页','success','','','code'),(147,18,'2012-06-09 23:20:36','查看导航菜单列表','success','','','code'),(148,18,'2012-06-09 23:25:26','访问后台主页','success','','','code'),(149,18,'2012-06-09 23:25:34','查看导航菜单列表','success','','','code'),(150,18,'2012-06-09 23:27:27','访问后台主页','success','','','code'),(151,18,'2012-06-09 23:27:30','查看导航菜单列表','false','用户权限不足, 无法执行[查看导航菜单列表]功能','','code'),(152,18,'2012-06-09 23:29:42','访问后台主页','success','','','code'),(153,18,'2012-06-09 23:30:18','查看导航菜单列表','false','用户权限不足, 无法执行[查看导航菜单列表]功能','','code'),(154,18,'2012-06-09 23:38:07','访问后台主页','success','用户权限不足, 无法执行[查看导航菜单列表]功能','','code'),(155,18,'2012-06-09 23:38:09','查看树形菜单列表','false','用户权限不足, 无法执行[查看树形菜单列表]功能','','code'),(156,18,'2012-06-09 23:39:50','查看导航菜单列表','false','用户权限不足, 无法执行[查看导航菜单列表]功能','','code'),(157,18,'2012-06-09 23:39:53','查看树形菜单列表','false','用户权限不足, 无法执行[查看树形菜单列表]功能','','code'),(158,18,'2012-06-09 23:43:00','访问后台主页','success','用户权限不足, 无法执行[查看树形菜单列表]功能','','code'),(159,18,'2012-06-09 23:43:02','查看我的资料','success','用户权限不足, 无法执行[查看树形菜单列表]功能','','code'),(160,18,'2012-06-09 23:43:07','查看我的资料','success','用户权限不足, 无法执行[查看树形菜单列表]功能','','code'),(161,18,'2012-06-09 23:43:16','查看我的资料','success','用户权限不足, 无法执行[查看树形菜单列表]功能','','code'),(162,18,'2012-06-09 23:43:53','查看导航菜单列表','success','用户权限不足, 无法执行[查看树形菜单列表]功能','','code'),(163,18,'2012-06-09 23:43:54','访问添加导航菜单页面','false','用户权限不足, 无法执行[访问添加导航菜单页面]功能','','code'),(164,18,'2012-06-09 23:46:25','访问后台主页','success','用户权限不足, 无法执行[访问添加导航菜单页面]功能','weiwei2','code'),(165,18,'2012-06-09 23:46:27','查看导航菜单列表','success','用户权限不足, 无法执行[访问添加导航菜单页面]功能','weiwei2','code'),(166,18,'2012-06-09 23:47:59','查看导航菜单列表','success','用户权限不足, 无法执行[访问添加导航菜单页面]功能','weiwei2','code'),(167,18,'2012-06-09 23:48:22','查看导航菜单列表','success','用户权限不足, 无法执行[访问添加导航菜单页面]功能','weiwei2','code'),(168,18,'2012-06-09 23:48:29','查看导航菜单列表','success','用户权限不足, 无法执行[访问添加导航菜单页面]功能','weiwei2','code'),(169,18,'2012-06-09 23:53:17','访问后台主页','success','','weiwei2','code'),(170,18,'2012-06-09 23:54:17','访问后台主页','success','','weiwei2','code'),(171,18,'2012-06-09 23:54:43','访问后台主页','success','','weiwei2','code'),(172,18,'2012-06-09 23:54:45','查看导航菜单列表','success','','weiwei2','code'),(173,18,'2012-06-09 23:54:55','批量删除导航菜单','false','用户权限不足, 无法执行[批量删除导航菜单]功能','weiwei2','code'),(174,18,'2012-06-09 23:55:00','查看导航菜单列表','success','','weiwei2','code'),(175,18,'2012-06-09 23:55:56','访问后台主页','success','','weiwei2','code'),(176,18,'2012-06-09 23:55:59','查看导航菜单列表','success','','weiwei2','code'),(177,18,'2012-06-09 23:56:47','批量删除导航菜单','false','用户权限不足, 无法执行[批量删除导航菜单]功能','weiwei2','code'),(178,18,'2012-06-10 00:07:13','访问后台主页','success','','weiwei2','code'),(179,18,'2012-06-10 00:07:16','查看导航菜单列表','success','','weiwei2','code'),(180,18,'2012-06-10 00:07:18','编辑某导航菜单','false','用户权限不足, 无法执行[编辑某导航菜单]功能','weiwei2','code'),(181,18,'2012-06-10 00:23:28','访问后台主页','success','','weiwei2','code'),(182,18,'2012-06-10 00:23:32','查看导航菜单列表','success','','weiwei2','code'),(183,18,'2012-06-10 00:23:46','访问添加导航菜单页面','false','用户权限不足, 无法执行[访问添加导航菜单页面]功能','weiwei2','code'),(184,18,'2012-06-10 00:23:50','查看树形菜单列表','false','用户权限不足, 无法执行[查看树形菜单列表]功能','weiwei2','code'),(185,18,'2012-06-10 00:27:17','访问后台主页','success','','weiwei2','code'),(186,18,'2012-06-10 00:27:18','查看导航菜单列表','success','','weiwei2','code'),(187,18,'2012-06-10 00:27:20','编辑某导航菜单','false','用户权限不足, 无法执行[编辑某导航菜单]功能','weiwei2','code'),(188,18,'2012-06-10 00:27:32','删除某导航菜单','false','用户权限不足, 无法执行[删除某导航菜单]功能','weiwei2','code'),(189,18,'2012-06-10 00:27:34','编辑某导航菜单','false','用户权限不足, 无法执行[编辑某导航菜单]功能','weiwei2','code'),(190,18,'2012-06-10 00:28:24','访问后台主页','success','','weiwei2','code'),(191,18,'2012-06-10 00:28:25','查看树形菜单列表','false','用户权限不足, 无法执行[查看树形菜单列表]功能','weiwei2','code'),(192,18,'2012-06-10 00:28:28','查看导航菜单列表','success','','weiwei2','code'),(193,18,'2012-06-10 00:28:30','编辑某导航菜单','false','用户权限不足, 无法执行[编辑某导航菜单]功能','weiwei2','code'),(194,18,'2012-06-10 00:28:34','查看代码列表','success','','weiwei2','code'),(195,18,'2012-06-10 00:28:36','访问添加代码页面','success','','weiwei2','code'),(196,18,'2012-06-10 00:28:41','编辑某项代码','success','','weiwei2','code'),(197,18,'2012-06-10 00:28:42','获取某类型父代码','success','','weiwei2','code'),(198,18,'2012-06-10 00:28:46','编辑某项代码','success','','weiwei2','code'),(199,18,'2012-06-10 00:28:47','获取某类型父代码','success','','weiwei2','code'),(200,18,'2012-06-10 00:28:48','获取某类型父代码','success','','weiwei2','code'),(201,18,'2012-06-10 00:28:48','获取某类型父代码','success','','weiwei2','code'),(202,18,'2012-06-10 00:28:49','获取某类型父代码','success','','weiwei2','code'),(203,18,'2012-06-10 00:28:49','获取某类型父代码','success','','weiwei2','code'),(204,18,'2012-06-10 00:28:49','获取某类型父代码','success','','weiwei2','code'),(205,18,'2012-06-10 00:28:49','获取某类型父代码','success','','weiwei2','code'),(206,18,'2012-06-10 00:28:49','获取某类型父代码','success','','weiwei2','code'),(207,18,'2012-06-10 00:28:50','获取某类型父代码','success','','weiwei2','code'),(208,18,'2012-06-10 00:29:01','获取某类型父代码','success','','weiwei2','code'),(209,18,'2012-06-10 00:29:02','获取某类型父代码','success','','weiwei2','code'),(210,18,'2012-06-10 00:29:03','获取某类型父代码','success','','weiwei2','code'),(211,18,'2012-06-10 00:29:04','获取某类型父代码','success','','weiwei2','code'),(212,18,'2012-06-10 00:29:06','访问添加代码页面','success','','weiwei2','code'),(213,18,'2012-06-10 00:29:07','获取代码类型Json格式数据','success','','weiwei2','code'),(214,18,'2012-06-10 00:29:09','获取某类型父代码','success','','weiwei2','code'),(215,18,'2012-06-10 00:29:17','编辑某项代码','success','','weiwei2','code'),(216,18,'2012-06-10 00:29:20','获取某类型父代码','success','','weiwei2','code'),(217,18,'2012-06-10 00:29:21','获取某类型父代码','success','','weiwei2','code'),(218,18,'2012-06-10 00:29:21','获取某类型父代码','success','','weiwei2','code'),(219,18,'2012-06-10 00:29:22','获取某类型父代码','success','','weiwei2','code'),(220,18,'2012-06-10 00:29:22','获取某类型父代码','success','','weiwei2','code'),(221,18,'2012-06-10 00:29:22','获取某类型父代码','success','','weiwei2','code'),(222,18,'2012-06-10 00:29:29','查看我的资料','success','','weiwei2','code'),(223,18,'2012-06-10 00:29:30','更新某用户','false','用户权限不足, 无法执行[更新某用户]功能','weiwei2','code'),(224,18,'2012-06-10 00:29:37','关于我们','false','用户权限不足, 无法执行[关于我们]功能','weiwei2','code'),(225,18,'2012-06-10 00:31:08','访问后台主页','success','','weiwei2','code'),(226,18,'2012-06-10 00:31:47','访问后台主页','success','','weiwei2','code'),(227,18,'2012-06-10 00:32:01','查看导航菜单列表','success','','weiwei2','code'),(228,18,'2012-06-10 00:32:06','关于我们','false','用户权限不足, 无法执行[关于我们]功能','weiwei2','code'),(229,18,'2012-06-10 00:32:36','访问后台主页','success','','weiwei2','code'),(230,18,'2012-06-10 00:32:40','关于我们','false','用户权限不足, 无法执行[关于我们]功能','weiwei2','code'),(231,18,'2012-06-10 00:32:44','查看我的资料','success','','weiwei2','code'),(232,18,'2012-06-10 00:32:46','查看树形菜单列表','false','用户权限不足, 无法执行[查看树形菜单列表]功能','weiwei2','code'),(233,18,'2012-06-10 00:32:48','查看导航菜单列表','success','','weiwei2','code'),(234,18,'2012-06-10 00:32:50','编辑某导航菜单','false','用户权限不足, 无法执行[编辑某导航菜单]功能','weiwei2','code'),(235,18,'2012-06-10 00:32:56','查询导航菜单','false','用户权限不足, 无法执行[查询导航菜单]功能','weiwei2','code'),(236,18,'2012-06-10 00:33:03','查看导航菜单列表','success','','weiwei2','code'),(237,18,'2012-06-10 00:33:05','查看树形菜单列表','false','用户权限不足, 无法执行[查看树形菜单列表]功能','weiwei2','code'),(238,18,'2012-06-10 00:42:14','访问后台主页','success','','weiwei2','code'),(239,18,'2012-06-10 00:42:24','退出后台','false','用户权限不足, 无法执行[退出后台]功能','weiwei2','code'),(240,18,'2012-06-10 00:42:32','访问登陆页','false','用户权限不足, 无法执行[访问登陆页]功能','weiwei2','code'),(241,17,'2012-06-10 01:28:51','访问后台主页','success','','匿名','weiwei'),(242,17,'2012-06-10 01:28:53','切换左边树形菜单','success','','匿名','weiwei'),(243,17,'2012-06-10 01:28:56','切换左边显示html页面','false','用户权限不足, 无法执行[切换左边显示html页面]功能','匿名','weiwei'),(244,17,'2012-06-10 01:28:58','切换左边显示JSP页面','false','用户权限不足, 无法执行[切换左边显示JSP页面]功能','匿名','weiwei'),(245,17,'2012-06-10 01:28:59','切换左边显示JSP页面','false','用户权限不足, 无法执行[切换左边显示JSP页面]功能','匿名','weiwei'),(246,17,'2012-06-10 01:29:00','切换左边显示html页面','false','用户权限不足, 无法执行[切换左边显示html页面]功能','匿名','weiwei'),(247,17,'2012-06-10 01:29:01','切换左边显示html页面','false','用户权限不足, 无法执行[切换左边显示html页面]功能','匿名','weiwei'),(248,17,'2012-06-10 01:29:02','切换左边树形菜单','success','','匿名','weiwei'),(249,17,'2012-06-10 01:29:06','访问后台主页','success','','匿名','weiwei'),(250,17,'2012-06-10 01:29:08','查看导航菜单列表','success','','匿名','weiwei'),(251,17,'2012-06-10 01:29:09','访问添加导航菜单页面','false','用户权限不足, 无法执行[访问添加导航菜单页面]功能','匿名','weiwei'),(252,17,'2012-06-10 01:29:13','编辑某导航菜单','false','用户权限不足, 无法执行[编辑某导航菜单]功能','匿名','weiwei'),(253,17,'2012-06-10 01:29:16','编辑某导航菜单','false','用户权限不足, 无法执行[编辑某导航菜单]功能','匿名','weiwei'),(254,17,'2012-06-10 01:29:20','删除某导航菜单','false','用户权限不足, 无法执行[删除某导航菜单]功能','匿名','weiwei'),(255,17,'2012-06-10 01:29:24','批量删除导航菜单','false','用户权限不足, 无法执行[批量删除导航菜单]功能','匿名','weiwei'),(256,17,'2012-06-10 01:29:27','查询导航菜单','success','','匿名','weiwei'),(257,17,'2012-06-10 01:29:30','查询导航菜单','success','','匿名','weiwei'),(258,17,'2012-06-10 01:29:33','查看树形菜单列表','success','','匿名','weiwei'),(259,17,'2012-06-10 01:29:38','编辑某树形菜单','false','用户权限不足, 无法执行[编辑某树形菜单]功能','匿名','weiwei'),(260,17,'2012-06-10 01:29:44','查看用户日志','false','用户权限不足, 无法执行[查看用户日志]功能','匿名','weiwei'),(261,17,'2012-06-10 01:30:05','查看资源列表','success','','匿名','weiwei'),(262,17,'2012-06-10 01:30:12','查看资源列表','success','','匿名','weiwei'),(263,17,'2012-06-10 01:30:19','查看用户列表','success','','匿名','weiwei'),(264,17,'2012-06-10 01:31:28','查看权限列表','success','','匿名','weiwei'),(265,17,'2012-06-10 01:31:34','查看权限列表','success','','匿名','weiwei'),(266,17,'2012-06-10 01:31:43','查看权限列表','success','','匿名','weiwei'),(267,17,'2012-06-10 01:31:54','查看权限列表','success','','匿名','weiwei'),(268,17,'2012-06-10 01:31:56','查看权限列表','success','','匿名','weiwei'),(269,17,'2012-06-10 01:32:06','编辑某权限','false','用户权限不足, 无法执行[编辑某权限]功能','匿名','weiwei'),(270,17,'2012-06-10 01:32:10','退出后台','success','','匿名','weiwei'),(271,9,'2012-06-10 01:32:21','访问后台主页','success','','演示账号','solidbase'),(272,9,'2012-06-10 01:32:26','查看权限列表','success','','演示账号','solidbase'),(273,9,'2012-06-10 01:32:36','查看权限列表','success','','演示账号','solidbase'),(274,9,'2012-06-10 01:32:41','编辑某权限','false','用户权限不足, 无法执行[编辑某权限]功能','演示账号','solidbase'),(275,9,'2012-06-10 01:32:49','查看我的资料','success','','演示账号','solidbase'),(276,9,'2012-06-10 01:32:51','更新某用户','success','','演示账号','solidbase'),(277,9,'2012-06-10 01:32:54','编辑某权限','false','用户权限不足, 无法执行[编辑某权限]功能','演示账号','solidbase'),(278,9,'2012-06-10 01:32:57','退出后台','success','','演示账号','solidbase'),(279,17,'2012-06-10 01:35:35','访问后台主页','success','','匿名','weiwei'),(280,17,'2012-06-10 01:35:39','访问添加用户页','false','用户权限不足, 无法执行[访问添加用户页]功能','匿名','weiwei'),(281,17,'2012-06-10 01:35:43','分配部门','false','用户权限不足, 无法执行[分配部门]功能','匿名','weiwei'),(282,17,'2012-06-10 11:09:34','访问后台主页','success','','匿名','weiwei'),(283,17,'2012-06-10 11:09:39','查看导航菜单列表','success','','匿名','weiwei'),(284,17,'2012-06-10 11:09:41','访问添加导航菜单页面','false','用户权限不足, 无法执行[访问添加导航菜单页面]功能','匿名','weiwei'),(285,17,'2012-06-10 11:09:47','查看用户日志','false','用户权限不足, 无法执行[查看用户日志]功能','匿名','weiwei'),(286,17,'2012-06-10 11:09:49','查看我的资料','success','','匿名','weiwei'),(287,17,'2012-06-10 11:10:06','更新某用户','success','','匿名','weiwei'),(288,17,'2012-06-10 11:10:09','查看我的资料','success','','匿名','weiwei'),(289,17,'2012-06-10 11:10:20','切换左边显示html页面','false','用户权限不足, 无法执行[切换左边显示html页面]功能','匿名','weiwei'),(290,17,'2012-06-10 11:10:22','切换左边显示html页面','false','用户权限不足, 无法执行[切换左边显示html页面]功能','匿名','weiwei'),(291,17,'2012-06-10 11:10:23','切换左边显示html页面','false','用户权限不足, 无法执行[切换左边显示html页面]功能','匿名','weiwei'),(292,17,'2012-06-10 11:10:23','切换左边显示html页面','false','用户权限不足, 无法执行[切换左边显示html页面]功能','匿名','weiwei'),(293,17,'2012-06-10 11:10:24','切换左边显示html页面','false','用户权限不足, 无法执行[切换左边显示html页面]功能','匿名','weiwei'),(294,17,'2012-06-10 11:10:25','切换左边显示html页面','false','用户权限不足, 无法执行[切换左边显示html页面]功能','匿名','weiwei'),(295,17,'2012-06-10 11:10:25','切换左边显示html页面','false','用户权限不足, 无法执行[切换左边显示html页面]功能','匿名','weiwei'),(296,17,'2012-06-10 11:10:30','访问后台主页','success','','匿名','weiwei'),(297,17,'2012-06-10 11:10:33','切换左边显示html页面','false','用户权限不足, 无法执行[切换左边显示html页面]功能','匿名','weiwei'),(298,17,'2012-06-10 11:10:35','访问后台主页','success','','匿名','weiwei'),(299,17,'2012-06-10 11:10:48','查看系统参数列表','success','','匿名','weiwei');
/*!40000 ALTER TABLE `t_user_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_department`
--

DROP TABLE IF EXISTS `t_user_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_department` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `DEPARTMENT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `DEPARTMENT_ID` (`DEPARTMENT_ID`),
  CONSTRAINT `t_user_department_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `t_user` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `t_user_department_ibfk_2` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `t_department` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_department`
--

LOCK TABLES `t_user_department` WRITE;
/*!40000 ALTER TABLE `t_user_department` DISABLE KEYS */;
INSERT INTO `t_user_department` VALUES (11,17,15),(12,17,16),(13,9,15),(14,9,16),(22,20,15),(23,20,16),(24,21,17),(25,20,17),(26,17,17),(27,9,17);
/*!40000 ALTER TABLE `t_user_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_ext`
--

DROP TABLE IF EXISTS `t_user_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_ext` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `BADGE_NUM` varchar(20) DEFAULT NULL,
  `LOGIN_TYPE` enum('normal','pki') NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `t_user_ext_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `t_user` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_ext`
--

LOCK TABLES `t_user_ext` WRITE;
/*!40000 ALTER TABLE `t_user_ext` DISABLE KEYS */;
INSERT INTO `t_user_ext` VALUES (2,3,'123123123','normal'),(7,9,'asfasf','normal');
/*!40000 ALTER TABLE `t_user_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_role`
--

DROP TABLE IF EXISTS `t_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `ROLE_ID` (`ROLE_ID`),
  CONSTRAINT `t_user_role_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `t_user` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `t_user_role_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `t_role` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_role`
--

LOCK TABLES `t_user_role` WRITE;
/*!40000 ALTER TABLE `t_user_role` DISABLE KEYS */;
INSERT INTO `t_user_role` VALUES (4,9,5),(5,18,6),(6,20,7),(11,21,8),(12,21,7),(16,20,5),(17,19,5),(20,17,5),(21,19,8),(22,21,6),(23,21,5);
/*!40000 ALTER TABLE `t_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-11-04 22:38:45
