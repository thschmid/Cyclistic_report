##checks column name and data type from metadata table against master_tripdata.
##acts as a quick schema audit to make sure column names and data types are correct

SELECT 
    column_name, 
    data_type 
FROM 
    `thschmid-project1.Cyclistic.INFORMATION_SCHEMA.COLUMNS`
WHERE 
    table_name = 'master_tripdata';