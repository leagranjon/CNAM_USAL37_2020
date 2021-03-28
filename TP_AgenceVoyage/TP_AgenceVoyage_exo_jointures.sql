use usal37_agence;

/**
AFFICHER le nom du client, son identifiant, son téléphone 
	+ les voyages associés (code du voyage, titre du voyage, et prix du voyage)
**/
/*
Error Code: 1052. 
Column 'client_id' in field list is ambiguous
Error Code: 1052. Column 'trip_code' in field list is ambiguous

*/
SELECT 
client_lastname, 
C.client_id, 
client_phone,
T.trip_code,
trip_title,
trip_price 
FROM clients AS C 
JOIN orders  AS O ON O.client_id = C.client_id 
JOIN trips   AS T ON T.trip_code = O.trip_code;

SELECT 
client_lastname, 
clients.client_id, 
client_phone,
trips.trip_code,
trip_title,
trip_price 
FROM clients 
JOIN orders ON orders.client_id = clients.client_id 
JOIN trips  ON trips.trip_code = orders.trip_code;


/**
AFFICHER le nom du client, son identifiant, son téléphone 
	+ les voyages associés (code du voyage, titre du voyage, et prix du voyage)
    + le nom pays de destination du voyage
**/

SELECT 
client_lastname, 
clients.client_id, 
client_phone,
trips.trip_code,
trip_title,
trip_price,
country_name
FROM clients 
JOIN orders ON usal37_agence.orders.client_id = clients.client_id 
JOIN trips  ON trips.trip_code = orders.trip_code 
JOIN cities ON trips.city_code = cities.city_code 
JOIN countries ON cities.country_code = countries.country_code;



