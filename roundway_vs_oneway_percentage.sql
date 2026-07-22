##Identifies what percentage of trips start and end at the same station.

SELECT 
  member_casual,
  COUNT(ride_id) AS total_rides,
  SUM(CASE WHEN start_station_name = end_station_name THEN 1 ELSE 0 END) AS round_trips,
  SUM(CASE WHEN start_station_name != end_station_name THEN 1 ELSE 0 END) AS one_way_trips,
  ROUND(100.0 * SUM(CASE WHEN start_station_name = end_station_name THEN 1 ELSE 0 END) / COUNT(ride_id), 2) AS pct_round_trips
FROM 
  `thschmid-project1.Cyclistic.master_tripdata_clean`
WHERE 
  start_station_name IS NOT NULL AND end_station_name IS NOT NULL
GROUP BY 
  member_casual;