-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Мар 20 2016 г., 10:42
-- Версия сервера: 5.6.24
-- Версия PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `testlr`
--

-- --------------------------------------------------------

--
-- Структура таблицы `my_log`
--

CREATE TABLE IF NOT EXISTS `my_log` (
  `log_id` int(11) NOT NULL,
  `remote_addr` varchar(255) NOT NULL DEFAULT '',
  `request_uri` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `my_log`
--

INSERT INTO `my_log` (`log_id`, `remote_addr`, `request_uri`, `message`, `log_date`) VALUES
(1, '127.0.0.1', '/lllggg.php', 'Something happened!', '2016-03-15 18:46:21'),
(2, '127.0.0.1', '/lllggg.php', 'Something happened!', '2016-03-15 18:47:09'),
(3, '127.0.0.1', '/lllggg.php', 'Something happened!', '2016-03-15 18:47:12'),
(4, '127.0.0.1', '/lllggg.php', 'Something happened!', '2016-03-15 18:47:14'),
(5, '127.0.0.1', '/lllggg.php', 'Something happened!', '2016-03-15 18:47:17'),
(6, '127.0.0.1', '/lllggg.php', 'Something happened!', '2016-03-15 18:47:18'),
(7, '127.0.0.1', '/lllggg.php', 'Something happened!', '2016-03-15 18:47:20'),
(8, '127.0.0.1', '/lllggg.php', 'Something happened!', '2016-03-15 18:47:40'),
(9, '127.0.0.1', '/lllggg.php', 'Something happened!', '2016-03-16 07:42:10'),
(10, '127.0.0.1', '/lllggg.php', 'Something happened!', '2016-03-16 07:56:03'),
(11, '127.0.0.1', '/lllggg.php', 'Something  bad happened!', '2016-03-16 08:43:53'),
(12, '127.0.0.1', '/lllggg.php', 'Something  bad  happened!', '2016-03-16 08:46:08'),
(13, '127.0.0.1', '/lllggg.php', 'Something  bad  happened!', '2016-03-16 08:46:13'),
(14, '127.0.0.1', '/lllggg.php', 'Something  bad  happened!', '2016-03-16 08:46:57'),
(15, '127.0.0.1', '/lllggg.php', 'Something  bad  happened!', '2016-03-16 11:00:54'),
(16, '127.0.0.1', '/lllggg.php', 'Something  bad  happened!', '2016-03-16 11:01:33'),
(17, '127.0.0.1', '/lllggg.php', 'Something  bad  happened!', '2016-03-16 11:01:34'),
(18, '127.0.0.1', '/lllggg.php', 'Hello', '2016-03-16 11:24:21'),
(19, '127.0.0.1', '/lllggg.php', 'Something unnormal happened', '2016-03-16 11:25:14'),
(20, '127.0.0.1', '/lllggg.php', 'Something unnormal happened', '2016-03-16 17:07:35'),
(21, '127.0.0.1', '/log.php', 'Something unnormal happened', '2016-03-17 04:23:06'),
(22, '127.0.0.1', '/logger_classes.php', '', '2016-03-19 09:04:20'),
(23, '127.0.0.1', '/logger_classes.php', '', '2016-03-19 09:09:58'),
(24, '127.0.0.1', '/logger_classes.php', 'Something bad happened', '2016-03-19 09:12:53'),
(25, '127.0.0.1', '/logger_classes.php', 'Something bad happened', '2016-03-19 09:15:24'),
(26, '127.0.0.1', '/logger_classes.php', 'Something bad happened', '2016-03-19 09:16:34'),
(27, '127.0.0.1', '/adapter_log.php', 'My awesome message 20', '2016-03-20 08:49:33'),
(28, '127.0.0.1', '/adapter_log.php', 'My awesome message - 0', '2016-03-20 08:50:34'),
(29, '127.0.0.1', '/adapter_log.php', 'My awesome message - 0', '2016-03-20 08:52:22'),
(30, '127.0.0.1', '/adapter_log.php', 'My awesome message - 0', '2016-03-20 08:54:19'),
(31, '127.0.0.1', '/adapter_log.php', 'My awesome message - 0', '2016-03-20 09:25:05');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `my_log`
--
ALTER TABLE `my_log`
  ADD PRIMARY KEY (`log_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `my_log`
--
ALTER TABLE `my_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
