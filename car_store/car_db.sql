-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: car_db
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `aphone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address_user_id_c030de7d_fk_user_id` (`user_id`),
  CONSTRAINT `address_user_id_c030de7d_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'王冬冬','13935647586','湖北武汉武昌达内',1),(2,'巧姐','13352647889','湖北武汉青山',1);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 车的品牌',7,'add_carbrand'),(20,'Can change 车的品牌',7,'change_carbrand'),(21,'Can delete 车的品牌',7,'delete_carbrand'),(22,'Can add 评论',8,'add_comment'),(23,'Can change 评论',8,'change_comment'),(24,'Can delete 评论',8,'delete_comment'),(25,'Can add 购物车',9,'add_cart'),(26,'Can change 购物车',9,'change_cart'),(27,'Can delete 购物车',9,'delete_cart'),(28,'Can add 图片',10,'add_image'),(29,'Can change 图片',10,'change_image'),(30,'Can delete 图片',10,'delete_image'),(31,'Can add 车的类型',11,'add_cartype'),(32,'Can change 车的类型',11,'change_cartype'),(33,'Can delete 车的类型',11,'delete_cartype'),(34,'Can add 车',12,'add_car'),(35,'Can change 车',12,'change_car'),(36,'Can delete 车',12,'delete_car'),(37,'Can add 车的颜色',13,'add_carcolor'),(38,'Can change 车的颜色',13,'change_carcolor'),(39,'Can delete 车的颜色',13,'delete_carcolor'),(40,'Can add 订单',14,'add_order'),(41,'Can change 订单',14,'change_order'),(42,'Can delete 订单',14,'delete_order'),(43,'Can add 用户信息',15,'add_user'),(44,'Can change 用户信息',15,'change_user'),(45,'Can delete 用户信息',15,'delete_user'),(46,'Can add 收件地址',16,'add_address'),(47,'Can change 收件地址',16,'change_address'),(48,'Can delete 收件地址',16,'delete_address');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$bGq6gCJCUCH9$VLVxsP/4icg2k/LY9sMYXA2ywr+WAMfYrRj7ZgimZxk=','2018-02-07 07:59:02.535893',1,'xuyaling','','','xuyaling_cug@163.com',1,1,'2018-01-31 09:36:45.445652');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `carprice` double DEFAULT NULL,
  `carbrand_id` int(11) DEFAULT NULL,
  `cartype_id` int(11) DEFAULT NULL,
  `carimage` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `car_carbrand_id_b01eb73b_fk_carbrand_id` (`carbrand_id`),
  KEY `car_cartype_id_e82d6e71_fk_cartype_id` (`cartype_id`),
  CONSTRAINT `car_carbrand_id_b01eb73b_fk_carbrand_id` FOREIGN KEY (`carbrand_id`) REFERENCES `carbrand` (`id`),
  CONSTRAINT `car_cartype_id_e82d6e71_fk_cartype_id` FOREIGN KEY (`cartype_id`) REFERENCES `cartype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'benz A 180',240000,1,1,'static/upload/car/title/car7_d725sSh.jpg'),(2,'BMW 528Li',449999,2,2,'static/upload/car/title/car7.jpg'),(3,'AUDI A6',560000,4,1,'static/upload/car/title/car3_tga7RQT.jpg'),(4,'benz G400',990000,1,2,'static/upload/car/title/car2.jpg'),(5,'benz V260',780000,2,2,'static/upload/car/title/car3_hLq0pN0.jpg'),(6,'benz E280',380000,1,3,'static/upload/car/title/car8_hi09JXt.jpg'),(7,'Ferrari GTC4',3580000,7,1,'static/upload/car/title/car6.jpg'),(8,'Ferrari 360',2880000,7,2,'static/upload/car/title/car4_b7WWkMe.jpg'),(9,'Ford 撼路者',280000,3,3,'static/upload/car/title/car5.jpg'),(10,'Ford 福特斯',150000,3,3,'static/upload/car/title/car8.jpg'),(11,'BMW X5',430000,2,1,'static/upload/car/title/car3.jpg'),(12,'BMW X1',400000,2,3,'static/upload/car/title/car1.jpg');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_carcolor`
--

DROP TABLE IF EXISTS `car_carcolor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_carcolor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL,
  `carcolor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `car_carcolor_car_id_carcolor_id_ca2f24c1_uniq` (`car_id`,`carcolor_id`),
  KEY `car_carcolor_carcolor_id_27361138_fk_carcolor_id` (`carcolor_id`),
  CONSTRAINT `car_carcolor_car_id_758784f2_fk_car_id` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`),
  CONSTRAINT `car_carcolor_carcolor_id_27361138_fk_carcolor_id` FOREIGN KEY (`carcolor_id`) REFERENCES `carcolor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_carcolor`
--

LOCK TABLES `car_carcolor` WRITE;
/*!40000 ALTER TABLE `car_carcolor` DISABLE KEYS */;
INSERT INTO `car_carcolor` VALUES (1,1,2),(2,2,2),(3,3,2),(4,4,1),(5,5,2),(6,6,2),(7,7,1),(8,8,1),(9,9,2),(10,10,2),(11,11,3),(12,12,2);
/*!40000 ALTER TABLE `car_carcolor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carbrand`
--

DROP TABLE IF EXISTS `carbrand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carbrand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carbrand` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carbrand`
--

LOCK TABLES `carbrand` WRITE;
/*!40000 ALTER TABLE `carbrand` DISABLE KEYS */;
INSERT INTO `carbrand` VALUES (1,'benz'),(2,'BMW'),(3,'Ford'),(4,'AUDI'),(5,'VOLKSWAGEN'),(6,'TOYOTA'),(7,'FERRARI');
/*!40000 ALTER TABLE `carbrand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carcolor`
--

DROP TABLE IF EXISTS `carcolor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carcolor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carcolor` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carcolor`
--

LOCK TABLES `carcolor` WRITE;
/*!40000 ALTER TABLE `carcolor` DISABLE KEYS */;
INSERT INTO `carcolor` VALUES (1,'red'),(2,'white'),(3,'blue');
/*!40000 ALTER TABLE `carcolor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `carname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `carprice` double DEFAULT NULL,
  `carcount` int(11) NOT NULL,
  `uname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdat` datetime(6),
  `carimage` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_user_id_1361a739` (`user_id`),
  CONSTRAINT `cart_user_id_1361a739_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartype`
--

DROP TABLE IF EXISTS `cartype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cartype` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartype`
--

LOCK TABLES `cartype` WRITE;
/*!40000 ALTER TABLE `cartype` DISABLE KEYS */;
INSERT INTO `cartype` VALUES (1,'small size'),(2,'middle size'),(3,'big size');
/*!40000 ALTER TABLE `cartype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `car_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `carname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdat` datetime(6),
  `uname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_car_id_e958c62f_fk_car_id` (`car_id`),
  KEY `comment_user_id_2224f9d1_fk_user_id` (`user_id`),
  CONSTRAINT `comment_car_id_e958c62f_fk_car_id` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`),
  CONSTRAINT `comment_user_id_2224f9d1_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'性价比非常高',1,1,'benz A 180','2018-02-07 11:57:37.182092','徐雅玲'),(2,'ｊｈｓｖｈｓｊｄｆｖｂｄｆｊｂｈ',6,2,'benz E280','2018-02-07 11:57:50.416436','lizhi'),(3,'哈哈哈哈哈',6,2,'benz E280','2018-02-07 11:57:46.746973','lizhi'),(4,'车车很好，开着很舒服',7,1,'Ferrari GTC4','2018-02-07 11:57:01.687787','徐雅玲'),(5,'可以可以，非常不错',8,3,'Ferrari 360','2018-02-07 11:58:36.869760','lizhizhi'),(6,'很顺手，乌拉乌拉乌拉的',7,4,'Ferrari GTC4','2018-02-08 06:09:55.851013','caoying'),(7,'rdgfhgf',11,4,'BMW X5','2018-02-08 07:52:20.854806','caoying'),(8,'很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好很好',11,4,'BMW X5','2018-02-08 09:09:28.686113','caoying'),(9,'房间内哈飞嗯哈密瓜',11,4,'BMW X5','2018-02-08 09:16:27.449102','caoying'),(10,'快捷快捷及科技了看见卡及科技号',11,4,'BMW X5','2018-02-08 10:19:24.637519','caoying');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-01-31 10:00:15.152993','1','徐雅玲',1,'[{\"added\": {}}]',15,1),(2,'2018-01-31 10:01:57.875369','1','王冬冬',1,'[{\"added\": {}}]',16,1),(3,'2018-01-31 10:02:48.055080','1','奔驰',1,'[{\"added\": {}}]',7,1),(4,'2018-01-31 10:03:02.139273','1','小型',1,'[{\"added\": {}}]',11,1),(5,'2018-01-31 10:03:18.718265','1','红色',1,'[{\"added\": {}}]',13,1),(6,'2018-01-31 10:03:53.053260','2','white',1,'[{\"added\": {}}]',13,1),(7,'2018-01-31 10:04:03.528063','1','red',2,'[{\"changed\": {\"fields\": [\"carcolor\"]}}]',13,1),(8,'2018-01-31 10:04:36.518770','1','benz',2,'[{\"changed\": {\"fields\": [\"carbrand\"]}}]',7,1),(9,'2018-01-31 10:04:46.514043','2','BMW',1,'[{\"added\": {}}]',7,1),(10,'2018-01-31 10:04:59.575194','3','Fort',1,'[{\"added\": {}}]',7,1),(11,'2018-01-31 10:05:23.016878','1','small',2,'[{\"changed\": {\"fields\": [\"cartype\"]}}]',11,1),(12,'2018-01-31 10:05:27.544389','2','middle',1,'[{\"added\": {}}]',11,1),(13,'2018-01-31 10:05:34.472775','1','small type',2,'[{\"changed\": {\"fields\": [\"cartype\"]}}]',11,1),(14,'2018-01-31 10:05:44.936492','2','middle type',2,'[{\"changed\": {\"fields\": [\"cartype\"]}}]',11,1),(15,'2018-01-31 10:06:01.310745','1','small size',2,'[{\"changed\": {\"fields\": [\"cartype\"]}}]',11,1),(16,'2018-01-31 10:06:09.097709','2','middle size',2,'[{\"changed\": {\"fields\": [\"cartype\"]}}]',11,1),(17,'2018-01-31 10:06:17.532971','3','big size',1,'[{\"added\": {}}]',11,1),(18,'2018-01-31 10:09:43.698269','1','benz A 180',1,'[{\"added\": {}}]',12,1),(19,'2018-01-31 10:10:35.087056','1','性价比非常高',1,'[{\"added\": {}}]',8,1),(20,'2018-01-31 10:11:22.399838','1','Order object',1,'[{\"added\": {}}]',14,1),(21,'2018-01-31 10:13:42.026705','2','BMW 530Li',1,'[{\"added\": {}}]',12,1),(22,'2018-01-31 10:13:59.822569','1','Cart object',1,'[{\"added\": {}}]',9,1),(23,'2018-01-31 11:16:24.746855','2','BMW 528Li',2,'[{\"changed\": {\"fields\": [\"carname\"]}}]',12,1),(24,'2018-01-31 11:16:49.263059','1','Cart object',2,'[]',9,1),(25,'2018-01-31 11:26:23.851564','1','Image object',1,'[{\"added\": {}}]',10,1),(26,'2018-01-31 11:26:40.197083','2','Image object',1,'[{\"added\": {}}]',10,1),(27,'2018-02-05 04:21:23.106327','2','Image object',3,'',10,1),(28,'2018-02-05 04:21:28.566169','1','Image object',3,'',10,1),(29,'2018-02-05 04:29:16.488077','3','BMW 528Li',1,'[{\"added\": {}}]',10,1),(30,'2018-02-05 04:29:39.596963','4','benz A 180',1,'[{\"added\": {}}]',10,1),(31,'2018-02-05 04:32:31.333156','4','AUDI',1,'[{\"added\": {}}]',7,1),(32,'2018-02-05 04:32:43.850219','5','VOLKSWAGEN',1,'[{\"added\": {}}]',7,1),(33,'2018-02-05 04:33:00.533566','6','TOYOTA',1,'[{\"added\": {}}]',7,1),(34,'2018-02-05 04:33:17.948313','3','Ford',2,'[{\"changed\": {\"fields\": [\"carbrand\"]}}]',7,1),(35,'2018-02-05 04:33:33.310412','7','FERRARI',1,'[{\"added\": {}}]',7,1),(36,'2018-02-05 04:34:03.553701','3','AUDI A6',1,'[{\"added\": {}}]',12,1),(37,'2018-02-05 04:35:28.690792','4','benz G400',1,'[{\"added\": {}}]',12,1),(38,'2018-02-05 04:36:12.258459','5','benz V260',1,'[{\"added\": {}}]',12,1),(39,'2018-02-05 04:36:42.785281','6','benz E280',1,'[{\"added\": {}}]',12,1),(40,'2018-02-05 04:37:46.654234','7','Ferrari GTC4',1,'[{\"added\": {}}]',12,1),(41,'2018-02-05 04:38:42.589445','8','Ferrari 360',1,'[{\"added\": {}}]',12,1),(42,'2018-02-05 04:40:14.328658','9','Ford 揽福',1,'[{\"added\": {}}]',12,1),(43,'2018-02-05 04:41:02.516943','9','Ford 撼路者',2,'[{\"changed\": {\"fields\": [\"carname\", \"carprice\"]}}]',12,1),(44,'2018-02-05 04:41:48.006272','10','Ford 福特斯',1,'[{\"added\": {}}]',12,1),(45,'2018-02-05 04:43:22.437479','3','blue',1,'[{\"added\": {}}]',13,1),(46,'2018-02-05 04:43:26.006231','11','BMW X5',1,'[{\"added\": {}}]',12,1),(47,'2018-02-05 04:43:57.826157','12','BMW X1',1,'[{\"added\": {}}]',12,1),(48,'2018-02-05 04:44:54.738948','5','benz G400',1,'[{\"added\": {}}]',10,1),(49,'2018-02-05 04:45:26.527179','6','Ferrari GTC4',1,'[{\"added\": {}}]',10,1),(50,'2018-02-05 04:45:54.467249','7','benz E280',1,'[{\"added\": {}}]',10,1),(51,'2018-02-05 04:46:19.775238','8','Ford 福特斯',1,'[{\"added\": {}}]',10,1),(52,'2018-02-05 04:46:37.309446','9','BMW X1',1,'[{\"added\": {}}]',10,1),(53,'2018-02-05 04:47:01.918510','10','AUDI A6',1,'[{\"added\": {}}]',10,1),(54,'2018-02-05 04:47:23.268640','11','Ford 撼路者',1,'[{\"added\": {}}]',10,1),(55,'2018-02-05 04:47:45.709764','12','BMW X5',1,'[{\"added\": {}}]',10,1),(56,'2018-02-05 04:48:46.162556','13','benz V260',1,'[{\"added\": {}}]',10,1),(57,'2018-02-05 04:49:30.727934','14','Ferrari 360',1,'[{\"added\": {}}]',10,1),(58,'2018-02-05 05:22:35.804295','12','BMW X1',2,'[{\"changed\": {\"fields\": [\"carimage\"]}}]',12,1),(59,'2018-02-05 05:22:44.084399','11','BMW X5',2,'[{\"changed\": {\"fields\": [\"carimage\"]}}]',12,1),(60,'2018-02-05 05:22:50.904740','10','Ford 福特斯',2,'[{\"changed\": {\"fields\": [\"carimage\"]}}]',12,1),(61,'2018-02-05 05:22:57.256344','7','Ferrari GTC4',2,'[{\"changed\": {\"fields\": [\"carimage\"]}}]',12,1),(62,'2018-02-05 05:23:04.142491','6','benz E280',2,'[{\"changed\": {\"fields\": [\"carimage\"]}}]',12,1),(63,'2018-02-05 05:23:10.417067','8','Ferrari 360',2,'[{\"changed\": {\"fields\": [\"carimage\"]}}]',12,1),(64,'2018-02-05 05:23:17.775652','2','BMW 528Li',2,'[{\"changed\": {\"fields\": [\"carimage\"]}}]',12,1),(65,'2018-02-05 05:23:34.769013','3','AUDI A6',2,'[{\"changed\": {\"fields\": [\"carimage\"]}}]',12,1),(66,'2018-02-05 05:23:40.289000','12','BMW X1',2,'[]',12,1),(67,'2018-02-05 05:23:46.677660','9','Ford 撼路者',2,'[{\"changed\": {\"fields\": [\"carimage\"]}}]',12,1),(68,'2018-02-05 05:23:52.982320','10','Ford 福特斯',2,'[]',12,1),(69,'2018-02-05 05:23:56.389181','9','Ford 撼路者',2,'[]',12,1),(70,'2018-02-05 05:24:01.270119','7','Ferrari GTC4',2,'[]',12,1),(71,'2018-02-05 05:24:06.720297','8','Ferrari 360',2,'[]',12,1),(72,'2018-02-05 05:24:10.189282','6','benz E280',2,'[]',12,1),(73,'2018-02-05 05:24:16.171829','4','benz G400',2,'[{\"changed\": {\"fields\": [\"carimage\"]}}]',12,1),(74,'2018-02-05 05:24:20.355759','3','AUDI A6',2,'[]',12,1),(75,'2018-02-05 05:24:25.920451','2','BMW 528Li',2,'[]',12,1),(76,'2018-02-05 05:24:32.933401','1','benz A 180',2,'[{\"changed\": {\"fields\": [\"carimage\"]}}]',12,1),(77,'2018-02-05 05:24:37.957523','1','benz A 180',2,'[]',12,1),(78,'2018-02-05 05:32:41.021615','5','benz V260',2,'[{\"changed\": {\"fields\": [\"carimage\"]}}]',12,1),(79,'2018-02-05 12:20:54.495961','1','Cart object',2,'[{\"changed\": {\"fields\": [\"uname\", \"carname\", \"carprice\", \"car\"]}}]',9,1),(80,'2018-02-05 12:23:04.272718','1','Cart object',2,'[{\"changed\": {\"fields\": [\"createdat\"]}}]',9,1),(81,'2018-02-07 08:16:34.885862','1','Order object',2,'[{\"changed\": {\"fields\": [\"car_id\"]}}]',14,1),(82,'2018-02-07 08:17:33.253144','2','Order object',1,'[{\"added\": {}}]',14,1),(83,'2018-02-07 08:17:41.442504','3','Order object',1,'[{\"added\": {}}]',14,1),(84,'2018-02-07 08:17:50.902151','4','Order object',1,'[{\"added\": {}}]',14,1),(85,'2018-02-07 08:21:40.357496','2','巧姐',1,'[{\"added\": {}}]',16,1),(86,'2018-02-07 08:26:34.047239','4','Order object',2,'[{\"changed\": {\"fields\": [\"uname\", \"uaddress\"]}}]',14,1),(87,'2018-02-07 08:26:58.532232','3','Order object',2,'[{\"changed\": {\"fields\": [\"uname\", \"uaddress\"]}}]',14,1),(88,'2018-02-07 08:27:29.753368','2','Order object',2,'[{\"changed\": {\"fields\": [\"uname\", \"uaddress\", \"address\"]}}]',14,1),(89,'2018-02-07 08:27:43.200553','1','Order object',2,'[{\"changed\": {\"fields\": [\"uname\", \"uaddress\"]}}]',14,1),(90,'2018-02-07 08:27:56.952679','4','Order object',2,'[{\"changed\": {\"fields\": [\"uname\"]}}]',14,1),(91,'2018-02-07 08:38:09.300912','4','lizhi',2,'[{\"changed\": {\"fields\": [\"carprice\"]}}]',14,1),(92,'2018-02-07 08:38:34.969942','3','lizhizhi',2,'[{\"changed\": {\"fields\": [\"carprice\"]}}]',14,1),(93,'2018-02-07 08:38:48.231647','2','lizhizhi',2,'[{\"changed\": {\"fields\": [\"carprice\"]}}]',14,1),(94,'2018-02-07 08:39:38.159880','1','徐雅玲',2,'[{\"changed\": {\"fields\": [\"carprice\"]}}]',14,1),(95,'2018-02-07 08:52:54.500396','4','Order object',2,'[{\"changed\": {\"fields\": [\"carname\", \"carimage\"]}}]',14,1),(96,'2018-02-07 08:53:00.721233','4','Order object',2,'[]',14,1),(97,'2018-02-07 08:53:23.950879','3','Order object',2,'[{\"changed\": {\"fields\": [\"carname\", \"carimage\"]}}]',14,1),(98,'2018-02-07 08:54:02.537385','2','Order object',2,'[{\"changed\": {\"fields\": [\"carname\", \"carimage\"]}}]',14,1),(99,'2018-02-07 08:54:25.677033','1','Order object',2,'[{\"changed\": {\"fields\": [\"carname\", \"carimage\"]}}]',14,1),(100,'2018-02-07 11:31:36.310876','5','Order object',1,'[{\"added\": {}}]',14,1),(101,'2018-02-07 11:32:45.902592','6','Order object',1,'[{\"added\": {}}]',14,1),(102,'2018-02-07 11:33:55.162633','7','Order object',1,'[{\"added\": {}}]',14,1),(103,'2018-02-07 11:35:20.990444','8','Order object',1,'[{\"added\": {}}]',14,1),(104,'2018-02-07 11:57:01.714292','4','车车很好，开着很舒服',2,'[{\"changed\": {\"fields\": [\"uname\"]}}]',8,1),(105,'2018-02-07 11:57:10.818248','3','哈哈哈哈哈',2,'[{\"changed\": {\"fields\": [\"uname\"]}}]',8,1),(106,'2018-02-07 11:57:18.210449','2','ｊｈｓｖｈｓｊｄｆｖｂｄｆｊｂｈ',2,'[{\"changed\": {\"fields\": [\"uname\"]}}]',8,1),(107,'2018-02-07 11:57:37.186215','1','性价比非常高',2,'[{\"changed\": {\"fields\": [\"uname\", \"carname\"]}}]',8,1),(108,'2018-02-07 11:57:42.484351','2','ｊｈｓｖｈｓｊｄｆｖｂｄｆｊｂｈ',2,'[]',8,1),(109,'2018-02-07 11:57:46.747970','3','哈哈哈哈哈',2,'[]',8,1),(110,'2018-02-07 11:57:50.417494','2','ｊｈｓｖｈｓｊｄｆｖｂｄｆｊｂｈ',2,'[]',8,1),(111,'2018-02-07 11:58:36.901771','5','可以可以，非常不错',1,'[{\"added\": {}}]',8,1),(112,'2018-02-08 02:03:20.612314','19','benz G400',2,'[{\"changed\": {\"fields\": [\"carimage\", \"car\"]}}]',9,1),(113,'2018-02-08 02:03:34.121970','18','benz E280',2,'[{\"changed\": {\"fields\": [\"carimage\", \"car\"]}}]',9,1),(114,'2018-02-08 02:03:46.802274','17','Ford 撼路者',2,'[{\"changed\": {\"fields\": [\"carimage\", \"car\"]}}]',9,1),(115,'2018-02-08 02:03:58.098533','1','benz A 180',2,'[{\"changed\": {\"fields\": [\"carimage\"]}}]',9,1),(116,'2018-02-08 02:49:26.271345','8','Ferrari 360',2,'[{\"changed\": {\"fields\": [\"carimage\"]}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(4,'auth','permission'),(3,'auth','user'),(16,'car','address'),(12,'car','car'),(7,'car','carbrand'),(13,'car','carcolor'),(9,'car','cart'),(11,'car','cartype'),(8,'car','comment'),(10,'car','image'),(14,'car','order'),(15,'car','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-01-31 09:33:57.209116'),(2,'auth','0001_initial','2018-01-31 09:33:58.719194'),(3,'admin','0001_initial','2018-01-31 09:33:59.008388'),(4,'admin','0002_logentry_remove_auto_add','2018-01-31 09:33:59.047463'),(5,'contenttypes','0002_remove_content_type_name','2018-01-31 09:33:59.246015'),(6,'auth','0002_alter_permission_name_max_length','2018-01-31 09:33:59.302701'),(7,'auth','0003_alter_user_email_max_length','2018-01-31 09:33:59.359020'),(8,'auth','0004_alter_user_username_opts','2018-01-31 09:33:59.370997'),(9,'auth','0005_alter_user_last_login_null','2018-01-31 09:33:59.423169'),(10,'auth','0006_require_contenttypes_0002','2018-01-31 09:33:59.426967'),(11,'auth','0007_alter_validators_add_error_messages','2018-01-31 09:33:59.441804'),(12,'auth','0008_alter_user_username_max_length','2018-01-31 09:33:59.584287'),(13,'car','0001_initial','2018-01-31 09:34:00.912896'),(14,'sessions','0001_initial','2018-01-31 09:34:01.010674'),(15,'car','0002_auto_20180205_1225','2018-02-05 04:25:39.959366'),(16,'car','0003_car_carimage','2018-02-05 05:22:13.589547'),(17,'car','0004_auto_20180205_1936','2018-02-05 11:36:55.883459'),(18,'car','0005_auto_20180205_2016','2018-02-05 12:16:34.001342'),(19,'car','0006_cart_createdat','2018-02-05 12:22:49.950997'),(20,'car','0007_auto_20180206_1035','2018-02-06 02:35:32.570858'),(21,'car','0008_auto_20180207_1137','2018-02-07 03:37:37.034090'),(22,'car','0009_auto_20180207_1557','2018-02-07 07:57:41.987862'),(23,'car','0010_auto_20180207_1613','2018-02-07 08:14:14.627267'),(24,'car','0011_remove_order_uname','2018-02-07 08:16:11.102088'),(25,'car','0012_auto_20180207_1617','2018-02-07 08:17:25.718951'),(26,'car','0013_order_uname','2018-02-07 08:24:32.804433'),(27,'car','0014_order_uaddress','2018-02-07 08:25:54.759628'),(28,'car','0015_order_carprice','2018-02-07 08:37:27.864609'),(29,'car','0016_order_createdat','2018-02-07 08:41:00.813194'),(30,'car','0017_auto_20180207_1650','2018-02-07 08:50:28.893910'),(31,'car','0018_auto_20180207_1852','2018-02-07 10:52:34.221805'),(32,'car','0019_comment_uname','2018-02-07 11:56:18.226394'),(33,'car','0020_cart_carimage','2018-02-08 02:01:52.331240'),(34,'car','0021_remove_cart_car','2018-02-08 03:57:35.315710');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('gjbiduqcnuu1iov0rej5y3882omrtpry','ZjdhZWFhYzQ4ZjgxN2M0ZWQyMWE3MTNmYzVkMTRhZDUzZTBmYjJlZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidWlkIjoxLCJfYXV0aF91c2VyX2hhc2giOiIzNWQyYjU0M2RhNDZhYzQ1MDQ5MWU4ZTRjZDliMWJiNDliY2QxY2VjIiwicGhvbmUiOiIxNTA3MTA0MTA2MSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-02-19 11:26:46.636937'),('mx4uy89b5tc72gs504m9qo86t052ypnk','ZDAxMGM1MDYyNzZkMjA5NmM5Yzc3NzJjZDgxYTZjOTI3MzI1NjlkNjp7InNlYXJjaGNhcnMiOls3LDgsOSwxMCwzXSwiY2FyY291bnQiOjEsInBob25lIjoiMTUzODg4ODg4ODgiLCJfYXV0aF91c2VyX2lkIjoiMSIsInVpZCI6NCwiX2F1dGhfdXNlcl9oYXNoIjoiMzVkMmI1NDNkYTQ2YWM0NTA0OTFlOGU0Y2Q5YjFiYjQ5YmNkMWNlYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiY2FyX2lkIjoxMX0=','2018-02-22 09:44:23.912800'),('ny19pdnyzxvcreok4gpof3ghjg4wbrp6','NWYzNjBmMWNiNDUyNjM2ZmFjMTdmN2JjMGJmYmI4NTJlYmMyZmNhNTp7InBob25lIjoiMTUwNzEwNDEwNjEiLCJ1aWQiOjF9','2018-02-19 08:44:35.558270'),('zjwdy5ynl1wyhvup7g8khohnz57m1p2s','NzE5OTQ0NWIyMzg1N2Q3ZjhmNjkxM2FlOWNmOGJkMjgwOWQxODU1Yzp7InBob25lIjoiMTUwNzEwNDEwNjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsInVpZCI6MSwiX2F1dGhfdXNlcl9oYXNoIjoiMzVkMmI1NDNkYTQ2YWM0NTA0OTFlOGU0Y2Q5YjFiYjQ5YmNkMWNlYyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-02-19 08:01:43.892754');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `car_id` int(11) NOT NULL,
  `carname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `image_car_id_58fd1a65_fk_car_id` (`car_id`),
  CONSTRAINT `image_car_id_58fd1a65_fk_car_id` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (3,'static/upload/car/car1.jpg',2,'BMW 528Li'),(4,'static/upload/car/car2.jpg',1,'benz A 180'),(5,'static/upload/car/car3.jpg',4,'benz G400'),(6,'static/upload/car/car4.jpg',7,'Ferrari GTC4'),(7,'static/upload/car/car5.jpg',6,'benz E280'),(8,'static/upload/car/car6.jpg',10,'Ford 福特斯'),(9,'static/upload/car/car7.jpg',12,'BMW X1'),(10,'static/upload/car/car2_SqBHz9u.jpg',3,'AUDI A6'),(11,'static/upload/car/car3_N4oHC0U.jpg',9,'Ford 撼路者'),(12,'static/upload/car/car7_n6hHSGE.jpg',11,'BMW X5'),(13,'static/upload/car/car3_oQALmR2.jpg',5,'benz V260'),(14,'static/upload/car/car4_g2P09NV.jpg',8,'Ferrari 360');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `uaddress` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `carprice` double DEFAULT NULL,
  `createdat` datetime(6),
  `carcount` int(11) NOT NULL,
  `carimage` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `carname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_user_id_e323497c` (`user_id`),
  KEY `order_address_id_0d5da290` (`address_id`),
  CONSTRAINT `order_address_id_0d5da290_fk_address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `order_user_id_e323497c_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (4,1,2,6,'武汉武昌达内',380000,'2018-02-07 08:53:00.717946',1,'static/upload/car/order/car8.jpg','benz E280'),(6,1,3,10,'武汉武昌达内',150000,'2018-02-07 11:32:45.889852',1,'static/upload/car/order/car8_M1kHZWI.jpg','Ford 福特斯'),(8,1,2,8,'武汉武昌达内',2880000,'2018-02-07 11:35:20.980907',1,'static/upload/car/order/car4.jpg','Ferrari 360'),(12,1,1,1,NULL,240000,'2018-02-08 03:50:15.350781',1,'static/upload/car/title/car7_d725sSh.jpg','benz A 180'),(14,1,1,10,NULL,150000,'2018-02-08 04:14:51.313974',2,'static/upload/car/title/car8.jpg','Ford 福特斯'),(15,1,3,9,NULL,280000,'2018-02-08 04:17:01.231801',3,'static/upload/car/cart/car5.jpg','Ford 撼路者'),(16,1,3,6,NULL,380000,'2018-02-08 04:17:01.257027',1,'static/upload/car/cart/car8.jpg','benz E280'),(17,1,3,4,NULL,990000,'2018-02-08 04:17:24.158548',1,'static/upload/car/title/car2.jpg','benz G400'),(18,1,3,7,NULL,3580000,'2018-02-08 04:19:38.622421',1,'static/upload/car/title/car6.jpg','Ferrari GTC4'),(19,1,1,1,NULL,240000,'2018-02-08 06:01:48.566000',1,'static/upload/car/title/car7_d725sSh.jpg','benz A 180'),(20,1,1,11,NULL,430000,'2018-02-08 06:01:48.590604',1,'static/upload/car/title/car3.jpg','BMW X5'),(21,1,1,1,NULL,240000,'2018-02-08 06:02:08.681588',1,'static/upload/car/title/car7_d725sSh.jpg','benz A 180'),(28,1,4,11,NULL,430000,'2018-02-08 09:40:57.277155',1,'static/upload/car/title/car3.jpg','BMW X5');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uphone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `upassword` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'15071041061','徐雅玲','xuyaling123456',1),(2,'18851661055','lizhi','lizhi123456',1),(3,'17635467876','lizhizhi','lizhizhi123456',1),(4,'15388888888','caoying','1201510858',1);
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

-- Dump completed on 2018-02-08 18:23:22
