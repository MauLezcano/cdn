-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2023 a las 22:35:10
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tecnocom_system`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE `agenda` (
  `id_agenda` int(11) NOT NULL COMMENT 'ID',
  `nombre_agenda` varchar(120) NOT NULL COMMENT 'Nombre',
  `teléfono_agenda` varchar(15) NOT NULL COMMENT 'Teléfono',
  `correo-electrónico_agenda` varchar(120) NOT NULL COMMENT 'Correo Electrónico',
  `fecha-de-agregado_agenda` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de Agregado',
  `estado_agenda` tinyint(1) NOT NULL COMMENT 'Estado',
  `id_clt` int(11) NOT NULL COMMENT 'ID Cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_clt` int(11) NOT NULL COMMENT 'ID',
  `nombre_clt` varchar(120) NOT NULL COMMENT 'Nombre',
  `teléfono_clt` varchar(15) DEFAULT NULL COMMENT 'Teléfono',
  `dirección_clt` varchar(255) DEFAULT NULL COMMENT 'Dirección',
  `rfc_clt` varchar(13) DEFAULT NULL COMMENT 'RFC',
  `logo_clt` varchar(255) DEFAULT NULL COMMENT 'Logo',
  `fecha_de_agregado_clt` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de Agregado',
  `contrato_rpt` varchar(15) NOT NULL COMMENT 'Contrato',
  `estado_clt` tinyint(1) NOT NULL COMMENT 'Estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_clt`, `nombre_clt`, `teléfono_clt`, `dirección_clt`, `rfc_clt`, `logo_clt`, `fecha_de_agregado_clt`, `contrato_rpt`, `estado_clt`) VALUES
(1, 'Tecnocom', '8122656340', 'Av Alfonso Reyes 400, Regina, 64290 Monterrey, N.L.', 'RFC', 'https://tecnocom.com.mx/wp-content/uploads/2019/07/logo-flotante.png', '2023-05-22 20:28:04', 'En Contrato', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_cmt` int(11) NOT NULL COMMENT 'ID',
  `comentario_cmt` varchar(255) NOT NULL COMMENT 'Comentario',
  `fecha_de_agregado_cmt` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de Agregado',
  `id_usr` int(11) NOT NULL COMMENT 'ID Usuario',
  `id_rpt` int(11) NOT NULL COMMENT 'ID Reporte'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivos`
--

CREATE TABLE `dispositivos` (
  `id_dev` int(11) NOT NULL COMMENT 'ID',
  `nombre_dev` varchar(120) NOT NULL COMMENT 'Nombre',
  `descripción_dev` varchar(255) NOT NULL COMMENT 'Descripción',
  `acrónimo_dev` varchar(4) NOT NULL COMMENT 'Acrónimo',
  `estado_dev` tinyint(1) NOT NULL COMMENT 'Estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imágenes`
--

CREATE TABLE `imágenes` (
  `id_img` int(11) NOT NULL COMMENT 'ID',
  `nombre_img` longtext NOT NULL COMMENT 'Nombre',
  `id_rpt` int(11) NOT NULL COMMENT 'ID Reporte'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inv` int(11) NOT NULL COMMENT 'ID',
  `número_de_inventario_inv` varchar(10) NOT NULL COMMENT 'Número de Inventario',
  `marca_inv` varchar(120) NOT NULL COMMENT 'Marca',
  `modelo_inv` varchar(120) DEFAULT NULL COMMENT 'Modelo',
  `número_de_serie_inv` varchar(17) DEFAULT NULL COMMENT 'Número de Serie',
  `procesador_inv` varchar(120) DEFAULT NULL COMMENT 'Procesador',
  `memoria_inv` varchar(10) DEFAULT NULL COMMENT 'Memoria',
  `almacenamiento_inv` varchar(10) DEFAULT NULL COMMENT 'Almacenamiento',
  `mac_address_lan_inv` varchar(12) DEFAULT NULL COMMENT 'MAC Address LAN',
  `mac_address_wifi_inv` varchar(12) DEFAULT NULL COMMENT 'MAC Address Wi-Fi',
  `antecesor_inv` varchar(10) DEFAULT NULL COMMENT 'Antecesor',
  `predecesor_inv` varchar(10) DEFAULT NULL COMMENT 'Predecesor',
  `fecha_de_agregado_inv` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de Registro',
  `fecha_de_vencimiento_inv` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp() COMMENT 'Fecha de Vencimiento',
  `contrato_inv` varchar(15) NOT NULL COMMENT 'Contrato',
  `estado_inv` tinyint(1) NOT NULL COMMENT 'Estado',
  `id_dev` int(11) NOT NULL COMMENT 'ID del Dispositivo',
  `id_clt` int(11) DEFAULT NULL COMMENT 'ID Cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

CREATE TABLE `materiales` (
  `id_mts` int(11) NOT NULL COMMENT 'ID',
  `nombre_mts` varchar(255) NOT NULL COMMENT 'Nombre',
  `id_rpt` int(11) NOT NULL COMMENT 'ID Reporte'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `id_rpt` int(11) NOT NULL COMMENT 'ID',
  `título_rpt` varchar(120) NOT NULL COMMENT 'Nombre',
  `descripción_rpt` varchar(255) NOT NULL COMMENT 'Descripción',
  `creado_por_rpt` varchar(120) NOT NULL COMMENT 'Creado Por',
  `fecha_de_agregado_rpt` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de Agregado',
  `fecha_de_asignación_rpt` timestamp NULL DEFAULT NULL COMMENT 'Fecha de Asignación',
  `fecha_de_iniciación_rpt` timestamp NULL DEFAULT NULL COMMENT 'Fecha de Iniciación',
  `fecha_de_finalización_rpt` timestamp NULL DEFAULT NULL COMMENT 'Fecha de Finalización',
  `fecha_de_valoración_rpt` timestamp NULL DEFAULT NULL COMMENT 'Fecha de Valoración',
  `status_rpt` tinyint(1) NOT NULL,
  `estado_rpt` varchar(15) NOT NULL COMMENT 'Estado',
  `id_inv` int(11) NOT NULL COMMENT 'Dispositivo Asignado',
  `id_clt` int(11) NOT NULL COMMENT 'Cliente',
  `id_usr` int(11) DEFAULT NULL COMMENT 'Técnico Asignado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usr` int(11) NOT NULL COMMENT 'ID',
  `nombre_usr` varchar(120) NOT NULL COMMENT 'Nombre',
  `teléfono_usr` varchar(15) DEFAULT NULL COMMENT 'Teléfono',
  `correo_electrónico_usr` varchar(120) NOT NULL COMMENT 'Correo Electrónico',
  `contraseña_usr` varchar(255) DEFAULT NULL COMMENT 'Contraseña',
  `rfc_usr` varchar(13) DEFAULT NULL COMMENT 'RFC',
  `rol_usr` varchar(20) NOT NULL COMMENT 'Rol',
  `fecha_de_agregado_usr` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de Agregado',
  `estado_usr` tinyint(1) NOT NULL COMMENT 'Estado',
  `id_clt` int(11) NOT NULL COMMENT 'ID Cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usr`, `nombre_usr`, `teléfono_usr`, `correo_electrónico_usr`, `contraseña_usr`, `rfc_usr`, `rol_usr`, `fecha_de_agregado_usr`, `estado_usr`, `id_clt`) VALUES
(1, 'Antonio Lozano de los Reyes', '8169696969', 'tony@tecnocom.com', 'Tony123', NULL, 'Administrador', '2023-05-22 20:29:15', 1, 1),
(2, 'Mauricio Lezcano Hinojosa', '8115600331', 'mau@tecnocom.com', 'Mauricio123', NULL, 'Administrador', '2023-05-22 20:30:17', 1, 1),
(3, 'Monserrat Proa', '8145893257', 'monse@tecnocom.com', 'Monse123', NULL, 'Administrador', '2023-05-22 20:33:26', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id_agenda`),
  ADD KEY `Cliente | agenda` (`id_clt`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_clt`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_cmt`),
  ADD KEY `Reportes | cmt` (`id_rpt`),
  ADD KEY `Usuarios | cmt` (`id_usr`);

--
-- Indices de la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  ADD PRIMARY KEY (`id_dev`);

--
-- Indices de la tabla `imágenes`
--
ALTER TABLE `imágenes`
  ADD PRIMARY KEY (`id_img`),
  ADD KEY `Reportes | img` (`id_rpt`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inv`),
  ADD KEY `Dispositivo | invt` (`id_dev`),
  ADD KEY `Cliente | invt` (`id_clt`);

--
-- Indices de la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD PRIMARY KEY (`id_mts`),
  ADD KEY `Reportes | mts` (`id_rpt`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id_rpt`),
  ADD KEY `Usuario | rpt` (`id_usr`),
  ADD KEY `Cliente | rpt` (`id_clt`),
  ADD KEY `Inventario | rpt` (`id_inv`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usr`),
  ADD KEY `Cliente | usr` (`id_clt`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id_agenda` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_clt` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_cmt` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT de la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  MODIFY `id_dev` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT de la tabla `imágenes`
--
ALTER TABLE `imágenes`
  MODIFY `id_img` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inv` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT de la tabla `materiales`
--
ALTER TABLE `materiales`
  MODIFY `id_mts` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id_rpt` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usr` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `Cliente | agenda` FOREIGN KEY (`id_clt`) REFERENCES `clientes` (`id_clt`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `Reportes | cmt` FOREIGN KEY (`id_rpt`) REFERENCES `reportes` (`id_rpt`),
  ADD CONSTRAINT `Usuarios | cmt` FOREIGN KEY (`id_usr`) REFERENCES `usuarios` (`id_usr`);

--
-- Filtros para la tabla `imágenes`
--
ALTER TABLE `imágenes`
  ADD CONSTRAINT `Reportes | img` FOREIGN KEY (`id_rpt`) REFERENCES `reportes` (`id_rpt`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `Cliente | invt` FOREIGN KEY (`id_clt`) REFERENCES `clientes` (`id_clt`),
  ADD CONSTRAINT `Dispositivo | invt` FOREIGN KEY (`id_dev`) REFERENCES `dispositivos` (`id_dev`);

--
-- Filtros para la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD CONSTRAINT `Reportes | mts` FOREIGN KEY (`id_rpt`) REFERENCES `reportes` (`id_rpt`);

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `Cliente | rpt` FOREIGN KEY (`id_clt`) REFERENCES `clientes` (`id_clt`),
  ADD CONSTRAINT `Inventario | rpt` FOREIGN KEY (`id_inv`) REFERENCES `inventario` (`id_inv`),
  ADD CONSTRAINT `Usuario | rpt` FOREIGN KEY (`id_usr`) REFERENCES `usuarios` (`id_usr`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `Cliente | usr` FOREIGN KEY (`id_clt`) REFERENCES `clientes` (`id_clt`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
