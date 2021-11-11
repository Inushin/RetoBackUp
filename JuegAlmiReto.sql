-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 11-11-2021 a las 10:29:15
-- Versión del servidor: 8.0.27-0ubuntu0.20.04.1
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `JuegAlmiReto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ejecuta`
--

CREATE TABLE `Ejecuta` (
  `ejecuta_id` int NOT NULL,
  `ejecuta_trabajador` int NOT NULL,
  `ejecuta_mensajes` int DEFAULT '1',
  `ejecuta_servicio` int NOT NULL,
  `ejecuta_estado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `Ejecuta`
--

INSERT INTO `Ejecuta` (`ejecuta_id`, `ejecuta_trabajador`, `ejecuta_mensajes`, `ejecuta_servicio`, `ejecuta_estado`) VALUES
(2, 2, 1, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estado`
--

CREATE TABLE `Estado` (
  `estado_id` int NOT NULL,
  `estado_nombre` varchar(20) COLLATE utf32_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `Estado`
--

INSERT INTO `Estado` (`estado_id`, `estado_nombre`) VALUES
(1, 'Abierto'),
(2, 'En Proceso'),
(3, 'Cerrado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Geolocalizacion`
--

CREATE TABLE `Geolocalizacion` (
  `geo_id` int NOT NULL,
  `geo_usuario` int NOT NULL,
  `geo_fecha` date NOT NULL,
  `geo_lat` float NOT NULL,
  `geo_lon` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `Geolocalizacion`
--

INSERT INTO `Geolocalizacion` (`geo_id`, `geo_usuario`, `geo_fecha`, `geo_lat`, `geo_lon`) VALUES
(1, 4, '2021-11-02', -43, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Mensajes`
--

CREATE TABLE `Mensajes` (
  `msg_id` int NOT NULL,
  `msg_esTrabajador` smallint NOT NULL,
  `msg_mensaje` varchar(400) COLLATE utf32_spanish_ci NOT NULL,
  `msg_fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `Mensajes`
--

INSERT INTO `Mensajes` (`msg_id`, `msg_esTrabajador`, `msg_mensaje`, `msg_fecha`) VALUES
(1, 1, 'EsteMensajeNoDeberiaDeSalir', '2000-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Operacion`
--

CREATE TABLE `Operacion` (
  `operacion_id` int NOT NULL,
  `operacion_descripcion` varchar(100) COLLATE utf32_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `Operacion`
--

INSERT INTO `Operacion` (`operacion_id`, `operacion_descripcion`) VALUES
(1, 'Alquiler'),
(2, 'Compra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Operacion_Productos`
--

CREATE TABLE `Operacion_Productos` (
  `op_prod_id` int NOT NULL,
  `op_prod_operacion` int NOT NULL,
  `op_prod_productos` int NOT NULL,
  `op_prod_precio` float NOT NULL,
  `op_prod_descuento` float NOT NULL,
  `op_prod_stock` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `Operacion_Productos`
--

INSERT INTO `Operacion_Productos` (`op_prod_id`, `op_prod_operacion`, `op_prod_productos`, `op_prod_precio`, `op_prod_descuento`, `op_prod_stock`) VALUES
(1, 2, 1, 230, 5, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos`
--

CREATE TABLE `Productos` (
  `prod_id` int NOT NULL,
  `prod_tipo` int NOT NULL,
  `prod_nombre` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `prod_descripcion` varchar(1000) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `prod_foto` varchar(200) COLLATE utf32_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `Productos`
--

INSERT INTO `Productos` (`prod_id`, `prod_tipo`, `prod_nombre`, `prod_descripcion`, `prod_foto`) VALUES
(1, 1, 'Xbox360', 'Nueva Xbox 360: Aquí está, lista para el futuro con una consola totalmente nueva y más fina con un moderno acabado en negro brillante', 'https://media.game.es/COVERV2/3D_L/100/100140.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Servicio`
--

CREATE TABLE `Servicio` (
  `serv_id` int NOT NULL,
  `serv_usuario` int NOT NULL,
  `serv_tipo` int NOT NULL,
  `serv_producto` int NOT NULL,
  `serv_fecha` date NOT NULL,
  `serv_fecha_dev` date NOT NULL,
  `serv_descripcion` varchar(100) COLLATE utf32_spanish_ci NOT NULL,
  `serv_precio_compra` float NOT NULL,
  `serv_desc_compra` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `Servicio`
--

INSERT INTO `Servicio` (`serv_id`, `serv_usuario`, `serv_tipo`, `serv_producto`, `serv_fecha`, `serv_fecha_dev`, `serv_descripcion`, `serv_precio_compra`, `serv_desc_compra`) VALUES
(1, 5, 1, 1, '2021-11-10', '0000-00-00', 'Compra XBOX', 230, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tipo_producto`
--

CREATE TABLE `Tipo_producto` (
  `tipo_prod_id` int NOT NULL,
  `tipo_prod_nombre` varchar(40) COLLATE utf32_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `Tipo_producto`
--

INSERT INTO `Tipo_producto` (`tipo_prod_id`, `tipo_prod_nombre`) VALUES
(1, 'Consolas'),
(2, 'Videojuegos'),
(3, 'Telefonia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tipo_servicio`
--

CREATE TABLE `Tipo_servicio` (
  `tipo_serv_id` int NOT NULL,
  `tipo_serv_nombre` varchar(20) COLLATE utf32_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `Tipo_servicio`
--

INSERT INTO `Tipo_servicio` (`tipo_serv_id`, `tipo_serv_nombre`) VALUES
(1, 'Compra/Alquiler'),
(2, 'Reparacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Trabajador`
--

CREATE TABLE `Trabajador` (
  `trabajador_id` int NOT NULL,
  `trabajador_dni` varchar(9) COLLATE utf32_spanish_ci NOT NULL,
  `trabajador_nombre` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `trabajador_apellido1` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `trabajador_apellido2` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `trabajador_pass` varchar(20) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL DEFAULT 'Almi123'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `Trabajador`
--

INSERT INTO `Trabajador` (`trabajador_id`, `trabajador_dni`, `trabajador_nombre`, `trabajador_apellido1`, `trabajador_apellido2`, `trabajador_pass`) VALUES
(1, '000000000', 'Online', 'Online', 'Online', 'Almi123'),
(2, '12345678I', 'Ibai', 'Marin', 'Muñoz', 'Almi123'),
(3, '12345678A', 'Aitor', 'Sobera', 'Sobera', 'Almi123'),
(4, '12345678M', 'Mario', 'Mario', 'Mario', 'Almi123'),
(6, '23456789A', 'Ane', 'Gaminde', 'Gaminde', 'Almi123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `usu_id` int NOT NULL,
  `usu_dni` varchar(9) COLLATE utf32_spanish_ci NOT NULL,
  `usu_nombre` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `usu_apellido1` varchar(50) COLLATE utf32_spanish_ci DEFAULT NULL,
  `usu_apellido2` varchar(50) COLLATE utf32_spanish_ci DEFAULT NULL,
  `usu_direccion` varchar(100) COLLATE utf32_spanish_ci NOT NULL,
  `usu_pass` varchar(20) COLLATE utf32_spanish_ci NOT NULL DEFAULT 'Almi123',
  `usu_email` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `usu_foto` varchar(400) CHARACTER SET utf32 COLLATE utf32_spanish_ci DEFAULT 'https://static.vecteezy.com/system/resources/thumbnails/000/550/731/small/user_icon_004.jpg',
  `usu_ciudad` varchar(50) COLLATE utf32_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`usu_id`, `usu_dni`, `usu_nombre`, `usu_apellido1`, `usu_apellido2`, `usu_direccion`, `usu_pass`, `usu_email`, `usu_foto`, `usu_ciudad`) VALUES
(3, '12345678R', 'Roberto', 'Presi', 'Dente', 'Almi 6ºB', 'Almi123', 'roberto@email.com', 'https://static.vecteezy.com/system/resources/thumbnails/000/550/731/small/user_icon_004.jpg', 'Bilbao'),
(4, '12345678A', 'Ander', 'Goiren', 'GoirenAlmi', 'Almi 5ºC', 'Almi123', 'ander@email.com', 'https://static.vecteezy.com/system/resources/thumbnails/000/550/731/small/user_icon_004.jpg', 'Bilbao'),
(5, '12345678I', 'Iker', 'ProgramaEn', 'Bat', 'Almi 1ºA', 'Almi123', 'iker@email.com', 'https://static.vecteezy.com/system/resources/thumbnails/000/550/731/small/user_icon_004.jpg', 'Bilbao'),
(6, '12345678S', 'Sergio', 'Arregla', 'Almi', 'Almi 10ºD', 'Almi123', 'sergio@email.com', 'https://static.vecteezy.com/system/resources/thumbnails/000/550/731/small/user_icon_004.jpg', 'Bilbao'),
(7, '12345678V', 'Virginia', 'Habla', 'Ingles', 'Almi 1ºB', 'Almi123', 'virginia@email.com', 'https://static.vecteezy.com/system/resources/thumbnails/000/550/731/small/user_icon_004.jpg', 'Bilbao');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Ejecuta`
--
ALTER TABLE `Ejecuta`
  ADD PRIMARY KEY (`ejecuta_id`),
  ADD KEY `ejecuta_trabajador` (`ejecuta_trabajador`,`ejecuta_mensajes`,`ejecuta_servicio`),
  ADD KEY `ejecuta_estado` (`ejecuta_estado`),
  ADD KEY `ejecuta_servicio` (`ejecuta_servicio`),
  ADD KEY `ejecuta_mensajes` (`ejecuta_mensajes`);

--
-- Indices de la tabla `Estado`
--
ALTER TABLE `Estado`
  ADD PRIMARY KEY (`estado_id`);

--
-- Indices de la tabla `Geolocalizacion`
--
ALTER TABLE `Geolocalizacion`
  ADD PRIMARY KEY (`geo_id`),
  ADD KEY `geo_usuario` (`geo_usuario`);

--
-- Indices de la tabla `Mensajes`
--
ALTER TABLE `Mensajes`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indices de la tabla `Operacion`
--
ALTER TABLE `Operacion`
  ADD PRIMARY KEY (`operacion_id`);

--
-- Indices de la tabla `Operacion_Productos`
--
ALTER TABLE `Operacion_Productos`
  ADD PRIMARY KEY (`op_prod_id`),
  ADD KEY `op_prod_operacion` (`op_prod_operacion`,`op_prod_productos`),
  ADD KEY `op_prod_productos` (`op_prod_productos`);

--
-- Indices de la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `prod_tipo` (`prod_tipo`);

--
-- Indices de la tabla `Servicio`
--
ALTER TABLE `Servicio`
  ADD PRIMARY KEY (`serv_id`),
  ADD KEY `serv_usuario` (`serv_usuario`,`serv_tipo`),
  ADD KEY `serv_producto` (`serv_producto`),
  ADD KEY `serv_tipo` (`serv_tipo`);

--
-- Indices de la tabla `Tipo_producto`
--
ALTER TABLE `Tipo_producto`
  ADD PRIMARY KEY (`tipo_prod_id`);

--
-- Indices de la tabla `Tipo_servicio`
--
ALTER TABLE `Tipo_servicio`
  ADD PRIMARY KEY (`tipo_serv_id`);

--
-- Indices de la tabla `Trabajador`
--
ALTER TABLE `Trabajador`
  ADD PRIMARY KEY (`trabajador_id`),
  ADD UNIQUE KEY `trabajador_dni` (`trabajador_dni`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`usu_id`),
  ADD UNIQUE KEY `usu_dni` (`usu_dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Ejecuta`
--
ALTER TABLE `Ejecuta`
  MODIFY `ejecuta_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Estado`
--
ALTER TABLE `Estado`
  MODIFY `estado_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Geolocalizacion`
--
ALTER TABLE `Geolocalizacion`
  MODIFY `geo_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Mensajes`
--
ALTER TABLE `Mensajes`
  MODIFY `msg_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Operacion`
--
ALTER TABLE `Operacion`
  MODIFY `operacion_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Operacion_Productos`
--
ALTER TABLE `Operacion_Productos`
  MODIFY `op_prod_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Productos`
--
ALTER TABLE `Productos`
  MODIFY `prod_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Servicio`
--
ALTER TABLE `Servicio`
  MODIFY `serv_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Tipo_producto`
--
ALTER TABLE `Tipo_producto`
  MODIFY `tipo_prod_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Tipo_servicio`
--
ALTER TABLE `Tipo_servicio`
  MODIFY `tipo_serv_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Trabajador`
--
ALTER TABLE `Trabajador`
  MODIFY `trabajador_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `usu_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Ejecuta`
--
ALTER TABLE `Ejecuta`
  ADD CONSTRAINT `Ejecuta_ibfk_1` FOREIGN KEY (`ejecuta_servicio`) REFERENCES `Servicio` (`serv_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Ejecuta_ibfk_2` FOREIGN KEY (`ejecuta_estado`) REFERENCES `Estado` (`estado_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Ejecuta_ibfk_4` FOREIGN KEY (`ejecuta_trabajador`) REFERENCES `Trabajador` (`trabajador_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Ejecuta_ibfk_5` FOREIGN KEY (`ejecuta_mensajes`) REFERENCES `Mensajes` (`msg_id`);

--
-- Filtros para la tabla `Geolocalizacion`
--
ALTER TABLE `Geolocalizacion`
  ADD CONSTRAINT `Geolocalizacion_ibfk_1` FOREIGN KEY (`geo_usuario`) REFERENCES `Usuario` (`usu_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Operacion_Productos`
--
ALTER TABLE `Operacion_Productos`
  ADD CONSTRAINT `Operacion_Productos_ibfk_1` FOREIGN KEY (`op_prod_productos`) REFERENCES `Productos` (`prod_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Operacion_Productos_ibfk_2` FOREIGN KEY (`op_prod_operacion`) REFERENCES `Operacion` (`operacion_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD CONSTRAINT `Productos_ibfk_1` FOREIGN KEY (`prod_tipo`) REFERENCES `Tipo_producto` (`tipo_prod_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Servicio`
--
ALTER TABLE `Servicio`
  ADD CONSTRAINT `Servicio_ibfk_1` FOREIGN KEY (`serv_usuario`) REFERENCES `Usuario` (`usu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Servicio_ibfk_2` FOREIGN KEY (`serv_tipo`) REFERENCES `Tipo_servicio` (`tipo_serv_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Servicio_ibfk_3` FOREIGN KEY (`serv_producto`) REFERENCES `Productos` (`prod_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
