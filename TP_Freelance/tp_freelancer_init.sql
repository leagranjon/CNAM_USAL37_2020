DROP DATABASE IF EXISTS tp_freelancer;

CREATE DATABASE tp_freelancer DEFAULT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

USE tp_freelancer;

CREATE TABLE quotes
(
	quote_id INT PRIMARY KEY AUTO_INCREMENT,
    quote_state CHAR(10) NOT NULL,
    quote_date DATE NOT NULL,
    quote_amount INT,
    quote_final_date DATE NULL,
    quote_final_amount INT NULL
);

CREATE TABLE jobs
(
	job_id INT PRIMARY KEY AUTO_INCREMENT,
    job_state CHAR(10) NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    job_start DATETIME NOT NULL,
    job_end DATETIME NOT NULL,
    job_description TEXT
);

CREATE TABLE customers
(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(255)
);

CREATE TABLE customers_cats
(
	cat_id INT PRIMARY KEY AUTO_INCREMENT,
    cat_name VARCHAR(50) NOT NULL,
    cat_description TEXT NULL
);

ALTER TABLE customers 
ADD 
	CONSTRAINT fk_customers FOREIGN KEY (cat_id) REFERENCES customers_cats (cat_id);

ALTER TABLE jobs
ADD 
	CONSTRAINT fk_jobs_quotes FOREIGN KEY (quote_id) REFERENCES quotes(quote_id);
    
ALTER TABLE customers
ADD
		CONSTRAINT fk_customers_jobs FOREIGN KEY (job_id) REFERENCES jobs (job_id);