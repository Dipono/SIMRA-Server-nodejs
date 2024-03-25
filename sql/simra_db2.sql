-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2024 at 09:51 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simra_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `coordinate`
--

CREATE TABLE `coordinate` (
  `coorniadteId` int(11) NOT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `samplingId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coordinate`
--

INSERT INTO `coordinate` (`coorniadteId`, `longitude`, `latitude`, `samplingId`) VALUES
(207, '30.480175', '-22.999264', 225),
(208, '30.480175', '-22.999264', 226),
(209, '30.480175', '-22.999264', 227),
(210, '30.480175', '-22.999264', 228),
(211, '30.697738', '-22.816052', 229),
(212, '30.697738', '-22.816052', 230),
(213, '30.697738', '-22.816052', 231),
(214, '30.697738', '-22.816052', 232),
(215, '30.491235', '-22.929802', 233),
(216, '30.491235', '-22.929802', 234),
(217, '30.491235', '-22.929802', 235),
(218, '30.491235', '-22.929802', 236),
(219, '30.895632', '-22.773814', 237),
(220, '30.895632', '-22.773814', 238),
(221, '30.895632', '-22.773814', 239),
(222, '30.895632', '-22.773814', 240),
(223, '30,666244', '-22,962443', 241),
(224, '30,666244', '-22,962443', 242),
(225, '30,666244', '-22,962443', 243),
(226, '30,666244', '-22,962443', 244),
(227, '30,683317', '-22,837643', 245),
(228, '30,683317', '-22,837643', 246),
(229, '30,683317', '-22,837643', 247),
(230, '30,683317', '-22,837643', 248),
(231, '30,683317', '-22,837643', 249),
(232, '30,683317', '-22,837643', 250),
(233, '30,683317', '-22,837643', 251),
(234, '30,683317', '-22,837643', 252),
(235, '30,447212', '-22,893641', 253),
(236, '30,447212', '-22,893641', 254),
(237, '30,447212', '-22,893641', 255),
(238, '30,447212', '-22,893641', 256),
(239, '30,471036', '-22,92359', 257),
(240, '30,670329', '-22,851531', 258),
(241, '30,894978', '-22,758338', 259),
(242, '30,651506', '-22,945279', 260),
(243, '30,485096', '-23,003589', 261),
(244, '30,586046', '-22,977009', 262),
(245, '30,335459', '-22,952302', 263),
(246, '30,292692', '-23,049283', 264),
(247, '30,705366', '-22,824656', 265),
(248, '28.2292712', '-25.7478676', 266),
(249, '28.2292712', '-25.7478676', 267),
(250, '28.2292712', '-25.7478676', 268),
(251, '28.2292712', '-25.7478676', 269),
(252, '28.2292712', '-25.7478676', 270);

-- --------------------------------------------------------

--
-- Table structure for table `fib_indicator`
--

CREATE TABLE `fib_indicator` (
  `indicator_id` int(11) NOT NULL,
  `indicator` varchar(255) DEFAULT NULL,
  `ratio` varchar(10) DEFAULT NULL,
  `count_indicator` int(11) DEFAULT NULL,
  `estimated_count` double DEFAULT NULL,
  `is_customized_indicator` tinyint(1) DEFAULT NULL,
  `qmra_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fib_indicator`
--

INSERT INTO `fib_indicator` (`indicator_id`, `indicator`, `ratio`, `count_indicator`, `estimated_count`, `is_customized_indicator`, `qmra_id`) VALUES
(62, 'E.coli', '1:0.5', 100, 50, 0, 90);

-- --------------------------------------------------------

--
-- Table structure for table `hydrogensulfide`
--

CREATE TABLE `hydrogensulfide` (
  `id` int(11) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `samplingId` int(11) DEFAULT NULL,
  `risk_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hydrogensulfide`
--

INSERT INTO `hydrogensulfide` (`id`, `status`, `samplingId`, `risk_type`) VALUES
(44, '0', 225, 'No Risk'),
(45, '0', 226, 'No Risk'),
(46, '0', 227, 'No Risk'),
(47, '0', 228, 'No Risk'),
(48, '1', 229, 'Risk'),
(49, '1', 230, 'Risk'),
(50, '1', 231, 'Risk'),
(51, '1', 232, 'Risk'),
(52, '0', 233, 'No Risk'),
(53, '0', 234, 'No Risk'),
(54, '0', 235, 'No Risk'),
(55, '0', 236, 'No Risk'),
(56, '0', 237, 'No Risk'),
(57, '0', 238, 'No Risk'),
(58, '0', 239, 'No Risk'),
(59, '0', 240, 'No Risk'),
(60, '1', 241, 'Risk'),
(61, '1', 242, 'Risk'),
(62, '1', 243, 'Risk'),
(63, '1', 244, 'Risk'),
(64, '1', 245, 'Risk'),
(65, '1', 246, 'Risk'),
(66, '1', 247, 'Risk'),
(67, '1', 248, 'Risk'),
(68, '1', 249, 'Risk'),
(69, '1', 250, 'Risk'),
(70, '1', 251, 'Risk'),
(71, '1', 252, 'Risk'),
(72, '0', 253, 'No Risk'),
(73, '0', 254, 'No Risk'),
(74, '0', 255, 'No Risk'),
(75, '0', 256, 'No Risk'),
(76, '1', 267, 'Risk'),
(77, '0', 268, 'No Risk');

-- --------------------------------------------------------

--
-- Table structure for table `microbial`
--

CREATE TABLE `microbial` (
  `microbialId` int(11) NOT NULL,
  `samplingId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mst`
--

CREATE TABLE `mst` (
  `mst_id` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `ratio` varchar(100) DEFAULT NULL,
  `estimated_count` varchar(10) NOT NULL,
  `maker` varchar(100) DEFAULT NULL,
  `is_customized_mst` tinyint(1) NOT NULL,
  `qmra_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mst`
--

INSERT INTO `mst` (`mst_id`, `count`, `ratio`, `estimated_count`, `maker`, `is_customized_mst`, `qmra_id`) VALUES
(30, 200, '1:0.4', '80', 'BacCow', 0, 91);

-- --------------------------------------------------------

--
-- Table structure for table `municipality`
--

CREATE TABLE `municipality` (
  `muni_name` varchar(100) DEFAULT NULL,
  `province_id` varchar(10) DEFAULT NULL,
  `muni_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `municipality`
--

INSERT INTO `municipality` (`muni_name`, `province_id`, `muni_id`) VALUES
('Buffalo City Metropolitan Municipality', 'ZA-EC', 'BUF'),
('City of Cape Town Metropolitan Municipality', 'ZA-WC', 'CPT'),
('Dr Beyers Naudé Local Municipality', 'ZA-EC', 'EC101'),
('Blue Crane Route Local Municipality', 'ZA-EC', 'EC102'),
('Makana Local Municipality', 'ZA-EC', 'EC104'),
('Ndlambe Local Municipality', 'ZA-EC', 'EC105'),
('Sundays River Valley Local Municipality', 'ZA-EC', 'EC106'),
('Kouga Local Municipality', 'ZA-EC', 'EC108'),
('Kou-Kamma Local Municipality', 'ZA-EC', 'EC109'),
('Mbhashe Local Municipality', 'ZA-EC', 'EC121'),
('Mnquma Local Municipality', 'ZA-EC', 'EC122'),
('Great Kei Local Municipality', 'ZA-EC', 'EC123'),
('Amahlathi Local Municipality', 'ZA-EC', 'EC124'),
('Ngqushwa Local Municipality', 'ZA-EC', 'EC126'),
('Raymond Mhlaba Local Municipality', 'ZA-EC', 'EC129'),
('Inxuba Yethemba Local Municipality', 'ZA-EC', 'EC131'),
('Intsika Yethu Local Municipality', 'ZA-EC', 'EC135'),
('Emalahleni Local Municipality', 'ZA-EC', 'EC136'),
('Engcobo Local Municipality', 'ZA-EC', 'EC137'),
('Sakhisizwe Local Municipality', 'ZA-EC', 'EC138'),
('Enoch Mgijima Local Municipality', 'ZA-EC', 'EC139'),
('Elundini Local Municipality', 'ZA-EC', 'EC141	'),
('Senqu Local Municipality', 'ZA-EC', 'EC142'),
('Walter Sisulu Local Municipality', 'ZA-EC', 'EC145'),
('Ingquza Hill Local Municipality', 'ZA-EC', 'EC153'),
('Port St Johns Local Municipality', 'ZA-EC', 'EC154'),
('Nyandeni Local Municipality', 'ZA-EC', 'EC155'),
('Mhlontlo Local Municipality', 'ZA-EC', 'EC156'),
('King Sabata Dalindyebo Local Municipality', 'ZA-EC', 'EC157'),
('Matatiele Local Municipality', 'ZA-EC', 'EC441'),
('Umzimvubu Local Municipality', 'ZA-EC', 'EC442'),
('Winnie Madikizela-Mandela Local Municipality', 'ZA-EC', 'EC443'),
('Ntabankulu Local Municipality', 'ZA-EC', 'EC444'),
('City of Ekurhuleni Metropolitan Municipality', 'ZA-GP', 'EKU'),
('eThekwini Metropolitan Municipality', 'ZA-KZN', 'ETH'),
('Letsemeng Local Municipality', 'ZA-fS', 'FS161'),
('Kopanong Local Municipality', 'ZA-fS', 'FS162'),
('Mohokare Local Municipality', 'ZA-fS', 'FS163'),
('Masilonyana Local Municipality', 'ZA-fS', 'FS181'),
('Tokologo Local Municipality', 'ZA-fS', 'FS182'),
('Tswelopele Local Municipality', 'ZA-fS', 'FS183'),
('Matjhabeng Local Municipality', 'ZA-fS', 'FS184'),
('Nala Local Municipality', 'ZA-fS', 'FS185'),
('Setsoto Local Municipality', 'ZA-fS', 'FS191'),
('Dihlabeng Local Municipality', 'ZA-fS', 'FS192'),
('Nketoana Local Municipality', 'ZA-fS', 'FS193'),
('Maluti-a-Phofung Local Municipality', 'ZA-fS', 'FS194'),
('Phumelela Local Municipality', 'ZA-fS', 'FS195'),
('Mantsopa Local Municipality', 'ZA-fS', 'FS196'),
('Moqhaka Local Municipality', 'ZA-fS', 'FS201'),
('Ngwathe Local Municipality', 'ZA-fS', 'FS203'),
('Metsimaholo Local Municipality', 'ZA-fS', 'FS204'),
('Mafube Local Municipality', 'ZA-fS', 'FS205'),
('Emfuleni Local Municipality', 'ZA-GP', 'GT421'),
('Midvaal Local Municipality', 'ZA-GP', 'GT422'),
('Lesedi Local Municipality', 'ZA-GP', 'GT423'),
('Mogale City Local Municipality', 'ZA-GP', 'GT481'),
('Merafong City Local Municipality', 'ZA-GP', 'GT484'),
('Rand West City Local Municipality', 'ZA-GP', 'GT485'),
('City of Johannesburg Metropolitan Municipality', 'ZA-GP', 'JHB'),
('uMdoni Local Municipality', 'ZA-KZN', 'KZN212'),
('Umzumbe Local Municipality', 'ZA-KZN', 'KZN213'),
('uMuziwabantu Local Municipality', 'ZA-KZN', 'KZN214'),
('Ray Nkonyeni Local Municipality', 'ZA-KZN', 'KZN216'),
('uMshwathi Local Municipality', 'ZA-KZN', 'KZN221'),
('uMngeni Local Municipality', 'ZA-KZN', 'KZN222'),
('Mpofana Local Municipality', 'ZA-KZN', 'KZN223'),
('Impendle Local Municipality', 'ZA-KZN', 'KZN224'),
('Msunduzi Local Municipality', 'ZA-KZN', 'KZN225'),
('Mkhambathini Local Municipality', 'ZA-KZN', 'KZN226'),
('Richmond Local Municipality', 'ZA-KZN', 'KZN227'),
('Okhahlamba Local Municipality', 'ZA-KZN', 'KZN235'),
('Inkosi Langalibalele Local Municipality', 'ZA-KZN', 'KZN237'),
('Alfred Duma Local Municipality', 'ZA-KZN', 'KZN238'),
('Endumeni Local Municipality', 'ZA-KZN', 'KZN241'),
('Nqutu Local Municipality', 'ZA-KZN', 'KZN242'),
('Msinga Local Municipality', 'ZA-KZN', 'KZN244'),
('Umvoti Local Municipality', 'ZA-KZN', 'KZN245'),
('Newcastle Local Municipality', 'ZA-KZN', 'KZN252'),
('Dannhauser Local Municipality', 'ZA-KZN', 'KZN254'),
('eDumbe Local Municipality', 'ZA-KZN', 'KZN261'),
('uPhongolo Local Municipality', 'ZA-KZN', 'KZN262'),
('Abaqulusi Local Municipality', 'ZA-KZN', 'KZN263'),
('Nongoma Local Municipality', 'ZA-KZN', 'KZN265'),
('Ulundi Local Municipality', 'ZA-KZN', 'KZN266'),
('uMhlabuyalingana Local Municipality', 'ZA-KZN', 'KZN271'),
('Jozini Local Municipality', 'ZA-KZN', 'KZN272'),
('Mtubatuba Local Municipality', 'ZA-KZN', 'KZN275'),
('Big Five Hlabisa Local Municipality', 'ZA-KZN', 'KZN276'),
('uMfolozi Local Municipality', 'ZA-KZN', 'KZN281'),
('uMhlathuze Local Municipality', 'ZA-KZN', 'KZN282'),
('uMlalazi Local Municipality', 'ZA-KZN', 'KZN284'),
('Mthonjaneni Local Municipality', 'ZA-KZN', 'KZN285'),
('Nkandla Local Municipality', 'ZA-KZN', 'KZN286'),
('Mandeni Local Municipality', 'ZA-KZN', 'KZN291'),
('KwaDukuza Local Municipality', 'ZA-KZN', 'KZN292'),
('Ndwedwe Local Municipality', 'ZA-KZN', 'KZN293'),
('Maphumulo Local Municipality', 'ZA-KZN', 'KZN294'),
('Greater Kokstad Local Municipality', 'ZA-KZN', 'KZN433'),
('Ubuhlebezwe Local Municipality', 'ZA-KZN', 'KZN434'),
('Umzimkhulu Local Municipality', 'ZA-KZN', 'KZN435'),
('Dr Nkosazana Dlamini Zuma Local Municipality', 'ZA-KZN', 'KZN436'),
('Greater Giyani', 'ZA-LP', 'LIM331'),
('Greater Letaba', 'ZA-LP', 'LIM332'),
('Greater Tzaneen', 'ZA-LP', 'LIM333'),
('Ba-Phalaborwa', 'ZA-LP', 'LIM334'),
('Maruleng', 'ZA-LP', 'LIM335'),
('Musina', 'ZA-LP', 'LIM341'),
('Thulamela', 'ZA-LP', 'LIM343'),
('Makhado', 'ZA-LP', 'LIM344'),
('Collins Chabane', 'ZA-LP', 'LIM345'),
('Blouberg', 'ZA-LP', 'LIM351'),
('Lepelle-Nkumpi', 'ZA-LP', 'LIM355'),
('Lephalale', 'ZA-LP', 'LIM362'),
('Bela-Bela', 'ZA-LP', 'LIM366'),
('Mogalakwena', 'ZA-LP', 'LIM367'),
('Modimolle–Mookgophong', 'ZA-LP', 'LIM368'),
('Ephraim Mogale', 'ZA-LP', 'LIM471'),
('Elias Motsoaledi', 'ZA-LP', 'LIM472'),
('Makhuduthamaga', 'ZA-LP', 'LIM473'),
('Fetakgomo Tubatse', 'ZA-LP', 'LIM476'),
('Mangaung Metropolitan Municipality', 'ZA-fS', 'MAN'),
('Albert Luthuli Local Municipality', 'ZA-MP', 'MP301'),
('Msukaligwa Local Municipality', 'ZA-MP', 'MP302'),
('Mkhondo Local Municipality', 'ZA-MP', 'MP303'),
('Pixley ka Seme Local Municipality', 'ZA-MP', 'MP304'),
('Lekwa Local Municipality', 'ZA-MP', 'MP305'),
('Dipaleseng Local Municipality', 'ZA-MP', 'MP306'),
('Govan Mbeki Local Municipality', 'ZA-MP', 'MP307'),
('Victor Khanye Local Municipality', 'ZA-MP', 'MP311'),
('Emalahleni Local Municipality', 'ZA-MP', 'MP312'),
('Steve Tshwete Local Municipality', 'ZA-MP', 'MP313'),
('Emakhazeni Local Municipality', 'ZA-MP', 'MP314'),
('Thembisile Hani Local Municipality', 'ZA-MP', 'MP315'),
('Dr JS Moroka Local Municipality', 'ZA-MP', 'MP316'),
('Thaba Chweu Local Municipality', 'ZA-MP', 'MP321'),
('Nkomazi Local Municipality', 'ZA-MP', 'MP324'),
('Bushbuckridge Local Municipality', 'ZA-MP', 'MP325'),
('Mbombela Local Municipality', 'ZA-MP', 'MP326'),
('Richtersveld Local Municipality', 'ZA-NC', 'NC061'),
('Nama Khoi Local Municipality', 'ZA-NC', 'NC062'),
('Kamiesberg Local Municipality', 'ZA-NC', 'NC064'),
('Hantam Local Municipality', 'ZA-NC', 'NC065'),
('Karoo Hoogland Local Municipality', 'ZA-NC', 'NC066'),
('Khâi-Ma Local Municipality', 'ZA-NC', 'NC067'),
('Ubuntu Local Municipality', 'ZA-NC', 'NC071'),
('Umsobomvu Local Municipality', 'ZA-NC', 'NC072'),
('Emthanjeni Local Municipality', 'ZA-NC', 'NC073'),
('Kareeberg Local Municipality', 'ZA-NC', 'NC074'),
('Renosterberg Local Municipality', 'ZA-NC', 'NC075'),
('Thembelihle Local Municipality', 'ZA-NC', 'NC076'),
('Siyathemba Local Municipality', 'ZA-NC', 'NC077'),
('Siyancuma Local Municipality', 'ZA-NC', 'NC078'),
('Kai !Garib Local Municipality', 'ZA-NC', 'NC082'),
('!Kheis Local Municipality', 'ZA-NC', 'NC084'),
('Tsantsabane Local Municipality', 'ZA-NC', 'NC085'),
('Kgatelopele Local Municipality', 'ZA-NC', 'NC086'),
('Dawid Kruiper Local Municipality', 'ZA-NC', 'NC087'),
('Sol Plaatje Local Municipality', 'ZA-NC', 'NC091'),
('Dikgatlong Local Municipality', 'ZA-NC', 'NC092'),
('Magareng Local Municipality', 'ZA-NC', 'NC093'),
('Phokwane Local Municipality', 'ZA-NC', 'NC094'),
('Joe Morolong Local Municipality', 'ZA-NC', 'NC451'),
('Ga-Segonyana Local Municipality', 'ZA-NC', 'NC452'),
('Gamagara Local Municipality', 'ZA-NC', 'NC453'),
('Nelson Mandela Bay Metropolitan Municipality', 'ZA-EC', 'NMA'),
('Moretele Local Municipality', 'ZA-NW', 'NW371'),
('Madibeng Local Municipality', 'ZA-NW', 'NW372'),
('Rustenburg Local Municipality', 'ZA-NW', 'NW373'),
('Kgetlengrivier Local Municipality', 'ZA-NW', 'NW374'),
('Moses Kotane Local Municipality', 'ZA-NW', 'NW375'),
('Ratlou Local Municipality', 'ZA-NW', 'NW381'),
('Tswaing Local Municipality', 'ZA-NW', 'NW382'),
('Mahikeng Local Municipality', 'ZA-NW', 'NW383'),
('Ditsobotla Local Municipality', 'ZA-NW', 'NW384'),
('Ramotshere Moiloa Local Municipality', 'ZA-NW', 'NW385'),
('Naledi Local Municipality', 'ZA-NW', 'NW392'),
('Mamusa Local Municipality', 'ZA-NW', 'NW393'),
('Greater Taung Local Municipality', 'ZA-NW', 'NW394'),
('Lekwa-Teemane Local Municipality', 'ZA-NW', 'NW396'),
('Kagisano-Molopo Local Municipality', 'ZA-NW', 'NW397'),
('City of Matlosana Local Municipality', 'ZA-NW', 'NW403'),
('Maquassi Hills Local Municipality', 'ZA-NW', 'NW404	'),
('JB Marks Local Municipality', 'ZA-NW', 'NW405'),
('City of Tshwane Metropolitan Municipality', 'ZA-GP', 'TSH'),
('Matzikama Local Municipality', 'ZA-WC', 'WC011'),
('Cederberg Local Municipality', 'ZA-WC', 'WC012'),
('Bergrivier Local Municipality', 'ZA-WC', 'WC013'),
('Saldanha Bay Local Municipality', 'ZA-WC', 'WC014'),
('Swartland Local Municipality', 'ZA-WC', 'WC015'),
('Witzenberg Local Municipality', 'ZA-WC', 'WC022'),
('Drakenstein Local Municipality', 'ZA-WC', 'WC023'),
('Stellenbosch Local Municipality', 'ZA-WC', 'WC024'),
('Breede Valley Local Municipality', 'ZA-WC', 'WC025'),
('Langeberg Local Municipality', 'ZA-WC', 'WC026'),
('Theewaterskloof Local Municipality', 'ZA-WC', 'WC031'),
('Overstrand Local Municipality', 'ZA-WC', 'WC032'),
('Cape Agulhas Local Municipality', 'ZA-WC', 'WC033'),
('Swellendam Local Municipality', 'ZA-WC', 'WC034'),
('Kannaland Local Municipality', 'ZA-WC', 'WC041'),
('Hessequa Local Municipality', 'ZA-WC', 'WC042	'),
('Mossel Bay Local Municipality', 'ZA-WC', 'WC043'),
('George Local Municipality', 'ZA-WC', 'WC044'),
('Oudtshoorn Local Municipality', 'ZA-WC', 'WC045'),
('Bitou Local Municipality', 'ZA-WC', 'WC047'),
('Knysna Local Municipality', 'ZA-WC', 'WC048'),
('Laingsburg Local Municipality', 'ZA-WC', 'WC051'),
('Prince Albert Local Municipality', 'ZA-WC', 'WC052'),
('Beaufort West Local Municipality', 'ZA-WC', 'WC053');

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `province_id` varchar(10) NOT NULL,
  `province_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`province_id`, `province_name`) VALUES
('ZA-EC', 'Eastern Cape'),
('ZA-FS', 'Free State'),
('ZA-GP', 'Gauteng'),
('ZA-KZN', 'Kwazulu-Natal'),
('ZA-LP', 'Limpopo'),
('ZA-MP', 'Mpumalanga'),
('ZA-NC', 'Northern Cape'),
('ZA-NW', 'North-West'),
('ZA-WC', 'Western Cape');

-- --------------------------------------------------------

--
-- Table structure for table `qmra`
--

CREATE TABLE `qmra` (
  `qmra_id` int(11) NOT NULL,
  `pathogen` varchar(255) DEFAULT NULL,
  `best_fit_model` varchar(20) DEFAULT NULL,
  `alpha` double DEFAULT NULL,
  `beta` double DEFAULT NULL,
  `constant` double DEFAULT NULL,
  `n50` double DEFAULT NULL,
  `probability_of_infection` double DEFAULT NULL,
  `likelihood_of_infection` double DEFAULT NULL,
  `duration_type` varchar(20) DEFAULT NULL,
  `is_customize_Pathogen` tinyint(1) DEFAULT NULL,
  `samplingId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `qmra`
--

INSERT INTO `qmra` (`qmra_id`, `pathogen`, `best_fit_model`, `alpha`, `beta`, `constant`, `n50`, `probability_of_infection`, `likelihood_of_infection`, `duration_type`, `is_customize_Pathogen`, `samplingId`) VALUES
(90, 'Salmonella typhi', 'beta-poisson', 0.21, 49.78, NULL, NULL, 0.13586341463036256, -106, 'monthly', 0, 269),
(91, 'Cryptosporidium Parvum', 'exponential', NULL, NULL, 0.0199, NULL, 0, 0, 'yearly', NULL, 270);

-- --------------------------------------------------------

--
-- Table structure for table `reference_path`
--

CREATE TABLE `reference_path` (
  `ref_path_id` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `is_customize_Pathogen` tinyint(1) DEFAULT NULL,
  `qmra_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `river`
--

CREATE TABLE `river` (
  `riverId` int(11) NOT NULL,
  `river_name` varchar(200) DEFAULT NULL,
  `muni_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `river`
--

INSERT INTO `river` (`riverId`, `river_name`, `muni_id`) VALUES
(1, 'GA-SELATI RIVER', 'LIM335'),
(2, 'MAKHUTSWI RIVER', 'LIM335');

-- --------------------------------------------------------

--
-- Table structure for table `samplingdata`
--

CREATE TABLE `samplingdata` (
  `samplingId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `weatherCondition` varchar(100) DEFAULT NULL,
  `sampling_date_created` datetime NOT NULL,
  `muni_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `samplingdata`
--

INSERT INTO `samplingdata` (`samplingId`, `userId`, `weatherCondition`, `sampling_date_created`, `muni_id`) VALUES
(225, 1, 'Wet', '2021-07-06 00:00:00', 'LIM343'),
(226, 1, 'Wet', '2021-06-21 00:00:00', 'LIM343'),
(227, 1, 'Wet', '2021-09-08 00:00:00', 'LIM343'),
(228, 1, 'Wet', '2021-08-23 12:08:06', 'LIM343'),
(229, 1, 'Wet', '2021-03-06 00:00:00', 'LIM343'),
(230, 1, 'Wet', '2021-06-17 00:00:00', 'LIM343'),
(231, 1, 'Wet', '2021-08-19 00:00:00', 'LIM343'),
(232, 1, 'Wet', '2021-05-08 00:00:00', 'LIM343'),
(233, 1, 'Wet', '2021-03-06 00:00:00', 'LIM343'),
(234, 1, 'Wet', '2021-08-19 00:00:00', 'LIM343'),
(235, 1, 'Wet', '2021-05-08 00:00:00', 'LIM343'),
(236, 1, 'Wet', '2021-06-17 00:00:00', 'LIM343'),
(237, 1, 'Wet', '2021-01-06 00:00:00', 'LIM345'),
(238, 1, 'Wet', '2021-08-14 00:00:00', 'LIM345'),
(239, 1, 'Wet', '2021-06-14 00:00:00', 'LIM345'),
(240, 1, 'Wet', '2021-02-08 00:00:00', 'LIM345'),
(241, 1, 'Wet', '2021-01-06 00:00:00', 'LIM345'),
(242, 1, 'Wet', '2021-06-14 00:00:00', 'LIM345'),
(243, 1, 'Wet', '2021-02-08 00:00:00', 'LIM345'),
(244, 1, 'Wet', '2021-08-16 00:00:00', 'LIM345'),
(245, 14, 'Wet', '2021-03-06 00:00:00', 'LIM343'),
(246, 14, 'Wet', '2021-06-17 00:00:00', 'LIM343'),
(247, 14, 'Wet', '2021-05-08 00:00:00', 'LIM343'),
(248, 14, 'Wet', '2021-08-19 00:00:00', 'LIM343'),
(249, 14, 'Wet', '2021-03-06 00:00:00', 'LIM343'),
(250, 14, 'Wet', '2021-06-17 00:00:00', 'LIM343'),
(251, 14, 'Wet', '2021-08-19 00:00:00', 'LIM343'),
(252, 14, 'Wet', '2021-05-08 00:00:00', 'LIM343'),
(253, 15, 'Wet', '2021-07-06 00:00:00', 'LIM343'),
(254, 15, 'Wet', '2021-06-21 00:00:00', 'LIM343'),
(255, 15, 'Wet', '2021-09-08 00:00:00', 'LIM343'),
(256, 15, 'Wet', '2021-08-23 00:00:00', 'LIM343'),
(257, 15, 'Wet', '2024-02-15 21:11:58', 'LIM343'),
(258, 15, 'Wet', '2024-02-15 21:18:21', 'LIM343'),
(259, 15, 'Wet', '2024-02-15 21:21:46', 'LIM345'),
(260, 15, 'Wet', '2024-02-15 21:24:06', 'LIM345'),
(261, 15, 'Wet', '2024-02-15 21:26:44', 'LIM343'),
(262, 15, 'Wet', '2024-02-15 21:28:09', 'LIM343'),
(263, 15, 'Wet', '2024-02-15 21:30:23', 'LIM343'),
(264, 15, 'Wet', '2024-02-15 21:36:23', 'LIM343'),
(265, 15, 'Wet', '2024-02-15 21:37:47', 'LIM343'),
(266, 15, 'Dry', '2024-02-15 22:42:02', 'LIM341'),
(267, 15, 'Dry', '2024-02-15 22:42:48', 'LIM341'),
(268, 15, 'Dry', '2024-02-15 22:42:59', 'LIM341'),
(269, 15, 'Dry', '2024-02-15 22:43:34', 'LIM341'),
(270, 15, 'Dry', '2024-02-15 22:44:27', 'LIM341');

-- --------------------------------------------------------

--
-- Table structure for table `sanitaryinpectionquestion`
--

CREATE TABLE `sanitaryinpectionquestion` (
  `id` int(11) NOT NULL,
  `pitLatrine` tinyint(1) DEFAULT NULL,
  `domesticAnimal` tinyint(1) DEFAULT NULL,
  `diaperDisposal` tinyint(1) DEFAULT NULL,
  `wasteWaterRelease` tinyint(1) DEFAULT NULL,
  `openDefaction` tinyint(1) DEFAULT NULL,
  `unprotectedWaterSource` tinyint(1) DEFAULT NULL,
  `agriculturalActivity` tinyint(1) DEFAULT NULL,
  `observerLaundryActivity` tinyint(1) DEFAULT NULL,
  `samplingId` int(11) DEFAULT NULL,
  `risk_type` varchar(100) DEFAULT NULL,
  `totalYes` int(11) NOT NULL,
  `total_avarage` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sanitaryinpectionquestion`
--

INSERT INTO `sanitaryinpectionquestion` (`id`, `pitLatrine`, `domesticAnimal`, `diaperDisposal`, `wasteWaterRelease`, `openDefaction`, `unprotectedWaterSource`, `agriculturalActivity`, `observerLaundryActivity`, `samplingId`, `risk_type`, `totalYes`, `total_avarage`) VALUES
(58, 0, 1, 1, 1, 1, 0, 1, 1, 257, 'High Risk', 6, 75),
(59, 1, 1, 0, 1, 1, 0, 1, 1, 258, 'High Risk', 6, 75),
(60, 1, 1, 1, 1, 1, 0, 0, 1, 259, 'High Risk', 6, 75),
(61, 0, 1, 0, 1, 1, 0, 1, 0, 260, 'Medium Risk', 4, 50),
(62, 1, 1, 1, 1, 1, 1, 1, 1, 261, 'Very High Risk', 8, 100),
(63, 1, 1, 1, 1, 1, 0, 1, 1, 262, 'Very High Risk', 7, 88),
(64, 0, 1, 0, 0, 1, 0, 0, 0, 263, 'Low Risk', 2, 25),
(65, 1, 0, 0, 0, 0, 0, 1, 0, 264, 'Low Risk', 2, 25),
(66, 1, 0, 0, 0, 0, 0, 1, 0, 265, 'Low Risk', 2, 25),
(67, 1, 0, 0, 0, 0, 0, 0, 0, 266, 'Low Risk', 1, 13);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobileNo` varchar(11) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `level` int(5) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `email`, `mobileNo`, `password`, `firstname`, `lastname`, `level`, `role`) VALUES
(1, 'mukwevho@gmail.com', '0123456789', '123zxc', 'Gift', 'Mukwevho', 1, 'user'),
(3, 'mashaba@gmail.com', '0147896325', '123zxc', 'Noko', 'Mashaba', 0, 'municipal'),
(13, 'nathi@gmail.com', '0147852369', 'Nathi@123', 'James', 'Nathi', 2, 'user'),
(14, 'manasoedj@gmail.com', '0147852399', 'Manasoedj@12', 'Joel', 'Manasoe', 2, 'user'),
(15, 'lamola@gmail.com', '0123698745', 'Lamola123@', 'Lethabo', 'Lamola', 3, 'user'),
(16, 'ledwaba@gmail.com', '0725569740', 'Ledwaba123@', 'Jack', 'Ledwaba', 3, 'user'),
(17, 'mathiba@gmail.com', '0159874563', 'Mathiba@123', 'Zakes', 'Mathiba', 3, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `watersource`
--

CREATE TABLE `watersource` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `waterAccessability` varchar(255) DEFAULT NULL,
  `samplingId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `watersource`
--

INSERT INTO `watersource` (`id`, `type`, `waterAccessability`, `samplingId`) VALUES
(203, 'Household Tap Water', 'Hard', 225),
(204, 'Household Tap Water', 'Hard', 226),
(205, 'Household Tap Water', 'Hard', 227),
(206, 'Household Tap Water', 'Hard', 228),
(207, 'Household Tap Water', 'Easy', 229),
(208, 'Household Tap Water', 'Easy', 230),
(209, 'Household Tap Water', 'Easy', 231),
(210, 'Household Tap Water', 'Easy', 232),
(211, 'Household Tap Water', 'Easy', 233),
(212, 'Household Tap Water', 'Easy', 234),
(213, 'Household Tap Water', 'Easy', 235),
(214, 'Household Tap Water', 'Easy', 236),
(215, 'Household Tap Water', 'Easy', 237),
(216, 'Household Tap Water', 'Easy', 238),
(217, 'Household Tap Water', 'Easy', 239),
(218, 'Household Tap Water', 'Easy', 240),
(219, 'Household Tap Water', 'Easy', 241),
(220, 'Household Tap Water', 'Easy', 242),
(221, 'Household Tap Water', 'Easy', 243),
(222, 'Household Tap Water', 'Easy', 244),
(223, 'Household Tap Water', 'Easy', 245),
(224, 'Household Tap Water', 'Easy', 246),
(225, 'Household Tap Water', 'Easy', 247),
(226, 'Household Tap Water', 'Easy', 248),
(227, 'Household Tap Water', 'Easy', 249),
(228, 'Household Tap Water', 'Easy', 250),
(229, 'Household Tap Water', 'Easy', 251),
(230, 'Household Tap Water', 'Easy', 252),
(231, 'Household Tap Water', 'Easy', 253),
(232, 'Household Tap Water', 'Easy', 254),
(233, 'Household Tap Water', 'Easy', 255),
(234, 'Household Tap Water', 'Easy', 256),
(235, 'River', 'Hard', 257),
(236, 'River', 'Hard', 258),
(237, 'River', 'Hard', 259),
(238, 'River', 'Hard', 260),
(239, 'Dam', 'Hard', 261),
(240, 'Dam', 'Hard', 262),
(241, 'Dam', 'Hard', 263),
(242, 'Boreholes', 'Hard', 264),
(243, 'River', 'Hard', 265),
(244, 'water Treatment Plant', 'Hard', 266),
(245, 'water Treatment Plant', 'Hard', 267),
(246, 'water Treatment Plant', 'Hard', 268),
(247, 'water Treatment Plant', 'Hard', 269),
(248, 'water Treatment Plant', 'Hard', 270);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coordinate`
--
ALTER TABLE `coordinate`
  ADD PRIMARY KEY (`coorniadteId`),
  ADD KEY `samplingId` (`samplingId`);

--
-- Indexes for table `fib_indicator`
--
ALTER TABLE `fib_indicator`
  ADD PRIMARY KEY (`indicator_id`),
  ADD KEY `qmra_id` (`qmra_id`);

--
-- Indexes for table `hydrogensulfide`
--
ALTER TABLE `hydrogensulfide`
  ADD PRIMARY KEY (`id`),
  ADD KEY `samplingId` (`samplingId`);

--
-- Indexes for table `microbial`
--
ALTER TABLE `microbial`
  ADD PRIMARY KEY (`microbialId`),
  ADD KEY `samplingId` (`samplingId`);

--
-- Indexes for table `mst`
--
ALTER TABLE `mst`
  ADD PRIMARY KEY (`mst_id`),
  ADD KEY `qmra_id` (`qmra_id`);

--
-- Indexes for table `municipality`
--
ALTER TABLE `municipality`
  ADD PRIMARY KEY (`muni_id`),
  ADD KEY `province_id` (`province_id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`province_id`);

--
-- Indexes for table `qmra`
--
ALTER TABLE `qmra`
  ADD PRIMARY KEY (`qmra_id`),
  ADD KEY `samplingId` (`samplingId`);

--
-- Indexes for table `reference_path`
--
ALTER TABLE `reference_path`
  ADD PRIMARY KEY (`ref_path_id`),
  ADD KEY `qmra_id` (`qmra_id`);

--
-- Indexes for table `river`
--
ALTER TABLE `river`
  ADD PRIMARY KEY (`riverId`),
  ADD KEY `muni_id` (`muni_id`);

--
-- Indexes for table `samplingdata`
--
ALTER TABLE `samplingdata`
  ADD PRIMARY KEY (`samplingId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `muni_id` (`muni_id`);

--
-- Indexes for table `sanitaryinpectionquestion`
--
ALTER TABLE `sanitaryinpectionquestion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sam_san` (`samplingId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `watersource`
--
ALTER TABLE `watersource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `samplingId` (`samplingId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coordinate`
--
ALTER TABLE `coordinate`
  MODIFY `coorniadteId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `fib_indicator`
--
ALTER TABLE `fib_indicator`
  MODIFY `indicator_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `hydrogensulfide`
--
ALTER TABLE `hydrogensulfide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `microbial`
--
ALTER TABLE `microbial`
  MODIFY `microbialId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst`
--
ALTER TABLE `mst`
  MODIFY `mst_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `qmra`
--
ALTER TABLE `qmra`
  MODIFY `qmra_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `reference_path`
--
ALTER TABLE `reference_path`
  MODIFY `ref_path_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `river`
--
ALTER TABLE `river`
  MODIFY `riverId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `samplingdata`
--
ALTER TABLE `samplingdata`
  MODIFY `samplingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `sanitaryinpectionquestion`
--
ALTER TABLE `sanitaryinpectionquestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `watersource`
--
ALTER TABLE `watersource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coordinate`
--
ALTER TABLE `coordinate`
  ADD CONSTRAINT `coordinate_ibfk_1` FOREIGN KEY (`samplingId`) REFERENCES `samplingdata` (`samplingId`);

--
-- Constraints for table `fib_indicator`
--
ALTER TABLE `fib_indicator`
  ADD CONSTRAINT `fib_indicator_ibfk_1` FOREIGN KEY (`qmra_id`) REFERENCES `qmra` (`qmra_id`);

--
-- Constraints for table `hydrogensulfide`
--
ALTER TABLE `hydrogensulfide`
  ADD CONSTRAINT `hydrogensulfide_ibfk_1` FOREIGN KEY (`samplingId`) REFERENCES `samplingdata` (`samplingId`);

--
-- Constraints for table `microbial`
--
ALTER TABLE `microbial`
  ADD CONSTRAINT `microbial_ibfk_1` FOREIGN KEY (`samplingId`) REFERENCES `samplingdata` (`samplingId`);

--
-- Constraints for table `mst`
--
ALTER TABLE `mst`
  ADD CONSTRAINT `mst_ibfk_1` FOREIGN KEY (`qmra_id`) REFERENCES `qmra` (`qmra_id`);

--
-- Constraints for table `municipality`
--
ALTER TABLE `municipality`
  ADD CONSTRAINT `municipality_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`province_id`);

--
-- Constraints for table `qmra`
--
ALTER TABLE `qmra`
  ADD CONSTRAINT `qmra_ibfk_2` FOREIGN KEY (`samplingId`) REFERENCES `samplingdata` (`samplingId`);

--
-- Constraints for table `reference_path`
--
ALTER TABLE `reference_path`
  ADD CONSTRAINT `reference_path_ibfk_1` FOREIGN KEY (`qmra_id`) REFERENCES `qmra` (`qmra_id`);

--
-- Constraints for table `river`
--
ALTER TABLE `river`
  ADD CONSTRAINT `river_ibfk_1` FOREIGN KEY (`muni_id`) REFERENCES `municipality` (`muni_id`);

--
-- Constraints for table `samplingdata`
--
ALTER TABLE `samplingdata`
  ADD CONSTRAINT `samplingdata_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  ADD CONSTRAINT `samplingdata_ibfk_2` FOREIGN KEY (`muni_id`) REFERENCES `municipality` (`muni_id`);

--
-- Constraints for table `sanitaryinpectionquestion`
--
ALTER TABLE `sanitaryinpectionquestion`
  ADD CONSTRAINT `sam_san` FOREIGN KEY (`samplingId`) REFERENCES `samplingdata` (`samplingId`);

--
-- Constraints for table `watersource`
--
ALTER TABLE `watersource`
  ADD CONSTRAINT `watersource_ibfk_1` FOREIGN KEY (`samplingId`) REFERENCES `samplingdata` (`samplingId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
