-- SQL
-- DDL (CREATE DROP ALTER)
-- DML (INSERT UPDATE DELETE)
-- DQL (SELECT)

DROP DATABASE IF EXISTS usal37_agence;

CREATE DATABASE usal37_agence DEFAULT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

USE usal37_agence;

/*  CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' */

CREATE TABLE countries 
(
	country_code CHAR(2) PRIMARY KEY,
    country_name VARCHAR(128) NOT NULL 
);

CREATE TABLE cities
(
	city_code INT AUTO_INCREMENT,
    city_name VARCHAR(128) NOT NULL UNIQUE,
    country_code CHAR(2) NOT NULL DEFAULT 'FR',
    PRIMARY KEY (city_code)
);



CREATE TABLE trips 
(
	trip_code INT PRIMARY KEY AUTO_INCREMENT,
    trip_title VARCHAR(128) NOT NULL,
    trip_available INT NOT NULL,
    trip_start DATETIME NOT NULL,
    trip_end DATETIME NOT NULL,
    trip_price DECIMAL(7,2) NOT NULL,
    trip_overview TEXT NOT NULL,
    trip_description MEDIUMTEXT NULL,
    city_code INT NOT NULL,
    INDEX(trip_title)
);

CREATE TABLE themes 
(
	theme_code INT AUTO_INCREMENT,
    theme_name VARCHAR(32) NOT NULL UNIQUE,
    theme_description MEDIUMTEXT NULL,
    PRIMARY KEY(theme_code)
);

CREATE TABLE trips_theme
(
	trip_code INT,
    theme_code INT,
    PRIMARY KEY (trip_code, theme_code),
    FOREIGN KEY (trip_code) REFERENCES trips(trip_code),
    CONSTRAINT fk_trips_themes FOREIGN KEY (theme_code) REFERENCES themes(theme_code)
);



CREATE TABLE services 
(
	service_code INT PRIMARY KEY AUTO_INCREMENT,
    service_name VARCHAR(32) NOT NULL UNIQUE,
    service_description MEDIUMTEXT NULL
);

CREATE TABLE trips_services
(
	trip_code INT,
    service_code INT,
    PRIMARY KEY (trip_code, service_code)
);

CREATE TABLE sales 
(
	com_code CHAR(5) PRIMARY KEY,
    com_name VARCHAR(64),
    com_password CHAR(60)
);

CREATE table clients 
(
	client_id INT PRIMARY KEY AUTO_INCREMENT,
    client_lastname VARCHAR(32) NOT NULL,
    client_firstname VARCHAR(32) NOT NULL,
    client_email VARCHAR(128) NOT NULL,
    client_phone CHAR(16) NOT NULL,
    client_added DATE NOT NULL,
    client_password CHAR(60) NOT NULL,
    com_code CHAR(5) NOT NULL, 
    FOREIGN KEY (com_code) REFERENCES sales(com_code) 
);

CREATE TABLE orders 
(
	trip_code INT,
    client_id INT,
    order_quantity INT NOT NULL,
    order_paid TINYINT(1) NULL,
    PRIMARY KEY (trip_code, client_id)
);





/*
TINYINT    = 255 valeurs (-128 à +127)
SMALLINT   = 65535 valeurs (-32000 à +32000)
MEDIUMINT  = 16 millions de valeurs (-800000 à +800000)
INT 	   = 4 milliards de valeurs (-2 milliards à + 2 millliards)
BIGINT     = 2^63 valeurs possibles (-2^63 à +2^64-1)

TINYTEXT   = 255 caractères max    		- 0.25 ko 
TEXT       = 65535 caractères max 		- 64 ko 
MEDIUMTEXT = 16 millions caractères max - 16 mo
LONGTEXT   = 4 milliards caractères max - 4 go
*/
/*
ALTER TABLE cities 
ADD 
FOREIGN KEY (country_code) REFERENCES countries(country_code);
*/

/* Modification de la table cities (ALTER) 
 * Ajout d'une contrainte de clé étrangère */ 
ALTER TABLE cities 
ADD 
	CONSTRAINT fk_cities_countries FOREIGN KEY (country_code) REFERENCES countries(country_code);

ALTER TABLE trips 
ADD 
	CONSTRAINT fk_trips_cities FOREIGN KEY (city_code) REFERENCES cities(city_code);

ALTER TABLE trips_services
	ADD FOREIGN KEY (trip_code) REFERENCES trips(trip_code),
	ADD CONSTRAINT TOTO23 FOREIGN KEY (service_code) REFERENCES services(service_code);
    
ALTER TABLE orders 
	ADD CONSTRAINT fk_orders_trips FOREIGN KEY (trip_code) REFERENCES trips(trip_code),
    ADD CONSTRAINT fk_orders_client FOREIGN KEY (client_id) REFERENCES clients(client_id);
    

/* INSERTION DU JEU D'ESSAI */

INSERT INTO countries
(country_code, country_name) 
VALUES 
('FR', 'France'), 
('DE', 'Allemagne'),
('BE', 'Belgique'),
('IT', 'Italie'),
('MA', 'Maroc'),
('UA', 'Ukraine'),
('GB', 'Écosse');

INSERT INTO cities
(city_name, country_code) 
VALUES 
('Paris', 'FR'),
('Mulhouse', 'FR'),
('Rust', 'DE'),
('Bruxelles', 'BE'),
('Milan', 'IT'),
('Rome', 'IT'),
('Chernobyl', 'UA'),
('Édimbourg', 'GB'),
('Marrakech', 'MA');



/* - Insérez les 5 voyages du PDF dans la table "trips"  */
INSERT INTO trips 
(
trip_title, 
trip_available, 
trip_start, 
trip_end, 
trip_price, 
trip_overview, 
trip_description,
city_code
) 
VALUES 
('Séjour touristique', 	 		100, '2021-01-25 18:00:00', '2021-01-31 14:00:00', 899,  'T1 overview', 'Trip1 description', 9),
('Séjour gastronomique', 		50,  '2021-02-14 19:30:00', '2021-02-18 08:45:00', 399,  'T2 overview', NULL, 2),
('Voyage Aventure', 	 		35,  '2021-02-21 20:00:00', '2021-02-23 23:30:00', 1299, 'T3 overview', NULL, 7),
('Destination Vert-Bouteille', 	18,  '2020-11-20 06:45:00', '2020-11-26 13:00:00', 849,  'T4 overview', NULL, 8),
('Europa Park', 				568, '2019-05-15 08:30:00', '2019-05-17 18:00:00', 99,   'T5 overview', NULL, 3);

INSERT INTO themes 
(theme_name) 
VALUES 
('Montagne'),
('Plage'),
('Ski'),
('Balnéo'),
('Aventure');

INSERT INTO trips_theme
(trip_code, theme_code)
VALUES
(1, 2), /* 1-2 */
(1, 3), /* 1-3 */
(2, 2); /* 2-2 */

INSERT INTO services 
(service_name) 
VALUES 
('All inclusive'),
('Coach sportif'),
('Service d\'étape'),
('SPA'),
('Restaurant 4*');

INSERT INTO trips_services 
(trip_code, service_code)
VALUES
(1, 2),
(1, 3),
(2, 2),
(2, 4),
(3, 4),
(4, 5);


INSERT INTO sales 
(com_code, com_name, com_password) 
VALUES 
('BA201', 'Berthier Aline', '$2y$10$OpUTjAUsVuKtCstwAq5DeOVWPgofb2d2v.tsQuUCIgezmBqiv4fEi'),
('NJ247', 'Neymar Jean', '$2y$10$OpUTjAUsVuKtCstwAq5DeOVWPgofb2d2v.tsQuUCIgezmBqiv4fEi'),
('PJ714', 'Paute Jessie', '$2y$10$OpUTjAUsVuKtCstwAq5DeOVWPgofb2d2v.tsQuUCIgezmBqiv4fEi'),
('PM654', 'Poglio Marcel', '$2y$10$OpUTjAUsVuKtCstwAq5DeOVWPgofb2d2v.tsQuUCIgezmBqiv4fEi'),
('YT023', 'Yoyo Tata', '$2y$10$OpUTjAUsVuKtCstwAq5DeOVWPgofb2d2v.tsQuUCIgezmBqiv4fEi');





INSERT INTO clients 
(com_code, client_lastname, client_firstname, client_email, client_phone, client_added, client_password) 
VALUES 
('BA201', 'Dupont', 'Ernest', 'a@a.fr', 	'0102030405', NOW(), '$2y$10$OpUTjAUsVuKtCstwAq5DeOVWPgofb2d2v.tsQuUCIgezmBqiv4fEi'), 
('NJ247', 'Dupond', 'Louis', 'b@b.fr', 		'0203040506', NOW(), '$2y$10$OpUTjAUsVuKtCstwAq5DeOVWPgofb2d2v.tsQuUCIgezmBqiv4fEi'), 
('PJ714', 'Martin', 'Léo', 'c@c.fr', 	 	'0312345678', NOW(), '$2y$10$OpUTjAUsVuKtCstwAq5DeOVWPgofb2d2v.tsQuUCIgezmBqiv4fEi'), 
('PM654', 'Devoldère', 'Mickaël', 'd@d.fr', '0678963214', NOW(), '$2y$10$OpUTjAUsVuKtCstwAq5DeOVWPgofb2d2v.tsQuUCIgezmBqiv4fEi'), 
('YT023', 'Ben', 'Joe', 'e@e.fr', 			'0698741235', NOW(), '$2y$10$OpUTjAUsVuKtCstwAq5DeOVWPgofb2d2v.tsQuUCIgezmBqiv4fEi');


INSERT INTO orders
(trip_code, client_id, order_quantity, order_paid)
VALUES 
(1, 5, 2, 1),
(2, 5, 3, 0),
(3, 1, 2, 1);



