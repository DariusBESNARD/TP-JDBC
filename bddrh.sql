-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 13 oct. 2021 à 15:15
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bddrh`
--

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

DROP TABLE IF EXISTS `contrat`;
CREATE TABLE IF NOT EXISTS `contrat` (
  `id` int(11) NOT NULL,
  `date Debut` date NOT NULL,
  `date Fin` date DEFAULT NULL,
  `idSal` varchar(10) NOT NULL,
  `idPoste` int(11) NOT NULL,
  `idService` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idSal` (`idSal`),
  KEY `idPoste` (`idPoste`),
  KEY `idService` (`idService`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contrat`
--

INSERT INTO `contrat` (`id`, `date Debut`, `date Fin`, `idSal`, `idPoste`, `idService`) VALUES
(1977102, '1977-03-15', '1985-03-01', '148A12', 1, 'B01'),
(1985076, '1985-03-01', '2002-09-15', '148A12', 3, 'F01'),
(2000098, '2000-09-01', '2010-10-10', '156A12', 4, 'G01'),
(2002181, '2002-09-15', NULL, '148A12', 2, 'F01'),
(2008045, '2008-05-05', '2008-10-17', '196A12 ', 1, 'E21'),
(2008111, '2008-10-17', NULL, '196A12 ', 6, 'F02'),
(2010065, '2010-10-10', NULL, '156A12', 5, 'G01');

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

DROP TABLE IF EXISTS `poste`;
CREATE TABLE IF NOT EXISTS `poste` (
  `id` int(11) NOT NULL,
  `libelle` varchar(25) NOT NULL,
  `caracteristique` varchar(40) NOT NULL,
  `indice` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `poste`
--

INSERT INTO `poste` (`id`, `libelle`, `caracteristique`, `indice`) VALUES
(1, 'Magasinier', 'magasiner(e) en reserve', 385),
(2, 'Responsable Informatique', 'Gestion equipe de 2 a 3 personnes', 455),
(3, 'Informaticien(ne)', 'Maintenance Technique', 395),
(4, 'Hote(sse) de caisse', 'rotation horaire et week end', 365),
(5, 'chargé(e) d\'equipe ', 'Manager une equipe de 1à hôtes de caisse', 430),
(6, 'Commercial', 'Poste en rayon', 400);

-- --------------------------------------------------------

--
-- Structure de la table `salarie`
--

DROP TABLE IF EXISTS `salarie`;
CREATE TABLE IF NOT EXISTS `salarie` (
  `id` varchar(10) NOT NULL,
  `numSecu` varchar(20) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `dateNaiss` date NOT NULL,
  `dateEmbauche` date NOT NULL,
  `tel` varchar(11) NOT NULL,
  `mail` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `salarie`
--

INSERT INTO `salarie` (`id`, `numSecu`, `nom`, `prenom`, `dateNaiss`, `dateEmbauche`, `tel`, `mail`) VALUES
('148A12', '1520814168026', 'MARTIN', 'Pierre', '1952-08-05', '1977-03-15', '038312xxxx', 'pierre.martin@proxim.fr'),
('156A12', '2671154395023', 'ESTEN', 'Solene', '1967-11-18', '2000-01-09', '038347xxxx', 'solene.estenàproxim.fr'),
('196A12 ', '2820388485089', 'BENARBIA', 'Samia', '1982-03-28', '2008-05-05', '066746xxxx', 'samia.benarbia@proxim.fr');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `id` varchar(10) NOT NULL,
  `libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id`, `libelle`) VALUES
('A00', 'Direction Générale'),
('B01', 'Approvisionnement'),
('C01', 'Comptabilité'),
('D01', 'Service aprés vente'),
('D11', 'Boucherie'),
('D21', 'BOulangerie'),
('E01', 'Epicerie'),
('E11', 'Produit frais'),
('E21', 'Electromenager'),
('E31', 'Animalerie et Jardin'),
('F01', 'Informatique'),
('F02', 'Ressources Humaines'),
('G01', 'Caisse');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD CONSTRAINT `contrat_ibfk_1` FOREIGN KEY (`idSal`) REFERENCES `salarie` (`id`),
  ADD CONSTRAINT `contrat_ibfk_2` FOREIGN KEY (`idPoste`) REFERENCES `poste` (`id`),
  ADD CONSTRAINT `contrat_ibfk_3` FOREIGN KEY (`idService`) REFERENCES `service` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
