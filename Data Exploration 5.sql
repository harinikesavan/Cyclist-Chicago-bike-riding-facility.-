----------top 10 ending stations for casual users----------

SELECT end_station_name, member_casual,
  AVG(end_lat) AS end_lat, AVG(end_lng) AS end_lng,
  COUNT(ride_id) AS total_trips
FROM `sonic-fiber-295809.Capstone_project_1.Cyclisticrider-data-clean-12-month-data`
WHERE member_casual = "casual"
GROUP BY end_station_name, member_casual
ORDER BY total_trips
desc LIMIT 10;

------------top 10 ending stations for members----------

SELECT end_station_name, member_casual,
  AVG(end_lat) AS end_lat, AVG(end_lng) AS end_lng,
  COUNT(ride_id) AS total_trips
FROM `sonic-fiber-295809.Capstone_project_1.Cyclisticrider-data-clean-12-month-data`
WHERE member_casual = "member"
GROUP BY end_station_name, member_casual
ORDER BY total_trips
desc LIMIT 10;

----------top 10 starting stations for casual users----------
  
SELECT start_station_name, member_casual,
  AVG(start_lat) AS start_lat, AVG(start_lng) AS start_lng,
  COUNT(ride_id) AS total_trips
FROM `sonic-fiber-295809.Capstone_project_1.Cyclisticrider-data-clean-12-month-data`
WHERE member_casual = "casual"
GROUP BY start_station_name, member_casual
ORDER BY total_trips
desc LIMIT 10;

------------top 10 starting stations for members----------

SELECT start_station_name, member_casual,
  AVG(start_lat) AS start_lat, AVG(start_lng) AS start_lng,
  COUNT(ride_id) AS total_trips
FROM `sonic-fiber-295809.Capstone_project_1.Cyclisticrider-data-clean-12-month-data`
WHERE member_casual = "member"
GROUP BY start_station_name, member_casual
ORDER BY total_trips
desc LIMIT 10;
