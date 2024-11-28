-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2024 at 05:54 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shahmirdbms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateGrade` (IN `p_marks` INT, OUT `p_grade` VARCHAR(2))   BEGIN
    IF p_marks >= 86 THEN
        SET p_grade = 'A';
    ELSEIF p_marks >= 82 THEN
        SET p_grade = 'A-';
    ELSEIF p_marks >= 78 THEN
        SET p_grade = 'B+';
    ELSEIF p_marks >= 74 THEN
        SET p_grade = 'B';
    ELSEIF p_marks >= 70 THEN
        SET p_grade = 'B-';
    ELSEIF p_marks >= 66 THEN
        SET p_grade = 'C+';
    ELSEIF p_marks >= 62 THEN
        SET p_grade = 'C';
    ELSEIF p_marks >= 58 THEN
        SET p_grade = 'C-';
    ELSEIF p_marks >= 54 THEN
        SET p_grade = 'D+';
    ELSEIF p_marks >= 50 THEN
        SET p_grade = 'D';
    ELSE
        SET p_grade = 'F';
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `calculate_gpa_grade` (IN `sgpa` DECIMAL(5,2), IN `marks` DECIMAL(5,2), OUT `gpa` DECIMAL(3,1), OUT `grade` VARCHAR(2))   BEGIN
    -- Calculate GPA based on SGPA
    IF sgpa >= 90 THEN
        SET gpa = 4.0;
    ELSEIF sgpa >= 85 THEN
        SET gpa = 3.7;
    ELSEIF sgpa >= 80 THEN
        SET gpa = 3.3;
    ELSEIF sgpa >= 75 THEN
        SET gpa = 3.0;
    ELSEIF sgpa >= 70 THEN
        SET gpa = 2.7;
    ELSEIF sgpa >= 65 THEN
        SET gpa = 2.3;
    ELSEIF sgpa >= 60 THEN
        SET gpa = 2.0;
    ELSEIF sgpa >= 55 THEN
        SET gpa = 1.7;
    ELSEIF sgpa >= 50 THEN
        SET gpa = 1.3;
    ELSEIF sgpa >= 45 THEN
        SET gpa = 1.0;
    ELSE
        SET gpa = 0.0;
    END IF;

    -- Calculate Grade based on Marks
    IF marks >= 86 THEN
        SET grade = 'A';
    ELSEIF marks >= 82 THEN
        SET grade = 'A-';
    ELSEIF marks >= 78 THEN
        SET grade = 'B+';
    ELSEIF marks >= 74 THEN
        SET grade = 'B';
    ELSEIF marks >= 70 THEN
        SET grade = 'B-';
    ELSEIF marks >= 66 THEN
        SET grade = 'C+';
    ELSEIF marks >= 62 THEN
        SET grade = 'C';
    ELSEIF marks >= 58 THEN
        SET grade = 'C-';
    ELSEIF marks >= 54 THEN
        SET grade = 'D+';
    ELSEIF marks >= 50 THEN
        SET grade = 'D';
    ELSE
        SET grade = 'F';
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `user_name`, `password`) VALUES
(2, 'admin1', 'admin1');

-- --------------------------------------------------------

--
-- Table structure for table `assessment`
--

CREATE TABLE `assessment` (
  `id` int(11) NOT NULL,
  `marks_id` int(11) NOT NULL,
  `assessment_type` varchar(50) NOT NULL,
  `marks` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessment`
--

INSERT INTO `assessment` (`id`, `marks_id`, `assessment_type`, `marks`) VALUES
(1, 27, 'Midterm', 23),
(2, 28, 'Midterm', 23),
(3, 29, 'Midterm', 23),
(4, 30, 'Midterm', 23),
(5, 31, 'Midterm', 23),
(6, 32, 'Midterm', 12),
(7, 33, 'Final', 50),
(8, 34, 'Final', 45),
(9, 35, 'Final', 34),
(10, 36, 'Final', 34),
(11, 37, 'Final', 45),
(12, 38, 'Final', 40),
(13, 39, 'Final', 50),
(14, 40, 'Final', 50),
(15, 41, 'Final', 50),
(16, 42, 'Final', 50),
(17, 43, 'Midterm', 30),
(18, 44, 'Final', 50),
(19, 45, 'Final', 50);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `sem_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_sno` int(11) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `sem_id`, `course_id`, `student_sno`, `date`, `status`) VALUES
(1, 1, 3, 87, '2024-11-18 00:00:00', 'Absent'),
(2, 1, 3, 900, '2024-11-18 00:00:00', 'Present'),
(3, 1, 3, 901, '2024-11-18 00:00:00', 'Present'),
(4, 1, 3, 902, '2024-11-18 00:00:00', 'Absent'),
(5, 1, 3, 903, '2024-11-18 00:00:00', 'Present'),
(6, 1, 3, 904, '2024-11-18 00:00:00', 'Present'),
(7, 1, 3, 87, '2024-11-21 00:00:00', 'Present'),
(8, 1, 3, 900, '2024-11-21 00:00:00', 'Present'),
(9, 1, 3, 901, '2024-11-21 00:00:00', 'Present'),
(10, 1, 3, 902, '2024-11-21 00:00:00', 'Present'),
(11, 1, 3, 903, '2024-11-21 00:00:00', 'Present'),
(12, 1, 3, 904, '2024-11-21 00:00:00', 'Present'),
(13, 1, 3, 87, '2024-11-23 00:00:00', 'Present'),
(14, 1, 3, 900, '2024-11-23 00:00:00', 'Present'),
(15, 1, 3, 901, '2024-11-23 00:00:00', 'Present'),
(16, 1, 3, 902, '2024-11-23 00:00:00', 'Absent'),
(17, 1, 3, 903, '2024-11-23 00:00:00', 'Present'),
(18, 1, 3, 904, '2024-11-23 00:00:00', 'Present'),
(19, 1, 4, 87, '2024-11-01 00:00:00', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `C_id` int(11) NOT NULL,
  `CourseName` varchar(50) NOT NULL,
  `crdHours` int(11) NOT NULL,
  `CourseCode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`C_id`, `CourseName`, `crdHours`, `CourseCode`) VALUES
(2, 'Introduction to Programming', 3, 'CS101'),
(3, 'Calculus I', 4, 'MATH101'),
(4, 'Physics I', 3, 'PHY101'),
(5, 'History of Art', 2, 'ART101'),
(6, 'English Literature', 3, 'ENG101'),
(7, 'Biology Basics', 4, 'BIO101'),
(8, 'Database Systems', 3, 'CS201'),
(9, 'Statistics', 3, 'MATH201'),
(10, 'Chemistry I', 3, 'CHEM101'),
(11, 'Introduction to Psychology', 3, 'PSY101'),
(13, 'Social Studies', 3, 'MT1022');

--
-- Triggers `course`
--
DELIMITER $$
CREATE TRIGGER `delete_attendance_on_course_delete` AFTER DELETE ON `course` FOR EACH ROW BEGIN
    DELETE FROM attendance WHERE course_id = OLD.C_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_course_enrollments` AFTER DELETE ON `course` FOR EACH ROW BEGIN
    DELETE FROM enrollment
    WHERE course_id = OLD.C_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_marks_on_course_delete` AFTER DELETE ON `course` FOR EACH ROW BEGIN
    DELETE FROM marks WHERE course_id = OLD.C_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_teacher_courses_on_course_delete` AFTER DELETE ON `course` FOR EACH ROW BEGIN
    DELETE FROM teachercourse WHERE course_id = OLD.C_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `student_sno` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`student_sno`, `course_id`, `semester_id`) VALUES
(87, 2, 1),
(87, 2, 2),
(87, 3, 1),
(87, 3, 2),
(87, 4, 1),
(87, 4, 2),
(87, 5, 1),
(87, 5, 2),
(87, 6, 1),
(87, 7, 2),
(87, 8, 2),
(87, 9, 2),
(87, 11, 2),
(900, 3, 1),
(901, 3, 1),
(902, 3, 1),
(903, 3, 1),
(904, 3, 1);

--
-- Triggers `enrollment`
--
DELIMITER $$
CREATE TRIGGER `prevent_invalid_enrollment` BEFORE INSERT ON `enrollment` FOR EACH ROW BEGIN
    IF NOT EXISTS (SELECT 1 FROM student WHERE sno = NEW.student_sno) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Student ID does not exist in the student table';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM course WHERE C_id = NEW.course_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Course ID does not exist in the course table';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `sno` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(300) NOT NULL,
  `department` varchar(100) NOT NULL,
  `date_hired` datetime DEFAULT current_timestamp(),
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`sno`, `first_name`, `last_name`, `email`, `phone`, `gender`, `address`, `department`, `date_hired`, `password`) VALUES
(1, 'Shahbaz', 'Siddiqui', 'shahbaz.siddiqui@nu.edu.pk', '0300236734', 'Male', 'home,karachi', 'BSCY', '2024-11-09 10:51:13', '123'),
(90, 'Alice', 'Johnson', 'alice.johnson@example.com', '1234567890', 'Female', '123 Elm St, Springfield', 'Math', '2023-08-01 09:00:00', 'password123'),
(91, 'Bob', 'Smith', 'bob.smith@example.com', '2345678901', 'Male', '456 Oak St, Metropolis', 'Science', '2023-08-02 09:00:00', 'password123'),
(92, 'Carol', 'Williams', 'carol.williams@example.com', '3456789012', 'Female', '789 Pine St, Gotham', 'English', '2023-08-03 09:00:00', 'password123'),
(93, 'David', 'Brown', 'david.brown@example.com', '4567890123', 'Male', '101 Maple St, Star City', 'History', '2023-08-04 09:00:00', 'password123'),
(94, 'Eve', 'Davis', 'eve.davis@example.com', '5678901234', 'Female', '202 Birch St, Central City', 'Physics', '2023-08-05 09:00:00', 'password123');

--
-- Triggers `faculty`
--
DELIMITER $$
CREATE TRIGGER `delete_teacher_courses_on_faculty_delete` AFTER DELETE ON `faculty` FOR EACH ROW BEGIN
    DELETE FROM teachercourse WHERE faculty_id = OLD.sno;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `student_sno` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `section` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `student_sno`, `course_id`, `semester_id`, `rating`, `section`) VALUES
(1, 87, 3, 1, 79, 'BCS-D'),
(2, 87, 7, 1, 58, 'BCS-D'),
(3, 87, 9, 1, 30, 'BCS-D'),
(4, 87, 10, 1, 50, 'BCS-D'),
(5, 87, 2, 1, 50, 'BCS-D'),
(6, 87, 3, 1, 38, 'BCS-D'),
(7, 87, 4, 1, 75, 'BCS-D'),
(8, 87, 5, 1, 29, 'BCS-D'),
(9, 87, 6, 1, 50, 'BCS-D');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` int(11) NOT NULL,
  `student_sno` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`id`, `student_sno`, `course_id`) VALUES
(1, 87, 3),
(2, 901, 3),
(3, 902, 3),
(4, 903, 3),
(5, 904, 3),
(6, 905, 3),
(7, 906, 3),
(8, 87, 3),
(9, 901, 3),
(10, 902, 3),
(11, 903, 3),
(12, 904, 3),
(13, 905, 3),
(14, 906, 3),
(15, 87, 3),
(16, 901, 3),
(17, 902, 3),
(18, 903, 3),
(19, 904, 3),
(20, 905, 3),
(21, 906, 3),
(22, 87, 7),
(23, 902, 7),
(24, 87, 9),
(25, 902, 9),
(26, 87, 10),
(27, 87, 3),
(28, 900, 3),
(29, 901, 3),
(30, 902, 3),
(31, 903, 3),
(32, 904, 3),
(33, 87, 3),
(34, 900, 3),
(35, 901, 3),
(36, 902, 3),
(37, 903, 3),
(38, 904, 3),
(39, 87, 4),
(40, 87, 4),
(41, 87, 5),
(42, 87, 2),
(43, 87, 2),
(44, 87, 6),
(45, 87, 5);

--
-- Triggers `marks`
--
DELIMITER $$
CREATE TRIGGER `delete_assessments_on_marks_delete` AFTER DELETE ON `marks` FOR EACH ROW BEGIN
    DELETE FROM assessment WHERE marks_id = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `sem_id` int(11) NOT NULL,
  `semester` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`sem_id`, `semester`) VALUES
(1, 'Fall 2022'),
(2, 'Spring 2023'),
(3, 'Summer 2023'),
(4, 'Fall 2023'),
(5, 'Spring 2024'),
(6, 'Summer 2024'),
(7, 'Fall 2024'),
(8, 'Spring 2025'),
(9, 'Summer 2025'),
(10, 'Fall 2025'),
(11, 'Spring 2026'),
(12, 'Summer 2026'),
(13, 'Fall 2026'),
(14, 'Spring 2027'),
(15, 'Summer 2027'),
(16, 'Fall 2027');

--
-- Triggers `semester`
--
DELIMITER $$
CREATE TRIGGER `delete_attendance_on_semester_delete` AFTER DELETE ON `semester` FOR EACH ROW BEGIN
    DELETE FROM attendance WHERE sem_id = OLD.sem_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `sno` int(11) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `DOB` datetime NOT NULL,
  `date_created` datetime DEFAULT current_timestamp(),
  `section` varchar(7) NOT NULL,
  `degree` varchar(10) NOT NULL,
  `campus` varchar(15) NOT NULL,
  `batch` varchar(15) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cnic` varchar(20) NOT NULL,
  `address` varchar(300) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sno`, `last_name`, `first_name`, `DOB`, `date_created`, `section`, `degree`, `campus`, `batch`, `phone`, `gender`, `email`, `cnic`, `address`, `password`, `user_id`) VALUES
(87, 'Ahmed', 'Shahmir', '0000-00-00 00:00:00', '2024-11-09 10:38:10', 'BCS-D', 'BScs', 'karachi', 'FALL 2022', '03002675876', 'male', 'shahmir@gmail.com', '2342445', 'home,karachi', '123', '22k-0087'),
(900, 'AHMED', 'ALI', '1995-05-20 00:00:00', '2024-10-04 17:42:25', 'BCS-D', 'BS(CS)', 'KARACHI', 'FALL 2022', '0300-2875207', 'female', 'aliaaaaaa@gmail.com', '276327637263', '123 Maple Street Springfield, IL 62704 USA', 'aliahmed123', '22k-0900'),
(901, 'KHAN', 'AHMED', '1998-12-10 00:00:00', '2024-10-04 17:43:10', 'BCS-A', 'BS(SE)', 'ISLAMABAD', 'SPRING 2022', '0301-2875208', 'male', 'ahmedkhan@gmail.com', '276327637264', '456 Oak Avenue Denver, CO 80203 USA', 'ahmedkhan123', '22k-0901'),
(902, 'ALI', 'SARA', '1997-08-15 00:00:00', '2024-10-04 17:44:20', 'BCS-C', 'BS(CS)', 'LAHORE', 'FALL 2021', '0302-2875209', 'female', 'saraali@gmail.com', '276327637265', '789 Pine Road Miami, FL 33101 USA', 'saraali123', '22k-0902'),
(903, 'FAROOQ', 'UMAR', '1996-03-25 00:00:00', '2024-10-04 17:45:30', 'BCS-B', 'BS(IT)', 'KARACHI', 'FALL 2023', '0303-2875210', 'male', 'umarfarooq@gmail.com', '276327637266', '101 Cedar Lane Austin, TX 73301 USA', 'umarfarooq123', '22k-0903'),
(904, 'SHAH', 'AAMNA', '1999-11-11 00:00:00', '2024-10-04 17:46:40', 'BCS-E', 'BS(CS)', 'QUETTA', 'SPRING 2023', '0304-2875211', 'female', 'aamnashah@gmail.com', '276327637267', '202 Willow Street Seattle, WA 98101 USA', 'aamnashah123', '22k-0904'),
(905, 'ALI', 'KASHIF', '1995-07-19 00:00:00', '2024-10-04 17:47:50', 'BCS-F', 'BS(CS)', 'PESHAWAR', 'FALL 2022', '0305-2875212', 'male', 'kashifali@gmail.com', '276327637268', '303 Birch Avenue Boston, MA 02101 USA', 'kashifali123', '22k-0905'),
(906, 'KHAN', 'ASMA', '1998-04-13 00:00:00', '2024-10-04 17:48:55', 'BCS-G', 'BS(IT)', 'MULTAN', 'SPRING 2022', '0306-2875213', 'female', 'asmakhan@gmail.com', '276327637269', '404 Maple Avenue Orlando, FL 32801 USA', 'asmakhan123', '22k-0906'),
(907, 'ALI', 'FARHAN', '1996-09-23 00:00:00', '2024-10-04 17:50:10', 'BCS-H', 'BS(CS)', 'HYDERABAD', 'FALL 2023', '0307-2875214', 'male', 'farhanali@gmail.com', '276327637270', '505 Oak Drive Portland, OR 97201 USA', 'farhanali123', '22k-0907'),
(908, 'BUTT', 'MEHWISH', '1997-01-05 00:00:00', '2024-10-04 17:51:15', 'BCS-I', 'BS(CS)', 'ISLAMABAD', 'SPRING 2023', '0308-2875215', 'female', 'mehwishbutt@gmail.com', '276327637271', '606 Elm Street Dallas, TX 75201 USA', 'mehwishbutt123', '22k-0908'),
(909, 'NIAZI', 'HASSAN', '1999-10-10 00:00:00', '2024-10-04 17:52:20', 'BCS-J', 'BS(CS)', 'FAISALABAD', 'FALL 2024', '0309-2875216', 'male', 'hassanniazi@gmail.com', '276327637272', '707 Cedar Road Phoenix, AZ 85001 USA', 'hassanniazi123', '22k-0909'),
(910, 'HUSSAIN', 'MARIAM', '1995-12-20 00:00:00', '2024-10-04 17:53:25', 'BCS-K', 'BS(SE)', 'KARACHI', 'SPRING 2024', '0310-2875217', 'female', 'mariamhussain@gmail.com', '276327637273', '808 Pine Drive Detroit, MI 48201 USA', 'mariamhussain123', '22k-0910'),
(911, 'SAEED', 'BILAL', '1994-03-15 00:00:00', '2024-10-04 17:54:30', 'BCS-L', 'BS(CS)', 'LAHORE', 'FALL 2022', '0311-2875218', 'male', 'bilalsaeed@gmail.com', '276327637274', '909 Willow Street San Jose, CA 95101 USA', 'bilalsaeed123', '22k-0911'),
(913, 'ALI', 'HAMZA', '1997-11-14 00:00:00', '2024-10-04 17:56:40', 'BCS-N', 'BS(IT)', 'RAWALPINDI', 'FALL 2023', '0313-2875220', 'male', 'hamzaali@gmail.com', '276327637276', '1111 Maple Street San Diego, CA 92101 USA', 'hamzaali123', '22k-0913'),
(914, 'FATIMA', 'NIDA', '1998-06-09 00:00:00', '2024-10-04 17:57:45', 'BCS-O', 'BS(CS)', 'GUJRANWALA', 'SPRING 2024', '0314-2875221', 'female', 'nidafatima@gmail.com', '276327637277', '1212 Birch Lane Nashville, TN 37201 USA', 'nidafatima123', '22k-0914'),
(923, 'Smith', 'Jane', '2001-05-15 00:00:00', NULL, 'B', 'SE', 'North', 'SPRING 2023', '0987654321', '', 'jane.smith@example.com', '9876543210987', 'Another Address', 'password456', '23k-0000');

--
-- Triggers `student`
--
DELIMITER $$
CREATE TRIGGER `delete_attendance_on_student_delete` AFTER DELETE ON `student` FOR EACH ROW BEGIN
    DELETE FROM attendance WHERE student_sno = OLD.sno;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_marks_on_student_delete` AFTER DELETE ON `student` FOR EACH ROW BEGIN
    DELETE FROM marks WHERE student_sno = OLD.sno;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `teachercourse`
--

CREATE TABLE `teachercourse` (
  `id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `section` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachercourse`
--

INSERT INTO `teachercourse` (`id`, `faculty_id`, `course_id`, `section`) VALUES
(1, 1, 2, 'BCS-D'),
(2, 1, 3, 'BCS-D'),
(3, 1, 4, 'BCS-D'),
(4, 1, 5, 'BCS-D'),
(5, 1, 6, 'BCS-D'),
(6, 90, 10, 'BCS-D');

--
-- Triggers `teachercourse`
--
DELIMITER $$
CREATE TRIGGER `before_insert_teachercourse` BEFORE INSERT ON `teachercourse` FOR EACH ROW BEGIN
  
    IF NOT EXISTS (SELECT 1 FROM course WHERE C_id = NEW.course_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Course ID does not exist.';
    END IF;

   
    IF NOT EXISTS (SELECT 1 FROM faculty WHERE sno = NEW.faculty_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Faculty ID does not exist.';
    END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assessment`
--
ALTER TABLE `assessment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marks_id` (`marks_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sem_id` (`sem_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `student_sno` (`student_sno`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`C_id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`student_sno`,`course_id`,`semester_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `semester_id` (`semester_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_sno` (`student_sno`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `semester_id` (`semester_id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_sno` (`student_sno`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`sem_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `teachercourse`
--
ALTER TABLE `teachercourse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faculty_id` (`faculty_id`),
  ADD KEY `course_id` (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `assessment`
--
ALTER TABLE `assessment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `C_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `sem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=927;

--
-- AUTO_INCREMENT for table `teachercourse`
--
ALTER TABLE `teachercourse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessment`
--
ALTER TABLE `assessment`
  ADD CONSTRAINT `assessment_ibfk_1` FOREIGN KEY (`marks_id`) REFERENCES `marks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`sem_id`) REFERENCES `semester` (`sem_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`C_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`student_sno`) REFERENCES `student` (`sno`) ON DELETE CASCADE;

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`student_sno`) REFERENCES `student` (`sno`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`C_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollment_ibfk_3` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`sem_id`) ON DELETE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`student_sno`) REFERENCES `student` (`sno`) ON DELETE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`C_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`sem_id`) ON DELETE CASCADE;

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`student_sno`) REFERENCES `student` (`sno`) ON DELETE CASCADE,
  ADD CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`C_id`) ON DELETE CASCADE;

--
-- Constraints for table `teachercourse`
--
ALTER TABLE `teachercourse`
  ADD CONSTRAINT `teachercourse_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`sno`) ON DELETE CASCADE,
  ADD CONSTRAINT `teachercourse_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`C_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
