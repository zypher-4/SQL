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
SELECT DISTINCT emp_no, salary FROM salaries
WHERE salary > 100000;