-- MySQL dump 10.17  Distrib 10.3.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hotel_manage
-- ------------------------------------------------------
-- Server version	10.3.13-MariaDB-1:10.3.13+maria~bionic-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `customer_id` varchar(10) NOT NULL,
  `service_type` varchar(20) NOT NULL,
  `total_bill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `booking_id` varchar(10) NOT NULL,
  `hotel_id` varchar(10) NOT NULL,
  `room_no` varchar(10) DEFAULT NULL,
  `customer_id` varchar(10) NOT NULL,
  `booking_type` varchar(10) NOT NULL,
  `booking_date` date DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `booking_ibfk_1` (`hotel_id`,`room_no`),
  KEY `booking_ibfk_2` (`customer_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`hotel_id`, `room_no`) REFERENCES `room` (`hotel_id`, `room_no`) ON DELETE CASCADE,
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES ('b001','MI1','1','112','ONLINE','2010-02-02'),('boo2','MI2','1','100','ONLINE','2019-12-02'),('boo5','MI2','1','100','ONLINE','2019-12-02'),('book12','MI1','2','111','online','2019-03-02');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `allot_room` BEFORE INSERT ON `booking` FOR EACH ROW begin 
	update room set occupied='YES' where room.room_no=NEW.room_no;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `room_not_avail` BEFORE INSERT ON `booking` FOR EACH ROW begin 
        declare no_of_room integer;
	select count(occupied) into no_of_room from room where occupied='NO';
	if no_of_room=0 THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT='ERROR:\n\t  room not available';
        end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `vacate_room` BEFORE DELETE ON `booking` FOR EACH ROW begin 
	update room set occupied='NO' where room.room_no=old.room_no;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cab`
--

DROP TABLE IF EXISTS `cab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cab` (
  `customer_id` varchar(10) NOT NULL,
  `cab_type` varchar(20) DEFAULT NULL,
  `booking_date` date NOT NULL,
  `charge_per_distance` int(11) NOT NULL,
  `distance` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`,`booking_date`),
  CONSTRAINT `cab_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cab`
--

LOCK TABLES `cab` WRITE;
/*!40000 ALTER TABLE `cab` DISABLE KEYS */;
/*!40000 ALTER TABLE `cab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` varchar(10) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `customer_mobile` varchar(12) NOT NULL,
  `customer_email` varchar(40) NOT NULL,
  `customer_address` varchar(50) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('100','Shstri Mitra','9087654321','sas@gmail.com','Delhi',NULL),('101','Win Jones','8087654321','win@gmail.com','New York',NULL),('102','Sar Triumph','9087652321','sar@gmail.com','USA',NULL),('103','Donald','9787654321','don@gmail.com','Hyderabad',NULL),('104','Sasi Mehere','9987654321','sasi@gmail.com','New Delhi',NULL),('105','UVS reddy','9089654321','uvr@gmail.com','Telengana',NULL),('106','Navneet TV','9087654320','nav@gmail.com','Chennai',NULL),('107','Randej Raj','9097654321','raj@gmail.com','Hyderabad',NULL),('108','Laxmi Narayan','9087954321','lr@gmail.com','Goa',NULL),('109','SVX Krishanan','9097654321','sv@gmail.com','Ooty',NULL),('110','Santosh Sahu','9087687321','san@gmail.com','Bhubaneswar',NULL),('111','Ram Kumar','9000654321','ram@gmail.com','Ranchi',NULL),('112','Tarrak Das','9087657651','tar@gmail.com','Kolkata',NULL),('sachin239','sachin hansda','1234567890','sac@gmail.com','jamshedpur','sachin239');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `emp_id` varchar(10) NOT NULL,
  `hotel_id` varchar(10) NOT NULL,
  `emp_name` varchar(20) NOT NULL,
  `emp_contact` varchar(12) NOT NULL,
  `emp_salary` varchar(10) NOT NULL,
  `emp_address` varchar(50) NOT NULL,
  `emp_role` varchar(100) NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `employee_ibfk_1` (`hotel_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facility` (
  `facility_id` varchar(10) NOT NULL,
  `facility_name` varchar(20) NOT NULL,
  `facility_type` varchar(20) NOT NULL,
  `facility_desc` varchar(100) NOT NULL,
  `hotel_id` varchar(10) NOT NULL,
  PRIMARY KEY (`facility_id`,`hotel_id`),
  KEY `hotel_ibfk_1` (`hotel_id`),
  CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES ('f1','wifi','room facility','customer can use wifi in hotel area','BBS1'),('f1','wifi','room facility','customer can use wifi in hotel area','BBS2'),('f1','wifi','room facility','customer can use wifi in hotel area','BBS3'),('f1','wifi','room facility','customer can use wifi in hotel area','BBS4'),('f1','wifi','room facility','customer can use wifi in hotel area','BBS5'),('f1','wifi','room facility','customer can use wifi in hotel area','GO1'),('f1','wifi','room facility','customer can use wifi in hotel area','GO2'),('f1','wifi','room facility','customer can use wifi in hotel area','GO3'),('f1','wifi','room facility','customer can use wifi in hotel area','GO4'),('f1','wifi','room facility','customer can use wifi in hotel area','GO5'),('f1','wifi','room facility','customer can use wifi in hotel area','HDB1'),('f1','wifi','room facility','customer can use wifi in hotel area','HDB2'),('f1','wifi','room facility','customer can use wifi in hotel area','HDB3'),('f1','wifi','room facility','customer can use wifi in hotel area','HDB4'),('f1','wifi','room facility','customer can use wifi in hotel area','HDB5'),('f1','wifi','room facility','customer can use wifi in hotel area','KKR1'),('f1','wifi','room facility','customer can use wifi in hotel area','KKR2'),('f1','wifi','room facility','customer can use wifi in hotel area','KKR3'),('f1','wifi','room facility','customer can use wifi in hotel area','KKR4'),('f1','wifi','room facility','customer can use wifi in hotel area','KKR5'),('f1','wifi','room facility','customer can use wifi in hotel area','MI1'),('f1','wifi','room facility','customer can use wifi in hotel area','MI2'),('f1','wifi','room facility','customer can use wifi in hotel area','MI3'),('f1','wifi','room facility','customer can use wifi in hotel area','MI4'),('f1','wifi','room facility','customer can use wifi in hotel area','MI5'),('f2','wifi','room facility','customer can get room service on request','BBS1'),('f2','wifi','room facility','customer can get room service on request','BBS2'),('f2','wifi','room facility','customer can get room service on request','BBS3'),('f2','wifi','room facility','customer can get room service on request','BBS4'),('f2','wifi','room facility','customer can get room service on request','BBS5'),('f2','wifi','room facility','customer can get room service on request','GO1'),('f2','wifi','room facility','customer can get room service on request','GO2'),('f2','wifi','room facility','customer can get room service on request','GO3'),('f2','wifi','room facility','customer can get room service on request','GO4'),('f2','wifi','room facility','customer can get room service on request','GO5'),('f2','wifi','room facility','customer can get room service on request','HDB1'),('f2','wifi','room facility','customer can get room service on request','HDB2'),('f2','wifi','room facility','customer can get room service on request','HDB3'),('f2','wifi','room facility','customer can get room service on request','HDB4'),('f2','wifi','room facility','customer can get room service on request','HDB5'),('f2','wifi','room facility','customer can get room service on request','KKR1'),('f2','wifi','room facility','customer can get room service on request','KKR2'),('f2','wifi','room facility','customer can get room service on request','KKR3'),('f2','wifi','room facility','customer can get room service on request','KKR4'),('f2','wifi','room facility','customer can get room service on request','KKR5'),('f2','wifi','room facility','customer can get room service on request','MI1'),('f2','wifi','room facility','customer can get room service on request','MI2'),('f2','wifi','room facility','customer can get room service on request','MI3'),('f2','wifi','room facility','customer can get room service on request','MI4'),('f2','wifi','room facility','customer can get room service on request','MI5'),('f3','swiming pool','outdoor facility','customer can use swiming pool','BBS1'),('f3','swiming pool','outdoor facility','customer can use swiming pool','BBS2'),('f3','swiming pool','outdoor facility','customer can use swiming pool','BBS3'),('f3','swiming pool','outdoor facility','customer can use swiming pool','BBS5'),('f3','swiming pool','outdoor facility','customer can use swiming pool','GO1'),('f3','swiming pool','outdoor facility','customer can use swiming pool','GO2'),('f3','swiming pool','outdoor facility','customer can use swiming pool','GO3'),('f3','swiming pool','outdoor facility','customer can use swiming pool','GO4'),('f3','swiming pool','outdoor facility','customer can use swiming pool','GO5'),('f3','swiming pool','outdoor facility','customer can use swiming pool','HDB1'),('f3','swiming pool','outdoor facility','customer can use swiming pool','HDB2'),('f3','swiming pool','outdoor facility','customer can use swiming pool','HDB3'),('f3','swiming pool','outdoor facility','customer can use swiming pool','HDB4'),('f3','swiming pool','outdoor facility','customer can use swiming pool','HDB5'),('f3','swiming pool','outdoor facility','customer can use swiming pool','KKR1'),('f3','swiming pool','outdoor facility','customer can use swiming pool','KKR2'),('f3','swiming pool','outdoor facility','customer can use swiming pool','KKR3'),('f3','swiming pool','outdoor facility','customer can use swiming pool','KKR4'),('f3','swiming pool','outdoor facility','customer can use swiming pool','KKR5'),('f3','swiming pool','outdoor facility','customer can use swiming pool','MI1'),('f3','swiming pool','outdoor facility','customer can use swiming pool','MI2'),('f3','swiming pool','outdoor facility','customer can use swiming pool','MI3'),('f3','swiming pool','outdoor facility','customer can use swiming pool','MI4'),('f3','swiming pool','outdoor facility','customer can use swiming pool','MI5'),('f4','laundry','outdoor facility','customer can get laundry service on request','BBS1'),('f4','laundry','outdoor facility','customer can get laundry service on request','BBS2'),('f4','laundry','outdoor facility','customer can get laundry service on request','BBS3'),('f4','laundry','outdoor facility','customer can get laundry service on request','BBS4'),('f4','laundry','outdoor facility','customer can get laundry service on request','BBS5'),('f4','laundry','outdoor facility','customer can get laundry service on request','GO1'),('f4','laundry','outdoor facility','customer can get laundry service on request','GO2'),('f4','laundry','outdoor facility','customer can get laundry service on request','GO3'),('f4','laundry','outdoor facility','customer can get laundry service on request','GO4'),('f4','laundry','outdoor facility','customer can get laundry service on request','GO5'),('f4','laundry','outdoor facility','customer can get laundry service on request','HDB1'),('f4','laundry','outdoor facility','customer can get laundry service on request','HDB2'),('f4','laundry','outdoor facility','customer can get laundry service on request','HDB3'),('f4','laundry','outdoor facility','customer can get laundry service on request','HDB4'),('f4','laundry','outdoor facility','customer can get laundry service on request','HDB5'),('f4','laundry','outdoor facility','customer can get laundry service on request','KKR1'),('f4','laundry','outdoor facility','customer can get laundry service on request','KKR2'),('f4','laundry','outdoor facility','customer can get laundry service on request','KKR3'),('f4','laundry','outdoor facility','customer can get laundry service on request','KKR4'),('f4','laundry','outdoor facility','customer can get laundry service on request','KKR5'),('f4','laundry','outdoor facility','customer can get laundry service on request','MI1'),('f4','laundry','outdoor facility','customer can get laundry service on request','MI2'),('f4','laundry','outdoor facility','customer can get laundry service on request','MI3'),('f4','laundry','outdoor facility','customer can get laundry service on request','MI4'),('f4','laundry','outdoor facility','customer can get laundry service on request','MI5');
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_back`
--

DROP TABLE IF EXISTS `feed_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_back` (
  `customer_id` varchar(10) NOT NULL,
  `hotel_id` varchar(10) DEFAULT NULL,
  `feed_back_date` varchar(12) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`feed_back_date`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `feed_back_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `feed_back_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_back`
--

LOCK TABLES `feed_back` WRITE;
/*!40000 ALTER TABLE `feed_back` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_back` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_order`
--

DROP TABLE IF EXISTS `food_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_order` (
  `food_service_id` varchar(20) NOT NULL,
  `food` varchar(30) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`food_service_id`,`food`),
  CONSTRAINT `food_order_ibfk_1` FOREIGN KEY (`food_service_id`) REFERENCES `food_service` (`food_service_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_order`
--

LOCK TABLES `food_order` WRITE;
/*!40000 ALTER TABLE `food_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_service`
--

DROP TABLE IF EXISTS `food_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_service` (
  `customer_id` varchar(10) NOT NULL,
  `food_service_id` varchar(20) NOT NULL,
  `time_date` datetime NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`food_service_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `food_service_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_service`
--

LOCK TABLES `food_service` WRITE;
/*!40000 ALTER TABLE `food_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `hotel_id` varchar(10) NOT NULL,
  `hotel_name` varchar(50) NOT NULL,
  `hotel_desc` varchar(100) NOT NULL,
  `hotel_city` varchar(20) NOT NULL,
  `hotel_addres` varchar(100) NOT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES ('BBS1','Hotel Vintage Villa','5 STAR','Bhubaneswar','Jaydev Vihar'),('BBS2','Empires Hotel Bhubaneswar','5 STAR','Bhubaneswar','Vani Vihar'),('BBS3','The Crown','2 STAR','Bhubaneswar','Achar Vihar'),('BBS4','Hotel Bengal Tiger','3 STAR','Bhubaneswar','KIIT,Nandan kanan road'),('BBS5','Pal Heights','5 STAR','Bhubaneswar','Kalinga Nagar'),('GO1','The Sea Horse Resort','5 STAR','Goa','Baga Area'),('GO2','Goat Continental','5 STAR','Goa','Baga North'),('GO3','Stonewood Resort','5 STAR','Goa','Vasco'),('GO4','The Tourist','3 STAR','Goa','Anjura Area'),('GO5','Hotel Trip','2 STAR','Goa','Candolin Area'),('HDB1','Hotel Mint OTM','5 STAR','Hyderabad','Gchibowli'),('HDB2','Hotel Hyderabadi','5 STAR','Hyderabad','Kantipuram'),('HDB3','Titan Hotel','5 STAR','Hyderabad','Kamalaxmipur'),('HDB4','Prince Hotel','2 STAR','Hyderabad','North-hbd'),('HDB5','Tiger Hotel','5 STAR','Hyderabad','Vijag road'),('KKR1','Taj Bengal','5 STAR','Kolkata','Jorasanko Thakurbari'),('KKR2','Hotel West','5 STAR','Kolkata','Town Hall.'),('KKR3','Park Palace Hotel','5 STAR','Kolkata','Victoria Memorial Hall'),('KKR4','Basera Guest House','5 STAR','Kolkata','Museum Road'),('KKR5','Innra Guest House','5 STAR','Kolkata','St. Pauls Cathedral Church'),('MI1','Hotel Taj','5 STAR','Mumbai','Powai'),('MI2','Hotel Ganga','5 STAR','Mumbai','Santcruz'),('MI3','Alfa International','5 STAR','Mumbai','Airport road'),('MI4','ITC Maratha','5 STAR','Mumbai','Andheri west'),('MI5','Airport International','5 STAR','Mumbai','Adhrei east');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `payment_id` varchar(10) NOT NULL,
  `booking_id` varchar(10) NOT NULL,
  `payment_date` datetime NOT NULL,
  `payment_amount` decimal(8,0) NOT NULL,
  `payment_desc` varchar(100) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `payment_ibfk_1` (`booking_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `customer_id` varchar(10) NOT NULL,
  `hotel_id` varchar(10) NOT NULL,
  `room_type` varchar(10) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`customer_id`,`hotel_id`,`room_type`,`start_date`,`end_date`),
  KEY `res_hot` (`hotel_id`),
  CONSTRAINT `res_cust` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `res_hot` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `room_no` varchar(5) NOT NULL,
  `hotel_id` varchar(10) NOT NULL,
  `facility_id` varchar(10) NOT NULL,
  `room_type` varchar(10) NOT NULL,
  `room_rent` varchar(10) NOT NULL,
  `room_desc` varchar(100) NOT NULL,
  `occupied` varchar(3) NOT NULL,
  PRIMARY KEY (`hotel_id`,`room_no`),
  KEY `room_ibfk_2` (`facility_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE,
  CONSTRAINT `room_ibfk_2` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('1','BBS1','f1','1 bedded','2000','ac','YES'),('1','BBS2','f1','1 bedded','2000','ac','YES'),('1','BBS3','f1','1 bedded','2000','ac','YES'),('3','BBS3','f2','2 bedded','2000','ac','NO'),('1','BBS4','f1','1 bedded','2000','ac','YES'),('3','BBS4','f2','1 bedded','2000','ac','NO'),('1','BBS5','f1','1 bedded','2000','ac','YES'),('1','GO1','f1','1 bedded','2000','ac','YES'),('2','GO1','f1','2 bedded','2000','ac','YES'),('3','GO1','f1','2 bedded','2000','ac','NO'),('3','GO2','f2','2 bedded','2000','ac','NO'),('1','HDB1','f2','2 bedded','2000','ac','YES'),('2','HDB1','f2','2 bedded','2000','ac','YES'),('3','HDB1','f2','2 bedded','2000','ac','NO'),('3','HDB2','f2','2 bedded','2000','ac','NO'),('3','HDB3','f2','2 bedded','2000','ac','NO'),('1','MI1','f1','2 bedded','2000','NON AC','YES'),('2','MI1','f1','2 bedded','2000','NON AC','YES'),('3','MI1','f1','1 bedded','2000','NON AC','NO'),('1','MI2','f2','1 bedded','2000','ac','YES'),('2','MI2','f2','1 bedded','2000','ac','YES'),('3','MI2','f2','1 bedded','2000','ac','NO'),('5','MI2','f3','2 bedded','2000','ac','NO'),('2','MI3','f2','1 bedded','2000','ac','YES'),('3','MI3','f2','1 bedded','2000','ac','NO'),('5','MI3','f3','2 bedded','2000','ac','NO'),('3','MI4','f2','1 bedded','2000','ac','NO');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stays`
--

DROP TABLE IF EXISTS `stays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stays` (
  `customer_id` varchar(10) NOT NULL,
  `check_in` datetime NOT NULL,
  `check_out` date NOT NULL,
  `hotel_id` varchar(10) NOT NULL,
  `room_no` varchar(10) NOT NULL,
  PRIMARY KEY (`customer_id`,`check_in`,`check_out`,`hotel_id`,`room_no`),
  KEY `stays_ibfk_1` (`hotel_id`,`room_no`),
  CONSTRAINT `stays_ibfk_1` FOREIGN KEY (`hotel_id`, `room_no`) REFERENCES `room` (`hotel_id`, `room_no`) ON DELETE CASCADE,
  CONSTRAINT `stays_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stays`
--

LOCK TABLES `stays` WRITE;
/*!40000 ALTER TABLE `stays` DISABLE KEYS */;
/*!40000 ALTER TABLE `stays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_rent`
--

DROP TABLE IF EXISTS `vehicle_rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_rent` (
  `customer_id` varchar(10) NOT NULL,
  `time_date` datetime NOT NULL,
  `vechicle_type` varchar(20) NOT NULL,
  `vehicle_num` varchar(20) NOT NULL,
  `charge_per_hour` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`,`time_date`),
  CONSTRAINT `vehicle_rent_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_rent`
--

LOCK TABLES `vehicle_rent` WRITE;
/*!40000 ALTER TABLE `vehicle_rent` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_rent` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-01 11:43:18
