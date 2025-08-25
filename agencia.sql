-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-08-2025 a las 21:56:11
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
-- Base de datos: `agencia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritos`
--

CREATE TABLE `carritos` (
  `id_carrito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `f_creacion` datetime DEFAULT current_timestamp(),
  `estado` enum('activo','finalizado','vencido') DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_carrito`
--

CREATE TABLE `detalle_carrito` (
  `id_item_carrito` int(11) NOT NULL,
  `id_carrito` int(11) DEFAULT NULL,
  `id_paquete` int(11) DEFAULT NULL,
  `cantidad_personas` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `id_mensaje` int(11) NOT NULL,
  `id_emisor` int(11) DEFAULT NULL,
  `id_receptor` int(11) DEFAULT NULL,
  `mensaje` text DEFAULT NULL,
  `f_envio` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetes`
--

CREATE TABLE `paquetes` (
  `id_paquete` int(11) NOT NULL,
  `creado_por` int(11) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `descripcion_galeria` text DEFAULT NULL,
  `descripcion` mediumtext DEFAULT NULL,
  `url_imagen` varchar(255) DEFAULT NULL,
  `tipo` enum('nacional','internacional') DEFAULT NULL,
  `publico_objetivo` enum('individual','familia','grupo') DEFAULT NULL,
  `f_inicio` date DEFAULT NULL,
  `f_fin` date DEFAULT NULL,
  `f_limite` datetime DEFAULT NULL,
  `precio_base` decimal(10,2) DEFAULT NULL,
  `estado` enum('disponible','no_disponible','proximo') DEFAULT 'disponible',
  `cupo_total` int(11) DEFAULT NULL,
  `cupo_disponible` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paquetes`
--

INSERT INTO `paquetes` (`id_paquete`, `creado_por`, `nombre`, `descripcion_galeria`, `descripcion`, `url_imagen`, `tipo`, `publico_objetivo`, `f_inicio`, `f_fin`, `f_limite`, `precio_base`, `estado`, `cupo_total`, `cupo_disponible`) VALUES
(1, 2, 'Bariloche Aventura', 'Escapada a la Patagonia con excursiones y nieve.', 'Disfruta de la magia de Bariloche con un paquete completo que incluye alojamiento, excursiones al Cerro Catedral y actividades de aventura en la naturaleza. Ideal para los amantes de la montaña y el aire libre.', 'bariloche.jpg', 'nacional', 'familia', '2025-08-31', '2025-09-05', '2025-08-16 00:00:00', 850.00, 'disponible', 50, 45),
(2, 2, 'Salta Mágica', 'Descubre la belleza del norte argentino y sus paisajes coloridos.', 'Un viaje inolvidable por Salta, explorando la Quebrada de Humahuaca, Cafayate y sus viñedos. Incluye alojamiento en hoteles boutique y visitas guiadas a los puntos más emblemáticos.', 'salta.jpg', 'nacional', 'grupo', '2025-09-15', '2025-09-20', '2025-08-26 00:00:00', 720.00, 'disponible', 40, 38),
(3, 2, 'Mendoza Vinos y Montañas', 'Ruta del vino y paisajes cordilleranos en Mendoza.', 'Sumérgete en la cultura del vino mendocina con visitas a bodegas de renombre y degustaciones exclusivas. Además, aventura en la Cordillera de los Andes con un día en Aconcagua. Perfecto para parejas y amantes del buen vino.', 'mendoza.jpg', 'nacional', 'individual', '2025-09-30', '2025-10-03', '2025-08-31 00:00:00', 600.00, 'disponible', 30, 25),
(4, 2, 'Cataratas del Iguazú Express', 'Maravilla natural de Argentina en un viaje corto e intenso.', 'Experimenta la majestuosidad de las Cataratas del Iguazú. Este paquete express te permite conocer ambos lados (argentino y brasilero) y disfrutar de la selva misionera.', 'iguazu.jpg', 'nacional', 'familia', '2025-08-21', '2025-08-23', '2025-08-11 00:00:00', 450.00, 'disponible', 60, 55),
(5, 2, 'Córdoba Sierras Encantadas', 'Naturaleza, historia y gastronomía en el corazón de Argentina.', 'Explora las sierras de Córdoba, con visitas a Villa Carlos Paz, La Cumbrecita y Alta Gracia. Disfruta de la tranquilidad, los ríos y la excelente comida regional.', 'cordoba.jpg', 'nacional', 'familia', '2025-10-30', '2025-11-03', '2025-09-15 00:00:00', 580.00, 'disponible', 40, 30),
(6, 2, 'Ushuaia Fin del Mundo', 'Aventura polar en la ciudad más austral del mundo.', 'Un viaje al extremo sur, visitando el Parque Nacional Tierra del Fuego, el Canal Beagle y glaciares. Una experiencia única en un paisaje inigualable.', 'ushuaia.jpg', 'nacional', 'individual', '2025-11-29', '2025-12-04', '2025-09-30 00:00:00', 980.00, 'proximo', 25, 25),
(7, 2, 'Patagonia Austral Invernal', 'Experiencia invernal en el sur argentino.', 'Descubre los glaciares y la vida silvestre de la Patagonia en invierno. Incluye avistaje de fauna y trekkings sobre hielo.', 'patagonia_invierno.jpg', 'nacional', 'grupo', '2025-06-02', '2025-06-07', '2025-05-23 00:00:00', 1100.00, 'no_disponible', 30, 0),
(8, 2, 'Jujuy Colores del Norte', 'Un festival de colores y cultura en la Puna.', 'Recorre los paisajes únicos de Jujuy, conociendo Purmamarca, Tilcara y las Salinas Grandes. Inmersión cultural y belleza natural.', 'jujuy.jpg', 'nacional', 'familia', '2025-06-22', '2025-06-27', '2025-06-12 00:00:00', 650.00, 'no_disponible', 35, 0),
(9, 2, 'Isla Margarita', 'Relajo en las playas del Caribe venezolano.', 'Disfruta de una semana de sol, playa y diversión en Isla Margarita. Todo incluido en resorts de lujo y actividades acuáticas.', 'margarita.jpg', 'internacional', 'familia', '2025-09-20', '2025-09-27', '2025-08-26 00:00:00', 1500.00, 'disponible', 80, 75),
(10, 2, 'Cancún Deluxe', 'El paraíso mexicano con playas de arena blanca y vida nocturna.', 'Un paquete exclusivo a Cancún, incluyendo estadía en resorts 5 estrellas, tours a Chichen Itzá y Cozumel. Ideal para la diversión y el relax.', 'cancun.jpg', 'internacional', 'individual', '2025-10-10', '2025-10-17', '2025-09-05 00:00:00', 2200.00, 'disponible', 60, 50),
(11, 2, 'Machu Picchu Aventura', 'Explora la mítica ciudad inca y los Andes peruanos.', 'Viaje de aventura a Perú, combinando la mística de Cusco y el imponente Machu Picchu. Incluye trenes panorámicos y guías especializados.', 'machupicchu.jpg', 'internacional', 'grupo', '2025-10-20', '2025-10-27', '2025-09-10 00:00:00', 1800.00, 'disponible', 30, 28),
(12, 2, 'Rio de Janeiro Carnaval', 'Vive la pasión y la alegría del Carnaval en Río.', 'Sumérgete en la cultura carioca con un paquete que te lleva a los desfiles del Sambódromo y las playas de Copacabana e Ipanema.', 'rio.jpg', 'internacional', 'individual', '2026-01-28', '2026-02-02', '2025-10-30 00:00:00', 1950.00, 'proximo', 70, 70),
(13, 2, 'Punta Cana Sol y Playa', 'El Caribe dominicano con todo incluido.', 'Relájate en las hermosas playas de Punta Cana con un sistema todo incluido. Actividades acuáticas y diversión garantizada.', 'puntacana.jpg', 'internacional', 'familia', '2025-11-04', '2025-11-11', '2025-09-18 00:00:00', 1700.00, 'disponible', 90, 85),
(14, 2, 'París Romántico', 'La ciudad del amor y la cultura europea.', 'Un viaje de ensueño a París, visitando la Torre Eiffel, el Louvre y paseos por el Sena. Ideal para parejas.', 'paris.jpg', 'internacional', 'individual', '2025-11-19', '2025-11-25', '2025-09-25 00:00:00', 2800.00, 'disponible', 20, 18),
(15, 2, 'Roma Histórica', 'Un viaje a la cuna de la civilización y el arte.', 'Explora la antigua Roma, el Coliseo, el Foro Romano y el Vaticano. Un recorrido por la historia y la arquitectura.', 'roma.jpg', 'internacional', 'grupo', '2025-12-09', '2025-12-16', '2025-10-05 00:00:00', 2500.00, 'disponible', 35, 30),
(16, 2, 'Nueva York Vibrante', 'La ciudad que nunca duerme con sus icónicos rascacielos.', 'Experimenta la energía de Nueva York, desde Times Square hasta Central Park y los museos más importantes. Compras y espectáculos incluidos.', 'nuevayork.jpg', 'internacional', 'individual', '2025-12-29', '2026-01-04', '2025-10-15 00:00:00', 3000.00, 'disponible', 40, 35),
(17, 2, 'Londres Imperial', 'Recorrido por la capital británica y sus emblemas.', 'Descubre Londres, sus palacios, museos y el Big Ben. Incluye paseos por el Támesis y visitas a mercados tradicionales.', 'londres.jpg', 'internacional', 'familia', '2026-01-08', '2026-01-14', '2025-10-20 00:00:00', 2700.00, 'disponible', 45, 40),
(18, 2, 'Tokio Futurista', 'Sumérgete en la cultura japonesa y su tecnología.', 'Un viaje único a Tokio, explorando sus barrios vibrantes, templos antiguos y la vanguardia tecnológica. Experiencia gastronómica incluida.', 'tokio.jpg', 'internacional', 'grupo', '2026-02-17', '2026-02-25', '2025-11-09 00:00:00', 3500.00, 'proximo', 20, 20),
(19, 2, 'Sudáfrica Safari', 'Aventura de vida silvestre en las reservas africanas.', 'Un safari inolvidable en Sudáfrica, avistando la \"Big Five\". Incluye alojamiento en lodges de lujo y guías expertos.', 'sudafrica.jpg', 'internacional', 'individual', '2026-03-09', '2026-03-18', '2025-11-19 00:00:00', 4500.00, 'disponible', 15, 12),
(20, 2, 'Estambul Mística', 'Un puente entre Oriente y Occidente, historia y cultura.', 'Explora la fascinante Estambul, con sus mezquitas, bazares y el Bósforo. Un viaje que conecta dos continentes.', 'estambul.jpg', 'internacional', 'grupo', '2026-03-29', '2026-04-05', '2025-11-29 00:00:00', 2300.00, 'disponible', 25, 23),
(21, 2, 'Sydney Outback', 'Ciudades vibrantes y naturaleza australiana salvaje.', 'Descubre Sydney y sus íconos, seguido de una aventura en el Outback. Canguros, koalas y paisajes desérticos.', 'sydney.jpg', 'internacional', 'familia', '2026-04-18', '2026-04-28', '2025-12-09 00:00:00', 4000.00, 'disponible', 18, 15),
(22, 2, 'Dubái Lujo Extremo', 'La ciudad del futuro, entre el desierto y el rascacielos.', 'Experimenta el lujo y la modernidad de Dubái, con sus imponentes edificios, centros comerciales y safaris por el desierto.', 'dubai.jpg', 'internacional', 'individual', '2026-05-08', '2026-05-13', '2025-12-19 00:00:00', 3200.00, 'proximo', 22, 22),
(23, 2, 'Bangkok Templos y Mercados', 'La exótica capital de Tailandia y su vibrante cultura.', 'Explora los templos dorados, los mercados flotantes y la animada vida nocturna de Bangkok. Una inmersión cultural única.', 'bangkok.jpg', 'internacional', 'grupo', '2026-05-28', '2026-06-04', '2025-12-29 00:00:00', 2100.00, 'disponible', 28, 25),
(24, 2, 'Caribe Total Relax', 'Semanas de sol y playa en el Caribe con todo incluido.', 'Un paquete de puro relax en las playas más paradisíacas del Caribe, con opciones de spa y gastronomía de primer nivel.', 'caribe.jpg', 'internacional', 'familia', '2025-05-03', '2025-05-10', '2025-04-23 00:00:00', 1600.00, 'no_disponible', 70, 0),
(25, 2, 'Europa Clásica', 'Un recorrido por las ciudades más emblemáticas de Europa.', 'Visita París, Roma y Londres en un solo viaje. Cultura, historia y paisajes urbanos inolvidables.', 'europa.jpg', 'internacional', 'grupo', '2025-04-03', '2025-04-13', '2025-03-24 00:00:00', 3800.00, 'no_disponible', 40, 0),
(26, 2, 'Marruecos Colores y Especias', 'Un viaje exótico por los zocos y desiertos marroquíes.', 'Descubre Marrakech, Fez y el desierto del Sahara. Cultura milenaria, paisajes impresionantes y una gastronomía única.', 'marruecos.jpg', 'internacional', 'individual', '2025-05-23', '2025-05-30', '2025-05-13 00:00:00', 2000.00, 'no_disponible', 20, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete_servicio`
--

CREATE TABLE `paquete_servicio` (
  `id_paquete` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `f_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paquete_servicio`
--

INSERT INTO `paquete_servicio` (`id_paquete`, `id_servicio`, `f_creacion`) VALUES
(1, 1, '2025-08-01 15:11:54'),
(1, 4, '2025-08-01 15:11:54'),
(1, 5, '2025-08-01 15:11:54'),
(2, 1, '2025-08-01 15:11:54'),
(2, 3, '2025-08-01 15:11:54'),
(2, 8, '2025-08-01 15:11:54'),
(3, 1, '2025-08-01 15:11:54'),
(3, 3, '2025-08-01 15:11:54'),
(4, 1, '2025-08-01 15:11:54'),
(4, 2, '2025-08-01 15:11:54'),
(4, 5, '2025-08-01 15:11:54'),
(5, 1, '2025-08-01 15:11:54'),
(5, 3, '2025-08-01 15:11:54'),
(6, 1, '2025-08-01 15:11:54'),
(6, 2, '2025-08-01 15:11:54'),
(6, 4, '2025-08-01 15:11:54'),
(9, 5, '2025-08-01 15:11:54'),
(9, 6, '2025-08-01 15:11:54'),
(9, 7, '2025-08-01 15:11:54'),
(10, 4, '2025-08-01 15:11:54'),
(10, 6, '2025-08-01 15:11:54'),
(10, 7, '2025-08-01 15:11:54'),
(11, 1, '2025-08-01 15:11:54'),
(11, 7, '2025-08-01 15:11:54'),
(11, 8, '2025-08-01 15:11:54'),
(12, 1, '2025-08-01 15:11:54'),
(12, 7, '2025-08-01 15:11:54'),
(12, 8, '2025-08-01 15:11:54'),
(13, 5, '2025-08-01 15:11:55'),
(13, 6, '2025-08-01 15:11:55'),
(13, 7, '2025-08-01 15:11:55'),
(14, 1, '2025-08-01 15:11:55'),
(14, 7, '2025-08-01 15:11:55'),
(14, 8, '2025-08-01 15:11:55'),
(15, 1, '2025-08-01 15:11:55'),
(15, 7, '2025-08-01 15:11:55'),
(15, 8, '2025-08-01 15:11:55'),
(16, 1, '2025-08-01 15:11:55'),
(16, 7, '2025-08-01 15:11:55'),
(16, 10, '2025-08-01 15:11:55'),
(17, 1, '2025-08-01 15:11:55'),
(17, 7, '2025-08-01 15:11:55'),
(17, 8, '2025-08-01 15:11:55'),
(18, 1, '2025-08-01 15:11:55'),
(18, 7, '2025-08-01 15:11:55'),
(18, 11, '2025-08-01 15:11:55'),
(19, 1, '2025-08-01 15:11:55'),
(19, 4, '2025-08-01 15:11:55'),
(19, 7, '2025-08-01 15:11:55'),
(20, 1, '2025-08-01 15:11:55'),
(20, 7, '2025-08-01 15:11:55'),
(20, 8, '2025-08-01 15:11:55'),
(21, 1, '2025-08-01 15:11:55'),
(21, 7, '2025-08-01 15:11:55'),
(21, 11, '2025-08-01 15:11:55'),
(22, 1, '2025-08-01 15:11:55'),
(22, 7, '2025-08-01 15:11:55'),
(22, 10, '2025-08-01 15:11:55'),
(23, 1, '2025-08-01 15:11:55'),
(23, 7, '2025-08-01 15:11:55'),
(23, 8, '2025-08-01 15:11:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre`, `email`, `telefono`) VALUES
(1, 'AeroSky Airlines', 'contact@aerosky.com', '351 473-5599'),
(2, 'Hotel Paraíso', 'reservas@hotelparaiso.com', '351 473-5599'),
(3, 'Global Tour Excursions', 'info@globaltourex.com', '351 473-5599'),
(4, 'Rent A Car Express', 'reservas@rentacarexpress.com', '351 473-5599'),
(5, 'Traslados Seguros', 'contacto@trasladosseguros.com', '351 473-5599'),
(6, 'Hotel Buenos Aires', 'contacto@hotelbsas.com.ar', '351 473-5599'),
(7, 'VueloSur Aerolineas', 'info@vuelosur.com', '351 473-5599');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_servicio`
--

CREATE TABLE `proveedor_servicio` (
  `id_proveedor` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `f_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor_servicio`
--

INSERT INTO `proveedor_servicio` (`id_proveedor`, `id_servicio`, `f_creacion`) VALUES
(1, 2, '2025-08-01 15:11:55'),
(2, 6, '2025-08-01 15:11:55'),
(3, 4, '2025-08-01 15:11:55'),
(3, 8, '2025-08-01 15:11:55'),
(3, 9, '2025-08-01 15:11:55'),
(4, 3, '2025-08-01 15:11:55'),
(4, 10, '2025-08-01 15:11:55'),
(5, 5, '2025-08-01 15:11:55'),
(5, 11, '2025-08-01 15:11:55'),
(6, 1, '2025-08-01 15:11:55'),
(7, 7, '2025-08-01 15:11:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `tipo` enum('estadía','pasaje','alquiler_auto','excursion','traslado') DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `nombre`, `tipo`, `descripcion`, `precio`) VALUES
(1, 'Estadía en Hotel de Montaña', 'estadía', 'Alojamiento 5 noches en hotel con vista a las montañas, desayuno incluido.', 350.00),
(2, 'Pasaje Aéreo Nacional', 'pasaje', 'Vuelo de ida y vuelta dentro del país, clase económica.', 200.00),
(3, 'Alquiler de Auto Compacto', 'alquiler_auto', 'Alquiler de vehículo compacto por 5 días con seguro básico.', 180.00),
(4, 'Excursión Safari Fotográfico', 'excursion', 'Tour de 4 horas para avistamiento de fauna silvestre con guía.', 75.00),
(5, 'Traslado Aeropuerto-Hotel', 'traslado', 'Servicio de traslado privado desde el aeropuerto al hotel y viceversa.', 50.00),
(6, 'Estadía en Resort All Inclusive', 'estadía', 'Alojamiento 7 noches en resort de lujo con régimen todo incluido.', 800.00),
(7, 'Pasaje Aéreo Internacional', 'pasaje', 'Vuelo de ida y vuelta a destino internacional, clase económica.', 700.00),
(8, 'Excursión City Tour Histórico', 'excursion', 'Recorrido guiado por los principales puntos históricos de la ciudad.', 40.00),
(9, 'Cena Show de Tango', 'excursion', 'Cena con espectáculo de tango y traslado.', 90.00),
(10, 'Alquiler de Auto Premium', 'alquiler_auto', 'Alquiler de vehículo de lujo por 7 días con seguro premium.', 400.00),
(11, 'Traslado VIP', 'traslado', 'Traslado en vehículo de alta gama, con chofer bilingüe.', 120.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `contrasenia` varchar(255) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `rol` enum('cliente','empleado','admin') DEFAULT 'cliente',
  `tipo_empleado` enum('administrativo','ventas') DEFAULT NULL,
  `f_alta` datetime DEFAULT current_timestamp(),
  `inicia_sesion` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `email`, `contrasenia`, `telefono`, `rol`, `tipo_empleado`, `f_alta`, `inicia_sesion`) VALUES
(1, 'Admin', 'Global', 'admin@viajes.com', '$2y$10$wE.6o2O7v.BwVfT8.1N.xO7eA2vY9L8kQ0X1D4F5E6G7H8I9J0K1L2M3N4O5P6Q7R8S9T0U1V2W3X4Y5Z6', '1123456789', 'admin', NULL, '2025-08-01 15:11:54', 1),
(2, 'Carlos', 'Gomez', 'carlos.gomez@viajes.com', '$2y$10$wE.6o2O7v.BwVfT8.1N.xO7eA2vY9L8kQ0X1D4F5E6G7H8I9J0K1L2M3N4O5P6Q7R8S9T0U1V2W3X4Y5Z6', '1198765432', 'empleado', 'ventas', '2025-08-01 15:11:54', 1),
(3, 'Ana', 'Martinez', 'ana.martinez@viajes.com', '$2y$10$wE.6o2O7v.BwVfT8.1N.xO7eA2vY9L8kQ0X1D4F5E6G7H8I9J0K1L2M3N4O5P6Q7R8S9T0U1V2W3X4Y5Z6', '1155554444', 'empleado', 'administrativo', '2025-08-01 15:11:54', 1),
(4, 'Laura', 'Perez', 'laura.perez@cliente.com', '$2y$10$wE.6o2O7v.BwVfT8.1N.xO7eA2vY9L8kQ0X1D4F5E6G7H8I9J0K1L2M3N4O5P6Q7R8S9T0U1V2W3X4Y5Z6', '1133332222', 'cliente', NULL, '2025-08-01 15:11:54', 1),
(5, 'Juan', 'Rodriguez', 'juan.rodriguez@cliente.com', '$2y$10$wE.6o2O7v.BwVfT8.1N.xO7eA2vY9L8kQ0X1D4F5E6G7H8I9J0K1L2M3N4O5P6Q7R8S9T0U1V2W3X4Y5Z6', '1177778888', 'cliente', NULL, '2025-08-01 15:11:54', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_carrito` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `f_venta` datetime DEFAULT current_timestamp(),
  `total` decimal(12,2) DEFAULT NULL,
  `medio_pago` enum('debito','tarjeta','transferencia','efectivo') DEFAULT NULL,
  `estado_pago` enum('pendiente','pagado','rechazado') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carritos`
--
ALTER TABLE `carritos`
  ADD PRIMARY KEY (`id_carrito`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  ADD PRIMARY KEY (`id_item_carrito`),
  ADD KEY `id_carrito` (`id_carrito`),
  ADD KEY `id_paquete` (`id_paquete`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id_mensaje`),
  ADD KEY `id_emisor` (`id_emisor`),
  ADD KEY `id_receptor` (`id_receptor`);

--
-- Indices de la tabla `paquetes`
--
ALTER TABLE `paquetes`
  ADD PRIMARY KEY (`id_paquete`),
  ADD KEY `creado_por` (`creado_por`);

--
-- Indices de la tabla `paquete_servicio`
--
ALTER TABLE `paquete_servicio`
  ADD PRIMARY KEY (`id_paquete`,`id_servicio`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `proveedor_servicio`
--
ALTER TABLE `proveedor_servicio`
  ADD PRIMARY KEY (`id_proveedor`,`id_servicio`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_carrito` (`id_carrito`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carritos`
--
ALTER TABLE `carritos`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  MODIFY `id_item_carrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id_mensaje` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paquetes`
--
ALTER TABLE `paquetes`
  MODIFY `id_paquete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carritos`
--
ALTER TABLE `carritos`
  ADD CONSTRAINT `carritos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  ADD CONSTRAINT `detalle_carrito_ibfk_1` FOREIGN KEY (`id_carrito`) REFERENCES `carritos` (`id_carrito`),
  ADD CONSTRAINT `detalle_carrito_ibfk_2` FOREIGN KEY (`id_paquete`) REFERENCES `paquetes` (`id_paquete`);

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`id_emisor`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`id_receptor`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `paquetes`
--
ALTER TABLE `paquetes`
  ADD CONSTRAINT `paquetes_ibfk_1` FOREIGN KEY (`creado_por`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `paquete_servicio`
--
ALTER TABLE `paquete_servicio`
  ADD CONSTRAINT `paquete_servicio_ibfk_1` FOREIGN KEY (`id_paquete`) REFERENCES `paquetes` (`id_paquete`),
  ADD CONSTRAINT `paquete_servicio_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`);

--
-- Filtros para la tabla `proveedor_servicio`
--
ALTER TABLE `proveedor_servicio`
  ADD CONSTRAINT `proveedor_servicio_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`),
  ADD CONSTRAINT `proveedor_servicio_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_carrito`) REFERENCES `carritos` (`id_carrito`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`id_empleado`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
