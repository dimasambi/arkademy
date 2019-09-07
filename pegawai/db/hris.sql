-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2018 at 04:37 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hris`
--

-- --------------------------------------------------------

--
-- Table structure for table `agreement_letter`
--

CREATE TABLE `agreement_letter` (
  `agreement_letter_id` int(8) NOT NULL,
  `agreement_letter_path` text NOT NULL,
  `date_of_submit` date NOT NULL,
  `employee_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `applicant`
--

CREATE TABLE `applicant` (
  `applicant_id` int(8) NOT NULL,
  `applicant_email` tinytext NOT NULL,
  `applicant_password` varchar(25) NOT NULL,
  `position` tinytext NOT NULL,
  `source` varchar(30) NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicant`
--

INSERT INTO `applicant` (`applicant_id`, `applicant_email`, `applicant_password`, `position`, `source`, `created_date`) VALUES
(4, 'gandaekasaputra@gmail.com', 'zimf0pgt', 'Data', 'Jobstreet', '2018-03-03'),
(5, 'gan_078816@yahoo.com', 'mqd6u0c1', 'Android', 'Office', '2018-03-03');

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

CREATE TABLE `applicants` (
  `applicant_id` int(8) NOT NULL,
  `job_submission` text NOT NULL,
  `salary_demand` bigint(15) NOT NULL DEFAULT '0',
  `vacancy_information` text NOT NULL,
  `password` varchar(8) NOT NULL,
  `interview_date` date NOT NULL,
  `applicant_status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicants`
--

INSERT INTO `applicants` (`applicant_id`, `job_submission`, `salary_demand`, `vacancy_information`, `password`, `interview_date`, `applicant_status`) VALUES
(4, '', 0, '', '12345678', '2018-02-28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `attendent`
--

CREATE TABLE `attendent` (
  `employee_id` int(8) NOT NULL,
  `attendent_date` datetime NOT NULL,
  `attendent_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `biodata`
--

CREATE TABLE `biodata` (
  `biodata_id` int(8) NOT NULL,
  `applicant_id` int(8) NOT NULL,
  `name` varchar(30) NOT NULL,
  `photo` text NOT NULL,
  `sex` char(1) NOT NULL,
  `marital_status` char(4) NOT NULL,
  `blood_type` char(2) NOT NULL,
  `spouse_id` int(8) NOT NULL,
  `email` text NOT NULL,
  `address_residential` text NOT NULL,
  `religion` tinytext NOT NULL,
  `phone_number1` varchar(15) NOT NULL,
  `phone_number2` varchar(15) NOT NULL,
  `phone_number3` varchar(15) NOT NULL,
  `dob_place` tinytext NOT NULL,
  `dob_date` date NOT NULL,
  `nik_ktp` bigint(16) NOT NULL,
  `nik_npwp` bigint(15) NOT NULL,
  `orientation` tinyint(2) NOT NULL,
  `emergency_phone` varchar(15) NOT NULL,
  `relationship` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `biodata`
--

INSERT INTO `biodata` (`biodata_id`, `applicant_id`, `name`, `photo`, `sex`, `marital_status`, `blood_type`, `spouse_id`, `email`, `address_residential`, `religion`, `phone_number1`, `phone_number2`, `phone_number3`, `dob_place`, `dob_date`, `nik_ktp`, `nik_npwp`, `orientation`, `emergency_phone`, `relationship`) VALUES
(2, 4, 'Ganda Eka Saputra', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', 0, 0, 0, '', 0),
(3, 5, 'Saputra', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `children`
--

CREATE TABLE `children` (
  `children_id` int(2) NOT NULL,
  `biodata_id` int(8) NOT NULL,
  `children_name` varchar(30) NOT NULL,
  `children_dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `education_id` int(4) NOT NULL,
  `education` char(2) NOT NULL,
  `major` text NOT NULL,
  `education_institution` text NOT NULL,
  `ijazah` char(1) NOT NULL,
  `graduation_date` date NOT NULL,
  `biodata_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employe_id` int(8) NOT NULL,
  `biodata_id` int(8) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `join_date` date NOT NULL,
  `position_id` int(4) NOT NULL,
  `office_id` int(4) NOT NULL,
  `grade` tinyint(2) NOT NULL,
  `placement_id` int(4) NOT NULL,
  `employment_status` varchar(30) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employe_id`, `biodata_id`, `username`, `password`, `join_date`, `position_id`, `office_id`, `grade`, `placement_id`, `employment_status`, `email`) VALUES
(1, 0, 'admin', 'admin123', '0000-00-00', 0, 0, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `employee_bank`
--

CREATE TABLE `employee_bank` (
  `employee_bank_id` int(8) NOT NULL,
  `account_name` varchar(30) NOT NULL,
  `account_number` bigint(25) NOT NULL,
  `bank_name` varchar(30) NOT NULL,
  `bank_branch` varchar(30) NOT NULL,
  `employee_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_language`
--

CREATE TABLE `employee_language` (
  `employee_language_id` int(8) NOT NULL,
  `language` varchar(25) NOT NULL,
  `conversation` int(2) NOT NULL DEFAULT '0',
  `employee_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_skill`
--

CREATE TABLE `employee_skill` (
  `employee_skill_id` int(8) NOT NULL,
  `employe_id` int(8) NOT NULL,
  `skill_name` varchar(30) NOT NULL,
  `skill_level` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interview`
--

CREATE TABLE `interview` (
  `interview_id` int(8) NOT NULL,
  `interview_date` date NOT NULL,
  `interview_time` time NOT NULL,
  `interview_place` tinyint(2) NOT NULL,
  `applicant_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interview`
--

INSERT INTO `interview` (`interview_id`, `interview_date`, `interview_time`, `interview_place`, `applicant_id`) VALUES
(1, '2018-03-14', '12:40:00', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ktp`
--

CREATE TABLE `ktp` (
  `nik_ktp` bigint(16) NOT NULL,
  `ktp_address` text NOT NULL,
  `ktp_photo` text NOT NULL,
  `ktp_rt_rw` varchar(10) NOT NULL,
  `ktp_kelurahan` varchar(35) NOT NULL,
  `ktp_kecamatan` varchar(35) NOT NULL,
  `ktp_kota` varchar(50) NOT NULL,
  `ktp_kode_pos` tinyint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `npwp`
--

CREATE TABLE `npwp` (
  `nik_npwp` bigint(15) NOT NULL,
  `npwp_name` varchar(30) NOT NULL,
  `npwp_address` text NOT NULL,
  `npwp_photo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `office_id` tinyint(2) NOT NULL,
  `office_name` varchar(50) NOT NULL,
  `office_address` text NOT NULL,
  `office_phone` varchar(20) NOT NULL,
  `office_fax` varchar(20) NOT NULL,
  `office_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `office`
--

INSERT INTO `office` (`office_id`, `office_name`, `office_address`, `office_phone`, `office_fax`, `office_status`) VALUES
(1, 'Head Office - Solusi 247 Jakarta', '', '', '', 0),
(2, 'Branch - Solusi 247 Yogyakarta', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `onleave`
--

CREATE TABLE `onleave` (
  `onleave_id` int(8) NOT NULL,
  `onleave_description` text NOT NULL,
  `onleave_startdate` date NOT NULL,
  `onleave_finishdate` date NOT NULL,
  `employee_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `placement`
--

CREATE TABLE `placement` (
  `placement_id` int(4) NOT NULL,
  `placement_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` int(4) NOT NULL,
  `position_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sim`
--

CREATE TABLE `sim` (
  `sim_no` int(12) NOT NULL,
  `sim_type` varchar(3) NOT NULL,
  `sim_expired_date` date NOT NULL,
  `biodata_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `spouse`
--

CREATE TABLE `spouse` (
  `spouse_id` int(8) NOT NULL,
  `spouse_name` varchar(30) NOT NULL,
  `spouse_dob` date NOT NULL,
  `nik_npwp` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(8) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `employee_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agreement_letter`
--
ALTER TABLE `agreement_letter`
  ADD PRIMARY KEY (`agreement_letter_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `applicant`
--
ALTER TABLE `applicant`
  ADD PRIMARY KEY (`applicant_id`);

--
-- Indexes for table `applicants`
--
ALTER TABLE `applicants`
  ADD PRIMARY KEY (`applicant_id`);

--
-- Indexes for table `attendent`
--
ALTER TABLE `attendent`
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `biodata`
--
ALTER TABLE `biodata`
  ADD PRIMARY KEY (`biodata_id`),
  ADD KEY `spouse_id` (`spouse_id`),
  ADD KEY `nik_ktp` (`nik_ktp`),
  ADD KEY `nik_npwp` (`nik_npwp`);

--
-- Indexes for table `children`
--
ALTER TABLE `children`
  ADD PRIMARY KEY (`children_id`),
  ADD KEY `biodata_id` (`biodata_id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`education_id`),
  ADD KEY `biodata_id` (`biodata_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employe_id`),
  ADD KEY `position_id` (`position_id`),
  ADD KEY `placement_id` (`placement_id`),
  ADD KEY `office_id` (`office_id`),
  ADD KEY `biodata_id` (`biodata_id`);

--
-- Indexes for table `employee_bank`
--
ALTER TABLE `employee_bank`
  ADD PRIMARY KEY (`employee_bank_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee_language`
--
ALTER TABLE `employee_language`
  ADD PRIMARY KEY (`employee_language_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee_skill`
--
ALTER TABLE `employee_skill`
  ADD PRIMARY KEY (`employee_skill_id`),
  ADD KEY `employe_id` (`employe_id`);

--
-- Indexes for table `interview`
--
ALTER TABLE `interview`
  ADD PRIMARY KEY (`interview_id`);

--
-- Indexes for table `ktp`
--
ALTER TABLE `ktp`
  ADD PRIMARY KEY (`nik_ktp`);

--
-- Indexes for table `npwp`
--
ALTER TABLE `npwp`
  ADD PRIMARY KEY (`nik_npwp`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`office_id`);

--
-- Indexes for table `onleave`
--
ALTER TABLE `onleave`
  ADD PRIMARY KEY (`onleave_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `placement`
--
ALTER TABLE `placement`
  ADD PRIMARY KEY (`placement_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `spouse`
--
ALTER TABLE `spouse`
  ADD PRIMARY KEY (`spouse_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agreement_letter`
--
ALTER TABLE `agreement_letter`
  MODIFY `agreement_letter_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `applicant`
--
ALTER TABLE `applicant`
  MODIFY `applicant_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `applicants`
--
ALTER TABLE `applicants`
  MODIFY `applicant_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `biodata`
--
ALTER TABLE `biodata`
  MODIFY `biodata_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `children`
--
ALTER TABLE `children`
  MODIFY `children_id` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `education_id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employe_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employee_bank`
--
ALTER TABLE `employee_bank`
  MODIFY `employee_bank_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee_language`
--
ALTER TABLE `employee_language`
  MODIFY `employee_language_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee_skill`
--
ALTER TABLE `employee_skill`
  MODIFY `employee_skill_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `interview`
--
ALTER TABLE `interview`
  MODIFY `interview_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `office`
--
ALTER TABLE `office`
  MODIFY `office_id` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `onleave`
--
ALTER TABLE `onleave`
  MODIFY `onleave_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `placement`
--
ALTER TABLE `placement`
  MODIFY `placement_id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `spouse`
--
ALTER TABLE `spouse`
  MODIFY `spouse_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `agreement_letter`
--
ALTER TABLE `agreement_letter`
  ADD CONSTRAINT `agreement_letter_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employe_id`);

--
-- Constraints for table `attendent`
--
ALTER TABLE `attendent`
  ADD CONSTRAINT `attendent_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employe_id`);

--
-- Constraints for table `children`
--
ALTER TABLE `children`
  ADD CONSTRAINT `children_ibfk_1` FOREIGN KEY (`biodata_id`) REFERENCES `biodata` (`biodata_id`);

--
-- Constraints for table `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_ibfk_1` FOREIGN KEY (`biodata_id`) REFERENCES `biodata` (`biodata_id`);

--
-- Constraints for table `employee_bank`
--
ALTER TABLE `employee_bank`
  ADD CONSTRAINT `employee_bank_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employe_id`);

--
-- Constraints for table `employee_language`
--
ALTER TABLE `employee_language`
  ADD CONSTRAINT `employee_language_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employe_id`);

--
-- Constraints for table `employee_skill`
--
ALTER TABLE `employee_skill`
  ADD CONSTRAINT `employee_skill_ibfk_1` FOREIGN KEY (`employe_id`) REFERENCES `employee` (`employe_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employe_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
