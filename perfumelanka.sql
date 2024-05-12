-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: perfumelanka
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `Admin_id` int NOT NULL AUTO_INCREMENT,
  `AdminFname` varchar(255) NOT NULL,
  `AdminLname` varchar(255) NOT NULL,
  `AdminEmail` varchar(255) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billinginfo`
--

DROP TABLE IF EXISTS `billinginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billinginfo` (
  `BillingId` int NOT NULL AUTO_INCREMENT,
  `BillingDate` varchar(255) DEFAULT NULL,
  `BillingAddress` varchar(255) DEFAULT NULL,
  `BillPostalCode` int DEFAULT NULL,
  `BillCity` varchar(255) DEFAULT NULL,
  `CreditCardId` int DEFAULT NULL,
  `CustomerId` int DEFAULT NULL,
  PRIMARY KEY (`BillingId`),
  KEY `CreditCardId` (`CreditCardId`),
  KEY `CustomerId` (`CustomerId`),
  CONSTRAINT `billinginfo_ibfk_1` FOREIGN KEY (`CreditCardId`) REFERENCES `creditcard` (`CreditCardId`),
  CONSTRAINT `billinginfo_ibfk_2` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billinginfo`
--

LOCK TABLES `billinginfo` WRITE;
/*!40000 ALTER TABLE `billinginfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `billinginfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `CartId` int NOT NULL AUTO_INCREMENT,
  `NumofProducts` int NOT NULL,
  `Total_Price` decimal(12,2) NOT NULL,
  `Customer_Id` int NOT NULL,
  `product_Id` int NOT NULL,
  PRIMARY KEY (`CartId`,`Customer_Id`,`product_Id`),
  KEY `Customer_Id` (`Customer_Id`),
  KEY `product_Id` (`product_Id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `customer` (`CustomerId`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_Id`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `Category_id` int NOT NULL AUTO_INCREMENT,
  `Category_name` varchar(255) NOT NULL,
  `Category_Description` varchar(255) DEFAULT NULL,
  `image` text,
  `Admin_id` int DEFAULT NULL,
  PRIMARY KEY (`Category_id`),
  KEY `Admin_id` (`Admin_id`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`Admin_id`) REFERENCES `admin` (`Admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcard` (
  `CreditCardId` int NOT NULL AUTO_INCREMENT,
  `CreditCardNo` int NOT NULL,
  `creditCardType` varchar(250) DEFAULT NULL,
  `CardHolderName` varchar(255) NOT NULL,
  `CreditCardCvv` int DEFAULT NULL,
  `ExpDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CreditCardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard`
--

LOCK TABLES `creditcard` WRITE;
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerId` int NOT NULL AUTO_INCREMENT,
  `ContactName` varchar(255) NOT NULL,
  `phoneNumber` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `PostalCode` int NOT NULL,
  `Password` varchar(255) NOT NULL,
  `AdminId` int DEFAULT NULL,
  PRIMARY KEY (`CustomerId`),
  KEY `AdminId` (`AdminId`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`AdminId`) REFERENCES `admin` (`Admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerorder`
--

DROP TABLE IF EXISTS `customerorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerorder` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `OrderDate` varchar(255) DEFAULT NULL,
  `RequiredDate` varchar(255) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `ShippedDate` varchar(255) DEFAULT NULL,
  `ShippingCost` decimal(12,2) DEFAULT NULL,
  `ShipAddress` varchar(255) DEFAULT NULL,
  `ShipPostalCode` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `OrderStatus` tinyint(1) NOT NULL DEFAULT '0',
  `cartId` int DEFAULT NULL,
  `AdminId` int DEFAULT NULL,
  `CustomerId` int DEFAULT NULL,
  `BillingId` int DEFAULT NULL,
  `ShipperId` int DEFAULT NULL,
  `product_Id` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `cartId` (`cartId`),
  KEY `AdminId` (`AdminId`),
  KEY `CustomerId` (`CustomerId`),
  KEY `BillingId` (`BillingId`),
  KEY `ShipperId` (`ShipperId`),
  KEY `product_Id` (`product_Id`),
  CONSTRAINT `customerorder_ibfk_1` FOREIGN KEY (`cartId`) REFERENCES `cart` (`CartId`),
  CONSTRAINT `customerorder_ibfk_2` FOREIGN KEY (`AdminId`) REFERENCES `admin` (`Admin_id`),
  CONSTRAINT `customerorder_ibfk_3` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`),
  CONSTRAINT `customerorder_ibfk_4` FOREIGN KEY (`BillingId`) REFERENCES `billinginfo` (`BillingId`),
  CONSTRAINT `customerorder_ibfk_5` FOREIGN KEY (`ShipperId`) REFERENCES `shipper` (`ShipperId`),
  CONSTRAINT `customerorder_ibfk_6` FOREIGN KEY (`product_Id`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerorder`
--

LOCK TABLES `customerorder` WRITE;
/*!40000 ALTER TABLE `customerorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `Product_Name` varchar(255) NOT NULL,
  `Product_description` varchar(255) NOT NULL,
  `Unit_Price` decimal(12,2) NOT NULL,
  `Unit_weight` decimal(12,2) DEFAULT NULL,
  `UnitsInStock` int DEFAULT NULL,
  `RecorderLevel` int DEFAULT NULL,
  `picture` text NOT NULL,
  `Category_id` int NOT NULL,
  `Admin_id` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `Category_id` (`Category_id`),
  KEY `Admin_id` (`Admin_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Category_id`) REFERENCES `category` (`Category_id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`Admin_id`) REFERENCES `admin` (`Admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipper`
--

DROP TABLE IF EXISTS `shipper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipper` (
  `ShipperId` int NOT NULL AUTO_INCREMENT,
  `Phone` varchar(10) NOT NULL,
  `CompanyName` varchar(255) NOT NULL,
  `AdminId` int DEFAULT NULL,
  PRIMARY KEY (`ShipperId`),
  KEY `AdminId` (`AdminId`),
  CONSTRAINT `shipper_ibfk_1` FOREIGN KEY (`AdminId`) REFERENCES `admin` (`Admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipper`
--

LOCK TABLES `shipper` WRITE;
/*!40000 ALTER TABLE `shipper` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipper` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-12  9:26:15
