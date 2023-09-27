#-- SQL 50 Q9

/*
197. Rising Temperature

Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
This table contains information about the temperature on a certain day.
 

Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
Return the result table in any order.
*/

---Query
select id from
(select id, recordDate, lag(temperature) OVER (ORDER BY recordDate) as prev_temp, 
lag(recordDate) OVER (ORDER BY recordDate) as prev_date, temperature
from Weather) as subquery
where temperature > prev_temp and DATEDIFF(recordDate,prev_date) = 1