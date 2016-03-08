-- phpMyAdmin SQL Dump
-- version 
-- http://www.phpmyadmin.net
--
-- Хост: seight.mysql
-- Время создания: Мар 09 2016 г., 01:10
-- Версия сервера: 5.6.25-73.1
-- Версия PHP: 5.6.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `seight_clean`
--

-- --------------------------------------------------------

--
-- Структура таблицы `hars`
--
-- Создание: Мар 05 2016 г., 13:27
--

DROP TABLE IF EXISTS `hars`;
CREATE TABLE IF NOT EXISTS `hars` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(2) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `hars`
--

INSERT INTO `hars` (`id`, `name`, `type`, `is_active`, `created`, `modified`) VALUES
(1, 'Стандарт связи', 1, 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(2, 'Тип', 1, 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(3, 'Операционная система', 1, 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(4, 'Вес', 1, 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `hars_harvals`
--
-- Создание: Мар 05 2016 г., 20:26
--

DROP TABLE IF EXISTS `hars_harvals`;
CREATE TABLE IF NOT EXISTS `hars_harvals` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `har_id` int(11) NOT NULL,
  `harval_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `hars_harvals`
--

INSERT INTO `hars_harvals` (`id`, `product_id`, `har_id`, `harval_id`, `is_active`, `created`, `modified`) VALUES
(1, 1, 1, 1, 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(2, 2, 1, 1, 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(3, 3, 1, 1, 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(4, 4, 1, 1, 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(5, 1, 2, 2, 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(6, 2, 2, 2, 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(7, 3, 2, 2, 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(8, 1, 3, 3, 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(9, 3, 3, 4, 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(10, 6, 2, 2, 1, '2016-03-07 00:00:00', '2016-03-07 00:00:00'),
(11, 2, 4, 5, 1, '2016-03-08 00:00:00', '2016-03-08 00:00:00'),
(12, 3, 4, 6, 1, '2016-03-08 00:00:00', '2016-03-08 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `harvals`
--
-- Создание: Мар 05 2016 г., 15:53
--

DROP TABLE IF EXISTS `harvals`;
CREATE TABLE IF NOT EXISTS `harvals` (
  `id` int(11) NOT NULL,
  `val` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `harvals`
--

INSERT INTO `harvals` (`id`, `val`, `is_active`, `created`, `modified`) VALUES
(1, '3G', 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(2, 'Смартфон', 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(3, 'IoS', 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(4, 'Android', 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(5, '140 г', 1, '2016-03-08 00:00:00', '2016-03-08 00:00:00'),
(6, '0,15 кг', 1, '2016-03-08 00:00:00', '2016-03-08 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `prices`
--
-- Создание: Мар 05 2016 г., 14:38
--

DROP TABLE IF EXISTS `prices`;
CREATE TABLE IF NOT EXISTS `prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` float(7,2) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `prices`
--

INSERT INTO `prices` (`id`, `product_id`, `price`, `created`, `modified`) VALUES
(1, 1, 21970.00, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(2, 2, 14880.00, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(4, 4, 19377.00, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(5, 5, 16647.00, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(6, 6, 20000.00, '2016-03-05 00:00:00', '2016-03-05 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--
-- Создание: Мар 04 2016 г., 22:54
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `is_active`, `created`, `modified`) VALUES
(1, 'AppleIphone 5 16 Gb', 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(2, 'Apple iPhone 4S 16Gb', 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(3, 'Samsung Galaxy S III GT-I9300 16Gb', 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(4, 'Samsung Galaxy S4 16Gb GT-I9500', 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(5, 'Sony Xperia Z', 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(6, 'HTC One 32Gb', 1, '2016-03-05 00:00:00', '2016-03-05 00:00:00'),
(7, 'Тестовый неактивный товар', 0, '2016-03-05 00:00:00', '2016-03-05 00:00:00');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `hars`
--
ALTER TABLE `hars`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `hars_harvals`
--
ALTER TABLE `hars_harvals`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `harvals`
--
ALTER TABLE `harvals`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `hars`
--
ALTER TABLE `hars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `hars_harvals`
--
ALTER TABLE `hars_harvals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `harvals`
--
ALTER TABLE `harvals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
