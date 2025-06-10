-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: doctor_management
-- ------------------------------------------------------
-- Server version	8.0.42

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
  `Name` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`Admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Siddharth Dyavanapalli','Siddharth.d@medcare.com','Siddharth@123'),(2,'Dakshitha Ancha','Dakshitha.a@medcare.com','Dakshitha!45'),(3,'Joshal Pinto','Joshal.p@medcare.com','Joshal@55'),(4,'Nandan Muruli','Nandan.m@medcare.com','Nandan@22'),(5,'Kiran Raghupathi','Kiran.r@medcare.com','Kiran@789');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `Appointment_id` int NOT NULL AUTO_INCREMENT,
  `Slot` datetime NOT NULL,
  `Patient_id` int DEFAULT NULL,
  `Patient_name` varchar(45) DEFAULT NULL,
  `Visit_description` varchar(400) NOT NULL,
  `doctor_id` int NOT NULL,
  `doctor_name` varchar(45) NOT NULL,
  `Specialist` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`Appointment_id`),
  UNIQUE KEY `Appointment_id_UNIQUE` (`Appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'2025-01-12 00:00:00',20001,NULL,'Routine annual physical examination and general wellness check.',0,'','',''),(2,'2025-02-05 00:00:00',20002,NULL,'Complaints of persistent migraines; advised MRI scan.',0,'','',''),(3,'2025-03-17 00:00:00',20003,NULL,'Consultation for mild fever and fatigue. Advised rest and fluids.',0,'','',''),(4,'2025-04-03 00:00:00',20004,NULL,'Follow-up on chickenpox history; skin sensitivity observed.',0,'','',''),(5,'2025-04-27 00:00:00',20005,NULL,'Blood pressure monitoring and hypertension medication adjustment.',0,'','',''),(6,'2025-05-09 00:00:00',20006,NULL,'Reported skin rash; allergy suspected. Prescribed antihistamines.',0,'','',''),(7,'2025-05-20 00:00:00',20007,NULL,'Gastrointestinal discomfort; discussed IBS management.',0,'','','');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `patient_name` varchar(45) NOT NULL,
  `Insurance_type` varchar(15) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `billing_date` date NOT NULL,
  `doctor_id` int NOT NULL,
  `visit_description` varchar(300) NOT NULL,
  PRIMARY KEY (`bill_id`),
  UNIQUE KEY `bill_id_UNIQUE` (`bill_id`),
  KEY `patient_id_idx` (`patient_id`,`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,20001,'Claire','Public',120.50,'Credit Card','2025-01-12',1,'Routine annual physical examination and general wellness check.'),(2,20002,'Helena_Rossi','No insurance',230.00,'Cash','2025-02-05',3,'Complaints of persistent migraines; advised MRI scan.'),(3,20003,'John Doe','Private',89.99,'Debit Card','2025-03-17',1,'Consultation for mild fever and fatigue. Advised rest and fluids.'),(4,20004,'Alice Smith','Public',150.75,'Debit Card','2025-04-03',2,'Follow-up on chickenpox history; skin sensitivity observed.'),(5,20005,'Bob Johnson','Public',175.20,'Credit Card','2025-04-27',1,'Blood pressure monitoring and hypertension medication adjustment.'),(6,20006,'Emily Davis','Private',98.00,'Cash','2025-05-09',4,'Reported skin rash; allergy suspected. Prescribed antihistamines.'),(7,20007,'Chris Evans','No insurance',210.00,'Credit Card','2025-05-20',3,'Gastrointestinal discomfort; discussed IBS management.');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis` (
  `diagnosis_id` int NOT NULL AUTO_INCREMENT,
  `diagnosis` varchar(400) NOT NULL,
  PRIMARY KEY (`diagnosis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (1,''),(2,''),(3,''),(4,''),(5,''),(6,''),(7,'');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctor_id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `Specialization` varchar(45) NOT NULL,
  `Contact_Number` varchar(45) NOT NULL,
  `Availability` varchar(45) NOT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Dr. Siddharth','Male','General','6309871543','yes'),(2,'Dr. Ross','Male','General','15098640981','Yes'),(3,'Dr. Meghan','Female','Pediatrics','9876543210','yes'),(4,'Dr. Harry','Male','Physiotherapist','9988776655','yes'),(5,'Dr. Frank','Male','Surgeon','9090909090','no'),(6,'Dr. Anjali','Female','Dermatology','9871122334','yes'),(7,'Dr. Karan','Male','Surgeon','9321456789','yes'),(8,'Dr. Jennifer','Female','Therapist','9445566778','no'),(9,'Dr. Carol','Female','Radiology','9556677889','yes'),(10,'Dr. Susan','Female','Gynecologist','9667788990','yes');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication` (
  `medication_id` int NOT NULL,
  `medication_name` varchar(100) NOT NULL,
  `dosage` varchar(45) NOT NULL,
  `frequency` varchar(45) NOT NULL,
  PRIMARY KEY (`medication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES (1,'Paracetamol','500mg','Twice a day'),(2,'Sumatriptan','250mg','Once as needed'),(3,'Cough Syrup','10ml','Thrice a day'),(4,'Cetirizine','5mg','Once daily'),(5,'Amlodipine','5mg','Once daily'),(6,'Hydrocortisone Cream','Apply thin layer','Twice daily'),(7,'Loperamide','2mg','After each loose stool');
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(45) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `Date_of_Birth` date NOT NULL,
  `Contact_Number` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Insurance_type` varchar(30) NOT NULL,
  `doctor_id` int NOT NULL,
  `patient_history` varchar(400) NOT NULL,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `patient_id_UNIQUE` (`patient_id`),
  KEY `Doctor_id_idx` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (20001,'Claire Park','Female','1983-03-09','15699876541','Heidelberg','30001',1,'No medical history'),(20002,'Helena_Rossi','Female','1980-01-19','15598321756','Mannheim','30003',2,'No medical history'),(20003,'John Doe','Male','1990-05-14','9876543210','123 Elm Street, NY','30001',1,'No prior issues'),(20004,'Alice Smith','Female','1985-03-22','9123456780','456 Oak Avenue, CA','30002',2,'Had chickenpox in 2020'),(20005,'Bob Johnson','Male','1978-11-10','9988776655','789 Maple Drive, TX','30001',1,'History of hypertension'),(20006,'Emily Davis','Female','2000-08-30','9001122334','101 Pine Road, FL','30004',4,'Allergic to penicillin'),(20007,'Chris Evans','Male','1992-07-18','8887766554','202 Cedar Blvd, WA','30003',3,'Irritable Bowel Syndrome');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `diagnosis_id` int NOT NULL,
  `prescription_id` int NOT NULL,
  `medication_id` int NOT NULL,
  `appointment_id` int NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Date_Issued` date NOT NULL,
  `Criticality` varchar(45) NOT NULL,
  PRIMARY KEY (`prescription_id`),
  KEY `diagnosis_id_idx` (`diagnosis_id`),
  CONSTRAINT `diagnosis_id` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnosis` (`diagnosis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `Patient_name` varchar(60) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `Contact_number` varchar(15) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`Email`),
  UNIQUE KEY `Contact_number_UNIQUE` (`Contact_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES ('Alice Smith','Female','9123456780','1985-03-22','456 Oak Ave, CA','alice.smith@medcare.com','Alice@1985'),('Bob Johnson','Male','9988776655','1978-11-10','789 Maple Dr, TX','bob.johnson@medcare.com','BobJ@78'),('Chris Evans','Male','8887766554','1992-07-18','202 Cedar Blvd, WA','chris.evans@medcare.com','ChrisE@92'),('Claire Meyer','Female','15699876541','1983-03-09','Heidelberg','claire.meyer@medcare.com','Claire@123'),('Emily Davis','Female','9001122334','2000-08-30','101 Pine Rd, FL','emily.davis@medcare.com','EmilyD#00'),('Helena Rossi','Female','15598321756','1980-01-19','Mannheim','helena.rossi@medcare.com','Helena#80'),('John Doe','Male','9876543210','1990-05-14','123 Elm Street, NY','john.doe@medcare.com','JohnD!90');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` int NOT NULL,
  `room_availability` varchar(45) NOT NULL,
  `room_type` varchar(45) NOT NULL,
  `room_number` varchar(45) NOT NULL,
  `patient_id` int DEFAULT NULL,
  `patient_name` varchar(65) DEFAULT NULL,
  `Check_in` datetime DEFAULT NULL,
  `Check_out` datetime DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (101,'yes','General','G-101',20001,'Claire',NULL,NULL),(102,'yes','Private','P-301',20002,'Helena_Rossi',NULL,NULL),(103,'yes','General','G-102',20003,'John Doe',NULL,NULL),(104,'yes','Semi-Private','SP-201',20004,'Alice Smith',NULL,NULL),(105,'yes','General','G-103',20005,'Bob Johnson',NULL,NULL),(106,'yes','Private','P-302',20006,'Emily Davis',NULL,NULL),(107,'yes','General','G-104',20007,'Chris Evans',NULL,NULL);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_support`
--

DROP TABLE IF EXISTS `staff_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_support` (
  `Staff_id` int NOT NULL,
  `designation` varchar(45) NOT NULL,
  `Staff_name` varchar(45) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `contact_number` varchar(45) NOT NULL,
  `staff_availability` varchar(45) NOT NULL,
  PRIMARY KEY (`Staff_id`),
  UNIQUE KEY `Staff_id_UNIQUE` (`Staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_support`
--

LOCK TABLES `staff_support` WRITE;
/*!40000 ALTER TABLE `staff_support` DISABLE KEYS */;
INSERT INTO `staff_support` VALUES (30001,'Nurse','Clark','Female','1570005686','yes'),(30002,'Nurse','Sara','Female','1569166586','yes'),(30003,'Medical_Assistant','Richard','Male','15985432843','no'),(30004,'Medical_Assistant','Max','Male','14993186343','yes'),(30005,'Medical_Assistant','Caroline','Female','1539760876','yes'),(30006,'Nurse','Stephen','Male','15612832193','no'),(30009,'Billing Clerk','Nina Hartmann','Female','15566772288','no'),(30010,'Janitor','Peter Lange','Male','15599887766','no'),(30011,'Security','Thomas Roth','Male','15588443322','no'),(30012,'Dietician','Laura König','Female','15599001122','yes'),(30013,'IT Support','Daniel Becker','Male','15577665544','yes'),(30014,'Emergency Nurse','Katrin Müller','Female','15566558899','yes'),(30015,'Lab Technician','Lena Weiss','Female','15511223344','yes'),(30016,'Pharmacist','David Schmitt','Male','15566778899','no');
/*!40000 ALTER TABLE `staff_support` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-10 18:16:16
