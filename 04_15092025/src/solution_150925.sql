SELECT 
    sale_date, 
    daily_total,
    CASE 
        WHEN ROW_NUMBER() OVER (ORDER BY sale_date) >= 7 
            THEN CAST(ROUND(AVG(daily_total) 
            OVER ( ORDER BY sale_date 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ), 2) AS DECIMAL(10,2))
        ELSE NULL 
    END AS moving_avg_7_day
FROM daily_sales
ORDER BY sale_date;