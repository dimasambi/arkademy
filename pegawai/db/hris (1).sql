-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2018 at 11:18 AM
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
-- Table structure for table `ability`
--

CREATE TABLE `ability` (
  `ability_id` int(8) NOT NULL,
  `biodata_id` int(8) NOT NULL,
  `job_application_id` int(8) NOT NULL,
  `ability_list_id` int(4) NOT NULL,
  `ability_level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ability_list`
--

CREATE TABLE `ability_list` (
  `ability_list_id` int(4) NOT NULL,
  `ability_name` varchar(25) NOT NULL,
  `ability_type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicant`
--

INSERT INTO `applicant` (`applicant_id`, `applicant_email`, `applicant_password`, `created_date`) VALUES
(4, 'gandaekasaputra@gmail.com', 'zimf0pgt', '2018-03-03'),
(5, 'gan_078816@yahoo.com', 'mqd6u0c1', '2018-03-03'),
(6, 'didit@gmail.com', 'i39iixao', '2018-03-14');

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
-- Table structure for table `authentic_document`
--

CREATE TABLE `authentic_document` (
  `authentic_document` int(2) NOT NULL,
  `authentic_document_type` varchar(30) NOT NULL,
  `authentic_document_required` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `authentic_document_applicant`
--

CREATE TABLE `authentic_document_applicant` (
  `authentic_document_applicant_id` int(8) NOT NULL,
  `job_application_id` int(8) NOT NULL,
  `authentic_document_id` int(2) NOT NULL,
  `authentic_document_applicant_exists` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `biodata`
--

CREATE TABLE `biodata` (
  `biodata_id` int(8) NOT NULL,
  `applicant_id` int(8) NOT NULL,
  `name` varchar(30) NOT NULL,
  `nickname` varchar(15) NOT NULL,
  `nik_ktp` tinyint(16) NOT NULL,
  `phone_number1` varchar(15) NOT NULL,
  `residential_address` text NOT NULL,
  `residential_rt_rw` varchar(10) NOT NULL,
  `residential_kelurahan` varchar(25) NOT NULL,
  `residential_kecamatan` varchar(25) NOT NULL,
  `residential_kota` int(20) NOT NULL,
  `residential_kode_pos` tinyint(5) NOT NULL,
  `dob_place` varchar(20) NOT NULL,
  `dob_date` date NOT NULL,
  `gender` char(1) NOT NULL,
  `marital_status` char(4) NOT NULL,
  `religion` varchar(20) NOT NULL,
  `blood_type` char(2) NOT NULL,
  `vehicle` varchar(20) NOT NULL,
  `vehicle_status` varchar(30) NOT NULL,
  `residential_status` varchar(30) NOT NULL,
  `is_exists_npwp` varchar(5) NOT NULL,
  `nik_npwp` tinyint(15) NOT NULL,
  `spouse_id` int(8) NOT NULL,
  `email` text NOT NULL,
  `phone_number2` varchar(15) NOT NULL,
  `phone_number3` varchar(15) NOT NULL,
  `orientation` tinyint(2) NOT NULL,
  `emergency_phone` varchar(15) NOT NULL,
  `relationship` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `biodata`
--

INSERT INTO `biodata` (`biodata_id`, `applicant_id`, `name`, `nickname`, `nik_ktp`, `phone_number1`, `residential_address`, `residential_rt_rw`, `residential_kelurahan`, `residential_kecamatan`, `residential_kota`, `residential_kode_pos`, `dob_place`, `dob_date`, `gender`, `marital_status`, `religion`, `blood_type`, `vehicle`, `vehicle_status`, `residential_status`, `is_exists_npwp`, `nik_npwp`, `spouse_id`, `email`, `phone_number2`, `phone_number3`, `orientation`, `emergency_phone`, `relationship`) VALUES
(2, 4, 'Ganda Eka Saputra', '', 0, '', '', '', '', '', 0, 0, '', '0000-00-00', '', '', '', '', '', '', '', '', 0, 0, '', '', '', 0, '', 0),
(3, 5, 'Saputra', '', 0, '', '', '', '', '', 0, 0, '', '0000-00-00', '', '', '', '', '', '', '', '', 0, 0, '', '', '', 0, '', 0),
(4, 6, 'Didit', '', 0, '', '', '', '', '', 0, 0, '', '0000-00-00', '', '', '', '', '', '', '', '', 0, 0, '', '', '', 0, '', 0);

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
-- Table structure for table `education_formal`
--

CREATE TABLE `education_formal` (
  `education_formal_id` int(8) NOT NULL,
  `biodata_id` int(8) NOT NULL,
  `education_formal_level` varchar(15) NOT NULL,
  `education_formal_institution_name` varchar(35) NOT NULL,
  `education_formal_city` varchar(20) NOT NULL,
  `education_formal_major` varchar(50) NOT NULL,
  `education_formal_start_year` year(4) NOT NULL,
  `education_formal_finish_year` year(4) NOT NULL,
  `education_formal_certificate_exists` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `education_non_formal`
--

CREATE TABLE `education_non_formal` (
  `education_non_formal_id` int(8) NOT NULL,
  `biodata_id` int(8) NOT NULL,
  `education_non_formal_type` varchar(50) NOT NULL,
  `education_non_formal_organizer` varchar(50) NOT NULL,
  `education_non_formal_city` varchar(20) NOT NULL,
  `education_non_formal_financed_by` varchar(50) NOT NULL,
  `education_non_formal_start_date` date NOT NULL,
  `education_non_formal_finish_date` date NOT NULL,
  `education_non_formal_certificate_exists` char(1) NOT NULL
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
-- Table structure for table `employment_history`
--

CREATE TABLE `employment_history` (
  `employment_history_id` int(8) NOT NULL,
  `biodata_id` int(8) NOT NULL,
  `employment_history_start_year` year(4) NOT NULL,
  `employment_history_finsih_year` year(4) NOT NULL,
  `employment_history_company_name` varchar(50) NOT NULL,
  `employment_history_company_address` text NOT NULL,
  `employment_history_company_phone` varchar(15) NOT NULL,
  `employment_history_company_business_type` varchar(30) NOT NULL,
  `employment_history_start_position` varchar(30) NOT NULL,
  `employment_history_last_position` varchar(30) NOT NULL,
  `employment_history_direct_supervisor_name` varchar(30) NOT NULL,
  `employment_history_director_name` varchar(30) NOT NULL,
  `employment_history_stop_reason` tinytext NOT NULL,
  `employment_history_last_salary` int(10) NOT NULL,
  `employment_history_basic_salary` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `family_married_tree`
--

CREATE TABLE `family_married_tree` (
  `family_married_tree_id` int(8) NOT NULL,
  `biodata_id` int(8) NOT NULL,
  `family_married_relationship` varchar(20) NOT NULL,
  `family_married_name` varchar(30) NOT NULL,
  `family_married_gender` char(1) NOT NULL,
  `family_married_education` varchar(35) NOT NULL,
  `family_married_job` varchar(35) NOT NULL,
  `family_married_dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `family_tree`
--

CREATE TABLE `family_tree` (
  `family_tree_id` int(8) NOT NULL,
  `biodata_id` int(8) NOT NULL,
  `family_relationship` varchar(20) NOT NULL,
  `family_name` varchar(30) NOT NULL,
  `family_gender` char(1) NOT NULL,
  `family_education` varchar(35) NOT NULL,
  `family_job` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `foreign_language`
--

CREATE TABLE `foreign_language` (
  `foreign_language_id` int(8) NOT NULL,
  `biodata_id` int(8) NOT NULL,
  `job_application_id` int(8) NOT NULL,
  `foreign_language_type` varchar(30) NOT NULL,
  `foreign_language_listening` varchar(15) NOT NULL,
  `foreign_language_speaking` varchar(15) NOT NULL,
  `foreign_language_reading` varchar(15) NOT NULL,
  `foreign_language_writing` varchar(15) NOT NULL
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
  `isTechnical` tinyint(1) NOT NULL DEFAULT '1',
  `applicant_id` int(8) NOT NULL,
  `job_application_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interview`
--

INSERT INTO `interview` (`interview_id`, `interview_date`, `interview_time`, `interview_place`, `isTechnical`, `applicant_id`, `job_application_id`) VALUES
(1, '2018-03-14', '12:40:00', 1, 1, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_application`
--

CREATE TABLE `job_application` (
  `job_application_id` int(8) NOT NULL,
  `applicant_id` int(8) NOT NULL,
  `job_application_date` date NOT NULL,
  `position` tinytext NOT NULL,
  `source` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_application`
--

INSERT INTO `job_application` (`job_application_id`, `applicant_id`, `job_application_date`, `position`, `source`) VALUES
(1, 6, '2018-03-14', 'Writer', 'Office');

-- --------------------------------------------------------

--
-- Table structure for table `ktp`
--

CREATE TABLE `ktp` (
  `nik_ktp` bigint(16) NOT NULL,
  `ktp_address` text NOT NULL,
  `ktp_photo` text NOT NULL,
  `ktp_rt_rw` varchar(10) NOT NULL,
  `ktp_kelurahan` varchar(25) NOT NULL,
  `ktp_kecamatan` varchar(25) NOT NULL,
  `ktp_kota` varchar(20) NOT NULL,
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
-- Table structure for table `other_question_list`
--

CREATE TABLE `other_question_list` (
  `question_id` int(3) NOT NULL,
  `question` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `phone_number`
--

CREATE TABLE `phone_number` (
  `biodata_id` int(8) NOT NULL,
  `phone_number` varchar(15) NOT NULL
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
-- Table structure for table `reference_last_or_current_company`
--

CREATE TABLE `reference_last_or_current_company` (
  `reference_last_or_current_company_id` int(5) NOT NULL,
  `job_application_id` int(8) NOT NULL,
  `reference_last_or_current_company_person_name` varchar(30) NOT NULL,
  `reference_last_or_current_company_position` varchar(30) NOT NULL,
  `reference_last_or_current_company_address` text NOT NULL,
  `reference_last_or_current_company_phone` varchar(15) NOT NULL,
  `reference_last_or_current_company_relationship` varchar(20) NOT NULL
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
-- Indexes for table `ability`
--
ALTER TABLE `ability`
  ADD PRIMARY KEY (`ability_id`);

--
-- Indexes for table `ability_list`
--
ALTER TABLE `ability_list`
  ADD PRIMARY KEY (`ability_list_id`);

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
-- Indexes for table `authentic_document`
--
ALTER TABLE `authentic_document`
  ADD PRIMARY KEY (`authentic_document`);

--
-- Indexes for table `authentic_document_applicant`
--
ALTER TABLE `authentic_document_applicant`
  ADD PRIMARY KEY (`authentic_document_applicant_id`);

--
-- Indexes for table `biodata`
--
ALTER TABLE `biodata`
  ADD PRIMARY KEY (`biodata_id`),
  ADD KEY `spouse_id` (`spouse_id`);

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
-- Indexes for table `education_formal`
--
ALTER TABLE `education_formal`
  ADD PRIMARY KEY (`education_formal_id`);

--
-- Indexes for table `education_non_formal`
--
ALTER TABLE `education_non_formal`
  ADD PRIMARY KEY (`education_non_formal_id`);

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
-- Indexes for table `employment_history`
--
ALTER TABLE `employment_history`
  ADD PRIMARY KEY (`employment_history_id`);

--
-- Indexes for table `family_married_tree`
--
ALTER TABLE `family_married_tree`
  ADD PRIMARY KEY (`family_married_tree_id`);

--
-- Indexes for table `family_tree`
--
ALTER TABLE `family_tree`
  ADD PRIMARY KEY (`family_tree_id`);

--
-- Indexes for table `foreign_language`
--
ALTER TABLE `foreign_language`
  ADD PRIMARY KEY (`foreign_language_id`);

--
-- Indexes for table `interview`
--
ALTER TABLE `interview`
  ADD PRIMARY KEY (`interview_id`);

--
-- Indexes for table `job_application`
--
ALTER TABLE `job_application`
  ADD PRIMARY KEY (`job_application_id`);

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
-- Indexes for table `other_question_list`
--
ALTER TABLE `other_question_list`
  ADD PRIMARY KEY (`question_id`);

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
-- Indexes for table `reference_last_or_current_company`
--
ALTER TABLE `reference_last_or_current_company`
  ADD PRIMARY KEY (`reference_last_or_current_company_id`);

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
-- AUTO_INCREMENT for table `ability`
--
ALTER TABLE `ability`
  MODIFY `ability_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ability_list`
--
ALTER TABLE `ability_list`
  MODIFY `ability_list_id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `agreement_letter`
--
ALTER TABLE `agreement_letter`
  MODIFY `agreement_letter_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `applicant`
--
ALTER TABLE `applicant`
  MODIFY `applicant_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `applicants`
--
ALTER TABLE `applicants`
  MODIFY `applicant_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `authentic_document`
--
ALTER TABLE `authentic_document`
  MODIFY `authentic_document` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `authentic_document_applicant`
--
ALTER TABLE `authentic_document_applicant`
  MODIFY `authentic_document_applicant_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `biodata`
--
ALTER TABLE `biodata`
  MODIFY `biodata_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
-- AUTO_INCREMENT for table `education_formal`
--
ALTER TABLE `education_formal`
  MODIFY `education_formal_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `education_non_formal`
--
ALTER TABLE `education_non_formal`
  MODIFY `education_non_formal_id` int(8) NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT for table `employment_history`
--
ALTER TABLE `employment_history`
  MODIFY `employment_history_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `family_married_tree`
--
ALTER TABLE `family_married_tree`
  MODIFY `family_married_tree_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `family_tree`
--
ALTER TABLE `family_tree`
  MODIFY `family_tree_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `foreign_language`
--
ALTER TABLE `foreign_language`
  MODIFY `foreign_language_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `interview`
--
ALTER TABLE `interview`
  MODIFY `interview_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `job_application`
--
ALTER TABLE `job_application`
  MODIFY `job_application_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
-- AUTO_INCREMENT for table `other_question_list`
--
ALTER TABLE `other_question_list`
  MODIFY `question_id` int(3) NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT for table `reference_last_or_current_company`
--
ALTER TABLE `reference_last_or_current_company`
  MODIFY `reference_last_or_current_company_id` int(5) NOT NULL AUTO_INCREMENT;
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
