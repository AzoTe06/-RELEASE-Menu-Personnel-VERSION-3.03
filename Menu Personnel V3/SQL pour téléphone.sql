CREATE TABLE IF NOT EXISTS `user_message` (
  `owner_id` varchar(50) NOT NULL,
  `receiver_id` varchar(50) NOT NULL,
  `msg` varchar(200) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `has_read` int(11) NOT NULL DEFAULT '0',
  `receiver_deleted` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `user_phonelist` (
  `owner_id` varchar(50) NOT NULL,
  `contact_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;