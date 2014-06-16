CREATE TABLE IF NOT EXISTS `collection` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `lastretrieved` TIMESTAMP NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

CREATE TABLE IF NOT EXISTS `term` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bucket` bigint(20) unsigned NOT NULL,
  `term` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

CREATE TABLE IF NOT EXISTS `bucket` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `collection` bigint(20) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000),
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

CREATE TABLE IF NOT EXISTS `label` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `collection` bigint(20) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000),
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

CREATE TABLE IF NOT EXISTS `labeling` (
  `term` bigint(20) unsigned NOT NULL,
  `label` bigint(20) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `termlabel` (`term`,`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `synonym` (
  `termA` bigint(20) unsigned NOT NULL,
  `label` bigint(20) unsigned NOT NULL,
  `termB` bigint(20) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `synonym` (`termA`,`label`,`termB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Context stuff: Given with upload
--
CREATE TABLE IF NOT EXISTS `context` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term` bigint(2) unsigned NOT NULL,
  `source` varchar(100) NOT NULL,
  `sentence` varchar(300) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

-- Not needed: Info can be extracted from tables above
--CREATE TABLE IF NOT EXISTS `location` (}


-- Will retrieved directly from ontology; maybe later as a cache
--CREATE TABLE IF NOT EXISTS `ontology` (
--  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
--  `source` varchar(100) NOT NULL,
--  `sentence` varchar(300) NOT NULL,
--  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `id` (`id`)
--) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

