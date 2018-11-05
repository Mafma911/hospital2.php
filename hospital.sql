-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 05, 2018 at 02:46 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `iddepartment` int(11) NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`iddepartment`, `Name`) VALUES
(1, 'Alpha'),
(2, 'beta'),
(3, 'charlie'),
(4, 'david');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `iddoctors` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Years of practice` text NOT NULL,
  `department_iddepartment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`iddoctors`, `Name`, `Years of practice`, `department_iddepartment`) VALUES
(1, 'Amir', '5', 1),
(2, 'Barry', '9', 2),
(3, 'kate', '2', 3),
(4, 'tommy', '4', 4);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `idPatients` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `illness` varchar(45) DEFAULT NULL,
  `doctors_iddoctors` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`idPatients`, `Name`, `age`, `illness`, `doctors_iddoctors`) VALUES
(1, 'Alpha', '25', 'Cancer', 1),
(2, 'Jerry', '65', 'Cancer', 2),
(3, 'Sam', '30', 'flw', 3),
(4, 'Ali', '20', 'knee injury', 4);

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `idPrescription` int(11) NOT NULL,
  `medication` text NOT NULL,
  `date issued` date NOT NULL,
  `doctors_iddoctors` int(11) NOT NULL,
  `Patients_idPatients` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`idPrescription`, `medication`, `date issued`, `doctors_iddoctors`, `Patients_idPatients`) VALUES
(1, 'Pandol', '0000-00-00', 3, 3),
(2, 'chemical', '0000-00-00', 1, 1),
(3, 'checmical', '0000-00-00', 2, 2),
(4, 'analgesic', '0000-00-00', 4, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`iddepartment`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`iddoctors`),
  ADD KEY `fk_doctors_department_idx` (`department_iddepartment`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`idPatients`),
  ADD KEY `fk_Patients_doctors1_idx` (`doctors_iddoctors`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`idPrescription`),
  ADD KEY `fk_Prescription_doctors1_idx` (`doctors_iddoctors`),
  ADD KEY `fk_Prescription_Patients1_idx` (`Patients_idPatients`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `iddoctors` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `idPatients` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `fk_doctors_department` FOREIGN KEY (`department_iddepartment`) REFERENCES `department` (`iddepartment`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `fk_Patients_doctors1` FOREIGN KEY (`doctors_iddoctors`) REFERENCES `doctors` (`iddoctors`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `fk_Prescription_Patients1` FOREIGN KEY (`Patients_idPatients`) REFERENCES `patients` (`idPatients`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Prescription_doctors1` FOREIGN KEY (`doctors_iddoctors`) REFERENCES `doctors` (`iddoctors`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
