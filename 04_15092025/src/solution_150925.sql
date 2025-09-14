-- Moving average calculation for daily sales
SELECT 
    sale_date, 
    daily_total,
    CASE 
        -- Make sure we have enough days first
        WHEN ROW_NUMBER() OVER (ORDER BY sale_date) >= 7 
            -- Get the average of this day plus the 6 days before it
            THEN CAST(ROUND(AVG(daily_total) 
            OVER ( ORDER BY sale_date 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW  -- this gives us 7 days total
        ), 2) AS DECIMAL(10,2))
        -- Don't calculate anything for the first few days
        ELSE NULL 
    END AS moving_avg_7_day
FROM daily_sales
ORDER BY sale_date;
