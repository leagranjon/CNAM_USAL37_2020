/*
1) 	Créer la table "sales" (commerciaux) et ajouter 5 commerciaux

2) 	Créer la table "clients" et ajouter 5 clients dans la table
	Chaque client est associé à un commercial différent 
    
3) 	Sélectionnez tous les clients (nom du commercial associé inclus)
*/

use usal37_agence;

CREATE TABLE sales
(
	com_code INT PRIMARY KEY,
    com_name VARCHAR(64) NOT NULL,
    com_password VARCHAR(60),
);


CREATE TABLE clients
(
	clients_id INT PRIMARY KEY AUTO_INCREMENT,
    clients_lastname VARCHAR(32) NOT NULL,
    client_firstname VARCHAR(32) NOT NULL,
    client_email VARCHAR(128) NOT NULL,
    client_phone VARCHAR(16) NOT NULL,
    client_added DATE NOT NULL,
    client_password VARCHAR(60) NOT NULL,
);


INSERT INTO clients 
(
clients_lastname,
client_firstname,
) 
VALUES 
('Gautier', 'Alice'),
('Lemaire', 'Gabriel'),
('Dupond', 'Adam'),
('Joly', 'Anna'),
('Deschamps', 'Arthur'),

INSERT INTO sales 
(
com_code,
com_name,
) 
VALUES 
('1', 'SMITH'),
('2', 'LEFEVRE'),
('3', 'MOREAU'),
('4', 'MERCIER'),
('5', 'DUMAS'),

ALTER TABLE sales
	ADD 
		FOREIGN KEY(client_code) REFERENCES sales(client_code);
	
select * from sales




