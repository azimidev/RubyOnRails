DROP TABLE IF EXISTS `admin_users`;
DROP TABLE IF EXISTS `admin_users_pages`;
DROP TABLE IF EXISTS `pages`;
DROP TABLE IF EXISTS `schema_migrations`;
DROP TABLE IF EXISTS `section_edits`;
DROP TABLE IF EXISTS `sections`;
DROP TABLE IF EXISTS `subjects`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `username` varchar(25) DEFAULT NULL,
  `hashed_password` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_admin_users_on_username` (`username`)
);
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pages_on_subject_id` (`subject_id`),
  KEY `index_pages_on_permalink` (`permalink`)
) AUTO_INCREMENT=4;
INSERT INTO `pages` VALUES (2,1,'First Page','first',1,0,'2013-08-21 15:09:23','2013-08-21 15:09:23'),(3,NULL,'Second Page','second',2,0,'2013-08-21 15:10:32','2013-08-21 15:10:32');
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
);
INSERT INTO `schema_migrations` VALUES ('20130812204447'),('20130812204803'),('20130813013638'),('20130813025828'),('20130813025835'),('20130813025840');
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `content_type` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sections_on_page_id` (`page_id`)
);
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=5;
INSERT INTO `subjects` VALUES (1,'Initial Subject',1,1,'2013-08-15 16:48:25','2013-08-15 17:54:22'),(2,'Revised Subject',2,1,'2013-08-15 16:54:07','2013-08-15 17:57:35'),(4,'Third Subject',3,0,'2013-08-15 19:03:56','2013-08-15 19:03:56');
