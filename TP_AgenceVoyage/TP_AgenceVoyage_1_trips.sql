USE usal37_agence;

select * from cities;

/* - Sélectionnez tous les voyages déjà passés.*/ 
SELECT 
trip_title, trip_code, trip_available, trip_start, trip_end, trip_price, trip_overview, trip_description, city_code
FROM trips 
WHERE trip_end < NOW()
;

SELECT NOW(); -- date + heure courante
SELECT CURDATE(); -- date d'aujourd'hui
SELECT CURTIME(); -- heure courante

/* - Sélectionnez le nombre de voyages déjà passés.*/ 
SELECT 
COUNT(*)
FROM trips 
WHERE trip_end < NOW()
;


/* - Sélectionnez les voyages au départ de Mulhouse. */

SELECT 
trip_code, trip_title, trip_available, trip_start, trip_end, trip_price, trip_overview, trip_description, 
trips.city_code, city_name
FROM  trips 
JOIN cities ON trips.city_code = cities.city_code 
WHERE city_name='Mulhouse';


/* 
- Sélectionnez tous les voyages 
	(nom de la ville, code pays et nom du pays inclus) */
SELECT 
trip_code, trip_title, trip_available, trip_start, trip_end, trip_price, trip_overview, trip_description, 
trips.city_code, city_name, cities.country_code, country_name
FROM trips 
JOIN cities ON trips.city_code = cities.city_code 
JOIN countries ON cities.country_code = countries.country_code;




select * from trips;