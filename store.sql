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
-- SELECT sum(totalamount) from orders
-- where totalamount > 100 and (orderdate >= '2004-06-01' and orderdate <= '2004-06-30');


/*
* DB: Store
* Table: customers
* Question: adjust the following query to display the null values as "No Address"
*/
-- SELECT COALESCE(address2, 'No Address') as "address2" FROM customers;

/*
* DB: Store
* Table: customers
* Question: Fix the following query to apply proper 3VL
*/

-- SELECT * FROM customers
-- WHERE address2 IS NOT null;

-- /*
-- * DB: Store
-- * Table: customers
-- * Question: Fix the following query to apply proper 3VL
-- */

-- SELECT coalesce(lastName, 'Empty'), * from customers
-- where (age is null);

-- Who between the ages of 30 and 50 has an income less than 50 000?
-- (include 30 and 50 in the results)
-- SELECT * from customers
-- where age between 30 and 50 and income < 50000;

-- What is the average income between the ages of 20 and 50? (Including 20 and 50)
-- SELECT avg(income) from customers
-- where age BETWEEN 20 and 50;

/*
* DB: Store
* Table: orders
* Question: How many orders were made by customer 7888, 1082, 12808, 9623
*/
-- SELECT count(*) as "Number of Orders" FROM orders
-- where customerid in (7888, 1082, 12808, 9623);

/*
* DB: Store
* Table: customers
* Question: How many people's zipcode have a 2 in it?.
* Expected output: 4211 
*/
-- SELECT count(*) from customers
-- where zip::text like '%2%';

/*
* DB: Store
* Table: customers
* Question: How many people's zipcode start with 2 with the 3rd character being a 1.
* Expected output: 109 
*/
-- SELECT count(*) from customers
-- where zip::text like '2_1%';

/*
* DB: Store
* Table: customers
* Question: Which states have phone numbers starting with 302?
* Replace null values with "No State"                                                  
* Expected output: https://imgur.com/AVe6G4c
*/
-- select COALESCE(state, 'No State') as "state" from customers
-- where phone::text like '302%';

/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/
-- SELECT * FROM orders
-- where EXTRACT(month from orderdate) = 1 and EXTRACT(year from orderdate) = 2004;
-- SELECT *
-- FROM orders
-- WHERE DATE_TRUNC('month', orderdate) = date '2004-01-01';

/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/
-- select * 
-- from customers as cust
-- inner join orders as ord on cust.customerid = ord.customerid
-- and cust.state in ('OH', 'NY', 'OR');

-- SELECT c.firstname, c.lastname, o.orderid FROM orders AS o
-- INNER JOIN customers AS c ON o.customerid = c.customerid
-- WHERE c.state IN ('NY', 'OH', 'OR')
-- ORDER BY o.orderid;


/*
* DB: Store
* Table: products
* Question: Show me the inventory for each product
*/
-- SELECT * 
-- from inventory
-- inner join products on inventory.prod_id = products.prod_id;

-- SELECT EXTRACT (year from orderdate) as "year",
--        EXTRACT (MONTH from orderdate) as "month",
--        EXTRACT (day from orderdate) as "day",
--        sum(ol.quantity)
-- from orderlines as ol
-- GROUP BY
--     rollup(
--         EXTRACT (year from orderdate),
--         EXTRACT (month from orderdate),
--         EXTRACT (day from orderdate)
--     )
-- ORDER by
--     EXTRACT (year from orderdate),
--     EXTRACT (month from orderdate),
--     EXTRACT (DAY from orderdate);


-- SELECT EXTRACT (year from orderdate) as "year",
--        EXTRACT (MONTH from orderdate) as "month",
--        EXTRACT (day from orderdate) as "day",
--        sum(ol.quantity)
-- from orderlines as ol
-- GROUP BY
--     cube(
--         EXTRACT (year from orderdate),
--         EXTRACT (month from orderdate),
--         EXTRACT (day from orderdate)
--     )
-- ORDER by
--     EXTRACT (year from orderdate),
--     EXTRACT (month from orderdate),
--     EXTRACT (DAY from orderdate);

-- SELECT prod_id,
--        price,
--        category,
--        first_value(price) over(
--             PARTITION by category order by price range between UNBOUNDED PRECEDING and UNBOUNDED FOLLOWING
--        )
-- from products;

/*
* Database: Store
* Table: products
* Create a case statement that's named "price class" where if a product is over 20 dollars you show 'expensive'
* if it's between 10 and 20 you show 'average' 
* and of is lower than or equal to 10 you show 'cheap'.
*/

-- select prod_id, title, price,
--        case
--             when price > 20 then 'expensive'
--             when price <= 10 then 'cheap'
--             else 'average'
--        end as "price class"
-- from products;
-- order by price;

/*
* DB: Store
* Table: products
* Question: Show NULL when the product is not on special (0)
*/
-- SELECT prod_id, title, price, NULLIF(special, 0) as "special"
-- FROM products;

-- SELECT title, price, (SELECT avg(price) from products) as "global average price"
-- from products;
-- SELECT prod_id, title, price, quan_in_stock
-- FROM products
-- join inventory using(prod_id);

-- SELECT title, price, (SELECT avg(price) from products) as "global average price"
-- from (
--     SELECT * from products where price < 20
-- ) as "products_sub";

/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/
-- SELECT * 
-- from orders as o
-- join customers as c using(customerid)
-- where c.state in ('OH', 'NY', 'OR')
-- order by orderid;
-- 
-- SELECT * 
-- from orders as o
-- join (
--     SELECT * from customers as c
--     where state in ('OH', 'NY', 'OR')
-- ) using (customerid)
-- order by orderid;



























 