-- For each customer,get their avg credit limit
-- but only show the customer whose average credit limt is higher than average credit limit of all the customers


SELECT customernumber, creditlimit FROM customers
WHERE creditlimit >(SELECT AVG(creditlimit) from customers)

---Sub-Queries---
SELECT * FROM product
WHERE productcode NOT IN (SELECT productcode from orderdetails) 