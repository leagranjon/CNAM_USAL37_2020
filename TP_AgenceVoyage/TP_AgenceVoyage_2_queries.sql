USE usal37_agence;

SELECT * FROM cities; 
SELECT * FROM countries;

SELECT * FROM trips WHERE trip_start > '2020-05-01';

/* VILLES + PAYS */

-- SELECT city_name, cities.country_code country_name FROM cities,countries;

/* Afficher les villes avec le nom du pays associé */
SELECT *
FROM cities JOIN countries ON cities.country_code = countries.country_code;

/* Afficher les pays avec les noms des villes associées
   JOIN      =  les pays sans ville associée ne sont pas affichés
   LEFT JOIN = les pays sans ville associée sont affichés */
SELECT city_name, countries.country_code, country_name 
FROM countries LEFT JOIN cities ON cities.country_code = countries.country_code;


/* Afficher les villes avec le nom du pays associé
   Et uniquement les villes dont le nom du pays commence par "I" */
SELECT city_code, city_name, cities.country_code, country_name 
FROM cities 
JOIN countries 
ON cities.country_code = countries.country_code AND country_name LIKE 'I%';


/* Afficher les villes avec le nom du pays associé
   Et uniquement les villes dont le nom du pays commence par "I"
   Syntaxe alternative */
SELECT city_code, city_name, cities.country_code, country_name 
FROM cities 
JOIN countries 
ON cities.country_code = countries.country_code 
WHERE country_name LIKE 'I%';




/* afficher : les voyages avec le nom du client associé */
SELECT * FROM trips 
INNER JOIN orders ON trips.trip_code = orders.trip_code 
INNER JOIN clients ON orders.client_id = clients.client_id
;

SELECT * FROM trips 
RIGHT JOIN orders ON trips.trip_code = orders.trip_code 
RIGHT JOIN clients ON orders.client_id = clients.client_id
;

SELECT * FROM clients 
LEFT JOIN orders ON clients.client_id = orders.client_id 
LEFT JOIN trips ON orders.trip_code = trips.trip_code
;

SELECT * FROM trips 
LEFT JOIN orders ON trips.trip_code = orders.trip_code 
RIGHT JOIN clients ON orders.client_id = clients.client_id
;

SELECT * FROM trips 
RIGHT JOIN orders ON trips.trip_code = orders.trip_code 
LEFT JOIN clients ON orders.client_id = clients.client_id
;

