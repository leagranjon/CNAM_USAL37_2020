DROP DATABASE IF EXISTS eval_md212;

CREATE DATABASE eval_md212 DEFAULT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

USE eval_md212;

CREATE TABLE clients 
(
	client_id INT PRIMARY KEY AUTO_INCREMENT,
    client_lastname VARCHAR(32) NOT NULL,
    client_firstname VARCHAR(32) NOT NULL,
	client_address CHAR(255) NOT NULL,
    client_phone CHAR(16) NOT NULL
);

CREATE TABLE repairsengine 
(
	repairsengine_id INT PRIMARY KEY AUTO_INCREMENT,
	repairsengine_datetime DATETIME NOT NULL,
	repairsengine_duration TIME NOT NULL,
	repairsengine_price DECIMAL(7,2) NOT NULL,
    client_id INT NOT NULL,
    mechanic_id INT NOT NULL
);

CREATE TABLE repairsbodycar
(
	repairsbodycar_id INT PRIMARY KEY AUTO_INCREMENT,
	repairsbodycar_datetime DATETIME NOT NULL,
	repairsbodycar_duration TIME NOT NULL,
	repairsbodycar_price DECIMAL(7,2) NOT NULL,
    client_id INT NOT NULL,
    mechanic_id INT NOT NULL
);

CREATE TABLE repairsaccessories
(
	repairsaccessory_id INT PRIMARY KEY AUTO_INCREMENT,
	repairsaccessory_datetime DATETIME NOT NULL,
	repairsaccessory_duration TIME NOT NULL,
	repairsaccessory_price DECIMAL(7,2) NOT NULL,
    client_id INT NOT NULL,
    mechanic_id INT NOT NULL
);

CREATE TABLE mechanic
(
	mechanic_id INT PRIMARY KEY AUTO_INCREMENT,
    mechanic_lastname VARCHAR(32) NOT NULL,
    mechanic_firstname VARCHAR(32) NOT NULL,
	mechanic_specialism VARCHAR(50) NOT NULL,
	mechanic_repairs VARCHAR(50) NOT NULL,
	mechanic_timeslot DATETIME NOT NULL UNIQUE
);

ALTER TABLE repairsengine 
ADD 
	CONSTRAINT fk_repairsengine_clients FOREIGN KEY (client_id) REFERENCES clients(client_id);
    
ALTER TABLE repairsbodycar
ADD 
	CONSTRAINT fk_repairsbodycar_clients FOREIGN KEY (client_id) REFERENCES clients(client_id);

ALTER TABLE repairsaccessories
ADD 
	CONSTRAINT fk_repairsaccessories_clients FOREIGN KEY (client_id) REFERENCES clients(client_id);

ALTER TABLE repairsengine 
ADD 
	CONSTRAINT fk_repairsengine_mechanic FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id);
    
ALTER TABLE repairsbodycar
ADD 
    CONSTRAINT fk_repairsbodycar_mechanic FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id);

ALTER TABLE repairsaccessories
ADD 
    CONSTRAINT fk_repairsaccessories_mechanic FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id);



