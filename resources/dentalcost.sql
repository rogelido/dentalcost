-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Temps de generació: 18-04-2018 a les 18:25:45
-- Versió del servidor: 10.1.31-MariaDB
-- Versió de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `dentalcost`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `cif` varchar(9) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Bolcament de dades per a la taula `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `cif`) VALUES
(1, 'Pere Pasqual Pérez', '30029114c');

-- --------------------------------------------------------

--
-- Estructura de la taula `descuentos`
--

CREATE TABLE `descuentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` decimal(5,2) NOT NULL,
  `es_porcentaje` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `facturas`
--

CREATE TABLE `facturas` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `notas` text COLLATE utf8_spanish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Bolcament de dades per a la taula `facturas`
--

INSERT INTO `facturas` (`id`, `fecha`, `cliente_id`, `notas`) VALUES
(1, '2018-04-18', 1, 'Factura de prueba');

-- --------------------------------------------------------

--
-- Estructura de la taula `impuestos`
--

CREATE TABLE `impuestos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `porcentaje` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Bolcament de dades per a la taula `impuestos`
--

INSERT INTO `impuestos` (`id`, `nombre`, `descripcion`, `porcentaje`) VALUES
(1, 'IVA 10%', 'Tipo de IVA reducido del 10%', '10.00'),
(2, 'IVA 21%', 'Tipo de IVA estándar del 21%', '21.00');

-- --------------------------------------------------------

--
-- Estructura de la taula `lineas_factura`
--

CREATE TABLE `lineas_factura` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `impuesto_id` int(11) DEFAULT NULL,
  `precio_original` decimal(5,2) NOT NULL DEFAULT '0.00',
  `precio_descuento` decimal(5,2) NOT NULL DEFAULT '0.00',
  `precio_descuento_iva` decimal(5,2) NOT NULL DEFAULT '0.00',
  `importe_descuento` decimal(5,2) NOT NULL DEFAULT '0.00',
  `importe_final` decimal(5,2) NOT NULL DEFAULT '0.00',
  `descuento_id` int(11) NOT NULL,
  `factura_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `lineas_pedido`
--

CREATE TABLE `lineas_pedido` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `descuento_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Bolcament de dades per a la taula `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `descuento_id`) VALUES
(1, 'Medicaline', NULL),
(2, 'Dentaflux', NULL),
(3, 'Bader', NULL);

-- --------------------------------------------------------

--
-- Estructura de la taula `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  `marca_id` int(11) NOT NULL,
  `impuesto_id` int(11) DEFAULT NULL,
  `descuento_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Bolcament de dades per a la taula `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `marca_id`, `impuesto_id`, `descuento_id`) VALUES
(1, 'Compposite', '47.00', 1, 1, NULL),
(2, 'Cemento', '75.00', 1, 1, NULL),
(3, 'Guantes', '5.60', 1, 2, NULL),
(4, 'Servilletas', '3.20', 2, 2, NULL),
(5, 'Lámpara polimerizar', '165.00', 2, 2, NULL),
(6, 'Hidróxido de calcio', '7.50', 3, 1, NULL);

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `descuentos`
--
ALTER TABLE `descuentos`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índexs per a la taula `impuestos`
--
ALTER TABLE `impuestos`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `lineas_factura`
--
ALTER TABLE `lineas_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `descuento_id` (`descuento_id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `impuesto_id` (`impuesto_id`),
  ADD KEY `factura_id` (`factura_id`);

--
-- Índexs per a la taula `lineas_pedido`
--
ALTER TABLE `lineas_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Índexs per a la taula `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `descuento_id` (`descuento_id`),
  ADD KEY `marca_id` (`marca_id`),
  ADD KEY `impuesto_id` (`impuesto_id`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la taula `descuentos`
--
ALTER TABLE `descuentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la taula `impuestos`
--
ALTER TABLE `impuestos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la taula `lineas_factura`
--
ALTER TABLE `lineas_factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la taula `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la taula `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON UPDATE CASCADE;

--
-- Restriccions per a la taula `lineas_factura`
--
ALTER TABLE `lineas_factura`
  ADD CONSTRAINT `lineas_factura_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lineas_factura_ibfk_2` FOREIGN KEY (`descuento_id`) REFERENCES `descuentos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lineas_factura_ibfk_3` FOREIGN KEY (`impuesto_id`) REFERENCES `impuestos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lineas_factura_ibfk_4` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per a la taula `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`descuento_id`) REFERENCES `descuentos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`impuesto_id`) REFERENCES `impuestos` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
