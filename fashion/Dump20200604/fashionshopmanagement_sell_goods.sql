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
-- Table structure for table `sell_goods`
--

DROP TABLE IF EXISTS `sell_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sell_goods` (
  `MaHD` varchar(15) NOT NULL,
  `MaKH` varchar(15) DEFAULT NULL,
  `MaHang` varchar(15) DEFAULT NULL,
  `SoLuong` int DEFAULT NULL,
  `NgayLap` date DEFAULT NULL,
  PRIMARY KEY (`MaHD`),
  KEY `fk_donhang_khachhang_idx` (`MaKH`),
  KEY `fk_donhang_hang_idx` (`MaHang`),
  CONSTRAINT `fk_donhang_hang` FOREIGN KEY (`MaHang`) REFERENCES `goods` (`Id`),
  CONSTRAINT `fk_donhang_khachhang` FOREIGN KEY (`MaKH`) REFERENCES `customer_db` (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell_goods`
--

LOCK TABLES `sell_goods` WRITE;
/*!40000 ALTER TABLE `sell_goods` DISABLE KEYS */;
INSERT INTO `sell_goods` VALUES ('HD_001','KH_001','H_001',2,'2020-06-01'),('HD_002','KH_002','H_002',3,'2020-06-01'),('HD_003','KH_001','H_005',1,'2020-06-01'),('HD_004','KH_003','H_004',2,'2020-06-01'),('HD_005','KH_004','H_004',2,'2020-06-01');
/*!40000 ALTER TABLE `sell_goods` ENABLE KEYS */;
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
