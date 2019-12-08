-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 08, 2019 at 01:32 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shotgun_website`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignent`
--

CREATE TABLE `assignent` (
  `id` int(11) NOT NULL,
  `id_students` int(11) NOT NULL,
  `id_class` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `choices`
--

CREATE TABLE `choices` (
  `id` int(11) NOT NULL,
  `id_students` int(11) NOT NULL,
  `id_class` int(11) NOT NULL,
  `rank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Cours`
--

CREATE TABLE `Cours` (
  `indice` int(11) NOT NULL,
  `id_creneau` int(11) DEFAULT NULL,
  `id_langue` int(11) DEFAULT NULL,
  `niveau` int(11) DEFAULT NULL,
  `libele` text,
  `enseignant` text,
  `effectif_max` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Cours`
--

INSERT INTO `Cours` (`indice`, `id_creneau`, `id_langue`, `niveau`, `libele`, `enseignant`, `effectif_max`) VALUES
(0, 0, 0, 0, 'Speak Easy', 'ZD', 15),
(1, 0, 0, 0, 'A Play for Today', 'CP', 15),
(2, 0, 0, 0, 'Conversational English', 'TH', 15),
(3, 0, 0, 0, 'Communicate', 'MG', 15),
(4, 0, 0, 0, 'Fanfiction', 'DS', 15),
(5, 0, 0, 0, 'Crime and The Criminal Mind', 'CL', 15),
(6, 0, 0, 0, 'Tech for Good', 'SS', 15),
(7, 0, 0, 0, 'Communication Strategies', 'AH', 15),
(8, 0, 0, 0, 'The HeArt of the Matter', 'LME', 15),
(9, 0, 0, 0, 'Model United Nations', 'SB', 15),
(10, 0, 0, 0, 'Netflix and Beyond', 'JH', 15),
(11, 0, 2, 0, 'Débutants I', 'DP', 15),
(12, 0, 2, 0, 'Der aktuelle deutsche Film', 'SFL', 15),
(13, 0, 2, 0, 'Energiewende in Deutschland', 'GM', 15),
(14, 0, 1, 0, 'Débutants gr1', 'MJ', 15),
(15, 0, 1, 0, 'Débutants gr2', 'MV', 15),
(16, 0, 1, 0, 'Lengua y Música hispana B1', 'MDL', 15),
(17, 0, 1, 0, 'Dinamica profesional B2', 'RG', 15),
(18, 0, 1, 0, 'Lengua y culturas hispanas Grpe 1', 'NF', 15),
(19, 0, 1, 0, 'Lengua y culturas hispanas Grpe 3', 'OS', 15),
(20, 0, 9, 0, 'Prendre la parole 2', 'CR', 15),
(21, 0, 9, 0, 'Partager les cultures des Français', 'IS', 15),
(22, 0, 9, 0, 'Échanges multiculturels', '1K', 15),
(23, 0, 4, 0, 'Débutants', 'GB', 15),
(24, 0, 8, 0, 'Débutants', 'MCD', 15),
(25, 0, 3, 0, 'Débutants', 'DZ', 15),
(26, 0, 7, 0, 'Débutants gr1', 'EB', 15),
(27, 0, 7, 0, 'Débutants gr2', 'MD', 15),
(28, 0, 5, 0, 'Débutants', 'IM', 15),
(29, 0, 6, 0, 'Débutants', 'IAS', 15),
(30, 1, 0, 0, 'Getting it Right', 'CL', 15),
(31, 1, 0, 0, 'Breaking (the) News', 'LME', 15),
(32, 1, 2, 0, 'Kulturtreffen', 'SFL', 15),
(33, 2, 0, 0, 'Digital Photography', 'KW', 15),
(34, 2, 0, 0, 'English Language Games', 'TH', 15),
(35, 2, 0, 0, 'Use and Usage', 'CL', 15),
(36, 2, 0, 0, 'Writing', 'DH', 15),
(37, 2, 8, 0, 'Civilisations et cultures arabes', 'MCD', 15),
(38, 2, 1, 0, 'Entrevistas y reportajes', 'LE', 15),
(39, 2, 2, 0, 'Babylon Berlin', 'SFL', 15),
(40, 2, 9, 0, 'Théâtre et société', 'ALB', 15),
(41, 2, 9, 0, 'Francophonies', 'IS', 15),
(42, 2, 3, 0, 'Intermédiaires', 'LS', 15),
(43, 3, 9, 0, 'Améliorer ses écrits académiques 4', 'IS', 15),
(44, 3, 9, 0, 'Améliorer ses écrits académiques 4 (DD)', 'LS', 15),
(45, 4, 0, 0, 'Photography', 'KC', 15),
(46, 4, 0, 0, 'World Issues and Events gr1', 'KW', 15),
(47, 4, 0, 0, 'US TV series', 'AS', 15),
(48, 4, 0, 0, 'Speak Out', 'DH', 15),
(49, 4, 2, 0, 'Intermédiaires', 'DP', 15),
(50, 4, 1, 0, 'Lengua y cine hispano', 'LE', 15),
(51, 4, 8, 0, 'Intermédiaires', 'MCD', 15),
(52, 4, 4, 0, 'Intermédiaires', 'GB', 15),
(53, 4, 5, 0, 'Intermédiaires', 'IM', 15),
(54, 5, 0, 0, 'Spotlight on Cinema', 'AS', 15),
(55, 5, 0, 0, 'Speaking Near and Far', 'SB', 15),
(56, 5, 0, 0, 'Engineers and Responsibility', 'DH', 15),
(57, 5, 0, 0, 'Public Speaking', 'ZD', 15),
(58, 5, 0, 0, 'Active English Games', 'CP', 15),
(59, 5, 0, 0, 'Urbanization', 'DS', 15),
(60, 5, 0, 0, 'From Daguerre to Digital', 'JC', 15),
(61, 5, 0, 0, 'World Issues and Events gr2', 'KW', 15),
(62, 5, 0, 0, 'Pop Corner', 'RM', 15),
(63, 5, 2, 0, 'Débutants I', 'DP', 15),
(64, 5, 2, 0, 'Berlin von 1920 bis heute', 'AN', 15),
(65, 5, 2, 0, 'Mein Deutschprojekt', 'SFL', 15),
(66, 5, 1, 0, 'Débutants gr1', 'MJ', 15),
(67, 5, 1, 0, 'Débutants gr2', 'MV', 15),
(68, 5, 1, 0, 'Escribir y narrar relatos', 'MDL', 15),
(69, 5, 1, 0, 'Lengua y culturas hispanas ', 'LE', 15),
(70, 5, 1, 0, 'Interacciones y culturas hispanas ', 'RG', 15),
(71, 5, 4, 0, 'Débutants', 'GB', 15),
(72, 5, 8, 0, 'Débutants', 'MCD', 15),
(73, 5, 3, 0, 'Débutants', 'DZ', 15),
(74, 5, 7, 0, 'Débutants gr1', 'EB', 15),
(75, 5, 7, 0, 'Débutants gr2', 'MD', 15),
(76, 5, 5, 0, 'Débutants ', 'IM', 15),
(77, 5, 6, 0, 'Débutants', 'IAS', 15),
(78, 6, 0, 0, 'English Debating Club Gr.1', 'KW', 15),
(79, 6, 0, 0, 'English Debating Club Gr.2', 'DH', 15),
(80, 6, 0, 0, 'Keep the Ball Rolling', 'JC', 15),
(81, 6, 1, 0, 'Debate en español', 'MC', 15),
(82, 6, 7, 0, 'Intermédiaires', 'EB', 15),
(83, 6, 3, 0, 'Intermédiaires', 'DZ', 15),
(84, 6, 4, 0, 'Intermédiaires', 'GB', 15),
(85, 7, 0, 0, 'In the News', 'CL', 15),
(86, 7, 0, 0, 'Tech Impact', 'NH', 15),
(87, 7, 0, 0, 'English Project Workshop', 'TH', 15),
(88, 7, 0, 0, 'We Are What We Eat', 'SB', 15),
(89, 7, 0, 0, 'The Art of Engineering', 'LME', 15),
(90, 7, 0, 0, 'Public Speaking', 'ZD', 15),
(91, 7, 0, 0, 'Political Animals', 'EWB', 15),
(92, 7, 2, 0, 'Aktuelles aus der deutschsprachigen Presse', 'AN', 15),
(93, 7, 1, 0, 'Management intercultural en español', 'NS', 15),
(94, 7, 1, 0, 'Mirando la actualidad', 'MC', 15),
(95, 7, 1, 0, 'Les Caraïbes hispanophones', 'MDL', 15),
(96, 8, 0, 0, 'Making Movies', 'DW', 15),
(97, 8, 0, 0, 'Language Review', 'ZD', 15),
(98, 8, 0, 0, 'Ireland', 'CL', 15),
(99, 8, 0, 0, 'Writing Workshop', 'TH', 15),
(100, 8, 0, 0, 'Finding Your Voice', 'CP', 15),
(101, 8, 9, 0, 'Prendre la parole', 'JCB', 15),
(102, 9, 9, 0, 'Améliorer ses écrits académiques 3 gpe1', 'AK', 15),
(103, 9, 9, 0, 'Améliorer ses écrits académiques 3 gpe2', 'ALB', 15),
(104, 10, 0, 0, 'Leading the Discussion', 'DW', 15),
(105, 10, 0, 0, 'English for MS TRADD', 'CL', 15),
(106, 10, 1, 0, 'Atelier mise en scène en espagnol B2', 'MC', 15),
(107, 11, 0, 0, 'American Patchwork', 'SB', 15),
(108, 11, 9, 0, 'Parlons d art', 'JL', 15),
(109, 12, 9, 0, 'Améliorer ses écrits académiques 2', 'CR', 15),
(110, 12, 9, 0, 'Améliorer ses écrits académiques 1', 'JZ', 15),
(111, 13, 0, 0, 'English for GCC/Archi', 'CP', 15),
(112, 14, 0, 0, 'Book Club', 'TH-CP', 15),
(113, 14, 0, 0, 'English Project Workshop', 'TH', 15),
(114, 14, 0, 0, 'Soliya Connect Program', 'SB', 15),
(115, 14, 0, 0, 'Projects for Change', 'SB', 15),
(116, 14, 0, 0, 'A Play for Today Project', 'CP', 15),
(117, 14, 1, 0, 'Proyecto autonomia guiada C1', 'MDL', 15);

-- --------------------------------------------------------

--
-- Table structure for table `créneau`
--

CREATE TABLE `créneau` (
  `id` int(11) NOT NULL,
  `libele` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `créneau`
--

INSERT INTO `créneau` (`id`, `libele`) VALUES
(0, 'Lundi- 11h30 / 13h00'),
(1, 'Lundi - 16h45 / 18h15'),
(2, 'Mardi - 12h30 / 14h00'),
(3, 'Mardi - 14h15 / 17h30'),
(4, 'Mardi - 14h15 / 15h45'),
(5, 'Mardi - 16h30 / 18h00'),
(6, 'Mardi - 18h15 / 19h45'),
(7, 'Mercredi - 13h30 / 15h00'),
(8, 'Jeudi - 12h30 / 14h00'),
(9, 'Jeudi - 14h15 / 17h30'),
(10, 'Jeudi - 14h15 / 15h45'),
(11, 'Jeudi - 16h00 / 17h30'),
(12, 'Vendredi - 8h30 / 11h45'),
(13, 'Vendredi - 11h15 / 12h45'),
(14, 'Hors creneaux / Projets');

-- --------------------------------------------------------

--
-- Table structure for table `language_wanted`
--

CREATE TABLE `language_wanted` (
  `id` int(11) NOT NULL,
  `id_students` int(11) NOT NULL,
  `id_language` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `langue`
--

CREATE TABLE `langue` (
  `id` int(11) NOT NULL,
  `libele` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `langue`
--

INSERT INTO `langue` (`id`, `libele`) VALUES
(0, 'anglais'),
(1, 'espagnol'),
(2, 'allemand'),
(3, 'chinois'),
(4, 'italien'),
(5, 'russe'),
(6, 'portugais '),
(7, 'japonais'),
(8, 'arabe'),
(9, 'français');

-- --------------------------------------------------------

--
-- Table structure for table `pour_qui`
--

CREATE TABLE `pour_qui` (
  `id` int(11) NOT NULL,
  `id_creneau` int(11) DEFAULT NULL,
  `id_promo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pour_qui`
--

INSERT INTO `pour_qui` (`id`, `id_creneau`, `id_promo`) VALUES
(0, 0, 0),
(1, 0, 1),
(2, 0, 2),
(3, 1, 1),
(4, 1, 2),
(5, 2, 1),
(6, 2, 2),
(7, 3, 1),
(7, 3, 2),
(9, 4, 1),
(10, 4, 2),
(11, 5, 0),
(12, 5, 1),
(13, 5, 2),
(14, 6, 0),
(15, 6, 1),
(16, 6, 2),
(17, 7, 0),
(18, 8, 1),
(19, 8, 2),
(20, 9, 1),
(21, 9, 2),
(22, 10, 1),
(23, 10, 2),
(24, 11, 1),
(25, 11, 2),
(26, 12, 1),
(27, 12, 2),
(28, 13, 1),
(29, 13, 2),
(30, 14, 0),
(31, 14, 1),
(32, 14, 2);

-- --------------------------------------------------------

--
-- Table structure for table `promo`
--

CREATE TABLE `promo` (
  `id` int(11) NOT NULL,
  `libele` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promo`
--

INSERT INTO `promo` (`id`, `libele`) VALUES
(0, '1A'),
(1, '2A'),
(2, '3A');

-- --------------------------------------------------------

--
-- Table structure for table `Students`
--

CREATE TABLE `Students` (
  `id` int(11) NOT NULL,
  `Name` text,
  `Sport` int(11) DEFAULT NULL,
  `Promo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Students`
--

INSERT INTO `Students` (`id`, `Name`, `Sport`, `Promo`) VALUES
(1, 'aurelien', NULL, 21),
(2, 'aurelien', NULL, 21);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Cours`
--
ALTER TABLE `Cours`
  ADD PRIMARY KEY (`indice`);

--
-- Indexes for table `créneau`
--
ALTER TABLE `créneau`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `langue`
--
ALTER TABLE `langue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Students`
--
ALTER TABLE `Students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Students`
--
ALTER TABLE `Students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
