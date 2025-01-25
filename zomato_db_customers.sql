-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: zomato_db
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Arjun Mehta','2023-03-10'),(2,'Priya Sharma','2023-04-15'),(3,'Vikram Singh','2023-05-01'),(4,'Ritu Patel','2023-06-05'),(5,'Aman Gupta','2023-07-12'),(6,'Sneha Desai','2023-08-18'),(7,'Rahul Verma','2023-09-05'),(8,'Neha Joshi','2023-10-10'),(9,'Karan Kapoor','2023-11-15'),(10,'Divya Nair','2023-12-20'),(11,'Rohan Iyer','2024-01-02'),(12,'Anjali Saxena','2024-01-08'),(13,'Sameer Khan','2024-01-12'),(14,'Pooja Rao','2024-01-15'),(15,'Nikhil Jain','2024-01-18'),(16,'Aarti Yadav','2024-01-22'),(17,'Manish Kulkarni','2024-01-26'),(18,'Shreya Ghosh','2024-01-30'),(19,'Aakash Dubey','2024-02-02'),(20,'Bhavna Agarwal','2024-02-05'),(21,'Ramesh Chandra','2024-02-08'),(22,'Kavita Malhotra','2024-02-10'),(23,'Ashish Mishra','2024-02-12'),(24,'Megha Sinha','2024-02-15'),(25,'Vishal Bhardwaj','2024-02-18'),(26,'Ravi Sharma','2024-08-01'),(27,'Anita Verma','2024-08-05'),(28,'Sunil Patel','2024-08-10'),(29,'Pooja Gupta','2024-08-12'),(30,'Amit Kumar','2024-08-15'),(31,'Neha Mehta','2024-08-20'),(32,'Rajesh Reddy','2024-08-22'),(33,'Sneha Joshi','2024-08-25');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-25 17:04:20
