/*
1) 	Créer la table "sales" (commerciaux) et ajouter 5 commerciaux

2) 	Créer la table "clients" et ajouter 5 clients dans la table
	Chaque client est associé à un commercial différent 
    
3) 	Sélectionnez tous les clients (nom du commercial associé inclus)


SUITE 

4) Créer la table de liaison entre clients et trips
	nom de la table : orders 
    order_quantity & order_paid sont des colonnes de la tables de liaison (orders)
    
5) (bonus) créer une requête SELECT pour afficher : les voyages avec le nom du client associé

*/

use usal37_agence;



SELECT * FROM orders;


SELECT client_email, client_password FROM clients;

SELECT client_id, client_lastname, client_email, client_phone, client_added, com_code FROM clients;

SELECT * FROM clients 
JOIN sales ON clients.com_code = sales.com_code; 
