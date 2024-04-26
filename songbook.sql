-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 26 Kwi 2024, 07:16
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `songbook`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `chord`
--

CREATE TABLE `chord` (
  `id` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `uploadDate` datetime DEFAULT current_timestamp(),
  `editUserId` int(11) DEFAULT NULL,
  `editDate` datetime DEFAULT NULL,
  `alternativeTitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `chords` varchar(10000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `chordupdaterequest`
--

CREATE TABLE `chordupdaterequest` (
  `id` int(11) NOT NULL,
  `chordId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `uploadDate` datetime DEFAULT current_timestamp(),
  `alternativeTitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `chords` varchar(10000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `adminId` int(11) NOT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `rejectionMessage` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `customtext`
--

CREATE TABLE `customtext` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `uploadDate` datetime DEFAULT current_timestamp(),
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` varchar(1000) DEFAULT NULL,
  `remain` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `favoritesongs`
--

CREATE TABLE `favoritesongs` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `songId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `upladDate` datetime DEFAULT current_timestamp(),
  `type` enum('bug','suggestion','other') COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `presentation`
--

CREATE TABLE `presentation` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `uploadDate` datetime DEFAULT current_timestamp(),
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(800) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `remembertoken`
--

CREATE TABLE `remembertoken` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `settings`
--

CREATE TABLE `settings` (
  `Id` int(11) NOT NULL,
  `fontSize` int(11) DEFAULT NULL,
  `colorTheme` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'default',
  `nextSlide` varchar(5) COLLATE utf8_unicode_ci DEFAULT 'left',
  `reset` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'r'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `song`
--

CREATE TABLE `song` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `uploadDate` datetime DEFAULT current_timestamp(),
  `editUserId` int(11) DEFAULT NULL,
  `editDate` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `shortTitle` varchar(16) DEFAULT NULL,
  `tagList` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `textId` int(11) DEFAULT NULL,
  `chordId` int(11) DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `songupdaterequest`
--

CREATE TABLE `songupdaterequest` (
  `id` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `uploadDate` datetime DEFAULT current_timestamp(),
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shortTitle` varchar(16) DEFAULT NULL,
  `tagList` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `textId` int(11) DEFAULT NULL,
  `chordId` int(11) DEFAULT NULL,
  `deleteRequest` tinyint(1) NOT NULL DEFAULT 0,
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `adminId` int(11) NOT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `rejectionMessage` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `text`
--

CREATE TABLE `text` (
  `id` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `uploadDate` datetime DEFAULT current_timestamp(),
  `editUserId` int(11) DEFAULT NULL,
  `editDate` datetime DEFAULT NULL,
  `alternativeTitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` varchar(10000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `textupdaterequest`
--

CREATE TABLE `textupdaterequest` (
  `id` int(11) NOT NULL,
  `textId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `uploadDate` datetime DEFAULT current_timestamp(),
  `alternativeTitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` varchar(10000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `adminId` int(11) NOT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `rejectionMessage` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `cityId` int(11) DEFAULT NULL,
  `joinDate` date DEFAULT current_timestamp(),
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `authorizationLevel` int(11) DEFAULT 0,
  `verified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Wyzwalacze `user`
--
DELIMITER $$
CREATE TRIGGER `generateSettings` AFTER INSERT ON `user` FOR EACH ROW BEGIN
    INSERT INTO settings VALUES(NEW.id, NULL, default, default, DEFAULT);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `verifyAccount` BEFORE UPDATE ON `user` FOR EACH ROW BEGIN
    IF NEW.verified = TRUE THEN
        SET NEW.authorizationLevel = 1;
    END IF;
END
$$
DELIMITER ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `chord`
--
ALTER TABLE `chord`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `chordupdaterequest`
--
ALTER TABLE `chordupdaterequest`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `customtext`
--
ALTER TABLE `customtext`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `favoritesongs`
--
ALTER TABLE `favoritesongs`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `presentation`
--
ALTER TABLE `presentation`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `remembertoken`
--
ALTER TABLE `remembertoken`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`Id`);

--
-- Indeksy dla tabeli `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `songupdaterequest`
--
ALTER TABLE `songupdaterequest`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `text`
--
ALTER TABLE `text`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `textupdaterequest`
--
ALTER TABLE `textupdaterequest`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `chord`
--
ALTER TABLE `chord`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `chordupdaterequest`
--
ALTER TABLE `chordupdaterequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `customtext`
--
ALTER TABLE `customtext`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `favoritesongs`
--
ALTER TABLE `favoritesongs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `presentation`
--
ALTER TABLE `presentation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `remembertoken`
--
ALTER TABLE `remembertoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `song`
--
ALTER TABLE `song`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `songupdaterequest`
--
ALTER TABLE `songupdaterequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `text`
--
ALTER TABLE `text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `textupdaterequest`
--
ALTER TABLE `textupdaterequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
