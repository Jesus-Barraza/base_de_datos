-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-11-2025 a las 03:29:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cine_estrella`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones_ventas`
--

CREATE TABLE `funciones_ventas` (
  `venta_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `pelicula` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `boletos_vendidos` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `sala` int(11) NOT NULL,
  `ciudad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `funciones_ventas`
--

INSERT INTO `funciones_ventas` (`venta_id`, `fecha`, `pelicula`, `categoria`, `boletos_vendidos`, `precio_unitario`, `sala`, `ciudad`) VALUES
(1, '2025-01-05', 'Avatar 2', 'Acción', 120, 80.00, 1, 'Monterrey'),
(2, '2025-01-07', 'Encanto', 'Infantil', 150, 60.00, 2, 'Monterrey'),
(3, '2025-02-10', 'Batman', 'Acción', 200, 75.00, 3, 'Guadalajara'),
(4, '2025-02-14', 'Titanic', 'Romance', 100, 70.00, 1, 'Guadalajara'),
(5, '2025-03-01', 'Toy Story 4', 'Infantil', 180, 65.00, 2, 'Puebla'),
(6, '2025-03-02', 'Avatar 2', 'Acción', 220, 85.00, 1, 'Puebla'),
(7, '2025-03-15', 'Coco', 'Infantil', 160, 60.00, 2, 'Monterrey'),
(8, '2025-04-10', 'Titanic', 'Romance', 130, 75.00, 3, 'Puebla'),
(9, '2025-04-22', 'Avatar 2', 'Acción', 210, 90.00, 1, 'Monterrey'),
(10, '2025-05-01', 'Avengers', 'Acción', 300, 100.00, 1, 'Guadalajara'),
(11, '2025-05-10', 'Frozen 2', 'Infantil', 190, 70.00, 2, 'Puebla'),
(12, '2025-06-05', 'Titanic', 'Romance', 80, 60.00, 3, 'Monterrey');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `funciones_ventas`
--
ALTER TABLE `funciones_ventas`
  ADD PRIMARY KEY (`venta_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
