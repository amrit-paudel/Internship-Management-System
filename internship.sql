-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2022 at 08:04 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `internship`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `fullname`, `email`, `password`, `created_at`) VALUES
(1, 'Rajesh Khanal', 'admin@pcampus.edu.com', '12345678', '2022-06-08 05:01:41');

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `status` enum('approved','pending','deleted') NOT NULL DEFAULT 'pending',
  `cus_id` int(11) NOT NULL,
  `int_id` int(11) NOT NULL,
  `workstatus` varchar(111) NOT NULL DEFAULT 'not interning',
  `applied` int(11) NOT NULL DEFAULT 0,
  `applied_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `status`, `cus_id`, `int_id`, `workstatus`, `applied`, `applied_at`) VALUES
(163, 'approved', 39, 97, 'not interning', 1, '2022-06-19'),
(164, 'pending', 40, 96, 'interning', 1, '2022-06-22'),
(166, 'approved', 39, 108, 'not interning', 1, '2022-06-23'),
(167, 'approved', 39, 109, 'not interning', 1, '2022-06-23'),
(170, 'approved', 42, 109, 'not interning', 1, '2022-06-23'),
(171, 'approved', 39, 110, 'not interning', 1, '2022-06-23'),
(172, 'approved', 39, 111, 'not interning', 1, '2021-06-07'),
(173, 'approved', 45, 107, 'not interning', 1, '2022-06-24'),
(174, 'approved', 1, 1, 'interning', 1, '2022-06-24'),
(176, 'approved', 2, 1, 'not interning', 1, '2022-06-24'),
(177, 'approved', 2, 2, 'interning', 1, '2022-06-24');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address1` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `phone` text NOT NULL,
  `deleted` int(50) NOT NULL DEFAULT 0,
  `otp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `fullname`, `email`, `password`, `address1`, `city`, `phone`, `deleted`, `otp`) VALUES
(1, 'Rajesh Khanal', '076bct099.rajesh@pcampus.edu.np', '12345678', 'Nawalparasi', 'Daldale', '9863244500', 0, 0),
(2, 'Saugat Poudel', '075bct101.saugat@pcampus.edu.np', '12345678', 'Lekhnath', 'Pokhara', '9762869449', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `id` int(11) NOT NULL,
  `nameOfCompany` text NOT NULL,
  `aboutCompany` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zipcode` int(100) NOT NULL,
  `phone` text NOT NULL,
  `country` varchar(100) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`id`, `nameOfCompany`, `aboutCompany`, `email`, `password`, `address1`, `address2`, `city`, `state`, `zipcode`, `phone`, `country`, `ip`, `date`) VALUES
(1, 'NETMATE SOLUTIONS', 'Digital Marketing Agency', 'sksharma.sharma87@gmail.com', 'Shar8286', '302, B-7, Sector-9', 'Shanti Nagar, Mira Road East', 'Mira Bhayandar', 'Maharashtra', 401107, '8286864601', 'India', '::1', '2022-09-04 17:03:24'),
(2, 'IIT Bombay', 'The Indian Institute of Technology, Bombay (IITB) is one of the fifteen higher institutes of technology in the country set up with the objective of making facilities available for higher education, research, and training in various fields of science and technology. With the same mission and vision, Prof. Ganesh Ramakrishnan is gearing to take rural India a leap ahead. For his outstanding contributions, he has also been awarded the IBM Faculty Award 2011.', 'itsumeet@gmail.com', 'Shar8850', '201, C-15, Sector-6', 'Shanti Nagar, Mira Road East', 'Mumbai', 'Maharashtra', 401107, '8850948655', 'India', '::1', '2022-09-04 18:20:09'),
(3, 'Google.org', 'Google.org, founded in October 2005, is the charitable arm of Google, a multinational technology company. The organization has committed roughly US$100 million in investments and grants to nonprofits annually', 'google@gmail.com', 'mmmm', 'USA', '', 'Washington', '', 0, '25232432', 'USA', '::1', '2021-06-16 12:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `internships`
--

CREATE TABLE `internships` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `category` text NOT NULL,
  `postedOn` date NOT NULL DEFAULT current_timestamp(),
  `applyBy` date NOT NULL DEFAULT current_timestamp(),
  `nameOfCompany` text NOT NULL DEFAULT 'Not Mentioned',
  `aboutCompany` text NOT NULL DEFAULT 'Not Mentioned',
  `aboutInternship` text NOT NULL DEFAULT 'Not Mentioned',
  `location` text NOT NULL DEFAULT 'Not Mentioned',
  `perks` text NOT NULL,
  `duration` int(100) NOT NULL,
  `stipend` varchar(100) NOT NULL DEFAULT 'Not Mentioned',
  `positions` int(11) NOT NULL,
  `whoCanApply` text NOT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT 0,
  `deleted` tinyint(4) NOT NULL DEFAULT 0,
  `interview_date` date DEFAULT NULL,
  `url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `internships`
--

INSERT INTO `internships` (`id`, `emp_id`, `category`, `postedOn`, `applyBy`, `nameOfCompany`, `aboutCompany`, `aboutInternship`, `location`, `perks`, `duration`, `stipend`, `positions`, `whoCanApply`, `featured`, `deleted`, `interview_date`, `url`) VALUES
(1, 0, 'Web Developer', '2022-06-23', '2022-06-29', 'Zenlab', 'The Zenlab is one of the largest software making company in the country set up with the objective of making facilities available for higher qualitative, software, and services in various fields of technology. With the same mission and vision, CEO and founder of Company is planning to increase his service over the whole country. For his outstanding contributions, he has also been awarded the IBM Faculty Award 2011.', 'Selected intern&#039;s day-to-day responsibilities include: \r\n\r\n1. Collaborate with teams to implement new features, improvements, and fixes needed to handle our current and future scale\r\n2. Write reusable, testable, and efficient code\r\n3. Build, optimize and scale our Node.js platform and applications\r\n4. Design and implement low-latency, high-availability, and performant applications\r\n5. Implement secure applications and data protection\r\n6. Integrate RESTful APIs &amp;amp;amp; internal web services ensuring high performance\r\n7. Collaborate across teams and contributing to open source\r\n8. Troubleshoot production issues and implement fixes for them\r\n9. Learn and teach peers new technologies', 'New Baneshwor', 'Certificate', 4, '0', 8, 'Only those candidates can apply who:\r\n\r\n1. are available for full time (in-office) internship\r\n2. can start the internship between 23rd Aug&amp;#039;19 and 22nd Sep&amp;#039;19\r\n3. are available for duration of 4 months\r\n4. are from Kathmandu valley and neighboring cities\r\n5. have relevant skills and interests', 0, 0, '2022-06-30', ''),
(2, 0, 'Graphics Designing', '2022-06-23', '2022-06-28', 'Dreamsys IT Solutions Pvt. Ltd.', 'Digital Marketing Agency', 'Selected intern&#039;s day-to-day responsibilities include:\r\n\r\n1. Brainstorming and ideating in making creative designs for various marketing campaigns\r\n2. Working on digital collaterals such as design banners for website, newsletters, and other social media channels\r\n3. Working on print collaterals such as posters, brochures, standees, event collaterals, leaflets, etc.', 'Lekhnath', 'Certificate, Recommendation Letter', 3, '10000', 10, 'Only those candidates can apply who:\r\n\r\n1. are available for full time (in-office) internship\r\n2. can start the internship between 10th Sep&amp;#039;21 and 15th Sep&amp;#039;21\r\n3. are available for duration of 3 months\r\n4. have relevant skills and interests\r\n\r\n** Women willing to start/restart their career can also apply.', 0, 0, '2022-06-29', ''),
(109, 0, 'Mobile App Developer', '2022-06-23', '2022-08-08', 'Orion Technology', 'A leading company of Nepal located at the heart of Pokhara which manages and develops the software, designs graphics and do many more work according to the requirement of the client.', 'Selected intern&#039;s day-to-day responsibilities include:\r\n\r\n1. Brainstorming and ideating in making creative designs for various marketing campaigns\r\n2. Working on digital collaterals such as design banners for website, newsletters, and other social media channels\r\n3. Working on print collaterals such as posters, brochures, standees, event collaterals, leaflets, etc.', 'Pokhara - 10, Birauta', 'Certificate, Recommendation Letter', 5, '5000', 4, 'Only those candidates can apply who:\r\n\r\n1. are available for full time (in-office) internship\r\n2. can start the internship between 10th Aug&amp;#039;19 and 9th Sep&amp;#039;19\r\n3. are available for duration of 4 months\r\n4. have relevant skills and interests\r\n\r\n** Women willing to start/restart their career can also apply.', 0, 0, '2022-08-09', '');

-- --------------------------------------------------------

--
-- Table structure for table `student_location`
--

CREATE TABLE `student_location` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `added_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_location`
--

INSERT INTO `student_location` (`id`, `name`, `email`, `company`, `address`, `category`, `duration`, `added_at`) VALUES
(1, 'Rajesh Khanal', '076bct099.rajesh@pcampus.edu.np', 'Zenlab', 'Pulchowk', 'Web Developer', '4', '2021-09-07'),
(34, 'Saugat Poudel', '075bct101.saugat@pcampus.edu.np', 'Dreamsys IT Solutions Pvt. Ltd.', 'Lekhnath', 'Graphics Designing', '3', '2022-06-24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL,
  `join_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `permission`, `join_date`, `last_login`) VALUES
(1, 'Sumeet Sharma', 'sksksharma0@gmail.com', 'password', 'admin,editor', '2018-10-06 01:00:34', '2018-10-03 09:12:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `internships`
--
ALTER TABLE `internships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_location`
--
ALTER TABLE `student_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `internships`
--
ALTER TABLE `internships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `student_location`
--
ALTER TABLE `student_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
