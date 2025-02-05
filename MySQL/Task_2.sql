-- Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA. 
select * from city where countrycode = 'USA' and population > 100000;

-- Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA. 
select name from city where countrycode = 'USA' and population > 120000;

-- Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN. 
select * from city where COUNTRYCODE = 'JPN';

-- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
select name from employee order by name;

--  Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than per month who have been employees for less than months. Sort your result by ascending employee_id.
select name from employee where salary > 2000 and months < 10 order by employee_id;

--Query the Name of any student in STUDENTS who scored higher than Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
select name from students where marks > 75 order by RIGHT(name, 3), id;

-- Tesla problems
SELECT * FROM parts_assembly where finish_date is null;