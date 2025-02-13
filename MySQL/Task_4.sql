-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each 
SELECT 
    CASE 
        WHEN a + b <= c OR a + c <= b OR b + c <= a THEN 'Not A Triangle'
        WHEN a = b AND b = c THEN 'Equilateral'
        WHEN a = b OR a = c OR b = c THEN 'Isosceles'
        ELSE 'Scalene'
    END AS type 
FROM triangles;


-- The PADS
-- First Query: List names with the first letter of their occupation, ordered alphabetically
SELECT CONCAT(name, '(', LEFT(occupation, 1), ')') 
FROM occupations
ORDER BY name;

-- Second Query: Count occurrences of each occupation, sorted by count then alphabetically
SELECT CONCAT('There are a total of ', COUNT(occupation), ' ', LOWER(occupation), 's.') 
FROM occupations
GROUP BY occupation
ORDER BY COUNT(occupation), occupation;


-- New Companies
select 
    c.company_code, 
    c.founder, 
    COUNT(DISTINCT lm.lead_manager_code) AS total_lead_managers, 
    COUNT(DISTINCT sm.senior_manager_code) AS total_senior_managers, 
    COUNT(DISTINCT m.manager_code) AS total_managers, 
    COUNT(DISTINCT e.employee_code) AS total_employees
from Company C 
    LEFT JOIN Lead_Manager lm ON c.company_code = lm.company_code
    LEFT JOIN Senior_Manager sm ON c.company_code = sm.company_code
    LEFT JOIN Manager m ON c.company_code = m.company_code
    LEFT JOIN Employee e ON c.company_code = e.company_code
group by company_code, founder
order by c.company_code asc;


-- SQL Project Planning
SET @project_id = 0;
SET @prev_end_date = NULL;

WITH NumberedProjects AS (
    SELECT 
        Task_ID, 
        Start_Date, 
        End_Date,
        @project_id := IF(Start_Date = @prev_end_date, @project_id, @project_id + 1) AS Project_ID,
        @prev_end_date := End_Date
    FROM Projects
    ORDER BY Start_Date
)
SELECT MIN(Start_Date) AS Project_Start, 
       MAX(End_Date) AS Project_End
FROM NumberedProjects
GROUP BY Project_ID
ORDER BY DATEDIFF(MAX(End_Date), MIN(Start_Date)), MIN(Start_Date);


-- متكرره بس تمام
-- Query the average population for all cities in CITY, rounded down to the nearest integer.
select round(avg(population)) from city;


-- Ollivander's Inventory
SELECT w.id, wp.age, w.coins_needed, w.power
FROM wands w
JOIN wands_property wp ON w.code = wp.code
WHERE wp.is_evil = 0
AND w.coins_needed = (
    SELECT MIN(w1.coins_needed)
    FROM wands w1
    JOIN wands_property wp1 ON w1.code = wp1.code
    WHERE wp1.is_evil = 0
    AND wp1.age = wp.age
    AND w1.power = w.power
)
ORDER BY w.power DESC, wp.age DESC;

-- The Report
SELECT 
    CASE 
        WHEN g.Grade >= 8 THEN s.Name 
        ELSE 'NULL' 
    END AS Name, 
    g.Grade, 
    s.Marks 
FROM Students s
JOIN Grades g
    ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY 
    g.Grade DESC, 
    (CASE WHEN g.Grade >= 8 THEN s.Name END) ASC, 
    (CASE WHEN g.Grade < 8 THEN s.Marks END) ASC;

-- Symmetric Pairs
SELECT a.X, a.Y 
FROM Functions a JOIN Functions b
ON a.X = b.Y AND a.Y = b.X 
WHERE a.X < a.Y
UNION 
SELECT X, Y
FROM Functions 
WHERE X = Y 
GROUP BY X, Y 
HAVING COUNT(*) > 1
ORDER BY X, Y;

-- Weather Observation Station 15
SELECT ROUND(LONG_W, 4) 
FROM STATION
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);

-- Placements
SELECT S1.Name
FROM Students S1
JOIN Friends F ON S1.ID = F.ID
JOIN Packages P1 ON S1.ID = P1.ID
JOIN Packages P2 ON F.Friend_ID = P2.ID
WHERE P1.Salary < P2.Salary
ORDER BY P2.Salary;

-- Interviews
-- It gives wrong answer for some reason ... 