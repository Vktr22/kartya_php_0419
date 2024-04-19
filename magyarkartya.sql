-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 19. 09:51
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `magyarkartya`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `forma`
--

CREATE TABLE `forma` (
  `formaAzon` int(11) NOT NULL,
  `ertek` int(11) NOT NULL,
  `szoveg` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `forma`
--

INSERT INTO `forma` (`formaAzon`, `ertek`, `szoveg`) VALUES
(1, 2, 'alsó'),
(2, 3, 'felső'),
(3, 4, 'király'),
(4, 5, 'ász'),
(5, 6, 'alsó'),
(6, 7, '7'),
(7, 8, '8'),
(8, 9, '9');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kartya`
--

CREATE TABLE `kartya` (
  `szinAzon` int(11) NOT NULL,
  `formaAzon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `kartya`
--

INSERT INTO `kartya` (`szinAzon`, `formaAzon`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szin`
--

CREATE TABLE `szin` (
  `szinAzon` int(11) NOT NULL,
  `nev` varchar(20) NOT NULL,
  `kep` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `szin`
--

INSERT INTO `szin` (`szinAzon`, `nev`, `kep`) VALUES
(1, 'piros', 'piros.png'),
(2, 'zöld', 'zold.png'),
(3, 'tök', 'tok.png'),
(4, 'makk', 'makk.png');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `forma`
--
ALTER TABLE `forma`
  ADD PRIMARY KEY (`formaAzon`);

--
-- A tábla indexei `kartya`
--
ALTER TABLE `kartya`
  ADD PRIMARY KEY (`szinAzon`,`formaAzon`),
  ADD KEY `formaAzon` (`formaAzon`);

--
-- A tábla indexei `szin`
--
ALTER TABLE `szin`
  ADD PRIMARY KEY (`szinAzon`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `forma`
--
ALTER TABLE `forma`
  MODIFY `formaAzon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT a táblához `szin`
--
ALTER TABLE `szin`
  MODIFY `szinAzon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `kartya`
--
ALTER TABLE `kartya`
  ADD CONSTRAINT `kartya_ibfk_1` FOREIGN KEY (`szinAzon`) REFERENCES `szin` (`szinAzon`),
  ADD CONSTRAINT `kartya_ibfk_2` FOREIGN KEY (`formaAzon`) REFERENCES `forma` (`formaAzon`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
