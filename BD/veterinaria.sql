-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2025 a las 19:16:16
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
-- Base de datos: `veterinaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administracion`
--

CREATE TABLE `administracion` (
  `administracion_id` int(11) NOT NULL,
  `consulta_fk` int(11) NOT NULL,
  `medico_fk` int(11) NOT NULL,
  `cantidad` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administracion`
--

INSERT INTO `administracion` (`administracion_id`, `consulta_fk`, `medico_fk`, `cantidad`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 2),
(4, 4, 4, 1),
(5, 5, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `consulta_id` int(11) NOT NULL,
  `mascota_fk` int(11) NOT NULL,
  `medico_fk` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `diagnostico` varchar(1000) DEFAULT NULL,
  `tratamiento` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`consulta_id`, `mascota_fk`, `medico_fk`, `fecha`, `diagnostico`, `tratamiento`) VALUES
(1, 1, 1, '2025-10-10 10:00:00', 'Infección de oído', 'Antibiótico Amoxicilina por 7 días'),
(2, 2, 2, '2025-10-12 11:30:00', 'Alergia cutánea', 'Prednisona por 5 días'),
(3, 3, 3, '2025-10-15 09:00:00', 'Problema respiratorio', 'Ivermectina dosis única'),
(4, 4, 4, '2025-10-18 13:45:00', 'Conjuntivitis', 'Gotas oftálmicas y limpieza diaria'),
(5, 5, 5, '2025-10-20 16:00:00', 'Dolor dental', 'Meloxicam por 3 días');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_consultas`
--

CREATE TABLE `detalle_consultas` (
  `detalle_id` int(11) NOT NULL,
  `consulta_fk` int(11) NOT NULL,
  `medicamento_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_consultas`
--

INSERT INTO `detalle_consultas` (`detalle_id`, `consulta_fk`, `medicamento_fk`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 2),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `codigo_m` int(11) NOT NULL,
  `propietario_fk` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `especie` varchar(100) DEFAULT NULL,
  `raza` varchar(50) DEFAULT NULL,
  `edad` int(2) DEFAULT NULL,
  `peso` decimal(5,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`codigo_m`, `propietario_fk`, `nombre`, `especie`, `raza`, `edad`, `peso`) VALUES
(1, 1, 'Luna', 'Perro', 'Labrador', 3, 25.5),
(2, 2, 'Michi', 'Gato', 'Siames', 2, 4.2),
(3, 3, 'Rocky', 'Perro', 'Bulldog', 4, 28.0),
(4, 4, 'Nina', 'Conejo', 'Enano holandés', 1, 1.5),
(5, 5, 'Toby', 'Perro', 'Golden Retriever', 5, 30.3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `codigo` int(11) NOT NULL,
  `nombre_comercial` varchar(100) NOT NULL,
  `dosis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`codigo`, `nombre_comercial`, `dosis`) VALUES
(1, 'Amoxicilina', 250),
(2, 'Ivermectina', 10),
(3, 'Prednisona', 20),
(4, 'Ketamina', 50),
(5, 'Meloxicam', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `num_empleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `horario` varchar(50) NOT NULL,
  `especialidad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`num_empleado`, `nombre`, `horario`, `especialidad`) VALUES
(1, 'Dr. Ricardo Gómez', 'Lun-Vie 9:00-17:00', 'Veterinaria general'),
(2, 'Dra. Elena Cruz', 'Mar-Sab 10:00-18:00', 'Dermatología animal'),
(3, 'Dr. Manuel Soto', 'Lun-Vie 8:00-16:00', 'Cirugía veterinaria'),
(4, 'Dra. Fernanda Díaz', 'Mié-Dom 11:00-19:00', 'Oftalmología animal'),
(5, 'Dr. Pablo Reyes', 'Lun-Sab 9:00-15:00', 'Dentista veterinario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios`
--

CREATE TABLE `propietarios` (
  `propietario_id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `propietarios`
--

INSERT INTO `propietarios` (`propietario_id`, `nombre`, `direccion`, `telefono`) VALUES
(1, 'Carlos Pérez', 'Av. Reforma 123, CDMX', 2147483647),
(2, 'María López', 'Calle Juárez 45, Puebla', 2147483647),
(3, 'Luis Hernández', 'Av. Hidalgo 789, Monterrey', 2147483647),
(4, 'Ana Torres', 'Col. Centro 56, Guadalajara', 2147483647),
(5, 'Jorge Ramírez', 'Av. Morelos 321, Toluca', 2147483647);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administracion`
--
ALTER TABLE `administracion`
  ADD PRIMARY KEY (`administracion_id`),
  ADD KEY `fk_cons` (`consulta_fk`),
  ADD KEY `fk_medic` (`medico_fk`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`consulta_id`),
  ADD KEY `fk_masc` (`mascota_fk`),
  ADD KEY `fk_med` (`medico_fk`);

--
-- Indices de la tabla `detalle_consultas`
--
ALTER TABLE `detalle_consultas`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `fk_detail` (`consulta_fk`),
  ADD KEY `fk_medica` (`medicamento_fk`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`codigo_m`),
  ADD KEY `fk_prop` (`propietario_fk`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`num_empleado`);

--
-- Indices de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`propietario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administracion`
--
ALTER TABLE `administracion`
  MODIFY `administracion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `consulta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_consultas`
--
ALTER TABLE `detalle_consultas`
  MODIFY `detalle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `codigo_m` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `num_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `propietario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administracion`
--
ALTER TABLE `administracion`
  ADD CONSTRAINT `fk_cons` FOREIGN KEY (`consulta_fk`) REFERENCES `consultas` (`consulta_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_medic` FOREIGN KEY (`medico_fk`) REFERENCES `medicos` (`num_empleado`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `fk_masc` FOREIGN KEY (`mascota_fk`) REFERENCES `mascotas` (`codigo_m`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_med` FOREIGN KEY (`medico_fk`) REFERENCES `medicos` (`num_empleado`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_consultas`
--
ALTER TABLE `detalle_consultas`
  ADD CONSTRAINT `fk_detail` FOREIGN KEY (`consulta_fk`) REFERENCES `consultas` (`consulta_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_medica` FOREIGN KEY (`medicamento_fk`) REFERENCES `medicamentos` (`codigo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `fk_prop` FOREIGN KEY (`propietario_fk`) REFERENCES `propietarios` (`propietario_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
