
CREATE TABLE IF NOT EXISTS `user` (
  `phone_number` varchar(255) DEFAULT 'none',
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;


INSERT INTO `items` (`id`, `libelle`, `isIllegal`, `value`, `type`) VALUES
(26, 'Sandwich', '0', 30, 2),
(30, 'Hamburger', '0', 35, 2),
(25, 'Frites', '0', 35, 2),
(31, 'Eau', '0', 45, 1),
(33, 'Café', '0', 10, 1),
(34, 'Barre Choco', '0', 20, 2),
(35, 'Coca zero', '0', 35, 1);
