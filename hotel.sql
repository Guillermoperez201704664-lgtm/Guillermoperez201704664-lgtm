-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-09-2020 a las 03:07:55
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `administrador_id` int(11) NOT NULL,
  `nombre_administrador` int(11) NOT NULL,
  `apellido_administrador` int(11) NOT NULL,
  `DPI` int(11) NOT NULL,
  `edad` int(11) NOT NULL,
  `sexo_id` int(11) NOT NULL,
  `useer` int(11) NOT NULL,
  `password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_habitacion`
--

CREATE TABLE `asignacion_habitacion` (
  `correlativo` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `habitacion_id` int(11) NOT NULL,
  `Fecha_ingreso` text NOT NULL,
  `estatus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int(11) NOT NULL,
  `nombre_cliente` text NOT NULL,
  `apellido_cliente` text NOT NULL,
  `Dpi` int(11) NOT NULL,
  `sexo_id` int(11) NOT NULL,
  `administrador_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `empleado_id` int(11) NOT NULL,
  `nombre_empleado` text NOT NULL,
  `apellido_empleado` text NOT NULL,
  `DPI` int(11) NOT NULL,
  `edad` int(11) NOT NULL,
  `user` text NOT NULL,
  `password` text NOT NULL,
  `sexo_id` int(11) NOT NULL,
  `administrador_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus_habitacion`
--

CREATE TABLE `estatus_habitacion` (
  `estatus_id` int(11) NOT NULL,
  `tipo_estatus` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `habitacion_id` int(11) NOT NULL,
  `tipo_habitacion_id` int(11) NOT NULL,
  `piso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `piso`
--

CREATE TABLE `piso` (
  `piso_id` int(11) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `sexo_id` int(11) NOT NULL,
  `tipo_sexo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_habitacion`
--

CREATE TABLE `tipo_habitacion` (
  `tipo_habitacion_id` int(11) NOT NULL,
  `nombre_habitacion` int(11) NOT NULL,
  `Precio_hora` int(11) NOT NULL,
  `Precio_dia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`administrador_id`,`DPI`),
  ADD KEY `sexo_id` (`sexo_id`);

--
-- Indices de la tabla `asignacion_habitacion`
--
ALTER TABLE `asignacion_habitacion`
  ADD PRIMARY KEY (`correlativo`,`cliente_id`,`habitacion_id`),
  ADD KEY `estatus_id` (`estatus_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `habitacion_id` (`habitacion_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`,`Dpi`),
  ADD KEY `sexo_id` (`sexo_id`),
  ADD KEY `administrador_id` (`administrador_id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`empleado_id`),
  ADD KEY `sexo_id` (`sexo_id`),
  ADD KEY `administrador_id` (`administrador_id`);

--
-- Indices de la tabla `estatus_habitacion`
--
ALTER TABLE `estatus_habitacion`
  ADD PRIMARY KEY (`estatus_id`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`habitacion_id`),
  ADD KEY `tipo_habitacion_id` (`tipo_habitacion_id`,`piso_id`),
  ADD KEY `piso_id` (`piso_id`);

--
-- Indices de la tabla `piso`
--
ALTER TABLE `piso`
  ADD PRIMARY KEY (`piso_id`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`sexo_id`);

--
-- Indices de la tabla `tipo_habitacion`
--
ALTER TABLE `tipo_habitacion`
  ADD PRIMARY KEY (`tipo_habitacion_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`sexo_id`) REFERENCES `sexo` (`sexo_id`);

--
-- Filtros para la tabla `asignacion_habitacion`
--
ALTER TABLE `asignacion_habitacion`
  ADD CONSTRAINT `asignacion_habitacion_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  ADD CONSTRAINT `asignacion_habitacion_ibfk_2` FOREIGN KEY (`habitacion_id`) REFERENCES `habitacion` (`habitacion_id`),
  ADD CONSTRAINT `asignacion_habitacion_ibfk_3` FOREIGN KEY (`estatus_id`) REFERENCES `estatus_habitacion` (`estatus_id`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`sexo_id`) REFERENCES `sexo` (`sexo_id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`sexo_id`) REFERENCES `sexo` (`sexo_id`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`administrador_id`) REFERENCES `administrador` (`administrador_id`);

--
-- Filtros para la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `habitacion_ibfk_1` FOREIGN KEY (`tipo_habitacion_id`) REFERENCES `tipo_habitacion` (`tipo_habitacion_id`),
  ADD CONSTRAINT `habitacion_ibfk_2` FOREIGN KEY (`piso_id`) REFERENCES `piso` (`piso_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
