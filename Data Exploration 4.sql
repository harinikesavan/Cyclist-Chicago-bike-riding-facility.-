
----------calculate rides by user & bike type----------

SELECT
  member_casual AS type_of_rider,
  rideable_type AS bike_type,

COUNT(rideable_type) AS total_number_of_rides

FROM
 `sonic-fiber-295809.Capstone_project_1.Cyclisticrider-data-clean-12-month-data`

GROUP BY
  member_casual, rideable_type
