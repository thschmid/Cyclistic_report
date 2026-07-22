##Groups trips by the hour of the day (0 to 23) to identify morning/evening peak hours

SELECT 
  member_casual,
  EXTRACT(HOUR FROM started_at) AS hour_of_day,
  COUNT(ride_id) AS total_rides
FROM 
  `thschmid-project1.Cyclistic.master_tripdata_clean`
GROUP BY 
  member_casual,
  hour_of_day
ORDER BY 
  member_casual,
  hour_of_day;