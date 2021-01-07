USE usal37_agence;

select * from countries;

ALTER TABLE countries 
	ADD COLUMN country_capital VARCHAR(50) NOT NULL DEFAULT '';

select * from countries; 

ALTER TABLE countries 
	MODIFY COLUMN country_capital VARCHAR(100) NULL DEFAULT 'none';


