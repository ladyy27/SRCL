-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-07-2017 a las 03:46:37
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `srcl`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_categoria` (IN `_edad` INT)  BEGIN
	SELECT cc.nombre_categoria 
	FROM categoria_curso cc  
	WHERE _edad 
	BETWEEN cc.rango_edadInicio AND cc.rango_edadFin;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_estudiante` (IN `_cedula` VARCHAR(11))  BEGIN
	SELECT id_estudiante, CI, nombres, apellidos, fecha_nac
	FROM estudiantes
	WHERE CI = _cedula;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_tutor` (IN `_usuario` VARCHAR(50), IN `_contrasena` VARCHAR(50))  BEGIN
	SELECT id_tutor,
	username,
	nombre_tutor,
	apellido_tutor,
	rol
	FROM tutor 
	WHERE username = _usuario AND 
	password = _contrasena;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consulta_cursos` ()  BEGIN
	SELECT cursos.id_curso, 
	cursos.nombre_curso, 
	cursos.descripcion ,
	cursos.num_horas, 
	categoria_curso.id_categoria,
	categoria_curso.nombre_categoria, 
	tutor.nombre_tutor,
	tutor.apellido_tutor 
	FROM cursos , categoria_curso , tutor WHERE 
	cursos.id_categoria = categoria_curso.id_categoria AND 
	cursos.id_tutor = tutor.id_tutor ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_estudiante` (IN `_cedula` VARCHAR(50), IN `_nombres` VARCHAR(50), IN `_apellidos` VARCHAR(50), IN `_fechaNac` DATE, IN `_email` VARCHAR(50), IN `_username` VARCHAR(50), IN `_password` VARCHAR(8))  BEGIN
	INSERT INTO estudiantes (CI, nombres, apellidos,fecha_nac, e_mail, username, password)
	VALUES (_cedula, _nombres, _apellidos ,_fechaNac, _email, _username, _password);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_matricula` (IN `_estado` VARCHAR(10), IN `_fecha` DATE, IN `_idEstudiante` INT, IN `_idCurso` INT)  BEGIN
	INSERT INTO matriculas (estado, fecha_mat, id_estudiante, id_curso)
	VALUES (_estado, _fecha, _idEstudiante, _idCurso);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cursosXcategoria` (IN `_edad` INT)  BEGIN
SELECT id_curso, nombre_curso 
FROM cursos c JOIN categoria_curso cc 
ON c.id_categoria=cc.id_categoria 
WHERE _edad 
BETWEEN cc.rango_edadInicio AND cc.rango_edadFin;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cursosXtutor` (IN `_idtutor` INT)  BEGIN
	SELECT id_curso, nombre_curso,descripcion, num_horas, nombre_categoria, nombre_periodo
	FROM tutor, periodo, categoria_curso, cursos
	WHERE tutor.id_tutor =_idtutor AND
	cursos.id_tutor=tutor.id_tutor AND
	periodo.id_periodo = cursos.id_periodo AND
	categoria_curso.id_categoria = cursos.id_categoria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login_estudiante` (IN `_usuario` VARCHAR(50), IN `_contrasena` VARCHAR(50))  BEGIN
	SELECT id_estudiante, nombres, apellidos
	FROM estudiantes
	WHERE username= _usuario AND password = _contrasena;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_curso`
--

CREATE TABLE `categoria_curso` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(1024) DEFAULT NULL,
  `rango_edadInicio` int(11) DEFAULT NULL,
  `rango_edadFin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria_curso`
--

INSERT INTO `categoria_curso` (`id_categoria`, `nombre_categoria`, `rango_edadInicio`, `rango_edadFin`) VALUES
(1, 'Junior', 12, 16),
(2, 'Jovenes', 17, 22),
(3, 'Adultos', 23, 30),
(4, 'Tercera Edad', 30, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(11) NOT NULL,
  `nombre_curso` varchar(1024) DEFAULT NULL,
  `descripcion` text,
  `num_horas` int(11) DEFAULT NULL,
  `id_periodo` int(11) NOT NULL,
  `id_tutor` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id_curso`, `nombre_curso`, `descripcion`, `num_horas`, `id_periodo`, `id_tutor`, `id_categoria`) VALUES
(5, 'Videojuegos I', 'Videojuegos con Huayra', 80, 1, 1, 1),
(6, 'Robotica I', 'Principios de Electronica', 45, 1, 1, 2),
(9, 'Legislacion Laboral', 'Legislacion', 30, 1, 1, 3),
(10, 'Bricolaje', 'Tecnicas de Bricolaje', 50, 1, 1, 4),
(11, 'Principios de Aerodinamica', 'Fundamentos de Aerodinamica', 35, 1, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id_estudiante` int(11) NOT NULL,
  `CI` varchar(11) NOT NULL,
  `nombres` text NOT NULL,
  `apellidos` text NOT NULL,
  `fecha_nac` date DEFAULT NULL,
  `e_mail` varchar(1024) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(8) DEFAULT NULL,
  `rol` int(1) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id_estudiante`, `CI`, `nombres`, `apellidos`, `fecha_nac`, `e_mail`, `username`, `password`, `rol`) VALUES
(1, '1104620701', 'Ana', 'Cardenas', '2003-05-21', 'anycardenas7@gmail.com', 'acardenas', '1111', 2),
(3, '1104620601', 'Cristina', 'Torres', '1996-05-21', 'cristorres@gmail.com', 'ctorres', '1111', 2),
(4, '1101234567', 'Lady', 'Yaguachi', NULL, 'any.cardenas17@gmail.com', 'ela', '123', 2),
(5, '1104620789', 'Lady', 'Yaguachi', NULL, 'leyaguachi@utpl.edu.ec', 'ela', '123', 2),
(6, '1104895621', 'Alexander', 'Sanchez', '2014-01-19', 'ladyy27@gmail.com', 'asanchez', '4444', 2),
(7, '5757', 'fsdfsd', 'fsfsd', '2017-02-07', 'gbdfb@gfgf', 'fsd', '123', 2),
(8, '85546', 'marcelo', 'dd', '2017-07-02', 'a@df', 'gvcgcf', 'fdffd', 2),
(9, '545', 'marcelo', 'dfsdf', '2017-07-16', 'asa@dfdsf', 'fgf', 'gfg', 2),
(10, '254245', 'ela', 'fdfds', '2017-05-10', 's@add', 'fdfsf', 'fdfsdf', 2),
(11, '31231', 'ela', 'fdfd', '2017-07-02', 'fdgdf@fg', 'fsdf', 'fdsf', 2),
(12, '1142056300', 'Maria', 'Rodriguez', '2017-07-06', 'a@dfd', 'mrodriguez', '4444', 2),
(13, '1142056300', 'Maria', 'Rodriguez', '2017-07-06', 'a@dfd', 'mrodriguez', '4444', 2),
(14, '1142056300', 'Maria', 'Rodriguez', '2017-07-06', 'a@dfd', 'mrodriguez', '4444', 2),
(15, '1142056300', 'Maria', 'Rodriguez', '2017-07-06', 'a@dfd', 'mrodriguez', '4444', 2),
(16, '1105', 'Ana', 'Rocio', '1994-02-02', 'a@a', 'arocio', '5555', 2),
(17, '1105', 'Ana', 'Rocio', '1994-02-02', 'a@a', 'arocio', '5555', 2),
(18, '1105', 'Ana', 'Rocio', '1994-02-02', 'a@a', 'arocio', '5555', 2),
(19, '1105', 'Ana', 'Rocio', '1994-02-02', 'a@a', 'arocio', '5555', 2),
(20, '1105', 'Ana', 'Rocio', '1994-02-02', 'a@a', 'arocio', '5555', 2),
(21, '1105', 'Ana', 'Rocio', '1994-02-02', 'a@a', 'arocio', '5555', 2),
(22, '1105', 'Ana', 'Rocio', '1994-02-02', 'a@a', 'arocio', '5555', 2),
(23, '1185', 'luis', 'Rocio', '1994-02-02', 'a@a', 'arocio', '5555', 2),
(24, '1185', 'luis', 'Rocio', '1994-02-02', 'a@a', 'arocio', '5555', 2),
(25, '1185', 'luis', 'Rocio', '1994-02-02', 'a@a', 'arocio', '123', 2),
(26, '1104620789', 'marcelo', 'fdf', '2017-07-02', 'ladyy27@gmail.com', 'asanchez', '123', 2),
(27, '1104620789', 'marcelo', 'fdf', '2017-07-02', 'ladyy27@gmail.com', 'asanchez', '123', 2),
(28, '1104620789', 'marcelo', 'fdf', '2017-07-02', 'ladyy27@gmail.com', 'asanchez', '123', 2),
(29, '1104620789', 'marcelo', 'fdf', '2017-07-02', 'ladyy27@gmail.com', 'asanchez', '123', 2),
(30, '123456', 'laolao', 'dfdfd', '1994-02-14', 'll@a', 'lady', '7777', 2),
(31, '123456', 'laolao', 'dfdfd', '2011-02-14', 'll@a', 'lady', '7777', 2),
(32, '1101234566', 'Marcela', 'Valencia', '1994-01-19', 'a@aa', 'mvalencia', '2222', 2),
(33, '1101234566', 'Marcela', 'Valencia', '1994-01-19', 'a@aa', 'mvalencia', '2222', 2),
(34, '1101234566', 'Marcela', 'Valencia', '1994-01-19', 'a@aa', 'mvalencia', '2222', 2),
(35, '1101234566', 'Marcela', 'Valencia', '1994-01-19', 'a@aa', 'mvalencia', '2222', 2),
(36, '656565', 'Ela', 'Ramirez', '1994-01-21', 'w@q', 'eramirez', '123456', 2),
(37, '1146207945', 'ela', 'Roman', '1994-02-15', 'ladyy27@gmail.com', 'eroman', '12345678', 2),
(38, '5146466464', 'Jona', 'Y', '1995-03-14', 'wq@e', 'fdfd', 'fsdfs', 2),
(39, '6565656565', 'Angel', 'Yaguachi', '1996-02-14', 'qq@q', 'ayaguachi', '155555', 2),
(40, '5465666646', 'Nixon', 'pereira', '1999-07-13', 'w@adfd', 'np', '154', 2),
(41, '5465666646', 'Nixon', 'pereira', '1999-07-13', 'w@adfd', 'np', '154', 2),
(42, '1333323232', 'Almida', 'aa', '2007-06-03', 'k@er', 'aArias', '12234656', 2),
(43, '1333323232', 'Almida', 'aa', '2001-01-22', 'k@er', 'aArias', '12234656', 2),
(44, '1101234567', 'ana', 'dfsd', '2001-02-04', 'dfsdfs@sas', 'dfdf', 'dfd', 2),
(45, '1101234567', 'ana', 'dfsd', '2001-02-04', 'dfsdfs@sas', 'dfdf', 'dfd', 2),
(46, '6646466464', 'anaq', 'fdfsd', '1986-02-11', 'ladyy27@gmail.com', 'asolano', '12325464', 2),
(47, '6656656665', 'Rosa', 'Chavez', '1990-02-05', 'ladyy27@gmail.com', 'rchavez', '36323323', 2),
(48, '6656656665', 'Rosa', 'Chavez', '1990-02-05', 'ladyy27@gmail.com', 'rchavez', '123', 2),
(49, '6656656665', 'Rosa', 'Chavez', '1990-02-05', 'ladyy27@gmail.com', 'rchavez', '123', 2),
(50, '6656656665', 'Rosa', 'Chavez', '1990-02-05', 'ladyy27@gmail.com', 'rchavez', '123', 2),
(51, '5654656565', 'Fernando', 'Torres', '1990-02-13', 'ld@d', 'ftorres', '64666', 2),
(52, '5654656565', 'Fernando', 'Torres', '1990-02-13', 'ld@d', 'ftorres', '64666', 2),
(53, '6565656566', 'Karla', 'Soto', '1990-02-24', 'lady@vdcv', 'ssoto', '56352323', 2),
(54, '6565656566', 'Karla', 'Soto', '1990-02-24', 'lady@vdcv', 'ssoto', '56352323', 2),
(55, '6565656566', 'Karla', 'Soto', '1990-02-24', 'lady@vdcv', 'ssoto', '56352323', 2),
(56, '6565656566', 'Karla', 'Soto', '1990-02-24', 'lady@vdcv', 'ssoto', '56352323', 2),
(57, '6565656566', 'Karla', 'Soto', '1990-02-24', 'lady@vdcv', 'ssoto', '56352323', 2),
(58, '6565656566', 'Karla', 'Soto', '1990-02-24', 'lady@vdcv', 'ssoto', '56352323', 2),
(59, '4484', 'sdd', 'sdsd', '1990-02-25', 'sds@sds.com', 'eef', '123', 2),
(60, '4484', 'sdd', 'sdsd', '1990-02-25', 'sds@sds.com', 'eef', '123', 2),
(61, '4484', 'sdd', 'sdsd', '1990-02-25', 'sds@sds.com', 'eef', '123', 2),
(62, '4484', 'sdd', 'sdsd', '1990-02-25', 'sds@sds.com', 'eef', '123', 2),
(63, '4484', 'sdd', 'sdsd', '1990-02-25', 'sds@sds.com', 'eef', '123', 2),
(64, '1234567894', 'Ana', 'Rocio', '1990-05-12', 'a@dsdd', 'arociooo', '123456', 2),
(65, '1234567894', 'Ana', 'Rocio', '1990-05-12', 'a@dsdd', 'arociooo', '123456', 2),
(66, '1234567894', 'Ana', 'Rocio', '1990-05-12', 'a@dsdd', 'arociooo', '123456', 2),
(67, '1223467897', 'dana', 'paola', '1990-12-12', 'lady@vdcv', 'dpaola', '12345678', 2),
(68, '1223467897', 'dana', 'paola', '1990-12-12', 'lady@vdcv', 'dpaola', '12345678', 2),
(69, '1101234589', 'Sofia', 'Chavez', '1990-02-07', 'las@fsdfs', 'schavez', '15975385', 2),
(70, '5656565666', 'Lady', 'Noriega', '2000-01-17', 'q@ewewe', 'noriega1', '15975348', 2),
(71, '6464646464', 'Almida', 'Torres', '1998-01-16', 'gf@gfg', 'atorres', '15975348', 2),
(72, '1104620852', 'Diana', 'Torres', '1991-02-13', 'dsd@dada', 'dtorres', '12345678', 2),
(73, '1104620852', 'Diana', 'Torres', '1991-02-13', 'dsd@dada', 'dtorres', '12345678', 2),
(74, '1597534566', 'ela', 'yguu', '1991-02-27', 'qs@rt', 'elay', '12345678', 2),
(75, '147852963', 'Galo', 'Ramirez', '1985-07-24', 'qr@rf', 'gramirez', '12345696', 2),
(76, '1124567899', 'Raul', 'Fuller', '1994-02-15', 'e@ddd', 'rfuller', '45678912', 2),
(77, '1478529666', 'Alex', 'Quiroga', '1993-06-23', 'q@fd', 'aquiroja', '15945623', 2),
(78, '1078952233', 'Luis', 'Agreda', '1992-07-25', 'e@sfds', 'lagreda', '14785236', 2),
(79, '1234567896', 'Fabricio', 'Gutierrez', '1992-04-25', 'ladyy27@gmail.com', 'fgutierrez', '14523698', 2),
(80, '1238523699', 'Luisa', 'Ana', '1990-05-26', 'e@ddf', 'lana', '15985236', 2),
(81, '1254564999', 'Fernando', 'Ayala', '1992-08-15', 'e@ddf', 'fayala', '14528963', 2),
(82, '1231478522', 'Fer', 'Yaguana', '1991-06-25', 'fd@fsds', 'fyaguana', '14562369', 2),
(83, '1456325896', 'rocio', 'aguirre', '1992-12-27', 'e@a', 'raguirre', '14523669', 2),
(84, '1234567989', 'Fabricio', 'Hernandz', '2000-05-10', 'q@fd', 'fhernadez', '14523698', 2),
(85, '1114458523', 'Guay', 'Sun', '1992-02-25', 'lady@vdcv', 'gsun', '14558985', 2),
(86, '1234567878', 'Almida', 'Pereira Sarmiento', '1992-09-25', 'almidap@hotmail.com', 'apereira', '77777777', 2),
(87, '656', 'ana', 'sofia', '1988-06-25', 'fsdfs@dfd', 'asofia', '54656366', 2),
(88, '1234567899', 'cxc', 'cxc', '1996-06-25', 'qqw@dd', 'cxc', 'cxc', 2),
(89, '159632548', 'Jona', 'Pereira', '1993-05-18', 'e@121', 'jpereira', '15963224', 2),
(90, '45353', 'Alexander', 'Torres', '1990-04-02', 'asa@dfd', 'aatorres', '12345687', 2),
(91, '123456789', 'Franz', 'SaldaÃ±a', '1992-05-15', 'fr@fxd', 'fsaldana', '15978452', 2),
(92, '1247895412', 'Eliza', 'Cordova', '2000-05-14', 'adfdg@dfdf', 'ecordova', '14785245', 2),
(93, '1456231588', 'Daniel', 'Betancourt', '1994-04-09', 'fdf@daf', 'dbetan', '14588964', 2),
(94, '1669644654', 'Francisco', 'Sarango', '1988-08-14', 'sdsdfs@fdfgd', 'fransarango', '47884126', 2),
(95, '1564986664', 'Jose Luis', 'Cueva', '1994-03-15', 'sds@vcv', 'jcueva', '565656+5', 2),
(96, '1478666644', 'Daniel', 'SEFSD', '1990-12-14', 'ladyqq@fsdf', 'desee', '14444', 2),
(97, '6565656566', 'Eder', 'Gutierrez', '1993-12-10', 'vdfd@ffd', 'eguti', 'dsfsd', 2),
(98, '56563563', 'Luis', 'AcuÃ±a', '1999-09-05', 'dfsd@fdfd', 'lacuna', '14889965', 2),
(99, '5566565665', 'Sol', 'Larriva', '1994-01-20', 'aa@dfdg', 'slarriva', '15984752', 2),
(100, '4545545', 'Galo', 'Celly', '1994-11-13', 'galo@gdgd', 'gcelly', '0987', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriculas`
--

CREATE TABLE `matriculas` (
  `idMatricula` int(11) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `fecha_mat` date DEFAULT NULL,
  `id_estudiante` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `matriculas`
--

INSERT INTO `matriculas` (`idMatricula`, `estado`, `fecha_mat`, `id_estudiante`, `id_curso`) VALUES
(2, 'ACEPTADA', '2017-07-06', 26, 5),
(3, 'ACEPTADA', '2017-07-10', 96, 11),
(4, 'ACEPTADA', '2017-07-10', 53, 9),
(5, 'ACEPTADA', '2017-07-10', 98, 6),
(6, 'ACEPTADA', '2017-07-12', 99, 11),
(7, 'ACEPTADA', '2017-07-13', 100, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE `periodo` (
  `id_periodo` int(11) NOT NULL,
  `nombre_periodo` varchar(45) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `periodo`
--

INSERT INTO `periodo` (`id_periodo`, `nombre_periodo`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 'Abril - Agosto 2016', '2017-04-02', '2017-06-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_notas`
--

CREATE TABLE `registro_notas` (
  `idRegistro` int(11) NOT NULL,
  `notaTest1` double DEFAULT '0',
  `notaTest2` double DEFAULT '0',
  `notaFinal` double DEFAULT '0',
  `estado` varchar(45) DEFAULT NULL,
  `idMatricula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE `tutor` (
  `id_tutor` int(11) NOT NULL,
  `CI_tutor` varchar(11) DEFAULT NULL,
  `nombre_tutor` varchar(1024) DEFAULT NULL,
  `apellido_tutor` varchar(1024) DEFAULT NULL,
  `e_mail` varchar(1024) DEFAULT NULL,
  `titulo` text,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `rol` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tutor`
--

INSERT INTO `tutor` (`id_tutor`, `CI_tutor`, `nombre_tutor`, `apellido_tutor`, `e_mail`, `titulo`, `username`, `password`, `rol`) VALUES
(1, '1104620798', 'Alberto', 'Madariaga', 'amadariaga@gmail.com', 'Ingeniero en Electronica y Comunicaciones', 'amadariaga', '1111', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_curso`
--
ALTER TABLE `categoria_curso`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `fk_cursos_periodo1_idx` (`id_periodo`),
  ADD KEY `fk_cursos_tutor1_idx` (`id_tutor`),
  ADD KEY `fk_cursos_categoria_curso1_idx` (`id_categoria`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id_estudiante`);

--
-- Indices de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`idMatricula`),
  ADD KEY `fk_matriculas_estudiantes1_idx` (`id_estudiante`),
  ADD KEY `fk_matriculas_cursos1_idx` (`id_curso`);

--
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`id_periodo`);

--
-- Indices de la tabla `registro_notas`
--
ALTER TABLE `registro_notas`
  ADD PRIMARY KEY (`idRegistro`),
  ADD KEY `fk_registro_notas_matriculas1_idx` (`idMatricula`);

--
-- Indices de la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id_tutor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_curso`
--
ALTER TABLE `categoria_curso`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `idMatricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `id_periodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `registro_notas`
--
ALTER TABLE `registro_notas`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tutor`
--
ALTER TABLE `tutor`
  MODIFY `id_tutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_cursos_categoria_curso1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_curso` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cursos_periodo1` FOREIGN KEY (`id_periodo`) REFERENCES `periodo` (`id_periodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cursos_tutor1` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `fk_matriculas_cursos1` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_matriculas_estudiantes1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registro_notas`
--
ALTER TABLE `registro_notas`
  ADD CONSTRAINT `fk_registro_notas_matriculas1` FOREIGN KEY (`idMatricula`) REFERENCES `matriculas` (`idMatricula`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
