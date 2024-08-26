-- Number of Female customers from OR and NY
-- select count(firstname) as "Number of Customers" from customers
-- where gender = 'F' and (state = 'OR' or state = 'NY');

-- How many customers aren't 55?
-- SELECT count(age) as "Number of Customers who aren't 55" from customers
-- where not age = 55;

-- How many female customers do we have from the state of Oregon (OR)?
-- select count(firstname) as "Number of Female Customers from OR" from customers
-- where state = 'OR' and gender = 'F';

-- Who over the age of 44 has an income of 100 000 or more? (excluding 44)
-- select firstname, lastname, income, age from customers
-- where age > 44 and income >= 100000;

-- Who between the ages of 30 and 50 has an income less than 50 000?
-- SELECT firstname, lastname from customers
-- where 30 < age and age < 50 and income < 50000;
-- 
-- What is the average income between the ages of 20 and 50? (Excluding 20 and 50)
-- select avg(income) from customers
-- where 20 < age and age < 50;

/*
* DB: Store
* Table: Customers
* Question: 
* Select people either under 30 or over 50 with an income above 50000
* Include people that are 50
* that are from either Japan or Australia
*/
-- select * from customers
-- where income > 5000 and (age < 30 or age >= 50) 
-- and (country = 'Japan' or country = 'Australia');

/*
* DB: Store
* Table: Orders
* Question: 
* What was our total sales in June of 2004 for orders over 100 dollars?
*/
SELECT sum(totalamount) FROM orders
WHERE totalamount > 100 AND (orderdate >= '2004-06-01' AND orderdate <= '2004-06-30');

