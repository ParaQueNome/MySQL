-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.13-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para aulag
CREATE DATABASE IF NOT EXISTS `aulag` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `aulag`;

-- Copiando estrutura para tabela aulag.filho
CREATE TABLE IF NOT EXISTS `filho` (
  `id_filho` smallint(6) NOT NULL AUTO_INCREMENT,
  `nome_filho` varchar(50) DEFAULT NULL,
  `id_pai` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_filho`),
  KEY `fk_id_pai` (`id_pai`),
  CONSTRAINT `fk_id_pai` FOREIGN KEY (`id_pai`) REFERENCES `pai` (`id_pai`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela aulag.filho: ~1 rows (aproximadamente)
INSERT INTO `filho` (`id_filho`, `nome_filho`, `id_pai`) VALUES
	(1, 'Joao FIlho', 1);

-- Copiando estrutura para tabela aulag.pai
CREATE TABLE IF NOT EXISTS `pai` (
  `id_pai` smallint(6) NOT NULL,
  `nome_pai` varchar(50) DEFAULT NULL,
  `cpf` varchar(15) NOT NULL,
  PRIMARY KEY (`id_pai`),
  UNIQUE KEY `unk_pai` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela aulag.pai: ~2 rows (aproximadamente)
INSERT INTO `pai` (`id_pai`, `nome_pai`, `cpf`) VALUES
	(1, 'Jonas', ''),
	(2, 'Pedro', '123.256.854-00');

-- Copiando estrutura para tabela aulag.t1
CREATE TABLE IF NOT EXISTS `t1` (
  `a` int(11) DEFAULT NULL CHECK (`a` > 2),
  `b` int(11) DEFAULT NULL CHECK (`b` > 2),
  CONSTRAINT `a_greater` CHECK (`a` > `b`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela aulag.t1: ~1 rows (aproximadamente)
INSERT INTO `t1` (`a`, `b`) VALUES
	(5, 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
