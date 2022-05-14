-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2022 at 02:37 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `slotify`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `songsOfArtists` (IN `artist_id` INT)  SELECT * FROM songs
WHERE artist=artist_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `userDetails` ()  SELECT * FROM users$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `artist` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  `artworkPath` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `title`, `artist`, `genre`, `artworkPath`) VALUES
(1, 'Excuses', 1, 10, 'assets/images/artwork/excuses.jpg'),
(2, 'Ma Belle', 1, 10, 'assets/images/artwork/mabelle.jfif'),
(3, 'Naah', 2, 10, 'assets/images/artwork/naah.jpg'),
(4, 'FOUR', 3, 2, 'assets/images/artwork/four.jpg'),
(5, 'It\'s My Life(2003)', 12, 1, 'assets/images/artwork/itsmylife.jpg'),
(6, 'The Slim Shady LP', 4, 4, 'assets/images/artwork/slimshady.jpg'),
(7, 'Raabta', 5, 7, 'assets/images/artwork/raab.jpg'),
(8, 'Kapoor & Sons', 5, 7, 'assets/images/artwork/bol.jfif'),
(9, 'SOUR', 6, 2, 'assets/images/artwork/sour.jpg'),
(10, 'Alag Aasmaan', 7, 5, 'assets/images/artwork/alagaasman.jpg'),
(11, 'Riha', 7, 5, 'assets/images/artwork/riha.jpg'),
(12, 'Handwritten', 8, 2, 'assets/images/artwork/stitches.jpg'),
(13, 'I met you when I was 18', 9, 2, 'assets/images/artwork/better.jpg'),
(14, 'Satyameva Jayate', 10, 7, 'assets/images/artwork/pani.jpg'),
(15, 'Dua Lipa(Deluxe)', 11, 2, 'assets/images/artwork/deluxedlipa.jpg'),
(16, 'Future Nostalgia', 11, 2, 'assets/images/artwork/levi.jfif'),
(17, 'Mad Love The Prequel', 11, 2, 'assets/images/artwork/madlove.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id`, `name`) VALUES
(1, 'AP Dhillon'),
(2, 'Hardy Sandhu'),
(3, 'One Direction'),
(4, 'Eminem'),
(5, 'Arijit Singh'),
(6, 'Olivia Rodrigo'),
(7, 'Anuv Jain'),
(8, 'Shawn Mendes'),
(9, 'Lauv'),
(10, 'Atif Aslam'),
(11, 'Dua Lipa'),
(12, 'Bon Jovi');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'Hip-hop'),
(4, 'Rap'),
(5, 'Indie'),
(6, 'Classical'),
(7, 'Bollywood'),
(8, 'Jazz'),
(9, 'Folk'),
(10, 'Punjabi');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `user_Id` int(11) NOT NULL,
  `event` varchar(20) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `user_Id`, `event`, `time`) VALUES
(1, 5, 'insert', '2022-02-04 14:22:50'),
(3, 0, 'delete', '2022-02-04 14:25:43'),
(6, 8, 'insert', '2022-02-04 15:11:26');

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`id`, `name`, `owner`, `dateCreated`) VALUES
(1, 'My fav', 'Ginni125', '2022-01-30 00:00:00'),
(2, 'ramram', 'chirag_vkin', '2022-02-04 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `playlistsongs`
--

CREATE TABLE `playlistsongs` (
  `id` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  `playlistId` int(11) NOT NULL,
  `playlistOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlistsongs`
--

INSERT INTO `playlistsongs` (`id`, `songId`, `playlistId`, `playlistOrder`) VALUES
(3, 12, 1, 2),
(6, 12, 1, 3),
(7, 25, 1, 4),
(8, 7, 1, 5),
(11, 11, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `artist` int(11) NOT NULL,
  `album` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  `duration` varchar(8) NOT NULL,
  `path` varchar(500) NOT NULL,
  `albumOrder` int(11) NOT NULL,
  `plays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `title`, `artist`, `album`, `genre`, `duration`, `path`, `albumOrder`, `plays`) VALUES
(1, 'Excuses', 1, 1, 10, '2:56', 'assets/music/excuses.mp3', 1, 5),
(2, 'Ma Belle', 1, 2, 10, '2:40', 'assets/music/mabelle.mp3', 2, 6),
(3, 'Naah', 2, 3, 10, '3:10', 'assets/music/naah.mp3', 3, 11),
(4, 'Night Changes', 3, 4, 2, '4:00', 'assets/music/nightchanges.mp3', 4, 2),
(5, 'It\'s My Life', 12, 5, 1, '4:26', 'assets/music/mylife.mp3', 5, 5),
(6, 'The Real Slim Shady', 4, 6, 4, '4:28', 'assets/music/shady.mp3', 6, 4),
(7, 'Ik Vaari aa', 5, 7, 7, '3:46', 'assets/music/ikvaari.mp3', 7, 2),
(8, 'bolna', 5, 8, 7, '2:06', 'assets/music/bolna.mp3', 8, 2),
(9, 'good 4 U', 6, 9, 2, '3:18', 'assets/music/good.mp3', 9, 23),
(10, 'Alag Aasmaan', 7, 10, 5, '3:45', 'assets/music/alagaasman.mp3', 10, 3),
(11, 'Riha', 7, 11, 5, '4:43', 'assets/music/riha.mp3', 11, 6),
(12, 'Stitches', 8, 12, 2, '3:26', 'assets/music/stitches.mp3', 12, 4),
(13, 'I like me better', 9, 13, 2, '3:17', 'assets/music/better.mp3', 13, 1),
(14, 'Paniyo sa', 10, 14, 7, '4:16', 'assets/music/paniyosa.mp3', 14, 3),
(15, 'New Rules', 11, 15, 2, '3:29', 'assets/music/newrules.mp3', 15, 7),
(16, 'Levitating', 11, 16, 2, '3:27', 'assets/music/levitating.mp3', 16, 6),
(17, 'No Control', 3, 4, 2, '3:18', 'assets/music/nocontrol.mp3', 4, 3),
(18, 'Steal My Girl', 3, 4, 2, '3:48', 'assets/music/steal.mp3', 4, 3),
(19, 'Pretty Please', 11, 16, 2, '3:14', 'assets/music/prettyplease.mp3', 16, 3),
(20, 'Darasal', 10, 7, 7, '4:34', 'assets/music/darasal.mp3', 7, 7),
(21, 'Brutal', 6, 9, 2, '2:23', 'assets/music/brutal.mp3', 9, 20),
(22, 'Jealousy,Jealousy', 6, 9, 2, '2:53', 'assets/music/jealousy.mp3', 9, 23),
(23, 'Deja Vu', 6, 9, 2, '3:35', 'assets/music/dejavu.mp3', 9, 11),
(24, 'No Lie', 11, 17, 2, '3:41', 'assets/music/nolie.mp3', 17, 5),
(25, 'I Know What You Did Last Summer', 8, 12, 2, '3:43', 'assets/music/iknow.mp3', 12, 6),
(26, 'Sunny', 5, 2, 4, '2:20', 'assets/music/bensound-sunny.mp3', 4, 22),
(27, 'Sweet', 5, 2, 5, '5:07', 'assets/music/bensound-sweet.mp3', 5, 19),
(28, 'Tenderness ', 3, 3, 7, '2:03', 'assets/music/bensound-tenderness.mp3', 4, 14),
(29, 'The Lounge', 3, 3, 8, '4:16', 'assets/music/bensound-thelounge.mp3 ', 3, 11),
(30, 'Ukulele', 3, 3, 9, '2:26', 'assets/music/bensound-ukulele.mp3 ', 2, 27),
(31, 'Tomorrow', 3, 3, 1, '4:54', 'assets/music/bensound-tomorrow.mp3 ', 1, 21);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(32) NOT NULL,
  `signUpDate` datetime NOT NULL,
  `profilePic` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `password`, `signUpDate`, `profilePic`) VALUES
(3, 'Ginni125', 'Ginni', 'Singh', 'Ginni16singh@gmail.com', '1dc1aa2b77f502da8cfcf30879154983', '2022-01-30 00:00:00', 'assets/images/profile-pics/head_emerald.png'),
(8, 'chirag_vkin', 'Chirag', 'Verma', 'Chirag.vkin@gmail.com', '734379e382de4feb0dce07cb1061ef48', '2022-02-04 00:00:00', 'assets/images/profile-pics/head_emerald.png');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `UserDeleted` AFTER DELETE ON `users` FOR EACH ROW INSERT INTO log
VALUES (null,id,'delete',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `newUserAdded` AFTER INSERT ON `users` FOR EACH ROW INSERT INTO log
VALUES (null,NEW.id,'insert',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `userUpdated` AFTER UPDATE ON `users` FOR EACH ROW INSERT INTO log
VALUES (null,NEW.id,'update',NOW())
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlistsongs`
--
ALTER TABLE `playlistsongs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
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
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `playlistsongs`
--
ALTER TABLE `playlistsongs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
