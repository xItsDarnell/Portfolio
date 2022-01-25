-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `admitted`
--

DROP TABLE IF EXISTS `admitted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admitted` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `patientID` int NOT NULL,
  `roomNumber` int NOT NULL,
  `startDateTime` timestamp NOT NULL,
  `endDateTime` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `patientID` (`patientID`),
  KEY `roomNumber` (`roomNumber`),
  CONSTRAINT `admitted_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`ID`),
  CONSTRAINT `admitted_ibfk_2` FOREIGN KEY (`roomNumber`) REFERENCES `room` (`roomNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=3000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admitted`
--

LOCK TABLES `admitted` WRITE;
/*!40000 ALTER TABLE `admitted` DISABLE KEYS */;
/*!40000 ALTER TABLE `admitted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `patient` int NOT NULL,
  `prepNurse` int DEFAULT NULL,
  `physician` int NOT NULL,
  `startDateTime` timestamp NOT NULL,
  `endDateTime` timestamp NOT NULL,
  `examRoom` int NOT NULL,
  `cost` decimal(7,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `patient` (`patient`),
  KEY `physician` (`physician`),
  KEY `prepNurse` (`prepNurse`),
  KEY `examRoom` (`examRoom`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient`) REFERENCES `patient` (`ID`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`physician`) REFERENCES `physician` (`employeeID`),
  CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`prepNurse`) REFERENCES `nurse` (`employeeID`),
  CONSTRAINT `appointment_ibfk_4` FOREIGN KEY (`examRoom`) REFERENCES `room` (`roomNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,2038,138,500,'2020-03-01 13:00:00','2020-03-01 13:30:00',140,50.00),(2,2035,138,500,'2020-03-01 15:00:00','2020-03-01 15:30:00',141,40.00),(3,2032,138,500,'2020-03-01 14:00:00','2020-03-01 14:30:00',142,75.00),(4,2029,138,502,'2020-03-01 16:15:00','2020-03-01 16:45:00',143,25.00),(5,2026,138,502,'2020-03-01 17:00:00','2020-03-01 17:30:00',144,35.00),(6,2023,140,503,'2020-03-02 13:00:00','2020-03-02 13:30:00',145,65.00),(7,2020,140,503,'2020-03-02 15:00:00','2020-03-02 15:30:00',146,20.00),(8,2016,140,503,'2020-03-02 14:00:00','2020-03-02 14:30:00',147,10.00),(9,2010,140,505,'2020-03-02 16:15:00','2020-03-02 16:45:00',148,80.00),(10,2007,140,505,'2020-03-02 17:00:00','2020-03-02 17:30:00',149,55.00);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `head` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `head` (`head`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`head`) REFERENCES `physician` (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'General Medicine',520),(2,'Surgery',501),(3,'Psychiatry',508),(4,'Pediatrics',509),(5,'Intensive Care Unit',510),(6,'Emergency',515),(7,'Oncology',503),(8,'Cardiology',504),(9,'Neurology',511),(10,'Materinity',522);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `department_heads`
--

DROP TABLE IF EXISTS `department_heads`;
/*!50001 DROP VIEW IF EXISTS `department_heads`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `department_heads` AS SELECT 
 1 AS `Department`,
 1 AS `Head`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `companyName` varchar(50) NOT NULL,
  `phone` char(10) NOT NULL,
  `inNetwork` tinyint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `companyName` (`companyName`)
) ENGINE=InnoDB AUTO_INCREMENT=1019 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1000,'Unitedhealth Group','8002587412',1),(1001,'Wellpoint Inc. Group','8008529632',1),(1002,'Kaiser Foundation Group','8003336666',1),(1003,'Humana Group','8001114444',1),(1004,'Aetna Group','8004447777',0),(1005,'HCSC Group','8007778888',1),(1006,'Cigna Health Group','8009996666',1),(1007,'Highmark Group','8006669999',1),(1008,'Coventry Corp. Group','8002225555',0),(1009,'HIP Insurance Group','8005558888',1),(1010,'Independence Blue Cross Group','8002228888',1),(1011,'Blue Cross Blue Shield','8008885555',0),(1012,'Physicians Service','8008882222',1),(1013,'Health Net','8007771111',1),(1014,'Centene Corp Group','8009993333',1),(1015,'Carefirst Inc Group','8001597532',0),(1016,'Wellcare Group','8009514789',1),(1017,'UHC','8003578963',1),(1018,'Lifetime Healthcare Group','8007536987',0);
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalprocedure`
--

DROP TABLE IF EXISTS `medicalprocedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalprocedure` (
  `code` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `cost` decimal(7,2) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalprocedure`
--

LOCK TABLES `medicalprocedure` WRITE;
/*!40000 ALTER TABLE `medicalprocedure` DISABLE KEYS */;
INSERT INTO `medicalprocedure` VALUES (1,'Reverse Rhinopodoplasty',1500.00),(2,'Obtuse Pyloric Recombobulation',3750.00),(3,'Folded Demiophtalmectomy ',4500.00),(4,'Complete Walletectomy',10000.00),(5,'Obfuscated Dermogastrotomy',4899.00),(6,'Reversible Pancreomyoplasty',5600.00),(7,'Follicular Demiectomy',250.00),(8,'Cardiac dysrhythmias',7178.00),(9,'Biliary tract disease',4722.00),(10,'Fracture of neck of femur (hip),',4861.00),(11,'Heart valve disorders',5151.00),(12,'Pneumonia',2501.00),(13,'Septicemia',23663.00),(14,'Osteoarthritis',16520.00),(15,'Liveborn',13287.00),(16,'Congestive heart failure',10218.00),(17,'Coronary atherosclerosis',9003.00),(18,'Acute cerebrovascular disease',8840.00),(19,'Mood disorders',5246.00),(20,'Acute myocardial infarction',12092.00);
/*!40000 ALTER TABLE `medicalprocedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication` (
  `code` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `cost` decimal(7,2) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES (1,'Acetaminophen','Gemini Pharmaceuticals',69.80,'pain reliever and a fever reducer'),(2,'Adderall','Shire Pharmaceuticals',71.90,'treat attention deficit hyperactivity disorder (ADHD) and narcolepsy'),(3,'Ciprofloxacin','Pfizer',19.95,'treat different types of bacterial infections'),(4,'Clonazepam','Watson Pharmaceuticals',35.56,'treat seizures and certain types of anxiety disorders'),(5,'Doxycycline','Pfizer',81.50,'treat many different bacterial infections'),(6,'Gabapentin','Pfizer',68.67,'treat neuropathic pain (nerve pain)'),(7,'Hydrochlorothiazide','Jubilant Cadista Pharmaceuticals',16.77,'used to treat fluid retention (edema)'),(8,'Lexapro','Forest Laboratories',260.00,'used to treat anxiety in adults'),(9,'Meloxicam','Boehringer Ingelheim Pharmaceuticals',50.00,'used to treat pain or inflammation caused by rheumatoid arthritis and osteoarthritis'),(10,'Omeprazole','Kremers Urban Pharmaceuticals',60.00,'used to treat symptoms of gastroesophageal reflux disease (GERD)'),(11,'Oxycodone','Purdue Pharma',80.50,'used to treat moderate to severe pain'),(12,'Pantoprazole','Pfizer',68.84,'used to treat erosive esophagitis (damage to the esophagus from stomach acid'),(13,'Trazodone','PubChem',14.63,'used to treat major depressive disorder'),(14,'Zoloft','Pfizer',34.99,'used to treat depression, obsessive-compulsive disorder, panic disorder, anxiety disorders');
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `employeeID` int NOT NULL AUTO_INCREMENT,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `position` int NOT NULL,
  `registered` tinyint NOT NULL,
  `ssn` char(9) NOT NULL,
  PRIMARY KEY (`employeeID`),
  UNIQUE KEY `ssn` (`ssn`),
  KEY `position` (`position`),
  CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`position`) REFERENCES `position` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES (138,'Espinosa','Carla',1,1,'888226666'),(139,'Forman','Kitty',1,1,'000112222'),(140,'Houlihan','Margaret',1,1,'999551111'),(141,'Roberts','Laverne',2,1,'777553333'),(142,'Flowers','Paul',1,0,'559852222'),(143,'Hathaway','Carol',2,1,'885231478'),(144,'Taggart','Samantha',2,1,'357951478'),(145,'Lockhart','Abby',2,1,'336541598'),(146,'Petrelli','Peter',2,0,'225649874'),(147,'Peyton','Jackie',2,1,'441523698'),(148,'Perkins','Ann',2,0,'665412398'),(149,'Parker','Dell',2,1,'554789632'),(150,'Chapel','Christine',2,1,'885213647'),(151,'Hardy','Audrey',2,1,'112365874'),(152,'Spenser','Bobbie',2,1,'9987456'),(153,'Alden','Terri',2,1,'775889632'),(154,'Young','Mary',2,1,'159753684'),(155,'Fairhead','Charlie',2,0,'987654321'),(156,'Seabrook','Tina',2,1,'123456789');
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `nurse_schedule`
--

DROP TABLE IF EXISTS `nurse_schedule`;
/*!50001 DROP VIEW IF EXISTS `nurse_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nurse_schedule` AS SELECT 
 1 AS `Nurse`,
 1 AS `Date`,
 1 AS `Start Time`,
 1 AS `End Time`,
 1 AS `Floor`,
 1 AS `Section`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `oncall`
--

DROP TABLE IF EXISTS `oncall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oncall` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nurse` int NOT NULL,
  `blockFloor` int NOT NULL,
  `blockCode` int NOT NULL,
  `startDateTime` timestamp NOT NULL,
  `endDateTime` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `nurse` (`nurse`),
  CONSTRAINT `oncall_ibfk_1` FOREIGN KEY (`nurse`) REFERENCES `nurse` (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oncall`
--

LOCK TABLES `oncall` WRITE;
/*!40000 ALTER TABLE `oncall` DISABLE KEYS */;
INSERT INTO `oncall` VALUES (1,138,1,1,'2020-03-01 12:00:00','2020-03-02 00:00:00'),(2,139,1,2,'2020-03-02 00:00:00','2020-03-02 12:00:00'),(3,140,1,3,'2020-03-02 12:00:00','2020-03-03 00:00:00'),(4,141,2,1,'2020-03-03 00:00:00','2020-03-03 12:00:00'),(5,142,2,2,'2020-03-03 12:00:00','2020-03-04 00:00:00'),(6,143,2,3,'2020-03-04 00:00:00','2020-03-04 12:00:00'),(7,144,3,1,'2020-03-04 12:00:00','2020-03-05 00:00:00'),(8,145,3,2,'2020-03-05 00:00:00','2020-03-05 12:00:00'),(9,146,3,3,'2020-03-05 12:00:00','2020-03-06 00:00:00'),(10,147,1,1,'2020-03-06 00:00:00','2020-03-06 12:00:00'),(11,148,1,2,'2020-03-06 12:00:00','2020-03-07 00:00:00'),(12,149,1,3,'2020-03-07 00:00:00','2020-03-07 12:00:00'),(13,150,2,1,'2020-03-07 12:00:00','2020-03-08 00:00:00'),(14,151,2,2,'2020-03-08 00:00:00','2020-03-08 11:00:00'),(15,152,2,3,'2020-03-08 11:00:00','2020-03-08 23:00:00'),(16,153,3,1,'2020-03-08 23:00:00','2020-03-09 11:00:00'),(17,154,3,2,'2020-03-09 11:00:00','2020-03-09 23:00:00'),(18,155,3,3,'2020-03-09 23:00:00','2020-03-10 11:00:00'),(19,156,1,1,'2020-03-10 11:00:00','2020-03-10 23:00:00');
/*!40000 ALTER TABLE `oncall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ssn` char(9) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` char(10) NOT NULL,
  `insuranceID` int DEFAULT NULL,
  `insuranceAct` int DEFAULT NULL,
  `pcp` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ssn` (`ssn`),
  UNIQUE KEY `insuranceAct` (`insuranceAct`),
  KEY `insuranceID` (`insuranceID`),
  KEY `pcp` (`pcp`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`insuranceID`) REFERENCES `insurance` (`ID`),
  CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`pcp`) REFERENCES `physician` (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2039 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (2000,'100000001','Smith','John','42 Foobar Lane','1235550256',1001,68476213,523),(2001,'100000002','Ritchie','Grace','37 Snafu Drive','1235550512',1011,36546321,522),(2002,'100000003','Patient','Random','101 Omgbbq Street','1235551204',1018,65465421,520),(2003,'100000004','Doe','Dennis','1100 Foobaz Avenue','1235552048',1005,68421879,521),(2004,'100000005','Goodman','Yvonne','12 Creekside St','2025550103',1000,68476223,519),(2005,'100000006','Mackenzie','Dante','137 Wall St','2025550112',1000,36546341,519),(2006,'100000007','Rollins','Alysha','411 Shirley St','2025550115',1001,65465481,519),(2007,'100000008','Gonzalez','Avaya','7771 Border Court','2025550119',1001,68421679,519),(2008,'100000009','Kelly','Haniya','6 South Sulphur Springs Street','2025550121',1002,68496213,519),(2009,'100000010','Chambers','Nathalie','942 New Saddle Drive','2025550122',1002,36545321,519),(2010,'100000011','Rollins','Dante','9 Wrangler Ave','2025550124',1003,654615421,519),(2011,'100000012','Mckee','Beverley','7319 S. Greenview Drive','2025550125',1003,78425879,520),(2012,'100000013','Lindsey','Paris','763 West Mulberry St','2025550132',1004,78476213,520),(2013,'100000014','Melia','Umaiza','545 Ohio Ave','2025550135',1004,26546321,520),(2014,'100000015','Prince','Nico','20 Middle River Street','2025550137',1005,15465421,520),(2015,'100000016','Rennie','Javan','8112 North Country St','2025550139',1005,58521879,520),(2016,'100000017','Waters','Ali','83 Rockland Lane','2025550144',1006,68472213,520),(2017,'100000018','Clarke','JohnPaul','1 Riverside Lane','2025550153',1006,76546321,520),(2018,'100000019','Kaiser','Dane','694 Wall Road','2025550155',1007,65465431,521),(2019,'100000020','Newman','Hammad','9970 State Court','2025550157',1007,66421879,521),(2020,'100000021','Guthrie','Maha','54 Woodsman Drive','2025550161',1008,62421879,521),(2021,'100000022','Roberts','Tulisa','7174 Studebaker Street','2025550163',1008,98421879,521),(2022,'100000023','Solis','Robin','8474 Wentworth Street','2025550164',1009,68121879,521),(2023,'100000024','Heath','Kavita','796 Hartford St','2025550165',1009,68921879,521),(2024,'100000025','White','Meera','484 Bridge St','2025550166',1010,68491879,521),(2025,'100000026','Esparza','Bradlee','7031 Gainsway St','2025550173',1010,18421179,522),(2026,'100000027','Leonard','Leilani','37 Monroe Street','2025550175',1011,28421879,522),(2027,'100000028','Brook','Stefanie','7990 West Surrey St','2025550179',1011,38421879,522),(2028,'100000029','Squires','Grover','7618 Madison Court','2025550180',1012,48421879,522),(2029,'100000030','Kumar','Jonathan','25 Annadale Court','2025550182',1012,58421879,522),(2030,'100000031','Neville','Angus','9841 Smith Drive','2025550187',1013,78421879,522),(2031,'100000032','Sparrow','Uzair','7999 Hall Street','2025550188',1013,88421879,522),(2032,'100000033','Currie','Amari','8411 Pleasant St','2025550194',1014,18421879,523),(2033,'100000034','Wallace','Imaani','33 Pierce Rd','2025550195',1014,68421878,523),(2034,'100000035','House','Efe','97 High Point Street','2025550196',1015,68421877,523),(2035,'100000036','Atkinson','Atticus','66 Harrison Dr','2025550197',1015,68421876,523),(2036,'100000037','Ramirez','Michelle','370 Hill Field Ave','2025550198',1016,68421875,523),(2037,'100000038','Hassan','Remy','249 Devon Lane','2025550199',1016,68421874,523),(2038,'100000039','Beck','Jordana','7911 Carson Lane','2025550200',1017,68421873,523);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patient_appointments`
--

DROP TABLE IF EXISTS `patient_appointments`;
/*!50001 DROP VIEW IF EXISTS `patient_appointments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patient_appointments` AS SELECT 
 1 AS `Patient`,
 1 AS `Nurse`,
 1 AS `Doctor`,
 1 AS `Date`,
 1 AS `Start Time`,
 1 AS `End Time`,
 1 AS `Room`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `patient_insurance`
--

DROP TABLE IF EXISTS `patient_insurance`;
/*!50001 DROP VIEW IF EXISTS `patient_insurance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patient_insurance` AS SELECT 
 1 AS `Patient`,
 1 AS `Insurance Company`,
 1 AS `Phone Number`,
 1 AS `Insurance ID`,
 1 AS `In Network`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `patient_prescriptions`
--

DROP TABLE IF EXISTS `patient_prescriptions`;
/*!50001 DROP VIEW IF EXISTS `patient_prescriptions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patient_prescriptions` AS SELECT 
 1 AS `Doctor`,
 1 AS `Patient`,
 1 AS `Medication`,
 1 AS `Date`,
 1 AS `Dosage`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `physician`
--

DROP TABLE IF EXISTS `physician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physician` (
  `employeeID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `position` int NOT NULL,
  `ssn` char(9) NOT NULL,
  PRIMARY KEY (`employeeID`),
  UNIQUE KEY `ssn` (`ssn`),
  KEY `position` (`position`),
  CONSTRAINT `physician_ibfk_1` FOREIGN KEY (`position`) REFERENCES `position` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physician`
--

LOCK TABLES `physician` WRITE;
/*!40000 ALTER TABLE `physician` DISABLE KEYS */;
INSERT INTO `physician` VALUES (500,'John','Dorian',4,'111111111'),(501,'Elliot','Reid',5,'222222222'),(502,'Christopher','Turk',6,'333333333'),(503,'Percival','Cox',7,'444444444'),(504,'Bob','Kelso',8,'555555555'),(505,'Todd','Quinlan',6,'666666666'),(506,'John','Wen',6,'777777777'),(507,'Keith','Dudemeister',9,'888888888'),(508,'Molly','Clock',10,'999999999'),(509,'Doug','Ross',11,'951159951'),(510,'Robert','Chase',12,'753357753'),(511,'Gregory','House',13,'852258852'),(512,'Mark','Greene',5,'123321123'),(513,'John','Carter',14,'456654456'),(514,'James','Wilson',15,'789987789'),(515,'Leonard','McCoy',15,'741147741'),(516,'John','McIntyre',16,'963369963'),(517,'Eric','Foreman',17,'369963369'),(518,'Derek','Shepherd',17,'147741147'),(519,'Philip','Buck',18,'111223333'),(520,'Apostol','Robert',18,'222334444'),(521,'Badola','Jesus',18,'333445555'),(522,'Altino','Rosa',18,'444556666'),(523,'Hamilton','Ann',18,'555667777');
/*!40000 ALTER TABLE `physician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (11,'Attending Pediatrician'),(5,'Attending Physician'),(10,'Attending Psychiatrist'),(14,'ER Attending'),(15,'ER Resident'),(18,'General Medicine'),(8,'Head Chief of Medicine'),(1,'Head Nurse'),(13,'Head of Diagnostic Medicine'),(12,'Intensive Care Surgeon'),(9,'MD Resident'),(17,'Medical Student'),(2,'Nurse'),(7,'Senior Attending Physician'),(4,'Staff Internist'),(6,'Surgical Attending Physician'),(16,'Surgical Intern');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `physicianID` int NOT NULL,
  `patientID` int NOT NULL,
  `medicationID` int NOT NULL,
  `prescribeDate` date NOT NULL,
  `appointmentID` int NOT NULL,
  `dose` int NOT NULL,
  PRIMARY KEY (`physicianID`,`patientID`,`medicationID`,`prescribeDate`),
  KEY `patientID` (`patientID`),
  KEY `medicationID` (`medicationID`),
  KEY `appointmentID` (`appointmentID`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`ID`),
  CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`physicianID`) REFERENCES `physician` (`employeeID`),
  CONSTRAINT `prescription_ibfk_3` FOREIGN KEY (`medicationID`) REFERENCES `medication` (`code`),
  CONSTRAINT `prescription_ibfk_4` FOREIGN KEY (`appointmentID`) REFERENCES `appointment` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (500,2032,2,'2020-03-01',3,500),(500,2038,1,'2020-03-01',1,250),(502,2026,5,'2020-03-01',5,200),(503,2016,8,'2020-03-02',8,10),(503,2023,6,'2020-03-02',6,800),(505,2010,9,'2020-03-02',9,8);
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `roomNumber` int NOT NULL,
  `roomType` int NOT NULL,
  `blockFloor` int NOT NULL,
  `blockCode` int NOT NULL,
  `available` tinyint NOT NULL,
  PRIMARY KEY (`roomNumber`),
  KEY `roomType` (`roomType`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`roomType`) REFERENCES `roomtype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (101,1,1,1,1),(102,1,1,1,1),(103,1,1,1,1),(110,1,1,2,0),(111,1,1,2,1),(112,1,1,2,1),(113,1,1,2,0),(121,1,1,3,1),(122,1,1,3,1),(123,1,1,3,0),(140,4,1,4,0),(141,4,1,4,1),(142,4,1,4,0),(143,4,1,4,0),(144,4,1,4,1),(145,4,1,4,0),(146,4,1,4,1),(147,4,1,4,0),(148,4,1,4,1),(149,4,1,4,0),(201,2,2,1,0),(202,2,2,1,1),(203,2,2,1,1),(210,2,2,2,0),(211,2,2,2,1),(212,2,2,2,1),(213,2,2,2,0),(221,2,2,3,1),(222,2,2,3,0),(223,2,2,3,1),(301,3,3,1,0),(302,3,3,1,1),(303,3,3,1,1),(310,3,3,2,0),(311,3,3,2,1),(312,3,3,2,1),(313,3,3,2,0),(321,3,3,3,1),(322,3,3,3,1),(323,3,3,3,0),(401,3,3,1,0),(402,3,3,1,0),(403,3,3,1,0),(410,3,3,2,0),(411,3,3,2,0),(412,3,3,2,1),(413,3,3,2,1),(421,3,3,3,1),(422,3,3,3,1),(423,3,3,3,1);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomtype`
--

DROP TABLE IF EXISTS `roomtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomtype` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `roomDesc` varchar(15) NOT NULL,
  `cost` decimal(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `roomDesc` (`roomDesc`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomtype`
--

LOCK TABLES `roomtype` WRITE;
/*!40000 ALTER TABLE `roomtype` DISABLE KEYS */;
INSERT INTO `roomtype` VALUES (1,'Critical',3528.00),(2,'Private',1791.00),(3,'Semi-Private',895.50),(4,'Exam',0.00);
/*!40000 ALTER TABLE `roomtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `undergoes`
--

DROP TABLE IF EXISTS `undergoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `undergoes` (
  `patientID` int NOT NULL,
  `procedureCode` int NOT NULL,
  `admittedID` int NOT NULL,
  `procedureDATE` timestamp NOT NULL,
  `physicianID` int NOT NULL,
  `nurseID` int NOT NULL,
  PRIMARY KEY (`patientID`,`procedureCode`,`procedureDATE`),
  KEY `physicianID` (`physicianID`),
  KEY `admittedID` (`admittedID`),
  KEY `nurseID` (`nurseID`),
  KEY `procedureCode` (`procedureCode`),
  CONSTRAINT `undergoes_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`ID`),
  CONSTRAINT `undergoes_ibfk_2` FOREIGN KEY (`physicianID`) REFERENCES `physician` (`employeeID`),
  CONSTRAINT `undergoes_ibfk_3` FOREIGN KEY (`admittedID`) REFERENCES `admitted` (`ID`),
  CONSTRAINT `undergoes_ibfk_4` FOREIGN KEY (`nurseID`) REFERENCES `nurse` (`employeeID`),
  CONSTRAINT `undergoes_ibfk_5` FOREIGN KEY (`procedureCode`) REFERENCES `medicalprocedure` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undergoes`
--

LOCK TABLES `undergoes` WRITE;
/*!40000 ALTER TABLE `undergoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `undergoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `department_heads`
--

/*!50001 DROP VIEW IF EXISTS `department_heads`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `department_heads` AS select `d`.`name` AS `Department`,concat(`ph`.`firstName`,' ',`ph`.`lastName`) AS `Head` from (`physician` `ph` join `department` `d`) where (`d`.`head` = `ph`.`employeeID`) order by `d`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nurse_schedule`
--

/*!50001 DROP VIEW IF EXISTS `nurse_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nurse_schedule` AS select concat(`nr`.`firstName`,' ',`nr`.`lastName`) AS `Nurse`,cast(`ol`.`startDateTime` as date) AS `Date`,cast(`ol`.`startDateTime` as time) AS `Start Time`,cast(`ol`.`endDateTime` as time) AS `End Time`,`ol`.`blockFloor` AS `Floor`,`ol`.`blockCode` AS `Section` from (`nurse` `nr` join `oncall` `ol`) where (`ol`.`nurse` = `nr`.`employeeID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_appointments`
--

/*!50001 DROP VIEW IF EXISTS `patient_appointments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_appointments` AS select concat(`pa`.`firstName`,' ',`pa`.`lastName`) AS `Patient`,concat(`nr`.`firstName`,' ',`nr`.`lastName`) AS `Nurse`,concat(`ph`.`firstName`,' ',`ph`.`lastName`) AS `Doctor`,cast(`app`.`startDateTime` as date) AS `Date`,cast(`app`.`startDateTime` as time) AS `Start Time`,cast(`app`.`endDateTime` as time) AS `End Time`,`app`.`examRoom` AS `Room` from (((`appointment` `app` join `physician` `ph`) join `patient` `pa`) join `nurse` `nr`) where ((`app`.`physician` = `ph`.`employeeID`) and (`app`.`patient` = `pa`.`ID`) and (`app`.`prepNurse` = `nr`.`employeeID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_insurance`
--

/*!50001 DROP VIEW IF EXISTS `patient_insurance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_insurance` AS select concat(`pa`.`firstName`,' ',`pa`.`lastName`) AS `Patient`,`ins`.`companyName` AS `Insurance Company`,`ins`.`phone` AS `Phone Number`,`pa`.`insuranceAct` AS `Insurance ID`,(case `ins`.`inNetwork` when 1 then 'TRUE' else 'FALSE' end) AS `In Network` from (`patient` `pa` join `insurance` `ins`) where (`pa`.`insuranceID` = `ins`.`ID`) order by concat(`pa`.`firstName`,' ',`pa`.`lastName`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_prescriptions`
--

/*!50001 DROP VIEW IF EXISTS `patient_prescriptions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_prescriptions` AS select concat(`ph`.`firstName`,' ',`ph`.`lastName`) AS `Doctor`,concat(`pa`.`firstName`,' ',`pa`.`lastName`) AS `Patient`,`m`.`name` AS `Medication`,`pr`.`prescribeDate` AS `Date`,concat(`pr`.`dose`,' mg') AS `Dosage` from ((((`prescription` `pr` join `physician` `ph`) join `patient` `pa`) join `medication` `m`) join `appointment` `a`) where ((`pr`.`physicianID` = `ph`.`employeeID`) and (`pr`.`patientID` = `pa`.`ID`) and (`pr`.`medicationID` = `m`.`code`) and (`pr`.`appointmentID` = `a`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-29 23:37:43
