-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 13, 2020 at 04:17 PM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `shotgun_website`
--

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
(3, 'Danse', 1),
(4, 'Aviron', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Sports`
--
ALTER TABLE `Sports`
  ADD PRIMARY KEY (`id`);
