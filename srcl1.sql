-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-07-2017 a las 01:45:32
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarMatricula` (IN `_idEst` INT, IN `_idCurso` INT)  BEGIN
	SELECT m.idMatricula, 
	m.estado, 
	m.fecha_mat,
	m.id_estudiante,
	m.id_curso
	FROM matriculas m
	WHERE m.id_estudiante = _idEst AND
	m.id_curso = _idCurso;
END$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `crearRegistroNotasByEstudiante` (IN `_nota1` DOUBLE, IN `_nota2` DOUBLE, IN `_notaFinal` DOUBLE, IN `_estado` VARCHAR(50), IN `_idMat` INT)  BEGIN
	INSERT INTO registro_notas (notaTest1,notaTest2,notaFinal,estado,idMatricula)
	VALUES (_nota1, _nota2, _notaFinal, _estado, _idMat);
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
(119, '1104620792', 'Lady', 'Yaguachi', '1994-01-20', 'ladyy27@gmail.com', 'ladyy27', '159753', 2),
(120, '1104620798', 'Ana', 'Cardenas', '1992-05-16', 'acardenas@gmail.com', 'acardenas', '1832', 2),
(121, '1104620793', 'Nerea', 'Perez', '2001-06-21', 'nperez@gmail.com', 'nperez', '145236', 2);

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
(23, 'ACEPTADA', '2017-07-14', 119, 11),
(24, 'ACEPTADA', '2017-07-14', 120, 11),
(25, 'ACEPTADA', '2017-07-14', 121, 5);

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

--
-- Volcado de datos para la tabla `registro_notas`
--

INSERT INTO `registro_notas` (`idRegistro`, `notaTest1`, `notaTest2`, `notaFinal`, `estado`, `idMatricula`) VALUES
(1, 0, 0, 0, 'EN CURSO', 23),
(2, 0, 0, 0, 'EN CURSO', 24),
(3, 0, 0, 0, 'EN CURSO', 25);

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
  MODIFY `id_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
--
-- AUTO_INCREMENT de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `idMatricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `id_periodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `registro_notas`
--
ALTER TABLE `registro_notas`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
