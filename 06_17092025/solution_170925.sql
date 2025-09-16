-- Find total number of Monthly Active Users (MAU) for January 2022

-- TSQL
-- Get users active in January 2022
WITH january_active AS (
    SELECT DISTINCT user_id, MONTH(event_date) as month
    FROM user_actions
    WHERE event_date BETWEEN '2022-01-01' AND '2022-01-31'
      AND event_type IN ('sign-in', 'like', 'comment')
),

-- Get users active in December 2021
december_active AS (
    SELECT DISTINCT user_id
    FROM user_actions
    WHERE event_date BETWEEN '2021-12-01' AND '2021-12-31'
      AND event_type IN ('sign-in', 'like', 'comment')
)

-- Count users who appear in both months (retained users)
SELECT 
    MAX(january_active.month) as month,  
    COUNT(*) as monthly_active_users
FROM january_active
INNER JOIN december_active ON january_active.user_id = december_active.user_id;