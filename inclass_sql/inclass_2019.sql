SELECT rid, ST_Metadata(rast)
FROM glc2000
LIMIT 10

SELECT rid, (ST_Metadata(rast)).*
FROM glc2000
LIMIT 10

SELECT rid, ST_ValueCount(rast)
FROM glc2000
WHERE rid =1

WITH data as
(
SELECT rid, (ST_ValueCount(rast)).*
FROM glc2000
WHERE rid =1
)
SELECT rid, sum(count) as number_of_pixels
FROM data
GROUP BY rid

--62500
SELECT 250*250
-- GRANT ALL ON glc2000 TO STUDENTS
-- GRANT ALL ON us_states_gid_seq to students