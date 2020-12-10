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

/*
Error Code: 1452. 
Cannot add or update a child row: 
a foreign key constraint fails 
(`usal37_agence`.`trips_theme`, CONSTRAINT `trips_theme_ibfk_1` FOREIGN KEY (`trip_code`) REFERENCES `trips` (`trip_code`))

Error Code: 1452. 
Cannot add or update a child row: 
a foreign key constraint fails 
(`usal37_agence`.`trips_theme`, CONSTRAINT `fk_trips_themes` FOREIGN KEY (`theme_code`) REFERENCES `themes` (`theme_code`))

*/