-- Drop table if it exists to ensure clean start
DROP TABLE IF EXISTS user_actions;

-- Create the user_actions table
CREATE TABLE user_actions (
    user_id INTEGER,
    event_id INTEGER,
    event_type VARCHAR(20),
    event_date DATETIME
);

-- Insert focused sample data (Dec 2021 - May 2022)
INSERT INTO user_actions VALUES
-- December 2021 (previous month for Jan 2022 MAU)
(101, 1001, 'sign-in', '2021-12-05 10:15:00'),
(102, 1002, 'like', '2021-12-12 14:30:00'),
(103, 1003, 'comment', '2021-12-18 16:45:00'),
(104, 1004, 'sign-in', '2021-12-25 11:20:00'),
(201, 1005, 'like', '2021-12-28 09:30:00'),

-- January 2022 (current month for Jan 2022 MAU)
(101, 2001, 'like', '2022-01-03 11:20:00'),      -- 101 active in Dec+Jan (JAN MAU)
(102, 2002, 'sign-in', '2022-01-08 13:40:00'),   -- 102 active in Dec+Jan (JAN MAU)  
(105, 2003, 'comment', '2022-01-15 15:10:00'),   -- 105 new user (not MAU)
(106, 2004, 'like', '2022-01-22 09:30:00'),      -- 106 new user (not MAU)
(201, 2005, 'sign-in', '2022-01-28 12:45:00'),   -- 201 active in Dec+Jan (JAN MAU)

-- February 2022 
(101, 3001, 'comment', '2022-02-02 12:15:00'),   -- 101 active in Jan+Feb (consecutive)
(105, 3002, 'sign-in', '2022-02-10 14:45:00'),   -- 105 active in Jan+Feb (consecutive)
(106, 3003, 'like', '2022-02-15 10:20:00'),      -- 106 active in Jan+Feb (consecutive)
(107, 3004, 'comment', '2022-02-22 17:30:00'),   -- 107 new user (not consecutive)

-- March 2022
(105, 4001, 'like', '2022-03-05 09:45:00'),      -- 105 active in Feb+Mar (consecutive)
(106, 4002, 'sign-in', '2022-03-12 11:30:00'),   -- 106 active in Feb+Mar (consecutive)
(107, 4003, 'comment', '2022-03-18 14:20:00'),   -- 107 active in Feb+Mar (consecutive)
(108, 4004, 'like', '2022-03-25 16:10:00'),      -- 108 new user (not consecutive)

-- April 2022
(107, 5001, 'sign-in', '2022-04-03 10:00:00'),   -- 107 active in Mar+Apr (consecutive)
(108, 5002, 'like', '2022-04-08 14:30:00'),      -- 108 active in Mar+Apr (consecutive)
(201, 5003, 'comment', '2022-04-15 09:15:00'),   -- 201 returns after gap
(301, 5004, 'sign-in', '2022-04-20 12:45:00'),   -- 301 new user

-- May 2022
(108, 6001, 'comment', '2022-05-05 11:30:00'),   -- 108 active in Apr+May (consecutive)
(201, 6002, 'like', '2022-05-12 16:45:00'),      -- 201 active in Apr+May (consecutive)
(301, 6003, 'sign-in', '2022-05-18 10:15:00'),   -- 301 active in Apr+May (consecutive)
(401, 6004, 'like', '2022-05-25 13:20:00');      -- 401 new user
