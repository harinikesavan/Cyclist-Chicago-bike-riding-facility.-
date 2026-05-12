-- Step 1: Create cleaned ride data with weekday information
WITH ride_data AS (
  SELECT 
    ride_id,

    -- Ride length in minutes
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length,

    -- Weekday name
    CASE EXTRACT(DAYOFWEEK FROM started_at)
      WHEN 1 THEN 'SUN'
      WHEN 2 THEN 'MON'
      WHEN 3 THEN 'TUES'
      WHEN 4 THEN 'WED'
      WHEN 5 THEN 'THURS'
      WHEN 6 THEN 'FRI'
      WHEN 7 THEN 'SAT'
    END AS day_of_week,

    member_casual

  FROM `sonic-fiber-295809.Capstone_project_1.Cyclisticrider-data-clean-12-month-data`

  WHERE
    start_station_name IS NOT NULL
    AND end_station_name IS NOT NULL
)

-- Step 2: Compare weekdays by rider type
SELECT
  member_casual,
  day_of_week,

  COUNT(ride_id) AS total_rides,

  ROUND(AVG(ride_length), 2) AS avg_ride_length_minutes

FROM ride_data

WHERE ride_length > 1
  AND ride_length < 1440

GROUP BY
  member_casual,
  day_of_week

ORDER BY
  member_casual,

  CASE day_of_week
    WHEN 'MON' THEN 1
    WHEN 'TUES' THEN 2
    WHEN 'WED' THEN 3
    WHEN 'THURS' THEN 4
    WHEN 'FRI' THEN 5
    WHEN 'SAT' THEN 6
    WHEN 'SUN' THEN 7
  END;
