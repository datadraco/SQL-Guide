/* 

SQL exercises from easy to advanced 
mostly sourced from LeetCode
usually written with MySQL syntax

*/

###############################################################################

-- EXERCISES --

###############################################################################

-- Question 1 --

-- table schema
Create table If Not Exists Views (article_id int, author_id int, viewer_id int, view_date date)
Truncate table Views
insert into Views (article_id, author_id, viewer_id, view_date) values ('1', '3', '5', '2019-08-01')
insert into Views (article_id, author_id, viewer_id, view_date) values ('1', '3', '6', '2019-08-02')
insert into Views (article_id, author_id, viewer_id, view_date) values ('2', '7', '7', '2019-08-01')
insert into Views (article_id, author_id, viewer_id, view_date) values ('2', '7', '6', '2019-08-02')
insert into Views (article_id, author_id, viewer_id, view_date) values ('4', '7', '1', '2019-07-22')
insert into Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', '2019-07-21')
insert into Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', '2019-07-21')

-- Q: return the list of unique id's belonging to authors who viewed their own article in ascending order

-- answer
select distinct author_id as id
from views 
where author_id = viewer_id
order by author_id

/*

takeaway: 

easy reminder to use distinct if we want a unique list of results that meet certain criteria

*/

DROP TABLE IF EXISTS Views;

###############################################################################

-- Question 2 -- 

-- table schema
Create table If Not Exists Visits(visit_id int, customer_id int)
Create table If Not Exists Transactions(transaction_id int, visit_id int, amount int)
Truncate table Visits
insert into Visits (visit_id, customer_id) values ('1', '23')
insert into Visits (visit_id, customer_id) values ('2', '9')
insert into Visits (visit_id, customer_id) values ('4', '30')
insert into Visits (visit_id, customer_id) values ('5', '54')
insert into Visits (visit_id, customer_id) values ('6', '96')
insert into Visits (visit_id, customer_id) values ('7', '54')
insert into Visits (visit_id, customer_id) values ('8', '54')
Truncate table Transactions
insert into Transactions (transaction_id, visit_id, amount) values ('2', '5', '310')
insert into Transactions (transaction_id, visit_id, amount) values ('3', '5', '300')
insert into Transactions (transaction_id, visit_id, amount) values ('9', '5', '200')
insert into Transactions (transaction_id, visit_id, amount) values ('12', '1', '910')
insert into Transactions (transaction_id, visit_id, amount) values ('13', '2', '970')

-- Q: interested in looking at visits that did not involve transactions, so find these cases and return the customers (id) and count of times they did this

-- answer
select customer_id, count(*) as count_no_trans
from visits as v left join transactions as t on v.visit_id = t.visit_id
where t.visit_id is null
group by customer_id

/*

takeaway: 

the join + where combo applies set theory to isolate the visits without transactions
then the group by + count() is used to sum the visits by customer
interesting to select * on just the join clause to see the results

*/

DROP TABLE IF EXISTS Visits
DROP TABLE IF EXISTS Transactions

###############################################################################

-- Question 3 --

-- table schema
Create table If Not Exists Weather (id int, recordDate date, temperature int)
Truncate table Weather
insert into Weather (id, recordDate, temperature) values ('1', '2015-01-01', '10')
insert into Weather (id, recordDate, temperature) values ('2', '2015-01-02', '25')
insert into Weather (id, recordDate, temperature) values ('3', '2015-01-03', '20')
insert into Weather (id, recordDate, temperature) values ('4', '2015-01-04', '30')

-- Q: find the id's of the days that had an increase in temperature from the previous day

-- answer 1 (cartesian product)
SELECT w1.id
FROM Weather w1, Weather w2
WHERE DATEDIFF(w1.recordDate, w2.recordDate) = 1 AND w1.temperature > w2.temperature;

-- answer 2 (using LAG and CTE)
WITH PreviousWeatherData AS
(
    SELECT 
        id,
        recordDate,
        temperature, 
        LAG(temperature, 1) OVER (ORDER BY recordDate) AS PreviousTemperature,
        LAG(recordDate, 1) OVER (ORDER BY recordDate) AS PreviousRecordDate
    FROM 
        Weather
)
SELECT id 
FROM PreviousWeatherData
WHERE temperature > PreviousTemperature
AND recordDate = DATE_ADD(PreviousRecordDate, INTERVAL 1 DAY);

/*

takeaway: 

answer 1 is more concise but a little less intuitive
answer 2 is more efficient due to the use of CTE's because mysql is built to optimize this process more efficiently
and the use of a cartesian product can generate inflated intermediate results that slow the query down

*/

























