-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: perfumelanka
-- ------------------------------------------------------
-- Server version	8.0.35

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

DROP TABLE IF EXISTS admin;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  admin_id int NOT NULL AUTO_INCREMENT,
  username varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (admin_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES admin WRITE;
/*!40000 ALTER TABLE admin DISABLE KEYS */;
/*!40000 ALTER TABLE admin ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS cart;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE cart (
  cart_id int NOT NULL AUTO_INCREMENT,
  cust_id int NOT NULL,
  perfume_id int NOT NULL,
  quantity int NOT NULL,
  PRIMARY KEY (cart_id),
  KEY cust_id (cust_id),
  KEY perfume_id (perfume_id),
  CONSTRAINT cart_ibfk_1 FOREIGN KEY (cust_id) REFERENCES `profile` (cust_id),
  CONSTRAINT cart_ibfk_2 FOREIGN KEY (perfume_id) REFERENCES perfume (perfume_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES cart WRITE;
/*!40000 ALTER TABLE cart DISABLE KEYS */;
/*!40000 ALTER TABLE cart ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS category;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE category (
  category_id int NOT NULL AUTO_INCREMENT,
  category_name varchar(20) NOT NULL,
  admin_id int DEFAULT NULL,
  PRIMARY KEY (category_id),
  KEY admin_id (admin_id),
  CONSTRAINT category_ibfk_1 FOREIGN KEY (admin_id) REFERENCES `admin` (admin_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES category WRITE;
/*!40000 ALTER TABLE category DISABLE KEYS */;
/*!40000 ALTER TABLE category ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_or_debit_card`
--

DROP TABLE IF EXISTS credit_or_debit_card;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE credit_or_debit_card (
  card_no int NOT NULL,
  exp_date date NOT NULL,
  cvv int NOT NULL,
  name_on_card varchar(150) NOT NULL,
  cust_id int DEFAULT NULL,
  PRIMARY KEY (card_no),
  KEY cust_id (cust_id),
  CONSTRAINT credit_or_debit_card_ibfk_1 FOREIGN KEY (cust_id) REFERENCES `profile` (cust_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_or_debit_card`
--

LOCK TABLES credit_or_debit_card WRITE;
/*!40000 ALTER TABLE credit_or_debit_card DISABLE KEYS */;
/*!40000 ALTER TABLE credit_or_debit_card ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS customer_order;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE customer_order (
  order_id int NOT NULL AUTO_INCREMENT,
  quantity int NOT NULL,
  total_amount decimal(12,2) NOT NULL,
  order_date date NOT NULL,
  payment_id int DEFAULT NULL,
  cust_id int DEFAULT NULL,
  admin_id int DEFAULT NULL,
  PRIMARY KEY (order_id),
  KEY cust_id (cust_id),
  KEY payment_id (payment_id),
  KEY admin_id (admin_id),
  CONSTRAINT customer_order_ibfk_1 FOREIGN KEY (cust_id) REFERENCES `profile` (cust_id),
  CONSTRAINT customer_order_ibfk_2 FOREIGN KEY (payment_id) REFERENCES payment (pay_id),
  CONSTRAINT customer_order_ibfk_3 FOREIGN KEY (admin_id) REFERENCES `admin` (admin_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES customer_order WRITE;
/*!40000 ALTER TABLE customer_order DISABLE KEYS */;
/*!40000 ALTER TABLE customer_order ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS payment;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE payment (
  pay_id int NOT NULL AUTO_INCREMENT,
  payment_method varchar(50) DEFAULT NULL,
  total_amount decimal(15,2) DEFAULT NULL,
  cust_id int DEFAULT NULL,
  card_no int DEFAULT NULL,
  PRIMARY KEY (pay_id),
  KEY cust_id (cust_id),
  CONSTRAINT payment_ibfk_1 FOREIGN KEY (cust_id) REFERENCES `profile` (cust_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES payment WRITE;
/*!40000 ALTER TABLE payment DISABLE KEYS */;
/*!40000 ALTER TABLE payment ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfume`
--

DROP TABLE IF EXISTS perfume;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE perfume (
  perfume_id int NOT NULL AUTO_INCREMENT,
  perfume_name varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  price decimal(10,2) NOT NULL,
  quantity_available int NOT NULL,
  image blob NOT NULL,
  category_id int DEFAULT NULL,
  admin_id int DEFAULT NULL,
  PRIMARY KEY (perfume_id),
  KEY category_id (category_id),
  KEY admin_id (admin_id),
  CONSTRAINT perfume_ibfk_1 FOREIGN KEY (category_id) REFERENCES category (category_id),
  CONSTRAINT perfume_ibfk_2 FOREIGN KEY (admin_id) REFERENCES `admin` (admin_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfume`
--

LOCK TABLES perfume WRITE;
/*!40000 ALTER TABLE perfume DISABLE KEYS */;
/*!40000 ALTER TABLE perfume ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfumeorder`
--

DROP TABLE IF EXISTS perfumeorder;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE perfumeorder (
  order_id int NOT NULL,
  perfume_id int NOT NULL,
  quantity int DEFAULT NULL,
  PRIMARY KEY (order_id,perfume_id),
  KEY perfume_id (perfume_id),
  CONSTRAINT perfumeorder_ibfk_1 FOREIGN KEY (order_id) REFERENCES customer_order (order_id),
  CONSTRAINT perfumeorder_ibfk_2 FOREIGN KEY (perfume_id) REFERENCES perfume (perfume_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfumeorder`
--

LOCK TABLES perfumeorder WRITE;
/*!40000 ALTER TABLE perfumeorder DISABLE KEYS */;
/*!40000 ALTER TABLE perfumeorder ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS profile;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  cust_id int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  email varchar(50) NOT NULL,
  AddressLine1 varchar(255) DEFAULT NULL,
  AddressLine2 varchar(255) DEFAULT NULL,
  AdressLine3 varchar(255) DEFAULT NULL,
  phoneNo varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  dob date DEFAULT NULL,
  admin_id int DEFAULT NULL,
  PRIMARY KEY (cust_id),
  KEY admin_id (admin_id),
  CONSTRAINT profile_ibfk_1 FOREIGN KEY (admin_id) REFERENCES `admin` (admin_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES profile WRITE;
/*!40000 ALTER TABLE profile DISABLE KEYS */;
/*!40000 ALTER TABLE profile ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS review;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE review (
  review_id int NOT NULL AUTO_INCREMENT,
  review varchar(255) NOT NULL,
  cust_id int NOT NULL,
  perfume_id int NOT NULL,
  admin_id int DEFAULT NULL,
  PRIMARY KEY (review_id),
  KEY cust_id (cust_id),
  KEY perfume_id (perfume_id),
  KEY admin_id (admin_id),
  CONSTRAINT review_ibfk_1 FOREIGN KEY (cust_id) REFERENCES `profile` (cust_id),
  CONSTRAINT review_ibfk_2 FOREIGN KEY (perfume_id) REFERENCES perfume (perfume_id),
  CONSTRAINT review_ibfk_3 FOREIGN KEY (admin_id) REFERENCES `admin` (admin_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES review WRITE;
/*!40000 ALTER TABLE review DISABLE KEYS */;
/*!40000 ALTER TABLE review ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-29 23:44:59
