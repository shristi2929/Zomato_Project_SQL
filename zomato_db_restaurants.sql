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
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `restaurant_id` int NOT NULL,
  `restaurant_name` varchar(100) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `opening_hours` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'The Bombay Canteen','Mumbai','10:00 AM - 11:00 PM'),(2,'Leopold Cafe','Mumbai','9:00 AM - 12:00 AM'),(3,'Bademiya','Mumbai','6:00 PM - 3:00 AM'),(4,'Ziya','Mumbai','12:00 PM - 11:00 PM'),(5,'Gajalee','Mumbai','11:00 AM - 11:00 PM'),(6,'Masala Library','Mumbai','12:00 PM - 3:00 PM, 7:00 PM - 11:00 PM'),(7,'Mahesh Lunch Home','Mumbai','11:30 AM - 11:45 PM'),(8,'Yauatcha','Mumbai','12:00 PM - 12:00 AM'),(9,'Britannia & Co.','Mumbai','12:00 PM - 4:00 PM'),(10,'Indigo','Mumbai','12:00 PM - 3:30 PM, 7:00 PM - 11:45 PM'),(11,'Indian Accent','Delhi','12:00 PM - 2:30 PM, 7:00 PM - 10:30 PM'),(12,'Karimâ€™s','Delhi','9:00 AM - 12:00 AM'),(13,'Bukhara','Delhi','12:30 PM - 2:45 PM, 7:00 PM - 11:45 PM'),(14,'Moti Mahal','Delhi','12:00 PM - 11:30 PM'),(15,'SodaBottleOpenerWala','Delhi','11:00 AM - 11:30 PM'),(16,'Gulati','Delhi','11:30 AM - 11:30 PM'),(17,'Saravana Bhavan','Delhi','8:00 AM - 10:00 PM'),(18,'The Big Chill Cafe','Delhi','11:00 AM - 11:00 PM'),(19,'Farzi Cafe','Delhi','12:00 PM - 11:45 PM'),(20,'Lodi - The Garden Restaurant','Delhi','12:00 PM - 12:00 AM'),(21,'Perch Wine & Coffee Bar','Delhi','11:00 AM - 11:00 PM'),(22,'Diggin','Delhi','11:00 AM - 11:00 PM'),(23,'Cafe Delhi Heights','Delhi','11:00 AM - 12:00 AM'),(24,'Olive Bar & Kitchen','Delhi','12:30 PM - 3:30 PM, 7:30 PM - 12:30 AM'),(25,'Imly','Delhi','11:00 AM - 11:00 PM'),(26,'Sagar Ratna','Delhi','7:00 AM - 11:00 PM'),(27,'Punjabi By Nature','Delhi','12:00 PM - 12:00 AM'),(28,'MTR','Bengaluru','6:30 AM - 11:00 AM, 12:30 PM - 8:30 PM'),(29,'Toit','Bengaluru','12:00 PM - 11:30 PM'),(30,'Koshyâ€™s','Bengaluru','9:00 AM - 11:00 PM'),(31,'Vidyarthi Bhavan','Bengaluru','6:30 AM - 11:30 AM, 2:30 PM - 8:00 PM'),(32,'The Only Place','Bengaluru','12:00 PM - 3:00 PM, 7:00 PM - 11:00 PM'),(33,'Truffles','Bengaluru','11:00 AM - 11:00 PM'),(34,'Empire Restaurant','Bengaluru','11:00 AM - 1:00 AM'),(35,'Corner House','Bengaluru','11:00 AM - 11:30 PM'),(36,'The 13th Floor','Bengaluru','12:00 PM - 11:00 PM'),(37,'The Fatty Bao','Bengaluru','12:00 PM - 11:00 PM'),(38,'Windmills Craftworks','Bengaluru','12:00 PM - 11:30 PM'),(39,'The Oberoi','Bengaluru','12:00 PM - 11:00 PM'),(40,'Ebony','Bengaluru','12:30 PM - 3:30 PM, 7:00 PM - 11:00 PM'),(41,'Meghana Foods','Bengaluru','12:00 PM - 11:00 PM'),(42,'Brahminâ€™s Coffee Bar','Bengaluru','6:00 AM - 12:00 PM'),(43,'Nagarjuna','Bengaluru','12:00 PM - 11:00 PM'),(44,'The Hole in the Wall Cafe','Bengaluru','8:00 AM - 3:00 PM'),(45,'Lazy Suzy','Bengaluru','10:00 AM - 11:00 PM'),(46,'Fava','Bengaluru','12:00 PM - 12:00 AM'),(47,'Toit Brewery','Bengaluru','12:00 PM - 11:30 PM'),(48,'Paradise Biryani','Hyderabad','11:00 AM - 11:00 PM'),(49,'Bawarchi','Hyderabad','11:00 AM - 11:00 PM'),(50,'Shah Ghouse','Hyderabad','5:00 AM - 12:00 AM'),(51,'Ohriâ€™s Jiva Imperia','Hyderabad','12:00 PM - 3:00 PM, 7:00 PM - 11:00 PM'),(52,'The Spicy Venue','Hyderabad','12:00 PM - 3:30 PM, 7:00 PM - 11:00 PM'),(53,'Cafe Bahar','Hyderabad','10:30 AM - 11:00 PM'),(54,'Almond House','Hyderabad','9:00 AM - 10:00 PM'),(55,'Murugan Idli Shop','Chennai','6:00 AM - 11:00 PM'),(56,'Dindigul Thalappakatti','Chennai','11:00 AM - 11:00 PM'),(57,'Dakshin','Chennai','12:00 PM - 3:00 PM, 7:00 PM - 11:00 PM'),(58,'Peshawri','Chennai','12:00 PM - 3:00 PM, 7:00 PM - 11:00 PM'),(59,'Mathsya','Chennai','8:00 AM - 11:00 PM'),(60,'Annalakshmi','Chennai','12:00 PM - 3:00 PM, 7:00 PM - 11:00 PM'),(61,'Hot Chips','Chennai','8:00 AM - 11:00 PM'),(62,'Tandoori Delight','Mumbai','10:00 AM - 11:00 PM'),(63,'Curry Palace','Delhi','11:00 AM - 10:00 PM'),(64,'Royal Biryani','Bangalore','12:00 PM - 10:00 PM'),(65,'Spice Haven','Hyderabad','10:30 AM - 10:30 PM'),(66,'Masala Magic','Chennai','11:00 AM - 11:00 PM'),(67,'Punjabi Dhaba','Amritsar','09:00 AM - 10:00 PM'),(68,'Kebab King','Kolkata','11:00 AM - 09:00 PM'),(69,'Chaat Junction','Jaipur','10:00 AM - 10:00 PM'),(70,'Samosa Street','Pune','12:00 PM - 09:00 PM'),(71,'Biryani House','Ahmedabad','11:00 AM - 11:00 PM');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
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
