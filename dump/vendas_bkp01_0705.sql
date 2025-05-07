-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07/05/2025 às 14:55
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vendas`
--
CREATE DATABASE IF NOT EXISTS `vendas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vendas`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fabricantes`
--

CREATE TABLE `fabricantes` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fabricantes`
--

INSERT INTO `fabricantes` (`id`, `nome`) VALUES
(2, 'Dell'),
(3, 'Apple'),
(5, 'Samsung'),
(6, 'Brastemp'),
(7, 'Positivo'),
(8, 'Microsoft'),
(9, 'sony'),
(10, 'intel'),
(11, 'Mercedes'),
(13, 'Ford'),
(14, 'chevrolet');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(6,2) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `fabricante_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `preco`, `quantidade`, `fabricante_id`) VALUES
(1, 'Ultrabook', 'Equipamento de última geração cheio de recursos, e etc e tal...', 3999.45, 7, 2),
(2, 'Tablet Android', 'Tablet com a versão 16 do sistema operacinal Android, possui tela de 10\r\n    polegadas e armazenamento de 128 GB. Estou sem ideias do que escrever aqui.', 900.00, 10, 5),
(3, 'Geladeira', 'Refrigerador frost-free com acesso à internet', 5000.00, 12, 6),
(5, 'iPad Mini', 'Tablet Apple com tela retina display e bla bla bla e mó bunitinha', 4999.12, 5, 3),
(6, 'Xbox Series S', 'Um video game de velocidade e desempenho de última geração', 1997.00, 5, 8),
(7, 'Notebook Motion', 'Notbook da intel Dual Core 4GB de RAM, 128GB SSD e Tela 14,1 polegadas', 1213.65, 10, 7),
(8, 'Teclado Gamer', 'Teclado bom pra caramba pra jogar.', 300.00, 3, 2),
(10, 'Smartphone Poco x7', 'Celular chique com inteligência artificial', 1999.99, 7, 5),
(11, 'SmartTV', 'TV curvada com tela de 50 polegadas', 1587.12, 15, 5),
(13, 'Computador Gamer', 'um computador com uma excelente performasse para quem gosta de jogar', 7000.00, 7, 10);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `fabricantes`
--
ALTER TABLE `fabricantes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produtos_fabricantes` (`fabricante_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `fabricantes`
--
ALTER TABLE `fabricantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_produtos_fabricantes` FOREIGN KEY (`fabricante_id`) REFERENCES `fabricantes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
