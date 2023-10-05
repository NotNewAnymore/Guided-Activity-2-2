--Basic Select Statement
select * from SalesLT.Product;

--Select specific columnts
select [Name], ListPrice from SalesLT.Product;

--Aliasing
select [NAME] as 'product name', ListPrice as 'Price'
from SalesLT.Product;

--Alias a table
select * from SalesLT.Product test;	--Commonly used for joins

--Inner Join
select P.Name AS 'Product name', C.Name 'Category Name' 
from SalesLT.Product P
inner join SalesLT.ProductCategory C on P.ProductCategoryID = C.ProductCategoryID;
--Left Join
SELECT C.CustomerID, C.EmailAddress, O.SalesOrderID
FROM SalesLT.Customer C
Left Join SalesLT.SalesOrderHeader O ON C.CustomerID = O.CustomerID;

--Full outer join
Select C.CustomerID, C.FirstName, O.SalesOrderID
From SalesLT.Customer C
Full outer join SalesLt.SalesOrderHeader O ON C.CustomerID = O.CustomerID;

--Filtering Data Where Clause
select *
from SalesLT.Product WHERE ListPrice > 1000;
--Multiple Conditions
select P.Name, P.ProductID,P.ProductCategoryID , P.Color, P.ListPrice
from SalesLT.Product P WHERE ListPrice > 1000 OR Color = 'red';

--Subquery
select *
from SalesLT.Customer WHERE CustomerID IN (select CustomerID
from SalesLT.SalesOrderHeader);

--Group By
select CustomerID from SalesLT.SalesOrderHeader group by CustomerID HAVING COUNT(SalesOrderID) > 1;

-- CTE's
WITH ProductQuantity AS (
select ProductID, SUM(OrderQTY) as 'Total Ordered'
from SalesLT.SalesOrderDetail
group by ProductID
)
--select *
--from ProductQuantity;

--Select statement that makes use of the CTE
select * from SalesLT.Product P
join ProductQuantity PQ on P.ProductID = PQ.ProductID;