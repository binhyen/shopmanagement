-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: fashionshopmanagement
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `customer_db`
--

DROP TABLE IF EXISTS `customer_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_db` (
  `MaKH` varchar(15) NOT NULL,
  `HoTen` varchar(45) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `DiaChi` varchar(45) DEFAULT NULL,
  `GioiTinh` varchar(5) DEFAULT NULL,
  `SDT` bigint DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Diem` int DEFAULT NULL,
  `CapBac` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_db`
--

LOCK TABLES `customer_db` WRITE;
/*!40000 ALTER TABLE `customer_db` DISABLE KEYS */;
INSERT INTO `customer_db` VALUES ('KH_001','Phan Nhan','1990-01-15','Da Nang','Nam',1682654842,'asdasdasd@gmail.com',0,'none'),('KH_002','Nguyen An','1995-06-10','Quang Nam','Nam',123456789,'ewdwd',1000,'VIP'),('KH_003','Tran Thi B','1996-01-12','Quang Ngai','Nu',123456789,'wdsa',1200,'VIP'),('KH_004','Tran Van C','1985-06-05','Ha Noi','Nam',213355948,'dasdas',200,'BT'),('KH_005','Phan D','1970-01-02','Hai Phong','Nu',123456789,'dasdas',200,'BT'),('KH_006','Le Thi Thu G','1985-06-05','Ha Noi','Nu',123456789,'dasdas',200,'BT'),('KH_007','Vo H','1985-06-05','Ha Noi','Nam',123456789,'dasdas',200,'BT'),('KH_008','Truong Thi K','1985-06-05','Ha Noi','Nu',123456789,'dasdas',200,'BT');
/*!40000 ALTER TABLE `customer_db` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-04 15:14:22
