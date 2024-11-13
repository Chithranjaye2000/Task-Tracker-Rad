-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2024 at 09:44 AM
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
-- Database: `tasktracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `anid` int(11) NOT NULL,
  `antitle` varchar(255) NOT NULL,
  `anmessage` text DEFAULT NULL,
  `anby` varchar(50) DEFAULT NULL,
  `andate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`anid`, `antitle`, `anmessage`, `anby`, `andate`) VALUES
(11, 'Training Session Announcement', 'A mandatory training session on the new software update will be held on Thursday, August 18th, 2024, from 1 PM to 3 PM in the main conference room. All employees are required to attend.', 'malinda', '2024-08-09 07:45:01'),
(18, 'Employer training', 'Employer training started', 'mahesh', '2024-08-10 15:14:18'),
(19, 'Changed User Requirements', 'Changed & Check Functions In system relevant to user requirements', 'mahesh', '2024-08-11 11:39:10'),
(21, 'Special Consideration', 'All the team members should change the database.', 'mahesh', '2024-08-11 11:42:50'),
(22, 'Get the new versions', 'Get the new versions of System for enhance ', 'mahesh', '2024-08-11 11:45:34'),
(23, 'Update the current progress', 'Update the current progress of system should update', 'mahesh', '2024-08-11 11:47:05');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `tid` int(11) NOT NULL,
  `tname` varchar(255) NOT NULL,
  `tdis` text DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `priority` varchar(20) DEFAULT NULL,
  `uname` varchar(50) NOT NULL,
  `assignedTo` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Not Assigned'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`tid`, `tname`, `tdis`, `startDate`, `deadline`, `priority`, `uname`, `assignedTo`, `status`) VALUES
(3, 'Conduct Security Audit', 'Perform a thorough security audit of all IT systems and implement necessary improvements.', '2024-09-08', '2024-10-09', 'Low', 'jayee', 'cj', 'Completed'),
(7, 'Change the UI design', 'Change the UI design in system basically', '2024-08-08', '2024-08-31', 'Medium', 'malinda', 'salinda', 'Assigned'),
(9, 'Add databases to system', 'Add databases to system..........', '2024-08-09', '2024-08-31', 'High', 'malinda', 'salinda', 'Assigned'),
(11, 'Front-End Development', 'Integrate front-end with back-end APIs function add', '2024-08-09', '2024-08-22', 'Medium', 'mahesh', 'nadun', 'Completed'),
(16, 'Create the database', 'implement all functions', '2024-08-11', '2024-08-30', 'Medium', 'mahesh', 'bumindu', 'Assigned'),
(17, 'Create user Dashboard', 'develop the user Dashboard with Unique functions', '2024-08-14', '2024-08-31', 'Medium', 'mahesh', 'salinda', 'Pending'),
(19, 'Implement the Authentication Functions', 'Implement the Authentication Functions in Entire system...and check it', '2024-08-11', '2024-08-31', 'High', 'mahesh', 'lakmina', 'Assigned');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `psw` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `role`, `uname`, `psw`) VALUES
(10, 'Admin', 'Admin', 'admin@gmail.com', 'Admin', 'admin', '25d55ad283aa400af464c76d713c07ad'),
(26, 'Malinda', 'Dilshan', 'malindadilshan34@gmail.com', 'ProjectManager', 'malinda', 'efe49c51b208e1054dcf5f96cc5eac42'),
(28, 'Bumindu', 'Hettiarachchi', 'bumindu12@gmail.com', 'member', 'bumindu', 'a9550d0b0f614a71af7f820c13ab423e'),
(29, 'Praveen', 'Aravindu', 'praveen67@gamail.com', 'member', 'arvindu', 'bc718f1ce49aa94ff9063ba6a16284fa'),
(30, 'Lakmina', 'Ruvishan', 'lakminaruvi78@gamil.com', 'member', 'lakmina', '5926207ce8c0d7bb9edb14d3fc3222a9'),
(31, 'Nadun', 'Ravishan', 'nadunravishan34@gmail.com', 'member', 'nadun', '9cfac18fe29d608c3e02116aa21504a2'),
(32, 'Mahesh', 'Liyanaarachchi', 'maheshliyanage56@gmail.com', 'ProjectManager', 'mahesh', 'bc2d82345451abf1869ffee1e07593f9'),
(34, 'Chithran', 'Jayathunga', 'chithrajayathunga@gmail.com', 'ProjectManager', 'Project Manager', '25d55ad283aa400af464c76d713c07ad'),
(35, 'Chithrann', 'Jayathungaa', 'chithrajayathungaa@gmail.com', 'member', 'Member', '25d55ad283aa400af464c76d713c07ad');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`anid`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`uname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `anid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
