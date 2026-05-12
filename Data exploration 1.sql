--------------number of rides by user_type-------------------
SELECT
  member_casual AS Type_of_Rider,

COUNT(ride_id) AS Total_Num_Of_Rides

FROM `sonic-fiber-295809.Capstone_project_1.Cyclisticrider-data-clean-12-month-data`
	
GROUP BY
	member_casual;
