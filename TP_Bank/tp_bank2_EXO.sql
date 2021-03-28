USE usal37_tp_bank;

SELECT * FROM accounts;

SELECT account_id, account_owner, account_balance, bank_name 
FROM accounts 
INNER JOIN banks ON banks.bank_id = accounts.bank_id
WHERE account_id > 20;


SELECT account_id, account_owner, account_balance, bank_name 
FROM accounts 
LEFT JOIN banks ON banks.bank_id = accounts.bank_id
WHERE account_id > 20; 







