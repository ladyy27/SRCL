-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.25-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para srcl
CREATE DATABASE IF NOT EXISTS `srcl` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci */;
USE `srcl`;

-- Volcando estructura para tabla srcl.categoria_curso
CREATE TABLE IF NOT EXISTS `categoria_curso` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(1024) DEFAULT NULL,
  `rango_edadInicio` int(11) DEFAULT NULL,
  `rango_edadFin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para procedimiento srcl.consultar_categoria
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_categoria`(IN `_edad` INT)
BEGIN
	SELECT cc.nombre_categoria 
	FROM categoria_curso cc  
	WHERE _edad 
	BETWEEN cc.rango_edadInicio AND cc.rango_edadFin;
END//
DELIMITER ;

-- Volcando estructura para procedimiento srcl.consultar_estudiante
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_estudiante`(IN `_cedula` VARCHAR(11))
BEGIN
	SELECT id_estudiante, CI, nombres, apellidos, fecha_nac
	FROM estudiantes
	WHERE CI = _cedula;
END//
DELIMITER ;

-- Volcando estructura para procedimiento srcl.consultar_tutor
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_tutor`(
	IN `_usuario` VARCHAR(50),
	IN `_contrasena` VARCHAR(50)
)
BEGIN
	SELECT id_tutor,
	username,
	nombre_tutor,
	apellido_tutor,
	rol
	FROM tutor 
	WHERE username = _usuario AND 
	password = _contrasena;
END//
DELIMITER ;

-- Volcando estructura para procedimiento srcl.consulta_cursos
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consulta_cursos`()
BEGIN
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
END//
DELIMITER ;

-- Volcando estructura para procedimiento srcl.crear_estudiante
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_estudiante`(IN `_cedula` VARCHAR(50), IN `_nombres` VARCHAR(50), IN `_apellidos` VARCHAR(50), IN `_fechaNac` DATE, IN `_email` VARCHAR(50), IN `_username` VARCHAR(50), IN `_password` VARCHAR(8))
BEGIN
	INSERT INTO estudiantes (CI, nombres, apellidos,fecha_nac, e_mail, username, password)
	VALUES (_cedula, _nombres, _apellidos ,_fechaNac, _email, _username, _password);
END//
DELIMITER ;

-- Volcando estructura para procedimiento srcl.crear_matricula
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_matricula`(IN `_estado` VARCHAR(10), IN `_fecha` DATE, IN `_idEstudiante` INT, IN `_idCurso` INT)
BEGIN
	INSERT INTO matriculas (estado, fecha_mat, id_estudiante, id_curso)
	VALUES (_estado, _fecha, _idEstudiante, _idCurso);
END//
DELIMITER ;

-- Volcando estructura para tabla srcl.cursos
CREATE TABLE IF NOT EXISTS `cursos` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_curso` varchar(1024) DEFAULT NULL,
  `descripcion` text,
  `num_horas` int(11) DEFAULT NULL,
  `id_periodo` int(11) NOT NULL,
  `id_tutor` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `fk_cursos_periodo1_idx` (`id_periodo`),
  KEY `fk_cursos_tutor1_idx` (`id_tutor`),
  KEY `fk_cursos_categoria_curso1_idx` (`id_categoria`),
  CONSTRAINT `fk_cursos_categoria_curso1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_curso` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursos_periodo1` FOREIGN KEY (`id_periodo`) REFERENCES `periodo` (`id_periodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursos_tutor1` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para procedimiento srcl.cursosXcategoria
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursosXcategoria`(IN `_edad` INT)
BEGIN
SELECT id_curso, nombre_curso 
FROM cursos c JOIN categoria_curso cc 
ON c.id_categoria=cc.id_categoria 
WHERE _edad 
BETWEEN cc.rango_edadInicio AND cc.rango_edadFin;
END//
DELIMITER ;

-- Volcando estructura para procedimiento srcl.cursosXtutor
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursosXtutor`(
	IN `_idtutor` INT

)
BEGIN
	SELECT id_curso, nombre_curso,descripcion, num_horas, nombre_categoria, nombre_periodo
	FROM tutor, periodo, categoria_curso, cursos
	WHERE tutor.id_tutor =_idtutor AND
	cursos.id_tutor=tutor.id_tutor AND
	periodo.id_periodo = cursos.id_periodo AND
	categoria_curso.id_categoria = cursos.id_categoria;
END//
DELIMITER ;

-- Volcando estructura para tabla srcl.estudiantes
CREATE TABLE IF NOT EXISTS `estudiantes` (
  `id_estudiante` int(11) NOT NULL AUTO_INCREMENT,
  `CI` varchar(11) NOT NULL,
  `nombres` text NOT NULL,
  `apellidos` text NOT NULL,
  `fecha_nac` date DEFAULT NULL,
  `e_mail` varchar(1024) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(8) DEFAULT NULL,
  `rol` int(1) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para procedimiento srcl.login_estudiante
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `login_estudiante`(
	IN `_usuario` VARCHAR(50),
	IN `_contrasena` VARCHAR(50)


)
BEGIN
	SELECT id_estudiante, nombres, apellidos
	FROM estudiantes
	WHERE username= _usuario AND password = _contrasena;
END//
DELIMITER ;

-- Volcando estructura para tabla srcl.matriculas
CREATE TABLE IF NOT EXISTS `matriculas` (
  `idMatricula` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) DEFAULT NULL,
  `fecha_mat` date DEFAULT NULL,
  `id_estudiante` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  PRIMARY KEY (`idMatricula`),
  KEY `fk_matriculas_estudiantes1_idx` (`id_estudiante`),
  KEY `fk_matriculas_cursos1_idx` (`id_curso`),
  CONSTRAINT `fk_matriculas_cursos1` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matriculas_estudiantes1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla srcl.periodo
CREATE TABLE IF NOT EXISTS `periodo` (
  `id_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_periodo` varchar(45) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla srcl.registro_notas
CREATE TABLE IF NOT EXISTS `registro_notas` (
  `idRegistro` int(11) NOT NULL AUTO_INCREMENT,
  `notaTest1` double DEFAULT '0',
  `notaTest2` double DEFAULT '0',
  `notaFinal` double DEFAULT '0',
  `estado` varchar(45) DEFAULT NULL,
  `idMatricula` int(11) NOT NULL,
  PRIMARY KEY (`idRegistro`),
  KEY `fk_registro_notas_matriculas1_idx` (`idMatricula`),
  CONSTRAINT `fk_registro_notas_matriculas1` FOREIGN KEY (`idMatricula`) REFERENCES `matriculas` (`idMatricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla srcl.tutor
CREATE TABLE IF NOT EXISTS `tutor` (
  `id_tutor` int(11) NOT NULL AUTO_INCREMENT,
  `CI_tutor` varchar(11) DEFAULT NULL,
  `nombre_tutor` varchar(1024) DEFAULT NULL,
  `apellido_tutor` varchar(1024) DEFAULT NULL,
  `e_mail` varchar(1024) DEFAULT NULL,
  `titulo` text,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `rol` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tutor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
