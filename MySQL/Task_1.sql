-- Query all columns (attributes) for every row in the CITY table.
select * from city;

-- Query all columns for a city in CITY with the ID 1661.
select * from city where ID = 1661;

-- Query a list of CITY and STATE from the STATION table. 
select city, state from station;