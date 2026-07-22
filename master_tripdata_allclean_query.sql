###Clean master_tripdata query. filters time durations outliers, removes negative time and
###removes duplicate ride_id entries. creates a new table master_tripdata_clean


CREATE OR REPLACE TABLE `thschmid-project1.Cyclistic.master_tripdata_clean` AS
SELECT 
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual,
    ##calulate time diff for later summary statistics
    TIMESTAMP_DIFF(ended_at, started_at, SECOND) AS ride_length_seconds,
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length_minutes
FROM `thschmid-project1.Cyclistic.master_tripdata`
WHERE 
    -- Filter out rides under 1 minute or over 24 hours (1440 minutes)
    TIMESTAMP_DIFF(ended_at, started_at, SECOND) >= 60
    AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) <= 1440
QUALIFY ROW_NUMBER() OVER(PARTITION BY ride_id ORDER BY started_at) = 1;