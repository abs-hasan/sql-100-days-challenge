-- Drop table if it exists to ensure clean start
DROP TABLE IF EXISTS monthly_revenue;

-- Create the monthly revenue table
CREATE TABLE monthly_revenue (
    month_year VARCHAR(7),     
    revenue DECIMAL(12,2)
);

-- Insert sample data 

INSERT INTO monthly_revenue VALUES
('2024-01', 100000), 
('2024-02', 110000), 
('2024-03', 105000),  
('2024-04', 120000), 
('2024-05', 115000), 
('2024-06', 130000); 