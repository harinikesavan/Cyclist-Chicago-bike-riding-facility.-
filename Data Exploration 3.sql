---------- average ride_length each month by user----------

SELECT  
 EXTRACT(MONTH FROM SAFE_CAST(started_at AS TIMESTAMP)) AS month,
  COUNT(ride_id) AS total_num_of_rides,
  member_casual AS type_of_rider,
  AVG(
    TIMESTAMP_DIFF(
      SAFE_CAST(ended_at AS TIMESTAMP),
      SAFE_CAST(started_at AS TIMESTAMP),
      MINUTE
    )
  ) AS avg_ride_length,
FROM `sonic-fiber-295809.Capstone_project_1.Cyclisticrider-data-clean-12-month-data`
GROUP BY month, member_casual
ORDER BY month;
