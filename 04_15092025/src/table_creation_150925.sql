
DROP TABLE IF Exists daily_sales;

CREATE TABLE daily_sales 
    (
        sale_date DATE, 
        daily_total DECIMAL(10,2)
        );

INSERT INTO daily_sales 
    VALUES
        ('2024-01-01',1000),
        ('2024-01-02',1200),
        ('2024-01-03',800),
        ('2024-01-04',1500),
        ('2024-01-05',900),
        ('2024-01-06',1100),
        ('2024-01-07',1300),
        ('2024-01-08',1000),
        ('2024-01-09',1400);