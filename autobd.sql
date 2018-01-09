-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: autobd
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `auto`
--

DROP TABLE IF EXISTS `auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto` (
  `id_auto` int(11) NOT NULL AUTO_INCREMENT,
  `id_model` int(11) DEFAULT NULL,
  `id_body` int(11) DEFAULT NULL,
  `id_color` int(11) DEFAULT NULL,
  `id_kpp` int(11) DEFAULT NULL,
  `id_engine` int(11) DEFAULT NULL,
  `id_drive` int(11) DEFAULT NULL,
  `id_compl` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_auto`),
  KEY `model_idx` (`id_model`),
  KEY `body_idx` (`id_body`),
  KEY `color_idx` (`id_color`),
  KEY `kpp_idx` (`id_kpp`),
  KEY `engine_idx` (`id_engine`),
  KEY `drive_idx` (`id_drive`),
  KEY `compl_idx` (`id_compl`),
  CONSTRAINT `body` FOREIGN KEY (`id_body`) REFERENCES `body` (`id_body`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ccc` FOREIGN KEY (`id_compl`) REFERENCES `completation` (`id_compl`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `color` FOREIGN KEY (`id_color`) REFERENCES `color` (`id_color`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `drive` FOREIGN KEY (`id_drive`) REFERENCES `drive` (`id_drive`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `enjine` FOREIGN KEY (`id_engine`) REFERENCES `engine` (`id_engine`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `kpp` FOREIGN KEY (`id_kpp`) REFERENCES `transmission` (`id_kpp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `model` FOREIGN KEY (`id_model`) REFERENCES `model` (`id_model`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto`
--

LOCK TABLES `auto` WRITE;
/*!40000 ALTER TABLE `auto` DISABLE KEYS */;
INSERT INTO `auto` VALUES (1,1,5,3,1,1,1,2),(2,2,1,1,1,2,1,2),(3,3,2,2,3,3,1,3),(4,4,4,4,1,3,1,3),(5,5,1,6,1,1,1,1),(6,6,4,1,2,5,3,3);
/*!40000 ALTER TABLE `auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `body`
--

DROP TABLE IF EXISTS `body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `body` (
  `id_body` int(11) NOT NULL AUTO_INCREMENT,
  `type_body` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_body`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body`
--

LOCK TABLES `body` WRITE;
/*!40000 ALTER TABLE `body` DISABLE KEYS */;
INSERT INTO `body` VALUES (1,'седан'),(2,'универсал'),(3,'купе'),(4,'хэтчбек'),(5,'лифтбек');
/*!40000 ALTER TABLE `body` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brend`
--

DROP TABLE IF EXISTS `brend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brend` (
  `id_brend` int(11) NOT NULL AUTO_INCREMENT,
  `name_brend` varchar(45) DEFAULT NULL,
  `country_brend` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_brend`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brend`
--

LOCK TABLES `brend` WRITE;
/*!40000 ALTER TABLE `brend` DISABLE KEYS */;
INSERT INTO `brend` VALUES (1,'ВАЗ','Россия'),(2,'Рено','Франция');
/*!40000 ALTER TABLE `brend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id_cart` int(11) NOT NULL AUTO_INCREMENT,
  `id_auto` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cart`),
  KEY `UserCart_idx` (`id_user`),
  CONSTRAINT `UserCart` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `id_color` int(11) NOT NULL AUTO_INCREMENT,
  `name_color` varchar(45) DEFAULT NULL,
  `id_tcolor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_color`),
  KEY `ColorTColor_idx` (`id_tcolor`),
  CONSTRAINT `ColorTColor` FOREIGN KEY (`id_tcolor`) REFERENCES `typecolor` (`id_tcolor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'черный',1),(2,'белый',2),(3,'серебристый',1),(4,'синий',1),(5,'красный',1),(6,'серый',1);
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completation`
--

DROP TABLE IF EXISTS `completation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `completation` (
  `id_compl` int(11) NOT NULL AUTO_INCREMENT,
  `name_compl` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_compl`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completation`
--

LOCK TABLES `completation` WRITE;
/*!40000 ALTER TABLE `completation` DISABLE KEYS */;
INSERT INTO `completation` VALUES (1,'Базовая'),(2,'Средняя'),(3,'Максимальная');
/*!40000 ALTER TABLE `completation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drive`
--

DROP TABLE IF EXISTS `drive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drive` (
  `id_drive` int(11) NOT NULL AUTO_INCREMENT,
  `type_drive` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_drive`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drive`
--

LOCK TABLES `drive` WRITE;
/*!40000 ALTER TABLE `drive` DISABLE KEYS */;
INSERT INTO `drive` VALUES (1,'передний'),(2,'задний'),(3,'полный');
/*!40000 ALTER TABLE `drive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine`
--

DROP TABLE IF EXISTS `engine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine` (
  `id_engine` int(11) NOT NULL AUTO_INCREMENT,
  `type_engine` varchar(45) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `power` double DEFAULT NULL,
  PRIMARY KEY (`id_engine`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine`
--

LOCK TABLES `engine` WRITE;
/*!40000 ALTER TABLE `engine` DISABLE KEYS */;
INSERT INTO `engine` VALUES (1,'бензин','1.6',98),(2,'бензин','1.6',106),(3,'бензин','1.8',118),(4,'бензин','2.0',140),(5,'дизель','2.0',120);
/*!40000 ALTER TABLE `engine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model` (
  `id_model` int(11) NOT NULL AUTO_INCREMENT,
  `id_brend` int(11) NOT NULL,
  `name_model` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `release_year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_model`),
  KEY `BrendModel_idx` (`id_brend`),
  CONSTRAINT `BrendModel` FOREIGN KEY (`id_brend`) REFERENCES `brend` (`id_brend`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,1,'Гранта',420000,2017),(2,1,'Приора',480000,2017),(3,1,'Веста',650000,2017),(4,1,'Х-Рей',700000,2017),(5,2,'Логан',730000,2017),(6,2,'Каптюр',930000,2017),(7,2,'Меган',990000,2017);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option` (
  `id_option` int(11) NOT NULL AUTO_INCREMENT,
  `name_option` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id_option`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option`
--

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
INSERT INTO `option` VALUES (1,'навигация',10000),(2,'камера заднего вида',7000),(3,'обогрев лобоового стекла',20000),(4,'парктроник',18000),(5,'электропривод багажника',50000);
/*!40000 ALTER TABLE `option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_auto`
--

DROP TABLE IF EXISTS `option_auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_auto` (
  `id_compl` int(11) DEFAULT NULL,
  `id_option` int(11) DEFAULT NULL,
  KEY `option_idx` (`id_option`),
  KEY `compl` (`id_compl`),
  CONSTRAINT `compl` FOREIGN KEY (`id_compl`) REFERENCES `completation` (`id_compl`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `option` FOREIGN KEY (`id_option`) REFERENCES `option` (`id_option`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_auto`
--

LOCK TABLES `option_auto` WRITE;
/*!40000 ALTER TABLE `option_auto` DISABLE KEYS */;
INSERT INTO `option_auto` VALUES (3,1),(3,2),(3,3),(3,4),(3,5),(2,2),(2,4),(1,4);
/*!40000 ALTER TABLE `option_auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id_roles` int(11) NOT NULL AUTO_INCREMENT,
  `name_roles` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_roles`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'администратор'),(2,'менеджер'),(3,'покупатель');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transmission`
--

DROP TABLE IF EXISTS `transmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transmission` (
  `id_kpp` int(11) NOT NULL AUTO_INCREMENT,
  `type_kpp` varchar(45) DEFAULT NULL,
  `count_gear` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kpp`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transmission`
--

LOCK TABLES `transmission` WRITE;
/*!40000 ALTER TABLE `transmission` DISABLE KEYS */;
INSERT INTO `transmission` VALUES (1,'механика',NULL),(2,'автомат',NULL),(3,'робот',NULL);
/*!40000 ALTER TABLE `transmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typecolor`
--

DROP TABLE IF EXISTS `typecolor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typecolor` (
  `id_tcolor` int(11) NOT NULL AUTO_INCREMENT,
  `t_color` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tcolor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typecolor`
--

LOCK TABLES `typecolor` WRITE;
/*!40000 ALTER TABLE `typecolor` DISABLE KEYS */;
INSERT INTO `typecolor` VALUES (1,'металлик'),(2,'матовый');
/*!40000 ALTER TABLE `typecolor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `name_user` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `patronymic` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `RoleUser_idx` (`id_role`),
  CONSTRAINT `RoleUser` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_roles`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'root','root','Иванов','Иван','Иваныч','123456','qwer@yandex.ru',1),(2,'manager','manager','Кудрин','Сергей','Петрович','45678655','asdff@mail.ru',2),(3,'client1','client','Пушкин','Александр','Сергеевич','876786545','pusha@yandex.ru',3);
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

-- Dump completed on 2018-01-07 21:22:34
