-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Úte 21. pro 2021, 18:14
-- Verze serveru: 10.4.21-MariaDB
-- Verze PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `eshop`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `street` varchar(128) COLLATE utf8_bin NOT NULL,
  `des_number` int(11) NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `postcode` int(11) NOT NULL,
  `country` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Vypisuji data pro tabulku `addresses`
--

INSERT INTO `addresses` (`id`, `street`, `des_number`, `city`, `postcode`, `country`) VALUES
(1, 'Na Buřince', 55, 'Mladá Boleslav', 29301, 'Czech republic');

-- --------------------------------------------------------

--
-- Struktura tabulky `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabulky `category_products`
--

CREATE TABLE `category_products` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `productsId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabulky `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(64) COLLATE utf8_bin NOT NULL,
  `phonenum` bigint(20) NOT NULL,
  `email` varchar(128) COLLATE utf8_bin NOT NULL,
  `aboutinf` text COLLATE utf8_bin NOT NULL,
  `IČO` int(11) NOT NULL,
  `DIČ` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Vypisuji data pro tabulku `customers`
--

INSERT INTO `customers` (`id`, `name`, `lastname`, `phonenum`, `email`, `aboutinf`, `IČO`, `DIČ`) VALUES
(1, 'Adam', 'Novak', 728156552, 'dontstarvecz@gmail.com', 'Je to prase.', 23856299, 26583664);

-- --------------------------------------------------------

--
-- Struktura tabulky `customers_addresses`
--

CREATE TABLE `customers_addresses` (
  `id` int(11) NOT NULL,
  `customersId` int(11) NOT NULL,
  `addressesId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabulky `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `barcode` bigint(20) NOT NULL,
  `supplier_code` bigint(20) NOT NULL,
  `producer` varchar(64) COLLATE utf8_bin NOT NULL,
  `evaluation` int(11) NOT NULL,
  `parameters` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabulky `product_price`
--

CREATE TABLE `product_price` (
  `id` int(11) NOT NULL,
  `product_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexy pro tabulku `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexy pro tabulku `category_products`
--
ALTER TABLE `category_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `productsId` (`productsId`);

--
-- Indexy pro tabulku `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexy pro tabulku `customers_addresses`
--
ALTER TABLE `customers_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `customersId` (`customersId`),
  ADD KEY `addressesId` (`addressesId`);

--
-- Indexy pro tabulku `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `product_price`
--
ALTER TABLE `product_price`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `category_products`
--
ALTER TABLE `category_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `customers_addresses`
--
ALTER TABLE `customers_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `product_price`
--
ALTER TABLE `product_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `category_products`
--
ALTER TABLE `category_products`
  ADD CONSTRAINT `category_products_ibfk_1` FOREIGN KEY (`productsId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `category_products_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`);

--
-- Omezení pro tabulku `customers_addresses`
--
ALTER TABLE `customers_addresses`
  ADD CONSTRAINT `customers_addresses_ibfk_1` FOREIGN KEY (`customersId`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `customers_addresses_ibfk_2` FOREIGN KEY (`addressesId`) REFERENCES `addresses` (`id`);

--
-- Omezení pro tabulku `product_price`
--
ALTER TABLE `product_price`
  ADD CONSTRAINT `product_price_ibfk_1` FOREIGN KEY (`id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
