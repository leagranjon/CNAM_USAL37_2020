
DROP DATABASE usal37_repartout; 

CREATE DATABASE usal37_repartout DEFAULT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

USE usal37_repartout;


CREATE TABLE customers(
   customer_id INT PRIMARY KEY AUTO_INCREMENT,
   customer_lastname VARCHAR(50) NOT NULL,
   customer_firstname VARCHAR(50) NOT NULL,
   customer_address VARCHAR(255) NOT NULL,
   customer_phone CHAR(16) NOT NULL
);

CREATE TABLE categories(
   cat_id INT AUTO_INCREMENT,
   cat_name VARCHAR(32), 
   PRIMARY KEY(cat_id)
);

CREATE TABLE mechanics(
   mecha_id INT AUTO_INCREMENT,
   cat_id INT NOT NULL,
   PRIMARY KEY(mecha_id),
   FOREIGN KEY (cat_id) REFERENCES categories(cat_id)
);

CREATE TABLE repairs(
   customer_id INT,
   cat_id INT,
   mecha_id INT,
   repair_date_start DATETIME NOT NULL,
   repair_duration TIME NOT NULL DEFAULT '01:00',
   repair_price DECIMAL(8,2) NOT NULL,
   PRIMARY KEY(customer_id, cat_id, mecha_id)
);

ALTER TABLE repairs 
ADD CONSTRAINT fk_repairs_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
ADD CONSTRAINT fk_repairs_categories FOREIGN KEY (cat_id) REFERENCES categories(cat_id),
ADD CONSTRAINT fk_repairs_mechanics FOREIGN KEY (mecha_id) REFERENCES mechanics(mecha_id);

