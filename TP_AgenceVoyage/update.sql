USE usal37_agence;

/*
DML : 
INSERT UPDATE DELETE
DQL : 
SELECT
*/

select * from clients;

SELECT * from clients WHERE client_id=2; 

UPDATE clients SET client_phone='0799887744' WHERE client_id=2; 

DELETE FROM clients WHERE client_id=2; 

