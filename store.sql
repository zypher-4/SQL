-- Number of Female customers from OR and NY
SELECT count(firstname) AS "Number of Customers" FROM customers
WHERE gender = 'F' AND (state = 'OR' OR state = 'NY');