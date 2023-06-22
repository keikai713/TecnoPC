-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-05-2015 a las 01:23:00
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tecnopc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `clienteno` bigint(20) NOT NULL,
  `cnombre` varchar(30) NOT NULL,
  `capellidos` varchar(40) NOT NULL,
  PRIMARY KEY (`clienteno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE IF NOT EXISTS `empleados` (
  `empleadono` tinyint(100) NOT NULL,
  `enombre` varchar(30) NOT NULL,
  `eapellidos` varchar(40) NOT NULL,
  `calle` varchar(20) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `codigopostal` varchar(5) NOT NULL,
  PRIMARY KEY (`empleadono`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotecomputadoras`
--

CREATE TABLE IF NOT EXISTS `lotecomputadoras` (
  `idlotecomputadoras` varchar(36) NOT NULL,
  `cantidad` float NOT NULL,
  `marca` varchar(15) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `precio` float NOT NULL,
  `sistemaoperativo` varchar(50) NOT NULL,
  `procesador` varchar(80) NOT NULL,
  `tarjetadevideo` varchar(80) NOT NULL,
  `memoriaram` varchar(80) NOT NULL,
  `discoduro` varchar(80) NOT NULL,
  PRIMARY KEY (`idlotecomputadoras`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `numeroserie`
--

CREATE TABLE IF NOT EXISTS `numeroserie` (
  `serieno` varchar(30) NOT NULL,
  `existencia` char(2) NOT NULL,
  PRIMARY KEY (`serieno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sevende`
--

CREATE TABLE IF NOT EXISTS `sevende` (
  `ventano` bigint(20) NOT NULL AUTO_INCREMENT,
  `sidlotecomputadoras` varchar(36) DEFAULT NULL,
  `sserieno` varchar(30) DEFAULT NULL,
  `cantidad` float NOT NULL,
  `precio` float NOT NULL,
  `importe` float NOT NULL,
  KEY `ventano` (`ventano`),
  KEY `sidlotecomputadoras` (`sidlotecomputadoras`),
  KEY `sserieno` (`sserieno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sevende_a`
--

CREATE TABLE IF NOT EXISTS `sevende_a` (
  `ventano` bigint(20) NOT NULL AUTO_INCREMENT,
  `sempleadono` tinyint(100) DEFAULT NULL,
  `sclienteno` bigint(20) DEFAULT NULL,
  `fechaventa` date NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`ventano`),
  KEY `sempleadono` (`sempleadono`),
  KEY `sclienteno` (`sclienteno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `sevende`
--
ALTER TABLE `sevende`
  ADD CONSTRAINT `sevende_ibfk_1` FOREIGN KEY (`sidlotecomputadoras`) REFERENCES `lotecomputadoras` (`idlotecomputadoras`),
  ADD CONSTRAINT `sevende_ibfk_2` FOREIGN KEY (`sserieno`) REFERENCES `numeroserie` (`serieno`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `sevende_a`
--
ALTER TABLE `sevende_a`
  ADD CONSTRAINT `sevende_a_ibfk_1` FOREIGN KEY (`sempleadono`) REFERENCES `empleados` (`empleadono`),
  ADD CONSTRAINT `sevende_a_ibfk_2` FOREIGN KEY (`sclienteno`) REFERENCES `clientes` (`clienteno`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
