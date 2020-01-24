-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 20, 2020 at 01:32 PM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `shotgun_website`
--

-- --------------------------------------------------------

--
-- Table structure for table `Assignments`
--

CREATE TABLE `Assignments` (
  `id` int(11) NOT NULL,
  `id_students` int(11) NOT NULL,
  `id_class` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Choices`
--

CREATE TABLE `Choices` (
  `id` int(11) NOT NULL,
  `id_students` int(11) NOT NULL,
  `id_class` int(11) NOT NULL,
  `rank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Choices`
--

INSERT INTO `Choices` (`id`, `id_students`, `id_class`, `rank`) VALUES
(1, 1, 1, 7),
(2, 1, 3, 6),
(3, 1, 61, 5),
(4, 1, 16, 4),
(5, 1, 17, 3),
(6, 1, 29, 2),
(7, 1, 0, 1),
(8, 2, 0, 7),
(9, 2, 4, 6),
(10, 2, 5, 5),
(11, 2, 78, 4),
(12, 2, 1, 3),
(13, 2, 65, 2),
(14, 2, 81, 1),
(15, 3, 98, 8),
(16, 3, 3, 7),
(17, 3, 2, 6),
(18, 3, 46, 5),
(19, 3, 97, 4),
(20, 3, 106, 3),
(21, 3, 23, 2),
(22, 3, 0, 1),
(23, 4, 56, 7),
(24, 4, 2, 6),
(25, 4, 58, 5),
(26, 4, 111, 4),
(27, 4, 1, 3),
(28, 4, 27, 2),
(29, 4, 3, 1),
(30, 5, 82, 6),
(31, 5, 3, 5),
(32, 5, 58, 4),
(33, 5, 59, 3),
(34, 5, 81, 2),
(35, 5, 1, 1),
(36, 6, 2, 5),
(37, 6, 61, 4),
(38, 6, 26, 3),
(39, 6, 27, 2),
(40, 6, 0, 1),
(41, 7, 2, 7),
(42, 7, 1, 6),
(43, 7, 111, 5),
(44, 7, 27, 4),
(45, 7, 27, 3),
(46, 7, 28, 2),
(47, 7, 0, 1),
(48, 8, 51, 8),
(49, 8, 0, 7),
(50, 8, 3, 6),
(51, 8, 105, 5),
(52, 8, 1, 4),
(53, 8, 117, 3),
(54, 8, 24, 2),
(55, 8, 69, 1),
(56, 9, 99, 5),
(57, 9, 3, 4),
(58, 9, 23, 3),
(59, 9, 27, 2),
(60, 9, 1, 1),
(61, 10, 78, 4),
(62, 10, 42, 3),
(63, 10, 2, 2),
(64, 10, 0, 1),
(65, 12, 98, 5),
(66, 12, 82, 4),
(67, 12, 25, 3),
(68, 12, 2, 2),
(69, 12, 0, 1),
(70, 13, 28, 6),
(71, 13, 3, 5),
(72, 13, 5, 4),
(73, 13, 29, 3),
(74, 13, 28, 2),
(75, 13, 1, 1),
(76, 14, 25, 4),
(77, 14, 2, 3),
(78, 14, 8, 2),
(79, 14, 3, 1),
(80, 15, 51, 5),
(81, 15, 1, 4),
(82, 15, 55, 3),
(83, 15, 116, 2),
(84, 15, 0, 1),
(85, 16, 25, 6),
(86, 16, 70, 5),
(87, 16, 81, 4),
(88, 16, 61, 3),
(89, 16, 2, 2),
(90, 16, 0, 1),
(91, 17, 78, 4),
(92, 17, 14, 3),
(93, 17, 25, 2),
(94, 17, 1, 1),
(95, 18, 96, 6),
(96, 18, 33, 5),
(97, 18, 0, 4),
(98, 18, 53, 3),
(99, 18, 68, 2),
(100, 18, 23, 1),
(101, 19, 25, 5),
(102, 19, 68, 4),
(103, 19, 47, 3),
(104, 19, 99, 2),
(105, 19, 1, 1),
(106, 20, 26, 5),
(107, 20, 61, 4),
(108, 20, 1, 3),
(109, 20, 3, 2),
(110, 20, 2, 1),
(111, 21, 61, 6),
(112, 21, 29, 5),
(113, 21, 1, 4),
(114, 21, 4, 3),
(115, 21, 60, 2),
(116, 21, 2, 1),
(117, 22, 35, 6),
(118, 22, 34, 5),
(119, 22, 116, 4),
(120, 22, 82, 3),
(121, 22, 1, 2),
(122, 22, 27, 1),
(123, 23, 56, 5),
(124, 23, 34, 4),
(125, 23, 57, 3),
(126, 23, 28, 2),
(127, 23, 1, 1),
(128, 24, 35, 7),
(129, 24, 33, 6),
(130, 24, 34, 5),
(131, 24, 79, 4),
(132, 24, 15, 3),
(133, 24, 27, 2),
(134, 24, 0, 1),
(135, 25, 4, 7),
(136, 25, 1, 6),
(137, 25, 96, 5),
(138, 25, 28, 4),
(139, 25, 82, 3),
(140, 25, 29, 2),
(141, 25, 0, 1),
(142, 26, 62, 6),
(143, 26, 2, 5),
(144, 26, 14, 4),
(145, 26, 42, 3),
(146, 26, 117, 2),
(147, 26, 0, 1),
(148, 27, 24, 7),
(149, 27, 3, 6),
(150, 27, 2, 5),
(151, 27, 80, 4),
(152, 27, 37, 3),
(153, 27, 96, 2),
(154, 27, 1, 1),
(155, 28, 2, 6),
(156, 28, 55, 5),
(157, 28, 28, 4),
(158, 28, 53, 3),
(159, 28, 52, 2),
(160, 28, 0, 1),
(161, 29, 98, 6),
(162, 29, 2, 5),
(163, 29, 0, 4),
(164, 29, 99, 3),
(165, 29, 1, 2),
(166, 29, 26, 1),
(167, 30, 1, 6),
(168, 30, 45, 5),
(169, 30, 98, 4),
(170, 30, 0, 3),
(171, 30, 68, 2),
(172, 30, 15, 1),
(173, 31, 68, 6),
(174, 31, 1, 5),
(175, 31, 58, 4),
(176, 31, 69, 3),
(177, 31, 14, 2),
(178, 31, 0, 1),
(179, 32, 2, 5),
(180, 32, 78, 4),
(181, 32, 24, 3),
(182, 32, 24, 2),
(183, 32, 0, 1),
(184, 33, 68, 5),
(185, 33, 60, 4),
(186, 33, 28, 3),
(187, 33, 3, 2),
(188, 33, 0, 1),
(189, 34, 16, 3),
(190, 34, 0, 2),
(191, 34, 10, 1),
(192, 35, 2, 6),
(193, 35, 3, 5),
(194, 35, 98, 4),
(195, 35, 82, 3),
(196, 35, 26, 2),
(197, 35, 0, 1),
(198, 36, 48, 5),
(199, 36, 3, 4),
(200, 36, 1, 3),
(201, 36, 47, 2),
(202, 36, 81, 1),
(203, 37, 5, 6),
(204, 37, 2, 5),
(205, 37, 4, 4),
(206, 37, 105, 3),
(207, 37, 51, 2),
(208, 37, 1, 1),
(209, 38, 5, 4),
(210, 38, 2, 3),
(211, 38, 59, 2),
(212, 38, 1, 1),
(213, 39, 0, 6),
(214, 39, 4, 5),
(215, 39, 116, 4),
(216, 39, 106, 3),
(217, 39, 29, 2),
(218, 39, 1, 1),
(219, 40, 35, 6),
(220, 40, 2, 5),
(221, 40, 79, 4),
(222, 40, 80, 3),
(223, 40, 51, 2),
(224, 40, 0, 1),
(225, 41, 56, 4),
(226, 41, 14, 3),
(227, 41, 27, 2),
(228, 41, 0, 1),
(229, 42, 69, 7),
(230, 42, 46, 6),
(231, 42, 47, 5),
(232, 42, 70, 4),
(233, 42, 117, 3),
(234, 42, 45, 2),
(235, 42, 0, 1),
(236, 43, 17, 4),
(237, 43, 78, 3),
(238, 43, 14, 2),
(239, 43, 0, 1),
(240, 44, 99, 5),
(241, 44, 2, 4),
(242, 44, 29, 3),
(243, 44, 0, 2),
(244, 44, 28, 1),
(245, 45, 78, 4),
(246, 45, 117, 3),
(247, 45, 25, 2),
(248, 45, 0, 1),
(249, 46, 2, 6),
(250, 46, 0, 5),
(251, 46, 87, 4),
(252, 46, 28, 3),
(253, 46, 29, 2),
(254, 46, 112, 1),
(255, 48, 2, 5),
(256, 48, 3, 4),
(257, 48, 97, 3),
(258, 48, 42, 2),
(259, 48, 0, 1),
(260, 49, 2, 6),
(261, 49, 0, 5),
(262, 49, 97, 4),
(263, 49, 117, 3),
(264, 49, 82, 2),
(265, 49, 26, 1),
(266, 50, 0, 5),
(267, 50, 1, 4),
(268, 50, 116, 3),
(269, 50, 2, 2),
(270, 50, 25, 1),
(271, 51, 78, 4),
(272, 51, 62, 3),
(273, 51, 0, 2),
(274, 51, 42, 1),
(275, 52, 5, 3),
(276, 52, 2, 2),
(277, 52, 0, 1),
(278, 53, 5, 4),
(279, 53, 96, 3),
(280, 53, 64, 2),
(281, 53, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Cours`
--

CREATE TABLE `Cours` (
  `id` int(11) NOT NULL,
  `id_slot` int(11) DEFAULT NULL,
  `id_langue` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `libelle` text,
  `teacher` text,
  `size` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Cours`
--

INSERT INTO `Cours` (`id`, `id_slot`, `id_langue`, `level`, `libelle`, `teacher`, `size`) VALUES
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
(11, 0, 2, 0, 'Allemand: Débutants', 'DP', 15),
(12, 0, 2, 0, 'Der aktuelle deutsche Film', 'SFL', 15),
(13, 0, 2, 0, 'Energiewende in Deutschland', 'GM', 15),
(14, 0, 1, 0, 'Espagnol Débutants Gr1', 'MJ', 15),
(15, 0, 1, 0, 'Espagnol Débutants Gr2', 'MV', 15),
(16, 0, 1, 0, 'Lengua y Música hispana B1', 'MDL', 15),
(17, 0, 1, 0, 'Dinamica profesional B2', 'RG', 15),
(18, 0, 1, 0, 'Lengua y culturas hispanas Grpe 1', 'NF', 15),
(19, 0, 1, 0, 'Lengua y culturas hispanas Grpe 3', 'OS', 15),
(20, 0, 9, 0, 'Prendre la parole 2', 'CR', 15),
(21, 0, 9, 0, 'Partager les cultures des Français', 'IS', 15),
(22, 0, 9, 0, 'Échanges multiculturels', '1K', 15),
(23, 0, 4, 0, 'Italien Débutants', 'GB', 15),
(24, 0, 8, 0, 'Arabe Débutants', 'MCD', 15),
(25, 0, 3, 0, 'Chinois Débutants', 'DZ', 15),
(26, 0, 7, 0, 'Japonais Débutants gr1', 'EB', 15),
(27, 0, 7, 0, 'Japonais Débutants gr2', 'MD', 15),
(28, 0, 5, 0, 'Russe Débutants', 'IM', 15),
(29, 0, 6, 0, 'Portugais Débutants', 'IAS', 15),
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
(42, 2, 3, 0, 'Chinois Intermédiaires', 'LS', 15),
(43, 3, 9, 0, 'Améliorer ses écrits académiques 4', 'IS', 15),
(44, 3, 9, 0, 'Améliorer ses écrits académiques 4 (DD)', 'LS', 15),
(45, 4, 0, 0, 'Photography', 'KC', 15),
(46, 4, 0, 0, 'World Issues and Events gr1', 'KW', 15),
(47, 4, 0, 0, 'US TV series', 'AS', 15),
(48, 4, 0, 0, 'Speak Out', 'DH', 15),
(49, 4, 2, 0, 'Allemand Intermédiaires', 'DP', 15),
(50, 4, 1, 0, 'Lengua y cine hispano', 'LE', 15),
(51, 4, 8, 0, 'Arabe Intermédiaires', 'MCD', 15),
(52, 4, 4, 0, 'Italien Intermédiaires', 'GB', 15),
(53, 4, 5, 0, 'Russe Intermédiaires', 'IM', 15),
(54, 5, 0, 0, 'Spotlight on Cinema', 'AS', 15),
(55, 5, 0, 0, 'Speaking Near and Far', 'SB', 15),
(56, 5, 0, 0, 'Engineers and Responsibility', 'DH', 15),
(57, 5, 0, 0, 'Public Speaking', 'ZD', 15),
(58, 5, 0, 0, 'Active English Games', 'CP', 15),
(59, 5, 0, 0, 'Urbanization', 'DS', 15),
(60, 5, 0, 0, 'From Daguerre to Digital', 'JC', 15),
(61, 5, 0, 0, 'World Issues and Events gr2', 'KW', 15),
(62, 5, 0, 0, 'Pop Corner', 'RM', 15),
(63, 5, 2, 0, 'Allemand Débutants I', 'DP', 15),
(64, 5, 2, 0, 'Berlin von 1920 bis heute', 'AN', 15),
(65, 5, 2, 0, 'Mein Deutschprojekt', 'SFL', 15),
(66, 5, 1, 0, 'Espagnol Débutants gr1', 'MJ', 15),
(67, 5, 1, 0, 'Espagnol Débutants gr2', 'MV', 15),
(68, 5, 1, 0, 'Escribir y narrar relatos', 'MDL', 15),
(69, 5, 1, 0, 'Lengua y culturas hispanas ', 'LE', 15),
(70, 5, 1, 0, 'Interacciones y culturas hispanas ', 'RG', 15),
(71, 5, 4, 0, 'Italien Débutants', 'GB', 15),
(72, 5, 8, 0, 'Arabe Débutants', 'MCD', 15),
(73, 5, 3, 0, 'Chinois Débutants', 'DZ', 15),
(74, 5, 7, 0, 'Japonais Débutants gr1', 'EB', 15),
(75, 5, 7, 0, 'Japonais Débutants gr2', 'MD', 15),
(76, 5, 5, 0, 'Russe Débutants ', 'IM', 15),
(77, 5, 6, 0, 'Portugais Débutants', 'IAS', 15),
(78, 6, 0, 0, 'English Debating Club Gr.1', 'KW', 15),
(79, 6, 0, 0, 'English Debating Club Gr.2', 'DH', 15),
(80, 6, 0, 0, 'Keep the Ball Rolling', 'JC', 15),
(81, 6, 1, 0, 'Debate en español', 'MC', 15),
(82, 6, 7, 0, 'Japonais Intermédiaires', 'EB', 15),
(83, 6, 3, 0, 'Chinois Intermédiaires', 'DZ', 15),
(84, 6, 4, 0, 'Italien Intermédiaires', 'GB', 15),
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
-- Table structure for table `For_who`
--

CREATE TABLE `For_who` (
  `id` int(11) NOT NULL,
  `id_creneau` int(11) DEFAULT NULL,
  `id_promo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `For_who`
--

INSERT INTO `For_who` (`id`, `id_creneau`, `id_promo`) VALUES
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
-- Table structure for table `Language_wanted`
--

CREATE TABLE `Language_wanted` (
  `id` int(11) NOT NULL,
  `id_students` int(11) NOT NULL,
  `id_language` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Language_wanted`
--

INSERT INTO `Language_wanted` (`id`, `id_students`, `id_language`) VALUES
(1, 1, 0),
(2, 1, 1),
(3, 1, 6),
(4, 1, 8),
(5, 2, 0),
(6, 2, 1),
(7, 2, 2),
(8, 3, 0),
(9, 3, 1),
(10, 3, 4),
(11, 4, 0),
(12, 4, 6),
(13, 4, 7),
(14, 5, 0),
(15, 5, 1),
(16, 5, 7),
(17, 6, 0),
(18, 6, 5),
(19, 6, 6),
(20, 6, 7),
(21, 7, 0),
(22, 7, 5),
(23, 7, 7),
(24, 8, 0),
(25, 8, 1),
(26, 8, 8),
(27, 9, 0),
(28, 9, 4),
(29, 9, 7),
(30, 10, 0),
(31, 10, 2),
(32, 10, 3),
(33, 11, 0),
(34, 11, 1),
(35, 11, 2),
(36, 12, 0),
(37, 12, 3),
(38, 12, 7),
(39, 13, 0),
(40, 13, 5),
(41, 13, 6),
(42, 14, 0),
(43, 14, 3),
(44, 14, 5),
(45, 15, 0),
(46, 15, 5),
(47, 15, 8),
(48, 16, 0),
(49, 16, 1),
(50, 16, 2),
(51, 16, 3),
(52, 17, 0),
(53, 17, 1),
(54, 17, 3),
(55, 18, 0),
(56, 18, 1),
(57, 18, 4),
(58, 18, 5),
(59, 19, 0),
(60, 19, 1),
(61, 19, 2),
(62, 19, 3),
(63, 20, 0),
(64, 20, 6),
(65, 20, 7),
(66, 21, 0),
(67, 21, 5),
(68, 21, 6),
(69, 21, 8),
(70, 22, 0),
(71, 22, 1),
(72, 22, 6),
(73, 22, 7),
(74, 23, 0),
(75, 23, 3),
(76, 23, 5),
(77, 23, 6),
(78, 24, 0),
(79, 24, 1),
(80, 24, 2),
(81, 24, 5),
(82, 24, 6),
(83, 24, 7),
(84, 25, 0),
(85, 25, 5),
(86, 25, 6),
(87, 25, 7),
(88, 26, 0),
(89, 26, 1),
(90, 26, 3),
(91, 26, 4),
(92, 27, 0),
(93, 27, 3),
(94, 27, 6),
(95, 27, 8),
(96, 28, 0),
(97, 28, 4),
(98, 28, 5),
(99, 28, 6),
(100, 29, 0),
(101, 29, 4),
(102, 29, 5),
(103, 29, 7),
(104, 30, 0),
(105, 30, 1),
(106, 30, 2),
(107, 30, 3),
(108, 31, 0),
(109, 31, 1),
(110, 31, 2),
(111, 31, 5),
(112, 32, 0),
(113, 32, 6),
(114, 32, 7),
(115, 32, 8),
(116, 33, 0),
(117, 33, 1),
(118, 33, 3),
(119, 33, 4),
(120, 33, 5),
(121, 34, 0),
(122, 34, 1),
(123, 34, 2),
(124, 34, 3),
(125, 35, 0),
(126, 35, 1),
(127, 35, 6),
(128, 35, 7),
(129, 36, 0),
(130, 36, 1),
(131, 36, 6),
(132, 36, 7),
(133, 37, 0),
(134, 37, 4),
(135, 37, 5),
(136, 37, 8),
(137, 38, 0),
(138, 38, 1),
(139, 38, 7),
(140, 38, 8),
(141, 39, 0),
(142, 39, 1),
(143, 39, 5),
(144, 39, 6),
(145, 40, 0),
(146, 40, 6),
(147, 40, 8),
(148, 41, 0),
(149, 41, 1),
(150, 41, 7),
(151, 42, 0),
(152, 42, 1),
(153, 42, 3),
(154, 42, 5),
(155, 43, 0),
(156, 43, 1),
(157, 43, 4),
(158, 43, 5),
(159, 44, 0),
(160, 44, 3),
(161, 44, 5),
(162, 44, 6),
(163, 45, 0),
(164, 45, 1),
(165, 45, 3),
(166, 45, 5),
(167, 46, 0),
(168, 46, 1),
(169, 46, 5),
(170, 46, 6),
(171, 47, 0),
(172, 47, 1),
(173, 48, 0),
(174, 48, 1),
(175, 48, 3),
(176, 49, 0),
(177, 49, 1),
(178, 49, 7),
(179, 50, 0),
(180, 50, 1),
(181, 50, 3),
(182, 51, 0),
(183, 51, 1),
(184, 51, 3),
(185, 52, 0),
(186, 52, 1),
(187, 52, 2),
(188, 53, 0),
(189, 53, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Langue`
--

CREATE TABLE `Langue` (
  `id` int(11) NOT NULL,
  `libelle` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Langue`
--

INSERT INTO `Langue` (`id`, `libelle`) VALUES
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
-- Table structure for table `Slots`
--

CREATE TABLE `Slots` (
  `id` int(11) NOT NULL,
  `libelle` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Slots`
--

INSERT INTO `Slots` (`id`, `libelle`) VALUES
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
-- Table structure for table `Sports`
--

CREATE TABLE `Sports` (
  `id` int(11) NOT NULL,
  `libelle` text,
  `id_slot` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Sports`
--

INSERT INTO `Sports` (`id`, `libelle`, `id_slot`) VALUES
(0, 'Tennis', 4),
(1, 'Basket', 1),
(2, 'Natation', 15),
(3, 'Danse', 8),
(4, 'Aviron', 8),
(5, 'Badminton', 2),
(6, 'Boxe', 2),
(7, 'Volley Ball', 4),
(8, 'Tennis de Table', 8),
(9, 'Rugby', 15),
(10, 'Musculation', 4),
(11, 'Handball', 6),
(12, 'Football', 4),
(13, 'Escalade', 10);

-- --------------------------------------------------------

--
-- Table structure for table `Students`
--

CREATE TABLE `Students` (
  `id` int(11) NOT NULL,
  `last_name` text,
  `first_name` text NOT NULL,
  `sport` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `number_class` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Students`
--

INSERT INTO `Students` (`id`, `last_name`, `first_name`, `sport`, `year`, `number_class`) VALUES
(1, 'Wozniak', 'Baptiste', 5, 1, 3),
(2, 'Wojcik', 'Camille', 5, 1, 4),
(3, 'Wenzel', 'Romain', 2, 1, 4),
(4, 'Walter', 'Hugues', 9, 1, 2),
(5, 'Vongpaseut', 'Clarine', 3, 1, 4),
(6, 'Vincent', 'Théo', 8, 1, 3),
(7, 'Viano', 'Rafaël', 7, 1, 3),
(8, 'Verhaeghe', 'Jean-Sébastien', 8, 1, 4),
(9, 'Venard', 'Paul-Louis', 6, 1, 3),
(10, 'Van Den Bergh', 'Candice', 12, 1, 3),
(11, 'Vadillo', 'Jon', 3, 1, 2),
(12, 'Umbricht', 'Loic', 12, 1, 3),
(13, 'Tui', 'Romain', 10, 1, 4),
(14, 'Trinh', 'Robin', 8, 1, 2),
(15, 'Thiolliere', 'Lucie', 2, 1, 3),
(16, 'Thin', 'Marie', 2, 1, 4),
(17, 'Thbaut', 'Manon', 3, 1, 3),
(18, 'Stampfli', 'Erwan', 11, 1, 4),
(19, 'Spanti', 'Luca', 2, 1, 3),
(20, 'Sillam', 'Jéremy', 6, 1, 3),
(21, 'Schwartz', 'Baptiste', 10, 1, 3),
(22, 'Schlegel', 'Nicolas', 13, 1, 4),
(23, 'Sauze', 'Benjamin', 8, 1, 4),
(24, 'Sarrade', 'Adrien', 2, 1, 3),
(25, 'Sardet', 'Maelle', 1, 1, 4),
(26, 'Sallenave ', 'Jean-Baptiste', 11, 1, 4),
(27, 'Rouyer', 'Mila', 2, 1, 3),
(28, 'Roulin', 'Benjamin', 13, 1, 4),
(29, 'Ronce', 'Lisa', 11, 1, 3),
(30, 'Romand', 'Mathurin', 9, 1, 4),
(31, 'Riou', 'Auriane', 13, 1, 4),
(32, 'Raibaut', 'Fantin', 5, 1, 3),
(33, 'Raduszynski', 'Théo', 11, 1, 3),
(34, 'Quily', 'Ludovic', 11, 1, 4),
(35, 'Puistienne', 'Marie', 2, 1, 3),
(36, 'Prodhomme', 'Antoine', 1, 1, 4),
(37, 'Prache', 'Adrien', 11, 1, 3),
(38, 'Poucin', 'Florentin', 9, 1, 3),
(39, 'Pouchin', 'Cléo', 6, 1, 2),
(40, 'Poli', 'Maxime', 8, 1, 4),
(41, 'Polette', 'Nadege', 10, 1, 4),
(42, 'Pinet', 'François-Léopold', 13, 1, 3),
(43, 'Pillier', 'Timothée', 10, 1, 3),
(44, 'Pestoury', 'Marie', 11, 1, 4),
(45, 'Pekdemir', 'Iman', 3, 1, 4),
(46, 'Parry', 'Arnaud', 1, 1, 4),
(47, 'Ogier', 'Ronan', 6, 1, 3),
(48, 'Norodom', 'Clément', 9, 1, 3),
(49, 'Nivelle', 'Charlotte', 10, 1, 4),
(50, 'Nadra-yazji', 'Saadalla', 11, 1, 4),
(51, 'Morel', 'Sebastien', 0, 1, 4),
(52, 'Alberge', 'Lara', 0, 0, 2),
(53, 'Maquevic', 'Baptiste', 12, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Year`
--

CREATE TABLE `Year` (
  `id` int(11) NOT NULL,
  `libelle` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Year`
--

INSERT INTO `Year` (`id`, `libelle`) VALUES
(0, '1A'),
(1, '2A'),
(2, '3A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Assignments`
--
ALTER TABLE `Assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Choices`
--
ALTER TABLE `Choices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Cours`
--
ALTER TABLE `Cours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Language_wanted`
--
ALTER TABLE `Language_wanted`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Langue`
--
ALTER TABLE `Langue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Slots`
--
ALTER TABLE `Slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Sports`
--
ALTER TABLE `Sports`
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
-- AUTO_INCREMENT for table `Choices`
--
ALTER TABLE `Choices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- AUTO_INCREMENT for table `Language_wanted`
--
ALTER TABLE `Language_wanted`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `Students`
--
ALTER TABLE `Students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
