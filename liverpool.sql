-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: Liverpool
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `id` varchar(10) NOT NULL,
  `director` varchar(10) DEFAULT NULL,
  `company` varchar(10) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company` (`company`),
  KEY `director` (`director`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`company`) REFERENCES `company` (`id`),
  CONSTRAINT `branch_ibfk_2` FOREIGN KEY (`director`) REFERENCES `employee` (`payroll_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('B0710','E94017401','L107321',19.0321,-98.2344,'Angelópolis'),('B1210','E091273917','L107321',19.0917,-98.2263,'Galerías Serdán'),('B2412','E838094372','L107321',19.0698,-98.176,'Parque Puebla');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` varchar(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `department` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department` (`department`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`department`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` varchar(10) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('L107321','Liverpool');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` varchar(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `electronic_purse` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` varchar(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `manager` varchar(10) DEFAULT NULL,
  `branch` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `branch` (`branch`),
  KEY `manager` (`manager`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`branch`) REFERENCES `branch` (`id`),
  CONSTRAINT `department_ibfk_2` FOREIGN KEY (`manager`) REFERENCES `employee` (`payroll_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependent` (
  `id` varchar(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `employee` varchar(10) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee` (`employee`),
  CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`employee`) REFERENCES `employee` (`payroll_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount` (
  `id` varchar(10) NOT NULL,
  `product` varchar(10) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product` (`product`),
  CONSTRAINT `discount_ibfk_1` FOREIGN KEY (`product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `payroll_number` varchar(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `branch` varchar(10) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `monthly_salary` double DEFAULT NULL,
  `rest_day` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`payroll_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('E01359275','Guadalupe','Ortiz','B0710','1971-04-19','Calle 26 Sur 97 Reserva territorial Atlixcáyotl','2002-09-12','Cashier',9720.39,3,1),('E091221895','Alejandro','Vázquez','B1210','1992-09-23','Rincón de las Magnolias 73 Rincón Arboledas','2012-02-19','Cashier',9820.92,4,1),('E091273917','Pablo','Pazos','B1210','1976-07-05','Calle Tlahuapan 78 La Paz','2003-02-21','Director',113280.71,5,1),('E164920462','Miguel','Cedano','B0710','1965-01-12','Calle Almendral 256 Villa Magna','1990-02-18','Director',110947.73,2,0),('E184028592','Juan Pablo','Luna','B0710','1982-03-13','Calle 16 36 San José Vista Hermosa','2004-09-11','Cashier',9739.43,1,0),('E184729472','Emilio','Melendez','B1210','1992-07-12','Avenida 11 Poniente 1743 Barrio de Santiago','2014-03-12','Salesperson',8162.47,2,0),('E208471947','Judith','Medina','B1210','1987-12-16','Avenida 15 Poniente 2912 Belisario Domínguez','2013-05-23','Cashier',9917.25,4,0),('E212720461','Romina','Ballarte','B2412','1993-06-26','Sierra Otomí 8802 Maravillas','2013-05-14','Salesperson',8620.43,3,1),('E382018592','Guillermo','Loeza','B2412','1985-07-13','Rivera el Atoyac 27 Rivera el Atoyac','2000-11-08','Manager',35982.74,1,0),('E429810372','Julia','Oropeza','B2412','1990-11-29','Sierra de los Pirineos 8802 Maravillas','2010-03-05','Salesperson',8219.85,4,0),('E539175027','Ángel','Díaz','B2412','1965-10-24','Calle Ruiz Cortines 77 Independencia','2000-11-24','Director',120942.76,0,0),('E639163025','Jorge','Zavaleta','B2412','1990-10-28','Xonaca 2874 Puebla','2010-10-05','Cashier',10763.86,0,1),('E712074810','Pedro','Jordán','B1210','1972-05-18','Calle 29 Sur 1748 La Paz','2000-08-19','Manager',25819.74,0,0),('E720183629','Roberto','Muñoz','B1210','1982-06-27','Calle Moras 76 Residencial San Martinito','2006-03-16','Salesperson',7390.2,2,1),('E81639219','Adriana','Velez','B0710','1968-10-17','Calle Castaños 3942 Animas','2002-10-12','Salesperson',4502.75,1,0),('E831927310','Eduardo','Jaramillo','B0710','1985-01-30','Avenida Escocia 121 Las Hadas','2004-05-12','Manager',60143.3,3,1),('E837201649','Mónica','Yañez','B0710','1981-06-23','Calle 43B Sur 4284 Estrellas del Sur','1998-03-07','Manager',48174.72,6,0),('E838094372','Reyna','Patraca','B2412','1973-04-02','San Pedro 35 Residencial Santa Fe','2008-10-24','Director',127942.96,4,1),('E857301930','Beatriz','Quiroz','B0710','1993-12-02','Claustro Herradura 47 Real de Santa Clara','2014-02-19','Salesperson',6802.97,5,1),('E862918310','Fernanda','Castillo','B2412','1985-07-14','Arboledas de Guadalupe 87 Puebla','2007-12-06','Manager',42862.14,3,1),('E90263752','Martín','Alvizar','B1210','1964-06-30','Calle Mimiapan 16 La Paz','1992-04-09','Director',93180.62,5,0),('E917483017','Manuel','Juárez','B2412','1995-05-30','Calle V. Carranza 7176 Tepeyac','2014-09-14','Cashier',11320.32,1,0),('E94017401','Martha','Palomares','B0710','1966-04-12','Boulevard Victoria 432 Lomas de Angelópolis','2000-08-16','Director',130831.48,6,1),('E982743910','Jesús','Martínez','B1210','1985-02-20','Paseo Sierra Andina 74 Lomas de Angelópolis','2008-05-28','Manager',38920.82,1,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_registration`
--

DROP TABLE IF EXISTS `employee_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_registration` (
  `id` varchar(10) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `employee` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee` (`employee`),
  CONSTRAINT `employee_registration_ibfk_1` FOREIGN KEY (`employee`) REFERENCES `employee` (`payroll_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_registration`
--

LOCK TABLES `employee_registration` WRITE;
/*!40000 ALTER TABLE `employee_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenditure`
--

DROP TABLE IF EXISTS `expenditure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expenditure` (
  `id` varchar(10) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenditure`
--

LOCK TABLES `expenditure` WRITE;
/*!40000 ALTER TABLE `expenditure` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenditure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_registry`
--

DROP TABLE IF EXISTS `gift_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_registry` (
  `id` varchar(10) NOT NULL,
  `customer` varchar(10) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer` (`customer`),
  CONSTRAINT `gift_registry_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_registry`
--

LOCK TABLES `gift_registry` WRITE;
/*!40000 ALTER TABLE `gift_registry` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_registry_product`
--

DROP TABLE IF EXISTS `gift_registry_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_registry_product` (
  `gift_registry` varchar(10) DEFAULT NULL,
  `product` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  KEY `gift_registry` (`gift_registry`),
  KEY `product` (`product`),
  CONSTRAINT `gift_registry_product_ibfk_1` FOREIGN KEY (`gift_registry`) REFERENCES `gift_registry` (`id`),
  CONSTRAINT `gift_registry_product_ibfk_2` FOREIGN KEY (`product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_registry_product`
--

LOCK TABLES `gift_registry_product` WRITE;
/*!40000 ALTER TABLE `gift_registry_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_registry_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `id` varchar(10) NOT NULL,
  `supplier` varchar(16) DEFAULT NULL,
  `purchase_order` varchar(10) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `expenditure` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier` (`supplier`),
  KEY `purchase_order` (`purchase_order`),
  KEY `expenditure` (`expenditure`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`rfc`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`purchase_order`) REFERENCES `purchase_order` (`id`),
  CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`expenditure`) REFERENCES `expenditure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mode_of_payment`
--

DROP TABLE IF EXISTS `mode_of_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mode_of_payment` (
  `id` varchar(10) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mode_of_payment`
--

LOCK TABLES `mode_of_payment` WRITE;
/*!40000 ALTER TABLE `mode_of_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mode_of_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` varchar(10) NOT NULL,
  `sku` int(11) DEFAULT NULL,
  `mi_req_sku` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `category` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price_history`
--

DROP TABLE IF EXISTS `product_price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_price_history` (
  `id` varchar(10) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `new_price` double DEFAULT NULL,
  `product` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product` (`product`),
  CONSTRAINT `product_price_history_ibfk_1` FOREIGN KEY (`product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price_history`
--

LOCK TABLES `product_price_history` WRITE;
/*!40000 ALTER TABLE `product_price_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_price_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order` (
  `id` varchar(10) NOT NULL,
  `payment_details` varchar(100) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `shipment_details` varchar(100) DEFAULT NULL,
  `supplier` varchar(10) DEFAULT NULL,
  `warehouse_delivery` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_delivery` (`warehouse_delivery`),
  KEY `supplier` (`supplier`),
  CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`warehouse_delivery`) REFERENCES `warehouse_delivery` (`id`),
  CONSTRAINT `purchase_order_ibfk_2` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`rfc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_product`
--

DROP TABLE IF EXISTS `purchase_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_product` (
  `purchase_order` varchar(10) DEFAULT NULL,
  `product` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  KEY `purchase_order` (`purchase_order`),
  KEY `product` (`product`),
  CONSTRAINT `purchase_order_product_ibfk_1` FOREIGN KEY (`purchase_order`) REFERENCES `purchase_order` (`id`),
  CONSTRAINT `purchase_order_product_ibfk_2` FOREIGN KEY (`product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_product`
--

LOCK TABLES `purchase_order_product` WRITE;
/*!40000 ALTER TABLE `purchase_order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale` (
  `id` varchar(10) NOT NULL,
  `customer` varchar(10) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `special_offer` varchar(10) DEFAULT NULL,
  `mode_of_payment` varchar(10) DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer` (`customer`),
  KEY `special_offer` (`special_offer`),
  KEY `mode_of_payment` (`mode_of_payment`),
  CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`),
  CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`special_offer`) REFERENCES `special_offer` (`id`),
  CONSTRAINT `sale_ibfk_3` FOREIGN KEY (`mode_of_payment`) REFERENCES `mode_of_payment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_product`
--

DROP TABLE IF EXISTS `sale_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_product` (
  `sale` varchar(10) DEFAULT NULL,
  `product` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  KEY `sale` (`sale`),
  KEY `product` (`product`),
  CONSTRAINT `sale_product_ibfk_1` FOREIGN KEY (`sale`) REFERENCES `sale` (`id`),
  CONSTRAINT `sale_product_ibfk_2` FOREIGN KEY (`product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_product`
--

LOCK TABLES `sale_product` WRITE;
/*!40000 ALTER TABLE `sale_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_cart` (
  `id` varchar(10) NOT NULL,
  `customer` varchar(10) DEFAULT NULL,
  `sale` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer` (`customer`),
  KEY `sale` (`sale`),
  CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`),
  CONSTRAINT `shopping_cart_ibfk_2` FOREIGN KEY (`sale`) REFERENCES `sale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart_product`
--

DROP TABLE IF EXISTS `shopping_cart_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_cart_product` (
  `shopping_cart` varchar(10) DEFAULT NULL,
  `product` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  KEY `shopping_cart` (`shopping_cart`),
  KEY `product` (`product`),
  CONSTRAINT `shopping_cart_product_ibfk_1` FOREIGN KEY (`shopping_cart`) REFERENCES `shopping_cart` (`id`),
  CONSTRAINT `shopping_cart_product_ibfk_2` FOREIGN KEY (`product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart_product`
--

LOCK TABLES `shopping_cart_product` WRITE;
/*!40000 ALTER TABLE `shopping_cart_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_offer`
--

DROP TABLE IF EXISTS `special_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_offer` (
  `id` varchar(10) NOT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `months_without_interest` int(11) DEFAULT NULL,
  `electronic_purse` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_offer`
--

LOCK TABLES `special_offer` WRITE;
/*!40000 ALTER TABLE `special_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `special_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `rfc` varchar(16) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`rfc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_price_history`
--

DROP TABLE IF EXISTS `supplier_price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_price_history` (
  `id` varchar(10) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `new_price` double DEFAULT NULL,
  `product` varchar(10) DEFAULT NULL,
  `supplier` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product` (`product`),
  KEY `supplier` (`supplier`),
  CONSTRAINT `supplier_price_history_ibfk_1` FOREIGN KEY (`product`) REFERENCES `product` (`id`),
  CONSTRAINT `supplier_price_history_ibfk_2` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`rfc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_price_history`
--

LOCK TABLES `supplier_price_history` WRITE;
/*!40000 ALTER TABLE `supplier_price_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_price_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_delivery`
--

DROP TABLE IF EXISTS `warehouse_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse_delivery` (
  `id` varchar(10) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `branch` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `branch` (`branch`),
  CONSTRAINT `warehouse_delivery_ibfk_1` FOREIGN KEY (`branch`) REFERENCES `branch` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_delivery`
--

LOCK TABLES `warehouse_delivery` WRITE;
/*!40000 ALTER TABLE `warehouse_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehouse_delivery` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-24 12:30:43
