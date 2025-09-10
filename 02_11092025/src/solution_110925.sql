WITH recursive_flight
AS (
	SELECT flight_id, origin AS actual_origin,
            origin, destination,
            CAST(origin + ' -> ' + destination AS VARCHAR(200)) AS route_path,
            CAST('' AS VARCHAR(200)) AS transit_city,1 AS stops
	FROM flights WHERE origin = 'NYC'
	
	UNION ALL
	
	SELECT f.flight_id, rf.actual_origin,
            f.origin, f.destination,
            CAST(rf.route_path + ' -> ' + f.destination AS VARCHAR(200)) AS route_path,
            CAST(CASE 
				WHEN rf.transit_city = '' THEN f.origin
				ELSE rf.transit_city + ', ' + f.origin
				END AS VARCHAR(200)) AS transit_city, rf.stops + 1
	FROM flights AS f

	INNER JOIN recursive_flight AS rf ON f.origin = rf.destination
    WHERE rf.stops < 3 AND rf.destination != 'Tokyo'
	)

SELECT flight_id, actual_origin, transit_city AS layover_airport,
        stops, destination,route_path FROM recursive_flight
WHERE destination = 'Tokyo'
ORDER BY LEN(transit_city), flight_id;
