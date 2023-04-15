--Question 1

SELECT *
FROM CITY
WHERE COUNTRYCODE ='USA' AND POPULATION > 100000

--Question 2

SELECT NAME
FROM CITY
WHERE COUNTRYCODE ='USA' AND POPULATION > 120000

--Question 3

SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN'

--Question 4
city which contain Even numbers 
SELECT DISTINCT(CITY)
FROM STATION
WHERE MOD(ID,2) =0 

--Question 5

SELECT DISTINCT COUNT(CITY) 
FROM STATION

--Question 6

SELECT *
FROM CITY
WHERE ID = 1661

--Question 7
city names from station that do not start with vowels
SELECT DISTINCT CITY
FROM STATION
where city RLIKE '^[^aeiouAEIOU].*'

--Question 8
total population of cities where district is california
SELECT sum(POPULATION)
FROM CITY
WHERE DISTRICT = 'California'

--Question 9
employees earning > 2000 and been in the company less than 10months

SELECT name
FROM Employee
where salary > 2000 AND months < 10

--Question 10
--COUNT number of cities with population >100k

SELECT COUNT(COUNTRYCODE)
FROM CITY
WHERE POPULATION >100000

--Question 11
--Average population of cities where district is california

SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California'

--Question 12
--Average population for city rounded to the nearest integer

SELECT FLOOR(avg(population))
FROM CITY

--Question 13
--The greatest value of Northern Latitude from Station that is less than 137.2345 to 4dp

SELECT ROUND(MAX(LAT_N),4)
FROM STATION
WHERE LAT_N IN (SELECT LAT_N
              FROM STATION
              WHERE LAT_N < 137.2345)
--Question 14
--Difference between the maximum and minimum population from city

SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY

--Question 15

--Calculate actual salary - miscalculated average monthly salary and round up to next integer
SELECT CAST(CEIL(avg(Salary) - avg(CAST(REPLACE(Salary, '0', '')AS FLOAT)))AS FLOAT) AS Difference 
FROM EMPLOYEES

--Question 16

--Total max earnings for all employees and total no of employees who are earning maximum total

SELECT MAX(months * salary), COUNT(months * salary) 
FROM Employee 
WHERE (months * salary) = (SELECT MAX(months * salary) FROM Employee)

-- Question 17

--Sum of all values in LAT_N and LONG_W rounded to 2dp.

SELECT ROUND(SUM(LAT_N),2), ROUND(SUM(LONG_W),2)
FROM STATION

--Question 18
--Sum of LAT_N from station >38.7880 and less than 137.2345 to 4dp

SELECT ROUND(SUM(LAT_N),4)
FROM STATION
WHERE LAT_N BETWEEN 38.7880 AND 137.2345

--Question 19
--Query the LONG_W for the largest LAT_N less than 127.2345 to 4dp

SELECT ROUND(LONG_W,4)
FROM STATION
WHERE LAT_N =(SELECT MAX(LAT_N)
              FROM STATION
              WHERE LAT_N < 137.2345)
--Question 20
--Query the smallest Latitude > than 38.770 to 4dps

SELECT ROUND(MIN(LAT_N),4)
FROM STATION
WHERE LAT_N > 38.7780

--Question 21
--Query the western longitude where smallest northern latitude > 38.7780


SELECT ROUND((LONG_W),4)
FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N)
               FROM STATION
               WHERE LAT_N >38.7780)

--Question 22
--Query the manhattan distance between P1 and P2 and round to 4dp

SELECT ROUND((MAX(LAT_N) - MIN(LAT_N) + MAX(LONG_W) - MIN(LONG_W)), 4)
FROM STATION

--Question 23
--Average population for each continent from tables rounded down to the nearest integer

SELECT O.CONTINENT, FLOOR(AVG(C.POPULATION))
FROM CITY C
JOIN COUNTRY O ON
C.COUNTRYCODE = O.CODE
GROUP BY O.CONTINENT

--Question 24

SELECT
  CASE
    WHEN GRADES.GRADE >= 8 THEN STUDENTS.NAME
    WHEN GRADES.GRADE < 8 THEN NULL
  END AS NAME,
  GRADES.GRADE,
  STUDENTS.MARKS
FROM STUDENTS
  LEFT JOIN GRADES ON STUDENTS.MARKS >= MIN_MARK
  AND STUDENTS.MARKS <= MAX_MARK
ORDER BY
  GRADES.GRADE DESC, STUDENTS.NAME ASC, STUDENTS.MARKS ASC;

--Question 25

SELECT Submissions.hacker_id, Hackers.name 
FROM Hackers, Submissions, Challenges, Difficulty
WHERE Submissions.score = Difficulty.score
AND Hackers.hacker_id = Submissions.hacker_id 
AND Submissions.challenge_id = Challenges.challenge_id 
AND Challenges.difficulty_level = Difficulty.difficulty_level
GROUP BY Submissions.hacker_id, Hackers.name
HAVING count(*) > 1 
ORDER BY count(*) DESC, Submissions.hacker_id ASC;

--Question 26
--Name of Japanese cities in the city table with country code JPN

SELECT NAME
FROM CITY
WHERE COUNTRYCODE ='JPN'

--Question 27

SELECT NAME
FROM EMPLOYEE
ORDER BY NAME ASC

--Question 28

--Query the names of student who scored >75 and order output by three characters of each name

SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY SUBSTR(Name, -3),ID

--Question 29

SELECT COUNT(CITY)- COUNT(DISTINCT CITY)
FROM STATION

--Question 30
--Query the list of City names starting with vowels (a,e,i,o,u) 

SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[aeiou]'







