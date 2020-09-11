-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Set-2020 às 13:47
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
  `status_admin` enum('0','1') NOT NULL DEFAULT '1',
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
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cw_cliente`
--

INSERT INTO `cw_cliente` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `telefone_cliente`, `celular_cliente`, `email_cliente`) VALUES
(2, 'FUNDO ESTADUAL DE SAÚDE - CEADIS - SAF - MT', 'AV GONÇALO ANTUNES DE BARROS Nº 3366 CUIABÁ - MATO GROSSO CEP 78058-743\r\nRESPONSÁVEL - MOACYR / MAYKSON\r\nOBS: AGENDAR SOMENTE TERMOLÁBEIS', '(65) 3653-6306', '(65) 98433-0357', ''),
(3, 'SECRETARIA DE ESTADO DE SAÚDE DE MINAS GERAIS', 'RUA SIMÃO ANTONIO Nº 149 CINCÃO - CONTAGEM CEP 32371-610\r\nRESPONSÁVEL: HELENICE MATOSO DE OLIVEIRA\r\nOBS: NECESSÁRIO AGENDAR', '(31) 3356-3301', '', 'carlos.paixao@saude.mg.gov.br'),
(4, 'CENTRO DE MEDICAMENTOS DO PARANÁ', 'AV PREFEITO LOTHÁRIO MEISSNER Nº 350 JARDIM BOTÂNICO/ CURITIBA\r\nRESPONSÁVEL: ELIANE LEMLER SEMICEK\r\nOBS: NECESSÁRIO AGENDAR', '(41) 3360-6729', '', 'cemepar.almoxarifado@sesa.pr.gov.br'),
(5, 'FUNDO ESTADUAL DE SAÚDE DE SANTA CATARINA', 'RUA JUDITE MELO DOS SANTOS Nº 251 - GALPÕES 6 A 9 - DISTRITO INDUSTRIAL - SÃO JOSÉ\r\nRESPONSÁVEL: AERTON PEREIRA \r\nOBS: NÃO NECESSITA AGENDAMENTO', '(48) 3665-4428', '', ''),
(6, 'CONTROLE DE QUALIDADE - LQFEX', '', '', '', ''),
(7, 'SEÇÃO DE SAÚDE - LQFEX', '', '', '', ''),
(9, 'SECRETARIA DE ESTADO DE SAÚDE DE ALAGOAS', 'RUA OLDEMBURGO DA SILVA PARANHOS Nº 830 FAROL/ MACEIÓ\r\nRESPONSÁVEL: ANGELA SOUZA BRANDÃO\r\nOBS: NECESSÁRIO AGENDAR\r\n\r\n', '(82) 3315-2806', '(82) 99639-3338', 'daf.estrategicos@gmail.com'),
(10, 'CENTRAL DE ARMAZENAGEM DE INSUMOS ESTRATÉGICOS PARA SAÚDE', 'RUA JAMIL JOÃO ZARIF Nº 684 - UNIDADE 11 - JARDIM SANTA VICÊNCIA - TABOÃO - GUARULHOS  CEP 07143-000\r\n\r\nOBS: NECESSÁRIO AGENDAR', '(61) 2106-6315', '', 'cglog.agendamento@saude.gov.br'),
(11, 'Central de Medicamentos da Secretaria de Estado do AM', 'Rua Duque de Caxias, 1998 - CEP: 69020-141 - Praça 14 de janeiro / Manaus. Ao lado do 1º DIP.', '(92) 3131-2800', '', 'aline.barros@saude.am.gov.br'),
(12, 'Coordenadoria de Assistência Farmacêutica - AP', 'Rodovia BR 156, KM - 0, nº 353 - CEP: 68.908-575 - São Lázaro / Macapa.', '', '(96) 99152-0818', 'cafamapa@saude.ap.gov.br'),
(13, 'Secretaria de Estado de Saúde Pública do Pará', 'Rodovia BR - 316 - KM 10 - nº 3651, CEP: 67.200-970 - Bairro Uriboca, Município Marituba. Ao lado da Pará Truck.', '(91) 3255-9735', '', 'cdsespa@gmail.com'),
(14, 'Secretaria Estadual de Saúde - SES PB', 'Avenida Capitão José Pessoa, s/n - Jaguaribe - João Pessoa - CEP: 58015-170.\r\nVizinho ao Hospital Napoleão Laureano.', '(83) 3218-7395', '', 'cedmexip@saude.pb.gov.br'),
(15, 'Secretaria Estadual de Saúde do PE', 'Rod. Empresario João Santos Filho, 533 - Muribeca / Jaboatão dos Guararapes.\r\nEm frente ao CD do Walmart.', '(81) 3437-4994', '', 'recebimento@alclog.com.br'),
(16, 'Secretaria de Estado da Saúde do Piaui - PI', 'Rua 19 de novembro nº 1865 - Primavera / Teresina - PI - CEP: 64002-585.\r\nAo lado da vigilância sanitária do estado do PI.', '(86) 3216-3655', '', 'wisllancesar@gmail.com'),
(17, 'Fundo Estadual de Saúde - Coordenação de RO', 'Rua Aparício de Moraes, 4338, Industrial - Porto Velho - RO, CEP 78905-020.\r\nAo lado da AGEVISA-RO.', '(69) 3216-8592', '', 'dgaf.ceaf@gmail.com'),
(18, 'Coordenação Geral de Assistência - RR', '', '', '(95) 98484-8242', 'nmde.dafrr@hotmail.com'),
(19, 'Estoque Regulador - Tocantins - TO', 'Quadra 1112 Sul, Alameda 07, Lote 07 a 11, Setor Industrial.\r\nAtrás do Posto Cantão.', '(63) 3218-3390', '', 'estoqueaf@yahoo.com.br'),
(20, 'CENTRAL FARMACÊUTICA DO ESTADO DA BAHIA', 'RUA ANTONIO ANDRADE Nº 241 PORTO SECO - PIRAJÁ CEP 41233-015\r\nRESPONSÁVEL: EUGENIO JOSÉ REGIS BUGARIN\r\nOBS: NECESSITA AGENDAMENTO', '(71) 3117-2580', '', 'marcionilia.silva@saude.ce.gov.br'),
(21, 'COORDENADORIA DE ASSISTÊNCIA FARMACÊUTICA DO ESTADO DO CEARÁ', 'AVENIDA WASHINGTON SOARES Nº 7.605 MESSEJANA - FORTALEZA CEP 60841-030\r\nRESPONSÁVEL: JAMILLE DUAILIBE E HELANO SOBREIRA\r\nOBS: NECESSITA AGENDAMENTO', '(85) 3101-4363', '', 'franciscoj.rodrigues@saude.ce.gov.br'),
(22, 'SECRETARIA DE ESTADO DE SAÚDE DO DISTRITO FEDERAL', 'SIA TRECHO 4, LOTES 1840 A 1890, ASA SUL, BRASILIA - DF CEP 71200-040\r\nRESPONSÁVEL: AMANDA STEFANY SILVA RAMOS\r\nOBS: NECESSITA AGENDAR', '(61) 3233-8857', '', 'agendagemebe.ses@gmail.com'),
(23, 'SECRETARIA DE ESTADO DE SAÚDE DO ESPÍRITO SANTO', 'AVENIDA MARECHAL MASCARENHAS DE MORAES Nº 2025 BENTO FERREIRA\r\nRESPONSÁVEL: LARISSA\r\nOBS: NECESSITA AGENDAR', '(27) 3636-8422', '', 'geaf.almoxarifado@saude.es.gov.br'),
(24, 'SECRETARIA DE ESTADO DE SAÚDE DE GOIÁS', 'RUA 26 Nº10, SANTO ANTONIO - GOIANIA CEP 74853-400\r\nRESPONSÁVEL: PAULO HENRIQUE\r\nOBS:NECESSITA AGENDAR', '(62) 6201-4963', '', 'sgpf.medicamentos.saude@gioas.gov.br'),
(25, 'CENTRAL DE ABASTECIMENTO FARMACÊUTICO DO MARANHÃO', 'ESTRADA DA VITORIA Nº 2409, LIBERDADE - SÃO LUÍS CEP 65037-270\r\nRESPONSÁVEL: DRª MARISTELA SANTOS SILVA \r\nOBS: AGENDAR SOMENTE TERMOLÁBEIS', '(98) 3243-1522', '', ''),
(26, 'SECRETARIA DE SAÚDE DO ESTADO DE MATO GROSSO DO SUL', 'RUA DELEGADO OSMAR DE CAMARGO , JARDIM VERANEIO, CAMPO GRANDE CEP 79037-108\r\nRESPONSÁVEL: NATHÁLIA DA SILVA DANTAS PELLICCIONI\r\nOBS: AGENDA SOMENTE DE TERMOLÁBEIS', '(67) 3318-1821', '', ''),
(27, 'COORDENAÇÃO GERAL DE ARMAZENAGEM DO RIO DE JANEIRO', 'RUA DOUTOR LUIZ PALMIER Nº 762, BARRETO - NITERÓI CEP 24110-310\r\nRESPONSÁVEL: DOUGLAS PEDRONI / CAMILA BRAGA\r\nOBS: NECESSITA AGENDAR', '(21) 2624-1546', '', 'notasfiscais.cga@pvax.com.br'),
(28, 'SECRETARIA DE ESTADO DE SAÚDE PÚBLICA RIO GRANDE DO NORTE', 'RUA NILO BEZERRA RAMALHO Nº 1691, MORRO BRANCO - NATAL CEP 59015-300\r\nRESPONSÁVEL: DALIANA SOUZA / JANINE ALMEIDA\r\nOBS: NECESSITA AGENDAR', '(84) 3232-5807', '', 'caf.ceafrn@gmail.com'),
(29, 'DIVISÃO DE ASSISTÊNCIA FARMACÊUTICA DO RIO GRANDE DO SUL', 'AVENIDA IPIRANGA Nº 6113, PAERNON - PORTO ALEGRE CEP 90610-000\r\nRESPONSÁVEL: GUILHERME ROSA FLORES\r\nOBS:NECESSITA AGENDAR', '(51) 3315-6497', '', 'agendamento-medicamentos@saude.rs.gov.br'),
(30, 'FUNDO ESTADUAL DE SAÚDE DE RONDONIA', 'RUA APARÍCIO DE MORAES Nº 4338 , BAIRRO INDUSTRIAL - PORTO VELHO CEP 78905-020\r\nRESPONSÁVEL: SAULO GUIMARÃES BELO / LISANDRA PANTOJA\r\nIBS: AGENDAR SOMENTE TERMOLÁBEIS', '(69) 3216-8592', '', ''),
(31, 'SECRETARIA DE ESTADO DE SAÚDE DE SÃO PAULO    /  RV IMOLA', 'AVENIDA JULIA GAIOLE Nº740 - GALPÃO T200/DOCA115 ÁGUA CHATA - GUARULHOS - COND GLP CEP 07251-500\r\n\r\nOBS:NECESSITA AGENDAR', '(11) 3199-4700', '', 'agendamento.sessp@rvimola.com.br'),
(32, 'CENTRO DE ABASTECIMENTO E DISTRIBUIÇÃO DE INSUMOS DO SERGIPE ', 'AVENIDA AUGUSTO FRANCO Nº 3150, PONTO NOVO - ARACAJU CEP 49047-040\r\nRESPONSÁVEL: ELIENE MACHADO COUTINHO\r\nOBS: NECESSITA AGENDAR', '(79) 3198-0606', '', 'agendamento.cadim@outlook.com'),
(33, 'SECRETARIA MUNICIPAL DE SAÚDE DO MATO GROSSO', 'AVENIDA FERNANDO CORREA DA COSTA 9650 BR 364 KM10, SÃO FRANCISCO - CUIABÁ CEP 78015-090\r\nRESPONSÁVEL: TALIZIA\r\n', '', '(65) 99242-4534', 'rt.cdmic@gmail.com'),
(34, 'SECRETARIA MUNICIPAL DE SAÚDE DO ESPIRITO SANTO', 'RUA JOÃO PALÁCIO Nº 503, EURICO SALES SERRA - ES CEP 29160-161\r\nRESPONSÁVEL: FERNANDA SALES DE AZEVEDO', '(27) 3381-6981', '', 'almox.farmacia@correio1.vitoria.es.gov.br'),
(35, 'SECRETARIA MUNICIPAL DE SAÚDE DO ACRE', 'RUA PROJETADA Nº 70 ABRÃO ALAB CEP 69918-084', '(68) 3227-1239', '', 'afriobranco@hotmail.com'),
(36, 'SECRETARIA MUNICIPAL DE SAÚDE DE TOCANTINS', 'QUADRA 912 SUL ALAMEDA 04 LOTE 06 A 08       CEP 77023-438\r\nRESPONSÁVEL: LUDMILA PEDREIRA LIMA', '(63) 3218-5555', '', 'caf.palmas@gmail.com'),
(37, 'SECRETARIA MUNICIPAL DE SAÚDE DE ALAGOAS', 'AVENIDA JUCA SAMPAIO 620, BARRO DURO CEP 57040-600\r\nRESPONSÁVEL: NATALIA GALINDO', '(82) 3312-5447', '', 'caf@sms.maceio.al.gov.br'),
(38, 'SECRETARIA MUNICIPAL DE SAÚDE DO PIAUÍ', 'RUA MAGALHÃES FILHO Nº 1711 , BAIRRO MARQUES -ZONA NORTE     CEP 64002-450\r\nRESPONSÁVEL: HANDERSON RODRIGUES SILVA LIMA', '(86) 3215-7867', '', 'fms.geafa@yahoo.com.br'),
(39, 'SECRETARIA MUNICIPAL DE SAÚDE DE MATO GROSSO DO SUL', 'RUA ANTONIO RUFINO DE SOUZA Nº 50 , VILA NASER   CEP 79117-009\r\nRESPONSÁVEL: NADIA BERNARDINIS\r\n', '(67) 2020-1822', '', 'caf.seadim@gmail.com'),
(40, 'SECRETARIA MUNICIPAL DE SAÚDE DE RONDONIA', 'RUA MONTEIRO LOBATO Nº 5550, BAIRRO ELDORADO   CEP 76811-776\r\nRESPONSÁVEL: FABLICIA GLAUCIANE SANTOS MENEZES\r\n', '', '(69) 98493-9105', 'assessoriafarmsemusa@gmail.com'),
(41, 'SECRETARIA MUNICIPAL DE SAÚDE DE PERNAMBUCO', 'AVENIDA DA RECUPERAÇÃO Nº 7008 , BAIRRO GUABIRABA - PE    CEP 52490-570\r\nRESPONSÁVEL: JOÃO MAURÍCIO DE ALMEIDA\r\n', '(81) 3355-1170', '', 'joao.almeida@recife.pe.gov.br'),
(42, 'SECRETARIA MUNICIPAL DE SAÚDE DO AMAZONAS', 'RUA CRISTINA TAVARES Nº 150, PLANALTO - AM   CEP 69044-745\r\nRESPONSÁVEL: RICARDO MILITÃO', '', '(92) 98855-6073', 'delog.semsa@pmm.am.gov.br'),
(43, 'SECRETARIA MUNICIPAL DE SAÚDE DE SANTA CATRINA', 'RUA FIRENZE BUSINESESS PARK Nº 475, BAIRRO PACHECOS - PALHOA  CEP 88135-010\r\nRESPONSÁVEL: KAUE GONÇALVES', '(48) 3380-7428', '', 'farmaciafpolis@branetiologistica.com.br'),
(44, 'HOSPITAL NAVAL MARCILIO DIAS', 'RUA CESAR ZAMA Nº 185 - LINS DE VASCONCELOS  RJ CEP 20725-090', '', '', ''),
(45, 'HOSPITAL CENTRAL DO EXÉRCITO', 'RUA FRANCISCO MANUEL Nº 126 - BENFICA RJ CEP 20911-270', '', '', ''),
(46, 'HOSPITAL DA FORÇA AÉREA DO GALEÃO', 'ESTRADA DO GALEÃO Nº 4101 - GALEÃO CEP 21941-353', '', '', ''),
(47, 'HOSPITAL CENTRAL DA AERONÁUTICA', 'RUA BARÃO DE ITAPAGIPE Nº 167 RIO COMPRIDO', '', '', ''),
(48, 'HOSPITAL DE AERONÁUTICA DE AFONSOS', 'AVENIDA MARECHAL FONTENELE Nº 1628 - CAMPO DOS AFONSOS CEP 21740-002', '', '', ''),
(49, 'HOSPITAL GERAL DE JUIZ DE FORA ', 'RUA GENERAL DESCHAMPS CAVALCANTE S/N - FÁBRICA - JUIZ DE FORA CEP 36080-320', '', '', ''),
(50, 'ESQUADRÃO DE SAÚDE DE LAGOA SANTA', 'RUA UNNAMED ROAD - SÃO GERALDO  - LAGOA SANTA CEP 33400-000', '', '', ''),
(51, 'HOSPITAL DE FORÇA AÉREA DE BRASÍLIA', 'AÉREA MILITAR DO AEROPORTO INTERNACIONAL DE BRASÍLIA S/N - LAGO SUL - BRASÍLIA CEP 71607-900', '', '', ''),
(52, 'HOSPITAL MILITAL DE AÉREA DE BRASÍLIA', 'SETOR MILITAR URBANO S/N BRASÍLIA CEP 70630-000', '', '', ''),
(53, 'HOSPITAL MILITAR DE ÁREA DE RECIFE', 'RUA DO HOSPÍCIO Nº 563 - BOA VISTA - RECIFE CEP 50030-230', '', '', ''),
(54, 'HOSPITAL DE AERONÁUTICA DE RECIFE', 'AVENIDA SENADOR SÉRGIO GUERRA Nº 606 - PIEDADE - JABOATÃO DOS GUARARAPES CEP 54400-003', '', '', ''),
(55, 'HOSPITAL NAVAL DE RECIFE', 'AVENIDA CRUZ CABUGÁ Nº 1200 - SANTO AMARO RECIFE CEP 50040-000', '', '', ''),
(56, 'HOSPITAL DE GUARNIÇÃO DE FORTALEZA', 'AV DES. MOREIRA Nº 1500 ALDEOTA - FORTALEZA CEP 60170-001', '', '', ''),
(57, 'HOSPITAL MILITAR DE ÁREA DE PORTO ALEGRE', 'AV MERILAND Nº 450 - AUXILIADORA CEP 90440-191', '', '', ''),
(58, 'HOSPITAL DE AERONÁUTICA DE CANOAS', 'AVENIDA GUILHERME SCHELL Nº 3950 BAIRRO FÁTIMA - CANOAS CEP 92200-630', '', '', ''),
(59, 'HOSPITAL GERAL DE SANTA MARIA', 'RUA MARECHAL HERMES Nº 190 - PASSO D AREIA - SANTA MARIA - RS CEP 970010-290', '', '', ''),
(60, 'HOSPITAL GERAL DE CURITIBA', 'PRAÇA MARECHAL ALBERTO FERREIRA DE ABREU S/N   BATEL - CURITIBA CEP 80420-020', '', '', ''),
(61, 'HOSPITAL DE GUARNIÇÃO DE FLORIANÓPOLIS', 'RUA SILVA JARDIM Nº441 - CENTRO - FLORIANÓPOLIS   CEP 88010-400', '', '', ''),
(62, 'HOSPITAL DE GUARNIÇÃO DE ALEGRETE', 'RUA DEMÉTRIO RIBEIRO S/N  - CENTRO - ALEGRETE   CEP 97542-360', '', '', ''),
(63, 'HOSPITAL MILITAR DE ÁREA DE SÃO PAULO', 'RUA OUVIDOR PORTUGAL Nº 230 - MONUMENTO - SÃO PAULO CEP01551-010', '', '', ''),
(64, 'HOSPITAL DA FORÇA AÉREA DE SÃO PAULO', 'AV OLAVO FONTOURA Nº 1400 - SANTANA - SÃO PAULO CEP02012-021', '', '', ''),
(65, 'ESQUADRÃO DE SAÚDE GUARATINGUETÁ', 'AV BRIGADEIRO ADHEMAR LYRIO S/N   PEDREGULHO - GUARATINGUETÁ  CEP 12510-020', '', '', ''),
(66, 'HOSPITAL DE AERONÁUTICA DE BELÉM', 'AVENIDA ALMIRANTE BARROSO Nº 3492 - SOUZA - BELÉM CEP 66613-710', '', '', ''),
(67, 'HOSPITAL GERAL DE BELÉM', 'PRAÇA BRASIL Nº 850 - UMARIZAL - BELÉM CEP 66050-450', '', '', ''),
(68, 'HOSPITAL NAVAL DE BELÉM ', 'RUA ARSENAL Nº200  CIDADE VELHA - BELÉM  CEP66023-110', '', '', ''),
(69, 'HOSPITAL MILITAR DE ÁREA DE MANAUS', 'RUA PROFESSOR ERNANI SIMÃO Nº1421 CACHOEIRINHA - MANAUS  CEP69065-060', '', '', ''),
(70, 'HOSPITAL DE AERONÁUTICA DE MANAUS', 'AVENIDA PRESIDENTE KENNEDY Nº1750   -  BAIRRO DO CRESPO  -  MANAUS   CEP69074-000', '', '', ''),
(71, 'HOSPITAL DE GUARNIÇÃO DE TABATINGA', 'RUA DUARTE COELHO Nº447   - TABATINGA   CEP 69640-000', '', '', ''),
(72, 'HOSPITAL DE GAURNIÇÃO DE PORTO VELHO', 'RUA RUI BARBOSA Nº 409  -  CENTRO  - PORTO VELHO   CEP76801-010', '', '', ''),
(73, 'HOSPITAL DE GUARNIÇÃO DE SÃO GABRIEL DA CACHOEIRA', 'RODRIGUES DA SILVA RG 26382562  BR 307,7    SÃO GABRIEL DA CACHOEIRA - AM CEP 69750-000', '', '', ''),
(74, 'HOSPITAL MILITAR DE ÁREA DE CAMPO GRANDE', 'AVENIDA DUQUE DE CAXIAS Nº474  - AMAMBAI - CAMPO GRANDE - MS  CEP 79051-485', '', '', ''),
(75, 'HOSPITAL NAVAL DE LADÁRIO', 'RUA ALMIRANTE FRONTIN , ST 1 - LADÁRIO - MS      CEP 79370-000', '', '', ''),
(76, 'HOSPITAL NAVAL DE SALVADOR', 'AVENIDA DA FRANÇA Nº1400 - COMÉRCIO - SALVADOR   CEP 40010-000', '', '', ''),
(77, 'HOSPITAL GERAL DE SALVADOR', 'AVENIDA VASCO DA GAMA S/N  BROTAS - SALVADOR   CEP40010-000', '', '', ''),
(78, 'HOSPITAL DE GUARNIÇÃO DE NATAL', 'AVENIDA HERMES DA FONSECA Nº1385 - TIROL - NATAL  CEP59015-145', '', '', ''),
(79, 'HOSPITAL NAVAL DE NATAL', 'RUA SILVIO PELICO S/N ALECRIM - NATAL CEP 59040-150', '', '', ''),
(80, 'HOSPITAL DE GUARNIÇÃO DE JOÃO PESSOA', 'AV PRESIDENTE EPITÁCIO PESSOA Nº 2121 - ESTADO  -  JOÃO PESSOA   CEP58030-002', '', '', ''),
(81, 'HOSPITAL DAS FORÇAS ARMADAS', 'SETOR SUDOESTE S/N  CRUZEIRO - SUDOESTE  - OCTOGONAL - BRASÍLIA  CEP70675-731', '', '', ''),
(82, 'HOSPITAL GERAL DO RIO DE JANEIRO', 'AV DUQUE DE CAIXIAS Nº 1551  - DEODORO - RJ  CEP21615-220', '', '', ''),
(83, 'POLICLINICA MILITAR DO RIO DE JANEIRO', 'RUA MONCORVO FILHO Nº 34, CENTRO - RIO DE JANEIRO CEP 20211-340', '', '', ''),
(84, 'POLICLINICA MILITAR DA PRAIA VERMELHA', 'PRAÇA GENERAL TIBÚRCIO Nº 83, URCA - RIO DE JANEIRO CEP 22290-270', '', '', ''),
(85, 'POLICLINICA MILITAR DE NITERÓI', '', '', '', ''),
(86, 'POLICLINICA NAVAL DE SÃO PEDRO DA ALDEIA', '', '', '', ''),
(87, 'SANATÓRIO NAVAL DE NOVA FRIBURGO', '', '', '', ''),
(88, 'ESQUADRÃO DE SAÚDE DE BARBACENA', '', '', '', ''),
(89, 'PMGU I - POUSO ALEGRE', '', '', '', ''),
(90, 'PMGU III - VILA VELHA', '', '', '', ''),
(91, 'PMGU III - TRÊS CORAÇÕES', '', '', '', ''),
(92, 'PMGU IV - BELO HORIZONTE', '', '', '', ''),
(93, '4ª REGIÃO MILITAR', '', '', '', ''),
(94, 'HOSPITAL NAVAL DE BRASÍLIA', '', '', '', ''),
(95, '11ª REGIÃO MILITAR', '', '', '', ''),
(96, 'ESQUADRÃO DE SAÚDE DE ANÁPOLIS', '', '', '', ''),
(97, 'PMGU IV - GOIÃNIA', '', '', '', ''),
(98, 'ESQUADRÃO DE SAÚDE DE FORTALEZA', '', '', '', ''),
(99, 'PMGU II - MACEIÓ', '', '', '', ''),
(100, 'PMGU II - ARACAJÚ', '', '', '', ''),
(101, 'PMGU III - TERESINA', '', '', '', ''),
(102, '7ª REGIÃO MILITAR', '', '', '', ''),
(103, '10ª REGIÃO MILITAR', '', '', '', ''),
(104, 'HOSPITAL DE GUARNIÇÃO DE BAGÉ', '', '', '', ''),
(105, 'HOSPITAL DE GUARNIÇÃO DE SANTIAGO', '', '', '', ''),
(106, 'POLICLÍNICA MILITAR DE PORTO ALEGRE', '', '', '', ''),
(107, 'ESQUADRÃO DE SAÚDE DE FLORIANÓPOLIS', '', '', '', ''),
(108, 'ESQUADRÃO DE SAÚDE DE CURITIBA', '', '', '', ''),
(109, 'ESQUADRÃO DE SAÚDE DE SANTA MARIA', '', '', '', ''),
(110, 'PMGU II - PONTA GROSSA', '', '', '', ''),
(111, 'PMGU II - SÃO GABRIEL', '', '', '', ''),
(112, 'PMGU II - SÃO BORJA', '', '', '', ''),
(113, 'PMGU II - SANTANA DO LIVRAMENTO', '', '', '', ''),
(114, 'PMGU III - CASCAVEL', '', '', '', ''),
(115, 'PMGU III - CRUZ ALTA', '', '', '', ''),
(116, 'PMGU III - SANTO ANGÊLO', '', '', '', ''),
(117, 'PMGU III - URUGUAIANA', '', '', '', ''),
(118, 'PMGU III - PELOTAS', '', '', '', ''),
(119, '3ª REGIÃO MILITAR', '', '', '', ''),
(120, '5ª REGIÃO MILITAR', '', '', '', ''),
(121, 'COMANDO DO 8º DISTRITO NAVAL', '', '', '', ''),
(122, '2ª REGIÃO MILITAR', '', '', '', ''),
(123, 'ESQUADRÃO DE SAÚDE DE PIRASSUNUNGA', '', '', '', ''),
(124, 'ESQUADRÃO DE SAÚDE DE SÃO JOSÉ DOS CAMPOS', '', '', '', ''),
(125, 'PMGU II - BARUERI', '', '', '', ''),
(126, 'PMGU II - SÃO VICENTE', '', '', '', ''),
(127, 'PMGU II - TAUBATÉ', '', '', '', ''),
(128, 'PMGU III - CAMPINAS', '', '', '', ''),
(129, 'HOSPITAL DE GUARNIÇÃO DE MARABÁ', '', '', '', ''),
(130, 'ESQUADRÃO DE SAÚDE DE ALCÂNTARA', '', '', '', ''),
(131, 'PMGU II - SÃO LUÍS', '', '', '', ''),
(134, 'ESQUADRÃO DE SAÚDE DE BOA VISTA', 'RUA VALDEMAR BASTOS DE OLIVEIRA Nº 2990 - BOA VISTA - RR CEP 69304-600', '', '', ''),
(135, 'ESQUADRÃO DE SAÚDE DE PORTO VELHO', 'AVENIDA LAURO SODRÉ S/N PORTO VELHO - RONDÔNIA CEP 76803-260', '', '', ''),
(136, 'POSTO MÉDICO DE GUARNIÇÃO DE CRUZEIRO DO SUL', 'AVENIDA VINTE E CINCO DE AGOSTO Nº 3224 - CRUZEIRO DO SUL - ACRE CEP 69980-000', '', '', ''),
(137, 'POSTO MÉDICO DE GUARNIÇÃO DE TEFÉ', 'ESTRADA DO AEROPORTO - TEFÉ - AMAZONAS CEP 69470-000', '', '', ''),
(138, 'POSTO MÉDICO DE GUARNIÇÃO DO RIO BRANCO', 'RUA COLÔMBIA Nº 534 - BOSQUE - RIO BRANCO  - ACRE   CEP 69909-700', '', '', ''),
(139, 'POSTO MÉDICO DE GUARNIÇÃO DE BOA VISTA', 'AVENIDA FORTE SÃO JOAQUIM Nº 210 - SÃO FRANCISCO - BOA VISTA  - RORAIMA CEP 69305-200', '', '', ''),
(140, '12º REGIÃO MILTAR', 'AVENIDA CORONEL TEIXEIRA Nº 6155 - PONTA NEGRA - MANAUS - AMAZONAS   CEP 69030-480', '', '', ''),
(141, 'ESQUADRÃO DE SAÚDE DE CAMPO GRANDE', 'AVENIDA DUQUE DE CAXIAS Nº 2905 - VILA TAVEIROPOLIS - CAMPO GRANDE - MS   CEP 79101-001', '', '', ''),
(142, 'POSTO MÉDICO DE GUARNIÇÃO DE CORUMBÁ', 'RUA CÁCERES Nº 425 - VILA MAMONA - CORUMBÁ - MS  CEP 79304-040', '', '', ''),
(143, 'POSTO MÉDICO DE GUARNIÇÃO DE CUIABÁ', 'RUA CORSINO DO AMARANTE Nº 515 - QUILOMBO - CUIABÁ - MS  CEP 78043-435', '', '', ''),
(144, 'POSTO MÉDICO DE GUARNIÇÃO DE DOURADOS', 'RUA GUSTAVO ADOLFO PAVEL Nº 2944  - COHAFABA II PLANO - DOURADOS - MS CEP 79826-140', '', '', ''),
(145, '9ª REGIÃO MILITAR ', 'AVENIDA DUQUE DE CAXIAS Nº 184 - AMAMBAI - CAMPO GRANDE - MS CEP 79051-485', '', '', ''),
(146, 'ESQUADRÃO DE SAÚDE DE SALVADOR', 'AVENIDA TENENTE FREDERICO GUSTAVO DOS SANTOS S/N - BAIRRO SÃO CRISTOVÃO - SALVADOR - BA CEP 41510-115', '', '', ''),
(147, '6º REGIÃO MILITAR', 'PRAÇA DUQUE DE CAXIAS S/N - MOURARIA - NAZARÉ - SALVADOR - BA  CEP 40040-110', '', '', ''),
(148, 'ESQUADRÃO DE SAÚDE DE NATAL', 'RUA DO ESPECIALISTA S/N - EMAÚS - PARNAMIRIM - NATAL - RN CEP 59148-185', '', '', ''),
(149, 'SECRETARIA DE ESTADO DE SAÚDE DO ACRE', 'TRAVESSA DO HEMOACRE Nº 132 - VILA IVONETE - RIO BRANCO - AC   CEP 69908-970', '', '', ''),
(150, 'SECRETARIA DE ESTADO DE SAÚDE DO AMAZONAS', 'AVENIDA DUQUE DE CAXIAS Nº 1998 - PRAÇA 14 DE JANEIRO - MANAUS - AM  CEP 69020-141', '', '', ''),
(151, 'SECRETARIA DE ESTADO DE SAÚDE DO AMAPÁ', 'RODOVIA JUSCELINO KUBITSCHECK KM 02, S/N  -MACAPÁ - AP  CEP 69020-141', '', '', ''),
(153, 'SECRETARIA DE ESTADO DE SAÚDE  DE RORAIMA', 'AVENIDA MARIO HOMEM DE MELO Nº4491  - CAIMBÉ II - BOA VISTA RO  CEP 69312-000', '', '', ''),
(154, 'COMANDO CONJUNTO DA AMAZÔNIA', 'AVENIDA CORONEL TEIXEIRA Nº 4715 - PONTA NEGRA - MANUS - AM   CEP 69037-000', '', '', ''),
(155, 'POLICLINICA NAVAL DE MANUS', 'KM 5  S/N - VILA BURITI - MANAUS - AM CEP 69075-840', '', '', ''),
(156, 'LABORATÓRIO FARMACÊUTICO DA MARINHA', 'AVENIDA DOM HELDER CAMARA Nº 315 - MANGUINHOS - RJ  CEP 20911-291', '', '', ''),
(157, 'DIRETORIA DE SAÚDE', 'SETOR MILITAR URBANO -BLOCO D - TEREO - BRASÍLIA - DF   CEP 70630-901', '', '', ''),
(158, '28º BATALHÃO DE CAÇADORES', 'RUA JANSEM DE MELO S/N DEZOITO DO FORTE -ARACAJÚ - SE  CEP 49072-350', '', '', ''),
(159, 'HOSPITAL GERAL DE FORTALEZA', 'AVENIDA DESEMBARGADOR MOREIRA Nº 1500 - ALDEOTA - FORTALEZA - CE CEP 60170-001', '', '', ''),
(160, 'HOSPITAL MILITAR DE RESENDE', 'RODOVIA PRESIDENTE DUTRA S/N - RESENDE - RJ CEP 27534-970', '', '', ''),
(161, 'OPERAÇÃO ACOLHIDA', 'AVENIDA MARQUES DE POMBAL QUADRA 1 S/N - SETOR MILITAR MARECHAL RONDON - 13 DE SETEMBRO - BOA VISTA RR   CEP 69308-515', '', '', ''),
(162, 'HOSPITAL CENTRAL ARISTACHO PESSOA ( BOMBEIRO)', 'RUA PAULO DE FRONTIN Nº 876 - RIO COMPRIDO - RJ CEP 20261-243', '', '', ''),
(163, '8º REGIÃO MILITAR', 'RUA JOÃO DIOGO Nº 458 - COMÉRCIO - BELÉM - PA  CEP 66015-160', '', '', ''),
(164, 'COMANDO CONJUNTO OESTE', 'AVENIDA DUQUE DE CAXIAS Nº 1628 - VILA ALBA - CAMPO GRANDE - MS   CEP 79100-400', '', '', ''),
(165, 'PREFEITURA MUNICIPAL DE FEIRA DE SANTANA', 'AVENIDA SAMPAIO Nº 344 - CENTRO - FEIRA DE SANTANA - BA  CEP  44001-584', '', '', ''),
(166, '9ª BRIGADA DE INFANTARIA MOTORIZADA - GRUPAMENTO DE UNIDADES ESCOLA', 'RUA BERNARDO DE VASCONCELOS, 1090 - REALENGO - RIO DE JANEIRO - RJ - CEP: 21710-261', '', '', ''),
(167, 'CENTRO CONJUNTO DE OPERAÇÕES DE PAZ DO BRASIL', 'AVENIDA DUQUE DE CAXIAS, 700 - VILA MILITAR - RIO DE JANEIRO - RJ - CEP: 21615-220', '', '', ''),
(168, 'Prefeitura de Rio das Ostras', 'Rua Campo do Albacora, 75 - Loteamento - Atlântica - Rio das Ostras - RJ - CEP: 28895-664', '', '', ''),
(169, 'Gabinete da Presidência da República', 'Palácio do Planalto, Praça dos Três Poderes, S/N - Brasília - DF. CEP: 70150-900', '', '', ''),
(170, 'Brigada de Infantaria Paraquedista', 'General Benedito da Silveira, S/N - Vila Militar - RJ - CEP: 21615-575', '', '', ''),
(171, '1º Batalhão de Defesa Química Biológica Radiológica e Nuclear', 'Rua Marechal Abreu Lima, 450 - Realengo - RJ. CEP: 21735-240', '', '', ''),
(172, 'Centro de Preparação de Oficiais da Reserva do Rio de Janeiro', 'Avenida Brasil, 5292 - Bonsucesso - RJ. CEP: 21040-361', '', '', ''),
(173, 'Batalhão de Manutenção e Suprimento de Armamento', 'Rua João Vicente, 2135-2151 - Deodoro - RJ. CEP: 21610-211', '', '', ''),
(174, '2º Regimento de Cavalaria de Guarda', 'Avenida Duque de Caxias, 2660 - Vila Militar - RJ. CEP: 21615-220', '', '', ''),
(175, '2ª Companhia de Inteligência', 'Palácio Duque de Caxias, 25 - 10º andar - Centro - RJ. CEP: 20221-280', '', '', ''),
(176, 'Centro Tecnológico do Exército', 'Avenida das Américas, 28705 - Barra de Guaratiba - RJ. CEP: 23020-470', '', '', ''),
(177, 'Batalhão DOMPSA', 'Avenida General Fonseca Ramos, S/N - Vila Militar - RJ. CEP: 21615-110', '', '', ''),
(178, 'Batalhão Escola de Comunicação', 'Avenida Duque de Caxias, 2940 - Deodoro - RJ. CEP: 21615-220', '', '', ''),
(179, 'Escola de Saúde do Exército', 'Rua Francisco Manuel, 44 - Benfica - RJ. CEP: 20911-270', '', '', ''),
(180, 'Escola de Artilharia de Costa Antiaérea', 'Avenida General Benedito da Silveira, 701 - Vila Militar - RJ. CEP: 21615-000', '', '', ''),
(181, 'Bateria de Comando da Artilharia Divisionária 1ª DE', 'Estrada General Eurico Gaspar Dutra, S/N - Jurujuba - Niterói - RJ. CEP: 24370-375', '', '', ''),
(182, '1º Batalhão de Polícia do Exército', 'Rua Barão de Mesquita, 425 - Tijuca - RJ. CEP: 20540-001', '', '', ''),
(183, 'Colégio Militar do Rio de Janeiro', 'Rua São Francisco Xavier, 267 - Maracanã - RJ. CEP: 20550-010', '', '', ''),
(184, 'Centro de Adestramento Leste', 'Avenida Duque de Caxias, 950 - Deodoro - RJ. CEP: 21615-220', '', '', ''),
(185, '1º Batalhão de Engeharia de Combate (Escola)', 'Praça Ruão, 35 - Santa Cruz - RJ - CEP: 23570-200', '', '', ''),
(186, 'Comando Conjunto do CML', 'Praça Duque de Caxias, 25 - 8º andar - Centro - RJ. CEP: 20221-260', '', '', ''),
(187, 'COMANDO CONJUNRO DO RIO GRANDE DO NORTE', 'RUA SILVIO PÉLICO S/N ALECRIM   - NATAL   RN   CEP59040-150', '', '', ''),
(188, '5ª SUB CHEFIA DO EME', 'QUARTEL GENERAL DO EXÉRCITO - BLOCO A - 3º ANDAR SMU - DF', '', '', ''),
(189, '1ª BRIGADA DE INFANTARIA DE SELVA', 'AVENIDA MARQUES DE POMBAL QUADRA 1  S/N SETOR MILITAR MARECHAL DE RONDON  BOA VISTA  CEP 69308-515  RR', '', '', ''),
(191, '9º GRUPAMENTO DE ENGENHARIA E COMBATE', 'AVENIDA DUQUE DE CAXIAS 851 - 993 ALTO - AQUIDAUANA  CEP 79200-000 MS ', '', '', ''),
(192, '9º DEPÓSITO DE SUPRIMENTO', 'RUA GENERAL NEPOMUCENO COSTA NE 219 VILA ALBA , CAMPO GRANDE  CEP 79100-055', '', '', ''),
(193, '12º DEPÓSITO DE SUPRIMENTO', 'AVENIDA MARECHAL BITENCOURT NR 55 COMPENSA - MANAUS CEP 690290- 160', '', '', ''),
(194, '17º Pelotão de Polícia do Exército', 'Av. Duque de Caxias, 935 - Caiarí - Porto Velho - RO - CEP: 76801-913', '', '', ''),
(195, 'Centro de Instrução de Guerra na Selva', 'Av. São Jorge, S/N - São Jorge - Manaus - AM - CEP: 69000-000 ', '', '', ''),
(196, '61º Batalhão de Infantaria de Selva', 'Av. Vinte e Cinco de Agosto, 3224 - Aeroporto Velho - Cruzeiro do Sul - AC. CEP: 69980-000', '', '', ''),
(197, 'Esquadrão Aeroterrestre de Salvamento', 'Av. Duque de Caxias, 2905 - Campo Grande - MS. CEP: 79101-001', '', '', ''),
(198, 'Comando Militar da Amazônia', 'Av. Coronel Teixeira, 4715 - Ponta Negra - Manaus - AM. CEP: 69037-000', '', '', ''),
(199, 'Comando Militar do Norte', 'Rua João Diogo, 458 - Campina - Belém - PA. CEP: 66015-175', '', '', ''),
(200, '7º Batalhão de Engenharia e Construção', 'Av. das Nações Unidas, 2100 - 7º BEC - AC. CEP: 69918-093', '', '', ''),
(201, 'Batalhão de Infantaria de Selva', 'Av. General Sampaio, S/N - 13 de setembro - RR. CEP: 69308-150', '', '', ''),
(202, '3ª Companhia de Forças Especiais ', 'Av. Coronel Teixeira, 8148 - Compensa - Manaus - AM. CEP: 69037-000', '', '', ''),
(203, 'Escola de Sargentos de Logística ', 'Rua João Vicente, 2179 - Deodoro - Rio de Janeiro - RJ. CEP: 21610-211', '', '', ''),
(204, 'Depósito Central de Munição', 'RJ-127, KM 6, S/N - Cabral - Seropédica - RJ. CEP: 26600-000', '', '', ''),
(205, '2º Batalhão de Infantaria de Selva', 'Av. Almirante Barroso, 4421 - Souza - Belém - PA. CEP: 66613-710', '', '', ''),
(206, '34º Batalhão de Infantaria de Selva', 'Rodovia Duque de Caxias, 4301 - Alvorada - Macapá - AP. CEP: 68906-801 ', '', '', ''),
(207, '8º Batalhão de Infantaria de Selva', 'Rua Amazonas, 1 - Tabatinga - AM. CEP: 69640-000', '', '', ''),
(208, 'Centro de Avaliações do Exército', 'Estrada Roberto Burle Marx, 9140 - Guaratiba - RJ. CEP: 23020-240', '', '', ''),
(209, 'Campo de Instrução de Gericinó', 'Estrada São Pedro de Alcântara, 2856 - Magalhães Bastos - RJ. CEP: 21615-310', '', '', ''),
(212, 'Odontoclínica Central do Exército - OCEX', 'Rua Moncorvo Filho, 5 - Centro - RJ. CEP: 20211-340', '', '', ''),
(213, '6º DEPÓSITO DE SUPRIMENTO', 'Rua Gamboa de Cima, S/N. Fprte de são João - Campo Grande - Salvador - BA. CEP: 40060-008', '', '', ''),
(214, 'Comando da Artilharia Divisionária da 3ª Divisão do Exército', 'Rua General Osório, 1050 - Centro - Cruz Alta - RS. CEP: 98005-150', '', '', ''),
(215, '26º BATALHÃO DE INFANTARIA PARAQUEDISTA ', 'AVENIDA GENERAL BENEDITO DA SILVEIRA, 1339 - VILA MILITAR - RJ. CEP: 21615-000 ', '', '', ''),
(216, 'Secretaria Municipal de Saúde de Florianópolis', 'Rua Firenze Business Park, S/N - Pachecos Palhoa - SC. CEP: 88135-010 ', '(48) 3380-7428', '', ''),
(217, 'Secretaria Municipal de Saúde de Salete', 'Rua do Santuário, 162 - Centro - SC. CEP: 89196-000 ', '(47) 3563-0266', '', ''),
(218, 'Secretaria Municipal de Saúde de Blumenau', 'Rua Dr Pedro Zimmermann, 3965 - Itoupava Central - SC. CEP: 89066-100', '(47) 3338-2575', '', 'sincros.agenda@sincros.com.br'),
(219, 'Secretaria Municipal de Saúde de Urubici', 'Rua Celeste Francisco Ghizoni, S/N - Traçado - SC. CEP: 88650-000', '(49) 3278-5691', '', ''),
(220, 'Secretaria Municipal de Saúde de Salvador do Sul', 'Avenida Duque de Caxias, 03 - Centro - RS. CEP: 95750-000', '', '(51) 99258-0030', ''),
(221, 'Secretaria Municipal de Saúde de Rio Grande ', 'Rua Almirante Barroso, 83 - Centro - RS. CEP: 92601-001', '(55) 3233-8492', '', ''),
(222, 'Secretaria Municipal de Saúde de Montenegro', 'Rua Campos Neto, 177 - Timbaúva - RS. CEP: 95780-000 ', '(51) 3632-5578', '', ''),
(223, 'Secretaria Municipal de Saúde de Maratá ', 'Rua Theodoro Schrammel, S/N - Centro - RS. CEP: 95793-000', '', '(51) 99694-0190', ''),
(224, 'Secretaria Municipal de Saúde de Harmonia ', 'Rua 25 de julho, 970 - Centro - RS. CEP: 95785-000', '', '(51) 99994-1982', ''),
(225, 'Secretaria Municipal de Saúde de Capela de Santana ', 'Avenida Coronel Orestes Lucas, 2335 - Vila Nova - RS. CEP: 95745-000', '(51) 3698-1155', '', ''),
(226, 'Secretaria de Saúde de Brochier', 'Rua Ricardo Hartmenn, 116 - Centro - RS. CEP: 95790-000', '(51) 3697-3073', '', ''),
(227, 'Secretaria Municipal de Saúde de Curitiba', 'Rua João Bellega, 3350 - Cidade Industrial de Curitiba - PR. CEP: 81350-000', '(41) 3314-5084', '', ''),
(228, 'Secretaria Municipal de Saúde de Cambé', 'Avenida Inglaterra, 1144 - Centro - PR. CEP: 86181-000', '(43) 3174-0243', '', ''),
(229, 'Secretaria Municipal de Saúde de Londrina', 'Rua Amapá, S/N - Flipin - PR. CEP; 86026-440', '(43) 3372-9462', '', ''),
(230, 'Secretaria Municipal de Saúde de Guarapuava', 'Avenida das Dálias, 200 - Trianon - PR. CEP: 85012-110', '', '(42) 99115-9128', ''),
(231, 'Secretaria Municipal de Saúde de Várzea Grande ', 'Avenida da FEB, S/N - Ponte Nova - MT. CEP: 78115-904', '', '(65) 99967-5831', ''),
(232, 'Secretaria Municipal de Saúde de Nova Maringá ', 'Rua Getúlio Vargas, S/N - Jardim América - MT. CEP: 78445-000', '', '(66) 98123-3460', ''),
(233, 'Secretaria Municipal de Saúde de Vale de São Domingos', 'Rua Maria do Carmo, S/N - Centro - MT. CEP: 78253-000', '', '(65) 99974-4947', ''),
(234, 'Secretaria Municipal de Saúde de Santa Rita do Trivelato ', 'Rua do Arara, S/N - Centro - MT. CEP: 78453-000', '(65) 3529-6246', '', ''),
(235, 'Secretaria Estadual de Saúde do Paraná', 'Avenida Prefeito Lothrio Meissner, 350 - Jardim Botânico - PR. CEP: 82590-300', '(41) 3360-6730', '', ''),
(236, 'Secretaria Municipal de Saúde de Salto do Céu', 'Rua Mato Grosso, S/N - Centro - MT. CEP: 78270-000', '', '(65) 99618-2159', ''),
(237, 'Secretaria Municipal de Saúde de Ronsolândia', 'Rua Rio Madeirinha, S/N - Centro - MT. CEP: 78338-000', '', '(66) 98409-8468', ''),
(238, 'Secretaria Municipal de Saúde de Reserva do Cabaçal ', 'Avenida José Leonildo Cesáreo, S/N - Jardim Atlanta - MT. CEP: 78265-000', '', '(65) 99983-8044', ''),
(239, 'Secretaria Municipal de Novo Hamburgo', 'Rua General Osório, 868 - Hamburgo Velho - RS. CEP: 93510-160', '', '(51) 99207-8246', ''),
(240, 'Secretaria Municipal de Saúde de Bento Gonçalves ', 'Rua Goiânia, 590 - Botafogo - RS. CEP: 95700-586', '(54) 3055-7262', '', ''),
(241, 'Secretaria Municipal de Tapurah', 'Rua Amazonas, 327 - Centro - MT. CEP: 78573-000', '', '(66) 96082-022', ''),
(242, 'Secretaria Municipal de Saúde de Santa Carmem ', 'Rua Raposo Tavares, S/N - Centro - MT. CEP: 78545-000', '(66) 3562-1259', '', ''),
(243, 'Secretaria Municipal de Saúde de Porto Esperidião ', 'Avenida 13 de maio, S/N - Centro - MT. CEP: 78240-000', '', '(65) 99615-1567', ''),
(244, 'Secretaria Municipal de Saúde de Nova Ubiratã', 'Rua Rene Murad, 141 - Centro - MT. CEP: 78888-800 ', '', '(66) 99663-9585', ''),
(245, 'Secretaria Municipal de Saúde de Nova Mutum ', 'Avenida das Seriemas, 1502 W - Bela Vista - MT. CEP: 78450-000', '', '(66) 99953-5623', ''),
(246, 'Secretaria Municipal de Saúde de Nova Lacerda', 'Avenida 16 de julho, S/N - Centro - MT. CEP: 78243-000', '(65) 3259-4000', '', ''),
(247, 'Secretaria Muncipal de Saúde de Mirassol d\'Oeste  ', 'Rua Antônio Tavares, 3272 - Centro - MT. CEP: 78280-000', '', '(65) 99911-6009', ''),
(248, 'Secretaria Municipal de Saúde de Vila Bela de Santíssima Trindade   ', 'Travessa do Palácio, S/N - Centro - MT. CEP: 78245-000', '', '(65) 99439-285', ''),
(249, 'Secretaria Municipal de Saúde de Lucas do Rio Verde', 'Rua Caluípe, 1276 E - Cidade Nova - MT. CEP: 78455-000', '', '(65) 95482-579', ''),
(250, 'Secretaria Municipal de Saúde de Lambari d\'Oeste', 'Rua 06 de setembro, S/N - Centro - MT. CEP: 78278-000', '', '(65) 99929-1784', ''),
(251, 'Secretaria Municipal de Saúde de Jauru', 'Rua Marechal Deodoro, 804 - Centro - MT. CEP: 78255-000', '', '(65) 99938-8821', ''),
(252, 'Secretaria Municipal de Saúde de Itanhangá', 'Avenida Santa Catarina, S/N - Centro - MT. CEP: 78579-000', '', '(66) 98467-1196', ''),
(253, 'Secretaria Municipal de Saúde de Indiavaí', 'Avenida Jaime Campos, S/N - Centro - MT. CEP: 78295-000', '', '(65) 99986-1466', ''),
(254, 'Secretaria Municipal de Saúde de Glória d\'Oeste', 'Rua José Marquioreto, S/N - José Bejo - MT. CEP: 78293-000', '', '(65) 99929-2966', ''),
(255, 'Secretaria Municipal de Saúde de Figueirópolis d\'Oste', 'Rua Alagoas, S/N - Centro - MT. CEP: 78290-000', '', '(65) 98435-1502', ''),
(256, 'Secretaria Municipal de Saúde de Feliz Natal ', 'Avenida Dante MArtins de Oliveira, 301 E, centro - MT. CEP: 78885-000', '', '(66) 99628-2281', ''),
(257, 'Secretaria Municipal de Saúde de Curvelândia', 'Avenida Brasil, S/N - Centro - MT. CEP: 78237-000', '(65) 3273-1205', '', ''),
(258, 'Secretaria Municipal de Saúde de Comodoro', 'Avenida Prefeito Valdiz Mazulli, S/N - Centro - MT. CEP: 78310-000', '(65) 3283-2402', '', ''),
(259, 'Secretaria Municipal de Saúde de Cláudia', 'Avenida Marechal Candido Rondon, S/N - Centro - MT. CEP: 78540-000', '', '(66) 99966-2586', ''),
(260, 'Secretaria Municipal de Saúde de Cáceres ', 'Avenida Getúlio Vargas, S/N - Centro Operacional de Cáceres - MT. CEP: 78200-000', '', '(65) 99347-3163', ''),
(261, 'Secretaria Municipal de Saúde de Araputanga ', 'Rua Arthur Francisco Xavier, 651 - Centro - MT. CEP: 78260-000', '', '(65) 99691-2098', ''),
(262, 'Secretaria Municipal de Saúde de Montes Claros ', 'Avenida Carlos Ferrante, 797 - Edgar Pereira - MG. CEP: 39400-177', '(38) 2211-4265', '', ''),
(263, 'Secretaria Municipal de Saúde de Urucuia', 'Avenida Américo Martins, 23 - Centro - MG. CEP: 38649-000', '', '(38) 99930-0850', ''),
(264, 'Secretaria Municipal de Saúde de Riachinho ', 'Rodovia Garapuava, KM 72 - Rodovia - MG. CEP: 38940-000\r\n', '', '(38) 99679-850', ''),
(265, 'Secretaria Municipal de Saúde de Douradoquara', 'Travessa Assunção, 65 - Centro - MG. CEP: 38530-000', '', '(34) 98810-4382', ''),
(266, 'Secretaria Municipal de Saúde de Viçosa', 'Rua Maria Geralda Paranhos, S/N - Centro - MG. CEP: 36570-131', '', '(31) 99611-0626', ''),
(267, 'Secretaria Municipal de Saúde de Trindade ', 'Avenida Marinho de Melo Filho, 41 QD 23 LT 15 - Setor Cristina II - GO. CEP: 75839-123', '', '(62) 98578-7374', ''),
(268, 'Secretaria Municipal de Saúde de Anicuns ', 'Rua Marechal Floriano Peixoto, S/N - Centro - GO. CEP: 76160-000', '', '(64) 92006-754', ''),
(269, 'Secretaria Municipal de Saúde de Porangatu', 'Avenida Rui Barbosa, S/N - Setor Santa Luzia - GO. CEP: 76550-000', '', '(62) 98541-7853', ''),
(270, 'Secretaria Municipal de Saúde de Luziânia', 'Rua Professor Artur Roriz, S/N - Setor Aeroporto - GO. CEP: 72800-400', '', '(61) 95591-951', ''),
(271, 'Secretaria Municipal de Saúde de Avelinópolis ', 'Avenida Anicuns, S/N - Centro - GO. CEP: 74395-000', '', '(62) 98591-5031', ''),
(272, 'Secretaria Municipal de Saúde de Porto Seguro', 'Rua dos Pataxós, 84 - Frei Calixto - BA. CEP: 45820-000', '(73) 3288-3449', '', ''),
(273, 'Secretaria Municipal de Saúde de Jequié', 'Rua Valdelino Barreto, S/N - Centro - BA. CEP: 45200-590', '', '(71) 99374-7916', ''),
(274, 'Secretaria Municipal de Saúde de Vitória da Conquista ', 'Avenida Felepinas, 269 - Jurema - BA. CEP: 45023-320', '(77) 3422-8260', '', ''),
(275, 'Secretaria Municipal de Saúde de Itapetinga', 'Praça Dairy Valley, 11 - 2º andar - Centro - BA. CEP: 45700-000', '', '(77) 98118-1113', ''),
(276, 'Secretaria Municipal de Saúde de Campo Alegre ', 'Rua Maria Menila Vieira, 159 - Centro - AL. CEP: 57250-000', '', '(82) 99922-2964', ''),
(277, 'Secretaria Municipal de Saúde de Taió', 'Rua Coronel Federsen, S/N - Seminário - SC. CEP: 89190-000', '', '(47) 99958-8909', ''),
(278, 'Secretaria Municipal de Saúde de Brusque ', 'Rua Prefeito Germano Schaeffer, 66 - Centro SC. CEP: 88350-160', '', '(47) 99609-6191', ''),
(279, 'Secretaria Municipal de Saúde de Ascurra ', 'Rua de Lurdes, 47 - Tamanduá - SC. CEP: 89138-000', '(47) 3308-3750', '', ''),
(280, 'Secretaria Municipal de Saúde de Apiúna', 'Avenida Florianópolis, 107 - Centro - SC. CEP: 89135-000', '(47) 3353-2511', '', ''),
(281, 'Secretaria Municipal de Saúde de São Fidélis ', 'Rua do Sacramento, 291 - Centro - RJ. CEP: 28400-000', '', '(22) 99949-5175', ''),
(282, 'Secretaria Municipal de Saúde de Unistalda', 'Rua Desidério Finamor, 205 - Centro - RS. CEP: 97755-000', '', '(55) 99682-5236', ''),
(283, 'Secretaria Municipal de Saúde de Toropi ', 'Rua 22 de outubro, 479 - Centro - RS. CEP: 97418-000', '', '(55) 98129-1990', ''),
(284, 'Secretaria Municipal de Saúde de Silveira Martins ', 'Avenida Siqueira Couto, 227 - Centro - RS. CEP: 97195-000', '(55) 3224-1122', '', ''),
(285, 'Secretaria Municipal de Saúde de São João do Polêsine', 'Rua Augusto Arnutti, 760 - Centro - RS. CEP: 97230-000', '(55) 3269-1088', '', ''),
(286, 'Secretaria Municipal de Saúde de São Francisco de Assis', 'Rua João Moreira, 1598 - Centro - RS. CEP: 97610-000', '', '(55) 99975-3319', ''),
(287, 'Secretaria Municipal de Saúde de Quevedos ', 'Rua Humaitá, S/N - Centro - RS. CEP: 98140-000', '(55) 3279-1099', '', ''),
(288, 'Secretaria Municipal de Saúde de Pinhal Grande ', 'Avenida Integração, 2691 - Integração - RS. CEP: 98150-000', '', '(55) 99981-8850', ''),
(289, 'Secretaria Municipal de Saúde de Paraíso do Sul', 'Avenida Afonso Penna, S/N. CEP: 93530-000', '', '(55) 99970-8789', ''),
(290, 'Secretaria Municipal de Saúde de Nova Palma', 'Rua Raimundo Aléssio, 451 - Centro - RS. CEP: 97250-000', '(55) 3266-1028', '', ''),
(291, 'Secretaria Municipal de Saúde de Nova Esperança do Sul', 'Rua Vicentina, 1467 - Centro - RS. CEP: 97770-000', '(55) 3258-1567', '', ''),
(292, 'Secretaria Municipal de Saúde de Mata ', 'Rua General Osório, 208 - Centro - RS. CEP: 97410-000', '', '(55) 99925-0115', ''),
(293, 'Secretaria Municipal de Saúde de Ivorá', 'Rua São José, 159 (Posto de Saúde) - Centro - RS. CEP: 98160-000 ', '', '(55) 99967-3422', ''),
(294, 'Secretaria Municipal de Saúde de Formigueiro', 'Rua Vereador Adelino Cardoso, 150, Centro - RS. CEP: 97210-00 ', '', '(55) 99934-4617', ''),
(295, 'Secretaria Municipal de Saúde de Cacequi', 'Rua Bento Gonçalves, S/N - Centro - RS. CEP: 97450-000', '', '(55) 99729-8818', ''),
(296, 'Secretaria Municipal de Saúde de Agudo', 'Rua Ramiro Barcelos, 250 - Centro - RS. CEP: 96540-000', '(55) 3265-3317', '', ''),
(297, '5º BATALHÃO DE SUPRIMENTO', 'Avenida Silva Jardim, 110 - Rebouças - Curitiba - PR. CEP: 80230-000', '(41) 3089-9800', '', ''),
(298, '3º GRUPAMENTO LOGÍSTICO', 'Rua dos Andradas, 562 - Centro - Porto Alegre - RS. CEP: 90020002', '(51) 3215-8400', '', ''),
(299, '25º Batalhão de Infantaria Paraquedista', 'Rua General Fonseca Ramos, S/N - Vila Militar - RJ. CEP: 21615-110', '', '', ''),
(300, '4ª Coordenadoria Regional de Saúde ', 'Rua General Neto, 110 - Centro - Santa Maria - RS. CEP: 97050-240', '(55) 3222-3101', '', ''),
(301, 'UNIDADE DE PESQUISA CLÍNICA COMPLEXO HOSP. UFC', 'RUA CORONEL NUNES DE MELO NR 1142 CEP 60430-275   RODOLFO TEÓFILO  - FORTALEZA', '', '(85) 98521-2997', ''),
(302, '40º BATALHÃO DE INFANTARIA', 'BR226 KM 03 CEP 63700-0000 VENANCIUS - CRATEÚS CEARÁ', '', '', ''),
(303, 'PETICIONAMENTO - EMS', 'RODOVIA JORNALISTA FRANCISCO AGUIRRE PROENÇA KM 8 HORTOLÂNCIA  CEP 13196-901', '', '', ''),
(304, 'COMANDO DA BRIGADA PARAQUEDISTA', 'AVENIDA GENERAL BENEDITO DA SILVEIRA S/N DEODORO CEP 21615 - 220 RJ', '', '', ''),
(305, '27º Batalhão de Infantaria Paraquedista', 'Rua General Fonseca Ramos, 2 - Vila Militar - RJ. CEP: 21615-110', '', '', ''),
(306, '47º Batalhão de Infantaria ', 'KM 729, BR 163 - Vila São Paulo - Coxim - MS. CEP: 79400-000', '', '', ''),
(307, '2ª CIA FRON', 'Rua Capitão Cantalice, 1077 - Porto Murtinho - MS. CEP: 79280-000', '', '', ''),
(308, '9º Batalhão de Engenharia e Combate ', 'Av. Duque de Caxias, 851 - 993, Alto - Aquidauana - MS. CEP: 79200-000', '', '', ''),
(309, '10º Regimento de Cavalaria Mecanizada ', 'Praça Comandante Pedro Rufino, 627 - Centro - MS. CEP: 79260-000', '', '', ''),
(310, '11º Regimento de Cavalaria Mecanizada ', 'Praça Duque de Caxias, S/N, Centro - Ponta Porã. CEP: 79100-400', '', '', ''),
(311, '9º Grupo de Artilharia de Campanha', 'Rua Calógeras, 272 - Vila Militar - Nioaque - MS. CEP: 79220-000', '', '', ''),
(312, '3ª Bateria de Artilharia Antiaérea ', 'Avenida Capitão Olinto Mancini, 1317. Centro - Três Lagoas - MS. CEP: 79603-010', '', '', ''),
(313, 'ALMOXARIFADO LOGÍSTICO - LQFEX', 'RUA LICÍNIO CARDOSO NR 96', '', '', ''),
(314, 'Navio Patrulha Oceânico \\\"APA\\\"', 'Ilha do Mocanguê, S/N - Niterói - RJ. CEP: 24040-300', '', '', ''),
(315, 'EMS', 'RODOVIA JORNALISTA FRANCISCO AGUIRRE PROENÇA KM 08 HORTOLÂNDIA', '(08) 0019-4966', '', ''),
(316, 'FIOCRUZ - FARMANGUINHOS', '', '', '', ''),
(317, '12º Batalhão de Engenharia de Combate Blindado ', 'Rua Visconde de Tamandaré, S/N - Centro - Alegrete - RS. CEP: 97541-520', '', '', ''),
(318, '1º Batalhão de Operações Psicológicas', 'Avenida Salvador, S/N - Jardim Guanabara - Goiânia - GO. CEP: 74675-710', '', '', ''),
(319, '1º Batalhão de Guerra Eletrônica', 'Estrada Parque do Contorno, Rodovia DF-001, KM 5 - Setor Habitacional Taquari - EPCT - Brasília - DF. CEP: 73001-970', '', '', ''),
(320, '13º Regimento de Cavalaria Mecanizado ', 'Avenida Newton Prado, 2251 - Centro - Pirassununga - SP. CEP: 13631-040', '', '', ''),
(321, '59º Batalhão de Infantaria Motorizado', 'Avenida Fernandes Lima, 1970 - Gruta de Lourdes - Maceió - AL. CEP: 57052-050', '', '', ''),
(322, 'Batalhão da Guarda Presidencial', 'Avenida Duque de Caxias, S/N - Brasília - DF. CEP: 70630-000', '', '', ''),
(323, '2º Grupamento de Artilharia Antiaérea', 'Avenida Marechal Mallet, 01 - Forte - Praia Grande - SP. CEP: 11700-400', '', '', ''),
(324, '9º Batalhão de Manutenção ', 'Avenida Duque de Caxias, 1551 - Campo Grande - MS. CEP: 79100-401', '', '', ''),
(325, 'Grupo de Artilharia de Campanha', 'Avenida Duque de Caxias, S/N - Setor Militar Urbano - Brasília - DF. CEP: 70630-100', '', '', ''),
(326, '1º Batalhão de Engenharia de Construção ', 'Rua Tonheca Dantas, 463 - Penedo - Caicó - RN. CEP: 59300-000 ', '', '', ''),
(327, 'Comando Diretoria Cibernética', 'Lago Norte, S/N - Brasília - DF. CEP: 70297-400', '', '', ''),
(328, 'Comando 12ª Brigada de Infantaria Leve Aeromóvel', 'Rua Marquês de Herval, 109 - Centro - Caçapava - SP. CEP: 12281-510', '', '', ''),
(329, 'Centro de Adestramento Sul - CA - Sul', 'Estrada Capitão Vasco Amaro da Cunha, S/N - Boi Morto - Santa Maria - RS. CEP: 97030-110', '', '', ''),
(330, '41º Batalhão de Infantaria Motorizada ', 'Avenida Marechal Castelo Branco, S/N - Olavo - Jataí - GO. CEP: 75801-150', '', '', '');

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
  `id_fornecedor` int(11) NOT NULL,
  `id_lote_produto` int(11) NOT NULL,
  `id_usuario` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_entrada_produto`),
  KEY `id_fornecedor_fk` (`id_fornecedor`),
  KEY `id_lote_produto_fk` (`id_lote_produto`),
  KEY `id_usuario_fk` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cw_entrada_produto`
--

INSERT INTO `cw_entrada_produto` (`id_entrada_produto`, `data_entrada_produto`, `nota_fiscal_entrada_produto`, `quantidade_entrada_produto`, `id_fornecedor`, `id_lote_produto`, `id_usuario`) VALUES
(25, '2020-07-02', '00', 1304, 4, 63, 2),
(26, '2020-06-09', '-', 244500, 5, 11, 2),
(28, '2020-06-26', '-', 214380, 5, 12, 2),
(29, '2020-05-27', '-', 253500, 5, 6, 2),
(30, '2020-06-03', '-', 250500, 5, 9, 2),
(31, '2020-04-01', '-', 231500, 5, 13, 2),
(32, '2020-04-06', '-', 253000, 5, 25, 2),
(33, '2020-04-09', '-', 243620, 5, 23, 2),
(34, '2020-04-09', '-', 261910, 5, 24, 2),
(35, '2020-06-10', '-', 257000, 5, 10, 3),
(36, '2020-04-04', '-', 261000, 5, 68, 3),
(45, '2020-06-15', '935089', 1014400, 6, 69, 3),
(46, '2020-07-21', '-', 99000, 5, 78, 3),
(47, '2020-07-21', '-', 253500, 8, 79, 3),
(48, '2020-07-21', '-', 269000, 8, 80, 3),
(49, '2020-07-21', '-', 236500, 8, 81, 3),
(50, '2020-07-21', '-', 526, 5, 57, 2),
(52, '2020-07-20', '-', 783, 5, 54, 2),
(53, '2020-07-21', '-', 345, 5, 58, 2),
(54, '2020-07-21', '-', 736, 5, 59, 2),
(55, '2020-07-21', '-', 861, 5, 56, 2),
(56, '2020-07-02', '-', 859, 5, 60, 2),
(57, '2020-07-21', '-', 7200, 5, 50, 2),
(59, '2020-07-21', '-', 250, 5, 52, 2),
(60, '2020-07-21', '-', 5617, 5, 36, 2),
(61, '2020-07-21', '-', 5566, 5, 35, 2),
(62, '2020-07-21', '-', 5415, 5, 33, 2),
(63, '2020-07-21', '-', 5400, 5, 37, 2),
(64, '2020-07-21', '-', 5368, 5, 34, 2),
(66, '2020-07-21', '-', 4100, 5, 31, 2),
(67, '2020-07-21', '-', 5050, 5, 32, 2),
(68, '2020-07-21', '-', 866, 5, 85, 2),
(69, '2020-07-21', '-', 828, 5, 86, 2),
(71, '2020-07-21', '-', 18, 5, 87, 2),
(73, '2020-07-21', '-', 5500, 5, 83, 2),
(74, '2020-07-21', '-', 6531, 5, 84, 2),
(76, '2020-07-21', '-', 98250, 5, 70, 2),
(77, '2020-07-21', '-', 99000, 5, 72, 2),
(78, '2020-07-21', '-', 24090, 5, 16, 2),
(79, '2020-07-21', '-', 60000, 5, 18, 2),
(80, '2020-07-21', '-', 30000, 5, 21, 2),
(81, '2020-07-21', '-', 74250, 5, 27, 2),
(82, '2020-07-21', '-', 83250, 5, 15, 2),
(83, '2020-07-10', '-', 77250, 5, 17, 2),
(84, '2020-07-21', '-', 90000, 5, 20, 2),
(85, '2020-07-10', '-', 76500, 5, 26, 2),
(86, '2020-07-21', '-', 149500, 5, 7, 2),
(87, '2020-07-21', '-', 226210, 5, 88, 2),
(88, '2020-07-21', '-', 7903, 5, 22, 2),
(89, '2020-07-21', '-', 2250, 5, 28, 2),
(90, '2020-07-21', '-', 50, 5, 29, 2),
(91, '2020-07-21', '-', 15300, 4, 77, 2),
(92, '2020-07-21', '-', 63623, 4, 65, 2),
(93, '2020-07-21', '-', 68240, 4, 64, 2),
(94, '2020-07-21', '-', 34870, 4, 66, 2),
(95, '2020-07-21', '-', 71464, 4, 76, 2),
(96, '2020-07-14', '-', 646, 4, 71, 2),
(97, '2020-07-21', '-', 2193, 4, 43, 2),
(98, '2020-07-21', '-', 1535, 4, 45, 2),
(99, '2020-07-21', '-', 160, 4, 46, 2),
(100, '2020-07-21', '-', 576, 4, 47, 2),
(101, '2020-07-21', '-', 596, 4, 48, 2),
(102, '2020-07-21', '-', 499, 4, 49, 2),
(103, '2020-07-21', '-', 278, 4, 61, 2),
(105, '2020-07-14', '-', 2930, 4, 73, 2),
(106, '2020-07-14', '-', 3190, 4, 74, 2),
(107, '2020-07-21', '-', 16370, 4, 40, 2),
(108, '2020-07-21', '-', 7700, 4, 39, 2),
(109, '2020-07-21', '-', 2350, 4, 38, 2),
(110, '2020-07-21', '-', 15900, 9, 90, 3),
(111, '2020-07-21', '-', 23900, 9, 91, 3),
(112, '2020-07-21', '270799', 32940, 9, 92, 3),
(113, '2020-07-21', '-', 18940, 9, 93, 3),
(114, '2020-07-21', '-', 108, 10, 94, 3),
(115, '2020-07-21', '-', 6550, 9, 95, 3),
(116, '2020-07-21', '002791', 2618, 7, 97, 3),
(117, '2020-06-02', '002694', 1079, 7, 108, 3),
(118, '2020-06-02', '002695', 167, 7, 108, 3),
(119, '2020-06-09', '002713', 4248, 7, 109, 3),
(120, '2020-06-09', '002713', 1635, 7, 106, 3),
(121, '2020-07-30', '000001441', 10000, 11, 110, 3),
(124, '2020-08-07', '-', 3050, 5, 116, 2),
(125, '2020-08-13', '-', 2400, 5, 117, 2),
(126, '2020-08-17', '-', 242000, 5, 118, 3),
(127, '2020-03-10', 'PRODUÇÃO', 331500, 5, 103, 2),
(128, '2020-03-19', 'PRODUÇÃO', 342000, 5, 104, 2),
(129, '2020-04-03', '', 325700, 5, 105, 2),
(130, '2020-02-29', '1647698', 371600, 2, 119, 2),
(131, '2020-02-29', '1647699', 325500, 2, 120, 2),
(132, '2020-02-29', '1649433', 390100, 2, 121, 2),
(134, '2020-03-05', '1349434', 388100, 2, 123, 2),
(135, '2020-03-05', '1649432', 379300, 2, 124, 2),
(136, '2020-03-07', '1650406', 366900, 2, 125, 2),
(138, '2020-03-05', '1649430', 57700, 2, 120, 2),
(140, '2020-03-07', '1650407', 389700, 2, 127, 2),
(141, '2020-03-07', '1650407', 700, 2, 122, 2),
(142, '2020-05-30', '1649435', 384700, 2, 128, 2),
(143, '2020-03-16', '1654307', 379700, 2, 129, 2),
(144, '2020-03-16', '1654337', 387300, 2, 181, 2),
(145, '2020-03-16', '1654334', 372200, 2, 130, 2),
(146, '2020-03-16', '1654358', 361700, 2, 131, 2),
(147, '2020-03-16', '1654305', 367400, 2, 132, 2),
(148, '2020-03-05', '1649431', 350000, 2, 122, 2),
(149, '2020-03-07', '1650406', 600, 2, 122, 2),
(150, '2020-03-05', '1649430', 23700, 2, 122, 2),
(151, '2020-03-17', '1654521', 16000, 2, 122, 2),
(152, '2020-03-16', '1654335', 375000, 2, 133, 2),
(153, '2020-03-17', '1654522', 393200, 2, 134, 2),
(154, '2020-03-16', '1654306', 390500, 2, 135, 2),
(155, '2020-03-16', '1654339', 394900, 2, 136, 2),
(156, '2020-03-16', '1654336', 397600, 2, 137, 2),
(157, '2020-03-16', '1654338', 392100, 2, 138, 2),
(158, '2020-03-16', '1654340', 382500, 2, 139, 2),
(159, '2020-03-31', '1662503', 391300, 2, 140, 2),
(160, '2020-03-31', '1662504', 345600, 2, 141, 2),
(161, '2020-03-31', '1662504', 50400, 2, 142, 2),
(162, '2020-03-31', '1662505', 294240, 2, 143, 2),
(163, '2020-03-31', '1662505', 86400, 2, 144, 2),
(164, '2020-03-31', '1662506', 86400, 2, 143, 2),
(165, '2020-03-31', '1662506', 278520, 2, 144, 2),
(166, '2020-03-31', '1662507', 380700, 2, 145, 2),
(167, '2020-03-31', '1662508', 378800, 2, 146, 2),
(168, '2020-03-31', '1665209', 381200, 2, 147, 2),
(169, '2020-03-31', '1662510', 382200, 2, 148, 2),
(170, '2020-03-31', '1662511', 100000, 2, 149, 2),
(171, '2020-05-07', '1678371', 52600, 2, 141, 2),
(172, '2020-05-07', '1678371', 291600, 2, 149, 2),
(173, '2020-05-07', '1678371', 1000, 2, 150, 2),
(174, '2020-05-07', '1678373', 395200, 2, 151, 2),
(175, '2020-05-07', '1678373', 500, 2, 150, 2),
(176, '2020-05-07', '1678374', 500, 2, 150, 2),
(177, '2020-05-07', '1678374', 382400, 2, 152, 2),
(178, '2020-05-07', '1678372', 391500, 2, 153, 2),
(179, '2020-05-07', '1678372', 2500, 2, 150, 2),
(180, '2020-05-07', '1678356', 393100, 2, 154, 2),
(181, '2020-05-07', '1678361', 345600, 2, 142, 2),
(182, '2020-05-07', '1678352', 384500, 2, 155, 2),
(183, '2020-05-07', '1678357', 386400, 2, 156, 2),
(184, '2020-05-07', '1678355', 384700, 2, 157, 2),
(185, '2020-05-07', '1678358', 389640, 2, 158, 2),
(186, '2020-05-07', '1678353', 393100, 2, 159, 2),
(187, '2020-05-07', '1678368', 240, 2, 160, 2),
(188, '2020-05-07', '1678368', 1440, 2, 161, 2),
(189, '2020-05-07', '1678368', 1080, 2, 162, 2),
(190, '2020-05-20', '1684199', 364500, 2, 165, 2),
(191, '2020-05-20', '1684198', 100, 2, 127, 2),
(192, '2020-05-20', '1684198', 385500, 2, 164, 2),
(193, '2020-05-20', '1684197', 302200, 2, 150, 2),
(194, '2020-05-20', '1684196', 374900, 2, 166, 2),
(195, '2020-05-20', '386500', 386500, 2, 167, 2),
(196, '2020-05-20', '1684201', 395900, 2, 168, 2),
(197, '2020-05-20', '1684203', 392600, 2, 169, 2),
(198, '2020-05-20', '1684202', 395400, 2, 170, 2),
(199, '2020-05-20', '1684200', 372100, 2, 171, 2),
(200, '2020-05-29', '1690026', 396100, 2, 172, 2),
(201, '2020-05-29', '1690027', 384900, 2, 173, 2),
(202, '2020-05-29', '1690028', 384400, 2, 174, 2),
(203, '2020-06-22', '1703894', 387600, 2, 175, 2),
(204, '2020-06-22', '1703893', 6700, 2, 175, 2),
(205, '2020-06-22', '1703892', 324400, 2, 176, 2),
(206, '2020-06-22', '1703848', 361800, 2, 177, 2),
(207, '2020-06-22', '1703671', 384800, 2, 178, 2),
(208, '2020-06-22', '1703671', 500, 2, 175, 2),
(209, '2020-06-22', '1703670', 367000, 2, 180, 2),
(210, '2020-06-22', '1703670', 500, 2, 178, 2),
(211, '2020-06-22', '1703669', 403400, 2, 179, 2),
(212, '2020-06-22', '1703669', 500, 2, 180, 2),
(213, '2020-06-30', '1713630', 200, 2, 132, 2),
(214, '2020-02-21', '', 342400, 5, 101, 2),
(215, '2020-02-15', '', 342500, 5, 100, 2),
(216, '2020-02-07', '', 373500, 5, 99, 2),
(217, '2020-02-28', '', 332700, 5, 102, 2),
(218, '2020-08-20', '-', 3012, 5, 182, 2),
(219, '2020-08-21', '-', 250500, 5, 183, 3),
(220, '2019-09-27', '', 471120, 5, 184, 2),
(221, '2019-10-10', '', 492480, 5, 185, 2),
(222, '2019-10-21', '', 482280, 5, 186, 2),
(223, '2020-07-30', '1732850', 265080, 2, 197, 2),
(224, '2020-07-30', '1732853', 487080, 2, 199, 2),
(225, '2020-07-30', '1732849', 475560, 2, 198, 2),
(226, '2020-07-30', '1732849', 45240, 2, 196, 2),
(227, '2020-05-20', '1684205', 426480, 2, 196, 2),
(228, '2020-05-20', '1684241', 487080, 2, 195, 2),
(229, '2020-05-20', '1684204', 360360, 2, 194, 2),
(230, '2020-03-16', '1654308', 456960, 2, 193, 2),
(231, '2020-03-12', '1652465', 460800, 2, 192, 2),
(232, '2020-03-12', '1652465', 6960, 2, 193, 2),
(233, '2020-03-12', '1652465', 170280, 2, 190, 2),
(234, '2020-03-12', '1652465', 11520, 2, 189, 2),
(235, '2020-03-12', '1652465', 3840, 2, 188, 2),
(236, '2020-03-12', '1652465', 6480, 2, 187, 2),
(237, '2020-08-28', '-', 3138, 5, 200, 3),
(238, '2020-06-30', '1713630', 391800, 2, 201, 2),
(239, '2020-06-30', '1713629', 395500, 2, 202, 2),
(240, '2020-06-30', '1713628', 388300, 2, 203, 2),
(241, '2020-07-30', '1732854', 381400, 2, 204, 2),
(242, '2020-07-30', '1732852', 376600, 2, 205, 2),
(243, '2020-07-30', '1732851', 387900, 2, 206, 2),
(244, '2020-07-30', '1732848', 395700, 2, 207, 2),
(245, '2020-07-30', '1732847', 397200, 2, 208, 2),
(246, '2020-07-30', '1732845', 392000, 2, 209, 2),
(247, '2020-07-30', '1732845', 100, 2, 210, 2),
(248, '2020-07-30', '1732846', 385800, 2, 211, 2),
(249, '2020-07-30', '1732855', 394000, 2, 212, 2),
(250, '2020-07-30', '01732844', 392500, 2, 213, 2),
(251, '2020-08-10', '1738255', 386100, 2, 214, 2),
(253, '2020-08-10', '1738254', 390100, 2, 216, 2),
(254, '2020-08-07', '1737862', 370900, 2, 210, 2),
(255, '2020-09-03', '-', 3075, 5, 217, 2),
(256, '2020-08-11', '-', 6, 5, 42, 2),
(257, '2020-08-06', '-', 17, 5, 44, 2),
(258, '2020-04-30', ' ', 227540, 5, 219, 2),
(259, '2020-01-31', '', 228910, 5, 220, 2),
(260, '2019-12-06', '', 229790, 5, 221, 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cw_fornecedor`
--

INSERT INTO `cw_fornecedor` (`id_fornecedor`, `nome_fornecedor`, `endereco_fornecedor`, `telefone_fornecedor`, `celular_fornecedor`, `email_fornecedor`, `cnpj_fornecedor`) VALUES
(2, 'EMS S/A', 'RUA JORNALISTA FRANCISCO AG S/N KM 08 CHACARÁ ASSAY - HORTOLANDIA - SP.', '', '', '', '575.073.78/0003-65'),
(4, 'INVENTÁRIO', 'ALMOXARIFADO LOGÍSTICO', '', '', '', '000.000.00/0000-00'),
(5, 'LQFEX', 'RUA LICINIO CARDOSO 96', '(21) 2391-0868', '', '', '102.661.75/0001-07'),
(6, 'Sandoz do Brasil Indústria Farmacêutica Ltda', 'Rodovia Regis Bittencourt, 1962, galpão 5 parte P - Água Morna - Embu - SP. CEP: 06818-000', '', '', '', '612.866.47/0010-07'),
(7, 'Golden Clean Produtos Comerciais Eireli', 'Rua Nossa Senhora da Glória, 210 - Lote 14 - Parte QD 140 - Jardim Olavo Bilac - São João de Meriti - RJ. CEP: 25580-530  ', '(21) 2651-3815', '', 'goldencleanprodutos@gmail.com', '152.509.65/0001-00'),
(8, 'Laboratório Farmacêutico da Marinha - LFM', 'Av. Dom Hélder Câmara, 315 - Manguinhos, Rio de Janeiro - RJ. CEP: 20911-291', '', '', 'lfm.secom@marinha.mil.br', '113.769.52/0001-20'),
(9, 'FURP - FUNDAÇÃO PARA O REMÉDIO POPULAR', 'Endres, 35 - Itapegica - Garulhos - SP. CEP: 07043-902', '', '', '', '436.407.54/0001-19'),
(10, 'Laboratório Químico-Farmacêutico da Aeronáutica - LAQFA', 'Estrada do Galeão, 4001 - Ilha do Governador, Rio de Janeiro - RJ. CEP: 21941-353', '', '', '', '003.944.29/0099-14'),
(11, 'Terra Sul Comércio de Medicamentos LTDA', 'Rua Machado de Assis, 1355 - Bela Vista - Erechim - RS. CEP: 99704-066', '(54) 3712-2155', '', 'terrasulmedicamentos@gmail.com', '323.648.22/0001-48');

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
  PRIMARY KEY (`id_lote_produto`),
  KEY `id_produto_fk` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cw_lote_produto`
--

INSERT INTO `cw_lote_produto` (`id_lote_produto`, `id_produto`, `lote_produto`, `fabricacao_produto`, `validade_produto`) VALUES
(6, 8, '2005017', '2020-05-01', '2022-05-01'),
(7, 28, '2003011', '2020-03-01', '2022-03-01'),
(9, 8, '2005018', '2020-05-01', '2022-05-01'),
(10, 8, '2006021', '2020-06-01', '2022-06-01'),
(11, 8, '2006020', '2020-06-01', '2022-06-01'),
(12, 8, '2005019', '2020-05-01', '2022-05-01'),
(13, 8, '2003012', '2020-03-01', '2022-03-01'),
(15, 20, '2004639', '2020-04-01', '2022-04-01'),
(16, 20, '2004633', '2020-04-01', '2022-04-01'),
(17, 20, '2004641', '2020-04-01', '2022-04-01'),
(18, 20, '2004635', '2020-04-01', '2022-04-01'),
(20, 20, '2004642', '2020-04-01', '2022-04-01'),
(21, 20, '2004636', '2020-04-01', '2022-04-01'),
(22, 10, '2004632', '2020-04-01', '2022-04-01'),
(23, 8, '2003015', '2020-03-01', '2022-03-01'),
(24, 8, '2003016', '2020-03-01', '2022-03-01'),
(25, 8, '2003013', '2020-03-01', '2022-03-01'),
(26, 20, '2004643', '2020-04-01', '2022-04-01'),
(27, 20, '2004638', '2020-04-01', '2022-04-01'),
(28, 10, '1903609', '2019-03-01', '2021-03-01'),
(29, 10, '1903610', '2019-03-01', '2021-03-01'),
(30, 19, '2004652', '2020-04-01', '2022-04-01'),
(31, 19, '2004653', '2020-04-01', '2022-04-01'),
(32, 19, '2004654', '2020-04-01', '2022-04-01'),
(33, 19, '2005663', '2020-05-01', '2022-05-01'),
(34, 19, '2005664', '2020-05-01', '2022-05-01'),
(35, 19, '2006675', '2020-06-01', '2022-06-01'),
(36, 19, '2006671', '2020-06-01', '2022-06-01'),
(37, 19, '2005662', '2020-05-01', '2022-05-01'),
(38, 21, '2003617', '2020-03-01', '2022-03-01'),
(39, 21, '2003616', '2020-03-01', '2022-03-01'),
(40, 21, '2004624', '2020-04-01', '2022-04-01'),
(41, 27, '2006682', '2020-06-01', '2022-06-01'),
(42, 26, '2005668', '2020-05-01', '2022-05-01'),
(43, 26, '2005655', '2020-05-01', '2022-05-01'),
(44, 26, '2001601', '2020-05-01', '2022-05-01'),
(45, 22, '1908631', '2019-08-01', '2021-08-01'),
(46, 24, '1906623', '2019-06-01', '2021-06-01'),
(47, 24, '1908629', '2020-08-01', '2021-08-01'),
(48, 23, '1908630', '2019-08-01', '2021-08-01'),
(49, 23, '1906624', '2019-06-01', '2021-06-01'),
(50, 32, '2006680', '2020-06-01', '2022-06-01'),
(52, 32, '2003612', '2020-03-01', '2022-03-01'),
(54, 1, '2006673', '2020-06-01', '2022-06-01'),
(56, 1, '2006679', '2020-06-01', '2022-06-01'),
(57, 1, '2006672', '2020-06-01', '2022-06-01'),
(58, 1, '2006674', '2020-06-01', '2022-06-01'),
(59, 1, '2006678', '2020-06-01', '2022-06-01'),
(60, 1, '2006681', '2020-06-01', '2022-06-01'),
(61, 2, 'CA18J440', '2018-10-01', '2020-10-01'),
(63, 4, '13418', '2019-03-01', '2021-03-01'),
(64, 5, '19010069', '2019-01-01', '2021-01-01'),
(65, 6, '190795', '2019-10-01', '2021-10-01'),
(66, 12, '190787', '2019-10-01', '2021-10-01'),
(68, 8, '2003014', '2020-03-01', '2022-03-01'),
(69, 15, 'KM1672', '2021-03-01', '2023-03-01'),
(70, 20, '2004647', '2020-04-30', '2022-04-30'),
(71, 27, '2006683', '2020-06-30', '2022-06-30'),
(72, 20, '2004648', '2020-04-30', '2022-04-30'),
(73, 25, '0500620S', '2020-06-30', '2022-06-30'),
(74, 25, '05506205', '2020-06-30', '2022-06-30'),
(76, 3, '190752', '2019-10-31', '2021-10-31'),
(77, 10, '181164', '2018-10-31', '2020-10-31'),
(78, 20, '2004646', '2020-04-30', '2022-04-30'),
(79, 8, '2006022', '2020-06-30', '2022-06-30'),
(80, 8, '2006023', '2020-06-30', '2022-06-30'),
(81, 8, '2006024', '2020-06-30', '2022-06-30'),
(83, 19, '2006670', '2020-06-01', '2022-06-01'),
(84, 19, '2007686', '2020-07-01', '2022-07-01'),
(85, 1, '2006684', '2020-06-30', '2022-06-30'),
(86, 1, '2007685', '2020-06-30', '2022-06-30'),
(87, 1, '2004650', '2020-04-30', '2022-04-30'),
(88, 28, '2007025', '2020-07-01', '2022-07-01'),
(90, 17, '190804', '2019-10-31', '2021-10-31'),
(91, 16, '190593', '2019-07-31', '2021-07-31'),
(92, 13, '190704', '2019-10-31', '2021-10-31'),
(93, 14, '190789', '2019-10-31', '2021-10-31'),
(94, 29, '19040001P', '2019-04-30', '2021-04-30'),
(95, 10, '180896', '2019-12-31', '2021-12-31'),
(97, 25, '0580720S', '2020-07-01', '2022-07-01'),
(98, 18, '1911019', '2019-12-06', '2021-08-01'),
(99, 18, '2001003', '2020-02-07', '2021-08-01'),
(100, 18, '2002004', '2020-02-15', '2021-05-01'),
(101, 18, '2002005', '2021-05-01', '2021-08-01'),
(102, 18, '2002006', '2020-02-29', '2021-08-01'),
(103, 18, '2002007', '2020-03-10', '2021-08-01'),
(104, 18, '2002008', '2020-03-19', '2021-08-01'),
(105, 18, '2002009', '2020-04-03', '2021-08-01'),
(106, 25, '0510620S', '2020-06-30', '2022-06-30'),
(108, 25, '0480520S', '2020-05-31', '2022-05-31'),
(109, 25, '0520620S', '2020-06-30', '2022-06-30'),
(110, 12, '002420', '2020-01-13', '2022-01-12'),
(116, 27, '2008687', '2020-08-30', '2022-08-30'),
(117, 27, '2008688', '2020-08-30', '2022-08-30'),
(118, 12, '2008689', '2020-08-17', '2022-08-17'),
(119, 18, '1I1703', '2019-10-30', '2021-10-30'),
(120, 18, '1I1709', '2019-11-30', '2021-11-30'),
(121, 18, '1J4761', '2019-11-30', '2021-11-30'),
(122, 18, '1I1711', '2019-11-30', '2021-11-30'),
(123, 18, '1J4763', '2019-11-30', '2021-11-30'),
(124, 18, '1J4760', '2019-11-30', '2021-11-30'),
(125, 18, '1E1759', '2019-09-30', '2021-09-30'),
(127, 18, '1J4768', '2019-11-30', '2021-11-30'),
(128, 18, '1J4766', '2019-11-30', '2021-11-30'),
(129, 18, '1L0814', '2019-12-30', '2021-12-30'),
(130, 18, '1I1702', '2019-10-30', '2021-10-30'),
(131, 18, '1J4770', '2019-12-30', '2021-12-30'),
(132, 18, '1I1701', '2019-10-30', '2021-10-30'),
(133, 18, '1I1710', '2019-11-30', '2021-10-30'),
(134, 18, '1J4773', '2019-12-30', '2021-12-30'),
(135, 18, '1J4775', '2019-12-30', '2021-12-30'),
(136, 18, '1J4769', '2019-11-30', '2021-11-30'),
(137, 18, '1J4762', '2019-11-30', '2021-11-30'),
(138, 18, '1J4767', '2019-11-30', '2021-11-30'),
(139, 18, '1J4771', '2019-12-30', '2021-12-30'),
(140, 18, '1I1713', '2019-11-30', '2021-11-30'),
(141, 18, '1J4772', '2019-12-30', '2021-12-30'),
(142, 18, '1J4774', '2019-12-30', '2021-12-30'),
(143, 18, '1N9497', '2020-01-30', '2022-01-30'),
(144, 18, '1N9499', '2020-01-30', '2022-12-30'),
(145, 18, '1I1712', '2019-11-30', '2021-11-30'),
(146, 18, '1J4765', '2019-11-30', '2021-11-30'),
(147, 18, '1M2003', '2020-01-30', '2022-01-30'),
(148, 18, '1M2006', '2020-01-30', '2022-01-30'),
(149, 18, '1M2007', '2020-01-30', '2022-01-30'),
(150, 18, '1M6045', '2020-12-30', '2022-01-30'),
(151, 18, '1M6044', '2020-01-30', '2022-01-30'),
(152, 18, '1M6053', '2020-02-28', '2022-02-28'),
(153, 18, '1M2014', '2020-01-30', '2022-12-30'),
(154, 18, '1M6054', '2020-02-28', '2022-01-28'),
(155, 18, '1M2010', '2020-01-30', '2022-01-30'),
(156, 18, '1M6055', '2020-02-28', '2022-02-28'),
(157, 18, '1M6048', '2020-02-28', '2022-02-28'),
(158, 18, '1O9078', '2020-01-30', '2022-01-30'),
(159, 18, '1M2012', '2020-01-30', '2022-01-30'),
(160, 18, '1E6849', '2019-06-30', '2020-06-30'),
(161, 18, '1F2846', '2019-08-30', '2021-08-30'),
(162, 18, '1D9183', '2019-06-30', '2021-06-30'),
(164, 18, '1M6046', '2020-01-30', '2022-01-30'),
(165, 18, '1M6049', '2020-02-28', '2022-02-28'),
(166, 18, '1M2013', '2020-01-30', '2022-01-30'),
(167, 18, '1M2004', '2020-01-30', '2022-01-30'),
(168, 18, '1M6056', '2020-02-28', '2022-02-28'),
(169, 18, '1M6058', '2020-02-28', '2022-02-28'),
(170, 18, '1M6057', '2020-02-28', '2022-02-28'),
(171, 18, '1M6050', '2020-02-28', '2022-02-28'),
(172, 18, '1M6047', '2020-01-30', '2022-01-30'),
(173, 18, '1M6052', '2020-02-28', '2022-02-28'),
(174, 18, '1M6059', '2020-02-28', '2022-02-28'),
(175, 18, '1R5436', '2020-05-30', '2022-05-30'),
(176, 18, '1R5428', '2020-05-30', '2022-05-30'),
(177, 18, '1M2009', '2020-01-30', '2022-01-30'),
(178, 18, '1R5435', '2020-05-30', '2022-05-30'),
(179, 18, '1R5430', '2020-05-30', '2022-05-30'),
(180, 18, '1R5431', '2020-05-30', '2022-05-30'),
(181, 18, '1J4764', '2019-11-30', '2020-11-30'),
(182, 27, '2008691', '2020-08-20', '2022-08-20'),
(183, 12, '2008690', '2020-08-21', '2022-08-21'),
(184, 30, '1908010', '2019-06-30', '2021-06-30'),
(185, 30, '1909011', '2019-06-30', '2021-06-20'),
(186, 30, '1910013', '2019-06-30', '2021-06-30'),
(187, 30, '0Y8449', '2019-04-30', '2021-04-30'),
(188, 30, '0Z4265', '2019-04-30', '2021-04-30'),
(189, 30, '1B1465', '2019-04-30', '2021-04-30'),
(190, 30, '1B1467', '2019-04-30', '2021-04-30'),
(192, 30, '1B1466', '2019-04-30', '2021-04-30'),
(193, 30, '1L8926', '2019-12-30', '2021-12-30'),
(194, 30, '1M8212', '2019-12-30', '2021-12-30'),
(195, 30, '1M8211', '2019-12-30', '2021-12-30'),
(196, 30, '1Q5015', '2020-03-30', '2022-03-30'),
(197, 30, '1Q5018', '2020-03-30', '2022-03-30'),
(198, 30, '1Q5016', '2020-03-30', '2022-03-30'),
(199, 30, '1Q5017', '2020-03-30', '2022-03-30'),
(200, 27, '2008692', '2020-08-28', '2022-08-28'),
(201, 18, '1R5437', '2020-05-30', '2022-05-30'),
(202, 18, '1R5433', '2020-05-30', '2022-05-30'),
(203, 18, '1R5432', '2020-05-30', '2022-05-30'),
(204, 18, '1S6619', '2020-06-30', '2022-06-30'),
(205, 18, '1S6621', '2020-06-30', '2022-06-30'),
(206, 18, '1S6615', '2020-06-30', '2022-06-30'),
(207, 18, '1S6623', '2020-06-30', '2022-06-30'),
(208, 18, '1S6620', '2020-06-30', '2022-06-30'),
(209, 18, '1R5434', '2020-05-30', '2022-05-30'),
(210, 18, '1S6616', '2020-06-30', '2022-06-30'),
(211, 18, '1S6617', '2020-06-30', '2022-06-30'),
(212, 18, '1S6624', '2020-06-30', '2022-06-30'),
(213, 18, '1R5929', '2020-05-30', '2022-05-30'),
(214, 18, '1S6622', '2020-06-30', '2022-06-30'),
(216, 18, '1S6618', '2020-06-30', '2022-06-30'),
(217, 27, '2008693', '2020-08-30', '2022-08-30'),
(219, 28, '2003010', '2020-03-30', '2022-03-30'),
(220, 28, '2001001', '2020-01-30', '2022-01-30'),
(221, 28, '1911018', '2019-10-30', '2022-10-30');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cw_produto`
--

INSERT INTO `cw_produto` (`id_produto`, `nome_produto`, `em_estoque`) VALUES
(1, 'ALCOOL GEL 70% LITRO', '1'),
(2, 'AMBROXOL 30MG/5ML XAROPE', '1'),
(3, 'AMOXICILINA 500MG', '1'),
(4, 'BENZOATO DE BENZILA 25%', '1'),
(5, 'CAPTOPRIL 25MG', '1'),
(6, 'CEFALEXINA 500MG', '1'),
(8, 'CLOROQUINA 150MG', '1'),
(10, 'DEXAMETASONA 0,1% BISNAGA', '1'),
(12, 'DIPIRONA 500MG ', '1'),
(13, 'GLIBENCLAMIDA 5 MG', '1'),
(14, 'HIDROCLOROTIAZIDA 25 MG', '1'),
(15, 'HIDROXICLOROQUINA 200 MG ', '1'),
(16, 'METOCLOPRAMIDA 10 MG', '1'),
(17, 'METRONIDAZOL 250 MG', '1'),
(18, 'MICOFENOLATO DE SÓDIO 360MG', '1'),
(19, 'MICONAZOL', '1'),
(20, 'MULTIVITAM', '1'),
(21, 'NEOMICINA + BACITRACINA ', '1'),
(22, 'PASTA DE CAMUFLAGEM MARROM', '1'),
(23, 'PASTA DE CAMUFLAGEM PRETA', '1'),
(24, 'PASTA DE CAMUFLAGEM VERDE', '1'),
(25, 'PROTETOR SOLAR FPS 60', '1'),
(26, 'REPELENTE FARDA KIT', '1'),
(27, 'REPELENTE GEL', '1'),
(28, 'RIFAMPICINA 300MG', '1'),
(29, 'SABONETE LÍQUIDO', '1'),
(30, 'MICOFENOLATO DE SÓDIO 180MG', '1'),
(32, 'ALCOOL GEL 70% BISNAGA', '1');

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
  `id_transportadora` tinyint(4) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_lote_produto` int(11) NOT NULL,
  `id_usuario` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_saida_produto`),
  KEY `id_cliente_fk` (`id_cliente`),
  KEY `id_tipo_pedido_fk` (`id_tipo_pedido`),
  KEY `id_lote_produto_fk2` (`id_lote_produto`),
  KEY `id_transportadora_fk` (`id_transportadora`),
  KEY `id_usuario_fk2` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=834 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cw_saida_produto`
--

INSERT INTO `cw_saida_produto` (`id_saida_produto`, `data_saida_produto`, `guia_saida_produto`, `quantidade_saida_produto`, `id_tipo_pedido`, `id_transportadora`, `id_cliente`, `id_lote_produto`, `id_usuario`) VALUES
(10, '2020-07-15', '152/20', 30000, 8, 1, 37, 11, 2),
(11, '2020-07-14', '153/20', 10000, 8, 1, 42, 9, 2),
(12, '2020-07-15', '156/20', 54000, 8, 1, 34, 11, 2),
(13, '2020-07-14', '159/20', 9000, 8, 1, 33, 11, 2),
(14, '2020-07-14', '161/20', 15000, 8, 1, 39, 11, 2),
(15, '2020-07-15', '163/20', 1500, 8, 1, 41, 11, 2),
(16, '2020-07-15', '164/20', 4500, 8, 1, 38, 11, 2),
(17, '2020-07-14', '168/20', 36000, 8, 1, 40, 9, 2),
(18, '2020-07-14', '168/20', 3500, 8, 1, 40, 25, 2),
(19, '2020-07-14', '168/20', 500, 8, 1, 40, 6, 2),
(20, '2020-07-15', '170/20', 1000, 8, 1, 43, 11, 2),
(21, '2020-07-15', '170/20', 200, 8, 1, 43, 25, 2),
(22, '2020-07-14', '172/20', 12000, 8, 1, 36, 9, 2),
(23, '2020-07-15', '154/20', 50000, 8, 1, 21, 11, 2),
(24, '2020-07-15', '158/20', 10000, 8, 1, 2, 11, 2),
(25, '2020-07-15', '160/20', 15000, 8, 1, 26, 11, 2),
(26, '2020-07-15', '165/20', 10000, 8, 1, 28, 11, 2),
(27, '2020-07-15', '155/20', 16000, 8, 1, 23, 11, 2),
(30, '2020-07-14', '157/20', 1000, 8, 1, 24, 9, 2),
(31, '2020-07-15', '162/20', 24000, 8, 1, 13, 9, 2),
(32, '2020-07-14', '167/20', 60000, 8, 1, 30, 9, 2),
(33, '2020-07-14', '171/20', 20000, 8, 1, 19, 9, 2),
(36, '2020-07-14', '162/20', 76000, 8, 1, 13, 6, 2),
(38, '2020-07-15', '155/20', 24000, 8, 1, 23, 10, 2),
(40, '2020-04-09', '-', 620, 10, 2, 6, 23, 2),
(41, '2020-04-01', '-', 2500, 10, 2, 6, 13, 2),
(42, '2020-04-06', '-', 1000, 10, 2, 6, 25, 2),
(45, '2020-04-07', '71/20', 16800, 5, 3, 44, 13, 2),
(46, '2020-04-07', '72/20', 9600, 5, 3, 45, 13, 2),
(47, '2020-04-07', '73/20', 6800, 5, 3, 46, 13, 2),
(48, '2020-04-07', '74/20', 2400, 5, 3, 47, 13, 2),
(49, '2020-04-07', '76/20', 1200, 5, 3, 48, 13, 2),
(55, '2020-07-20', '218/20', 15000, 5, 1, 164, 12, 3),
(57, '2020-07-20', '269/20', 50, 5, 2, 166, 71, 3),
(58, '2020-07-20', '267/20', 50, 5, 2, 167, 54, 3),
(59, '2020-04-07', '82/20', 2250, 5, 1, 54, 13, 2),
(60, '2020-04-07', '83/20', 1250, 5, 1, 55, 13, 2),
(61, '2020-04-07', '77/20', 1250, 5, 1, 49, 13, 2),
(62, '2020-04-07', '78/20', 1250, 5, 1, 50, 13, 2),
(63, '2020-04-07', '79/20', 1250, 5, 1, 51, 13, 2),
(64, '2020-04-07', '80/20', 1250, 5, 1, 52, 13, 2),
(65, '2020-04-07', '81/20', 3150, 5, 1, 53, 13, 2),
(66, '2020-04-07', '84/20', 1350, 5, 1, 56, 13, 2),
(67, '2020-04-07', '85/20', 6400, 5, 1, 57, 13, 2),
(68, '2020-04-08', '86/20', 3200, 5, 1, 58, 13, 2),
(69, '2020-04-07', '87/20', 3200, 5, 1, 59, 13, 2),
(70, '2020-04-07', '88/20', 2500, 5, 1, 60, 13, 2),
(71, '2020-04-07', '89/20', 500, 5, 1, 61, 13, 2),
(72, '2020-07-16', '214/20', 30000, 9, 2, 168, 69, 3),
(73, '2020-07-15', '215/20', 2000, 9, 1, 169, 69, 3),
(74, '2020-07-13', '262/20', 50, 5, 2, 170, 60, 3),
(75, '2020-07-14', '264/20', 100, 5, 2, 171, 71, 3),
(76, '2020-07-14', '264/20', 1500, 5, 2, 171, 17, 3),
(77, '2020-07-14', '264/20', 1500, 5, 2, 171, 26, 3),
(78, '2020-07-14', '212/20', 78, 5, 2, 171, 73, 3),
(79, '2020-07-14', '212/20', 22, 5, 2, 171, 74, 3),
(80, '2020-07-14', '263/20', 50, 5, 2, 172, 60, 3),
(81, '2020-07-15', '209/20', 504, 5, 2, 173, 76, 3),
(87, '2020-07-21', '220/20', 200, 5, 2, 174, 77, 3),
(88, '2020-07-23', '221/20', 10000, 9, 1, 81, 69, 3),
(89, '2020-04-07', '90/20', 200, 5, 1, 62, 13, 2),
(90, '2020-04-07', '91/20', 5400, 5, 1, 63, 13, 2),
(91, '2020-04-07', '92/20', 2400, 5, 1, 64, 13, 2),
(92, '2020-04-07', '93/20', 1200, 5, 1, 65, 13, 2),
(93, '2020-04-09', '94/20', 2200, 5, 1, 66, 13, 2),
(94, '2020-04-09', '95/20', 1500, 5, 1, 67, 13, 2),
(95, '2020-04-09', '96/20', 1300, 5, 1, 68, 13, 2),
(96, '2020-04-09', '97/20', 2200, 5, 1, 69, 13, 2),
(97, '2020-04-09', '98/20', 2200, 5, 1, 70, 13, 2),
(98, '2020-04-09', '99/20', 2800, 5, 1, 71, 13, 2),
(99, '2020-04-09', '100/20', 550, 5, 1, 72, 13, 2),
(100, '2020-04-09', '101/20', 250, 5, 1, 73, 13, 2),
(101, '2020-04-07', '102/20', 3500, 5, 1, 74, 13, 2),
(102, '2020-04-08', '103/20', 1000, 5, 1, 75, 13, 2),
(103, '2020-04-07', '104/20', 2000, 5, 1, 76, 13, 2),
(104, '2020-04-07', '105/20', 1000, 5, 1, 77, 13, 2),
(105, '2020-04-07', '106/20', 2750, 5, 1, 78, 13, 2),
(106, '2020-04-07', '107/20', 1250, 5, 1, 79, 13, 2),
(107, '2020-04-07', '108/20', 500, 5, 1, 80, 13, 2),
(108, '2020-04-07', '109/20', 6500, 5, 1, 81, 13, 2),
(109, '2020-04-07', '110/20', 3200, 5, 1, 82, 13, 2),
(110, '2020-04-14', '98/20', 5000, 8, 1, 149, 68, 2),
(111, '2020-04-14', '103/20', 5000, 8, 1, 9, 68, 2),
(114, '2020-07-23', '034/20', 5000, 1, 2, 83, 66, 3),
(115, '2020-07-23', '268/20', 8250, 1, 2, 83, 16, 3),
(116, '2020-04-14', '105/20', 10000, 8, 1, 151, 68, 2),
(119, '2020-04-14', '108/20', 19000, 8, 1, 22, 68, 2),
(120, '2020-04-15', '109/20', 14000, 8, 1, 23, 68, 2),
(123, '2020-04-14', '112/20', 27000, 8, 1, 3, 68, 2),
(124, '2020-04-14', '113/20', 5000, 8, 1, 26, 68, 2),
(125, '2020-04-14', '114/20', 6000, 8, 1, 2, 68, 2),
(126, '2020-04-14', '115/20', 10000, 8, 1, 13, 68, 2),
(127, '2020-04-14', '116/20', 5000, 8, 1, 14, 25, 2),
(129, '2020-04-14', '118/20', 5000, 8, 1, 16, 68, 2),
(130, '2020-04-14', '119/20', 27000, 8, 1, 4, 68, 2),
(131, '2020-04-15', '120/20', 4000, 8, 1, 27, 25, 2),
(132, '2020-04-15', '120/20', 96000, 8, 1, 27, 23, 2),
(133, '2020-04-14', '121/20', 12000, 8, 1, 28, 68, 2),
(134, '2020-04-14', '122/20', 5000, 8, 1, 30, 68, 2),
(135, '2009-04-14', '123/20', 5000, 8, 1, 153, 68, 2),
(136, '2020-04-14', '124/20', 22000, 8, 1, 29, 68, 2),
(137, '2020-04-14', '125/20', 27000, 8, 1, 5, 68, 2),
(138, '2020-04-14', '126/20', 5000, 8, 1, 32, 68, 2),
(139, '2020-04-15', '127/20', 144000, 8, 1, 31, 23, 2),
(140, '2020-04-15', '127/20', 172000, 8, 1, 31, 24, 2),
(141, '2020-04-14', '128/20', 500, 8, 1, 19, 68, 2),
(142, '2020-04-14', '128/20', 1500, 8, 1, 19, 23, 2),
(146, '2020-04-16', '121/20', 500, 5, 1, 84, 13, 2),
(147, '2020-04-16', '119/20', 1780, 5, 1, 160, 25, 2),
(148, '2020-04-16', '120/20', 500, 5, 1, 83, 25, 2),
(149, '2020-04-16', '122/20', 400, 5, 1, 85, 25, 2),
(150, '2020-04-16', '123/20', 500, 5, 1, 86, 25, 2),
(151, '2020-07-28', '272/20', 30, 5, 2, 185, 61, 3),
(152, '2020-07-28', '273/20', 150, 5, 2, 186, 57, 3),
(153, '2020-04-16', '124/20', 300, 5, 1, 87, 24, 2),
(154, '2020-04-16', '125/20', 500, 5, 1, 88, 25, 2),
(155, '2020-04-16', '126/20', 300, 5, 1, 89, 24, 2),
(156, '2020-04-16', '127/20', 300, 5, 1, 90, 24, 2),
(157, '2020-04-16', '128/20', 500, 5, 1, 91, 25, 2),
(158, '2020-04-16', '128/20', 300, 5, 1, 91, 24, 2),
(159, '2020-04-16', '129/20', 500, 5, 1, 92, 25, 2),
(160, '2020-04-16', '130/20', 1500, 5, 1, 93, 25, 2),
(161, '2020-04-16', '131/20', 500, 5, 1, 94, 25, 2),
(162, '2020-04-16', '132/20', 1500, 5, 1, 95, 25, 2),
(163, '2020-04-16', '133/20', 300, 5, 1, 96, 24, 2),
(164, '2020-04-16', '134/20', 500, 5, 1, 97, 25, 2),
(165, '2020-04-25', '135/20', 100, 5, 1, 81, 24, 2),
(166, '2020-04-25', '135/20', 500, 5, 1, 81, 68, 2),
(167, '2020-04-16', '135/20', 1500, 5, 1, 81, 25, 2),
(168, '2020-04-17', '136/20', 500, 5, 1, 98, 25, 2),
(169, '2020-04-17', '137/20', 300, 5, 1, 99, 24, 2),
(170, '2020-04-17', '138/20', 300, 5, 1, 100, 24, 2),
(171, '2020-04-17', '139/20', 500, 5, 1, 101, 25, 2),
(172, '2020-04-17', '140/20', 3000, 5, 1, 102, 25, 2),
(173, '2020-04-17', '141/20', 1500, 5, 1, 103, 25, 2),
(174, '2020-04-17', '142/20', 300, 5, 1, 104, 68, 2),
(175, '2020-04-17', '143/20', 300, 5, 1, 105, 24, 2),
(176, '2020-04-17', '144/20', 500, 5, 1, 57, 25, 2),
(177, '2020-04-17', '145/20', 300, 5, 1, 107, 25, 2),
(178, '2020-04-17', '146/20', 300, 5, 1, 108, 24, 2),
(179, '2020-04-17', '147/20', 300, 5, 1, 109, 24, 2),
(180, '2020-04-17', '148/20', 300, 5, 1, 110, 24, 2),
(181, '2020-04-17', '149/20', 300, 5, 1, 111, 24, 2),
(182, '2020-04-17', '150/20', 300, 5, 1, 112, 24, 2),
(183, '2020-04-17', '151/20', 300, 5, 1, 113, 24, 2),
(184, '2020-04-17', '152/20', 300, 5, 1, 114, 24, 2),
(185, '2020-04-17', '153/20', 300, 5, 1, 115, 24, 2),
(186, '2020-04-17', '154/20', 300, 5, 1, 146, 24, 2),
(187, '2020-04-17', '155/20', 300, 5, 1, 117, 24, 2),
(188, '2020-04-17', '156/20', 300, 5, 1, 118, 24, 2),
(189, '2020-04-17', '157/20', 1500, 5, 1, 119, 24, 2),
(190, '2020-04-17', '158/20', 1500, 5, 1, 120, 24, 2),
(191, '2020-04-20', '159/20', 500, 5, 1, 121, 25, 2),
(192, '2020-04-20', '160/20', 1500, 5, 1, 122, 25, 2),
(193, '2020-04-20', '161/20', 1000, 5, 1, 123, 25, 2),
(194, '2020-04-20', '162/20', 300, 5, 1, 124, 25, 2),
(195, '2020-04-20', '163/20', 300, 5, 1, 125, 25, 2),
(197, '2020-04-20', '164/20', 300, 5, 1, 126, 25, 2),
(198, '2020-04-20', '165/20', 500, 5, 1, 127, 25, 2),
(199, '2020-04-20', '166/20', 1000, 5, 1, 128, 25, 2),
(200, '2020-04-17', '167/20', 700, 5, 1, 129, 25, 2),
(201, '2020-04-17', '168/20', 500, 5, 1, 130, 25, 2),
(202, '2020-04-17', '169/20', 300, 5, 1, 131, 25, 2),
(203, '2020-04-17', '171/20', 2000, 5, 1, 155, 25, 2),
(204, '2020-04-17', '172/20', 1000, 5, 1, 161, 25, 2),
(205, '2020-04-17', '173/20', 500, 5, 1, 134, 25, 2),
(206, '2020-04-17', '174/20', 500, 5, 1, 135, 25, 2),
(207, '2020-04-17', '175/20', 500, 5, 1, 136, 25, 2),
(208, '2020-04-17', '176/20', 500, 5, 1, 137, 25, 2),
(209, '2020-04-17', '177/20', 500, 5, 1, 138, 25, 2),
(210, '2020-04-17', '178/20', 500, 5, 1, 139, 25, 2),
(211, '2020-04-17', '179/20', 3000, 5, 1, 140, 25, 2),
(212, '2020-04-20', '180/20', 300, 5, 1, 141, 25, 2),
(213, '2020-04-20', '181/20', 300, 5, 1, 142, 25, 2),
(214, '2020-04-20', '182/20', 300, 5, 1, 143, 25, 2),
(215, '2020-04-20', '183/20', 300, 5, 1, 144, 25, 2),
(216, '2020-04-20', '184/20', 1500, 5, 1, 145, 24, 2),
(217, '2020-04-20', '185/20', 500, 5, 1, 146, 25, 2),
(218, '2020-04-20', '186/20', 1500, 5, 1, 147, 24, 2),
(219, '2020-04-20', '187/20', 500, 5, 1, 148, 24, 2),
(221, '2020-04-29', '133/20', 72000, 8, 1, 150, 24, 2),
(222, '2020-04-29', '133/20', 26000, 8, 1, 150, 13, 2),
(223, '2020-04-29', '133/20', 12000, 8, 1, 150, 68, 2),
(224, '2020-04-29', '132/20', 8000, 8, 1, 149, 13, 2),
(225, '2020-04-29', '134/20', 25000, 8, 1, 151, 13, 2),
(226, '2020-04-29', '135/20', 14000, 8, 1, 30, 68, 2),
(227, '2020-04-29', '136/20', 13000, 8, 1, 153, 13, 2),
(228, '2020-05-15', '195/20', 12000, 5, 1, 154, 68, 2),
(229, '2020-05-15', '196/20', 1000, 5, 1, 155, 68, 2),
(230, '2020-05-15', '197/20', 500, 5, 1, 155, 68, 2),
(232, '2020-05-15', '197/20', 3000, 5, 1, 155, 24, 2),
(233, '2020-04-17', '170/20', 1500, 5, 1, 163, 25, 2),
(234, '2020-06-17', '201/20', 5000, 5, 1, 187, 6, 2),
(235, '2020-07-02', '205/20', 45000, 5, 1, 187, 6, 2),
(236, '2020-06-25', '204/20', 20000, 5, 1, 161, 6, 2),
(237, '2020-07-09', '150/20', 15000, 8, 1, 35, 9, 2),
(238, '2020-07-14', '151/20', 7000, 8, 1, 149, 6, 2),
(239, '2020-07-14', '151/20', 72000, 8, 1, 149, 9, 2),
(240, '2020-04-28', '188/20', 600, 5, 1, 188, 13, 2),
(241, '2020-07-06', '210/20', 500, 5, 1, 156, 13, 2),
(242, '2020-03-31', '167/20', 20000, 5, 1, 63, 13, 2),
(243, '2020-03-31', '168/20', 5000, 5, 1, 81, 13, 2),
(244, '2020-04-03', '70/20', 400, 5, 1, 157, 13, 2),
(245, '2020-04-09', '115/20', 110, 5, 3, 160, 13, 2),
(246, '2020-04-14', '117/20', 610, 5, 3, 160, 13, 2),
(247, '2020-04-14', '116/20', 100, 5, 3, 85, 13, 2),
(248, '2020-04-16', '189/20', 5000, 5, 1, 189, 68, 2),
(249, '2020-04-28', '190/20', 400, 5, 3, 162, 23, 2),
(250, '2020-04-29', '193/20', 3300, 5, 1, 163, 13, 2),
(251, '2020-06-05', '199/20', 500, 5, 3, 85, 13, 2),
(252, '2020-07-30', '274/20', 4500, 5, 1, 191, 10, 2),
(253, '2020-07-08', '207/20', 2280, 6, 4, 192, 25, 2),
(254, '2020-07-07', '206/20', 13710, 6, 4, 193, 13, 2),
(255, '2020-07-07', '206/20', 6290, 6, 4, 193, 25, 2),
(256, '2020-07-30', '-', 1000, 10, 3, 7, 23, 2),
(257, '2020-06-04', '-', 500, 10, 2, 6, 9, 2),
(262, '2020-04-14', '110/20', 5700, 8, 1, 24, 68, 2),
(263, '2020-04-14', '110/20', 2300, 8, 1, 24, 25, 2),
(264, '2020-07-14', '166/20', 218500, 8, 1, 29, 10, 2),
(265, '2020-07-14', '166/20', 28500, 8, 1, 29, 11, 2),
(266, '2020-07-14', '166/20', 76500, 8, 1, 29, 6, 2),
(267, '2020-04-14', '106/20', 500, 8, 1, 20, 68, 2),
(268, '2020-04-14', '106/20', 23500, 8, 1, 20, 6, 2),
(269, '2020-04-14', '104/20', 50000, 8, 1, 150, 25, 2),
(270, '2020-04-14', '107/20', 60000, 8, 1, 21, 25, 2),
(271, '2020-04-14', '117/20', 37000, 8, 1, 41, 25, 2),
(272, '2020-04-14', '111/20', 16000, 8, 1, 25, 25, 2),
(273, '2020-07-30', '035/20', 50, 1, 1, 74, 76, 3),
(274, '2020-07-30', '274/20', 50, 1, 1, 74, 22, 3),
(275, '2020-04-14', '128/20', 610, 8, 1, 19, 24, 2),
(276, '2020-04-14', '128/20', 2390, 8, 1, 19, 25, 2),
(277, '2020-05-15', '197/20', 100, 5, 1, 155, 23, 2),
(278, '2020-05-15', '197/20', 1400, 5, 1, 155, 25, 2),
(279, '2020-08-03', '219/20', 50000, 9, 1, 165, 12, 3),
(280, '2020-08-03', '284/20', 350, 5, 2, 203, 71, 3),
(281, '2020-08-04', '289/20', 110, 5, 2, 204, 43, 3),
(283, '2020-08-04', '282/20', 6, 7, 2, 194, 43, 3),
(284, '2020-08-04', '282/20', 12, 7, 2, 194, 71, 3),
(285, '2020-08-04', '282/20', 6, 7, 2, 194, 22, 3),
(286, '2020-08-04', '282/20', 6, 7, 2, 194, 106, 3),
(287, '2020-08-04', '282/20', 60, 7, 2, 194, 66, 3),
(288, '2020-08-04', '280/20', 12, 7, 2, 195, 71, 3),
(289, '2020-08-04', '280/20', 6, 7, 2, 195, 43, 3),
(290, '2020-08-04', '280/20', 6, 7, 2, 195, 22, 3),
(291, '2020-08-04', '280/20', 6, 7, 2, 195, 106, 3),
(292, '2020-08-04', '280/20', 60, 7, 2, 195, 66, 3),
(293, '2020-08-04', '281/20', 12, 7, 2, 196, 71, 3),
(294, '2020-08-04', '281/20', 6, 7, 2, 196, 43, 3),
(295, '2020-08-04', '281/20', 6, 7, 2, 196, 22, 3),
(296, '2020-08-04', '281/20', 6, 7, 2, 196, 106, 3),
(297, '2020-08-04', '281/20', 60, 7, 2, 196, 66, 3),
(298, '2020-08-04', '279/20', 12, 7, 2, 197, 71, 3),
(299, '2020-08-04', '279/20', 6, 7, 2, 197, 43, 3),
(300, '2020-08-04', '279/20', 6, 7, 2, 197, 22, 3),
(301, '2020-08-04', '279/20', 6, 7, 2, 197, 106, 3),
(302, '2020-08-04', '279/20', 60, 7, 2, 197, 66, 3),
(303, '2020-08-04', '275/20', 12, 7, 2, 186, 71, 3),
(304, '2020-08-04', '275/20', 6, 7, 2, 186, 43, 3),
(305, '2020-08-04', '275/20', 6, 7, 2, 186, 22, 3),
(306, '2020-08-04', '275/20', 6, 7, 2, 186, 106, 3),
(307, '2020-08-04', '275/20', 60, 7, 2, 186, 66, 3),
(308, '2020-08-04', '276/20', 12, 7, 2, 199, 71, 3),
(309, '2020-08-04', '276/20', 6, 7, 2, 199, 43, 3),
(310, '2020-08-04', '276/20', 6, 7, 2, 199, 22, 3),
(311, '2020-08-04', '276/20', 6, 7, 2, 199, 106, 3),
(312, '2020-08-04', '276/20', 60, 7, 2, 199, 66, 3),
(313, '2020-08-04', '277/20', 6, 7, 2, 200, 71, 3),
(314, '2020-08-04', '277/20', 6, 7, 2, 200, 43, 3),
(315, '2020-08-04', '277/20', 6, 7, 2, 200, 22, 3),
(316, '2020-08-04', '277/20', 6, 7, 2, 200, 106, 3),
(317, '2020-08-04', '277/20', 60, 7, 2, 200, 66, 3),
(318, '2020-08-04', '278/20', 6, 7, 2, 201, 71, 3),
(319, '2020-08-04', '278/20', 6, 7, 2, 201, 43, 3),
(320, '2020-08-04', '278/20', 6, 7, 2, 201, 22, 3),
(321, '2020-08-04', '278/20', 6, 7, 2, 201, 106, 3),
(322, '2020-08-04', '278/20', 60, 7, 2, 201, 66, 3),
(323, '2020-08-04', '283/20', 6, 7, 2, 202, 71, 3),
(324, '2020-08-04', '283/20', 6, 7, 2, 202, 43, 3),
(325, '2020-08-04', '283/20', 6, 7, 2, 202, 22, 3),
(326, '2020-08-04', '283/20', 6, 7, 2, 202, 106, 3),
(327, '2020-08-04', '283/20', 60, 7, 2, 202, 66, 3),
(328, '2020-08-04', '290/20', 12, 7, 2, 205, 71, 3),
(329, '2020-08-04', '292/20', 12, 7, 2, 207, 71, 3),
(330, '2020-08-04', '291/20', 12, 7, 2, 206, 71, 3),
(331, '2020-08-04', '290/20', 6, 7, 2, 205, 43, 3),
(332, '2020-08-04', '290/20', 6, 7, 2, 205, 22, 3),
(333, '2020-08-04', '290/20', 6, 7, 2, 205, 106, 3),
(334, '2020-08-04', '290/20', 60, 7, 2, 207, 66, 3),
(335, '2020-08-04', '292/20', 6, 7, 2, 207, 43, 3),
(336, '2020-08-04', '291/20', 6, 7, 2, 206, 43, 3),
(337, '2020-08-04', '292/20', 6, 7, 2, 207, 22, 3),
(338, '2020-08-04', '291/20', 6, 7, 2, 206, 22, 3),
(339, '2020-08-04', '292/20', 6, 7, 2, 207, 106, 3),
(340, '2020-08-04', '291/20', 6, 7, 2, 206, 106, 3),
(341, '2020-08-04', '292/20', 60, 7, 2, 207, 66, 3),
(342, '2020-08-04', '291/20', 60, 7, 2, 206, 66, 3),
(343, '2020-08-04', '-', 100, 9, 2, 7, 13, 3),
(344, '2020-08-05', '-', 340, 9, 2, 7, 24, 3),
(345, '2020-08-05', '036/20', 500, 1, 2, 45, 64, 3),
(346, '2020-08-05', '036/20', 200, 1, 2, 45, 95, 3),
(347, '2020-08-05', '036/20', 500, 1, 2, 45, 93, 3),
(348, '2020-08-05', '036/20', 500, 1, 2, 45, 66, 3),
(349, '2020-08-05', '285/20', 990, 1, 2, 45, 16, 3),
(350, '2020-08-05', '285/20', 100, 1, 2, 45, 32, 3),
(351, '2020-08-05', '285/20', 100, 1, 2, 45, 39, 3),
(352, '2020-08-06', '287/20', 9990, 5, 2, 208, 16, 3),
(353, '2020-08-06', '287/20', 600, 5, 2, 208, 32, 3),
(354, '2020-08-06', '304/20', 100, 5, 2, 208, 93, 3),
(355, '2020-08-06', '304/20', 100, 5, 2, 208, 90, 3),
(356, '2020-08-06', '304/20', 200, 5, 2, 208, 61, 3),
(357, '2020-08-06', '304/20', 2996, 5, 2, 208, 76, 3),
(358, '2020-08-06', '304/20', 100, 5, 2, 208, 63, 3),
(359, '2020-08-06', '304/20', 200, 5, 2, 208, 64, 3),
(360, '2020-08-06', '304/20', 3000, 5, 2, 208, 65, 3),
(361, '2020-08-06', '304/20', 500, 5, 2, 208, 77, 3),
(362, '2020-08-06', '304/20', 300, 5, 2, 208, 91, 3),
(363, '2020-08-06', '286/20', 60, 5, 2, 209, 16, 3),
(364, '2020-08-06', '286/20', 300, 5, 2, 209, 32, 3),
(365, '2020-08-06', '303/20', 100, 5, 2, 209, 90, 3),
(366, '2020-08-06', '303/20', 20, 5, 2, 209, 61, 3),
(367, '2020-08-06', '303/20', 14, 5, 2, 209, 76, 3),
(368, '2020-08-06', '303/20', 20, 5, 2, 209, 63, 3),
(369, '2020-08-06', '303/20', 16, 5, 2, 209, 65, 3),
(370, '2020-08-06', '303/20', 300, 5, 2, 209, 77, 3),
(371, '2020-08-06', '303/20', 100, 5, 2, 209, 91, 3),
(372, '2020-08-06', '305/20', 50, 5, 2, 177, 106, 3),
(373, '2020-08-06', '288/20', 200, 5, 2, 177, 16, 3),
(374, '2020-08-06', '288/20', 4500, 5, 2, 177, 16, 3),
(375, '2020-08-06', '288/20', 100, 5, 2, 177, 16, 3),
(377, '2020-08-13', '294/20', 100, 5, 2, 212, 57, 3),
(378, '2020-08-11', '293/20', 3600, 5, 5, 161, 31, 3),
(379, '2020-08-11', '293/20', 400, 5, 2, 161, 32, 3),
(380, '2020-08-11', '306/20', 7000, 5, 5, 161, 76, 3),
(381, '2020-08-11', '306/20', 500, 5, 5, 161, 64, 3),
(382, '2020-08-11', '306/20', 5000, 5, 5, 161, 65, 3),
(383, '2020-08-11', '306/20', 10000, 5, 5, 161, 92, 3),
(384, '2020-08-11', '306/20', 5000, 5, 5, 161, 93, 3),
(385, '2020-08-11', '306/20', 5000, 5, 5, 161, 91, 3),
(386, '2020-08-11', '306/20', 3000, 5, 5, 161, 90, 3),
(387, '2020-08-11', '306/20', 50, 5, 5, 161, 63, 3),
(388, '2020-08-18', '363/20', 4000, 6, 2, 213, 66, 3),
(389, '2020-08-18', '313/20', 1500, 6, 2, 213, 15, 3),
(390, '2020-08-18', '313/20', 200, 6, 2, 213, 22, 3),
(391, '2020-08-18', '313/20', 450, 6, 2, 213, 39, 3),
(392, '2020-08-18', '313/20', 400, 6, 2, 213, 31, 3),
(393, '2020-08-18', '313/20', 1500, 6, 2, 213, 117, 3),
(394, '2020-08-18', '313/20', 500, 6, 2, 213, 43, 3),
(395, '2020-08-18', '270/20', 250, 5, 2, 214, 54, 3),
(396, '2020-08-18', '038/20', 1050, 1, 2, 82, 76, 3),
(397, '2020-08-18', '314/20', 100, 5, 2, 215, 46, 3),
(398, '2020-08-18', '314/20', 100, 5, 2, 215, 48, 3),
(399, '2020-08-18', '037/20', 2100, 1, 2, 60, 76, 3),
(400, '2020-08-18', '037/20', 400, 1, 2, 60, 65, 3),
(401, '2020-08-18', '037/20', 3000, 1, 2, 60, 66, 3),
(402, '2020-08-18', '037/20', 500, 1, 2, 60, 93, 3),
(403, '2020-08-18', '037/20', 500, 1, 2, 60, 90, 3),
(404, '2020-08-18', '295/20', 3000, 1, 2, 60, 15, 3),
(405, '2020-08-18', '295/20', 100, 1, 2, 60, 31, 3),
(406, '2020-08-18', '295/20', 500, 1, 2, 60, 39, 3),
(407, '2020-08-13', '173/20', 30000, 8, 1, 216, 12, 3),
(409, '2020-08-13', '175/20', 36000, 8, 1, 218, 12, 3),
(410, '2020-08-13', '176/20', 1000, 8, 1, 219, 12, 3),
(411, '2020-08-13', '177/20', 500, 8, 1, 220, 12, 3),
(412, '2020-08-13', '178/20', 40000, 8, 1, 221, 12, 3),
(413, '2020-08-13', '179/20', 9000, 8, 1, 222, 12, 3),
(414, '2020-08-13', '180/20', 500, 8, 1, 223, 12, 3),
(415, '2020-08-18', '181/20', 1000, 8, 1, 224, 12, 3),
(416, '2020-08-18', '182/20', 2000, 8, 1, 225, 12, 3),
(417, '2020-08-18', '183/20', 500, 8, 1, 226, 10, 3),
(418, '2020-08-18', '184/20', 3000, 8, 1, 227, 10, 3),
(419, '2020-08-13', '185/20', 500, 8, 1, 228, 10, 3),
(420, '2020-08-13', '186/20', 1500, 8, 1, 229, 10, 3),
(421, '2020-08-13', '187/20', 500, 8, 1, 230, 10, 3),
(422, '2020-08-13', '188/20', 2000, 8, 1, 231, 10, 3),
(423, '2020-08-13', '189/20', 500, 8, 1, 232, 10, 3),
(424, '2020-08-13', '190/20', 500, 8, 1, 233, 10, 3),
(425, '2020-08-13', '191/20', 500, 8, 1, 234, 10, 3),
(426, '2020-08-13', '192/20', 23000, 8, 1, 235, 12, 3),
(427, '2020-08-13', '193/20', 500, 8, 1, 236, 12, 3),
(428, '2020-08-13', '194/20', 500, 8, 1, 237, 12, 3),
(429, '2020-08-13', '195/20', 500, 8, 1, 238, 10, 3),
(430, '2020-08-19', '196/20', 35500, 8, 1, 239, 80, 3),
(431, '2020-08-19', '197/20', 27000, 8, 1, 240, 80, 3),
(432, '2020-08-19', '198/20', 2000, 8, 1, 241, 80, 3),
(433, '2020-08-19', '199/20', 1000, 8, 1, 242, 80, 3),
(434, '2020-08-19', '200/20', 1500, 8, 1, 243, 80, 3),
(435, '2020-08-19', '201/20', 1000, 8, 1, 244, 80, 3),
(436, '2020-08-19', '202/20', 5000, 8, 1, 245, 80, 3),
(437, '2020-08-19', '203/20', 1500, 8, 1, 246, 80, 3),
(438, '2020-08-19', '204/20', 1000, 8, 1, 247, 80, 3),
(439, '2020-08-19', '205/20', 4000, 8, 1, 248, 80, 3),
(440, '2020-08-19', '206/20', 3500, 8, 1, 249, 80, 3),
(441, '2020-08-19', '207/20', 500, 8, 1, 250, 80, 3),
(442, '2020-08-19', '208/20', 500, 8, 1, 251, 80, 3),
(443, '2020-08-19', '209/20', 500, 8, 1, 252, 80, 3),
(444, '2020-08-19', '210/20', 500, 8, 1, 253, 80, 3),
(445, '2020-08-19', '211/20', 500, 8, 1, 254, 80, 3),
(446, '2020-08-19', '212/20', 500, 8, 1, 255, 80, 3),
(447, '2020-08-19', '213/20', 2000, 8, 1, 256, 80, 3),
(448, '2020-08-19', '214/20', 500, 8, 1, 257, 80, 3),
(449, '2020-08-19', '215/20', 1500, 8, 1, 258, 80, 3),
(450, '2020-08-19', '216/20', 4500, 8, 1, 259, 80, 3),
(451, '2020-08-19', '217/20', 1000, 8, 1, 260, 80, 3),
(452, '2020-08-19', '218/20', 2000, 8, 1, 261, 80, 3),
(453, '2020-08-19', '219/20', 28500, 8, 1, 262, 80, 3),
(454, '2020-08-19', '220/20', 500, 8, 1, 263, 80, 3),
(455, '2020-08-19', '221/20', 500, 8, 1, 264, 80, 3),
(456, '2020-08-19', '222/20', 500, 8, 1, 265, 80, 3),
(458, '2020-08-19', '224/20', 13000, 8, 1, 267, 80, 3),
(459, '2020-08-19', '225/20', 3500, 8, 1, 268, 80, 3),
(460, '2020-08-19', '226/20', 1500, 8, 1, 269, 80, 3),
(461, '2020-08-19', '227/20', 20000, 8, 1, 270, 80, 3),
(462, '2020-08-19', '228/20', 500, 8, 1, 271, 80, 3),
(463, '2020-08-19', '229/20', 40000, 8, 1, 272, 80, 3),
(464, '2020-08-19', '230/20', 13500, 8, 1, 273, 80, 3),
(465, '2020-08-19', '231/20', 39000, 8, 1, 274, 80, 3),
(466, '2020-08-19', '233/20', 5500, 8, 1, 276, 80, 3),
(467, '2020-08-19', '237/20', 500, 8, 1, 280, 80, 3),
(468, '2020-08-19', '223/20', 4500, 8, 1, 266, 80, 3),
(469, '2020-08-19', '231/20', 11000, 8, 1, 274, 81, 3),
(470, '2020-08-19', '232/20', 9000, 8, 1, 275, 81, 3),
(471, '2020-08-19', '234/20', 3000, 8, 1, 277, 81, 3),
(472, '2020-08-19', '235/20', 18000, 8, 1, 278, 81, 3),
(473, '2020-08-19', '238/20', 2000, 8, 1, 281, 81, 3),
(474, '2020-08-19', '239/20', 500, 8, 1, 282, 81, 3),
(475, '2020-08-19', '240/20', 500, 8, 1, 283, 81, 3),
(476, '2020-08-19', '241/20', 1000, 8, 1, 284, 81, 3),
(477, '2020-08-19', '242/20', 1000, 8, 1, 285, 81, 3),
(478, '2020-08-19', '243/20', 3000, 8, 1, 286, 81, 3),
(479, '2020-08-19', '244/20', 1000, 8, 1, 287, 81, 3),
(480, '2020-08-19', '245/20', 1000, 8, 1, 288, 81, 3),
(481, '2020-08-19', '246/20', 500, 8, 1, 289, 81, 3),
(482, '2020-08-19', '247/20', 1000, 8, 1, 290, 81, 3),
(483, '2020-08-19', '248/20', 500, 8, 1, 291, 81, 3),
(484, '2020-08-19', '249/20', 500, 8, 1, 292, 81, 3),
(485, '2020-08-19', '250/20', 500, 8, 1, 293, 81, 3),
(486, '2020-08-19', '251/20', 500, 8, 1, 294, 81, 3),
(487, '2020-08-19', '252/20', 500, 8, 1, 295, 81, 3),
(488, '2020-08-19', '253/20', 1500, 8, 1, 296, 81, 3),
(489, '2020-08-19', '236/20', 1500, 8, 1, 279, 81, 3),
(491, '2020-03-10', '', 300, 10, 2, 6, 103, 2),
(492, '2020-03-19', '', 300, 10, 2, 6, 104, 2),
(493, '2020-04-03', '', 1000, 10, 2, 6, 105, 2),
(494, '2020-03-23', '63/20', 22300, 8, 1, 149, 103, 2),
(495, '2020-03-23', '62/20', 63300, 8, 1, 9, 103, 2),
(496, '2020-03-27', '80/20', 7800, 8, 1, 151, 104, 2),
(497, '2020-03-24', '66/20', 58900, 8, 1, 150, 103, 2),
(502, '2020-04-07', '87/20', 108000, 8, 1, 21, 140, 2),
(503, '2020-04-07', '87/20', 200, 8, 1, 21, 134, 2),
(504, '2020-03-26', '73/20', 110400, 8, 1, 22, 181, 2),
(505, '2020-03-26', '73/20', 1500, 8, 1, 22, 138, 2),
(506, '2020-04-07', '90/20', 57600, 8, 1, 22, 146, 2),
(507, '2020-04-07', '90/20', 400, 8, 1, 22, 136, 2),
(508, '2020-02-21', '', 300, 10, 2, 6, 101, 2),
(509, '2020-02-15', '', 500, 10, 2, 6, 100, 2),
(510, '2020-02-07', '', 500, 10, 2, 6, 99, 2),
(511, '2020-03-23', '65/20', 187200, 8, 1, 23, 102, 2),
(512, '2020-04-07', '88/20', 7200, 8, 1, 23, 140, 2),
(513, '2020-04-07', '88/20', 1100, 8, 1, 23, 181, 2),
(514, '2020-03-26', '75/20', 148800, 8, 1, 24, 130, 2),
(515, '2020-03-26', '75/20', 700, 8, 1, 24, 134, 2),
(516, '2020-04-08', '91/20', 62400, 8, 1, 24, 146, 2),
(517, '2020-04-08', '91/20', 400, 8, 1, 24, 131, 2),
(518, '2020-03-26', '76/20', 100800, 8, 1, 25, 136, 2),
(519, '2020-03-26', '76/20', 2000, 8, 1, 25, 135, 2),
(520, '2020-03-26', '69/20', 41600, 8, 1, 2, 104, 2),
(521, '2020-03-26', '68/20', 84000, 8, 1, 39, 181, 2),
(522, '2020-03-26', '68/20', 1800, 8, 1, 39, 135, 2),
(523, '2020-03-20', '55/20', 388800, 8, 1, 3, 138, 2),
(524, '2020-03-20', '55/20', 135300, 8, 1, 3, 139, 2),
(525, '2020-04-08', '92/20', 218400, 8, 1, 3, 148, 2),
(526, '2020-04-08', '92/20', 1800, 8, 1, 3, 147, 2),
(527, '2020-03-27', '71/20', 1300, 8, 1, 13, 131, 2),
(528, '2020-04-09', '99/20', 4800, 8, 1, 13, 145, 2),
(529, '2020-03-20', '59/20', 288000, 8, 1, 4, 133, 2),
(530, '2020-03-20', '59/20', 119200, 8, 1, 4, 136, 2),
(531, '2020-03-20', '59/20', 7200, 8, 1, 4, 131, 2),
(532, '2020-03-27', '71/20', 79200, 8, 1, 13, 139, 2),
(533, '2020-04-09', '99/20', 900, 8, 1, 13, 139, 2),
(534, '2020-03-26', '72/20', 84000, 8, 1, 14, 139, 2),
(535, '2020-03-26', '72/20', 1200, 8, 1, 14, 136, 2),
(536, '2020-04-08', '93/20', 172800, 8, 1, 4, 147, 2),
(537, '2020-04-08', '93/20', 1200, 8, 1, 4, 145, 2),
(538, '2020-03-24', '58/20', 141300, 8, 1, 41, 104, 2),
(539, '2020-03-24', '58/20', 122400, 8, 1, 41, 102, 2),
(540, '2020-04-07', '89/20', 146400, 8, 1, 41, 146, 2),
(541, '2020-04-07', '89/20', 2200, 8, 1, 41, 153, 2),
(542, '2020-03-27', '77/20', 46900, 8, 1, 16, 139, 2),
(543, '2020-08-21', '364/20', 2000, 6, 4, 297, 79, 3),
(544, '2020-08-21', '316/20', 13500, 6, 4, 297, 27, 3),
(545, '2020-08-21', '316/20', 850, 6, 4, 297, 22, 3),
(546, '2020-08-21', '316/20', 1600, 6, 4, 297, 39, 3),
(547, '2020-08-21', '316/20', 1100, 6, 4, 297, 36, 3),
(548, '2020-08-21', '316/20', 20000, 6, 4, 297, 66, 3),
(549, '2020-08-21', '316/20', 900, 6, 4, 297, 117, 3),
(550, '2020-03-20', '56/20', 189100, 8, 1, 20, 103, 2),
(551, '2020-03-20', '56/20', 600, 8, 1, 20, 104, 2),
(552, '2020-03-20', '57/20', 148300, 8, 1, 21, 104, 2),
(553, '2020-03-20', '57/20', 14400, 8, 1, 21, 102, 2),
(554, '2020-03-20', '57/20', 54000, 8, 1, 21, 101, 2),
(555, '2020-03-19', '54/20', 2400, 8, 1, 27, 135, 2),
(556, '2020-03-19', '54/20', 392000, 8, 1, 27, 134, 2),
(557, '2020-04-09', '96/20', 88800, 8, 1, 27, 140, 2),
(558, '2020-04-09', '96/20', 57700, 8, 1, 27, 145, 2),
(559, '2020-04-09', '96/20', 52800, 8, 1, 27, 148, 2),
(560, '2020-04-09', '96/20', 43200, 8, 1, 27, 141, 2),
(561, '2020-04-09', '96/20', 50400, 8, 1, 27, 142, 2),
(562, '2020-03-26', '70/20', 124800, 8, 1, 28, 131, 2),
(563, '2020-03-26', '70/20', 100, 8, 1, 28, 135, 2),
(564, '2020-03-20', '60/20', 369600, 8, 1, 29, 135, 2),
(565, '2020-03-20', '60/20', 300, 8, 1, 29, 134, 2),
(566, '2020-03-20', '60/20', 86400, 8, 1, 29, 133, 2),
(567, '2020-04-08', '94/20', 98400, 8, 1, 29, 149, 2),
(568, '2020-04-08', '94/20', 2400, 8, 1, 29, 99, 2),
(569, '2020-04-08', '94/20', 108000, 8, 1, 29, 148, 2),
(570, '2020-04-08', '94/20', 800, 8, 1, 29, 141, 2),
(571, '2020-03-27', '79/20', 43200, 8, 1, 30, 131, 2),
(572, '2020-03-27', '79/20', 1000, 8, 1, 30, 133, 2),
(573, '2020-03-27', '74/20', 4500, 8, 1, 153, 139, 2),
(574, '2020-08-27', '318/20', 200, 5, 2, 299, 116, 3),
(575, '2020-08-27', '256/20', 4000, 8, 1, 300, 79, 3),
(576, '2020-08-27', '369/20', 207500, 10, 1, 301, 88, 2),
(577, '2020-08-27', '366/20', 300, 5, 1, 302, 12, 2),
(578, '2020-08-27', '368/20', 1000, 5, 1, 302, 77, 2),
(579, '2020-08-27', '368/20', 400, 5, 1, 302, 63, 2),
(580, '2020-09-27', '368/20', 450, 5, 1, 302, 74, 2),
(581, '2020-02-20', '45/20', 19440, 8, 1, 10, 184, 1),
(582, '2020-08-27', '319/20', 750, 5, 1, 302, 27, 2),
(583, '2020-02-20', '45/20', 138600, 8, 1, 10, 186, 1),
(584, '2020-08-17', '319/20', 3750, 5, 1, 302, 15, 2),
(585, '2020-08-27', '319/20', 450, 5, 1, 302, 116, 2),
(586, '2020-03-16', '52/20', 6480, 8, 1, 10, 187, 1),
(587, '2020-08-27', '319/20', 450, 5, 1, 302, 43, 2),
(589, '2020-08-27', '319/20', 240, 5, 1, 302, 45, 2),
(590, '2020-03-16', '52/20', 11520, 8, 1, 10, 189, 1),
(591, '2020-08-27', '319/20', 240, 5, 1, 302, 49, 2),
(592, '2020-08-27', '319/20', 240, 5, 1, 302, 47, 2),
(593, '2020-03-16', '52/20', 170280, 8, 1, 10, 190, 1),
(594, '2020-03-16', '52/20', 6960, 8, 1, 10, 193, 1),
(595, '2020-03-16', '52/20', 460800, 8, 1, 10, 192, 1),
(596, '2020-03-26', '67/20', 456000, 8, 1, 10, 193, 1),
(598, '2020-05-26', '143/20', 360360, 8, 1, 10, 194, 1),
(599, '2020-05-26', '143/20', 486960, 8, 1, 10, 195, 1),
(600, '2020-05-26', '143/20', 425880, 8, 1, 10, 196, 1),
(601, '2020-08-21', '254/20', 720, 8, 1, 10, 193, 1),
(602, '2020-08-21', '254/20', 120, 8, 1, 10, 195, 1),
(603, '2020-08-21', '254/20', 45720, 8, 1, 10, 196, 1),
(605, '2020-08-21', '254/20', 487080, 8, 1, 10, 199, 1),
(606, '2020-08-21', '254/20', 264600, 8, 1, 10, 197, 1),
(607, '2019-09-27', ' ', 240, 10, 2, 6, 184, 2),
(608, '2019-12-18', '171/19', 2640, 8, 1, 9, 184, 1),
(609, '2019-10-10', '', 600, 10, 2, 6, 185, 2),
(610, '2019-12-17', '172/19', 960, 8, 1, 151, 184, 1),
(611, '2019-10-21', '', 600, 10, 2, 6, 186, 2),
(612, '2019-12-17', '173/19', 480, 8, 1, 150, 184, 1),
(613, '2019-12-18', '174/19', 1200, 8, 1, 20, 184, 1),
(614, '2019-12-18', '175/19', 3960, 8, 1, 22, 184, 1),
(615, '2019-12-30', '', 3000, 10, 2, 303, 184, 2),
(616, '2019-12-18', '176/19', 6480, 8, 1, 23, 184, 1),
(617, '2019-12-18', '177/19', 11280, 8, 1, 24, 184, 1),
(618, '2019-12-17', '178/19', 2280, 8, 1, 25, 184, 1),
(619, '2019-12-17', '179/19', 2760, 8, 1, 2, 184, 1),
(620, '2019-12-17', '180/19', 2400, 8, 1, 26, 184, 1),
(621, '2019-12-16', '181/19', 135720, 8, 1, 3, 184, 1),
(622, '2019-12-18', '182/19', 24240, 8, 1, 235, 184, 1),
(623, '2019-12-18', '183/19', 13920, 8, 1, 14, 184, 1),
(624, '2019-12-18', '184/19', 25440, 8, 1, 235, 186, 1),
(625, '2019-12-17', '185/19', 13200, 8, 1, 15, 184, 1),
(626, '2019-12-17', '186/19', 480, 8, 1, 16, 184, 1),
(628, '2019-12-18', '187/19', 11040, 8, 1, 27, 184, 1),
(630, '2019-12-18', '188/19', 62640, 8, 1, 29, 186, 1),
(631, '2019-12-17', '189/19', 2640, 8, 1, 17, 184, 1),
(632, '2019-12-18', '190/19', 2400, 8, 1, 153, 184, 1),
(633, '2019-12-17', '191/19', 60720, 8, 1, 5, 184, 1),
(634, '2019-12-16', '192/19', 140520, 8, 1, 31, 184, 1),
(635, '2019-12-18', '193/19', 1920, 8, 1, 32, 184, 1),
(636, '2020-08-27', '320/20', 5000, 5, 3, 304, 77, 2),
(637, '2019-12-18', '194/19', 1080, 8, 1, 19, 184, 1),
(638, '2019-12-17', '195/19', 490800, 8, 1, 10, 185, 1),
(639, '2019-12-17', '195/19', 252720, 8, 1, 10, 186, 1),
(640, '2020-05-20', '139/20', 51800, 8, 1, 10, 141, 1),
(641, '2020-05-20', '139/20', 7200, 8, 1, 10, 145, 1),
(642, '2020-05-20', '139/20', 31200, 8, 1, 10, 140, 1),
(643, '2020-05-20', '139/20', 3000, 8, 1, 10, 148, 1),
(644, '2020-05-20', '139/20', 294840, 8, 1, 10, 149, 1),
(645, '2020-05-20', '139/20', 2100, 8, 1, 10, 150, 1),
(646, '2020-08-28', '365/20', 19950, 6, 4, 298, 76, 3),
(647, '2020-05-20', '139/20', 1080, 8, 1, 10, 162, 1),
(648, '2020-08-28', '365/20', 19000, 6, 4, 298, 65, 3),
(649, '2020-05-20', '139/20', 240, 8, 1, 10, 160, 1),
(650, '2020-08-28', '365/20', 2500, 6, 4, 298, 93, 3),
(651, '2020-05-20', '139/20', 1440, 8, 1, 10, 161, 1),
(652, '2020-05-20', '139/20', 389640, 8, 1, 10, 158, 1),
(653, '2020-08-28', '365/20', 7500, 6, 4, 298, 91, 3),
(654, '2020-05-20', '138/20', 393100, 8, 1, 10, 154, 1),
(655, '2020-05-20', '138/20', 393100, 8, 1, 10, 159, 1),
(656, '2020-05-20', '138/20', 382300, 8, 1, 10, 152, 1),
(657, '2020-05-20', '138/20', 386400, 8, 1, 10, 156, 1),
(658, '2020-05-20', '138/20', 129900, 8, 1, 10, 153, 1),
(659, '2020-05-20', '138/20', 395200, 8, 1, 10, 151, 1),
(660, '2020-05-20', '137/20 - CARTA DE CO', 324700, 8, 1, 10, 105, 1),
(661, '2020-05-20', '137/20', 8500, 8, 1, 10, 102, 1),
(662, '2020-08-28', '365/20', 144, 6, 4, 298, 73, 3),
(663, '2020-08-28', '365/20', 864, 6, 4, 298, 97, 3),
(664, '2020-05-20', '137/20 - CARTA DE CO', 1400, 8, 1, 10, 104, 1),
(665, '2020-08-28', '365/20', 1152, 6, 4, 298, 74, 3),
(666, '2020-05-20', '137/20', 100, 8, 1, 10, 101, 1),
(667, '2020-05-20', '137/20', 300, 8, 1, 10, 103, 1),
(668, '2020-08-28', '317/20', 15750, 6, 4, 298, 17, 3),
(669, '2020-08-28', '317/20', 2600, 6, 4, 298, 22, 3),
(670, '2020-05-20', '137/20', 345600, 8, 1, 10, 142, 1),
(671, '2020-08-28', '317/20', 5050, 6, 4, 298, 39, 3),
(672, '2020-05-20', '137/20', 384400, 8, 1, 10, 155, 1),
(673, '2020-08-28', '317/20', 2350, 6, 4, 298, 38, 3),
(674, '2020-05-20', '137/20', 384700, 8, 1, 10, 157, 1),
(675, '2020-08-28', '317/20', 3650, 6, 4, 298, 32, 3),
(676, '2020-08-28', '317/20', 3600, 6, 4, 298, 37, 3),
(677, '2020-08-28', '317/20', 50000, 6, 4, 298, 118, 3),
(678, '2020-08-28', '317/20', 900, 6, 4, 298, 116, 3),
(679, '2020-05-20', '137/20 - CARTA DE CO', 256800, 8, 1, 10, 153, 1),
(680, '2020-05-25', '140/20', 384000, 8, 1, 10, 164, 1),
(681, '2020-05-25', '140/20', 202900, 8, 1, 10, 150, 1),
(682, '2020-05-25', '140/20', 364500, 8, 1, 10, 165, 1),
(683, '2020-05-25', '140/20', 386500, 8, 1, 10, 167, 1),
(684, '2020-05-25', '141/20', 395900, 8, 1, 10, 168, 1),
(685, '2020-05-25', '141/20', 372100, 8, 1, 10, 171, 1),
(686, '2020-05-25', '141/20', 395400, 8, 1, 10, 170, 1),
(687, '2020-05-25', '141/20', 288300, 8, 1, 10, 166, 1),
(688, '2020-05-25', '142/20', 392600, 8, 1, 10, 169, 1),
(689, '2020-05-25', '142/20', 86400, 8, 1, 10, 166, 1),
(690, '2020-03-20', '61/20', 273600, 8, 1, 5, 136, 2),
(691, '2020-05-25', '142/20', 100800, 8, 1, 10, 150, 1),
(692, '2020-06-01', '147/20', 384400, 8, 1, 10, 174, 1),
(693, '2020-04-08', '95/20', 110400, 8, 1, 252, 146, 2),
(694, '2020-06-01', '147/20', 396100, 8, 1, 10, 172, 1),
(695, '2020-04-08', '95/20', 2400, 8, 1, 5, 147, 2),
(696, '2020-06-01', '147/20', 384900, 8, 1, 10, 173, 1),
(697, '2020-04-08', '95/20', 1900, 8, 1, 5, 146, 2),
(698, '2020-04-08', '95/20', 100, 8, 1, 5, 135, 2),
(699, '2020-06-20', '149/20', 324400, 8, 1, 10, 176, 1),
(700, '2020-04-08', '95/20', 100, 8, 1, 5, 140, 2),
(701, '2020-06-20', '149/20', 361800, 8, 1, 10, 177, 1),
(702, '2020-03-18', '53/20', 288000, 8, 1, 31, 101, 2),
(703, '2020-06-20', '149/20', 403300, 8, 1, 10, 179, 1),
(704, '2020-06-20', '149/20', 367500, 8, 1, 10, 180, 1),
(705, '2020-03-18', '53/20', 379500, 8, 1, 31, 129, 2),
(706, '2020-06-20', '149/20', 384000, 8, 1, 10, 178, 1),
(707, '2020-06-20', '149/20', 394800, 8, 1, 10, 175, 1),
(708, '2020-03-18', '53/20', 367400, 8, 1, 31, 132, 2),
(709, '2020-03-18', '53/20', 397600, 8, 1, 31, 137, 2),
(710, '2020-06-20', '149/20', 400, 8, 1, 10, 181, 1),
(711, '2020-03-18', '53/20', 86400, 8, 1, 31, 181, 2),
(712, '2020-03-18', '53/20', 14400, 8, 1, 31, 122, 2),
(713, '2020-03-18', '53/20', 2400, 8, 1, 31, 130, 2),
(714, '2020-04-08', '86/20', 380160, 8, 1, 31, 143, 2),
(715, '2020-04-08', '86/20', 364800, 8, 1, 31, 144, 2),
(716, '2020-04-08', '86/20', 4800, 8, 1, 31, 145, 2),
(717, '2020-04-08', '86/20', 2000, 8, 1, 31, 153, 2),
(718, '2020-03-26', '78/20', 21600, 8, 1, 32, 131, 2),
(719, '2020-03-26', '78/20', 900, 8, 1, 32, 122, 2),
(720, '2020-03-27', '81/20', 4200, 1, 1, 19, 181, 2),
(721, '2020-04-09', '100/20', 600, 8, 1, 19, 153, 2),
(722, '2020-04-09', '100/20', 600, 8, 1, 19, 133, 2),
(723, '2020-04-09', '100/20', 200, 8, 1, 19, 129, 2),
(724, '2020-03-09', '51/20', 384200, 8, 1, 10, 128, 2),
(725, '2020-03-09', '51/20', 351700, 8, 1, 10, 122, 2),
(726, '2020-03-09', '51/20', 379300, 8, 1, 10, 124, 2),
(727, '2020-03-09', '51/20', 389700, 8, 1, 10, 127, 2),
(728, '2020-03-09', '51/20', 389100, 8, 1, 10, 121, 2),
(729, '2020-03-09', '85/20', 388100, 8, 1, 10, 123, 2),
(730, '2020-04-06', '85/20', 81600, 8, 1, 10, 131, 2),
(731, '2020-04-06', '85/20', 31200, 8, 1, 10, 139, 2),
(732, '2020-04-06', '85/20', 216000, 8, 1, 10, 130, 2),
(733, '2020-04-06', '85/20', 156000, 8, 1, 10, 140, 2),
(734, '2020-04-06', '85/20', 14400, 8, 1, 10, 135, 2),
(735, '2020-04-06', '85/20', 301400, 8, 1, 10, 145, 2),
(736, '2020-04-06', '85/20', 201600, 8, 1, 10, 147, 2),
(737, '2020-04-06', '85/20', 302400, 8, 1, 10, 141, 2),
(738, '2020-04-06', '85/20', 240, 8, 1, 10, 143, 2),
(739, '2020-04-06', '85/20', 700, 8, 1, 10, 138, 2),
(740, '2020-04-06', '85/20', 360, 8, 1, 10, 143, 2),
(741, '2020-08-31', '371/20', 1000, 5, 1, 84, 79, 3),
(742, '2020-08-31', '372/20', 3000, 5, 1, 142, 79, 3),
(743, '2020-08-31', '320/20', 200, 5, 1, 305, 182, 3),
(747, '2020-08-31', '254/20', 475440, 8, 1, 10, 198, 3),
(748, '2020-08-31', '373/20', 500, 5, 1, 306, 79, 3),
(749, '2020-08-31', '374/20', 500, 5, 1, 307, 79, 3),
(750, '2020-08-31', '375/20', 500, 5, 1, 308, 79, 3),
(751, '2020-08-31', '376/20', 500, 5, 1, 309, 79, 3),
(752, '2020-08-31', '377/20', 500, 5, 1, 310, 79, 3),
(753, '2020-08-31', '378/20', 500, 5, 1, 311, 79, 3),
(754, '2020-08-31', '379/20', 500, 5, 1, 312, 79, 3),
(755, '2020-09-01', '380/20', 2000, 5, 2, 204, 77, 3),
(756, '2020-06-01', '145/20 - Reposição G', 120, 8, 1, 29, 196, 2),
(757, '2020-01-14', '02/20 - REPOSIÇÃO DA', 4680, 8, 1, 10, 184, 2),
(758, '2020-01-14', '02/20 - REPOSIÇÃO DA', 1080, 8, 1, 10, 185, 2),
(759, '2020-01-14', '02/20 - REPOSIÇÃO DA', 120, 8, 1, 10, 186, 2),
(760, '2020-03-16', '52/20', 3480, 8, 1, 10, 188, 2),
(761, '2020-08-12', '174/20', 1000, 8, 1, 217, 13, 2),
(762, '2020-03-10', 'AVARIAS - LOG REVERS', 2160, 8, 1, 313, 186, 2),
(763, '2020-03-10', 'AVARIAS - LOG REVERS', 1440, 8, 1, 313, 184, 2),
(765, '2020-06-15', '143/20 - CARTA DE CO', 120, 8, 1, 10, 198, 2),
(766, '2020-06-15', '143/20 - CARTA DE CO', 240, 8, 1, 10, 193, 2),
(767, '2020-06-15', '143/20 - CARTA DE CO', 360, 8, 1, 10, 188, 2),
(768, '2020-09-03', '322/20', 100, 9, 2, 314, 200, 3),
(769, '2020-09-03', '322/20', 20, 9, 2, 314, 71, 3),
(770, '2020-08-31', '255/20', 395300, 8, 1, 10, 202, 2),
(771, '2020-08-31', '255/20', 388300, 8, 1, 10, 203, 2),
(772, '2020-08-31', '255/20', 391800, 8, 1, 10, 201, 2),
(773, '2020-08-31', '255/20', 219700, 8, 1, 10, 213, 2),
(774, '2020-08-31', '255/20', 343200, 8, 1, 10, 214, 2),
(775, '2020-08-31', '255/20', 100800, 8, 1, 10, 216, 2),
(776, '2020-09-01', '256/20', 289100, 8, 1, 10, 216, 2),
(777, '2020-09-01', '256/20', 316800, 8, 1, 10, 205, 2),
(778, '2020-09-01', '256/20', 42900, 8, 1, 10, 214, 2),
(779, '2020-09-01', '256/20', 371000, 8, 1, 10, 210, 2),
(780, '2020-09-01', '256/20', 392000, 8, 1, 10, 209, 2),
(781, '2020-09-01', '256/20', 172800, 8, 1, 10, 213, 2),
(782, '2020-09-01', '256/20', 136600, 8, 1, 10, 204, 2),
(783, '2020-09-01', '256 A/20', 117600, 8, 1, 10, 207, 2),
(784, '2020-09-01', '257/20', 244800, 8, 1, 10, 204, 2),
(785, '2020-09-01', '257/20', 59800, 8, 1, 10, 205, 2),
(786, '2020-09-01', '257/20', 397200, 8, 1, 10, 208, 2),
(787, '2020-09-01', '257/20', 241200, 8, 1, 10, 207, 2),
(788, '2020-09-01', '257/20', 387300, 8, 1, 10, 206, 2),
(789, '2020-09-01', '257/20', 120200, 8, 1, 10, 212, 2),
(790, '2020-09-01', '257/20', 385700, 8, 1, 10, 211, 2),
(791, '2020-09-02', 'AVARIA - LOGISTICA R', 600, 10, 1, 315, 207, 2),
(792, '2020-09-02', 'AVARIA - LOGISTICA R', 200, 10, 1, 315, 212, 2),
(793, '2020-09-02', 'AVARIA - LOGISTICA R', 200, 10, 1, 315, 216, 2),
(794, '2020-09-02', 'AVARIA - LOGISTICA R', 200, 10, 1, 315, 202, 2),
(795, '2020-09-02', 'AVARIA - LOGISTICA R', 600, 10, 1, 315, 206, 2),
(796, '2020-09-02', 'AVARIA - LOGISTICA R', 100, 10, 1, 315, 211, 2),
(797, '2020-09-02', 'AVARIA - LOGISTICA R', 480, 10, 1, 315, 197, 2),
(798, '2020-03-23', 'AVARIA - LOGISTICA R', 1100, 10, 1, 313, 130, 2),
(799, '2020-03-23', 'AVARIA - LOGISTICA R', 100, 10, 1, 313, 131, 2),
(800, '2020-06-20', '137/20 - CARTA DE CO', 3600, 8, 1, 10, 145, 2),
(801, '2020-06-20', '137/20 - CARTA DE CO', 3600, 8, 1, 10, 130, 2),
(802, '2020-09-02', 'CAUTELA - LOGÍSTICA ', 60000, 10, 3, 316, 64, 2),
(803, '2020-08-04', '381/20', 888, 5, 1, 317, 63, 3),
(804, '2020-09-04', '381/20', 1000, 5, 1, 317, 77, 3),
(805, '2020-09-04', '381/20', 28, 5, 1, 317, 106, 3),
(806, '2020-09-04', '381/20', 72, 5, 1, 317, 97, 3),
(807, '2020-09-04', '321/20', 100, 5, 1, 317, 116, 3),
(808, '2020-09-04', '321/20', 6000, 5, 1, 317, 70, 3),
(809, '2020-09-04', '323/20', 50, 1, 1, 74, 29, 3),
(810, '2020-09-04', '323/20', 1500, 1, 1, 74, 27, 3),
(811, '2020-09-04', '323/20', 1500, 1, 1, 74, 70, 3),
(812, '2020-03-01', '-', 500, 10, 2, 6, 7, 2),
(813, '2020-04-30', '', 540, 10, 2, 6, 219, 2),
(814, '2020-04-08', '101/20', 202500, 8, 1, 10, 219, 2),
(815, '2020-04-08', '102/20', 24500, 8, 1, 10, 219, 2),
(816, '2020-02-10', '34/20', 228500, 8, 1, 10, 220, 2),
(817, '2019-12-06', ' ', 1500, 10, 2, 6, 221, 2),
(818, '2019-12-14', '224/19', 224500, 8, 1, 10, 221, 2),
(819, '2020-02-10', '34/20', 3500, 8, 1, 10, 221, 2),
(820, '2020-09-09', '385/20', 4000, 5, 1, 72, 81, 3),
(821, '2020-09-09', '386/20', 1000, 5, 1, 139, 81, 3),
(822, '2020-09-09', '382/20', 500, 5, 2, 49, 81, 3),
(823, '2020-09-09', '367/20', 4000, 5, 1, 330, 81, 3),
(824, '2020-09-09', '367/20', 1500, 5, 1, 330, 66, 3),
(825, '2020-09-09', '367/20', 2000, 5, 1, 330, 91, 3),
(826, '2020-02-20', '46/20', 342000, 8, 1, 31, 100, 2),
(827, '2020-02-18', '44/20', 373000, 8, 1, 31, 99, 2),
(828, '2020-03-04', '48/20', 371600, 8, 1, 31, 119, 2),
(829, '2020-03-09', '49/20', 24777, 8, 1, 10, 122, 2),
(830, '2020-03-09', '49/20', 57700, 8, 1, 10, 120, 2),
(831, '2020-03-09', '49/20', 386896, 8, 1, 10, 125, 2),
(832, '2020-03-04', '48/20', 325500, 8, 1, 31, 120, 2),
(833, '2020-09-10', '296/20', 12, 7, 2, 329, 200, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cw_tipo_pedido`
--

DROP TABLE IF EXISTS `cw_tipo_pedido`;
CREATE TABLE IF NOT EXISTS `cw_tipo_pedido` (
  `id_tipo_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_pedido` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cw_tipo_pedido`
--

INSERT INTO `cw_tipo_pedido` (`id_tipo_pedido`, `tipo_pedido`) VALUES
(1, 'FAEx'),
(5, 'Extraordinário'),
(6, 'Dotação'),
(7, 'Missão'),
(8, 'Ministério da Saúde'),
(9, 'Doação'),
(10, 'Outro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cw_transportadora`
--

DROP TABLE IF EXISTS `cw_transportadora`;
CREATE TABLE IF NOT EXISTS `cw_transportadora` (
  `id_transportadora` tinyint(4) NOT NULL AUTO_INCREMENT,
  `transportadora` varchar(100) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_transportadora`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cw_transportadora`
--

INSERT INTO `cw_transportadora` (`id_transportadora`, `transportadora`, `status`) VALUES
(1, 'AIRWAY', '1'),
(2, '-', '1'),
(3, 'PRÓPRIA', '1'),
(4, 'ECT', '1'),
(5, 'FAB', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cw_usuario`
--

DROP TABLE IF EXISTS `cw_usuario`;
CREATE TABLE IF NOT EXISTS `cw_usuario` (
  `id_usuario` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nome_completo_usuario` varchar(100) NOT NULL,
  `apelido_usuario` varchar(50) NOT NULL,
  `login_usuario` varchar(11) NOT NULL,
  `senha_usuario` varchar(32) NOT NULL,
  `nivel_usuario` enum('1','2','3') NOT NULL DEFAULT '3' COMMENT 'Nível 1 - Todos os Privilégios, 2 - Não exclui registros e não altera estoque, 3 - Só observa estoque.',
  `status_usuario` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cw_usuario`
--

INSERT INTO `cw_usuario` (`id_usuario`, `nome_completo_usuario`, `apelido_usuario`, `login_usuario`, `senha_usuario`, `nivel_usuario`, `status_usuario`) VALUES
(1, 'Felipe Gonçalves de Marins', 'Sd Gonçalves', '0108072174', '0108072174', '1', '1'),
(2, 'Deolinda da Conceição de Castro Moreira Carneiro', 'Ten Cel De Castro', '0115120248', '0115120248', '1', '1'),
(3, 'Manuela Tombasco Duffles Texeira', 'Asp Tombasco', '0118569375', '0118569375', '1', '1'),
(4, 'Haroldo Paiva Galvão', 'Cel Galvão', '0203911649', '0203911649', '3', '1');

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
,`id_lote` int(11)
,`lote` varchar(30)
,`dtf` varchar(10)
,`dtv` varchar(10)
,`total_entrada` decimal(54,0)
,`total_saida` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `lote_produto`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `lote_produto`;
CREATE TABLE IF NOT EXISTS `lote_produto` (
`id_produto` int(11)
,`id_lote` int(11)
,`lote` varchar(30)
,`dtf` varchar(10)
,`dtv` varchar(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `produto`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
`id` int(11)
,`produto` varchar(100)
,`em_estoque` enum('0','1')
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
,`id_entrada` int(11)
,`dtent` varchar(20)
,`nota` varchar(50)
,`quant_ent` int(11)
,`id_fornecedor` int(11)
,`fornecedor` varchar(100)
,`cnpj_fornecedor` varchar(20)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `rastreamento_produto`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `rastreamento_produto`;
CREATE TABLE IF NOT EXISTS `rastreamento_produto` (
`id_produto` int(11)
,`produto` varchar(100)
,`em_estoque` enum('0','1')
,`id_lote` int(11)
,`lote` varchar(30)
,`dtf` varchar(10)
,`dtv` varchar(10)
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
,`id_saida` int(11)
,`dtsai` varchar(20)
,`guia` varchar(20)
,`quant_sai` int(11)
,`id_transp` tinyint(4)
,`transp` varchar(100)
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
,`nome_produto` varchar(100)
,`id_lote_produto` int(11)
,`lote_produto` varchar(30)
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `estoque`  AS  select `p`.`id_produto` AS `id_produto`,`p`.`nome_produto` AS `produto`,`p`.`em_estoque` AS `em_estoque`,`lp`.`id_lote_produto` AS `id_lote`,`lp`.`lote_produto` AS `lote`,`lp`.`fabricacao_produto` AS `dtf`,`lp`.`validade_produto` AS `dtv`,`tep`.`total_entrada` AS `total_entrada`,`tsp`.`total_saida` AS `total_saida` from (((`cw_produto` `p` left join `cw_lote_produto` `lp` on(`p`.`id_produto` = `lp`.`id_produto`)) left join `total_entrada_lote_produto` `tep` on(`lp`.`id_lote_produto` = `tep`.`id_lote_produto`)) left join `total_saida_lote_produto` `tsp` on(`lp`.`id_lote_produto` = `tsp`.`id_lote_produto`)) group by `lp`.`id_lote_produto` order by `p`.`nome_produto` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `estoque_final`
--
DROP TABLE IF EXISTS `estoque_final`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `estoque_final`  AS  select `p`.`id_produto` AS `id_produto`,`p`.`nome_produto` AS `produto`,`p`.`em_estoque` AS `em_estoque`,`lp`.`id_lote_produto` AS `id_lote`,`lp`.`lote_produto` AS `lote`,`lp`.`fabricacao_produto` AS `dtf`,`lp`.`validade_produto` AS `dtv`,sum(`tep`.`total_entrada`) AS `total_entrada`,sum(`tsp`.`total_saida`) AS `total_saida` from (((`cw_produto` `p` left join `cw_lote_produto` `lp` on(`p`.`id_produto` = `lp`.`id_produto`)) left join `total_entrada_lote_produto` `tep` on(`lp`.`id_lote_produto` = `tep`.`id_lote_produto`)) left join `total_saida_lote_produto` `tsp` on(`lp`.`id_lote_produto` = `tsp`.`id_lote_produto`)) group by `p`.`id_produto` order by `p`.`nome_produto` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `lote_produto`
--
DROP TABLE IF EXISTS `lote_produto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lote_produto`  AS  select `lp`.`id_produto` AS `id_produto`,`lp`.`id_lote_produto` AS `id_lote`,`lp`.`lote_produto` AS `lote`,`lp`.`fabricacao_produto` AS `dtf`,`lp`.`validade_produto` AS `dtv` from `cw_lote_produto` `lp` order by `lp`.`id_produto` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `produto`
--
DROP TABLE IF EXISTS `produto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `produto`  AS  select `p`.`id_produto` AS `id`,`p`.`nome_produto` AS `produto`,`p`.`em_estoque` AS `em_estoque` from `cw_produto` `p` order by `p`.`nome_produto` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `rastreamento_entrada`
--
DROP TABLE IF EXISTS `rastreamento_entrada`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rastreamento_entrada`  AS  select `p`.`id_produto` AS `id_produto`,`p`.`nome_produto` AS `produto`,`lp`.`id_lote_produto` AS `id_lote`,`lp`.`lote_produto` AS `lote`,`lp`.`fabricacao_produto` AS `dtf`,`lp`.`validade_produto` AS `dtv`,`ep`.`id_entrada_produto` AS `id_entrada`,`ep`.`data_entrada_produto` AS `dtent`,`ep`.`nota_fiscal_entrada_produto` AS `nota`,`ep`.`quantidade_entrada_produto` AS `quant_ent`,`f`.`id_fornecedor` AS `id_fornecedor`,`f`.`nome_fornecedor` AS `fornecedor`,`f`.`cnpj_fornecedor` AS `cnpj_fornecedor` from (((`cw_produto` `p` join `cw_lote_produto` `lp` on(`p`.`id_produto` = `lp`.`id_produto`)) join `cw_entrada_produto` `ep` on(`lp`.`id_lote_produto` = `ep`.`id_lote_produto`)) join `cw_fornecedor` `f` on(`ep`.`id_fornecedor` = `f`.`id_fornecedor`)) order by `lp`.`id_lote_produto` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `rastreamento_produto`
--
DROP TABLE IF EXISTS `rastreamento_produto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rastreamento_produto`  AS  select `p`.`id_produto` AS `id_produto`,`p`.`nome_produto` AS `produto`,`p`.`em_estoque` AS `em_estoque`,`lp`.`id_lote_produto` AS `id_lote`,`lp`.`lote_produto` AS `lote`,`lp`.`fabricacao_produto` AS `dtf`,`lp`.`validade_produto` AS `dtv` from (`cw_produto` `p` join `cw_lote_produto` `lp` on(`p`.`id_produto` = `lp`.`id_produto`)) group by `lp`.`lote_produto` order by `p`.`id_produto` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `rastreamento_saida`
--
DROP TABLE IF EXISTS `rastreamento_saida`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rastreamento_saida`  AS  select `p`.`id_produto` AS `id_produto`,`p`.`nome_produto` AS `produto`,`lp`.`id_lote_produto` AS `id_lote`,`lp`.`lote_produto` AS `lote`,`lp`.`fabricacao_produto` AS `dtf`,`lp`.`validade_produto` AS `dtv`,`sp`.`id_saida_produto` AS `id_saida`,`sp`.`data_saida_produto` AS `dtsai`,`sp`.`guia_saida_produto` AS `guia`,`sp`.`quantidade_saida_produto` AS `quant_sai`,`sp`.`id_transportadora` AS `id_transp`,`t`.`transportadora` AS `transp`,`c`.`id_cliente` AS `id_cliente`,`c`.`nome_cliente` AS `cliente`,`tp`.`id_tipo_pedido` AS `id_tipo_pedido`,`tp`.`tipo_pedido` AS `tipo_pedido` from (((((`cw_produto` `p` join `cw_lote_produto` `lp` on(`p`.`id_produto` = `lp`.`id_produto`)) join `cw_saida_produto` `sp` on(`lp`.`id_lote_produto` = `sp`.`id_lote_produto`)) join `cw_cliente` `c` on(`sp`.`id_cliente` = `c`.`id_cliente`)) join `cw_tipo_pedido` `tp` on(`sp`.`id_tipo_pedido` = `tp`.`id_tipo_pedido`)) join `cw_transportadora` `t` on(`sp`.`id_transportadora` = `t`.`id_transportadora`)) order by `lp`.`id_lote_produto` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `total_entrada_lote_produto`
--
DROP TABLE IF EXISTS `total_entrada_lote_produto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_entrada_lote_produto`  AS  select `p`.`id_produto` AS `id_produto`,`p`.`nome_produto` AS `nome_produto`,`lp`.`id_lote_produto` AS `id_lote_produto`,`lp`.`lote_produto` AS `lote_produto`,`ep`.`id_entrada_produto` AS `id_entrada_produto`,sum(`ep`.`quantidade_entrada_produto`) AS `total_entrada` from ((`cw_produto` `p` join `cw_lote_produto` `lp` on(`p`.`id_produto` = `lp`.`id_produto`)) left join `cw_entrada_produto` `ep` on(`lp`.`id_lote_produto` = `ep`.`id_lote_produto`)) group by `lp`.`lote_produto` order by `p`.`id_produto` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `total_saida_lote_produto`
--
DROP TABLE IF EXISTS `total_saida_lote_produto`;

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
  ADD CONSTRAINT `id_tipo_pedido_fk` FOREIGN KEY (`id_tipo_pedido`) REFERENCES `cw_tipo_pedido` (`id_tipo_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_transportadora_fk` FOREIGN KEY (`id_transportadora`) REFERENCES `cw_transportadora` (`id_transportadora`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_usuario_fk2` FOREIGN KEY (`id_usuario`) REFERENCES `cw_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
