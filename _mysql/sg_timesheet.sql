CREATE DATABASE sg_timesheet;
USE sg_timesheet;

CREATE TABLE timesheet (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
who VARCHAR(64) NOT NULL,
date_timestamp INT UNSIGNED NOT NULL,
time_start VARCHAR(64),
time_end VARCHAR(64),
description VARCHAR(510),
jobnum INT UNSIGNED NOT NULL,
client VARCHAR(64),
contact VARCHAR(64),
total_mins INT UNSIGNED DEFAULT 0,
complete BOOL DEFAULT 0,
last_change DATETIME,
status TINYINT UNSIGNED NOT NULL DEFAULT 1,
PRIMARY KEY (id)
)
AUTO_INCREMENT=100; #First 99 reserved for temp ids

CREATE TABLE users (
id INT unsigned NOT NULL AUTO_INCREMENT,
username varchar(50) NOT NULL,
password varchar(128) NOT NULL,
first_name varchar(50) DEFAULT NULL,
last_name varchar(50) DEFAULT NULL,
email_address varchar(50) DEFAULT NULL,
level varchar(20) DEFAULT "user",
enabled INT NOT NULL DEFAULT '0',
failed_logins TINYINT UNSIGNED NOT NULL DEFAULT '0',
salt varchar(128) NOT NULL,
timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (id),
UNIQUE KEY username (username)
);

/*
TEMP - Make default users, password is "sg_timesheet"
Password hash was obtained manually using gethash.php in this folder
*/
#User level
INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `email_address`, `enabled`, `failed_logins`, `salt`, `timestamp`) VALUES (NULL, 'User', '37bc2f6c9d12f92d22a055493bdc84133f3b7ca3a6d23b42423a54d106d079de', 'User', '', 'user@domain.com', '1', '0', 'SALT-GOES-HERE', CURRENT_TIMESTAMP);

#Admin level
INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `email_address`, `level`, `enabled`, `failed_logins`, `salt`, `timestamp`) VALUES (NULL, 'Admin', '37bc2f6c9d12f92d22a055493bdc84133f3b7ca3a6d23b42423a54d106d079de', 'Admin', '', 'admin@domain.com', 'administrator', '1', '0', 'SALT-GOES-HERE', CURRENT_TIMESTAMP);