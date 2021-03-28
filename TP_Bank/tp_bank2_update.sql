use usal37_tp_bank;

SELECT * FROM accounts;

UPDATE accounts SET account_balance=account_balance + 1000 WHERE account_id=31;
UPDATE accounts SET account_balance=account_balance + 500 WHERE account_id=30;
UPDATE accounts SET account_balance=account_balance + 750 WHERE account_id=21;
UPDATE accounts SET account_balance=account_balance + 299.63 WHERE account_id=20;
UPDATE accounts SET account_balance=account_balance + 10 WHERE account_id=11;
UPDATE accounts SET account_balance=account_balance + 5 WHERE account_id=10;

UPDATE accounts SET account_balance=account_balance - 2 WHERE account_id=11;
UPDATE accounts SET account_balance=account_balance + 2 WHERE account_id=10;

