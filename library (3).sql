-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3325
-- Generation Time: Jan 22, 2021 at 06:11 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `adherent`
--

CREATE TABLE `adherent` (
  `id_adherent` int(255) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_n` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tele` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adherent`
--

INSERT INTO `adherent` (`id_adherent`, `nom`, `prenom`, `date_n`, `tele`, `email`, `username`, `password`) VALUES
(5, 'za', 'zakariaAi', '07-01-2021', '0668636396', 'zakaria.za@outlook.com', 'zakari87', 'zakariaAi'),
(7, 'xHanafi', 'Yassinex', '08-01-2000', '0674584602', 'yhx@gmail.com', 'Yaskingx', 'Yassinex'),
(8, 'zkara', 'salah', '07-01-2000', '0658439700', 'sa@gmail.com', 'zsala', 'sal123'),
(10, 'BAJJOUK', 'wafaa', '08-12-2005', '0687103694', 'wafaa@gmail.com', 'wafB', 'wafaa');

-- --------------------------------------------------------

--
-- Table structure for table `livre`
--

CREATE TABLE `livre` (
  `id_livre` int(255) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_auteur` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lieu_edition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_edition` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantite` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `livre`
--

INSERT INTO `livre` (`id_livre`, `titre`, `nom_auteur`, `lieu_edition`, `date_edition`, `quantite`) VALUES
(1, 'The sun also rises', 'ERNEST HEMINGWAY', 'USA', '02-01-2005', 3),
(4, 'test', 'test', 'b', '02-01-2021', 5);

-- --------------------------------------------------------

--
-- Table structure for table `pret`
--

CREATE TABLE `pret` (
  `id_pret` int(255) NOT NULL,
  `id_livre` int(255) NOT NULL,
  `id_adherent` int(255) NOT NULL,
  `date_emprunt` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_remettre` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pret`
--

INSERT INTO `pret` (`id_pret`, `id_livre`, `id_adherent`, `date_emprunt`, `date_remettre`) VALUES
(1, 1, 10, '08-01-2021', '15-01-2021'),
(3, 4, 7, '08-01-2021', '23-01-2021');

-- --------------------------------------------------------

--
-- Table structure for table `useradmin`
--

CREATE TABLE `useradmin` (
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `useradmin`
--

INSERT INTO `useradmin` (`username`, `password`) VALUES
('admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adherent`
--
ALTER TABLE `adherent`
  ADD PRIMARY KEY (`id_adherent`),
  ADD UNIQUE KEY `Unique_tel` (`tele`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD UNIQUE KEY `unique_username` (`username`);

--
-- Indexes for table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id_livre`);

--
-- Indexes for table `pret`
--
ALTER TABLE `pret`
  ADD PRIMARY KEY (`id_pret`),
  ADD KEY `livre_adherent_fk` (`id_livre`),
  ADD KEY `adh_adherent_fk` (`id_adherent`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adherent`
--
ALTER TABLE `adherent`
  MODIFY `id_adherent` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `livre`
--
ALTER TABLE `livre`
  MODIFY `id_livre` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pret`
--
ALTER TABLE `pret`
  MODIFY `id_pret` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pret`
--
ALTER TABLE `pret`
  ADD CONSTRAINT `adh_adherent_fk` FOREIGN KEY (`id_adherent`) REFERENCES `adherent` (`id_adherent`),
  ADD CONSTRAINT `livre_adherent_fk` FOREIGN KEY (`id_livre`) REFERENCES `livre` (`id_livre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
