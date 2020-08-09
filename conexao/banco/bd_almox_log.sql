-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Ago-2020 às 05:57
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `status_admin` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `transporte_entrada_produto` varchar(100) NOT NULL DEFAULT '-',
  `id_fornecedor` int(11) NOT NULL,
  `id_lote_produto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_entrada_produto`),
  KEY `id_fornecedor_fk` (`id_fornecedor`),
  KEY `id_usuario_fk` (`id_usuario`),
  KEY `id_lote_produto_fk` (`id_lote_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cw_fornecedor`
--

DROP TABLE IF EXISTS `cw_fornecedor`;
CREATE TABLE IF NOT EXISTS `cw_fornecedor` (
  `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fornecedor` varchar(100) NOT NULL,
  `endereco_fornecedor` varchar(500) NOT NULL,
  `telefone_fornecedor` varchar(20) DEFAULT '-',
  `celular_fornecedor` varchar(20) DEFAULT '-',
  `email_fornecedor` varchar(50) DEFAULT '-',
  `cnpj_fornecedor` varchar(20) NOT NULL,
  PRIMARY KEY (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cw_lote_produto`
--

DROP TABLE IF EXISTS `cw_lote_produto`;
CREATE TABLE IF NOT EXISTS `cw_lote_produto` (
  `id_lote_produto` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `lote_produto` varchar(30) NOT NULL,
  `fabricacao_produto` varchar(10) NOT NULL,
  `validade_produto` varchar(10) NOT NULL,
  `apresentacao_produto` varchar(30) NOT NULL,
  PRIMARY KEY (`id_lote_produto`),
  KEY `id_produto_fk` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cw_produto`
--

DROP TABLE IF EXISTS `cw_produto`;
CREATE TABLE IF NOT EXISTS `cw_produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(100) NOT NULL,
  `em_estoque` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id_tipo_pedido` int(11) NOT NULL,
  `transporte_saida_produto` varchar(100) NOT NULL DEFAULT '-',
  `id_cliente` int(11) NOT NULL,
  `id_lote_produto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_saida_produto`),
  KEY `id_cliente_fk` (`id_cliente`),
  KEY `id_usuario_fk2` (`id_usuario`),
  KEY `id_tipo_pedido_fk` (`id_tipo_pedido`),
  KEY `id_lote_produto_fk2` (`id_lote_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cw_tipo_pedido`
--

DROP TABLE IF EXISTS `cw_tipo_pedido`;
CREATE TABLE IF NOT EXISTS `cw_tipo_pedido` (
  `id_tipo_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_pedido` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `nivel_usuario` enum('1','2','3') NOT NULL DEFAULT '3' COMMENT 'Nível 1 - Todos os Privilégios, 2 - Não exclui registros e não altera estoque, 3 - Só observa estoque.',
  `status_usuario` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `estoque`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `estoque`;
CREATE TABLE IF NOT EXISTS `estoque` (
`id_produto` int(11)
,`produto` varchar(100)
,`em_estoque` enum('0','1')
,`id_lote` int(11)
,`lote` varchar(30)
,`dtf` varchar(10)
,`dtv` varchar(10)
,`ap` varchar(30)
,`total_entrada` decimal(32,0)
,`total_saida` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `estoque_final`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `estoque_final`;
CREATE TABLE IF NOT EXISTS `estoque_final` (
`id_produto` int(11)
,`produto` varchar(100)
,`em_estoque` enum('0','1')
,`total_entrada` decimal(54,0)
,`total_saida` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `rastreamento_entrada`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `rastreamento_entrada`;
CREATE TABLE IF NOT EXISTS `rastreamento_entrada` (
`id_produto` int(11)
,`produto` varchar(100)
,`id_lote` int(11)
,`lote` varchar(30)
,`dtf` varchar(10)
,`dtv` varchar(10)
,`ap` varchar(30)
,`id_entrada` int(11)
,`dtent` varchar(10)
,`nota` varchar(50)
,`quant_ent` int(11)
,`transp` varchar(100)
,`id_fornecedor` int(11)
,`fornecedor` varchar(100)
,`cnpj_fornecedor` varchar(20)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `rastreamento_saida`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `rastreamento_saida`;
CREATE TABLE IF NOT EXISTS `rastreamento_saida` (
`id_produto` int(11)
,`produto` varchar(100)
,`id_lote` int(11)
,`lote` varchar(30)
,`dtf` varchar(10)
,`dtv` varchar(10)
,`ap` varchar(30)
,`id_saida` int(11)
,`dtsai` varchar(10)
,`guia` varchar(20)
,`quant_sai` int(11)
,`transp_sai` varchar(100)
,`id_cliente` int(11)
,`cliente` varchar(100)
,`id_tipo_pedido` int(11)
,`tipo_pedido` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `total_entrada_lote_produto`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `total_entrada_lote_produto`;
CREATE TABLE IF NOT EXISTS `total_entrada_lote_produto` (
`id_produto` int(11)
,`id_lote_produto` int(11)
,`id_entrada_produto` int(11)
,`total_entrada` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `total_saida_lote_produto`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `total_saida_lote_produto`;
CREATE TABLE IF NOT EXISTS `total_saida_lote_produto` (
`id_produto` int(11)
,`id_lote_produto` int(11)
,`id_saida_produto` int(11)
,`total_saida` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estrutura para vista `estoque`
--
DROP TABLE IF EXISTS `estoque`;

DROP VIEW IF EXISTS `estoque`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `estoque`  AS  select `p`.`id_produto` AS `id_produto`,`p`.`nome_produto` AS `produto`,`p`.`em_estoque` AS `em_estoque`,`lp`.`id_lote_produto` AS `id_lote`,`lp`.`lote_produto` AS `lote`,date_format(`lp`.`fabricacao_produto`,'%d/%m/%Y') AS `dtf`,date_format(`lp`.`validade_produto`,'%d/%m/%Y') AS `dtv`,`lp`.`apresentacao_produto` AS `ap`,`tep`.`total_entrada` AS `total_entrada`,`tsp`.`total_saida` AS `total_saida` from (((`cw_produto` `p` join `cw_lote_produto` `lp` on(`p`.`id_produto` = `lp`.`id_produto`)) left join `total_entrada_lote_produto` `tep` on(`lp`.`id_lote_produto` = `tep`.`id_lote_produto`)) left join `total_saida_lote_produto` `tsp` on(`lp`.`id_lote_produto` = `tsp`.`id_lote_produto`)) group by `lp`.`lote_produto` order by `p`.`id_produto` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `estoque_final`
--
DROP TABLE IF EXISTS `estoque_final`;

DROP VIEW IF EXISTS `estoque_final`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `estoque_final`  AS  select `e`.`id_produto` AS `id_produto`,`e`.`produto` AS `produto`,`e`.`em_estoque` AS `em_estoque`,sum(`e`.`total_entrada`) AS `total_entrada`,sum(`e`.`total_saida`) AS `total_saida` from `estoque` `e` group by `e`.`id_produto` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `rastreamento_entrada`
--
DROP TABLE IF EXISTS `rastreamento_entrada`;

DROP VIEW IF EXISTS `rastreamento_entrada`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rastreamento_entrada`  AS  select `p`.`id_produto` AS `id_produto`,`p`.`nome_produto` AS `produto`,`lp`.`id_lote_produto` AS `id_lote`,`lp`.`lote_produto` AS `lote`,date_format(`lp`.`fabricacao_produto`,'%d/%m/%Y') AS `dtf`,date_format(`lp`.`validade_produto`,'%d/%m/%Y') AS `dtv`,`lp`.`apresentacao_produto` AS `ap`,`ep`.`id_entrada_produto` AS `id_entrada`,date_format(`ep`.`data_entrada_produto`,'%d/%m/%Y') AS `dtent`,`ep`.`nota_fiscal_entrada_produto` AS `nota`,`ep`.`quantidade_entrada_produto` AS `quant_ent`,`ep`.`transporte_entrada_produto` AS `transp`,`f`.`id_fornecedor` AS `id_fornecedor`,`f`.`nome_fornecedor` AS `fornecedor`,`f`.`cnpj_fornecedor` AS `cnpj_fornecedor` from (((`cw_produto` `p` join `cw_lote_produto` `lp` on(`p`.`id_produto` = `lp`.`id_produto`)) join `cw_entrada_produto` `ep` on(`lp`.`id_lote_produto` = `ep`.`id_lote_produto`)) join `cw_fornecedor` `f` on(`ep`.`id_fornecedor` = `f`.`id_fornecedor`)) order by `lp`.`id_lote_produto` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `rastreamento_saida`
--
DROP TABLE IF EXISTS `rastreamento_saida`;

DROP VIEW IF EXISTS `rastreamento_saida`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rastreamento_saida`  AS  select `p`.`id_produto` AS `id_produto`,`p`.`nome_produto` AS `produto`,`lp`.`id_lote_produto` AS `id_lote`,`lp`.`lote_produto` AS `lote`,date_format(`lp`.`fabricacao_produto`,'%d/%m/%Y') AS `dtf`,date_format(`lp`.`validade_produto`,'%d/%m/%Y') AS `dtv`,`lp`.`apresentacao_produto` AS `ap`,`sp`.`id_saida_produto` AS `id_saida`,date_format(`sp`.`data_saida_produto`,'%d/%m/%Y') AS `dtsai`,`sp`.`guia_saida_produto` AS `guia`,`sp`.`quantidade_saida_produto` AS `quant_sai`,`sp`.`transporte_saida_produto` AS `transp_sai`,`c`.`id_cliente` AS `id_cliente`,`c`.`nome_cliente` AS `cliente`,`tp`.`id_tipo_pedido` AS `id_tipo_pedido`,`tp`.`tipo_pedido` AS `tipo_pedido` from ((((`cw_produto` `p` join `cw_lote_produto` `lp` on(`p`.`id_produto` = `lp`.`id_produto`)) join `cw_saida_produto` `sp` on(`lp`.`id_lote_produto` = `sp`.`id_lote_produto`)) join `cw_cliente` `c` on(`sp`.`id_cliente` = `c`.`id_cliente`)) join `cw_tipo_pedido` `tp` on(`sp`.`id_tipo_pedido` = `tp`.`id_tipo_pedido`)) order by `lp`.`id_lote_produto` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `total_entrada_lote_produto`
--
DROP TABLE IF EXISTS `total_entrada_lote_produto`;

DROP VIEW IF EXISTS `total_entrada_lote_produto`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_entrada_lote_produto`  AS  select `p`.`id_produto` AS `id_produto`,`lp`.`id_lote_produto` AS `id_lote_produto`,`ep`.`id_entrada_produto` AS `id_entrada_produto`,sum(`ep`.`quantidade_entrada_produto`) AS `total_entrada` from ((`cw_produto` `p` join `cw_lote_produto` `lp` on(`p`.`id_produto` = `lp`.`id_produto`)) left join `cw_entrada_produto` `ep` on(`lp`.`id_lote_produto` = `ep`.`id_lote_produto`)) group by `lp`.`lote_produto` order by `p`.`id_produto` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `total_saida_lote_produto`
--
DROP TABLE IF EXISTS `total_saida_lote_produto`;

DROP VIEW IF EXISTS `total_saida_lote_produto`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_saida_lote_produto`  AS  select `p`.`id_produto` AS `id_produto`,`lp`.`id_lote_produto` AS `id_lote_produto`,`sp`.`id_saida_produto` AS `id_saida_produto`,sum(`sp`.`quantidade_saida_produto`) AS `total_saida` from ((`cw_produto` `p` join `cw_lote_produto` `lp` on(`p`.`id_produto` = `lp`.`id_produto`)) left join `cw_saida_produto` `sp` on(`lp`.`id_lote_produto` = `sp`.`id_lote_produto`)) group by `lp`.`lote_produto` order by `p`.`id_produto` ;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cw_entrada_produto`
--
ALTER TABLE `cw_entrada_produto`
  ADD CONSTRAINT `id_fornecedor_fk` FOREIGN KEY (`id_fornecedor`) REFERENCES `cw_fornecedor` (`id_fornecedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_lote_produto_fk` FOREIGN KEY (`id_lote_produto`) REFERENCES `cw_lote_produto` (`id_lote_produto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_usuario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `cw_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `cw_lote_produto`
--
ALTER TABLE `cw_lote_produto`
  ADD CONSTRAINT `id_produto_fk` FOREIGN KEY (`id_produto`) REFERENCES `cw_produto` (`id_produto`);

--
-- Limitadores para a tabela `cw_saida_produto`
--
ALTER TABLE `cw_saida_produto`
  ADD CONSTRAINT `id_cliente_fk` FOREIGN KEY (`id_cliente`) REFERENCES `cw_cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_lote_produto_fk2` FOREIGN KEY (`id_lote_produto`) REFERENCES `cw_lote_produto` (`id_lote_produto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_tipo_pedido_fk` FOREIGN KEY (`id_tipo_pedido`) REFERENCES `cw_tipo_pedido` (`id_tipo_pedido`) ON DELETE CASCADE,
  ADD CONSTRAINT `id_usuario_fk2` FOREIGN KEY (`id_usuario`) REFERENCES `cw_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
