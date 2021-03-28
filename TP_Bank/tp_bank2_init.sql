
CREATE DATABASE IF NOT EXISTS usal37_tp_bank DEFAULT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';


USE usal37_tp_bank;


CREATE TABLE banks(
   bank_id INT,
   bank_name VARCHAR(100) NOT NULL,
   PRIMARY KEY(bank_id)
);

CREATE TABLE accounts(
   account_id INT,
   account_owner VARCHAR(255) NOT NULL,
   account_balance DECIMAL(10,2) NOT NULL DEFAULT 0,
   account_overdraft INT NOT NULL DEFAULT 0,
   bank_id INT NOT NULL,
   PRIMARY KEY(account_id),
   FOREIGN KEY(bank_id) REFERENCES banks(bank_id)
);

/*
AJOUTER 3 banques 'Crédit Mutuel' 'Crédit Agricole' 'Caisse d'épargne'
AJOUTER 2 comptes bancaires par banque
- le champ 'account_owner' contient le nom et prénom du titulaire du compte séparés par un espace. */

INSERT INTO banks
(bank_name)
VALUES
('Credit Mutuel'), 
('Credit Agricole'),
('Caisse Epargne');

INSERT INTO accounts
(account_owner)
VALUES
('John Smith'), 
('Emma Walter'),
('Matt Johnson');



