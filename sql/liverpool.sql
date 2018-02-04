-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: liverpool
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
INSERT INTO `category` VALUES ('C038102','Instrumentos musicales','D01846'),('C120482','Instrumentos musicales','D83726'),('C123413','Ropa','D73817'),('C123419','Zapatos','D73817'),('C123749','Bolsas','D18472'),('C123901','Bebés','D84629'),('C123910','Aparatos de ejercicio','D82631'),('C123940','Libros','D73917'),('C123948','Entretenimiento','D83726'),('C124721','Por edad','D18362'),('C128492','Electrónica','D83726'),('C129419','Electrónica','D46295'),('C129472','Entretenimiento','D46295'),('C129482','Series','D73917'),('C138204','Muebles para bebé','D83716'),('C139302','Muebles','D18620'),('C139582','Niños','D84629'),('C1462934','Zapatos','D73017'),('C174630','Viajes Liverpool','D82026'),('C183621','Accesorios','D73817'),('C184729','Preventas','D18263'),('C186302','Consolas','D18263'),('C192012','Ropa','D82917'),('C192047','Ropa','D84620'),('C192371','Accesorios','D18472'),('C192749','Arte y decoración','D83716'),('C193620','Bienestar y salud','D18273'),('C193719','Colchones','D18620'),('C193720','Cómputo','D46295'),('C193729','Ropa','D18472'),('C193821','Línea blanca','D94726'),('C193850','Viajes Liverpool','D73812'),('C194720','Niños','D73529'),('C194722','Juegos','D18263'),('C194729','Cuidado personal','D18273'),('C248261','Electrodomésticos','D94726'),('C281620','Lentes','D81274'),('C294791','Muebles','D83716'),('C357201','Bolsas','D73017'),('C361972','Electrodomésticos','D94628'),('C402810','Zapatos','D84620'),('C493820','Zapatos','D82917'),('C631992','Bebés','D73529'),('C639201','Entretenimiento','D01846'),('C816452','Perfumería y cosméticos','D18273'),('C837461','Top ventas','D18263'),('C856391','Niñas','D73529'),('C891048','Relojes','D81274'),('C917462','Zapatos','D18472'),('C928102','Equipos','D92736'),('C938102','Accesorios','D73017'),('C947291','Cómputo','D83726'),('C973018','Disciplinas y accesorios','D82631');
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
INSERT INTO `department` VALUES ('D01846','Electrónicos','E471846204','B2412'),('D18263','Videojuegos','E739857105','B0710'),('D18273','Salud y belleza','E385016395','B0710'),('D18362','Juguetes','E548261937','B2412'),('D18472','Ella','E158205739','B0710'),('D18620','Muebles','E739152846','B2412'),('D46295','Electrónicos','E782936182','B1210'),('D73017','Ella','E119749368','B2412'),('D73529','Niños y bebés','E183629172','B2412'),('D73812','Viajes','E835730183','B1210'),('D73817','Él','E173629472','B0710'),('D73917','Libros','E746381947','B1210'),('D81274','Relojes y lentes','E316382057','B1210'),('D82026','Viajes','E718263090','B2412'),('D82631','Deportes','E582948291','B1210'),('D82917','Él','E184927481','B1210'),('D83716','Muebles','E917583904','B0710'),('D83726','Electrónicos','E831927310','B0710'),('D84620','Ella','E184920472','B1210'),('D84629','Niños y bebés','E192750849','B0710'),('D92736','Celulares','E528174926','B1210'),('D94628','Hogar y cocina','E818462047','B2412'),('D94726','Línea blanca','E892746103','B0710');
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
INSERT INTO `dependent` VALUES ('DEP0239','Alfredo','Machorro','E218472981','1952-04-28'),('DEP0751','Leonardo','Castellano','E917583904','1943-05-02'),('DEP0912','Fernando','Reyes','E718263090','1969-03-15'),('DEP1092','Magalí','Jiménez','E119749368','1972-07-12'),('DEP1231','Guillermo','Magaña','E819362819','1971-10-03'),('DEP1750','Karina','Vázquez','E091221895','1971-09-12'),('DEP1829','Miguel','Arroyo','E739857105','1947-12-09'),('DEP1830','Alejandro','Jaramillo','E831927310','1960-08-19'),('DEP1837','Salvador','Yañez','E837201649','1952-05-14'),('DEP1847','Gabriela','Gómez','E164920462','1970-09-15'),('DEP2349','Fernanda','Vega','E746381947','1977-11-21'),('DEP2812','Juan Pablo','Quiroz','E857301930','1969-10-16'),('DEP3428','Monserrat','Orozco','E471846204','1964-12-30'),('DEP3810','Jesús','Garfias','E158205739','1975-02-18'),('DEP3910','Saúl','Ochoa','E892746103','1956-12-08'),('DEP4461','Miguel','Zaragoza','E862918310','1982-02-11'),('DEP4856','Nicolás','Fierro','E838094372','1971-08-14'),('DEP5463','Adriana','Torres','E712074810','1970-03-27'),('DEP5639','Laura','Palomares','E94017401','1945-12-18'),('DEP5647','Nora','Panamá','E917483017','1960-12-08'),('DEP6371','Abraham','Torres','E818462047','1956-09-03'),('DEP6483','Rodrigo','Ruiz','E835730183','1980-07-12'),('DEP6530','Estela','Zavaleta','E639163025','1965-12-05'),('DEP6564','Christian','Oropeza','E429810372','1966-12-07'),('DEP6574','Alejandra','Alonso','E90263752','1960-07-29'),('DEP6758','Manuel','Rentería','E184920472','1974-09-23'),('DEP7009','Hugo','Palomar','E739152846','1964-07-25'),('DEP7029','Yolanda','Salomón','E539175027','1961-08-25'),('DEP7391','Jorge','Acevedo','E385016395','1950-06-12'),('DEP7520','Gibrán','Sabino','E548261937','1968-11-29'),('DEP7563','Rubén','Muñoz','E208471947','1990-11-16'),('DEP7565','Luis','Huerta','E582948291','1975-12-20'),('DEP7630','Eduardo','Luna','E184028592','1961-02-01'),('DEP7647','Jorge','Ballarte','E212720461','1969-10-07'),('DEP7649','Karla','Martínez','E173629472','1970-10-03'),('DEP7651','Renata','Bravo','E720183629','1980-10-19'),('DEP7658','María','Villalever','E782936182','1975-07-03'),('DEP7685','Ángel','Gutiérrez','E528174926','1967-03-15'),('DEP8392','Nuria','Velazquez','E982743910','1983-12-09'),('DEP8471','Emilia','Fernández','E01359275','1947-08-03'),('DEP8593','Sergio','Loeza','E382018592','1959-06-12'),('DEP8740','Roberto','Farias','E184927481','1974-10-08'),('DEP8793','Lucero','Ricardez','E183629172','1973-05-10'),('DEP9123','Germán','Cota','E316382057','1977-06-07'),('DEP9283','Mario','Aguilar','E192750849','1949-07-12'),('DEP9372','Carmen','Flores','E091273917','1980-10-29'),('DEP9968','Iván','Melendez','E184729472','1968-11-30');
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
INSERT INTO `discount` VALUES ('1001','1013481930','2018-01-25 12:52:36','2018-01-25 12:52:43'),('1002','1013481930','2018-01-25 12:56:05','2018-02-01 12:56:05'),('1124','1094175158','2018-01-25 18:25:54','2018-02-01 18:25:54'),('1238','1095829573','2018-01-25 18:25:26','2018-02-01 18:25:26'),('1593','1084928572','2018-01-25 18:26:46','2018-02-14 18:26:46'),('1951','1094150151','2018-01-25 18:26:22','2018-02-07 18:26:22');
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
INSERT INTO `employee` VALUES ('E01359275','Guadalupe','Ortiz','B0710','1971-04-19','Calle 26 Sur 97 Reserva territorial Atlixcáyotl','1998-09-12','Cashier',9720.39,3,1),('E091221895','Alejandro','Vázquez','B1210','1992-09-23','Rincón de las Magnolias 73 Rincón Arboledas','2014-02-19','Cashier',9820.92,4,1),('E091273917','Pablo','Pazos','B1210','1976-07-05','Calle Tlahuapan 78 La Paz','2014-02-21','Director',113280.71,5,1),('E119749368','Julio','Rocha','B2412','1993-08-26','Calle 8 Sur 2812 Anzures','2016-02-17','Manager',39137.73,0,1),('E158205739','Esteban','Garfias','B0710','1977-12-06','Calle Monte Alban 24 Puebla','1998-01-15','Manager',42918.87,3,1),('E164920462','Miguel','Cedano','B0710','1965-01-12','Calle Almendral 256 Villa Magna','1998-02-18','Director',110947.73,2,0),('E173629472','Joel','Rivera','B0710','1972-07-26','Calle V Suárez 3819 San Miguel la Rosa','2002-04-02','Manager',37283.84,1,1),('E183629172','Damián','Zepeda','B2412','1994-12-15','Calle 11 Norte 1402 Libertad','2016-12-03','Manager',31038.38,6,1),('E184028592','Juan Pablo','Luna','B0710','1982-03-13','Calle 16 36 San José Vista Hermosa','2004-09-11','Cashier',9739.43,1,0),('E184729472','Emilio','Melendez','B1210','1992-07-12','Avenida 11 Poniente 1743 Barrio de Santiago','2014-03-12','Salesperson',8162.47,2,0),('E184920472','Hugo','Moreno','B1210','1976-10-30','Avenida Turquesa 4321 Villa Posadas','2014-07-12','Manager',37182.87,1,1),('E184927481','Silbina','Prado','B1210','1972-10-26','Paso Mexicano 10 Amor','2014-10-24','Manager',37192.73,2,1),('E192750849','Karla','Aguilar','B0710','1974-07-16','Calle San Miguel 23 Residencial Zavaleta','1998-03-08','Manager',57329.76,0,1),('E208471947','Judith','Medina','B1210','1987-12-16','Avenida 15 Poniente 2912 Belisario Domínguez','2014-05-23','Cashier',9917.25,4,0),('E212720461','Romina','Ballarte','B2412','1993-06-26','Sierra Otomí 8802 Maravillas','2016-05-14','Salesperson',8620.43,3,1),('E218472981','Germán','Machorro','B0710','1972-04-28','Francisco Morlasca 321 Bello Horizonte','1998-10-18','Manager',52910.48,6,1),('E316382057','Victoria','Ferro','B1210','1973-12-13','Avenida 6 Poniente 4518 Puebla','2014-10-03','Manager',42481.83,1,1),('E382018592','Guillermo','Loeza','B2412','1980-07-13','Rivera el Atoyac 27 Rivera el Atoyac','2016-11-08','Manager',35982.74,1,0),('E385016395','Alfonso','Acevedo','B0710','1976-12-19','Calle Paseo de España 33 Guadalupe','1998-10-06','Manager',48912.86,2,1),('E429810372','Julia','Oropeza','B2412','1990-11-29','Sierra de los Pirineos 8802 Maravillas','2016-03-05','Salesperson',8219.85,4,0),('E471846204','Salomé','Mandujano','B2412','1987-10-01','Calle 17 Sur 3308 Los Volcanes','2016-04-14','Manager',41039.93,5,1),('E528174926','Grecia','Lozada','B1210','1971-09-23','Calle 12B Poniente 1703 Ampliación Aquiles Serdán','2014-11-08','Manager',40183.72,2,1),('E539175027','Ángel','Díaz','B2412','1965-10-24','Calle Ruiz Cortines 77 Independencia','2016-11-24','Director',120942.76,0,0),('E548261937','Cristina','Sabino','B2412','1991-06-15','Calle 21 de Marzo 3212 Villa Zavaleta','2016-04-13','Manager',41028.29,1,1),('E582948291','Virginia','Miranda','B1210','1977-12-03','Calle 26B Poniente 4212 Residencial del Valle','2014-12-30','Manager',40918.32,5,1),('E639163025','Jorge','Zavaleta','B2412','1990-10-28','Xonaca 2874 Puebla','2016-10-05','Cashier',10763.86,0,1),('E712074810','Pedro','Jordán','B1210','1972-05-18','Calle 29 Sur 1748 La Paz','2014-08-19','Manager',25819.74,0,0),('E718263090','Nicolás','Reyes','B2412','1988-01-30','Avenida 13 Poniente 1874 Barrio de Santiago','2016-09-27','Manager',39271.47,2,1),('E720183629','Roberto','Muñoz','B1210','1982-06-27','Calle Moras 76 Residencial San Martinito','2014-03-16','Salesperson',7390.2,2,1),('E739152846','Sara','Palomar','B2412','1996-12-02','Tamaulipas 420 El Carmen','2016-12-01','Manager',40273.28,4,1),('E739857105','Amelia','Arroyo','B0710','1970-08-20','Calle del Sol 9 Bello Horizonte','1998-05-12','Manager',35193.29,5,1),('E746381947','Emiliano','Saracho','B1210','1975-05-03','Calle Fresnos 3537 Las Animas','2014-04-12','Manager',34284.84,4,1),('E782936182','Fabián','Guardiola','B1210','1978-02-18','Calle 14 Poniente 3716 Villa Posadas','2014-06-18','Manager',36281.98,5,1),('E81639219','Adriana','Velez','B0710','1968-10-17','Calle Castaños 3942 Animas','2002-10-12','Salesperson',4502.75,1,0),('E818462047','Valentina','Torres','B2412','1979-11-04','Calle 10 Sur 3710 Anzures','2016-05-12','Manager',40281.74,0,1),('E819362819','Francisco','Magaña','B2412','1991-02-12','Avenida 15 Poniente 111 El Carmen','2016-06-30','Manager',39173.29,6,1),('E831927310','Eduardo','Jaramillo','B0710','1980-01-30','Avenida Escocia 121 Las Hadas','1998-05-12','Manager',60143.3,3,1),('E835730183','Ismael','Ruiz','B1210','1979-05-05','Privada 8A Poniente 4330 Valle del Rey','2014-09-12','Manager',38291.82,2,1),('E837201649','Mónica','Yañez','B0710','1976-06-23','Calle 43B Sur 4284 Estrellas del Sur','1998-03-07','Manager',48174.72,6,0),('E838094372','Reyna','Patraca','B2412','1973-04-02','San Pedro 35 Residencial Santa Fe','2016-10-24','Director',127942.96,4,1),('E857301930','Beatriz','Quiroz','B0710','1993-12-02','Claustro Herradura 47 Real de Santa Clara','2014-02-19','Salesperson',6802.97,5,1),('E862918310','Fernanda','Castillo','B2412','1985-07-14','Arboledas de Guadalupe 87 Puebla','2016-12-06','Manager',42862.14,3,1),('E892746103','Luisa','Ochoa','B0710','1974-09-21','Privada Santa Fe 9 Santa Cruz Buenavista','1998-07-16','Manager',43892.87,3,1),('E90263752','Martín','Alvizar','B1210','1964-06-30','Calle Mimiapan 16 La Paz','2014-04-09','Director',93180.62,5,0),('E917483017','Manuel','Juárez','B2412','1995-05-30','Calle V. Carranza 7176 Tepeyac','2016-09-14','Cashier',11320.32,1,0),('E917583904','Helena','Castellano','B0710','1974-09-11','Calle Palenque 452 Santa Cruz Buenavista','1998-08-21','Manager',48192.18,2,1),('E94017401','Martha','Palomares','B0710','1966-04-12','Boulevard Victoria 432 Lomas de Angelópolis','1998-08-16','Director',130831.48,6,1),('E982743910','Jesús','Martínez','B1210','1985-02-20','Paseo Sierra Andina 74 Lomas de Angelópolis','2014-05-28','Manager',38920.82,1,1);
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
INSERT INTO `employee_registration` VALUES ('REG115713','2018-01-22 16:35:32','E819362819'),('REG124189','2018-01-22 14:48:21','E782936182'),('REG124812','2018-01-22 09:12:40','E091221895'),('REG124817','2018-01-22 19:20:16','E982743910'),('REG124859','2018-01-22 17:57:14','E173629472'),('REG135181','2018-01-22 16:44:16','E212720461'),('REG135715','2018-01-22 15:59:52','E718263090'),('REG135719','2018-01-22 08:49:10','E835730183'),('REG143175','2018-01-22 08:16:43','E316382057'),('REG147105','2018-01-22 16:59:41','E528174926'),('REG151751','2018-01-22 10:30:13','E091273917'),('REG153829','2018-01-22 13:14:36','E184920472'),('REG156891','2018-01-22 12:59:15','E119749368'),('REG157183','2018-01-22 21:18:30','E548261937'),('REG157193','2018-01-22 08:59:32','E720183629'),('REG158135','2018-01-22 16:58:10','E316382057'),('REG158195','2018-01-22 14:18:29','E183629172'),('REG158652','2018-01-22 13:10:15','E548261937'),('REG159175','2018-01-22 08:57:38','E718263090'),('REG159683','2018-01-22 09:14:30','E982743910'),('REG159819','2018-01-22 17:09:52','E720183629'),('REG184120','2018-01-22 18:04:19','E091273917'),('REG193810','2018-01-22 14:50:12','E857301930'),('REG235729','2018-01-22 18:14:02','E471846204'),('REG235891','2018-01-22 14:08:26','E835730183'),('REG256271','2018-01-22 18:15:14','E639163025'),('REG258292','2018-01-22 10:20:46','E471846204'),('REG281923','2018-01-22 08:59:24','E158205739'),('REG351709','2018-01-22 14:29:19','E582948291'),('REG351748','2018-01-22 21:09:13','E746381947'),('REG358141','2018-01-22 21:25:16','E838094372'),('REG358529','2018-01-22 09:12:59','E782936182'),('REG368250','2018-01-22 09:01:35','E819362819'),('REG381239','2018-01-22 19:37:59','E917583904'),('REG381720','2018-01-22 08:58:02','E01359275'),('REG392019','2018-01-22 09:48:13','E218472981'),('REG394810','2018-01-22 13:49:14','E385016395'),('REG417591','2018-01-22 21:03:20','E582948291'),('REG457105','2018-01-22 21:01:54','E184920472'),('REG483921','2018-01-22 08:55:38','E173629472'),('REG518359','2018-01-22 08:49:25','E119749368'),('REG518410','2018-01-22 11:59:15','E862918310'),('REG572012','2018-01-22 14:38:10','E218472981'),('REG574829','2018-01-22 15:22:14','E01359275'),('REG581491','2018-01-22 09:53:29','E528174926'),('REG581571','2018-01-22 09:49:24','E212720461'),('REG581591','2018-01-22 21:06:21','E862918310'),('REG582048','2018-01-22 09:19:40','E739857105'),('REG582958','2018-01-22 21:43:52','E818462047'),('REG583023','2018-01-22 16:58:20','E192750849'),('REG584920','2018-01-22 09:20:17','E192750849'),('REG682572','2018-01-22 13:02:50','E838094372'),('REG682591','2018-01-22 14:24:35','E818462047'),('REG698720','2018-01-22 21:09:40','E183629172'),('REG758201','2018-01-22 21:23:10','E385016395'),('REG812371','2018-01-22 08:05:50','E892746103'),('REG820138','2018-01-22 18:10:03','E831927310'),('REG847101','2018-01-22 17:29:36','E94017401'),('REG849247','2018-01-22 08:49:18','E94017401'),('REG851704','2018-01-22 13:54:04','E746381947'),('REG857401','2018-01-22 17:39:59','E091221895'),('REG860149','2018-01-22 17:15:30','E739152846'),('REG950371','2018-01-22 20:04:14','E857301930'),('REG962758','2018-01-22 09:02:16','E739152846');
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
INSERT INTO `expenditure` VALUES ('EXP151841','2016-01-16 18:59:30',112042.59),('EXP158591','2014-02-26 12:53:21',102930.15),('EXP185720','2016-05-15 09:48:15',76029.24),('EXP237195','2017-01-05 16:37:48',169396.93),('EXP258691','2016-06-27 12:43:36',15867.38),('EXP269251','2017-11-06 11:37:33',93572.59),('EXP377733','2017-06-16 13:36:39',79174.17),('EXP581381','2015-12-17 15:24:59',15719.83),('EXP628521','2017-06-26 12:39:43',70258.25),('EXP629581','2015-07-26 15:16:57',84165.53);
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
  `customer` int(11) DEFAULT NULL,
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
INSERT INTO `invoice` VALUES ('INV15491','RE1324190FA8491','PO4391','2018-01-13 20:25:30','EXP629581'),('INV41098','JAF8391409C1341','PO5491','2018-01-20 20:27:00','EXP377733'),('INV54901','JOF123489A8134B','PO5492','2018-01-04 20:26:16','EXP628521');
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
INSERT INTO `mode_of_payment` VALUES ('MOP138191','AMEX'),('MOP141781','Santander'),('MOP148129','Banamex'),('MOP148192','Scotiabank'),('MOP31482','Efectivo'),('MOP358234','HSBC'),('MOP418192','Banorte'),('MOP493149','Bancomer');
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
INSERT INTO `product` VALUES ('1012481934',0,30,0,490,'Set Capitán América','C816452'),('1012485171',17,15,0,13799,'iPad 9.7 Pulgadas 128GB','C947291'),('1012491234',150,60,1,899,'Lente para Dji Phantom','C128492'),('1012948264',32,10,1,679.15,'Adaptador USB-C a HDMI','C193720'),('1013458131',250,80,1,349,'Cinturón liso','C139582'),('1013481492',240,30,0,1690,'Body','C193729'),('1013481930',80,10,1,168,'Crema para tatuajes','C194729'),('101354812',150,30,1,249,'Playera Star Wars','C139582'),('1013812491',320,60,1,999,'Vestido con diseño gráfico','C193729'),('1013912430',23,10,1,35999,'Gamer HP Omen AMD','C947291'),('1014185391',18,5,1,2039.15,'Alcatel A3 Plus','C928102'),('1014335712',38,10,1,12999,'Samsung Galaxy A8','C928102'),('1014345298',85,25,1,3399,'Zapatos Rockport','C402810'),('1014358439',57,20,1,2299,'Tenis lisos','C402810'),('1014359853',87,30,1,999,'Vestido con diseño gráfico','C192047'),('1014367459',132,50,0,699,'Pantalón con diseño gráfico','C192047'),('1014398619',49,20,1,1690,'Body','C192047'),('1014819201',300,90,1,399,'Aretes Additions','C192371'),('1015173910',30,15,1,348,'Inferno','C123940'),('1023457134',110,30,1,186.75,'Ernesto y Celestina','C123948'),('1023535920',270,60,1,760,'Base Lancome Teint Idole','C816452'),('1023573043',140,20,1,2200,'Perfume Women Above All','C816452'),('1023582590',210,70,0,1299,'Bolsa Satchel','C123749'),('1023592045',54,20,0,699,'Pantalón con diseño gráfico','C193729'),('1023598204',0,30,0,499,'Báscula digital','C193620'),('1025829325',190,50,1,199,'Diadema para cabello','C194729'),('1025829450',0,50,0,299,'Cojín relajante','C193620'),('1031517395',50,10,0,1721.3,'Pretty little lies','C129482'),('1032582351',68,30,1,2299,'Tenis lisos','C917462'),('1034571234',8,10,0,679.15,'Adaptador USB-C a HDMI','C947291'),('1034581031',140,50,0,135.2,'30 de Febrero Ha-Ash','C123948'),('1034583954',350,70,1,199,'Antifaz para dormir','C193620'),('1034829381',120,20,1,1399,'Wii U The Legend of Zelda','C837461'),('1035135731',20,10,0,799.2,'Guantes replique fútbol','C973018'),('1035139481',68,15,1,4029.35,'Platillo Zildjian','C120482'),('1035198678',14,2,1,2443,'Hotel Cozumel and Resort','C193850'),('1035829354',80,30,1,249,'Bolsa wristlet lisa','C123749'),('1035829520',360,15,1,399,'Pulsera Lombrozo gris acero','C183621'),('1037591660',17,10,0,4886.65,'Reloj negro para caballero','C891048'),('1039481234',30,5,1,4549.35,'Guitalla Electroacústica','C120482'),('103948192',40,5,1,10499.25,'Carriola Britax B-Aquile','C138204'),('1041511248',23,30,1,14381.24,'Máquina de espresso','C361972'),('1041511849',123,50,1,11899.15,'Batidora profesional','C361972'),('1041514819',230,60,1,1954.15,'Máquina de palomitas','C361972'),('1041514851',28,10,1,4236,'Hotel Villa Premiere','C174630'),('1041571348',41,5,0,2762,'Hotel Oceano Palace Beach','C174630'),('1041579374',123,30,1,2443,'Hotel Cozumel and Resort','C174630'),('104295739',78,30,1,239.6,'Camisa a cuadros','C139582'),('104459314',120,20,1,314.3,'Pijama de algodón','C139582'),('1048151575',182,60,1,250,'Lente solar para dama','C938102'),('1048151583',95,30,1,349,'Cinturón liso','C194720'),('1048194738',18,12,1,2499,'Lente solar para dama','C281620'),('1048235920',190,50,1,599,'Bolsa crossbody lisa','C123749'),('1048274027',17,10,0,11899.15,'Batidora profesional','C248261'),('1048294629',54,10,1,899,'Lente para Dji Phantom','C129419'),('1048311581',245,25,0,190,'Bolsa crossbody lisa','C357201'),('1048312857',15,20,1,3399,'Zapatos Rockport','C1462934'),('1048315171',210,50,1,399,'Aretes Additions','C938102'),('1048315352',123,20,0,249,'Bolsa wristlet lisa','C357201'),('1048315720',91,30,1,1299,'Bolsa Satchel','C357201'),('1048345201',17,5,0,9599.25,'Colchón individual Therapedic','C193719'),('1048345682',7,2,1,19816.05,'Box y colchón king size Luxor','C193719'),('1048345927',310,50,1,490,'Eyeshadow Palette Neutral','C816452'),('1048347407',28,10,1,2299,'Tenis lisos','C1462934'),('1048371239',68,10,1,251.37,'Serie de luces Narrative','C192749'),('1048374028',250,50,1,199,'Masajeador Capilar','C193620'),('104839128',25,15,1,2024.25,'Puff Basic Turquesa','C138204'),('1048391391',89,25,0,135.2,'30 de Febrero Ha-Ash','C639201'),('1048391591',94,40,0,299,'Bambineto Sigoto Distroller','C124721'),('1048391950',122,70,1,2849,'Coche a control remoto','C124721'),('1048392058',56,15,1,599,'Camisa casual a rayas','C123413'),('1048395281',92,30,1,149.25,'El Graduado Blue-Ray','C639201'),('1048395810',75,10,1,186.75,'Ernesto y Celestina','C639201'),('1048395839',128,50,1,499,'Muñeca Wonder Woman DC','C124721'),('1048397591',48,10,1,7244.37,'Cómoda Billy Alondra','C139302'),('1048398647',24,10,1,15999.99,'Colchón Inova Col Sognare','C193719'),('1048399989',27,15,1,10076.38,'Reclinable Mecedora La Z','C139302'),('1048514821',59,20,1,419.3,'Chaleco liso','C856391'),('1048592124',158,40,1,399,'Vestido Caramel de algodón','C856391'),('1048592740',48,10,1,599,'Pants a rayas','C856391'),('1049390935',130,25,1,599,'PS4 Madden NFL 17','C837461'),('1049534581',86,20,1,649,'Cobija con diseño gráfico','C631992'),('1049535417',123,40,1,639.2,'Sudadera GAP con logotipo','C631992'),('1049581358',120,50,1,249,'Playera Star Wars','C194720'),('1049581841',124,30,0,314.3,'Pijama de algodón','C194720'),('1049586878',96,20,0,239.6,'Camisa a cuadros','C194720'),('1050047756',115,25,1,1399,'PS4 God Of War','C184729'),('1050047799',0,25,0,1299,'PS4 Days Gone','C184729'),('1051518145',30,20,1,223,'Modern Family','C129482'),('1052962648',60,15,1,1399,'Xbox One S Control Inalámbrico','C837461'),('1053485701',26,15,0,5396.65,'Reloj oxford para caballero','C891048'),('1054832049',89,20,1,3299,'Tenis de piel','C123419'),('1056491731',10,5,1,659,'Once upon a time','C129482'),('1057291237',230,50,1,649,'Cobija con diseño gráfico','C123901'),('1057353532',34,15,1,4549.35,'1039481234','C038102'),('1057385931',45,10,1,4029.35,'Platillo Zildjian','C038102'),('1057391231',19,15,0,1189.3,'Cava Metalart Chica','C192749'),('1057391391',28,10,1,3199,'Armazón unisex','C281620'),('1058234012',57,10,1,7244.37,'Cómoda Billy Alondra','C294791'),('1058341023',84,20,1,149.25,'El Graduado Blue-Ray','C123948'),('105839273',32,10,0,2939.3,'Colecho Prinsel Napper Beige','C138204'),('1058402849',48,20,1,3399,'Zapatos Rockport','C917462'),('1058403940',250,35,1,2079.2,'Lente solar para dama','C192371'),('1058492302',43,25,0,2999,'Chamarra lisa','C123413'),('1058492732',60,25,1,399,'Playera cuello redondo','C123413'),('1058493741',120,30,1,699,'Pantufla Polo Ralph Rauren','C123419'),('1059234012',35,20,1,10076.38,'Reclinable Mecedora La Z','C294791'),('1062424890',0,3,0,6999.99,'Consola Xbox One Minecraft','C186302'),('1063000881',0,15,0,1149,'PS4 WRC 7','C194722'),('1063829175',10,4,1,22499.25,'Caminadora Nordictrack','C123910'),('1063905557',200,30,1,1399,'Xbox One Monster Hunter World','C184729'),('1064044652',55,5,1,9249,'Consola PS4 Slim 1 TB','C186302'),('1064534919',40,10,1,5999,'Consola Nintendo 3DS SNES','C186302'),('1065700049',120,25,1,1099,'PS4 Shadow of the Colossus','C194722'),('1065748301',17,3,1,2762,'Hotel Oceano Palace Beach','C193850'),('1066131706',110,15,1,999,'PSVR The Inpatient','C184729'),('1066504987',95,15,1,899,'Xbox One Metal Gear Survive','C194722'),('1073810572',27,5,1,11474.24,'Campana Electrolux de acero','C193821'),('1073948519',25,5,1,1759.2,'Entrenador de agilidad','C973018'),('1073956201',48,15,0,37332.4,'Pantalla Sony 65 Pulgadas','C129419'),('1074381650',20,5,1,325,'La maldición de los Grace','C123940'),('1074839571',6,2,1,14299.35,'Caminadora Proform 800i','C123910'),('1074928495',20,14,1,1954.15,'Máquina de palomitas','C248261'),('1074930561',64,15,0,146.3,'Lámpara circular para techo','C192749'),('1078391469',35,10,1,186.75,'Ernesto y Celestina','C129472'),('1079461839',49,15,1,135.2,'30 de Febrero Ha-Ash','C129472'),('1083195730',39,15,1,13799,'iPad 9.7 Pulgadas 128GB','C193720'),('1083920164',29,10,1,2399,'Armazón para dama','C281620'),('1084013582',130,20,1,37332.4,'Pantalla Sony 65 Pulgadas','C128492'),('1084513501',19,10,0,149.25,'El Graduado Blue-Ray','C129472'),('1084917482',38,10,1,1295,'El libro de los héroes','C123940'),('1084928572',5,10,1,4236,'Hotel Villa Premiere','C193850'),('1085713401',58,20,1,639.2,'Sudadera GAP con logotipo','C123901'),('1085920572',6,12,0,14381.24,'Máquina de espresso','C248261'),('1094150151',19,9,1,18359.15,'Lavadora 23Kg color Plata','C193821'),('1094153961',85,25,0,3299,'Tenis de piel','C493820'),('1094165876',57,17,0,3299,'Pantufla Polo Ralph Rauren','C493820'),('1094175158',47,10,1,399,'Playera cuello redondo','C192012'),('1094758345',37,20,1,2999,'Chamarra lisa','C192012'),('1094760125',45,15,1,599,'Camisa casual a rayas','C192012'),('1095829573',68,20,1,35999,'Gamer HP Omen AMD','C193720');
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
INSERT INTO `product_price_history` VALUES ('PH13482','2017-09-19 18:44:42',34762,'1095829573'),('PH14819','2017-12-07 18:45:09',218.64,'1094760125'),('PH14829','2018-01-02 18:45:57',1649.92,'1084928572'),('PH34581','2018-01-08 18:47:01',429.83,'1094175158'),('PH52829','2017-08-30 18:46:27',13709.8,'1085920572');
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
  `supplier` varchar(16) DEFAULT NULL,
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
INSERT INTO `purchase_order` VALUES ('PO4391','Pago después de entrega','2018-01-16 20:18:11','Terrestre','RE1324190FA8491','WD8041'),('PO5491','Pago después de entrega','2018-01-10 20:20:57','Aéreo','JOF123489A8134B','WD6590'),('PO5492','Pago antes de entrega','2017-12-25 20:21:55','Terrestre','JAF8391409C1341','WD5931');
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer` int(11) DEFAULT NULL,
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
  `sale` int(11) DEFAULT NULL,
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
  `customer` int(11) DEFAULT NULL,
  `sale` int(11) DEFAULT NULL,
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
INSERT INTO `special_offer` VALUES ('SO12348','1001',3,150),('SO14819','1124',24,0),('SO35911','1002',12,1000),('SO53910','1593',3,0),('SO54821','1001',9,0),('SO58391','1001',6,0);
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
INSERT INTO `supplier` VALUES ('GAA834C13812481','Ropa dama','Calle Margarita 2342 Guadalajara','Ropa mujer Co'),('IIC1348914C1940','Juguetes','Calle Tepic 4910 Zacatlán','Juguetes Mágicos Co'),('JAF8391409C1341','Zapatos','Calle Jacaranda 3419 Puebla','Zapateros Co'),('JOF123489A8134B','Accesorios','Calle Mármol 674 San Martín Texmelucan','Accesorios Co'),('RE1324190FA8491','Ropa hombre','Calle Durazno 492 Veracruz','Ropa varonil Co');
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
INSERT INTO `supplier_price_history` VALUES ('SPH1549','2018-01-01 19:57:52',29842.12,'1095829573','RE1324190FA8491'),('SPH5490','2017-12-25 19:58:42',259.49,'1094760125','IIC1348914C1940'),('SPH5491','2018-01-09 19:59:30',1549.21,'1094758345','JAF8391409C1341');
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
INSERT INTO `warehouse_delivery` VALUES ('WD1549','2018-01-09 20:05:30','B0710'),('WD5465','2018-01-24 20:06:13','B1210'),('WD5490','2018-01-02 20:05:48','B0710'),('WD5659','2018-01-21 20:05:59','B0710'),('WD5931','2018-01-19 20:07:13','B2412'),('WD6590','2018-01-12 20:06:49','B2412'),('WD6592','2017-12-24 20:06:25','B1210'),('WD8041','2018-01-11 20:07:30','B2412');
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

-- Dump completed on 2018-02-03 20:17:46
