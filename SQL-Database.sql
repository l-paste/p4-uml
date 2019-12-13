-- phpMyAdmin SQL Dump
-- version 4.8.3
-- Server version: 5.7.23
-- PHP Version: 7.2.10
--
-- Database: `expressfood`
--

--
-- Table  `adresse`
--

CREATE TABLE `adresse` (
  `id_adresse` int(11) NOT NULL,
  `nom_adresse` varchar(45) NOT NULL,
  `voie` varchar(100) NOT NULL,
  `localite` varchar(45) NOT NULL,
  `code_postal` varchar(5) NOT NULL,
  `complements` varchar(100) NOT NULL,
  `num_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `adresse`
--

INSERT INTO `adresse` (`id_adresse`, `nom_adresse`, `voie`, `localite`, `code_postal`, `complements`, `num_client`) VALUES
(1, 'Domicile 1', '22 rue de l\'industrie', 'Draveil', '91270', 'Interphone : 9876', 1),
(2, 'Travail', '15 allée des acacias', 'Montgeron', '91230', '', 2),
(3, 'Maison', '8 rue des diamants', 'Vigneux-sur-Seine', '91270', 'Deuxième porte à droite', 3);

-- --------------------------------------------------------

--
-- Table  `client`
--

CREATE TABLE `client` (
  `num_client` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `numero_tel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`num_client`, `nom`, `prenom`, `mail`, `numero_tel`) VALUES
(1, 'Ordon', 'Philippe', 'p.ordon@gmail.com', '0654659876'),
(2, 'Lozano', 'Julie', 'jlozano@laposte.net', '0699847362'),
(3, 'Thomas', 'Chloé', 'chloethomas@live.fr', '0788765434');

-- --------------------------------------------------------

--
-- Table  `commande`
--

CREATE TABLE `commande` (
  `num_commande` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `livraison` tinyint(1) NOT NULL,
  `num_client` int(11) NOT NULL,
  `id_adresse` int(11) NOT NULL,
  `id_livreur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`num_commande`, `date`, `livraison`, `num_client`, `id_adresse`, `id_livreur`) VALUES
(1, '2019-04-23 10:15:11', 1, 1, 1, 1),
(2, '2019-04-30 17:45:00', 1, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table  `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `num_commande` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_unitaire_ht` decimal(10,0) NOT NULL,
  `ref_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ligne_commande`
--

INSERT INTO `ligne_commande` (`num_commande`, `quantite`, `prix_unitaire_ht`, `ref_produit`) VALUES
(1, 2, '13', 1),
(1, 1, '6', 2),
(2, 3, '14', 3);

-- --------------------------------------------------------

--
-- Table  `livreur`
--

CREATE TABLE `livreur` (
  `id_livreur` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `statut` varchar(45) NOT NULL,
  `position` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `livreur`
--

INSERT INTO `livreur` (`id_livreur`, `nom`, `prenom`, `mail`, `statut`, `position`) VALUES
(1, 'Bruno', 'Jean', 'jb@gmail.com', 'libre', '47.6193757 6.152937400000042'),
(2, 'Dupont', 'Juliette', 'jdupont@live.fr', 'en_livraison', '48.7088708 2.4526696000000356');

-- --------------------------------------------------------

--
-- Table  `produit`
--

CREATE TABLE `produit` (
  `ref_produit` int(11) NOT NULL,
  `nom_produit` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `stock` int(11) NOT NULL,
  `prix_ht` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`ref_produit`, `nom_produit`, `description`, `type`, `date`, `stock`, `prix_ht`) VALUES
(1, 'Carbonade flamande', 'Découvrez cette délicieuse spécialité belge !', 'plat', '2019-04-23', 10, '13'),
(2, 'Mousse au chocolat', 'Aussi douce que gourmande, faites vous plaisir avec notre mousse au chocolat.', 'dessert', '2019-04-23', 8, '6'),
(3, 'Pizza di bufala', 'Découvrez la délicieuse mozarella di bufala avec cette pizza traditionnelle mais efficace.', 'plat', '2019-04-30', 13, '14'),
(4, 'Cheesecake aux amandes', 'Un dessert gourmand auquel vous ne pourrez résister !', 'dessert', '2019-04-30', 20, '6');

-- --------------------------------------------------------

--
-- Table  `stock_livreur`
--

CREATE TABLE `stock_livreur` (
  `ref_produit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `id_livreur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock_livreur`
--

INSERT INTO `stock_livreur` (`ref_produit`, `quantite`, `id_livreur`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 2, 2),
(4, 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id_adresse`),
  ADD KEY `fkIdx_104` (`num_client`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`num_client`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`num_commande`),
  ADD KEY `fkIdx_107` (`id_adresse`),
  ADD KEY `fkIdx_117` (`id_livreur`),
  ADD KEY `num_client_index` (`num_client`);

--
-- Indexes for table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`num_commande`,`ref_produit`),
  ADD KEY `fkIdx_90` (`num_commande`),
  ADD KEY `fkIdx_93` (`ref_produit`);

--
-- Indexes for table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`id_livreur`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`ref_produit`);

--
-- Indexes for table `stock_livreur`
--
ALTER TABLE `stock_livreur`
  ADD PRIMARY KEY (`ref_produit`,`id_livreur`),
  ADD KEY `fkIdx_120` (`ref_produit`),
  ADD KEY `fkIdx_122` (`id_livreur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id_adresse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `num_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `num_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `livreur`
--
ALTER TABLE `livreur`
  MODIFY `id_livreur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `ref_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `FK_104` FOREIGN KEY (`num_client`) REFERENCES `client` (`num_client`);

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_107` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`),
  ADD CONSTRAINT `FK_117` FOREIGN KEY (`id_livreur`) REFERENCES `livreur` (`id_livreur`),
  ADD CONSTRAINT `num_client` FOREIGN KEY (`num_client`) REFERENCES `client` (`num_client`);

--
-- Constraints for table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `FK_90` FOREIGN KEY (`num_commande`) REFERENCES `commande` (`num_commande`),
  ADD CONSTRAINT `FK_93` FOREIGN KEY (`ref_produit`) REFERENCES `produit` (`ref_produit`);

--
-- Constraints for table `stock_livreur`
--
ALTER TABLE `stock_livreur`
  ADD CONSTRAINT `FK_120` FOREIGN KEY (`ref_produit`) REFERENCES `produit` (`ref_produit`),
  ADD CONSTRAINT `FK_122` FOREIGN KEY (`id_livreur`) REFERENCES `livreur` (`id_livreur`);
