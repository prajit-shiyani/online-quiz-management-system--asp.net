-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2024 at 06:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinequiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidatetbl`
--

CREATE TABLE `candidatetbl` (
  `CandId` int(100) NOT NULL,
  `CandName` varchar(100) NOT NULL,
  `CandEmail` varchar(100) NOT NULL,
  `CandPass` varchar(100) NOT NULL,
  `CandCollege` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `candidatetbl`
--

INSERT INTO `candidatetbl` (`CandId`, `CandName`, `CandEmail`, `CandPass`, `CandCollege`) VALUES
(1, 'Rasik', 'rasik@gmail.com', '1234', 'v.j.modha'),
(2, 'ManikChand', 'Manik@gmail.com', '12345', 'k.v.s');

-- --------------------------------------------------------

--
-- Table structure for table `questiontbl`
--

CREATE TABLE `questiontbl` (
  `QuesId` int(100) NOT NULL,
  `Quiz` int(100) NOT NULL,
  `Question` varchar(250) NOT NULL,
  `Ans1` varchar(200) NOT NULL,
  `Ans2` varchar(200) NOT NULL,
  `Ans3` varchar(200) NOT NULL,
  `Ans4` varchar(200) NOT NULL,
  `Correct` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questiontbl`
--

INSERT INTO `questiontbl` (`QuesId`, `Quiz`, `Question`, `Ans1`, `Ans2`, `Ans3`, `Ans4`, `Correct`) VALUES
(2, 1, 'Number of primitive data types in Java are?', '6', '7', '8', '9', 3),
(4, 3, ' Which of the following is a contextual keyword in C#?', 'get', 'set', 'add', 'all of the above', 4),
(5, 3, ' Which of the following converts a type to a single Unicode character, where possible in C#?', 'ToSingle', 'ToByte', 'ToChar', 'ToDateTime', 3),
(6, 1, 'What is the size of float and double in java?', '32 and 64', '32 and 32', '64 and 32', '64 and 64', 1),
(7, 1, ' Automatic type conversion is possible in which of the possible cases?', 'byte to int', 'int to long', 'long and int', 'short to int', 2),
(8, 1, 'Arrays in java are-', 'Object refrence', 'object', 'primitiv data type', 'none', 2);

-- --------------------------------------------------------

--
-- Table structure for table `quiztbl`
--

CREATE TABLE `quiztbl` (
  `Qid` int(50) NOT NULL,
  `QName` varchar(100) NOT NULL,
  `QQtNbr` int(50) NOT NULL,
  `QMarksByAns` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiztbl`
--

INSERT INTO `quiztbl` (`Qid`, `QName`, `QQtNbr`, `QMarksByAns`) VALUES
(1, 'JAVA Test', 4, 1),
(3, 'c# Test', 5, 2),
(4, 'Python Test', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `testtbl`
--

CREATE TABLE `testtbl` (
  `TestId` int(100) NOT NULL,
  `Candidate` int(100) NOT NULL,
  `Quiz` int(100) NOT NULL,
  `TDate` date NOT NULL,
  `Score` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidatetbl`
--
ALTER TABLE `candidatetbl`
  ADD PRIMARY KEY (`CandId`);

--
-- Indexes for table `questiontbl`
--
ALTER TABLE `questiontbl`
  ADD PRIMARY KEY (`QuesId`),
  ADD KEY `FK4` (`Quiz`);

--
-- Indexes for table `quiztbl`
--
ALTER TABLE `quiztbl`
  ADD PRIMARY KEY (`Qid`);

--
-- Indexes for table `testtbl`
--
ALTER TABLE `testtbl`
  ADD PRIMARY KEY (`TestId`),
  ADD KEY `FK1` (`Candidate`),
  ADD KEY `FK2` (`Quiz`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidatetbl`
--
ALTER TABLE `candidatetbl`
  MODIFY `CandId` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `questiontbl`
--
ALTER TABLE `questiontbl`
  MODIFY `QuesId` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `quiztbl`
--
ALTER TABLE `quiztbl`
  MODIFY `Qid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `testtbl`
--
ALTER TABLE `testtbl`
  MODIFY `TestId` int(100) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `questiontbl`
--
ALTER TABLE `questiontbl`
  ADD CONSTRAINT `FK4` FOREIGN KEY (`Quiz`) REFERENCES `quiztbl` (`Qid`);

--
-- Constraints for table `testtbl`
--
ALTER TABLE `testtbl`
  ADD CONSTRAINT `FK1` FOREIGN KEY (`Candidate`) REFERENCES `candidatetbl` (`CandId`),
  ADD CONSTRAINT `FK2` FOREIGN KEY (`Quiz`) REFERENCES `quiztbl` (`Qid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
