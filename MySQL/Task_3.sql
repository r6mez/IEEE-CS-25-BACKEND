-- Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN. 
select name from city where COUNTRYCODE = 'JPN';

--Query the following two values from the STATION table:
-- The sum of all values in LAT_N rounded to a scale of decimal places.
-- The sum of all values in LONG_W rounded to a scale of decimal places
select round(sum(LAT_N), 2), round(sum(LONG_W), 2) from station;

-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
select distinct city
from station
where left(city, 1) not in ('A', 'E', 'I', 'O', 'U');


-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
select distinct city
from station
where left(city, 1) not in ('A', 'E', 'I', 'O', 'U') and right(city, 1) not in ('a', 'e', 'i', 'o', 'u');


-- Query the average population for all cities in CITY, rounded down to the nearest integer
select round(avg(population)) from city;

-- Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022. Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending order based on the count of the messages.
select sender_id, count(sender_id) as message_count
from messages 
where date_part('month', sent_date) = 8 
AND date_part('year', sent_date) = 2022
group by sender_id
order by message_count desc
limit 2;

-- Assume you have an events table on Facebook app analytics. Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.
select
  app_id,
  round(100.0 *
    sum(case when event_type = 'click' then 1 else 0 end) /
    sum(case when event_type = 'impression' then 1 else 0 end), 2) as ctr_rate
from events
where timestamp >= '2022-01-01' 
  and timestamp < '2023-01-01'
group by app_id;
