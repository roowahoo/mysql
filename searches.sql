
-- projection in mysql(project only certain columns)
select employeeNumber, email from employees;

-- show only employees in officeCode 1
select * from employees where officeCode=1;
select * from employees where jobTitle='Sales Rep'

select firstName,lastName,email from employees where officeCode=1;

-- find all where 'sales' is mentioned at the front
-- % is called a wild card
select * from employees where jobTitle like 'sales%'
-- find all where 'sales' is mentioned at the front and back
select * from employees where jobTitle like '%sales%'

-- search for more than 1 criteria, use 'and'. If either criteria, use 'or'
SELECT * FROM employees where officeCode=1 AND jobTitle='Sales Rep';

-- search for all employees NOT from officeCode=1
SELECT * FROM employees where officeCode!=1 and officeCode!=4;

SELECT * FROM employees where officeCode not in (1,4);

-- note that 'and' has priority
SELECT * FROM employees where officeCode=4 or officeCode=1 and jobTitle='Sales Rep'
-- can use ()
SELECT * FROM employees where (officeCode=4 or officeCode=1) and jobTitle='Sales Rep'


-- join
SELECT * FROM employees join offices on employees.officeCode = offices.officeCode

SELECT firstname,lastname,city,addressline1,addressline2 FROM employees 
	join offices on employees.officeCode = offices.officeCode

SELECT firstname,lastname,jobtitle,city,addressline1,addressline2 FROM employees 
	join offices on employees.officeCode = offices.officeCode
	where jobTitle='sales rep'

-- three-way join
SELECT customername, firstname,lastname, offices.city FROM customers join employees
 ON customers.salesRepEmployeeNumber=employees.employeeNumber
 join offices
 ON employees.officeCode =offices.officeCode
 WHERE customers.country='france' or customers.country='USA'
 ORDER BY customers.customername DESC
 LIMIT 3

-- PRACTICE QUESTIONS
 SELECT city,phone,country FROM offices;

 SELECT * FROM orders where comments like '%fedex%';

 SELECT customername,contactfirstname,contactlastname FROM orders join customers
ON orders.customernumber=customers.customernumber
where customers.customernumber='124'

SELECT contactfirstname,contactlastname,customername FROM customers
ORDER BY customername DESC

SELECT firstname,lastname,jobtitle,officecode FROM employees where (officecode=1 OR officecode=2 OR officecode=3) 
AND (firstname like '%son%' OR lastname like '%son%')
AND jobtitle='Sales rep'

-- above can be simplified to
SELECT firstname,lastname,jobtitle,officecode FROM employees where (officecode in (1,2,3)) 
AND (firstname like '%son%' OR lastname like '%son%')
AND jobtitle='Sales rep'

SELECT * FROM orderdetails join products
ON orderdetails.productcode=products.productcode