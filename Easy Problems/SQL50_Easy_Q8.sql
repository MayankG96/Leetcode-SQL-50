#-- SQL 50 Q8

/*
1581. Customer Who Visited but Did Not Make Any Transactions

Table: Visits

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| visit_id    | int     |
| customer_id | int     |
+-------------+---------+
visit_id is the column with unique values for this table.
This table contains information about the customers who visited the mall.
 

Table: Transactions

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| transaction_id | int     |
| visit_id       | int     |
| amount         | int     |
+----------------+---------+
transaction_id is column with unique values for this table.
This table contains information about the transactions made during the visit_id.
 
Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
Return the result table sorted in any order.
*/

--Query

select v.customer_id,COUNT(v.visit_id) as count_no_trans
from Visits v
Left Join Transactions t 
on v.visit_id = t.visit_id
where t.transaction_id IS NULL
Group By v.customer_id,t.transaction_id