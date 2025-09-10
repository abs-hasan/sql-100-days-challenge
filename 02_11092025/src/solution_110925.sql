-- Find all flight paths from NYC to Tokyo with max 2 stops, showing complete routes and layover airports.

WITH recursive_flight
AS (
	-- ANCHOR QUERY (Base Case) : Start with all direct flights FROM NYC
	SELECT flight_id, origin AS actual_origin,
            origin, destination,
            CAST(origin + ' -> ' + destination AS VARCHAR(200)) AS route_path,
            CAST('' AS VARCHAR(200)) AS transit_city,0 AS stops
	FROM flights WHERE origin = 'NYC'
	
	UNION ALL

	-- RECURSIVE QUERY (Self-referencing) : Find connecting flights from previous destinations
	SELECT f.flight_id, rf.actual_origin,
            f.origin, f.destination,
            CAST(rf.route_path + ' -> ' + f.destination AS VARCHAR(200)) AS route_path,
            CAST(CASE 
				WHEN rf.transit_city = '' THEN f.origin
				ELSE rf.transit_city + ', ' + f.origin
				END AS VARCHAR(200)) AS transit_city, rf.stops + 1
	FROM flights AS f

	INNER JOIN recursive_flight AS rf ON f.origin = rf.destination
    WHERE rf.stops < 2 AND rf.destination != 'Tokyo'
	)

-- OUTPUT: only paths that end in Tokyo. Sort by fewest layovers, then id.
SELECT flight_id, actual_origin, transit_city AS layover_airport,
        destination,route_path, stops FROM recursive_flight
WHERE destination = 'Tokyo'
ORDER BY LEN(transit_city), flight_id;
