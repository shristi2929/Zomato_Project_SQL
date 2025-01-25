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
-- Table structure for table `riders`
--

DROP TABLE IF EXISTS `riders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riders` (
  `rider_id` int NOT NULL,
  `rider_name` varchar(100) NOT NULL,
  `sign_up` date DEFAULT NULL,
  PRIMARY KEY (`rider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riders`
--

LOCK TABLES `riders` WRITE;
/*!40000 ALTER TABLE `riders` DISABLE KEYS */;
INSERT INTO `riders` VALUES (1,'Ravi Kumar','2023-01-05'),(2,'Anil Singh','2023-02-10'),(3,'Sunil Yadav','2023-03-12'),(4,'Ramesh Verma','2023-04-15'),(5,'Amit Patel','2023-05-18'),(6,'Suresh Reddy','2023-06-20'),(7,'Mahesh Gupta','2023-07-22'),(8,'Pankaj Sharma','2023-08-25'),(9,'Rohit Mehra','2023-09-05'),(10,'Arvind Joshi','2023-10-10'),(11,'Sandeep Rao','2023-11-15'),(12,'Deepak Choudhary','2023-12-01'),(13,'Manoj Tiwari','2023-01-25'),(14,'Siddharth Jain','2023-02-28'),(15,'Vinay Dubey','2023-03-22'),(16,'Ashok Malhotra','2023-04-30'),(17,'Ravi Ranjan','2023-05-15'),(18,'Naveen Nair','2023-06-05'),(19,'Pawan Kumar','2023-07-12'),(20,'Karthik Iyer','2023-08-08'),(21,'Rajesh Shukla','2023-09-17'),(22,'Gopal Das','2023-10-21'),(23,'Lokesh Agrawal','2023-11-28'),(24,'Vikas Anand','2024-01-05'),(25,'Mukesh Chandra','2024-01-12'),(26,'Rahul Bhatia','2024-02-01'),(27,'Sahil Khan','2024-02-08'),(28,'Vijay Singh','2024-02-15'),(29,'Amit Singh','2024-07-15'),(30,'Kiran Desai','2024-07-20'),(31,'Vikram Sharma','2024-07-25'),(32,'Nisha Patel','2024-07-28'),(33,'Raj Kumar','2024-08-01'),(34,'Sanjay Kumar','2024-08-05');
/*!40000 ALTER TABLE `riders` ENABLE KEYS */;
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
