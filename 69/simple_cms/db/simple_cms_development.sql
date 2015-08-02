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
) AUTO_INCREMENT=2;
INSERT INTO `admin_users` VALUES (1,'Kevin','Skoglund','','kskoglund',NULL,'2013-08-21 15:59:57','2013-08-21 15:59:57');
CREATE TABLE `admin_users_pages` (
  `admin_user_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  KEY `index_admin_users_pages_on_admin_user_id_and_page_id` (`admin_user_id`,`page_id`)
);
INSERT INTO `admin_users_pages` VALUES (1,2);
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
INSERT INTO `schema_migrations` VALUES ('20130812204447'),('20130812204803'),('20130813013638'),('20130813025828'),('20130813025835'),('20130813025840'),('20130821155153'),('20130821164842');
CREATE TABLE `section_edits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_section_edits_on_admin_user_id_and_section_id` (`admin_user_id`,`section_id`)
) AUTO_INCREMENT=3;
INSERT INTO `section_edits` VALUES (1,1,1,'Test edit','2013-08-21 17:00:38','2013-08-21 17:01:20'),(2,1,1,'Ch-ch-ch-changes','2013-08-21 17:03:32','2013-08-21 17:03:32');
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
) AUTO_INCREMENT=2;
INSERT INTO `sections` VALUES (1,NULL,'Section One',1,0,NULL,NULL,'2013-08-21 16:58:26','2013-08-21 16:58:26');
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=6;
INSERT INTO `subjects` VALUES (1,'Initial Subject',1,1,'2013-08-15 16:48:25','2013-08-15 17:54:22'),(2,'Revised Subject',2,1,'2013-08-15 16:54:07','2013-08-15 17:57:35'),(4,'Third Subject',3,0,'2013-08-15 19:03:56','2013-08-15 19:03:56'),(5,'Test Subject',7,0,'2013-08-25 02:23:21','2013-08-25 02:49:32');
