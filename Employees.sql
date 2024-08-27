-- SELECT * from employees
-- SELECT * FROM "public"."employees"
-- select count( * ) from departments 
-- SELECT (count( * ) - 1)  as "Number of Raises" FROM salaries WHERE emp_no = 10001
-- SELECT title as "Title" FROM titles where emp_no = 10006
-- select emp_no as "Employee #", birth_date as "Birthday", first_name as "First Name" from employees;
-- SELECT * from employees;
-- SELECT concat(emp_no, ' is a ', title) as "Employee Title" FROM titles
-- SELECT emp_no, concat(first_name, ' ', last_name) as "name" FROM employees
-- SELECT avg(salary) from salaries;
-- SELECT count(emp_no) from employees;
-- SELECT max(salary) as "Max Salary" from salaries;
-- SELECT sum(salary) as "Total Amount" from salaries;
-- SELECT max(birth_date) as "Youngest Employee" FROM employees;

-- Getting the details of employee Mayumi Schueller
-- SELECT * from employees 
-- WHERE first_name = 'Mayumi' AND last_name = 'Schueller';

-- List of all the Female employees
-- SELECT * from employees
-- WHERE gender = 'F';

-- Getting the details of Georgi Facello and Bezalel Simmel
-- SELECT * from employees
-- where first_name = 'Georgi' and last_name = 'Facello' and hire_date = '1986-06-26' 
-- or first_name = 'Bezalel' and last_name = 'Simmel';

-- SELECT * from employees
-- where not gender = 'M';

-- Who over the age of 44 has an incomde of 100,000?
-- SELECT DISTINCT emp_no, salary from salaries
-- where salary > 100000;

-- SELECT * from employees
-- where emp_no in (100001, 100006, 11008);

/*
* DB: Employees
* Table: employees
* Question: Find the age of all employees who's name starts with M.
* Sample output: https://imgur.com/vXs4093
* Use EXTRACT (YEAR FROM AGE(birth_date)) we will learn about this in later parts of the course
*/
-- SELECT emp_no, first_name, EXTRACT (YEAR FROM AGE(birth_date)) as "age" FROM employees
-- where first_name like 'M%';

/*
* DB: Employees
* Table: employees
* Question: How many people's name start with A and end with R?
* Expected output: 1846
*/
-- SELECT count(*) from employees
-- where first_name like 'A%r';

-- CREATE TABLE timezones (
--     ts TIMESTAMP WITHOUT time zone,
--     tz TIMESTAMP with time zone
-- )
-- INSERT INTO timezones values (
--     timestamp without time zone '2000-01-01 10:00:00-05',
--     timestamp with time zone '2000-01-01 10:00:00-05'
-- )
-- select * from timezones;

/*
* DB: Employees
* Table: employees
* Question: Get me all the employees above 60, use the appropriate date functions
*/
-- SELECT age(birth_date), * FROM employees
-- where extract(years from age(birth_date)) > 60;

/*
* DB: Employees
* Table: employees
* Question: How many employees where hired in February?
*/
-- SELECT EXTRACT (month from hire_date), * FROM employees
-- where EXTRACT (month from hire_date) = 2;

/*
* DB: Employees
* Table: employees
* Question: How many employees were born in november?
*/
-- SELECT EXTRACT (month from birth_date), * FROM employees
-- where EXTRACT (month from birth_date) = 11;

/*
* DB: Employees
* Table: employees
* Question: Who is the oldest employee? (Use the analytical function MAX)
*/
-- SELECT age( birth_date ), * FROM employees
-- where age(birth_date) =(
--     SELECT max(age(birth_date)) from employees
-- );

-- SELECT DISTINCT salary, from_date from salaries;

/*
* DB: Employees
* Table: titles
* Question: What unique titles do we have?
*/
SELECT DISTINCT title FROM titles;


/*
* DB: Employees
* Table: employees
* Question: How many unique birth dates are there?
*/
SELECT count(DISTINCT birth_date) FROM employees;
