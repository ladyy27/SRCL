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

-- Volcando datos para la tabla srcl.categoria_curso: ~4 rows (aproximadamente)
DELETE FROM `categoria_curso`;
/*!40000 ALTER TABLE `categoria_curso` DISABLE KEYS */;
INSERT INTO `categoria_curso` (`id_categoria`, `nombre_categoria`, `rango_edadInicio`, `rango_edadFin`) VALUES
	(1, 'Junior', 12, 16),
	(2, 'Jovenes', 17, 22),
	(3, 'Adultos', 23, 30),
	(4, 'Tercera Edad', 30, 100);
/*!40000 ALTER TABLE `categoria_curso` ENABLE KEYS */;

-- Volcando estructura para procedimiento srcl.consultarMatricula
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarMatricula`(
	IN `_idEst` INT,
	IN `_idCurso` INT
)
BEGIN
	SELECT m.idMatricula, 
	m.estado, 
	m.fecha_mat,
	m.id_estudiante,
	m.id_curso
	FROM matriculas m
	WHERE m.id_estudiante = _idEst AND
	m.id_curso = _idCurso;
END//
DELIMITER ;

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

-- Volcando estructura para procedimiento srcl.crearRegistroNotasByEstudiante
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearRegistroNotasByEstudiante`(
	IN `_nota1` DOUBLE,
	IN `_nota2` DOUBLE,
	IN `_notaFinal` DOUBLE,
	IN `_estado` VARCHAR(50),
	IN `_idMat` INT
)
BEGIN
	INSERT INTO registro_notas (notaTest1,notaTest2,notaFinal,estado,idMatricula)
	VALUES (_nota1, _nota2, _notaFinal, _estado, _idMat);
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

-- Volcando datos para la tabla srcl.cursos: ~5 rows (aproximadamente)
DELETE FROM `cursos`;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` (`id_curso`, `nombre_curso`, `descripcion`, `num_horas`, `id_periodo`, `id_tutor`, `id_categoria`) VALUES
	(5, 'Videojuegos I', 'Videojuegos con Huayra', 80, 1, 1, 1),
	(6, 'Robotica I', 'Principios de Electronica', 45, 1, 1, 2),
	(9, 'Legislacion Laboral', 'Legislacion', 30, 1, 1, 3),
	(10, 'Bricolaje', 'Tecnicas de Bricolaje', 50, 1, 1, 4),
	(11, 'Principios de Aerodinamica', 'Fundamentos de Aerodinamica', 35, 1, 1, 3);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla srcl.estudiantes: ~2 rows (aproximadamente)
DELETE FROM `estudiantes`;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` (`id_estudiante`, `CI`, `nombres`, `apellidos`, `fecha_nac`, `e_mail`, `username`, `password`, `rol`) VALUES
	(119, '1104620792', 'Lady', 'Yaguachi', '1994-01-20', 'ladyy27@gmail.com', 'ladyy27', '159753', 2),
	(120, '1104620798', 'Ana', 'Cardenas', '1992-05-16', 'acardenas@gmail.com', 'acardenas', '1832', 2),
	(121, '1104620793', 'Nerea', 'Perez', '2001-06-21', 'nperez@gmail.com', 'nperez', '145236', 2);
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;

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

-- Volcando estructura para procedimiento srcl.matByCurso
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `matByCurso`(
	IN `_idcurso` INT
)
BEGIN
	SELECT m.idMatricula,
	m.estado, 
	m.fecha_mat,
	m.id_estudiante, 
	m.id_curso
	FROM cursos c, matriculas m
	WHERE c.id_curso = _idcurso AND
	c.id_curso = m.id_curso;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla srcl.matriculas: ~2 rows (aproximadamente)
DELETE FROM `matriculas`;
/*!40000 ALTER TABLE `matriculas` DISABLE KEYS */;
INSERT INTO `matriculas` (`idMatricula`, `estado`, `fecha_mat`, `id_estudiante`, `id_curso`) VALUES
	(23, 'ACEPTADA', '2017-07-14', 119, 11),
	(24, 'ACEPTADA', '2017-07-14', 120, 11),
	(25, 'ACEPTADA', '2017-07-14', 121, 5);
/*!40000 ALTER TABLE `matriculas` ENABLE KEYS */;

-- Volcando estructura para procedimiento srcl.matriculasByCurso
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `matriculasByCurso`(
	IN `_idcurso` INT
)
BEGIN
	SELECT e.nombres, 
	e.apellidos, 
	m.idMatricula,
	rn.idRegistro, 
	rn.notaTest1,
	rn.notaTest2, 
	rn.notaFinal, 
	rn.estado 
	FROM cursos c, registro_notas rn, matriculas m, estudiantes e
	WHERE c.id_curso = _idcurso AND
	c.id_curso = m.id_curso AND
	m.idMatricula = rn.idMatricula AND
	m.id_estudiante = e.id_estudiante;
END//
DELIMITER ;

-- Volcando estructura para tabla srcl.periodo
CREATE TABLE IF NOT EXISTS `periodo` (
  `id_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_periodo` varchar(45) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla srcl.periodo: ~0 rows (aproximadamente)
DELETE FROM `periodo`;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` (`id_periodo`, `nombre_periodo`, `fecha_inicio`, `fecha_fin`) VALUES
	(1, 'Abril - Agosto 2016', '2017-04-02', '2017-06-02');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla srcl.registro_notas: ~2 rows (aproximadamente)
DELETE FROM `registro_notas`;
/*!40000 ALTER TABLE `registro_notas` DISABLE KEYS */;
INSERT INTO `registro_notas` (`idRegistro`, `notaTest1`, `notaTest2`, `notaFinal`, `estado`, `idMatricula`) VALUES
	(1, 0, 0, 0, 'EN CURSO', 23),
	(2, 0, 0, 0, 'EN CURSO', 24),
	(3, 0, 0, 0, 'EN CURSO', 25);
/*!40000 ALTER TABLE `registro_notas` ENABLE KEYS */;

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

-- Volcando datos para la tabla srcl.tutor: ~0 rows (aproximadamente)
DELETE FROM `tutor`;
/*!40000 ALTER TABLE `tutor` DISABLE KEYS */;
INSERT INTO `tutor` (`id_tutor`, `CI_tutor`, `nombre_tutor`, `apellido_tutor`, `e_mail`, `titulo`, `username`, `password`, `rol`) VALUES
	(1, '1104620798', 'Alberto', 'Madariaga', 'amadariaga@gmail.com', 'Ingeniero en Electronica y Comunicaciones', 'amadariaga', '1111', 1);
/*!40000 ALTER TABLE `tutor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
