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