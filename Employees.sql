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
-- SELECT DISTINCT title FROM titles;


/*
* DB: Employees
* Table: employees
* Question: How many unique birth dates are there?
*/
-- SELECT count(DISTINCT birth_date) FROM employees;

/*
* DB: Employees
* Table: employees
* Question: Sort employees by first name ascending and last name descending
*/
-- SELECT first_name, last_name from employees
-- order by first_name, last_name DESC;

/*
* DB: Employees
* Table: employees
* Question: Sort employees by age
*/
-- SELECT age(birth_date), * from employees
-- order by age(birth_date);

/*
* DB: Employees
* Table: employees
* Question: Sort employees who's name starts with a "k" by hire_date
*/
-- SELECT * from employees
-- where first_name like 'K%'
-- order by hire_date;

-- SELECT a.emp_no,
--        concat(a.first_name, ' ', a.last_name) as "name",
--        b.salary, b.from_date
-- from employees as a, salaries as b
-- where a.emp_no = b.emp_no;

-- SELECT a.emp_no,
--        concat(a.first_name, ' ', a.last_name) as "name",
--        b.salary, b.from_date
-- from employees as a
-- inner join salaries as b on b.emp_no = a.emp_no
-- order by a.emp_no, salary;

-- SELECT a.emp_no,
--        concat(a.first_name, ' ', a.last_name) as "name",
--        b.salary,
--        c.title,
--        c.from_date as "promoted on"
-- from employees as a
-- inner join salaries as b on a.emp_no = b.emp_no
-- inner join titles as c on c.emp_no = a.emp_no
-- and c.from_date = (b.from_date + INTERVAL '2days')
-- order by a.emp_no;
 
-- SELECT a.emp_no,
--        b.salary,
--        b.from_date,
--        c.title
-- from employees as a
-- inner join salaries as b on a.emp_no = b.emp_no
-- inner join titles as c on c.emp_no = a.emp_no and (b.from_date + interval '2days') = c.from_date
-- order by a.emp_no asc, b.from_date asc;

-- SELECT a.emp_no,
--        concat(a.first_name, ' ', a.last_name) as "name",
--        b.salary,
--        c.title,
--        c.from_date as "promoted on"
-- from employees as a
-- inner join salaries as b on a.emp_no = b.emp_no
-- inner join titles as c on c.emp_no = a.emp_no
-- and (c.from_date = (b.from_date + INTERVAL '2days') or c.from_date = b.from_date)
-- order by a.emp_no;

-- SELECT a.emp_no, concat(a.first_name, ' ', a.last_name), b.salary
-- from employees as a
-- inner join salaries as b on a.emp_no = b.emp_no
-- order by a.emp_no;

-- SELECT emp.emp_no, dep.emp_no
-- from employees as emp
-- left join dept_manager as dep on emp.emp_no = dep.emp_no
-- where dep.emp_no is not null;

-- SELECT a.emp_no,
--        concat(a.first_name, ' ', a.last_name),
--        b.salary,
--        COALESCE(c.title, 'no title change'),
--        COALESCE(c.from_date::text, '-') as "title taken on"
-- from employees as a
-- inner join salaries as b on a.emp_no = b.emp_no
-- left join titles as c on c.emp_no = a.emp_no
-- and (c.from_date = (b.from_date + INTERVAL '2days') or c.from_date = b.from_date)
-- order by a.emp_no;

/*
* DB: Employees
* Table: employees
* Question: Show me for each employee which department they work in
*/
-- SELECT emp.emp_no, 
--        concat(emp.first_name, ' ', emp.last_name, ' works in ', dep.dept_name)
-- from employees as emp
-- inner join dept_emp as d_emp on emp.emp_no = d_emp.emp_no
-- inner join departments as dep on d_emp.dept_no = dep.dept_no
-- order by emp.emp_no;

-- select dept_no, count(emp_no)
-- from dept_emp
-- group by dept_no;

-- SELECT emp_no, sum(salary), max(salary) from salaries group by emp_no order by max(salary) DESC;

/*
*  How many people were hired on any given hire date?
*  Database: Employees
*  Table: Employees
*/
-- SELECT count(e.emp_no), e.hire_date
-- FROM employees as e
-- GROUP by e.hire_date
-- order by e.hire_date;

/*
*   Show me all the employees, hired after 1991 and count the amount of positions they've had
*  Database: Employees
*/
-- SELECT e.emp_no, concat(e.first_name, ' ', e.last_name), count(t.title)
-- FROM employees as e
-- inner join titles as t on e.emp_no = t.emp_no
-- where e.hire_date > date '1991/01/01'
-- group by e.emp_no
-- order by e.emp_no;
-- 

/*
*  Show me all the employees that work in the department development and the from and to date.
*  Database: Employees
*/
-- SELECT e.emp_no, dept_emp.from_date, dept_emp.to_date
-- FROM employees as e
-- inner join dept_emp on e.emp_no = dept_emp.emp_no
-- where dept_emp.dept_no = 'd005'
-- GROUP BY e.emp_no, dept_emp.from_date, dept_emp.to_date
-- ORDER BY e.emp_no, dept_emp.to_date;

/*
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/
-- SELECT e.emp_no, concat(e.first_name, ' ', e.last_name), count(t.title)
-- from employees as e
-- join titles as t using (emp_no)
-- where EXTRACT (year from e.hire_date) > 1991
-- group by e.emp_no
-- having count(t.title) > 2
-- order by e.emp_no;

/*
*  Show me all the employees that have had more than 15 salary changes that work in the department development
*  Database: Employees
*/
-- SELECT e.emp_no, concat(e.first_name, ' ', e.last_name), count(s.salary)
-- from employees as e
-- join salaries as s using (emp_no)
-- join dept_emp as de using (emp_no)
-- where de.dept_no = 'd005'
-- group by e.emp_no
-- having count(s.salary) > 15
-- order by e.emp_no;


/*
*  Show me all the employees that have worked for multiple departments
*  Database: Employees
*/
-- SELECT e.emp_no, concat(e.first_name, ' ', e.last_name), count(de.dept_no)
-- from employees as e 
-- join dept_emp as de using (emp_no)
-- group by e.emp_no
-- having count(de.dept_no) > 1
-- order by e.emp_no;

-- select emp_no, max(from_date) 
-- from salaries
-- group by emp_no;

/*
*  Calculate the total amount of employees per department and the total using grouping sets
*  Database: Employees
*  Table: Employees
*/
-- SELECT d.dept_name, count(de.emp_no)
-- from dept_emp as de
-- join departments as d using(dept_no)
-- group by 
--     grouping sets (
--         (),
--         (d.dept_name)
--     )
-- order by d.dept_name;

/*
*  Calculate the total average salary per department and the total using grouping sets
*  Database: Employees
*  Table: Employees
*/
-- SELECT de.dept_no, avg(salary)
-- from salaries as s
-- join dept_emp as de using (emp_no)
-- group by
--     GROUPING sets (
--         (),
--         (de.dept_no)
--     )
-- order by de.dept_no;

-- SELECT 
--     * ,
--     max(salary) over ()
-- from salaries;

-- SELECT 
--     * ,
--     avg(salary) over (PARTITION by d.dept_name),
--     avg(salary) over (PARTITION by d.dept_name) - s.salary as "delta"
-- from salaries as s
-- join dept_emp as de using (emp_no)
-- join departments as d using (dept_no);

-- SELECT emp_no,
--        salary,
--        count(salary) over(
--             PARTITION by emp_no
--             order by salary
--        )
-- from salaries;

-- select DISTINCT e.emp_no,
--        e.first_name,
--        d.dept_name,
--        last_value(s.salary) over (
--             PARTITION by e.emp_no
--             order by s.from_date
--             range between unbounded PRECEDING and UNBOUNDED FOLLOWING
--        ) as "Current Salary"
-- from salaries as s
-- join employees as e using (emp_no)
-- join dept_emp as de using (emp_no)
-- join departments as d using (dept_no)
-- order by e.emp_no;

-- create or replace view last_salary_change as
-- SELECT e.emp_no,
--        max(s.from_date)
-- from salaries as s
-- join employees as e using (emp_no)
-- JOIN dept_emp as de using (emp_no)
-- join departments as d using (dept_no)
-- GROUP by e.emp_no
-- order by e.emp_no;

-- SELECT * 
-- from salaries as s
-- join last_salary_change as lsc using (emp_no)
-- where s.from_date = lsc.max
-- order by emp_no;

/*
*  Create a view "90-95" that:
*  Shows me all the employees, hired between 1990 and 1995
*  Database: Employees
*/
-- CREATE or replace VIEW "90-95" AS
-- SELECT * from employees
-- where EXTRACT (year FROM hire_date) between 1990 and 1995;

/*
*  Create a view "bigbucks" that:
*  Shows me all employees that have ever had a salary over 80000
*  Database: Employees
*/

-- CREATE or replace VIEW "bigbucks" AS
-- SELECT emp_no, e.first_name, e.last_name
-- from employees as e
-- join salaries as s using (emp_no)
-- where salary > 80000
-- group by emp_no
-- order by emp_no;

-- SELECT * from employees
-- where age(birth_date) > (
--     SELECT avg(age(birth_date)) FROM employees
-- );

-- SELECT e.emp_no, e.first_name, e.last_name, s.salary, t.title
-- from employees as e
-- join salaries as s using(emp_no)
-- join dept_emp as de USING(emp_no)
-- join titles as t using(emp_no)
-- order by emp_no;

-- select emp_no, salary, from_date, 
--     (select title from titles as t 
--      where t.emp_no=s.emp_no and 
--     (t.from_date = s.from_date + interval '2 days' or t.from_date=s.from_date))
-- from salaries as s
-- order by emp_no;

-- SELECT emp_no,
--        salary as "most recent salary",
--        from_date
-- from salaries as s
-- where from_date = (
--     SELECT max(from_date)
--     from salaries as sp
--     where sp.emp_no = s.emp_no
-- )
-- order by emp_no asc;

/*
* DB: Employees
* Table: employees
* Question: Filter employees who have emp_no 110183 as a manager
*/
-- explain analyze select * 
-- from employees as e
-- join dept_emp as de using (emp_no)
-- join dept_manager as dm using(dept_no)
-- where dm.emp_no = 110183
-- order by e.emp_no;
-- explain analyze SELECT *
-- FROM employees
-- WHERE emp_no IN (
--     SELECT emp_no
--     FROM dept_emp
--     WHERE dept_no = (
--         SELECT dept_no 
--         FROM dept_manager
--         WHERE emp_no = 110183
--     )
-- )
-- ORDER BY emp_no















