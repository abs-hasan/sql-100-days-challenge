-- Challenge:  Calculate month-over-month growth percentage using LAG function.

SELECT 
    month_year,
    revenue,
    -- Get previous month's revenue using LAG window function
    LAG(revenue) OVER (ORDER BY month_year) as previous_month_revenue,
    -- Calculate month-over-month growth percentage
    CAST(
        ROUND(
            (revenue / NULLIF(LAG(revenue) OVER (ORDER BY month_year), 0) - 1) * 100, 
            2  -- Round to 2 decimal places for clean percentage display
        ) AS DECIMAL(10,2)
    ) as growth_percentage,
    
    CASE 
        WHEN LAG(revenue) OVER (ORDER BY month_year) IS NULL THEN 'First Month'
        WHEN revenue > LAG(revenue) OVER (ORDER BY month_year) THEN 'Growth'
        WHEN revenue < LAG(revenue) OVER (ORDER BY month_year) THEN 'Decline'
        ELSE 'Flat'
    END as trend_indicator

FROM monthly_revenue 
ORDER BY month_year;
