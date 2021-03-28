use usal37_agence;

SELECT * FROM trips;
SELECT * FROM themes;

SELECT * FROM trips_theme;


INSERT INTO trips_theme
(trip_code, theme_code) 
VALUES 
(5, 4);


SELECT * FROM trips 
JOIN trips_theme ON trips.trip_code = trips_theme.trip_code 
JOIN themes ON themes.theme_code = trips_theme.theme_code;

SELECT * FROM trips 
JOIN cities ON trips.city_code = cities.city_code
JOIN countries ON cities.country_code = countries.country_code
;

SELECT * FROM trips 
JOIN cities ON trips.city_code = cities.city_code
JOIN countries ON cities.country_code = countries.country_code 
JOIN trips_theme ON trips.trip_code = trips_theme.trip_code 
JOIN themes ON themes.theme_code = trips_theme.theme_code
JOIN trips_services ON trips.trip_code = trips_services.trip_code 
JOIN services ON services.service_code = trips_services.service_code
;



SELECT NOW();


SELECT city_name, country_code FROM cities;


SELECT * FROM cities 
JOIN countries ON cities.country_code = countries.country_code
;


SELECT city_name, country_name FROM cities 
JOIN countries ON cities.country_code = countries.country_code
;


SELECT 
city_name, 
countries.country_code, 
country_name 
FROM cities 
JOIN countries 
ON cities.country_code = countries.country_code
;

SELECT 
city_name, 
countries.country_code 
FROM countries 
JOIN cities 
ON cities.country_code = countries.country_code
;




-- Error Code: 1052. Column 'country_code' in field list is ambiguous

