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
  `designation` varchar(45) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`Admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Maria Klein','Nurse','mklein_admin','Nurse@123','maria.klein@medcare.com'),(2,'Tom Berger','Receptionist','tberger_admin','Reception!45','tom.berger@medcare.com'),(3,'Dr. Siddharth','General Physician','siddharth_gp','Siddharth@55','dr.siddharth@medcare.com'),(4,'Dr. Sophie Braun','Radiologist','sophie_radiology','SophieR@22','sophie.braun@medcare.com'),(5,'Nina Hartmann','Billing Clerk','nhartmann_admin','Billing@789','nina.hartmann@medcare.com'),(6,'Peter Lange','Janitor','plange_admin','CleanItUp@99','peter.lange@medcare.com'),(7,'David Schmitt','Pharmacist','dschmitt_admin','Pharma#88','david.schmitt@medcare.com'),(8,'Lena Weiss','Lab Technician','lweiss_admin','Lab123!','lena.weiss@medcare.com');
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
INSERT INTO `bill` VALUES (1,20001,'Claire','Yes',120.50,'Credit Card','2025-01-12',1,'Routine annual physical examination and general wellness check.'),(2,20002,'Helena_Rossi','No',230.00,'Cash','2025-02-05',3,'Complaints of persistent migraines; advised MRI scan.'),(3,20003,'John Doe','Yes',89.99,'Debit Card','2025-03-17',1,'Consultation for mild fever and fatigue. Advised rest and fluids.'),(4,20004,'Alice Smith','Yes',150.75,'Insurance','2025-04-03',2,'Follow-up on chickenpox history; skin sensitivity observed.'),(5,20005,'Bob Johnson','Yes',175.20,'Credit Card','2025-04-27',1,'Blood pressure monitoring and hypertension medication adjustment.'),(6,20006,'Emily Davis','No',98.00,'Cash','2025-05-09',4,'Reported skin rash; allergy suspected. Prescribed antihistamines.'),(7,20007,'Chris Evans','Yes',210.00,'Insurance','2025-05-20',3,'Gastrointestinal discomfort; discussed IBS management.'),(90001,20002,'Helena_Rossi','yes',55.98,'Cash','2025-03-25',2,'Heart problem'),(90002,20001,'Claire','yes',15.43,'Card','2025-04-15',1,'\'Have a severe cold and headache..');
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
  `Criticality` varchar(45) NOT NULL,
  PRIMARY KEY (`diagnosis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (1,'',''),(2,'',''),(3,'',''),(4,'',''),(5,'',''),(6,'',''),(7,'','');
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
INSERT INTO `doctor` VALUES (1,'Dr. Siddharth','','General','6309871543','yes'),(2,'Dr. Ross','','Orthopedics','15098640981','Yes'),(3,'Dr. Meghan','','Pediatrics','9876543210','yes'),(4,'Dr. Harry','','Cardiology','9988776655','yes'),(5,'Dr. Frank','','Neurology','9090909090','no'),(6,'Dr. Anjali','','Dermatology','9871122334','yes'),(7,'Dr. Karan','','ENT','9321456789','yes'),(8,'Dr. Jennifer','','Psychiatry','9445566778','no'),(9,'Dr. Carol','','Radiology','9556677889','yes'),(10,'Dr. Susan','','Oncology','9667788990','yes');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication` (
  `diagnosis_id` int NOT NULL,
  `medication_name` varchar(45) NOT NULL,
  `dosage` varchar(45) NOT NULL,
  `frequency` varchar(45) NOT NULL,
  `Date_Issued` date DEFAULT NULL,
  PRIMARY KEY (`medication_name`),
  KEY `diagnosis_id_idx` (`diagnosis_id`),
  CONSTRAINT `diagnosis_id` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnosis` (`diagnosis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES (5,'Amlodipine','5mg','Once daily',NULL),(4,'Cetirizine','5mg','Once daily',NULL),(3,'Cough Syrup','10ml','Thrice a day',NULL),(6,'Hydrocortisone Cream','Apply thin layer','Twice daily',NULL),(7,'Loperamide','2mg','After each loose stool',NULL),(1,'Paracetamol','500mg','Twice a day',NULL),(2,'Sumatriptan','250mg','Once as needed',NULL);
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
INSERT INTO `patient` VALUES (20001,'Claire','','1983-03-09','15699876541','Heidelberg','30001',1,'No medical history'),(20002,'Helena_Rossi','','1980-01-19','15598321756','Mannheim','30003',2,'No medical history'),(20003,'John Doe','','1990-05-14','9876543210','123 Elm Street, NY','30001',1,'No prior issues'),(20004,'Alice Smith','','1985-03-22','9123456780','456 Oak Avenue, CA','30002',2,'Had chickenpox in 2020'),(20005,'Bob Johnson','','1978-11-10','9988776655','789 Maple Drive, TX','30001',1,'History of hypertension'),(20006,'Emily Davis','','2000-08-30','9001122334','101 Pine Road, FL','30004',4,'Allergic to penicillin'),(20007,'Chris Evans','','1992-07-18','8887766554','202 Cedar Blvd, WA','30003',3,'Irritable Bowel Syndrome');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
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
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (101,'','General','G-101',20001,'Claire'),(102,'','Private','P-102',20002,'Helena_Rossi'),(103,'','ICU','ICU-03',20003,'John Doe'),(104,'','Semi-Private','SP-104',20004,'Alice Smith'),(105,'','General','G-105',20005,'Bob Johnson'),(106,'','Private','P-106',20006,'Emily Davis'),(107,'','ICU','ICU-07',20007,'Chris Evans'),(80001,'','Deluxe','A1',20002,'Helena_Rossi');
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
INSERT INTO `staff_support` VALUES (30001,'Nurse','Clark','','1570005686','yes'),(30002,'Nurse','Sara','','1569166586','yes'),(30003,'Medical_Assistant','Richard','','15985432843','no'),(30004,'Medical_Assistant','Max','','14993186343','yes'),(30005,'Medical_Assistant','Caroline','','1539760876','yes'),(30006,'Nurse','Stephen','','15612832193','no'),(30007,'Radiologist','Dr. Sophie Braun','','15577889900','yes'),(30008,'Physiotherapist','Markus Fischer','','15522334455','yes'),(30009,'Billing Clerk','Nina Hartmann','','15566772288','no'),(30010,'Janitor','Peter Lange','','15599887766','no'),(30011,'Security','Thomas Roth','','15588443322','no'),(30012,'Dietician','Laura König','','15599001122','yes'),(30013,'IT Support','Daniel Becker','','15577665544','yes'),(30014,'Emergency Nurse','Katrin Müller','','15566558899','yes'),(30015,'Lab Technician','Lena Weiss','','15511223344','yes'),(30016,'Pharmacist','David Schmitt','','15566778899','no');
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

-- Dump completed on 2025-06-09 20:57:57
