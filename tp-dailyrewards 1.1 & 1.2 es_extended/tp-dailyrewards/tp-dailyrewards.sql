CREATE TABLE IF NOT EXISTS `dailyrewards` (
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `current_day` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT 1,
  `received` int(11) DEFAULT 0,
  `received_hour` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
