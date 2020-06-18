-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2020 at 12:19 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `SNO` int(50) NOT NULL,
  `name` text NOT NULL,
  `e_mail` varchar(50) NOT NULL,
  `phone_num` varchar(20) NOT NULL,
  `mess` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`SNO`, `name`, `e_mail`, `phone_num`, `mess`, `date`) VALUES
(1, 'firstpost', 'firstpost@gmail.com', '1234567890', 'firstpost', '2020-05-15 16:59:45'),
(2, 'hishubham72', 'hishubham72@gmail.com', '0987654321', 'cdsvsdv', '2020-05-15 18:51:40'),
(3, 'hishubham72', 'netcamp@gmail.com', '09919402127', 'hello', '2020-05-16 18:25:10'),
(4, 'dewdfed', 'jknnjuiuib', '008007878978', 'jkbbcbwui', '2020-05-17 13:34:12'),
(5, 'shubham', 'mayankgupta1006@gmail.com', '1231231231', 'kaise hai aap log', '2020-05-17 13:42:58'),
(6, 'shubham', 'mayankgupta1006@gmail.com', '1231231231', 'kaise hai aap log', '2020-05-17 13:44:06'),
(7, 'Shubham Mishra', 'mayankgupta1006@gmail.com', '09919402127', 'hiiii', '2020-05-17 13:47:32'),
(8, 'saloni mishra', 'sweet.saloni72@gmail.com', '1235647898', 'helooooo', '2020-05-17 13:53:16'),
(9, 'saloni mishra', 'sweet.saloni72@gmail.com', '1235647898', 'helooooo', '2020-05-17 13:53:20'),
(10, 'saloni mishra', 'sweet.saloni72@gmail.com', '1235647898', 'helooooo', '2020-05-17 13:53:23'),
(11, 'saloni mishra', 'sweet.saloni72@gmail.com', '1235647898', 'helooooo', '2020-05-17 13:53:23'),
(12, 'saloni mishra', 'sweet.saloni72@gmail.com', '1235647898', 'helooooo', '2020-05-17 13:53:25'),
(13, 'saloni mishra', 'sweet.saloni72@gmail.com', '1235647898', 'helooooo', '2020-05-17 13:53:25'),
(14, 'saloni mishra', 'sweet.saloni72@gmail.com', '1235647898', 'helooooo', '2020-05-17 13:53:26'),
(15, 'saloni mishra', 'sweet.saloni72@gmail.com', '1235647898', 'helooooo', '2020-05-17 13:53:29'),
(16, 'saloni mishra', 'sweet.saloni72@gmail.com', '1235647898', 'helooooo', '2020-05-17 13:53:29'),
(17, 'saloni mishra', 'sweet.saloni72@gmail.com', '1235647898', 'helooooo', '2020-05-17 13:53:34'),
(18, '', '', '', '', '2020-06-17 13:09:23'),
(19, '', '', '', '', '2020-06-17 21:17:41'),
(20, '', '', '', '', '2020-06-17 21:18:12'),
(21, 'Shubham Mishra', 'hishubham72@gmail.com', '9580639879', 'hiiiii', '2020-06-18 13:09:35');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `SNO` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(30) NOT NULL,
  `contents` text NOT NULL,
  `img_file` varchar(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`SNO`, `title`, `tagline`, `slug`, `contents`, `img_file`, `date`) VALUES
(1, '5-G Technologies', 'this is my first post', 'first-post', 'value=\"In telecommunications, 5G is the fifth generation technology standard for cellular networks, which cellular phone companies began deploying worldwide in 2019, the planned successor to the 4G networks which provide connectivity to most current cellphones. Like its predecessors, 5G networks are cellular networks, in which the service area is divided into small geographical areas called cells. All 5G wireless devices in a cell are connected to the Internet and telephone network by radio waves through a local antenna in the cell. The main advantage of the new networks is that they will have greater bandwidth, giving higher download speeds, eventually up to 10 gigabits per second (Gbit/s).\"', 'post1-5g.jpg', '2020-06-18 13:23:08'),
(2, 'Mind Driven Car', 'this is second post', 'second-post', 'The customized Kadjar used Emotiv electroencephalography (EEG) headsets to read the drivers\' brain waves. One person controlled left turns, one controlled right turns and the third handled the car\'s acceleration. \r\n\r\nThe drivers started with a simulator to practice and calibrate the headsets, and it didn\'t always go well. They crashed the digital version of the car.\r\n\r\nRenault named the group \"Team Will Power.\" They had to work together while still concentrating on their individual tasks in order to pilot the SUV through a test course. A mechanical system reacted to the mind commands by turning the steering wheel or applying pressure to the accelerator pedal. Renault equipped the car with a stop button in case of emergency.', 'post2-mind_car.jpg', '2020-06-18 12:43:35'),
(3, 'Pubg Gamming', 'this is my third post', 'third-post', 'PlayerUnknown\'s Battlegrounds (PUBG) is an online multiplayer battle royale game developed and published by PUBG Corporation, a subsidiary of South Korean video game company Bluehole. The game is based on previous mods that were created by Brendan \"PlayerUnknown\" Greene for other games, inspired by the 2000 Japanese film Battle Royale, and expanded into a standalone game under Greene\'s creative direction. In the game, up to one hundred players parachute onto an island and scavenge for weapons and equipment to kill others while avoiding getting killed themselves. The available safe area of the game\'s map decreases in size over time, directing surviving players into tighter areas to force encounters. The last player or team standing wins the round.', 'post3-pubg.jpg', '2020-06-18 12:47:21'),
(4, 'Smart Watch', 'this is my fourth post', 'fourth-post', 'value=\"A smartwatch is a wearable computer in the form of a wristwatch; modern smartwatches provide a local touchscreen interface for daily use, while an associated smartphone app provides for management and telemetry (such as long-term biomonitoring). While early models could perform basic tasks, such as calculations, digital time telling, translations, and game-playing, 2010s smartwatches have more general functionality closer to smartphones, including mobile apps, a mobile operating system and WiFi/Bluetooth connectivity. Some smartwatches function as portable media players, with FM radio and playback of digital audio and video files via a Bluetooth headset. Some models, called \'watch phones\' (or vice versa), have mobile cellular functionality like making calls\"....', 'post4-smartwatch.jpg', '2020-06-18 14:33:43'),
(8, 'Image Recognition', 'fifth post', 'fifth-post', 'Pattern recognition is the automated recognition of patterns and regularities in data. It has applications in statistical data analysis, signal processing, image analysis, information retrieval, bioinformatics, data compression, computer graphics and machine learning.', 'image_rec.jpg', '2020-06-18 14:47:13'),
(9, 'Chatbot', 'sixth post', 'sixth-post', 'Chatbots are typically used in dialog systems for various purposes including customer service, request routing, or for information gathering. While some chatbot applications use extensive word-classification processes, Natural Language processors, and sophisticated AI, others simply scan for general keywords and generate responses using common phrases obtained from an associated library or database.', 'chatbot.jpg', '2020-06-18 14:47:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`SNO`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`SNO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `SNO` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `SNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
