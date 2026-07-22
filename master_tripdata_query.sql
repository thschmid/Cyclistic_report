CREATE OR REPLACE TABLE `thschmid-project1.Cyclistic.master_tripdata` AS

SELECT * FROM (
  SELECT * FROM `thschmid-project1.Cyclistic.tripdata_202507`
  UNION ALL
  SELECT * FROM `thschmid-project1.Cyclistic.tripdata_202508`
  UNION ALL
  SELECT * FROM `thschmid-project1.Cyclistic.tripdata_202509`
  UNION ALL
  SELECT * FROM `thschmid-project1.Cyclistic.tripdata_202510`
  UNION ALL
  SELECT * FROM `thschmid-project1.Cyclistic.tripdata_202511`
  UNION ALL
  SELECT * FROM `thschmid-project1.Cyclistic.tripdata_202512`
  UNION ALL
  SELECT * FROM `thschmid-project1.Cyclistic.tripdata_202601`
  UNION ALL
  SELECT * FROM `thschmid-project1.Cyclistic.tripdata_202602`
  UNION ALL
  SELECT * FROM `thschmid-project1.Cyclistic.tripdata_202603`
  UNION ALL
  SELECT * FROM `thschmid-project1.Cyclistic.tripdata_202604`
  UNION ALL
  SELECT * FROM `thschmid-project1.Cyclistic.tripdata_202605`
  UNION ALL
  SELECT * FROM `thschmid-project1.Cyclistic.tripdata_202606`
)
WHERE ended_at >= started_at;