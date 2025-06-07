-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: food_flight_delivery
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acrescimos`
--

DROP TABLE IF EXISTS `acrescimos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acrescimos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `establishment_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `establishment_id` (`establishment_id`),
  CONSTRAINT `acrescimos_ibfk_1` FOREIGN KEY (`establishment_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acrescimos`
--

LOCK TABLES `acrescimos` WRITE;
/*!40000 ALTER TABLE `acrescimos` DISABLE KEYS */;
INSERT INTO `acrescimos` VALUES (1,'queijos',4.00,1,'2025-05-18 22:44:26');
/*!40000 ALTER TABLE `acrescimos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa_pdv`
--

DROP TABLE IF EXISTS `caixa_pdv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caixa_pdv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estabelecimento_id` int(11) NOT NULL,
  `valor_inicial` decimal(10,2) NOT NULL,
  `data_abertura` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_fechamento` timestamp NULL DEFAULT NULL,
  `valor_fechamento` decimal(10,2) DEFAULT NULL,
  `status` enum('aberto','fechado') DEFAULT 'aberto',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `estabelecimento_id` (`estabelecimento_id`),
  CONSTRAINT `caixa_pdv_ibfk_1` FOREIGN KEY (`estabelecimento_id`) REFERENCES `estabelecimentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa_pdv`
--

LOCK TABLES `caixa_pdv` WRITE;
/*!40000 ALTER TABLE `caixa_pdv` DISABLE KEYS */;
INSERT INTO `caixa_pdv` VALUES (1,1,232.00,'2025-05-29 04:07:48',NULL,NULL,'aberto','2025-05-29 04:07:48','2025-05-29 04:07:48');
/*!40000 ALTER TABLE `caixa_pdv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `estabelecimento_id` int(11) NOT NULL,
  `status` enum('ativo','inativo') DEFAULT 'ativo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `estabelecimento_id` (`estabelecimento_id`),
  CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`estabelecimento_id`) REFERENCES `estabelecimentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Bebidas','Refrigerantes, sucos e água',1,'ativo','2025-05-29 04:08:08','2025-05-29 04:08:08'),(2,'Lanches','Sanduíches e hambúrgueres',1,'ativo','2025-05-29 04:08:08','2025-05-29 04:08:08'),(3,'Porções','Porções e petiscos',1,'ativo','2025-05-29 04:08:08','2025-05-29 04:08:08');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `establishment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categories_users` (`establishment_id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`establishment_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_categories_users` FOREIGN KEY (`establishment_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=737 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Lanches',NULL,1,NULL),(2,'Pizzas',NULL,1,NULL),(3,'Bebidas',NULL,1,NULL),(4,'Sobremesas',NULL,1,NULL),(5,'Combos',NULL,1,NULL),(727,'Hambúrguer artesanal','',0,15),(728,'Hot dogs','',0,15),(729,'Batatas','',0,15),(730,'Bebidas','',0,15),(731,'Cervejas','',0,15),(732,'Bebidas',NULL,0,1),(733,'Lanches',NULL,0,1),(734,'Sobremesas',NULL,0,1),(735,'Pratos Principais',NULL,0,1),(736,'Saladas',NULL,0,1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_creation_log`
--

DROP TABLE IF EXISTS `category_creation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_creation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `script_name` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `request_data` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_creation_log`
--

LOCK TABLES `category_creation_log` WRITE;
/*!40000 ALTER TABLE `category_creation_log` DISABLE KEYS */;
INSERT INTO `category_creation_log` VALUES (1,727,'Hambúrguer artesanal',0,'2025-05-19 15:31:57','pc-casa','1008','AUTO_TRIGGER','establishment_id:15'),(2,728,'Hot dogs',0,'2025-05-19 15:32:04','pc-casa','1009','AUTO_TRIGGER','establishment_id:15'),(3,729,'Batatas',0,'2025-05-19 15:32:08','pc-casa','1010','AUTO_TRIGGER','establishment_id:15'),(4,730,'Bebidas',0,'2025-05-19 15:32:14','pc-casa','1011','AUTO_TRIGGER','establishment_id:15'),(5,731,'Cervejas',0,'2025-05-19 15:32:20','pc-casa','1012','AUTO_TRIGGER','establishment_id:15'),(6,732,'Bebidas',0,'2025-05-26 12:21:49','pc-casa','191','AUTO_TRIGGER','establishment_id:1'),(7,733,'Lanches',0,'2025-05-26 12:21:49','pc-casa','191','AUTO_TRIGGER','establishment_id:1'),(8,734,'Sobremesas',0,'2025-05-26 12:21:49','pc-casa','191','AUTO_TRIGGER','establishment_id:1'),(9,735,'Pratos Principais',0,'2025-05-26 12:21:49','pc-casa','191','AUTO_TRIGGER','establishment_id:1'),(10,736,'Saladas',0,'2025-05-26 12:21:49','pc-casa','191','AUTO_TRIGGER','establishment_id:1');
/*!40000 ALTER TABLE `category_creation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estabelecimentos`
--

DROP TABLE IF EXISTS `estabelecimentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estabelecimentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(32) NOT NULL,
  `endereco` text DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `status` enum('ativo','inativo') DEFAULT 'ativo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estabelecimentos`
--

LOCK TABLES `estabelecimentos` WRITE;
/*!40000 ALTER TABLE `estabelecimentos` DISABLE KEYS */;
INSERT INTO `estabelecimentos` VALUES (1,'Meu Restaurante','restaurante@email.com','e10adc3949ba59abbe56e057f20f883e','Rua Exemplo, 123','(11) 99999-9999','ativo','2025-05-29 04:07:20','2025-05-29 04:07:20');
/*!40000 ALTER TABLE `estabelecimentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establishment_delivery`
--

DROP TABLE IF EXISTS `establishment_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `establishment_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `establishment_id` int(11) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `apply_fee` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_estdelivery_establishment` (`establishment_id`),
  KEY `fk_estdelivery_delivery` (`delivery_id`),
  CONSTRAINT `establishment_delivery_ibfk_1` FOREIGN KEY (`establishment_id`) REFERENCES `users` (`id`),
  CONSTRAINT `establishment_delivery_ibfk_2` FOREIGN KEY (`delivery_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_estdelivery_delivery` FOREIGN KEY (`delivery_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_estdelivery_establishment` FOREIGN KEY (`establishment_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establishment_delivery`
--

LOCK TABLES `establishment_delivery` WRITE;
/*!40000 ALTER TABLE `establishment_delivery` DISABLE KEYS */;
INSERT INTO `establishment_delivery` VALUES (2,15,9,1,1,'2025-05-21 23:19:32'),(4,1,9,0,1,'2025-05-26 13:25:02');
/*!40000 ALTER TABLE `establishment_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establishment_profile`
--

DROP TABLE IF EXISTS `establishment_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `establishment_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `restaurant_name` varchar(255) NOT NULL,
  `business_hours` varchar(255) NOT NULL,
  `delivery_radius` int(11) NOT NULL DEFAULT 5,
  `pix_key` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `cuisine_type` varchar(50) NOT NULL,
  `minimum_order` decimal(10,2) NOT NULL DEFAULT 20.00,
  `delivery_fee` decimal(10,2) NOT NULL DEFAULT 5.00,
  `logo_url` varchar(255) DEFAULT NULL,
  `banner_url` varchar(255) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_id` (`user_id`),
  CONSTRAINT `establishment_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establishment_profile`
--

LOCK TABLES `establishment_profile` WRITE;
/*!40000 ALTER TABLE `establishment_profile` DISABLE KEYS */;
INSERT INTO `establishment_profile` VALUES (1,1,'backlojinha','seg-sex-19 as 18',5,'179912882098','teste','brasileira',20.00,3.00,'uploads/logos/logo_682a973a62764.png','uploads/banners/banner_682a973a62b40.png','@backbolado','17 99754 8917','2025-05-19 02:28:10','2025-05-19 02:28:10'),(2,10,'Pizzaria Bella Napoli','Ter-Dom: 18h-23h',5,'11999999999','A melhor pizzaria italiana da cidade','pizzaria',40.00,5.00,NULL,NULL,'@bellanapoli','11999999999','2025-05-19 02:31:19','2025-05-19 02:31:19'),(3,11,'Hamburgueria Big Burger','Seg-Dom: 11h-23h',7,'11988888888','Hambúrgueres artesanais deliciosos','lanches',30.00,6.00,NULL,NULL,'@bigburger','11988888888','2025-05-19 02:31:19','2025-05-19 02:31:19'),(4,12,'Comida Japonesa Sakura','Seg-Sab: 11h-22h',6,'11977777777','O melhor da culinária japonesa','japonesa',50.00,7.00,NULL,NULL,'@sakurasushi','11977777777','2025-05-19 02:31:19','2025-05-19 02:31:19'),(5,13,'Doceria Sweet Dreams','Seg-Sab: 9h-20h',8,'11966666666','Doces e sobremesas artesanais','doces',25.00,8.00,NULL,NULL,'@sweetdreams','11966666666','2025-05-19 02:31:19','2025-05-19 02:31:19'),(6,14,'Restaurante Sabor Caseiro','Seg-Sex: 11h-15h',5,'11955555555','Comida caseira com sabor de mãe','brasileira',35.00,5.00,NULL,NULL,'@saborcaseiro','11955555555','2025-05-19 02:31:19','2025-05-19 02:31:19'),(7,15,'oba hot dog lanches','sex- terça ',5,'179912882098','r','lanches',20.00,3.00,NULL,NULL,'','','2025-06-01 04:12:45','2025-06-01 04:12:45');
/*!40000 ALTER TABLE `establishment_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_venda_pdv`
--

DROP TABLE IF EXISTS `itens_venda_pdv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_venda_pdv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venda_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `venda_id` (`venda_id`),
  KEY `produto_id` (`produto_id`),
  CONSTRAINT `itens_venda_pdv_ibfk_1` FOREIGN KEY (`venda_id`) REFERENCES `vendas_pdv` (`id`),
  CONSTRAINT `itens_venda_pdv_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_venda_pdv`
--

LOCK TABLES `itens_venda_pdv` WRITE;
/*!40000 ALTER TABLE `itens_venda_pdv` DISABLE KEYS */;
/*!40000 ALTER TABLE `itens_venda_pdv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacoes_caixa`
--

DROP TABLE IF EXISTS `movimentacoes_caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacoes_caixa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caixa_id` int(11) NOT NULL,
  `tipo` enum('entrada','saida') NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descricao` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `caixa_id` (`caixa_id`),
  CONSTRAINT `movimentacoes_caixa_ibfk_1` FOREIGN KEY (`caixa_id`) REFERENCES `caixa_pdv` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacoes_caixa`
--

LOCK TABLES `movimentacoes_caixa` WRITE;
/*!40000 ALTER TABLE `movimentacoes_caixa` DISABLE KEYS */;
INSERT INTO `movimentacoes_caixa` VALUES (1,1,'entrada',232.00,'Abertura de caixa','2025-05-29 04:07:48');
/*!40000 ALTER TABLE `movimentacoes_caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_groups`
--

DROP TABLE IF EXISTS `option_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `option_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT 0,
  `min_selections` int(11) DEFAULT 0,
  `max_selections` int(11) DEFAULT 1,
  `establishment_id` int(11) NOT NULL,
  `product_type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `establishment_id` (`establishment_id`),
  CONSTRAINT `option_groups_ibfk_1` FOREIGN KEY (`establishment_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_groups`
--

LOCK TABLES `option_groups` WRITE;
/*!40000 ALTER TABLE `option_groups` DISABLE KEYS */;
INSERT INTO `option_groups` VALUES (2,'Cheddar Extra','Grupo de opções: Cheddar Extra',0,0,1,15,'EXTRA','2025-05-19 15:19:20'),(3,'acréscimos','Grupo de opções: acréscimos',0,0,4,15,'EXTRA','2025-05-19 15:20:20'),(4,'Hambúrgueres','Grupo de opções: Hambúrgueres',1,1,1,15,'EXTRA','2025-05-19 15:29:38');
/*!40000 ALTER TABLE `option_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `additional_price` decimal(10,2) DEFAULT 0.00,
  `is_available` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `options_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `option_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (2,2,'cheddar cremoso','Opção: cheddar cremoso',2.00,1,'2025-05-19 15:19:49'),(3,3,'maionese verde extra (25 g)','Opção: maionese verde extra (25 g)',1.00,1,'2025-05-19 15:20:37'),(4,3,'cebola roxa','Opção: cebola roxa',6.00,1,'2025-05-19 15:20:51'),(5,3,'bacon','Opção: bacon',6.00,1,'2025-05-19 15:23:12'),(6,3,'calabresa','Opção: calabresa',4.00,1,'2025-05-19 15:23:23'),(7,3,'frango','Opção: frango',5.00,1,'2025-05-19 15:23:33'),(8,3,'ovo frito','Opção: ovo frito',2.50,1,'2025-05-19 15:23:53'),(9,3,'cheddar cremoso','Opção: cheddar cremoso',2.00,1,'2025-05-19 15:24:04'),(10,3,'catupiry','Opção: catupiry',2.00,1,'2025-05-19 15:24:13'),(11,3,'salsicha','Opção: salsicha',2.00,1,'2025-05-19 15:24:21'),(12,3,'presunto','Opção: presunto',2.50,1,'2025-05-19 15:24:31'),(13,3,'mussarela','Opção: mussarela',5.00,1,'2025-05-19 15:25:05'),(14,3,'cheddar fatiado Polenghi','Opção: cheddar fatiado Polenghi',4.00,1,'2025-05-19 15:27:48'),(15,3,'batata palha','Opção: batata palha',1.00,1,'2025-05-19 15:27:59'),(16,3,'tomate','Opção: tomate',1.00,1,'2025-05-19 15:28:09'),(17,3,'hamburguer tradicional','Opção: hamburguer tradicional',4.00,1,'2025-05-19 15:28:18'),(18,3,'hamburguer artesanal de carne','Opção: hamburguer artesanal de carne',10.00,1,'2025-05-19 15:28:28'),(19,3,'hamburguer artesanal de frango','Opção: hamburguer artesanal de frango',8.00,1,'2025-05-19 15:28:38'),(20,3,'hamburguer artesanal de linguiça','Opção: hamburguer artesanal de linguiça',8.00,1,'2025-05-19 15:28:48'),(21,4,'2 carne bovina e 1 linguiça','Opção: 2 carne bovina e 1 linguiça',2.50,1,'2025-05-19 15:29:57'),(22,4,'2 carne bovina e 1 frango','Opção: 2 carne bovina e 1 frango',2.50,1,'2025-05-19 15:30:11'),(23,4,'Todos de carne bovina','Opção: Todos de carne bovina',5.00,1,'2025-05-19 15:30:25');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item_acrescimo`
--

DROP TABLE IF EXISTS `order_item_acrescimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item_acrescimo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_item_id` int(11) NOT NULL,
  `acrescimo_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `fk_order_item_acrescimo_option` (`acrescimo_id`),
  CONSTRAINT `fk_order_item_acrescimo_option` FOREIGN KEY (`acrescimo_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_item_acrescimo_ibfk_1` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item_acrescimo`
--

LOCK TABLES `order_item_acrescimo` WRITE;
/*!40000 ALTER TABLE `order_item_acrescimo` DISABLE KEYS */;
INSERT INTO `order_item_acrescimo` VALUES (1,76,5,4,6.00),(2,77,5,1,6.00),(3,77,15,3,1.00),(4,78,5,3,6.00),(5,79,5,3,6.00),(6,79,15,1,1.00),(7,80,5,1,6.00),(8,81,5,2,6.00),(9,82,5,1,6.00),(10,82,15,1,1.00),(11,83,5,1,6.00),(12,84,5,2,6.00),(13,84,15,1,1.00),(14,84,6,1,4.00),(15,84,10,1,2.00),(16,84,4,1,6.00),(17,84,9,1,2.00),(18,84,14,1,4.00),(19,84,7,2,5.00),(20,84,18,1,10.00),(21,84,19,1,8.00),(22,84,20,1,8.00),(23,84,17,2,4.00),(24,84,3,1,1.00),(25,84,13,1,5.00),(26,84,8,1,2.50),(27,84,12,1,2.50),(28,84,11,1,2.00),(29,84,16,1,1.00),(30,86,22,1,2.50),(31,88,15,1,1.00),(32,89,5,1,6.00);
/*!40000 ALTER TABLE `order_item_acrescimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `obs` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderitems_orders` (`order_id`),
  KEY `fk_orderitems_products` (`product_id`),
  CONSTRAINT `fk_orderitems_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_orderitems_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,22.00,NULL),(5,5,1,1,22.00,NULL),(7,6,1,2,22.00,NULL),(8,7,1,1,22.00,NULL),(9,8,1,1,22.00,NULL),(14,13,1,1,22.00,NULL),(15,14,1,1,22.00,NULL),(16,15,1,1,22.00,NULL),(17,16,1,1,22.00,NULL),(20,17,1,1,22.00,NULL),(21,18,1,1,22.00,NULL),(22,23,2,1,30.90,NULL),(23,24,2,1,30.90,NULL),(24,25,2,1,39.90,NULL),(27,26,2,1,30.90,NULL),(28,27,2,1,40.90,NULL),(29,28,2,1,35.90,NULL),(30,29,4,1,45.40,NULL),(31,29,3,1,27.00,NULL),(32,30,1,2,22.00,NULL),(33,31,1,1,22.00,NULL),(34,32,1,1,22.00,NULL),(40,33,12,1,8.00,NULL),(41,33,16,1,18.00,NULL),(42,33,17,1,22.00,NULL),(43,34,21,1,5.00,NULL),(44,34,31,1,20.00,NULL),(45,34,32,3,35.00,NULL),(46,34,14,1,6.00,NULL),(47,35,22,1,4.00,NULL),(48,36,23,1,5.50,NULL),(49,36,9,1,15.00,NULL),(50,36,22,1,4.00,NULL),(51,37,12,1,8.00,NULL),(52,38,28,1,6.50,NULL),(53,39,23,1,5.50,NULL),(54,40,2,1,30.90,NULL),(55,40,4,1,38.90,NULL),(56,41,2,1,30.90,NULL),(57,41,3,3,22.00,NULL),(58,41,5,2,12.90,NULL),(59,42,5,2,12.90,NULL),(60,42,4,3,38.90,NULL),(61,43,5,1,12.90,NULL),(62,43,3,10,22.00,NULL),(63,43,2,2,30.90,NULL),(64,43,4,1,38.90,NULL),(65,44,2,2,30.90,NULL),(66,44,3,3,22.00,NULL),(67,44,4,2,38.90,NULL),(68,44,5,3,12.90,NULL),(69,45,2,1,30.90,NULL),(70,47,2,1,36.90,NULL),(76,53,2,1,54.90,NULL),(77,54,2,1,39.90,NULL),(78,57,2,1,48.90,'hgdfshdh'),(79,58,2,1,49.90,'teste'),(80,59,2,1,36.90,'teste'),(81,60,2,1,42.90,''),(82,61,2,1,37.90,'teste'),(83,62,2,1,36.90,''),(84,63,2,1,119.90,''),(85,64,5,1,12.90,''),(86,65,4,1,41.40,''),(87,66,3,1,22.00,''),(88,70,3,1,23.00,''),(89,71,3,1,28.00,''),(90,72,5,1,12.90,'');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `establishment_id` int(11) NOT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `status` enum('PENDING','PREPARING','READY','DELIVERING','DELIVERED','CANCELLED') NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `delivery_fee` decimal(10,2) NOT NULL DEFAULT 3.00,
  `payment_method` enum('CASH','CREDIT','DEBIT','PIX') NOT NULL,
  `order_type` enum('DELIVERY','DINE_IN','PICKUP') NOT NULL DEFAULT 'DELIVERY',
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `change_amount` decimal(10,2) DEFAULT NULL,
  `payment_status` enum('PENDING','PAID') NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_orders_customer` (`customer_id`),
  KEY `fk_orders_establishment` (`establishment_id`),
  KEY `fk_orders_delivery` (`delivery_id`),
  CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `fk_orders_delivery` FOREIGN KEY (`delivery_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_orders_establishment` FOREIGN KEY (`establishment_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`establishment_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`delivery_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,1,NULL,'DELIVERED',25.00,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-18 21:28:00'),(5,7,1,NULL,'DELIVERED',25.00,3.00,'CREDIT','DELIVERY',NULL,NULL,'PENDING','2025-05-18 21:44:25'),(6,7,1,NULL,'DELIVERING',47.00,3.00,'DEBIT','DELIVERY',NULL,NULL,'PENDING','2025-05-18 21:47:40'),(7,7,1,9,'DELIVERED',25.00,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-18 21:57:21'),(8,7,1,NULL,'DELIVERED',29.00,3.00,'CREDIT','DELIVERY',NULL,NULL,'PENDING','2025-05-18 22:45:13'),(13,7,1,9,'DELIVERED',25.00,3.00,'PIX','DELIVERY',NULL,NULL,'PENDING','2025-05-18 23:18:22'),(14,7,1,9,'DELIVERED',25.00,3.00,'PIX','DELIVERY',NULL,NULL,'PENDING','2025-05-18 23:55:32'),(15,7,1,9,'DELIVERED',25.00,3.00,'CREDIT','DELIVERY',NULL,NULL,'PENDING','2025-05-19 00:03:53'),(16,7,1,9,'DELIVERED',25.00,3.00,'PIX','DELIVERY',NULL,NULL,'PENDING','2025-05-19 01:54:46'),(17,7,1,9,'DELIVERED',25.00,3.00,'PIX','DELIVERY',NULL,NULL,'PENDING','2025-05-19 02:29:18'),(18,7,1,9,'DELIVERED',25.00,3.00,'CREDIT','DELIVERY',NULL,NULL,'PENDING','2025-05-19 13:55:13'),(23,7,15,NULL,'PENDING',30.90,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-19 23:55:03'),(24,7,15,NULL,'PENDING',30.90,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-19 23:55:19'),(25,7,15,NULL,'PENDING',39.90,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-19 23:56:44'),(26,7,15,9,'DELIVERED',33.90,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-21 23:10:56'),(27,7,15,9,'DELIVERED',40.90,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-22 00:06:55'),(28,7,15,9,'DELIVERED',35.90,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-22 00:09:28'),(29,7,15,9,'DELIVERED',72.40,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-22 00:36:04'),(30,7,1,9,'DELIVERING',44.00,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-26 11:10:45'),(31,7,1,9,'DELIVERING',22.00,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-26 12:06:22'),(32,7,1,NULL,'PENDING',22.00,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-26 12:07:38'),(33,7,1,9,'DELIVERING',51.00,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-26 12:22:36'),(34,2,1,NULL,'CANCELLED',136.00,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-26 13:01:40'),(35,2,1,NULL,'PENDING',4.00,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-26 13:02:16'),(36,2,1,NULL,'PENDING',24.50,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-26 13:04:35'),(37,2,1,NULL,'PENDING',8.00,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-26 13:21:14'),(38,2,1,NULL,'PENDING',6.50,3.00,'PIX','DELIVERY',NULL,NULL,'PENDING','2025-05-26 13:22:44'),(39,2,1,9,'DELIVERING',5.50,3.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-26 13:24:30'),(40,7,15,9,'DELIVERED',69.80,0.00,'CREDIT','DELIVERY',NULL,NULL,'PENDING','2025-05-31 09:25:53'),(41,7,15,9,'DELIVERED',122.70,0.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-31 09:28:24'),(42,7,15,9,'DELIVERED',142.50,0.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-31 10:02:08'),(43,7,15,9,'DELIVERED',333.60,0.00,'PIX','DELIVERY',NULL,NULL,'PENDING','2025-05-31 10:09:42'),(44,7,15,9,'DELIVERED',244.30,0.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-05-31 10:18:31'),(45,7,15,NULL,'PENDING',30.90,0.00,'CREDIT','DELIVERY',NULL,NULL,'PENDING','2025-05-31 10:27:31'),(47,7,15,9,'DELIVERED',36.90,0.00,'CREDIT','DELIVERY',NULL,NULL,'PENDING','2025-06-01 02:17:14'),(53,7,15,NULL,'PENDING',54.90,0.00,'DEBIT','DELIVERY',NULL,NULL,'PENDING','2025-06-01 02:30:21'),(54,7,15,NULL,'PENDING',39.90,0.00,'DEBIT','DELIVERY',NULL,NULL,'PENDING','2025-06-01 02:30:48'),(57,7,15,NULL,'PENDING',48.90,0.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-06-01 02:51:05'),(58,7,15,NULL,'PENDING',49.90,0.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-06-01 02:58:27'),(59,7,15,NULL,'PENDING',36.90,0.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-06-01 02:59:44'),(60,7,15,NULL,'PENDING',42.90,0.00,'CASH','DELIVERY',NULL,NULL,'PENDING','2025-06-01 03:00:42'),(61,7,15,NULL,'PENDING',37.90,0.00,'CASH','DELIVERY',50.00,12.10,'PENDING','2025-06-01 03:02:57'),(62,7,15,9,'DELIVERED',36.90,0.00,'CASH','DELIVERY',50.00,13.10,'PENDING','2025-06-01 03:37:54'),(63,7,15,NULL,'READY',119.90,0.00,'CASH','DELIVERY',150.00,30.10,'PENDING','2025-06-01 03:43:50'),(64,7,15,NULL,'PENDING',12.90,0.00,'CREDIT','DELIVERY',NULL,NULL,'PENDING','2025-06-01 03:56:28'),(65,7,15,NULL,'PENDING',41.40,0.00,'CREDIT','DELIVERY',NULL,NULL,'PENDING','2025-06-01 03:57:28'),(66,7,15,NULL,'PENDING',22.00,0.00,'CREDIT','DELIVERY',NULL,NULL,'PENDING','2025-06-01 03:59:43'),(70,7,15,NULL,'PENDING',23.00,0.00,'CREDIT','DELIVERY',NULL,NULL,'PENDING','2025-06-01 04:08:40'),(71,19,15,NULL,'READY',28.00,0.00,'CREDIT','DELIVERY',NULL,NULL,'PENDING','2025-06-01 04:10:11'),(72,19,15,NULL,'READY',12.90,0.00,'DEBIT','DELIVERY',NULL,NULL,'PENDING','2025-06-01 04:10:40');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_acrescimo`
--

DROP TABLE IF EXISTS `product_acrescimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_acrescimo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `acrescimo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`,`acrescimo_id`),
  KEY `acrescimo_id` (`acrescimo_id`),
  CONSTRAINT `product_acrescimo_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_acrescimo_ibfk_2` FOREIGN KEY (`acrescimo_id`) REFERENCES `acrescimos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_acrescimo`
--

LOCK TABLES `product_acrescimo` WRITE;
/*!40000 ALTER TABLE `product_acrescimo` DISABLE KEYS */;
INSERT INTO `product_acrescimo` VALUES (1,1,1);
/*!40000 ALTER TABLE `product_acrescimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_groups`
--

DROP TABLE IF EXISTS `product_option_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_product_group` (`product_id`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `product_option_groups_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_option_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `option_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_groups`
--

LOCK TABLES `product_option_groups` WRITE;
/*!40000 ALTER TABLE `product_option_groups` DISABLE KEYS */;
INSERT INTO `product_option_groups` VALUES (1,2,3,'2025-05-19 17:45:57'),(2,3,3,'2025-05-22 00:34:18'),(3,4,3,'2025-05-22 00:35:01'),(4,4,4,'2025-05-22 00:35:01'),(5,5,3,'2025-05-22 00:35:31');
/*!40000 ALTER TABLE `product_option_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `establishment_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_products_users` (`establishment_id`),
  KEY `fk_products_categories` (`category_id`),
  CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_products_users` FOREIGN KEY (`establishment_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`establishment_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'x burguer','e',22.00,'',3,1,'2025-05-18 21:22:25'),(2,'Oba Duplo','2 hamburgueres artesanais (carne, frango ou linguiça), alface, queijo cheddar e maionese.',30.90,'',727,15,'2025-05-19 15:32:58'),(3,'Oba Salada','1 hamburguer artesanal, alface, queijo cheddar, milho, cenoura, tomate e maionese\r\n\r\n',22.00,'',727,15,'2025-05-22 00:34:12'),(4,'Oba Triplo','3 hamburgueres artesanais (1 de carne, 1 de frango e 1 de linguiça), alface, queijo cheddar, milho, catupiry e maionese.\r\nOBSERVAÇÃO: Substituir os hambúrgueres de frango/linguiça por carne bovina terá uma alteração no valor, selecione a opção desejada abaixo',38.90,'',727,15,'2025-05-22 00:34:50'),(5,'Bauru','Maionese, ketchup, presunto, queijo mussarela, batata palha, tomate.\r\n\r\n',12.90,'',1,15,'2025-05-22 00:35:26'),(6,'Coca-Cola','Refrigerante de cola',5.00,NULL,3,1,'2025-05-26 12:21:49'),(7,'Suco de Laranja','Suco natural de laranja',6.50,NULL,1,1,'2025-05-26 12:21:49'),(8,'Água Mineral','Água mineral sem gás',3.00,NULL,1,1,'2025-05-26 12:21:49'),(9,'Hambúrguer','Hambúrguer com queijo e bacon',15.00,NULL,2,1,'2025-05-26 12:21:49'),(10,'Sanduíche Natural','Sanduíche de frango com salada',12.00,NULL,2,1,'2025-05-26 12:21:49'),(11,'Pastel de Carne','Pastel recheado com carne moída',7.00,NULL,2,1,'2025-05-26 12:21:49'),(12,'Bolo de Chocolate','Bolo de chocolate com cobertura',8.00,NULL,3,1,'2025-05-26 12:21:49'),(13,'Sorvete','Sorvete de creme',5.50,NULL,3,1,'2025-05-26 12:21:49'),(14,'Pudim','Pudim de leite condensado',6.00,NULL,3,1,'2025-05-26 12:21:49'),(15,'Lasanha','Lasanha à bolonhesa',20.00,NULL,4,1,'2025-05-26 12:21:49'),(16,'Frango Grelhado','Frango grelhado com legumes',18.00,NULL,4,1,'2025-05-26 12:21:49'),(17,'Peixe Assado','Peixe assado com batatas',22.00,NULL,4,1,'2025-05-26 12:21:49'),(18,'Salada Caesar','Salada Caesar com frango',14.00,NULL,5,1,'2025-05-26 12:21:49'),(19,'Salada Grega','Salada com queijo feta e azeitonas',13.00,NULL,5,1,'2025-05-26 12:21:49'),(20,'Salada de Frutas','Salada de frutas frescas',10.00,NULL,5,1,'2025-05-26 12:21:49'),(21,'Refrigerante','Refrigerante de limão',5.00,NULL,1,1,'2025-05-26 12:21:49'),(22,'Café','Café expresso',4.00,NULL,1,1,'2025-05-26 12:21:49'),(23,'Chá Gelado','Chá gelado de pêssego',5.50,NULL,1,1,'2025-05-26 12:21:49'),(24,'Pizza Margherita','Pizza com molho de tomate e queijo',25.00,NULL,4,1,'2025-05-26 12:21:49'),(25,'Pizza Calabresa','Pizza com calabresa e cebola',28.00,NULL,4,1,'2025-05-26 12:21:49'),(26,'Pizza Quatro Queijos','Pizza com quatro tipos de queijo',30.00,NULL,4,1,'2025-05-26 12:21:49'),(27,'Torta de Limão','Torta de limão com merengue',7.50,NULL,3,1,'2025-05-26 12:21:49'),(28,'Brownie','Brownie de chocolate com nozes',6.50,NULL,3,1,'2025-05-26 12:21:49'),(29,'Milkshake','Milkshake de morango',8.00,NULL,3,1,'2025-05-26 12:21:49'),(30,'Espaguete','Espaguete à carbonara',18.00,NULL,4,1,'2025-05-26 12:21:49'),(31,'Risoto','Risoto de cogumelos',20.00,NULL,4,1,'2025-05-26 12:21:49'),(32,'Filé Mignon','Filé mignon ao molho madeira',35.00,NULL,4,1,'2025-05-26 12:21:49'),(33,'Salada Caprese','Salada com tomate, mussarela e manjericão',12.00,NULL,5,1,'2025-05-26 12:21:49'),(34,'Salada de Atum','Salada com atum e legumes',15.00,NULL,5,1,'2025-05-26 12:21:49'),(35,'VITOR Santos','hsjj',40.00,'',1,15,'2025-06-01 12:07:34');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `estabelecimento_id` int(11) NOT NULL,
  `status` enum('ativo','inativo') DEFAULT 'ativo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `estabelecimento_id` (`estabelecimento_id`),
  CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `produtos_ibfk_2` FOREIGN KEY (`estabelecimento_id`) REFERENCES `estabelecimentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Coca-Cola 350ml','Refrigerante Coca-Cola lata',5.00,1,1,'ativo','2025-05-29 04:08:08','2025-05-29 04:08:08'),(2,'Suco de Laranja','Suco natural de laranja 300ml',8.00,1,1,'ativo','2025-05-29 04:08:08','2025-05-29 04:08:08'),(3,'X-Burger','Hambúrguer, queijo, alface, tomate e maionese',15.00,2,1,'ativo','2025-05-29 04:08:08','2025-05-29 04:08:08'),(4,'X-Bacon','Hambúrguer, queijo, bacon, alface, tomate e maionese',18.00,2,1,'ativo','2025-05-29 04:08:08','2025-05-29 04:08:08'),(5,'Batata Frita','Porção de batata frita crocante',12.00,3,1,'ativo','2025-05-29 04:08:08','2025-05-29 04:08:08'),(6,'Mussarela','Porção de mussarela empanada',15.00,3,1,'ativo','2025-05-29 04:08:08','2025-05-29 04:08:08');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('CUSTOMER','ESTABLISHMENT','DELIVERY') NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'VITOR MANOEL DOS SANTOS','manoelvitor253@gmail.com','$2y$10$wGjgNxVMP4ePVviO3YkSDOwa7cnSS3yEOtojZGSUnUt7zCD7HvWK.','ESTABLISHMENT',NULL,'JOÃO BATISTA DE SOUZA, 95'),(2,'VITOR MANOEL DOS SANTOS','','$2y$10$iFHsmKP8HGMkHGzD/tH3duh7ysItSf5k.aeOMVgtjLDcvsBQstPFG','CUSTOMER','(17) 99128-8208','Rua Rufino Barbosa'),(7,'VITOR MANOEL DOS SANTOS','cliente17991288208@clientedelivery.com','$2y$10$5g2xXE9tSKrWb4vvdddbouXb4fxORHllLaLrUUQ2qwhO0y7PzZ6x6','CUSTOMER','17991288208','Rua Rufino Barbosa'),(8,'x burguer','entregafor@tanamao.com','$2y$10$T7Sb/3BFkMHvDYe6i/D8SOsR6uR64aQoRwZTkaEM/cr2d3YaNH8Ny','DELIVERY',NULL,NULL),(9,'Vítor entrega','vitorapps4@gmail.com','$2y$10$FVLLuiR9VLC83w.hidFxuODeLmmxtCpZ2hFsfG/scuEDi/e34FhR.','DELIVERY',NULL,NULL),(10,'Pizzaria Bella Napoli','bella.napoli@teste.com','$2y$10$abcdefghijklmnopqrstuv','ESTABLISHMENT',NULL,'Rua das Pizzas, 123'),(11,'Hamburgueria Big Burger','big.burger@teste.com','$2y$10$abcdefghijklmnopqrstuv','ESTABLISHMENT',NULL,'Avenida dos Hambúrgueres, 456'),(12,'Comida Japonesa Sakura','sakura@teste.com','$2y$10$abcdefghijklmnopqrstuv','ESTABLISHMENT',NULL,'Rua do Sushi, 789'),(13,'Doceria Sweet Dreams','sweet.dreams@teste.com','$2y$10$abcdefghijklmnopqrstuv','ESTABLISHMENT',NULL,'Praça das Sobremesas, 321'),(14,'Restaurante Sabor Caseiro','sabor.caseiro@teste.com','$2y$10$abcdefghijklmnopqrstuv','ESTABLISHMENT',NULL,'Rua da Comida Caseira, 654'),(15,'Thiffany Flayra Fernandes dos Santos','obahotdog@gmail.com','$2y$10$HTwfFEK8atILgULkdoQPVeIIWsZScPAtbiMniy4A8v9veu4S48Qn.','ESTABLISHMENT',NULL,'JOÃO BATISTA DE SOUZA, 85'),(19,'INK Surmind','cli17997548917@fake.com','$2y$10$fDUESo.vUljZKgi7rKbvf.N8dZqO5NVZB7vIuTh/9Kx8WKNcTBOmq','CUSTOMER','17997548917','Rua Oswaldo Cruz, 687');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas_pdv`
--

DROP TABLE IF EXISTS `vendas_pdv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas_pdv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estabelecimento_id` int(11) NOT NULL,
  `caixa_id` int(11) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `forma_pagamento` enum('dinheiro','cartao','pix') NOT NULL,
  `status` enum('concluida','cancelada') DEFAULT 'concluida',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `estabelecimento_id` (`estabelecimento_id`),
  KEY `caixa_id` (`caixa_id`),
  CONSTRAINT `vendas_pdv_ibfk_1` FOREIGN KEY (`estabelecimento_id`) REFERENCES `estabelecimentos` (`id`),
  CONSTRAINT `vendas_pdv_ibfk_2` FOREIGN KEY (`caixa_id`) REFERENCES `caixa_pdv` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas_pdv`
--

LOCK TABLES `vendas_pdv` WRITE;
/*!40000 ALTER TABLE `vendas_pdv` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendas_pdv` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-01 23:36:52
