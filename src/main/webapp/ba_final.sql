-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-07-2022 a las 21:15:10
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ba_final`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `charla`
--

CREATE TABLE `charla` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `detalle` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Chara del Orador';

--
-- Volcado de datos para la tabla `charla`
--

INSERT INTO `charla` (`id`, `usuario_id`, `titulo`, `detalle`) VALUES
(1, 1, 'Titulo 01', 'Detalle 1'),
(3, 1, 'Titulo 03', 'Detalle 3'),
(4, 5, 'Charla 1', 'detalle 1'),
(5, 5, 'Charla 2', 'detalle charla 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiket`
--

CREATE TABLE `tiket` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `email` varchar(80) NOT NULL,
  `descuento` varchar(4) NOT NULL,
  `cantidad` tinyint(3) UNSIGNED NOT NULL,
  `total` decimal(8,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tiket del Evento';

--
-- Volcado de datos para la tabla `tiket`
--

INSERT INTO `tiket` (`id`, `nombre`, `apellido`, `email`, `descuento`, `cantidad`, `total`) VALUES
(6, 'Iván', 'Pieszko', 'ivan.pieszko@gmail.com', '0.15', 2, '340.00'),
(7, 'Iván', 'Pieszko', 'ivan.pieszko@gmail.com', '0.15', 3, '510.00'),
(8, 'Iván', 'Pieszko', 'ivan.pieszko@gmail.com', '0.15', 1, '170.00'),
(9, 'Iván', 'Pieszko', 'ivan.pieszko@gmail.com', '0.15', 2, '340.00'),
(10, 'Silvia', 'Villena', 'silvi.villena@gmail.com', '0.50', 4, '400.00'),
(11, 'Nombre', 'Apellido', 'nombre@apellido.com', '0.00', 2, '400.00'),
(12, 'Iván', 'Pieszko', 'ivan.pieszko@gmail.com', '0.15', 3, '510.00'),
(13, 'Silvia', 'Villena', 'silvi.villena@gmail.com', '0.50', 1, '100.00'),
(14, 'Silvia', 'Villena', 'silvi.villena@gmail.com', '0.50', 2, '200.00'),
(15, 'Iván', 'Pieszko', 'ivan.pieszko@gmail.com', '0.15', 8, '1360.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `categoria` set('oyente','estudiante','trainee','junior') NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(10) NOT NULL,
  `es_admin` tinyint(1) NOT NULL,
  `telefono` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Usuario del Sistema';

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `categoria`, `nombre`, `apellido`, `email`, `password`, `es_admin`, `telefono`) VALUES
(1, 'junior', 'Iván', 'Pieszko', 'ivan.pieszko@gmail.com', 'admin', 1, 31037776),
(2, 'trainee', 'Silvia', 'Villena', 'silvi.villena@gmail.com', '1234', 1, 0),
(3, 'trainee', 'Adrés', 'Villena', 'andres.villena@gmail.com', '1234', 1, 0),
(4, 'estudiante', 'Coco', 'Villena', 'coco@perros.com', '1234', 0, 0),
(5, 'estudiante', 'Kan', 'villena', 'kan@perros.com', '1234', 0, 0),
(6, 'oyente', 'Usuario', 'Externo', 'usuario@externo.com', '1234', 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `charla`
--
ALTER TABLE `charla`
  ADD PRIMARY KEY (`id`),
  ADD KEY `charla_usuario` (`usuario_id`);

--
-- Indices de la tabla `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `charla`
--
ALTER TABLE `charla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tiket`
--
ALTER TABLE `tiket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `charla`
--
ALTER TABLE `charla`
  ADD CONSTRAINT `charla_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
