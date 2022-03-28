--ANALYSIS--

--Total_count of annual and casual users--

SELECT user_type, count(*)
from new_tripdata
group by user_type

----Extract day of week of each user_types---

with cte (user_type,start_day) as
(SELECT user_type, CASE
WHEN EXTRACT(DOW FROM started_at) = 0 THEN 'Sunday'
WHEN EXTRACT(DOW FROM started_at) = 1 THEN 'Monday'
WHEN EXTRACT(DOW FROM started_at) = 2 THEN 'Tuesday'
WHEN EXTRACT(DOW FROM started_at) = 3 THEN 'Wednesday'
WHEN EXTRACT(DOW FROM started_at) = 4 THEN 'Thursday'
WHEN EXTRACT(DOW FROM started_at) = 5 THEN 'Friday'
WHEN EXTRACT(DOW FROM started_at) = 6 THEN 'Saturday' 
END AS start_day 
FROM new_tripdata 
)
SELECT start_day,COUNT(1),user_type
FROM cte
GROUP BY user_type,start_day ORDER BY user_type; -- 'Result saved as CSV for viz'

---Length of ride stats (mentioned by capstone project guide)--

SELECT user_type,SUM(EXTRACT(epoch FROM duration)/3600) AS total_used_hours,
AVG(EXTRACT(epoch FROM duration)/60)AS mean,
MAX((EXTRACT(epoch FROM duration)/60))AS max,
MIN(EXTRACT(epoch FROM duration)/60)AS min
FROM new_tripdata
GROUP BY user_type -- -- 'Result saved as CSV for viz'

----- Top 10 location where casual users and annual members take rides----

SELECT d.location,
SUM(d.count)AS visits
FROM (SELECT DISTINCT start_station_name as location,
user_type,COUNT(*) 
FROM new_tripdata 
WHERE user_type = 'casual'
GROUP BY user_type,location )as d
GROUP BY d.location 
ORDER BY visits desc LIMIT 10 -- 'casual user's data -- 

SELECT temp.location,
SUM(temp.count)AS visits
FROM(SELECT DISTINCT start_station_name as location,
user_type,
COUNT(*) 
FROM new_tripdata where user_type = 'member'
GROUP BY user_type,location )as temp
GROUP BY temp.location 
ORDER BY visits desc LIMIT 10-- 'annual member's data' -- 'Result saved as CSV for viz'

---- To count number of rides on each date ---

SELECT date(started_at) as ymd, count(*) as count
from new_tripdata where user_type = 'casual'
group by ymd order by ymd; -- 'Result saved as CSV for viz'

---- To find which hour of the day most rides take place based on user_type---

SELECT user_type,date_part('hour',started_at)as hour, count(*)as count
from new_tripdata where user_type = 'member'
group by hour,user_type order by hour;

SELECT user_type ,date_part('hour', started_at)as hour, count(*)as count 
from new_tripdata where user_type ='casual'
group by hour,user_type order by hour; -- 'Result saved as CSV for viz'

-----To find which bike type is most prefered by users----

SELECT bike_type,user_type,count(*)as bike_count
from new_tripdata group by user_type,bike_type
order by user_type;

--- Find total usage based on month and year---

SELECT date_part('month',started_at)AS month,
date_part('year',started_at)AS year, 
COUNT(*)AS total_rides,
user_type
FROM new_tripdata
GROUP BY month,year,user_type
ORDER BY year; ---- 'Result saved as CSV for viz'












