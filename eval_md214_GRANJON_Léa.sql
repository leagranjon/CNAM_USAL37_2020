DROP DATABASE IF EXISTS usal37_legumos;

CREATE DATABASE IF NOT EXISTS usal37_legumos DEFAULT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

USE usal37_legumos;

CREATE TABLE vegetables(
   vegetable_id INT,
   vegetable_name VARCHAR(50) NOT NULL,
   vegetable_variety VARCHAR(50) NOT NULL,
   vegetable_primarycolor VARCHAR(20) NOT NULL,
   vegetable_lifetime INT,
   vegetable_fresh INT,
   PRIMARY KEY(vegetable_id)
);

CREATE TABLE sales(
	sale_id INT,
    sale_date DATE,
    sale_weight INT,
    sale_unitprice DECIMAL(5,2) NOT NULL DEFAULT 0,
    sale_active INT,
	vegetable_id INT NULL,
	PRIMARY KEY(sale_id),
	FOREIGN KEY(vegetable_id) REFERENCES vegetables(vegetable_id)
);

INSERT INTO vegetables 
(vegetable_id, vegetable_name, vegetable_variety, vegetable_primarycolor, vegetable_lifetime, vegetable_fresh) 
VALUES 
(1001, "carrot", "nanco", "orange", "35", "1"),
(1002, "broccoli", "belstar", "green", "5", "1"),
(1003, "asparagus", "apollo", "green", "4", "1"),
(1004, "cauliflower", "white cauliflower", "white", "21", "1"),
(1005, "corn", "ambrosia hybrid", "yellow", "3", "1"),
(1006, "cucumber", "pickling", "green", "10", "1"),
(1007, "eggplant", "italian", "purple", "2", "1"),
(1008, "pepper ", "green pepper", "green", "14", "1"),
(1009, "lettuce", "Arugula ", "green", "10", "1"),
(1010, "mushrooms", "white button mushroom", "white", "12", "1"),
(1011, "onion", "white onions", "white", "60", "1"),
(1012, "potato", "agria", "yellow", "28", "1"),
(1013, "pumpkin", "Jack-Be-Little ", "orange", "56", "1"),
(1014, "tomato", "azoychka", "orange", "7", "1"),
(1015, "beetroot", "boltardy", "purple", "5", "1"),
(1016, "peas", "wando", "green", "7", "1"),
(1017, "zucchini", "black beauty", "dark green", "5", "1"),
(1018, "radish", "watermelon radish", "white", "10", "1"),
(1019, "artichoke", "globe artichokes", "light green", "5", "1"),
(1020, "leek", "almera leek", "green", "14", "1");

INSERT INTO sales 
(sale_id, sale_date, sale_weight, sale_unitprice, vegetable_id) 
VALUES 
(1100, "2020/04/21", "1", "3.5", 1001),
(1101, "2020/11/01", "2", "10.5", 1004),
(1102, "2020/06/29", "2", "7.2", 1007),
(1103, "2020/09/18", "1", "2.8", 1002),
(1104, "2020/02/25", "4", "10.8", 1010),
(1105, "2020/08/11", "3", "6.5", 1011),
(1106, "2020/09/20", "1", "4.6", 1016),
(1107, "2020/04/12", "1", "3.9", 1005),
(1108, "2020/10/17", "5", "20.2", 1013),
(1109, "2020/01/06", "3", "8.3", 1019);


DELIMITER $

CREATE PROCEDURE show_sale
( 
IN sale INT,  
IN from_sales INT, 
IN to_sales INT 
)
BEGIN
	DECLARE all_sales INT;
	SELECT sale_id INTO all_sales FROM sales WHERE sale_id=from_sales;
    
END $

DELIMITER ;