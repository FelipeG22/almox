-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Jul-2020 às 21:27
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_almox_log`
--
CREATE DATABASE IF NOT EXISTS `bd_almox_log` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bd_almox_log`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cw_admin`
--

DROP TABLE IF EXISTS `cw_admin`;
CREATE TABLE IF NOT EXISTS `cw_admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `nome_completo_admin` varchar(100) NOT NULL,
  `apelido_admin` varchar(20) NOT NULL,
  `login_admin` varchar(11) NOT NULL,
  `senha_admin` varchar(32) NOT NULL,
  `status_admin` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cw_admin`
--

INSERT INTO `cw_admin` (`id_admin`, `nome_completo_admin`, `apelido_admin`, `login_admin`, `senha_admin`, `status_admin`) VALUES
(1, 'Felipe Gonçalves de Marins', 'Gonçalves', '17351807779', '475f588ac132ac035b9c45cb0d724556', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cw_cliente`
--

DROP TABLE IF EXISTS `cw_cliente`;
CREATE TABLE IF NOT EXISTS `cw_cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(100) NOT NULL,
  `endereco_cliente` varchar(500) NOT NULL,
  `telefone_cliente` varchar(20) NOT NULL,
  `celular_cliente` varchar(20) NOT NULL,
  `email_cliente` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cw_cliente`
--

INSERT INTO `cw_cliente` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `telefone_cliente`, `celular_cliente`, `email_cliente`) VALUES
(2, 'Fundo Estadual de Saúde - CEADIS - SAF', '', '', '', ''),
(3, 'Secretaria Estadual de Minas Gerais', '', '', '', ''),
(4, 'Centro de Medicamentos do Paraná', '', '', '', ''),
(5, 'Fundo Estadual de Saúde de Santa Catarina', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cw_entrada_produto`
--

DROP TABLE IF EXISTS `cw_entrada_produto`;
CREATE TABLE IF NOT EXISTS `cw_entrada_produto` (
  `id_entrada_produto` int(11) NOT NULL AUTO_INCREMENT,
  `data_entrada_produto` varchar(20) NOT NULL,
  `nota_fiscal_entrada_produto` varchar(50) NOT NULL,
  `quantidade_entrada_produto` int(11) NOT NULL,
  `transporte_entrada_produto` varchar(100) NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_entrada_produto`),
  KEY `id_fornecedor_fk` (`id_fornecedor`),
  KEY `id_produto_fk` (`id_produto`),
  KEY `id_usuario_fk` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cw_entrada_produto`
--

INSERT INTO `cw_entrada_produto` (`id_entrada_produto`, `data_entrada_produto`, `nota_fiscal_entrada_produto`, `quantidade_entrada_produto`, `transporte_entrada_produto`, `id_fornecedor`, `id_produto`, `id_usuario`) VALUES
(21, '2017-06-08', 'DANFE 1126941', 200000, '', 2, 4, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cw_fornecedor`
--

DROP TABLE IF EXISTS `cw_fornecedor`;
CREATE TABLE IF NOT EXISTS `cw_fornecedor` (
  `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fornecedor` varchar(100) NOT NULL,
  `endereco_fornecedor` varchar(500) NOT NULL,
  `telefone_fornecedor` varchar(20) DEFAULT NULL,
  `celular_fornecedor` varchar(20) DEFAULT NULL,
  `email_fornecedor` varchar(50) DEFAULT NULL,
  `cnpj_fornecedor` varchar(20) NOT NULL,
  PRIMARY KEY (`id_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cw_fornecedor`
--

INSERT INTO `cw_fornecedor` (`id_fornecedor`, `nome_fornecedor`, `endereco_fornecedor`, `telefone_fornecedor`, `celular_fornecedor`, `email_fornecedor`, `cnpj_fornecedor`) VALUES
(2, 'EMS S/A', 'RUA JORNALISTA FRANCISCO AG S/N KM 08 CHACARÁ ASSAY - HORTOLANDIA - SP.', '', '', '', '575.073.78/003-65');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cw_produto`
--

DROP TABLE IF EXISTS `cw_produto`;
CREATE TABLE IF NOT EXISTS `cw_produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(100) NOT NULL,
  `lote_produto` varchar(30) NOT NULL,
  `fabricacao_produto` varchar(10) NOT NULL,
  `validade_produto` varchar(10) NOT NULL,
  `apresentacao_produto` varchar(30) NOT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cw_produto`
--

INSERT INTO `cw_produto` (`id_produto`, `nome_produto`, `lote_produto`, `fabricacao_produto`, `validade_produto`, `apresentacao_produto`) VALUES
(4, 'MICOFENOLATO DE SÓDIO 360mg', '952746', '2020-06-25', '2020-06-25', 'Cx c/ 120comp'),
(5, 'MICOFENOLATO DE SÓDIO 180mg', '952747', '2020-06-26', '2020-06-26', 'Cx c/ 120comp');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cw_saida_produto`
--

DROP TABLE IF EXISTS `cw_saida_produto`;
CREATE TABLE IF NOT EXISTS `cw_saida_produto` (
  `id_saida_produto` int(11) NOT NULL AUTO_INCREMENT,
  `data_saida_produto` varchar(20) NOT NULL,
  `guia_saida_produto` varchar(20) NOT NULL,
  `quantidade_saida_produto` int(11) NOT NULL,
  `transporte_saida_produto` varchar(100) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_saida_produto`),
  KEY `id_cliente_fk` (`id_cliente`),
  KEY `id_produto_fk2` (`id_produto`),
  KEY `id_usuario_fk2` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cw_usuario`
--

DROP TABLE IF EXISTS `cw_usuario`;
CREATE TABLE IF NOT EXISTS `cw_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome_completo_usuario` varchar(100) NOT NULL,
  `apelido_usuario` varchar(50) NOT NULL,
  `login_usuario` varchar(11) NOT NULL,
  `senha_usuario` varchar(32) NOT NULL,
  `status_usuario` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cw_usuario`
--

INSERT INTO `cw_usuario` (`id_usuario`, `nome_completo_usuario`, `apelido_usuario`, `login_usuario`, `senha_usuario`, `status_usuario`) VALUES
(1, 'Felipe Gonçalves de Marins', 'Gonçalves', '0108072174', '0108072174', '1');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cw_entrada_produto`
--
ALTER TABLE `cw_entrada_produto`
  ADD CONSTRAINT `id_fornecedor_fk` FOREIGN KEY (`id_fornecedor`) REFERENCES `cw_fornecedor` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `id_produto_fk` FOREIGN KEY (`id_produto`) REFERENCES `cw_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `id_usuario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `cw_usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limitadores para a tabela `cw_saida_produto`
--
ALTER TABLE `cw_saida_produto`
  ADD CONSTRAINT `id_cliente_fk` FOREIGN KEY (`id_cliente`) REFERENCES `cw_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `id_produto_fk2` FOREIGN KEY (`id_produto`) REFERENCES `cw_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `id_usuario_fk2` FOREIGN KEY (`id_usuario`) REFERENCES `cw_usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
