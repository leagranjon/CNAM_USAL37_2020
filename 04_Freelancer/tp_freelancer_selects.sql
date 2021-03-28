use tp_freelancer;

SELECT cat_name FROM customers_cats;

SELECT customer_name, cat_name 
FROM customers 
JOIN customers_cats ON customers.cat_id = customers_cats.cat_id;

/* affiche les titres des missions avec pour chaque mission 
	le nom du client et le nom de catégorie du client */

SELECT job_title, customer_name, cat_name 
FROM jobs 
JOIN customers ON jobs.customer_id = customers.customer_id 
JOIN customers_cats ON customers.cat_id = customers_cats.cat_id;


/* affiche les titres des missions avec pour chaque mission 
	l'id et le nom du client et le nom de catégorie du client */

SELECT 
jobs.job_title, 
jobs.customer_id, 
customers.customer_name, 
customers_cats.cat_name 
FROM jobs 
JOIN customers ON jobs.customer_id = customers.customer_id 
JOIN customers_cats ON customers.cat_id = customers_cats.cat_id; 



/* affiche les titres des missions avec pour chaque mission 
	l'id et le nom du client et le nom de catégorie du client */

SELECT 
job_title AS titre_mission, 
jobs.customer_id, 
customer_name, 
cat_name 
FROM jobs 
JOIN customers ON jobs.customer_id = customers.customer_id 
JOIN customers_cats ON customers.cat_id = customers_cats.cat_id; 



/* affiche les titres des missions avec pour chaque mission 
	l'id et le nom du client et le nom de catégorie du client */

SELECT 
job_title AS titre_mission, 
J.customer_id, 
customer_name, 
cat_name 
FROM jobs AS J 
JOIN customers AS C ON J.customer_id = C.customer_id 
JOIN customers_cats AS CAT ON C.cat_id = CAT.cat_id; 


