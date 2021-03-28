DROP DATABASE IF EXISTS usal37_tp_bank;

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
   bank_id INT NULL,
   PRIMARY KEY(account_id),
   FOREIGN KEY(bank_id) REFERENCES banks(bank_id)
);

INSERT INTO banks (bank_id, bank_name) VALUES 
(1001, "Crédit Mutuel"),
(1002, "Crédit Agricole"),
(1003, "Caisse d'épargne");

INSERT INTO accounts 
(account_id, account_owner, account_balance, bank_id) 
VALUES 
(10, "Mike", 2144, 1001),
(11, "Jon", 3568, 1001),
(12, "Jack", 658, NULL),
(20, "Léa", 3250, 1002),
(21, "Jean", 14652, 1002),
(22, "Réda", 3900, NULL),
(30, "Marie", 3900, 1003),
(31, "Cristiano", 799521, 1003),
(32, "Tom", 36447, NULL);


DELIMITER $

CREATE PROCEDURE transfer
(
IN amount INT,  
IN from_account INT, 
IN to_account INT 
)
BEGIN
	DECLARE current_amount INT;
    SELECT account_balance INTO current_amount FROM accounts WHERE account_id=from_account;
	IF amount > 0 AND current_amount >= amount 
    THEN 
		UPDATE accounts SET account_balance=account_balance - amount 
		WHERE account_id=from_account;
    
		UPDATE accounts SET account_balance=account_balance + amount 
		WHERE account_id=to_account;
	ELSE 
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = "Le transfert n'a pas pu être effectué";
    END IF;
	
END $

DELIMITER ;


SELECT * FROM banks;
SELECT * FROM accounts;

