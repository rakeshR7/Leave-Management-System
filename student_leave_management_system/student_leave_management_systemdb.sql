-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2018 at 11:01 AM
-- Server version: 5.7.20
-- PHP Version: 7.1.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_leave_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_title` varchar(255) NOT NULL,
  `department_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_title`, `department_description`) VALUES
(1, 'Mechanical', 'Mechanical'),
(2, 'Electronics', 'Electronics');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3nydxueq651e5e1f6fi2m7ot7qr551kt', 'MmQ2NzE1MWUzZDg5ODhlMWMwNjA1NDY0NGI5ZmQ1YWE2NmMxNjE3Nzp7InVzZXJfaWQiOjE3LCJ1c2VyX2ZpcnN0X25hbWUiOiJKYXkiLCJhdXRoZW50aWNhdGVkIjp0cnVlLCJ1c2VyX2xldmVsX2lkIjoyfQ==', '2017-12-09 16:28:09'),
('7a25yz4rjk8tllt8077vjqjm53r66yy1', 'YTk0YzlkNWRiMjkwMzRhYWRkNWM2YzdhZmQxMDFlODA4MGVhNDdmMTp7InVzZXJfaWQiOjgsInN0dWRlbnRfbGV2ZWxfaWQiOmZhbHNlLCJzdHVkZW50X2lkIjoyLCJ1c2VyX2ZpcnN0X25hbWUiOiJBbWl0Iiwic3R1ZGVudF9maXJzdF9uYW1lIjoiQW1pdCIsImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfbGV2ZWxfaWQiOjJ9', '2018-11-22 10:25:40'),
('7xwuqbgziavwdy1pxkb1l9gw3ju4qqdi', 'YTE4ODU5NzhiNGQ0ZjQzYzRlYmUzMTM2ZjI2ZmFkYzQ1NzU1MWRkYTp7InVzZXJfaWQiOjI4LCJ1c2VyX2ZpcnN0X25hbWUiOiJhc2RmIiwiYXV0aGVudGljYXRlZCI6dHJ1ZSwidXNlcl9sZXZlbF9pZCI6MX0=', '2018-03-20 16:58:10'),
('8lg6u5d7u128egy5kj72ysszh182p908', 'NmYwMTg1YzkwNjMzOGM0MjEwNTlkNWIyN2U1YTY1YjA5MTYwNzA3MTp7InVzZXJfaWQiOjgsInVzZXJfbGV2ZWxfaWQiOjEsImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfbmFtZSI6IkFtaXQgS3VtYXIifQ==', '2017-12-05 12:19:43'),
('a4bleeve4vy4s8yuqgcqb4lyd6z8cmdj', 'YzgyMjc0ZThmZTA5ODJlNTg2YjUyZWU5ZjMxYzU0MTVhMzE1MDhjMzp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2xldmVsX2lkIjpmYWxzZSwidXNlcl9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2017-09-19 17:52:21'),
('eg60bzzadg4n1ujp7gs3di2mjycaskqx', 'MmQ2NzE1MWUzZDg5ODhlMWMwNjA1NDY0NGI5ZmQ1YWE2NmMxNjE3Nzp7InVzZXJfaWQiOjE3LCJ1c2VyX2ZpcnN0X25hbWUiOiJKYXkiLCJhdXRoZW50aWNhdGVkIjp0cnVlLCJ1c2VyX2xldmVsX2lkIjoyfQ==', '2018-03-07 17:37:10'),
('i5307nyqqp0qrqq0ra7rvhketcp4j9va', 'NmYwMTg1YzkwNjMzOGM0MjEwNTlkNWIyN2U1YTY1YjA5MTYwNzA3MTp7InVzZXJfaWQiOjgsInVzZXJfbGV2ZWxfaWQiOjEsImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfbmFtZSI6IkFtaXQgS3VtYXIifQ==', '2017-12-05 18:18:27'),
('jepc0gbw67i143r8kh9wxk20un3p6p5l', 'YzgyMjc0ZThmZTA5ODJlNTg2YjUyZWU5ZjMxYzU0MTVhMzE1MDhjMzp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2xldmVsX2lkIjpmYWxzZSwidXNlcl9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2017-09-19 17:45:30'),
('l5jxmb32y1fhd78zmimye8pkfqlvmx07', 'ZDYxMDkzOWE2M2Q1ODgxMTQyZjFiYjMyMTc4NzA1ZDJmOWE3OWE1ODp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2ZpcnN0X25hbWUiOmZhbHNlLCJ1c2VyX2lkIjpmYWxzZSwidXNlcl9sZXZlbF9pZCI6ZmFsc2V9', '2017-12-09 17:00:32'),
('qi4jui1wag7y5kjd3nal07b1h2jlc9ia', 'MDZiNTU1MGVjZDFkNDliNDc3ZWY1OGExZDgwOTk5MWFkYTZjZmE3NDp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2xldmVsX2lkIjpmYWxzZSwidXNlcl9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2017-07-21 17:16:47');

-- --------------------------------------------------------

--
-- Table structure for table `leave`
--

CREATE TABLE `leave` (
  `leave_id` int(11) NOT NULL,
  `leave_student_id` varchar(255) NOT NULL,
  `leave_reason` varchar(255) NOT NULL,
  `leave_type_id` varchar(255) NOT NULL,
  `leave_from_date` varchar(255) NOT NULL,
  `leave_to_date` varchar(255) NOT NULL,
  `leave_days` int(255) NOT NULL,
  `leave_description` text NOT NULL,
  `leave_status` varchar(255) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leave`
--

INSERT INTO `leave` (`leave_id`, `leave_student_id`, `leave_reason`, `leave_type_id`, `leave_from_date`, `leave_to_date`, `leave_days`, `leave_description`, `leave_status`) VALUES
(1, '0', 'dfasdf', '2', '11/07/2018', '11/09/2018', 0, 'asdf', '1'),
(2, '0', 'dfasdf', '2', '11/07/2018', '11/09/2018', 0, 'asdf', '1'),
(3, '1', 'asdf', '1', '11/07/2018', '11/09/2018', 2, 'adsf', '2'),
(4, '1', '345', '2', '11/01/2018', '11/04/2018', 3, 'dfg', '1'),
(5, '2', 'Going in Seminar', '1', '11/08/2018', '11/12/2018', 4, 'Going in Seminar', '3');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `login_emp_id` int(11) NOT NULL,
  `login_user` varchar(255) NOT NULL,
  `login_password` varchar(255) NOT NULL,
  `login_level` int(11) NOT NULL DEFAULT '3',
  `login_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `login_emp_id`, `login_user`, `login_password`, `login_level`, `login_email`) VALUES
(1, 0, 'admin', 'test', 1, 'kaushal.rahuljaiswal@gmail.com'),
(6, 1002, 'kaushal', 'test', 3, 'kaushal.rahuljaiswal@gmail.com'),
(7, 1003, 'kaushal123', 'test', 3, 'aggarwal.neha@gmail.com'),
(8, 1004, 'neha', 'test', 3, 'aggarwal.neha@gmail.com'),
(9, 1005, 'test', 'test', 3, 'aggarwal.neha@gmail.com'),
(10, 1006, 'atul', 'test', 3, 'aatul@gmail.com'),
(11, 1007, 'sumit1', 'test', 3, 'sumit.singh@gmail.com'),
(12, 1008, 'neha123', 'test', 3, 'aggarwal.neha@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `salutions`
--

CREATE TABLE `salutions` (
  `sl_id` int(11) NOT NULL,
  `sl_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salutions`
--

INSERT INTO `salutions` (`sl_id`, `sl_name`) VALUES
(1, 'Mr.'),
(2, 'Mrs.');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL,
  `section_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `section_title`) VALUES
(1, 'Section A'),
(2, 'Section B');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `semester_id` int(11) NOT NULL,
  `semester_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`semester_id`, `semester_title`) VALUES
(1, 'Semester 1'),
(2, 'Semester 2');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status_name`) VALUES
(1, 'Pending'),
(2, 'Approved'),
(3, 'Disapproved');

-- --------------------------------------------------------

--
-- Table structure for table `student_student`
--

CREATE TABLE `student_student` (
  `student_id` int(11) NOT NULL,
  `student_first_name` varchar(255) NOT NULL,
  `student_last_name` varchar(255) NOT NULL,
  `student_reg_id` varchar(255) NOT NULL,
  `student_password` varchar(255) NOT NULL,
  `student_cgpa` varchar(255) NOT NULL,
  `student_semester` varchar(255) NOT NULL,
  `student_section` varchar(255) NOT NULL,
  `student_department` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_student`
--

INSERT INTO `student_student` (`student_id`, `student_first_name`, `student_last_name`, `student_reg_id`, `student_password`, `student_cgpa`, `student_semester`, `student_section`, `student_department`) VALUES
(1, 'asfdg', 'sdfg', '1001', 'test', 'sdfg', '1', '2', '1'),
(2, 'Amit', 'Kumar', '1002', 'test', '89', '1', '1', '1'),
(3, '234', 'dfg', '1003', 'test', '34', '2', '2', '2'),
(4, 'lkj', 'lkj', '10076s', 'klj', 'adf', '1', '1', '1'),
(5, 'jkh', 'jkh', '1007', 'jkh', 'asdf', '1', '1', '1'),
(6, 'kjh', 'jk', '10086', 'hjk', 'sdf', '1', '2', '1'),
(7, 'hjkh', 'kjh', '734657348', 'klj', 'ksjdjk', '2', '1', '2'),
(8, 'hjkh', 'kjh', '734657348ee', '', 'ksjdjk', '2', '1', '2');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type_title` varchar(255) NOT NULL,
  `type_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_title`, `type_description`) VALUES
(1, 'Seminar Leave', ''),
(2, 'Outstation Leave', '');

-- --------------------------------------------------------

--
-- Table structure for table `users_role`
--

CREATE TABLE `users_role` (
  `role_id` int(11) NOT NULL,
  `role_title` varchar(255) NOT NULL,
  `role_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_role`
--

INSERT INTO `users_role` (`role_id`, `role_title`, `role_description`) VALUES
(1, 'Tutor', 'Admin Roles and Permissions'),
(2, 'Student', 'Student Roles and Permission');

-- --------------------------------------------------------

--
-- Table structure for table `users_user`
--

CREATE TABLE `users_user` (
  `user_id` int(11) NOT NULL,
  `user_level_id` int(11) NOT NULL,
  `user_username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_first_name` varchar(255) NOT NULL,
  `user_section` int(11) NOT NULL,
  `user_semester` int(11) NOT NULL,
  `user_department` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_mobile` varchar(255) NOT NULL,
  `user_gender` varchar(255) NOT NULL,
  `user_last_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users_user`
--

INSERT INTO `users_user` (`user_id`, `user_level_id`, `user_username`, `user_password`, `user_first_name`, `user_section`, `user_semester`, `user_department`, `user_email`, `user_mobile`, `user_gender`, `user_last_name`) VALUES
(8, 1, 'admin', 'test', 'Amit', 1, 1, 1, 'amit@gmail.com', '9878987678', 'Male', 'Kumar'),
(10, 2, 'manasa', 'test', 'Manasa Singh', 2, 1, 1, 'manasa@gmail.com', '9876543212', 'Female', '1'),
(11, 2, 'aman', 'test', 'Aman Kumar', 1, 2, 1, 'aman@gmail.com', '987654321', 'Male', '1'),
(14, 2, 'pawan', 'test', 'Pawan Kumar', 1, 1, 2, 'pawan@gmail.com', '987654321', 'Male', '1'),
(15, 1, 'vishal', 'test', 'Vishal Singh', 1, 1, 2, 'vvishal@gmail.com', '987654321', 'Male', '1'),
(16, 2, 'alok', 'test', 'Alok Kumar', 1, 1, 1, 'alok@gmail.com', '9876543212', 'Male', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `leave`
--
ALTER TABLE `leave`
  ADD PRIMARY KEY (`leave_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `salutions`
--
ALTER TABLE `salutions`
  ADD PRIMARY KEY (`sl_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`semester_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `student_student`
--
ALTER TABLE `student_student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `users_role`
--
ALTER TABLE `users_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `users_user`
--
ALTER TABLE `users_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave`
--
ALTER TABLE `leave`
  MODIFY `leave_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `salutions`
--
ALTER TABLE `salutions`
  MODIFY `sl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `semester_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_student`
--
ALTER TABLE `student_student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_role`
--
ALTER TABLE `users_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_user`
--
ALTER TABLE `users_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
