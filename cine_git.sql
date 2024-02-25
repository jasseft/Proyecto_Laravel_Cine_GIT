CREATE DATABASE  IF NOT EXISTS `cine_git` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `cine_git`;
-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: cine_git
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cat_generos`
--

DROP TABLE IF EXISTS `tbl_cat_generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cat_generos` (
  `GeneroId` int(11) NOT NULL AUTO_INCREMENT,
  `Genero_Nombre` varchar(45) NOT NULL,
  `Genero_Status` int(11) NOT NULL,
  PRIMARY KEY (`GeneroId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cat_generos`
--

LOCK TABLES `tbl_cat_generos` WRITE;
/*!40000 ALTER TABLE `tbl_cat_generos` DISABLE KEYS */;
INSERT INTO `tbl_cat_generos` VALUES (1,'Acción',1),(2,'Comedia',1),(3,'Drama',1),(4,'Terror',1),(5,'Ciencia ficción',1);
/*!40000 ALTER TABLE `tbl_cat_generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cat_idiomas`
--

DROP TABLE IF EXISTS `tbl_cat_idiomas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cat_idiomas` (
  `IdiomaId` int(11) NOT NULL AUTO_INCREMENT,
  `Idioma_Nombre` varchar(45) NOT NULL,
  `Idioma_Status` int(11) NOT NULL,
  PRIMARY KEY (`IdiomaId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cat_idiomas`
--

LOCK TABLES `tbl_cat_idiomas` WRITE;
/*!40000 ALTER TABLE `tbl_cat_idiomas` DISABLE KEYS */;
INSERT INTO `tbl_cat_idiomas` VALUES (1,'Inglés',1),(2,'Español',1),(3,'Francés',1),(4,'Alemán',1),(5,'Italiano',1);
/*!40000 ALTER TABLE `tbl_cat_idiomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ope_venta`
--

DROP TABLE IF EXISTS `tbl_ope_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ope_venta` (
  `VentaId` int(11) NOT NULL AUTO_INCREMENT,
  `Pelicula_Id` int(11) NOT NULL,
  `Idioma_Id` int(11) NOT NULL,
  `Genero_Id` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Ganancias` decimal(10,0) NOT NULL,
  `Venta_Status` int(11) NOT NULL,
  PRIMARY KEY (`VentaId`),
  KEY `Pelicula_Id_idx` (`Pelicula_Id`),
  KEY `Idioma_Id_idx` (`Idioma_Id`),
  KEY `Genero_Id_idx` (`Genero_Id`),
  CONSTRAINT `Genero_Id` FOREIGN KEY (`Genero_Id`) REFERENCES `tbl_cat_generos` (`GeneroId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Idioma_Id` FOREIGN KEY (`Idioma_Id`) REFERENCES `tbl_cat_idiomas` (`IdiomaId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Pelicula_Id` FOREIGN KEY (`Pelicula_Id`) REFERENCES `tbl_peliculas` (`PeliculaId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ope_venta`
--

LOCK TABLES `tbl_ope_venta` WRITE;
/*!40000 ALTER TABLE `tbl_ope_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ope_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_peliculas`
--

DROP TABLE IF EXISTS `tbl_peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_peliculas` (
  `PeliculaId` int(11) NOT NULL AUTO_INCREMENT,
  `Pelicula_Nombre` varchar(45) NOT NULL,
  `Pelicula_GeneroId` int(11) NOT NULL,
  `Pelicula_IdiomaId` int(11) NOT NULL,
  `Pelicula_Precio` decimal(10,0) NOT NULL,
  `Pelicula_Year` int(11) NOT NULL,
  `Pelicula_Cantidad` int(11) NOT NULL,
  `Pelicula_Imagen` varchar(255) NOT NULL,
  `Pelicula_Status` int(11) NOT NULL,
  PRIMARY KEY (`PeliculaId`),
  KEY `Pelicula_GeneroId_idx` (`Pelicula_GeneroId`),
  KEY `Pelicula_IdiomaId_idx` (`Pelicula_IdiomaId`),
  CONSTRAINT `Pelicula_GeneroId` FOREIGN KEY (`Pelicula_GeneroId`) REFERENCES `tbl_cat_generos` (`GeneroId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Pelicula_IdiomaId` FOREIGN KEY (`Pelicula_IdiomaId`) REFERENCES `tbl_cat_idiomas` (`IdiomaId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_peliculas`
--

LOCK TABLES `tbl_peliculas` WRITE;
/*!40000 ALTER TABLE `tbl_peliculas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cine_git'
--

--
-- Dumping routines for database 'cine_git'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `disablePelicula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`jason`@`%` PROCEDURE `disablePelicula`(
    IN _pelicula_id INT
)
BEGIN
    UPDATE tbl_peliculas
    SET Pelicula_Status = 0
    WHERE PeliculaId = _pelicula_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `enablePelicula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`jason`@`%` PROCEDURE `enablePelicula`(
    IN _pelicula_id INT
)
BEGIN
    UPDATE tbl_peliculas
    SET Pelicula_Status = 1
    WHERE PeliculaId = _pelicula_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllGeneros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`jason`@`%` PROCEDURE `getAllGeneros`()
BEGIN
	SELECT *FROM tbl_cat_generos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllIdiomas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`jason`@`%` PROCEDURE `getAllIdiomas`()
BEGIN
	SELECT *FROM tbl_cat_idiomas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllPeliculas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`jason`@`%` PROCEDURE `getAllPeliculas`()
BEGIN
	SELECT p.PeliculaId,
           p.Pelicula_Nombre,
           g.Genero_Nombre AS Genero,
           i.Idioma_Nombre AS Idioma,
           p.Pelicula_Precio,
           p.Pelicula_Year,
           p.Pelicula_Cantidad,
           p.Pelicula_Imagen,
           p.Pelicula_Status
    FROM tbl_peliculas p
    INNER JOIN tbl_cat_generos g ON p.Pelicula_GeneroId = g.GeneroId
    INNER JOIN tbl_cat_idiomas i ON p.Pelicula_IdiomaId = i.IdiomaId
    WHERE p.Pelicula_Status = 1 ORDER BY p.PeliculaId ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllVentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`jason`@`%` PROCEDURE `getAllVentas`()
BEGIN
    SELECT v.VentaId,
           p.Pelicula_Nombre,
           g.Genero_Nombre AS Genero,
           i.Idioma_Nombre AS Idioma,
           v.Cantidad,
           v.Ganancias,
           v.Venta_Status
    FROM tbl_ope_venta v
    INNER JOIN tbl_peliculas p ON v.Pelicula_Id = p.PeliculaId
    INNER JOIN tbl_cat_generos g ON p.Pelicula_GeneroId = g.GeneroId
    INNER JOIN tbl_cat_idiomas i ON p.Pelicula_IdiomaId = i.IdiomaId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertGenero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`jason`@`%` PROCEDURE `insertGenero`(IN _genero_nombre VARCHAR(255))
BEGIN
	INSERT INTO tbl_cat_generos VALUES(NULL, _genero_nombre, 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertIdioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`jason`@`%` PROCEDURE `insertIdioma`(IN _idioma_nombre VARCHAR(255))
BEGIN
	INSERT INTO tbl_cat_idiomas VALUES(NULL, _idioma_nombre, 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertPelicula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`jason`@`%` PROCEDURE `insertPelicula`(
    IN _pelicula_nombre VARCHAR(255),
    IN _pelicula_genero_id INT,
    IN _pelicula_idioma_id INT,
    IN _pelicula_precio DECIMAL,
    IN _pelicula_year INT,
    IN _pelicula_cantidad INT,
    IN _pelicula_imagen VARCHAR(255)
)
BEGIN
    IF _pelicula_precio >= 0 AND _pelicula_year >= 0 AND _pelicula_cantidad >= 0 THEN
        INSERT INTO tbl_peliculas (Pelicula_Nombre, Pelicula_GeneroId, Pelicula_IdiomaId, Pelicula_Precio, Pelicula_Year, Pelicula_Cantidad, Pelicula_Imagen, Pelicula_Status)
        VALUES (_pelicula_nombre, _pelicula_genero_id, _pelicula_idioma_id, _pelicula_precio, _pelicula_year, _pelicula_cantidad, _pelicula_imagen, 1);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pueden ingresar valores negativos.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `realizarVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`jason`@`%` PROCEDURE `realizarVenta`(
    IN _peliculaId INT,
    IN _cantidad INT
)
BEGIN
    DECLARE cantidadStock INT;
    DECLARE precioUnitario DECIMAL(10, 2);
    DECLARE precioTotal DECIMAL(10, 2);
    DECLARE idiomaId INT;
    DECLARE generoId INT;
    DECLARE mensaje VARCHAR(255);
    
    IF _cantidad < 0 THEN
        SET mensaje = '¡Error! La cantidad no puede ser negativa.';
	ELSE
        -- SET mensaje = 'ENTRÉ';
        -- Verificar si la película existe y obtener su información
		SELECT Pelicula_Cantidad, Pelicula_Precio, Pelicula_IdiomaId, Pelicula_GeneroId INTO cantidadStock, precioUnitario, idiomaId, generoId
		FROM tbl_peliculas WHERE PeliculaId = _peliculaId;

		IF cantidadStock IS NOT NULL THEN
			IF cantidadStock >= _cantidad THEN
				-- Calcular el precio total
				SET precioTotal = precioUnitario * _cantidad;

				-- Actualizar el stock de la película
				UPDATE tbl_peliculas SET Pelicula_Cantidad = Pelicula_Cantidad - _cantidad WHERE PeliculaId = _peliculaId;

				-- Insertar la venta en tbl_ope_venta
				INSERT INTO tbl_ope_venta (Pelicula_Id, Idioma_Id, Genero_Id, Cantidad, Ganancias, Venta_Status)
				VALUES (_peliculaId, idiomaId, generoId, _cantidad, precioTotal, 1);
				
				-- Si el stock llega a 0, actualizar el estado de la película
				IF cantidadStock - _cantidad = 0 THEN
					UPDATE tbl_peliculas SET Pelicula_Status = 0 WHERE PeliculaId = _peliculaId;
				END IF;

				SET mensaje = 'Venta realizada exitosamente.';
			ELSE
				SET mensaje = '¡Error! Stock insuficiente para realizar la venta.';
			END IF;
		ELSE
			SET mensaje = '¡Error! La película no existe.';
		END IF;
    END IF;

    SELECT mensaje AS 'Mensaje';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `selectPelicula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`jason`@`%` PROCEDURE `selectPelicula`(IN _pelicula_id INT)
BEGIN
	SELECT p.PeliculaId,
           p.Pelicula_Nombre,
           g.Genero_Nombre AS Genero,
           i.Idioma_Nombre AS Idioma,
           p.Pelicula_Precio,
           p.Pelicula_Year,
           p.Pelicula_Cantidad,
           p.Pelicula_Imagen,
           p.Pelicula_Status
    FROM tbl_peliculas p
    INNER JOIN tbl_cat_generos g ON p.Pelicula_GeneroId = g.GeneroId
    INNER JOIN tbl_cat_idiomas i ON p.Pelicula_IdiomaId = i.IdiomaId
    WHERE p.PeliculaId = _pelicula_id AND p.Pelicula_Status = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updatePelicula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`jason`@`%` PROCEDURE `updatePelicula`(
    IN _pelicula_id INT,
    IN _pelicula_nombre VARCHAR(255),
    IN _pelicula_genero_id INT,
    IN _pelicula_idioma_id INT,
    IN _pelicula_precio DECIMAL,
    IN _pelicula_year INT,
    IN _pelicula_cantidad INT,
    IN _pelicula_imagen VARCHAR(255)
)
BEGIN
    IF _pelicula_precio >= 0 AND _pelicula_year >= 0 AND _pelicula_cantidad >= 0 THEN
        UPDATE tbl_peliculas
        SET Pelicula_Nombre = _pelicula_nombre,
            Pelicula_GeneroId = _pelicula_genero_id,
            Pelicula_IdiomaId = _pelicula_idioma_id,
            Pelicula_Precio = _pelicula_precio,
            Pelicula_Year = _pelicula_year,
            Pelicula_Cantidad = _pelicula_cantidad,
            Pelicula_Imagen = _pelicula_imagen
        WHERE PeliculaId = _pelicula_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pueden ingresar valores negativos.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-24 18:15:59
