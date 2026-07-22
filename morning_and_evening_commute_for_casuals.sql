-- 1. Morning Starts
SELECT 
    start_station_name AS station_name,
    CONCAT(CAST(AVG(start_lat) AS STRING), ',', CAST(AVG(start_lng) AS STRING)) AS location,
    'Morning Start (7-9 AM)' AS station_type,
    COUNT(ride_id) AS total_rides
FROM `thschmid-project1.Cyclistic.master_tripdata_clean`
WHERE member_casual = 'casual'
    AND EXTRACT(DAYOFWEEK FROM started_at) BETWEEN 2 AND 6
    AND EXTRACT(HOUR FROM started_at) BETWEEN 7 AND 9
    AND start_station_name IS NOT NULL
GROUP BY start_station_name

UNION ALL

-- 2. Morning Ends
SELECT 
    end_station_name AS station_name,
    CONCAT(CAST(AVG(end_lat) AS STRING), ',', CAST(AVG(end_lng) AS STRING)) AS location,
    'Morning End (7-9 AM)' AS station_type,
    COUNT(ride_id) AS total_rides
FROM `thschmid-project1.Cyclistic.master_tripdata_clean`
WHERE member_casual = 'casual'
    AND EXTRACT(DAYOFWEEK FROM started_at) BETWEEN 2 AND 6
    AND EXTRACT(HOUR FROM started_at) BETWEEN 7 AND 9
    AND end_station_name IS NOT NULL
GROUP BY end_station_name

UNION ALL

-- 3. Evening Starts (Leaving Business)
SELECT 
    start_station_name AS station_name,
    CONCAT(CAST(AVG(start_lat) AS STRING), ',', CAST(AVG(start_lng) AS STRING)) AS location,
    'Evening Start (4-6 PM)' AS station_type,
    COUNT(ride_id) AS total_rides
FROM `thschmid-project1.Cyclistic.master_tripdata_clean`
WHERE member_casual = 'casual'
    AND EXTRACT(DAYOFWEEK FROM started_at) BETWEEN 2 AND 6
    AND EXTRACT(HOUR FROM started_at) BETWEEN 16 AND 18
    AND start_station_name IS NOT NULL
GROUP BY start_station_name

UNION ALL

-- 4. Evening Ends
SELECT 
    end_station_name AS station_name,
    CONCAT(CAST(AVG(end_lat) AS STRING), ',', CAST(AVG(end_lng) AS STRING)) AS location,
    'Evening End (4-6 PM)' AS station_type,
    COUNT(ride_id) AS total_rides
FROM `thschmid-project1.Cyclistic.master_tripdata_clean`
WHERE member_casual = 'casual'
    AND EXTRACT(DAYOFWEEK FROM started_at) BETWEEN 2 AND 6
    AND EXTRACT(HOUR FROM started_at) BETWEEN 16 AND 18
    AND end_station_name IS NOT NULL
GROUP BY end_station_name;