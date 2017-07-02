-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 02 2017 г., 18:48
-- Версия сервера: 5.6.26
-- Версия PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `curs`
--

-- --------------------------------------------------------

--
-- Структура таблицы `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `r030` int(11) NOT NULL,
  `txt` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `cc` varchar(255) NOT NULL,
  `exchange_date` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Дамп данных таблицы `currencies`
--

INSERT INTO `currencies` (`id`, `r030`, `txt`, `rate`, `cc`, `exchange_date`) VALUES
(1, 985, 'Злотий', '7.010469', 'PLN', '2017-07-01 21:00:00'),
(2, 986, 'Бразильський реал', '7.898369', 'BRL', '2017-07-01 21:00:00'),
(3, 972, 'Сомонi', '2.956529', 'TJS', '2017-07-01 21:00:00'),
(4, 643, 'Російський рубль', '0.44172', 'RUB', '2017-07-01 21:00:00'),
(5, 941, 'Сербський динар', '0.247065', 'RSD', '2017-07-01 21:00:00'),
(6, 933, 'Білоруський рубль', '13.49762', 'BYN', '2017-07-01 21:00:00'),
(7, 12, 'Алжирський динар', '0.241703', 'DZD', '2017-07-01 21:00:00'),
(8, 944, 'Азербайджанський манат', '15.288977', 'AZN', '2017-07-01 21:00:00'),
(9, 36, 'Австралійський долар', '20.034155', 'AUD', '2017-07-01 21:00:00'),
(10, 50, 'Така', '0.32267', 'BDT', '2017-07-01 21:00:00'),
(11, 51, 'Вiрменський драм', '0.05416231', 'AMD', '2017-07-01 21:00:00'),
(12, 975, 'Болгарський лев', '15.229973', 'BGN', '2017-07-01 21:00:00'),
(13, 124, 'Канадський долар', '20.035503', 'CAD', '2017-07-01 21:00:00'),
(14, 152, 'Чилійське песо', '0.0386618', 'CLP', '2017-07-01 21:00:00'),
(15, 156, 'Юань Женьмiньбi', '3.847825', 'CNY', '2017-07-01 21:00:00'),
(16, 191, 'Куна', '4.018453', 'HRK', '2017-07-01 21:00:00'),
(17, 203, 'Чеська крона', '1.132577', 'CZK', '2017-07-01 21:00:00'),
(18, 208, 'Данська крона', '4.005376', 'DKK', '2017-07-01 21:00:00'),
(19, 344, 'Гонконгівський долар', '3.342811', 'HKD', '2017-07-01 21:00:00'),
(20, 348, 'Форинт', '0.0960678', 'HUF', '2017-07-01 21:00:00'),
(21, 352, 'Ісландська крона', '0.224259', 'ISK', '2017-07-01 21:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_currency_in` int(11) NOT NULL,
  `id_currency_out` int(11) NOT NULL,
  `result` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_currency_in` (`id_currency_in`),
  KEY `id_currency_out` (`id_currency_out`),
  KEY `id_currency_out_2` (`id_currency_out`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Дамп данных таблицы `history`
--

INSERT INTO `history` (`id`, `id_currency_in`, `id_currency_out`, `result`, `created_at`) VALUES
(1, 16, 16, '2.00', '2017-07-01 22:09:18'),
(2, 4, 5, '5.36', '2017-07-01 22:19:02'),
(3, 19, 18, '1.67', '2017-07-01 22:32:05'),
(4, 18, 18, '3.00', '2017-07-01 22:32:21'),
(5, 18, 17, '10.61', '2017-07-01 22:32:47'),
(6, 16, 1, '1.15', '2017-07-02 14:28:51'),
(7, 14, 1, '0.02', '2017-07-02 14:29:23'),
(8, 1, 12, '0.92', '2017-07-02 14:30:34'),
(9, 1, 12, '1.84', '2017-07-02 14:30:44'),
(10, 1, 12, '0.92', '2017-07-02 14:30:54'),
(11, 1, 12, '10.59', '2017-07-02 14:31:09'),
(12, 14, 1, '0.01', '2017-07-02 14:34:52'),
(13, 17, 12, '0.45', '2017-07-02 15:27:17'),
(14, 11, 12, '0.03', '2017-07-02 15:27:29'),
(15, 12, 12, '10.00', '2017-07-02 15:27:46'),
(16, 13, 16, '279.21', '2017-07-02 15:29:17'),
(17, 20, 16, '0.12', '2017-07-02 15:29:32'),
(18, 1, 1, '0.00', '2017-07-02 15:34:04'),
(19, 1, 1, '4.00', '2017-07-02 15:38:40'),
(20, 1, 1, '4.00', '2017-07-02 15:39:07'),
(21, 14, 1, '0.02', '2017-07-02 15:43:09'),
(22, 14, 1, '0.25', '2017-07-02 15:43:16'),
(23, 14, 1, '2.48', '2017-07-02 15:43:24');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`id_currency_in`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`id_currency_out`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
