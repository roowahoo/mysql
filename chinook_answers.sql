--1.
select FirstName, LastName from Employee
WHERE Title='Sales Support Agent';
--2.
select FirstName, LastName, HireDate from Employee
where HireDate>='2002-01'AND HireDate<'2003-12';
--3.
select * from Artist
WHERE Name like '%metal%';
--4.
select * from Employee
WHERE Title like '%sales%';
--5.
select Track.Name AS 'TrackName',Genre.Name AS 'GenreName' from Genre JOIN Track
ON Track.GenreId = Genre.GenreId
WHERE Genre.Name='Easy Listening';
--6.
select Track.Name, Genre.Name   from Track join Genre
ON Genre.GenreId = Track.GenreId;
--7.
select BillingCountry,avg(Total) from Invoice
GROUP BY BillingCountry;
--8.
select BillingCountry,sum(Total) from Invoice
GROUP BY BillingCountry
HAVING sum(Total)>100;
--9.
select Customer.Country, avg(Invoice.Total) from Customer JOIN Invoice
ON Customer.CustomerId=Invoice.CustomerId
WHERE Customer.Country='Germany'
GROUP BY Invoice.CustomerId,Customer.Country
HAVING SUM(Invoice.Total)>10
--10.
select Track.Milliseconds,Genre.Name from Track JOIN Genre
ON  Track.GenreId = Genre.GenreId
WHERE Genre.Name='Jazz';









