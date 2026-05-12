-- Step 1: Calculate ride_length and enrich data with day_of_week and month
WITH ride_data AS (
  SELECT 
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    -- Calculate ride length in minutes
    (EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
     EXTRACT(MINUTE FROM (ended_at - started_at)) +
     EXTRACT(SECOND FROM (ended_at - started_at)) / 60) AS ride_length,
    -- Day of week
    CASE EXTRACT(DAYOFWEEK FROM started_at)
      WHEN 1 THEN 'SUN'
      WHEN 2 THEN 'MON'
      WHEN 3 THEN 'TUES'
      WHEN 4 THEN 'WED'
      WHEN 5 THEN 'THURS'
      WHEN 6 THEN 'FRI'
      WHEN 7 THEN 'SAT'    
    END AS day_of_week,
    -- Month
    CASE EXTRACT(MONTH FROM started_at)
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEB'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'APR'
      WHEN 5 THEN 'MAY'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AUG'
      WHEN 9 THEN 'SEP'
      WHEN 10 THEN 'OCT'
      WHEN 11 THEN 'NOV'
      WHEN 12 THEN 'DEC'
    END AS month,
    start_station_name,
    end_station_name,
    member_casual
  FROM `sonic-fiber-295809.Capstone_project_1.Cyclisticrider-data-clean-12-month-data`
  WHERE
    start_station_name IS NOT NULL AND
    end_station_name IS NOT NULL
)
-- Step 2: Filter for valid ride lengths
SELECT *
FROM ride_data
WHERE ride_length > 1 AND ride_length < 1440;

-- Step 3: Count total rows 
SELECT COUNT(ride_id) AS no_of_rows
FROM `sonic-fiber-295809.Capstone_project_1.Cyclisticrider-data-clean-12-month-data`;
