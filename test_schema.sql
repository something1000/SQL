CREATE DATABASE `sql_test`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

CREATE TABLE `klienci` (
  `klient_id` int(4) NOT NULL auto_increment,
  `nazwa` char(25) NOT NULL,
  `segment` char(10) NOT NULL default '',
  `miasto_id` int(11) NOT NULL,
  PRIMARY KEY  (`klient_id`),
  KEY `miasto_id` (`miasto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `miasta` (
  `miasto_id` int(11) NOT NULL auto_increment,
  `nazwa` varchar(50) NOT NULL,
  `populacja` int(11) default NULL,
  `obszar_id` int(11) NOT NULL,
  PRIMARY KEY  (`miasto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `obszary` (
  `obszar_id` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
  PRIMARY KEY  (`obszar_id`),
  UNIQUE KEY `Nazwa` (`nazwa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `zlecenia` (
  `zlecenie_id` int(4) NOT NULL auto_increment,
  `klient_id` int(11) NOT NULL default '0',
  `data_otwarcia` date NOT NULL default '0000-00-00',
  `wartosc` double(15,3) NOT NULL,
  `data_zamkniecia` date default NULL,
  `miasto_realizacji_id` int(11) NOT NULL,
  PRIMARY KEY  (`zlecenie_id`),
  KEY `klient_id` (`klient_id`),
  KEY `miasto_realizacji_id` (`miasto_realizacji_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

