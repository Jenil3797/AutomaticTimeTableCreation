-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2023 at 02:26 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atc`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ad_id` int(11) NOT NULL,
  `ad_name` varchar(50) NOT NULL,
  `ad_pass` varchar(50) NOT NULL,
  `ad_email` varchar(50) NOT NULL,
  `ad_pic` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ad_id`, `ad_name`, `ad_pass`, `ad_email`, `ad_pic`) VALUES
(1, 'Jenil', 'abc@123', 'jenil@gmail.com', ''),
(2, 'Nisarg', 'abc@123', 'nisarg@gmail.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dep_id` int(11) NOT NULL,
  `dep_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dep_id`, `dep_name`) VALUES
(1, 'BCA'),
(2, 'CSE'),
(4, 'BBA'),
(5, 'BscIT');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `fac_id` int(11) NOT NULL,
  `fac_name` varchar(50) NOT NULL,
  `fac_email` varchar(50) NOT NULL,
  `fac_pass` varchar(10) NOT NULL,
  `fac_mob` bigint(20) NOT NULL,
  `fac_add` varchar(100) NOT NULL,
  `fac_pic` varchar(100) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `sem_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`fac_id`, `fac_name`, `fac_email`, `fac_pass`, `fac_mob`, `fac_add`, `fac_pic`, `dep_id`, `sem_id`, `sub_id`) VALUES
(1, 'Raj Mangukiya', 'raj@gmail.com', '1234', 6532142535, 'Surat', '', 1, 1, 1),
(3, 'Harsh Godhani', 'harsh@gamil.com', '1234', 9662275246, 'Surat', '', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `sem_id` int(11) NOT NULL,
  `sem_name` varchar(20) DEFAULT NULL,
  `dep_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`sem_id`, `sem_name`, `dep_id`) VALUES
(1, '1st', 1),
(2, '2nd', 1),
(3, '1st', 2),
(7, '2nd', 2),
(8, '1st', 4),
(9, '2nd', 4),
(10, '1st', 5),
(12, '3rd', 1),
(13, 'Java', 0),
(14, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `std_id` int(11) NOT NULL,
  `std_fname` varchar(50) NOT NULL,
  `std_lname` varchar(50) NOT NULL,
  `std_email` varchar(50) NOT NULL,
  `std_enrno` int(12) NOT NULL,
  `std_pass` varchar(20) NOT NULL,
  `std_mob` bigint(20) NOT NULL,
  `std_add` varchar(1000) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `sem_id` int(11) NOT NULL,
  `std_div` varchar(5) NOT NULL,
  `std_dob` date NOT NULL,
  `std_pic` varchar(255) NOT NULL,
  `std_gender` enum('Male','Female') NOT NULL,
  `enr_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`std_id`, `std_fname`, `std_lname`, `std_email`, `std_enrno`, `std_pass`, `std_mob`, `std_add`, `dep_id`, `sem_id`, `std_div`, `std_dob`, `std_pic`, `std_gender`, `enr_date`) VALUES
(1, 'Jenil', 'Diyora', 'jenil@gmail.com', 2105101130, 'Jenil', 9662278100, 'Surat', 1, 1, 'A', '2004-02-19', '', 'Male', '2023-07-01'),
(4, 'Ansh', 'Kayasth', 'ansh@gmail.com', 2105101131, '123', 9662275246, 'Vadodara', 1, 1, 'B', '2003-07-10', '', 'Male', '2023-08-21'),
(5, 'Nisarg', 'Desai', 'nisarg@gmail.com', 2105101131, '1234', 9662275246, 'Vadodara', 1, 1, 'C', '2023-08-07', '', '', '2023-08-22');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `sub_id` int(11) NOT NULL,
  `sub_name` varchar(255) DEFAULT NULL,
  `sem_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `lec_per_week` int(11) NOT NULL,
  `lec_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`sub_id`, `sub_name`, `sem_id`, `dep_id`, `lec_per_week`, `lec_type`) VALUES
(1, 'Fundamentals of Programming C', 1, 1, 4, 'Theory'),
(2, 'Python', 2, 1, 5, 'Theory'),
(3, 'Fundamentals of Computer', 1, 1, 4, 'Theory'),
(5, 'Java', 12, 1, 5, 'Theory'),
(8, 'PHP', 2, 1, 5, 'Theory'),
(17, 'Fundamentals of Programming C', 1, 1, 1, 'Practical'),
(18, 'Fundamentals of Computer', 1, 1, 1, 'Practical'),
(19, 'Fundamentals of Web Development', 1, 1, 4, 'Theory'),
(20, 'Fundamentals of Web Development', 1, 1, 1, 'Practical'),
(21, 'Communication Skills', 1, 1, 4, 'Theory'),
(22, 'Mathematics', 1, 1, 4, 'Theory'),
(23, 'Library', 1, 1, 2, 'Theory');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `tt_id` int(11) NOT NULL,
  `division` varchar(10) NOT NULL,
  `day` varchar(15) NOT NULL,
  `lecture_slot` varchar(50) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `lecture_type` varchar(50) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `sem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`tt_id`, `division`, `day`, `lecture_slot`, `subject_name`, `lecture_type`, `dep_id`, `sem_id`) VALUES
(1, 'A', 'Monday', '1', 'Library', 'Theory', 1, 1),
(2, 'A', 'Monday', '2', 'Communication Skills', 'Theory', 1, 1),
(3, 'A', 'Monday', '3', 'Mathematics', 'Theory', 1, 1),
(4, 'A', 'Monday', '4', 'Fundamentals of Web Development', 'Theory', 1, 1),
(5, 'A', 'Monday', '7', 'LUNCH', 'Break', 1, 1),
(6, 'A', 'Monday', '5', '', '', 1, 1),
(7, 'A', 'Monday', '6', '', '', 1, 1),
(8, 'A', 'Tuesday', '1', 'Library', 'Theory', 1, 1),
(9, 'A', 'Tuesday', '2', 'Fundamentals of Web Development', 'Theory', 1, 1),
(10, 'A', 'Tuesday', '3', 'Communication Skills', 'Theory', 1, 1),
(11, 'A', 'Tuesday', '2.5', 'Fundamentals of Programming C', 'Practical', 1, 1),
(12, 'A', 'Tuesday', '6', '', '', 1, 1),
(13, 'A', 'Wednesday', '1', 'Mathematics', 'Theory', 1, 1),
(14, 'A', 'Wednesday', '2', 'Communication Skills', 'Theory', 1, 1),
(15, 'A', 'Wednesday', '3', 'Fundamentals of Web Development', 'Theory', 1, 1),
(16, 'A', 'Wednesday', '4', 'Fundamentals of Programming C', 'Theory', 1, 1),
(17, 'A', 'Wednesday', '7', 'LUNCH', 'Break', 1, 1),
(18, 'A', 'Wednesday', '3', 'Fundamentals of Web Development', 'Practical', 1, 1),
(19, 'A', 'Thursday', '1', 'Fundamentals of Web Development', 'Theory', 1, 1),
(20, 'A', 'Thursday', '2', 'Fundamentals of Programming C', 'Theory', 1, 1),
(21, 'A', 'Thursday', '3', 'Fundamentals of Computer', 'Theory', 1, 1),
(22, 'A', 'Thursday', '4', 'Communication Skills', 'Theory', 1, 1),
(23, 'A', 'Thursday', '7', 'LUNCH', 'Break', 1, 1),
(24, 'A', 'Thursday', '3', 'Fundamentals of Computer', 'Practical', 1, 1),
(25, 'A', 'Friday', '1', 'Fundamentals of Programming C', 'Theory', 1, 1),
(26, 'A', 'Friday', '2', 'Fundamentals of Computer', 'Theory', 1, 1),
(27, 'A', 'Friday', '3', 'Mathematics', 'Theory', 1, 1),
(28, 'A', 'Friday', '4', '', '', 1, 1),
(29, 'A', 'Friday', '7', 'LUNCH', 'Break', 1, 1),
(30, 'A', 'Friday', '5', '', '', 1, 1),
(31, 'A', 'Friday', '6', '', '', 1, 1),
(32, 'B', 'Monday', '1', 'Communication Skills', 'Theory', 1, 1),
(33, 'B', 'Monday', '2', 'Fundamentals of Programming C', 'Theory', 1, 1),
(34, 'B', 'Monday', '2', 'Fundamentals of Web Development', 'Practical', 1, 1),
(35, 'B', 'Monday', '7', 'LUNCH', 'Break', 1, 1),
(36, 'B', 'Monday', '5', 'Fundamentals of Web Development', 'Theory', 1, 1),
(37, 'B', 'Monday', '6', 'Mathematics', 'Theory', 1, 1),
(38, 'B', 'Tuesday', '1', 'Communication Skills', 'Theory', 1, 1),
(39, 'B', 'Tuesday', '2', 'Fundamentals of Web Development', 'Theory', 1, 1),
(40, 'B', 'Tuesday', '3', 'Fundamentals of Programming C', 'Theory', 1, 1),
(41, 'B', 'Tuesday', '2.5', 'Fundamentals of Programming C', 'Practical', 1, 1),
(42, 'B', 'Tuesday', '6', '', '', 1, 1),
(43, 'B', 'Wednesday', '1', 'Fundamentals of Computer', 'Theory', 1, 1),
(44, 'B', 'Wednesday', '2', 'Fundamentals of Web Development', 'Theory', 1, 1),
(45, 'B', 'Wednesday', '3', 'Communication Skills', 'Theory', 1, 1),
(46, 'B', 'Wednesday', '4', 'Library', 'Theory', 1, 1),
(47, 'B', 'Wednesday', '7', 'LUNCH', 'Break', 1, 1),
(48, 'B', 'Wednesday', '5', 'Fundamentals of Programming C', 'Theory', 1, 1),
(49, 'B', 'Wednesday', '6', 'Mathematics', 'Theory', 1, 1),
(50, 'B', 'Thursday', '1', 'Fundamentals of Web Development', 'Theory', 1, 1),
(51, 'B', 'Thursday', '2', 'Fundamentals of Computer', 'Theory', 1, 1),
(52, 'B', 'Thursday', '3', 'Mathematics', 'Theory', 1, 1),
(53, 'B', 'Thursday', '4', 'Communication Skills', 'Theory', 1, 1),
(54, 'B', 'Thursday', '7', 'LUNCH', 'Break', 1, 1),
(55, 'B', 'Thursday', '5', 'Fundamentals of Programming C', 'Theory', 1, 1),
(56, 'B', 'Thursday', '6', 'Library', 'Theory', 1, 1),
(57, 'B', 'Friday', '1', 'Fundamentals of Computer', 'Theory', 1, 1),
(58, 'B', 'Friday', '1.5', 'Fundamentals of Computer', 'Practical', 1, 1),
(59, 'B', 'Friday', '4', 'Mathematics', 'Theory', 1, 1),
(60, 'B', 'Friday', '7', 'LUNCH', 'Break', 1, 1),
(61, 'B', 'Friday', '5', 'Fundamentals of Computer', 'Theory', 1, 1),
(62, 'B', 'Friday', '6', '', '', 1, 1),
(63, 'C', 'Monday', '1', 'Communication Skills', 'Theory', 1, 1),
(64, 'C', 'Monday', '2', 'Fundamentals of Programming C', 'Theory', 1, 1),
(65, 'C', 'Monday', '2', 'Fundamentals of Web Development', 'Practical', 1, 1),
(66, 'C', 'Monday', '7', 'LUNCH', 'Break', 1, 1),
(67, 'C', 'Monday', '5', 'Fundamentals of Computer', 'Theory', 1, 1),
(68, 'C', 'Monday', '6', 'Mathematics', 'Theory', 1, 1),
(69, 'C', 'Tuesday', '1', 'Fundamentals of Computer', 'Theory', 1, 1),
(70, 'C', 'Tuesday', '2', 'Fundamentals of Programming C', 'Theory', 1, 1),
(71, 'C', 'Tuesday', '3', 'Library', 'Theory', 1, 1),
(72, 'C', 'Tuesday', '2.5', 'Fundamentals of Computer', 'Practical', 1, 1),
(73, 'C', 'Tuesday', '6', '', '', 1, 1),
(74, 'C', 'Wednesday', '1', 'Fundamentals of Computer', 'Theory', 1, 1),
(75, 'C', 'Wednesday', '2', 'Fundamentals of Web Development', 'Theory', 1, 1),
(76, 'C', 'Wednesday', '3', 'Communication Skills', 'Theory', 1, 1),
(77, 'C', 'Wednesday', '4', 'Fundamentals of Programming C', 'Theory', 1, 1),
(78, 'C', 'Wednesday', '7', 'LUNCH', 'Break', 1, 1),
(79, 'C', 'Wednesday', '5', 'Mathematics', 'Theory', 1, 1),
(80, 'C', 'Wednesday', '6', '', '', 1, 1),
(81, 'C', 'Thursday', '1', 'Fundamentals of Programming C', 'Theory', 1, 1),
(82, 'C', 'Thursday', '2', 'Fundamentals of Web Development', 'Theory', 1, 1),
(83, 'C', 'Thursday', '3', 'Communication Skills', 'Theory', 1, 1),
(84, 'C', 'Thursday', '4', 'Fundamentals of Computer', 'Theory', 1, 1),
(85, 'C', 'Thursday', '7', 'LUNCH', 'Break', 1, 1),
(86, 'C', 'Thursday', '5', 'Mathematics', 'Theory', 1, 1),
(87, 'C', 'Thursday', '6', '', '', 1, 1),
(88, 'C', 'Friday', '1', 'Communication Skills', 'Theory', 1, 1),
(89, 'C', 'Friday', '2', 'Mathematics', 'Theory', 1, 1),
(90, 'C', 'Friday', '2', 'Fundamentals of Programming C', 'Practical', 1, 1),
(91, 'C', 'Friday', '7', 'LUNCH', 'Break', 1, 1),
(92, 'C', 'Friday', '5', 'Fundamentals of Web Development', 'Theory', 1, 1),
(93, 'C', 'Friday', '6', 'Library', 'Theory', 1, 1),
(94, 'D', 'Monday', '1', 'Mathematics', 'Theory', 1, 1),
(95, 'D', 'Monday', '2', 'Communication Skills', 'Theory', 1, 1),
(96, 'D', 'Monday', '3', 'Fundamentals of Programming C', 'Theory', 1, 1),
(97, 'D', 'Monday', '4', 'Fundamentals of Web Development', 'Theory', 1, 1),
(98, 'D', 'Monday', '7', 'LUNCH', 'Break', 1, 1),
(99, 'D', 'Monday', '5', 'Fundamentals of Computer', 'Theory', 1, 1),
(100, 'D', 'Monday', '6', '', '', 1, 1),
(101, 'D', 'Tuesday', '1', 'Mathematics', 'Theory', 1, 1),
(102, 'D', 'Tuesday', '2', 'Fundamentals of Computer', 'Theory', 1, 1),
(103, 'D', 'Tuesday', '2', 'Fundamentals of Computer', 'Practical', 1, 1),
(104, 'D', 'Tuesday', '7', 'LUNCH', 'Break', 1, 1),
(105, 'D', 'Tuesday', '5', 'Communication Skills', 'Theory', 1, 1),
(106, 'D', 'Tuesday', '6', 'Library', 'Theory', 1, 1),
(107, 'D', 'Wednesday', '1', 'Fundamentals of Web Development', 'Theory', 1, 1),
(108, 'D', 'Wednesday', '2', 'Fundamentals of Computer', 'Theory', 1, 1),
(109, 'D', 'Wednesday', '2', 'Fundamentals of Web Development', 'Practical', 1, 1),
(110, 'D', 'Wednesday', '7', 'LUNCH', 'Break', 1, 1),
(111, 'D', 'Wednesday', '5', 'Mathematics', 'Theory', 1, 1),
(112, 'D', 'Wednesday', '6', '', '', 1, 1),
(113, 'D', 'Thursday', '1', 'Fundamentals of Web Development', 'Theory', 1, 1),
(114, 'D', 'Thursday', '2', 'Communication Skills', 'Theory', 1, 1),
(115, 'D', 'Thursday', '2', 'Fundamentals of Programming C', 'Practical', 1, 1),
(116, 'D', 'Thursday', '7', 'LUNCH', 'Break', 1, 1),
(117, 'D', 'Thursday', '5', 'Fundamentals of Computer', 'Theory', 1, 1),
(118, 'D', 'Thursday', '6', 'Mathematics', 'Theory', 1, 1),
(119, 'D', 'Friday', '1', 'Fundamentals of Programming C', 'Theory', 1, 1),
(120, 'D', 'Friday', '2', 'Library', 'Theory', 1, 1),
(121, 'D', 'Friday', '3', 'Fundamentals of Web Development', 'Theory', 1, 1),
(122, 'D', 'Friday', '4', 'Communication Skills', 'Theory', 1, 1),
(123, 'D', 'Friday', '7', 'LUNCH', 'Break', 1, 1),
(124, 'D', 'Friday', '5', 'Fundamentals of Programming C', 'Theory', 1, 1),
(125, 'D', 'Friday', '6', '', '', 1, 1),
(126, 'E', 'Monday', '1', 'Fundamentals of Computer', 'Theory', 1, 1),
(127, 'E', 'Monday', '1.5', 'Fundamentals of Computer', 'Practical', 1, 1),
(128, 'E', 'Monday', '4', 'Mathematics', 'Theory', 1, 1),
(129, 'E', 'Monday', '7', 'LUNCH', 'Break', 1, 1),
(130, 'E', 'Monday', '5', 'Fundamentals of Web Development', 'Theory', 1, 1),
(131, 'E', 'Monday', '6', '', '', 1, 1),
(132, 'E', 'Tuesday', '1', 'Library', 'Theory', 1, 1),
(133, 'E', 'Tuesday', '1.5', 'Fundamentals of Web Development', 'Practical', 1, 1),
(134, 'E', 'Tuesday', '4', 'Mathematics', 'Theory', 1, 1),
(135, 'E', 'Tuesday', '7', 'LUNCH', 'Break', 1, 1),
(136, 'E', 'Tuesday', '5', 'Fundamentals of Web Development', 'Theory', 1, 1),
(137, 'E', 'Tuesday', '6', '', '', 1, 1),
(138, 'E', 'Wednesday', '1', 'Library', 'Theory', 1, 1),
(139, 'E', 'Wednesday', '2', 'Fundamentals of Programming C', 'Theory', 1, 1),
(140, 'E', 'Wednesday', '3', 'Fundamentals of Web Development', 'Theory', 1, 1),
(141, 'E', 'Wednesday', '4', 'Mathematics', 'Theory', 1, 1),
(142, 'E', 'Wednesday', '7', 'LUNCH', 'Break', 1, 1),
(143, 'E', 'Wednesday', '5', 'Communication Skills', 'Theory', 1, 1),
(144, 'E', 'Wednesday', '6', '', '', 1, 1),
(145, 'E', 'Thursday', '1', 'Fundamentals of Computer', 'Theory', 1, 1),
(146, 'E', 'Thursday', '2', 'Mathematics', 'Theory', 1, 1),
(147, 'E', 'Thursday', '2', 'Fundamentals of Programming C', 'Practical', 1, 1),
(148, 'E', 'Thursday', '7', 'LUNCH', 'Break', 1, 1),
(149, 'E', 'Thursday', '5', 'Fundamentals of Web Development', 'Theory', 1, 1),
(150, 'E', 'Thursday', '6', 'Communication Skills', 'Theory', 1, 1),
(151, 'E', 'Friday', '1', 'Fundamentals of Programming C', 'Theory', 1, 1),
(152, 'E', 'Friday', '2', 'Fundamentals of Computer', 'Theory', 1, 1),
(153, 'E', 'Friday', '3', 'Communication Skills', 'Theory', 1, 1),
(154, 'E', 'Friday', '4', 'Fundamentals of Programming C', 'Theory', 1, 1),
(155, 'E', 'Friday', '7', 'LUNCH', 'Break', 1, 1),
(156, 'E', 'Friday', '5', 'Fundamentals of Computer', 'Theory', 1, 1),
(157, 'E', 'Friday', '6', 'Communication Skills', 'Theory', 1, 1),
(158, 'F', 'Monday', '1', 'Fundamentals of Web Development', 'Theory', 1, 1),
(159, 'F', 'Monday', '2', 'Communication Skills', 'Theory', 1, 1),
(160, 'F', 'Monday', '2', 'Fundamentals of Computer', 'Practical', 1, 1),
(161, 'F', 'Monday', '7', 'LUNCH', 'Break', 1, 1),
(162, 'F', 'Monday', '5', 'Fundamentals of Computer', 'Theory', 1, 1),
(163, 'F', 'Monday', '6', 'Fundamentals of Programming C', 'Theory', 1, 1),
(164, 'F', 'Tuesday', '1', 'Communication Skills', 'Theory', 1, 1),
(165, 'F', 'Tuesday', '2', 'Fundamentals of Web Development', 'Theory', 1, 1),
(166, 'F', 'Tuesday', '3', 'Library', 'Theory', 1, 1),
(167, 'F', 'Tuesday', '4', 'Fundamentals of Programming C', 'Theory', 1, 1),
(168, 'F', 'Tuesday', '7', 'LUNCH', 'Break', 1, 1),
(169, 'F', 'Tuesday', '5', 'Mathematics', 'Theory', 1, 1),
(170, 'F', 'Tuesday', '6', '', '', 1, 1),
(171, 'F', 'Wednesday', '1', 'Library', 'Theory', 1, 1),
(172, 'F', 'Wednesday', '2', 'Fundamentals of Computer', 'Theory', 1, 1),
(173, 'F', 'Wednesday', '2', 'Fundamentals of Web Development', 'Practical', 1, 1),
(174, 'F', 'Wednesday', '7', 'LUNCH', 'Break', 1, 1),
(175, 'F', 'Wednesday', '5', 'Fundamentals of Programming C', 'Theory', 1, 1),
(176, 'F', 'Wednesday', '6', 'Fundamentals of Web Development', 'Theory', 1, 1),
(177, 'F', 'Thursday', '1', 'Communication Skills', 'Theory', 1, 1),
(178, 'F', 'Thursday', '1.5', 'Fundamentals of Programming C', 'Practical', 1, 1),
(179, 'F', 'Thursday', '4', 'Fundamentals of Programming C', 'Theory', 1, 1),
(180, 'F', 'Thursday', '7', 'LUNCH', 'Break', 1, 1),
(181, 'F', 'Thursday', '5', 'Mathematics', 'Theory', 1, 1),
(182, 'F', 'Thursday', '6', 'Fundamentals of Web Development', 'Theory', 1, 1),
(183, 'F', 'Friday', '1', 'Mathematics', 'Theory', 1, 1),
(184, 'F', 'Friday', '2', 'Fundamentals of Computer', 'Theory', 1, 1),
(185, 'F', 'Friday', '3', 'Communication Skills', 'Theory', 1, 1),
(186, 'F', 'Friday', '4', '', '', 1, 1),
(187, 'F', 'Friday', '7', 'LUNCH', 'Break', 1, 1),
(188, 'F', 'Friday', '5', '', '', 1, 1),
(189, 'F', 'Friday', '6', '', '', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ad_id`),
  ADD UNIQUE KEY `eid` (`ad_email`),
  ADD KEY `user_name` (`ad_name`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dep_id`);
ALTER TABLE `department` ADD FULLTEXT KEY `course_name` (`dep_name`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`fac_id`),
  ADD UNIQUE KEY `eid` (`fac_email`),
  ADD KEY `department_id` (`dep_id`);
ALTER TABLE `faculty` ADD FULLTEXT KEY `name` (`fac_name`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`sem_id`),
  ADD KEY `course_id` (`dep_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`std_id`),
  ADD UNIQUE KEY `eid` (`std_email`),
  ADD KEY `department_id` (`dep_id`),
  ADD KEY `sem_id` (`sem_id`);
ALTER TABLE `student` ADD FULLTEXT KEY `name` (`std_fname`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`sub_id`),
  ADD KEY `course_id` (`dep_id`),
  ADD KEY `sem_id` (`sem_id`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`tt_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `fac_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `sem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `std_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `tt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
