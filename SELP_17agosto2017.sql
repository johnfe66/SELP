CREATE DATABASE  IF NOT EXISTS `selp` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `selp`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: selp
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adsi`
--

DROP TABLE IF EXISTS `adsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adsi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idsede_formacion` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `codigo_ficha` int(11) NOT NULL,
  `idestado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_ficha_UNIQUE` (`codigo_ficha`),
  KEY `fk_programa_formacion_sede_formacion1_idx` (`idsede_formacion`),
  KEY `fk_adsi_estado1_idx` (`idestado`),
  CONSTRAINT `fk_adsi_estado1` FOREIGN KEY (`idestado`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_programa_formacion_sede_formacion1` FOREIGN KEY (`idsede_formacion`) REFERENCES `sede_formacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adsi`
--

LOCK TABLES `adsi` WRITE;
/*!40000 ALTER TABLE `adsi` DISABLE KEYS */;
/*!40000 ALTER TABLE `adsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adsi_has_usuario`
--

DROP TABLE IF EXISTS `adsi_has_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adsi_has_usuario` (
  `idadsi` int(11) NOT NULL,
  `idusuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idadsi`,`idusuario`),
  KEY `fk_adsi_has_usuario_usuario1_idx` (`idusuario`),
  KEY `fk_adsi_has_usuario_adsi1_idx` (`idadsi`),
  CONSTRAINT `fk_adsi_has_usuario_adsi1` FOREIGN KEY (`idadsi`) REFERENCES `adsi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_adsi_has_usuario_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adsi_has_usuario`
--

LOCK TABLES `adsi_has_usuario` WRITE;
/*!40000 ALTER TABLE `adsi_has_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `adsi_has_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas_conocimiento`
--

DROP TABLE IF EXISTS `areas_conocimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas_conocimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas_conocimiento`
--

LOCK TABLES `areas_conocimiento` WRITE;
/*!40000 ALTER TABLE `areas_conocimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `areas_conocimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro_formacion`
--

DROP TABLE IF EXISTS `centro_formacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centro_formacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `idciudad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_centro_formacion_ciudad1_idx` (`idciudad`),
  CONSTRAINT `fk_centro_formacion_ciudad1` FOREIGN KEY (`idciudad`) REFERENCES `ciudad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_formacion`
--

LOCK TABLES `centro_formacion` WRITE;
/*!40000 ALTER TABLE `centro_formacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `centro_formacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `iddepartamento` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ciudad_departamento1_idx` (`iddepartamento`),
  CONSTRAINT `fk_ciudad_departamento1` FOREIGN KEY (`iddepartamento`) REFERENCES `departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'NEIVA',41);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (41,'HUILA');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dificultad_pregunta`
--

DROP TABLE IF EXISTS `dificultad_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dificultad_pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `puntos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dificultad_pregunta`
--

LOCK TABLES `dificultad_pregunta` WRITE;
/*!40000 ALTER TABLE `dificultad_pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `dificultad_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `idtipo_estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estado_UNIQUE` (`estado`),
  KEY `fk_estado_tipo_estado1_idx` (`idtipo_estado`),
  CONSTRAINT `fk_estado_tipo_estado1` FOREIGN KEY (`idtipo_estado`) REFERENCES `tipo_estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'ACTIVO','USUARIO ACTIVO',1),(2,'INACTIVO','USUARIO INACTIVO',1);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examen`
--

DROP TABLE IF EXISTS `examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `resultado` varchar(45) NOT NULL DEFAULT 'N',
  `porcentaje` int(11) NOT NULL DEFAULT '0',
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `idusuario` int(10) unsigned NOT NULL,
  `idestado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_examen_usuario1_idx` (`idusuario`),
  KEY `fk_examen_estado1_idx` (`idestado`),
  CONSTRAINT `fk_examen_estado1` FOREIGN KEY (`idestado`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examen_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examen`
--

LOCK TABLES `examen` WRITE;
/*!40000 ALTER TABLE `examen` DISABLE KEYS */;
/*!40000 ALTER TABLE `examen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examen_has_pregunta`
--

DROP TABLE IF EXISTS `examen_has_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examen_has_pregunta` (
  `idexamen` int(11) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  `respuesta_usuario` varchar(45) NOT NULL,
  PRIMARY KEY (`idexamen`,`idpregunta`),
  KEY `fk_examen_has_pregunta_pregunta1_idx` (`idpregunta`),
  KEY `fk_examen_has_pregunta_examen1_idx` (`idexamen`),
  CONSTRAINT `fk_examen_has_pregunta_examen1` FOREIGN KEY (`idexamen`) REFERENCES `examen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examen_has_pregunta_pregunta1` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examen_has_pregunta`
--

LOCK TABLES `examen_has_pregunta` WRITE;
/*!40000 ALTER TABLE `examen_has_pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `examen_has_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel_usuario`
--

DROP TABLE IF EXISTS `nivel_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `umbral_puntos` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_usuario`
--

LOCK TABLES `nivel_usuario` WRITE;
/*!40000 ALTER TABLE `nivel_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `nivel_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcion_respuesta_pregunta`
--

DROP TABLE IF EXISTS `opcion_respuesta_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcion_respuesta_pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opcion` varchar(45) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  `valor_verdad` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_opcion_respuesta_pregunta_pregunta1_idx` (`idpregunta`),
  CONSTRAINT `fk_opcion_respuesta_pregunta_pregunta1` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcion_respuesta_pregunta`
--

LOCK TABLES `opcion_respuesta_pregunta` WRITE;
/*!40000 ALTER TABLE `opcion_respuesta_pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcion_respuesta_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permiso` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido1` varchar(45) NOT NULL,
  `apellido2` varchar(45) NOT NULL,
  `genero` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `tipo_identificacion` varchar(45) NOT NULL,
  `identificacion` varchar(45) NOT NULL,
  `idciudad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identificacion_UNIQUE` (`identificacion`),
  KEY `fk_persona_ciudad1_idx` (`idciudad`),
  CONSTRAINT `fk_persona_ciudad1` FOREIGN KEY (`idciudad`) REFERENCES `ciudad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'JOHN FELIPE','VARGAS','PERDOMO','M','JOHNFE66@GMAIL.COM','CC','94552499',1);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `encabezado` varchar(1000) NOT NULL,
  `idtipo_pregunta` int(11) NOT NULL,
  `idtemas` int(11) NOT NULL,
  `iddificultad_pregunta` int(11) NOT NULL,
  `idestado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pregunta_tipo_pregunta1_idx` (`idtipo_pregunta`),
  KEY `fk_pregunta_temas1_idx` (`idtemas`),
  KEY `fk_pregunta_dificultad_pregunta1_idx` (`iddificultad_pregunta`),
  KEY `fk_pregunta_estado1_idx` (`idestado`),
  CONSTRAINT `fk_pregunta_dificultad_pregunta1` FOREIGN KEY (`iddificultad_pregunta`) REFERENCES `dificultad_pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pregunta_estado1` FOREIGN KEY (`idestado`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pregunta_temas1` FOREIGN KEY (`idtemas`) REFERENCES `temas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pregunta_tipo_pregunta1` FOREIGN KEY (`idtipo_pregunta`) REFERENCES `tipo_pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progreso_usuario`
--

DROP TABLE IF EXISTS `progreso_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progreso_usuario` (
  `idusuario` int(10) unsigned NOT NULL,
  `puntos` varchar(45) NOT NULL,
  `idnivel_usuario` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_progreso_usuario_nivel_usuario1_idx` (`idnivel_usuario`),
  CONSTRAINT `fk_progreso_usuario_nivel_usuario1` FOREIGN KEY (`idnivel_usuario`) REFERENCES `nivel_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_progreso_usuario_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progreso_usuario`
--

LOCK TABLES `progreso_usuario` WRITE;
/*!40000 ALTER TABLE `progreso_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `progreso_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'INSTRUCTOR','INSTRUCTOR DEL ADSI');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permisos`
--

DROP TABLE IF EXISTS `role_has_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permisos` (
  `idrole` int(10) unsigned NOT NULL,
  `idpermisos` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idrole`,`idpermisos`),
  KEY `fk_role_has_permisos_permisos1_idx` (`idpermisos`),
  KEY `fk_role_has_permisos_role1_idx` (`idrole`),
  CONSTRAINT `fk_role_has_permisos_permisos1` FOREIGN KEY (`idpermisos`) REFERENCES `permisos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_has_permisos_role1` FOREIGN KEY (`idrole`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permisos`
--

LOCK TABLES `role_has_permisos` WRITE;
/*!40000 ALTER TABLE `role_has_permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede_formacion`
--

DROP TABLE IF EXISTS `sede_formacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sede_formacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `idcentro_formacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sede_formacion_centro_formacion1_idx` (`idcentro_formacion`),
  CONSTRAINT `fk_sede_formacion_centro_formacion1` FOREIGN KEY (`idcentro_formacion`) REFERENCES `centro_formacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede_formacion`
--

LOCK TABLES `sede_formacion` WRITE;
/*!40000 ALTER TABLE `sede_formacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `sede_formacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas`
--

DROP TABLE IF EXISTS `temas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `idareas_conocimiento` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_temas_areas_conocimiento1_idx` (`idareas_conocimiento`),
  CONSTRAINT `fk_temas_areas_conocimiento1` FOREIGN KEY (`idareas_conocimiento`) REFERENCES `areas_conocimiento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas`
--

LOCK TABLES `temas` WRITE;
/*!40000 ALTER TABLE `temas` DISABLE KEYS */;
/*!40000 ALTER TABLE `temas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_estado`
--

DROP TABLE IF EXISTS `tipo_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_estado`
--

LOCK TABLES `tipo_estado` WRITE;
/*!40000 ALTER TABLE `tipo_estado` DISABLE KEYS */;
INSERT INTO `tipo_estado` VALUES (1,'BASICO');
/*!40000 ALTER TABLE `tipo_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pregunta`
--

DROP TABLE IF EXISTS `tipo_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pregunta`
--

LOCK TABLES `tipo_pregunta` WRITE;
/*!40000 ALTER TABLE `tipo_pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clave` varchar(45) NOT NULL,
  `idpersona` int(10) unsigned NOT NULL,
  `idrole` int(10) unsigned NOT NULL,
  `idestado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_persona_idx` (`idpersona`),
  KEY `fk_usuario_role1_idx` (`idrole`),
  KEY `fk_usuario_estado1_idx` (`idestado`),
  CONSTRAINT `fk_usuario_estado1` FOREIGN KEY (`idestado`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_persona` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_role1` FOREIGN KEY (`idrole`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'1234',1,1,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'selp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-17 18:52:49
