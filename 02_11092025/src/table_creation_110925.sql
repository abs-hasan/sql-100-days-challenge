
DROP TABLE IF Exists flights;
CREATE TABLE flights (
    flight_id INT,
    origin VARCHAR(10),
    destination VARCHAR(10),
    cost DECIMAL(8,2),
    duration_hours DECIMAL(4,1),
    airline VARCHAR(30)
);

INSERT INTO flights VALUES
-- From NYC
(1, 'NYC', 'London', 650.00, 7.5, 'British Airways'),
(2, 'NYC', 'Paris', 700.00, 8.0, 'Air France'),
(3, 'NYC', 'Frankfurt', 680.00, 8.5, 'Lufthansa'),
(4, 'NYC', 'Dubai', 850.00, 12.5, 'Emirates'),
(5, 'NYC', 'Seoul', 950.00, 14.0, 'Korean Air'),

-- From London
(6, 'London', 'Tokyo', 750.00, 11.5, 'Japan Airlines'),
(7, 'London', 'Dubai', 400.00, 7.0, 'Emirates'),
(8, 'London', 'Frankfurt', 200.00, 2.0, 'Lufthansa'),
(9, 'London', 'Moscow', 350.00, 4.0, 'Aeroflot'),

-- From Paris
(10, 'Paris', 'Tokyo', 800.00, 12.0, 'Air France'),
(11, 'Paris', 'Dubai', 450.00, 7.5, 'Emirates'),
(12, 'Paris', 'Frankfurt', 180.00, 1.5, 'Lufthansa'),

-- From Frankfurt
(13, 'Frankfurt', 'Tokyo', 720.00, 11.0, 'Lufthansa'),
(14, 'Frankfurt', 'Dubai', 380.00, 6.5, 'Emirates'),
(15, 'Frankfurt', 'Moscow', 300.00, 3.5, 'Aeroflot'),

-- From Dubai
(16, 'Dubai', 'Tokyo', 550.00, 8.5, 'Emirates'),
(17, 'Dubai', 'Seoul', 450.00, 7.0, 'Korean Air'),
(18, 'Dubai', 'Mumbai', 200.00, 3.0, 'Emirates'),

-- From Seoul
(19, 'Seoul', 'Tokyo', 250.00, 2.0, 'Korean Air'),

-- From Moscow
(20, 'Moscow', 'Tokyo', 600.00, 9.0, 'Aeroflot'),
(21, 'Moscow', 'Seoul', 500.00, 7.5, 'Aeroflot'),

-- Some return flights for complexity
(22, 'Tokyo', 'Seoul', 280.00, 2.5, 'Korean Air'),
(23, 'Mumbai', 'Dubai', 220.00, 3.5, 'Emirates');