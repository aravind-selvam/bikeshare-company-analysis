drop table if exists full_tripdata;

create table full_tripdata as (
	select * from tripdata_2004 union
	select * from tripdata_2005 union
	select * from tripdata_2006 union
	select * from tripdata_2007 union
	select * from tripdata_2008 union
	select * from tripdata_2009 union
	select * from tripdata_2010 union
	select * from tripdata_2011 union
	select * from tripdata_2012 union
	select * from tripdata_2101 union
	select * from tripdata_2102 union
	select * from tripdata_2103);
	
SELECT * FROM full_tripdata order by started_at 	

---Finding duplicates---

SELECT 
	ride_id, 
	COUNT(ride_id)
FROM 
	full_tripdata
GROUP BY 
	ride_id
HAVING 
	COUNT(ride_id) > 1;--209 ride_id had duplicate entries, 
	--so we use SELECT DISTINCT to remove duplicates---

SELECT DISTINCT member_casual  
FROM full_tripdata;--Check for other entries
----
SELECT rideable_type, COUNT(1)
FROM full_tripdata
GROUP BY rideable_type;--Check for count of each cycle types
----
SELECT count(1)
FROM full_tripdata
WHERE start_station_name is null 
and end_station_name is null;--356080 nulls
----
SELECT ride_id,(ended_at-started_at)as duration
FROM full_tripdata 
ORDER BY duration --there are many -ve values which means start time > end time
----
select start_station_name, count(1)
from full_tripdata
group by start_station_name;

----Create new table (for cleaned data)---
DROP TABLE if EXISTS new_tripdata;
CREATE TABLE new_tripdata
(ride_id varchar(50),
user_type varchar(50),
bike_type varchar(50),
start_station_name varchar(100),
end_station_name varchar(100),
started_at timestamp,
ended_at timestamp,
duration interval);
				  
INSERT INTO new_tripdata 
SELECT * FROM(
SELECT DISTINCT ride_id,
member_casual AS user_type,
rideable_type AS bike_type,
start_station_name,
end_station_name,
started_at,
ended_at,
(ended_at - started_at)as duration
FROM
full_tripdata)F
WHERE
(started_at < ended_at) 
AND
(start_station_name IS NOT NULL
AND end_station_name IS NOT NULL)
AND
(ended_at-started_at) > (interval '1' minute);

select * from new_tripdata limit 100---- Cleaned data


	
	
	
	
	
	
	
	
	
	
	
	