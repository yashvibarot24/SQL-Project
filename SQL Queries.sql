/*	Practice QUESTIONS 
	Using AdventureWorks2012 Database 
(Answers provided separately after the Questions section with best practices) */

/* A. Basic Syntax (Using 'Select', 'From', 'Where' keywords)

1. Retrieve all of the information about all of the customers in the HumanResources.Employees table
2. Retrieve only BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours information from HumanResources.Employees table
	2a. Try to display HireDate column before the JobTitle column in your results
3. Using Query 2, limit it to only those employees who have the following:
	3a. VacationHours more than 97
	3b. VacationHours more than 97 but less than 99
	3c. VacationHours more than 97 and Married
	3d. VacationHours more than 97 and NOT Married
	3e. Hired in months of January and February in 2004
	3f. Using 'BETWEEN' keyword, write the 3e query again: Hired in months of January and February in 2004
	3g. Everyone except employees hired in months of January and February in 2004
	3h. Are 'Design Engineer' or 'Tool Designer'
	3i. Are 'Design Engineer' or 'Tool Designer' or 'Engineering Manager' or 'Marketing Manager'
*/

/* B. Aliases (Using 'As')
	SQL aliases are used to give a table, or a column in a table, a temporary name.
	Aliases are often used to make column names more readable.
	An alias only exists for the duration of the query.   
	Aliases can be useful when:
		There are more than one table involved in a query
		Column names are big or not very readable (Example: Column name 'Inv_no' can be given an alias 'Invoice Number' to make the query/results more readable)

4. 	How many employees have JobTitle 'Design Engineer'? Use an alias for the count.	
		
5.  Retrieve JobTitle, Rate and BusinessEntityID for employee with BusinessentityID = 25. 
	Use tables HumanResources.Employee and HumanResources.EmployeePayHistory, provide aliases for tables and 
	join them using common column 'BusinessEntityId'.
*/

/* C. Pattern Matching using WildCards (Using _ (underscore) and %)

6. Using Query 2, Retrieve records with BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours information 
from HumanResources.Employees table where:
	6a. JobTitle has the word 'Chief' in it
	6b. JobTitle starts with the word 'Chief'
	6c. Employees were born in the 1960's
	6d. Employees were born in the month of March 

*/ 

/* D. Order By (Sorting results - using 'Desc'/'Asc' keywords)

7. Using Query 2, Retrieve records with BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours information 
from HumanResources.Employees table where results are:
	7a. Sorted by number of Vacation Hours in descending order
	7b. Sorted by Birth Date to see results starting from oldest down to youngest employees (First result should be the oldest employee)
	7c. Sorted by Hiring date to see results starting from new joinees down to veteran employees
	7d. Sorted by Job Title


-- E. GROUP BY/ HAVING/ Aggregation/ ORDER BY

 8. Retrieve SalesOrderID, SalesOrderDetailID, OrderQty, ProductID information from Sales.SalesOrderDetail where SalesOrderID = 43659
 
 9. Grouping by SalesOrderID, Show the count of suborders and total sum of order quantity for above 12 records for SalesOrderID = 43659 (Exclude ProductID column)

 10. Similar to query 8, Using table Sales.SalesOrderDetail, Retrieve the following for your Manager:
 10a. SalesOrderID, SalesOrderDetailID, OrderQty information for all records
 10b. Total order quantities for each SalesOrderID record? (HINT: Sum OrderQty by grouping records by SalesOrderID)
	(Example: For SalesOrderID 43659, Total sum of order quantity = 26
			  For SalesOrderID 43660, Total sum of order quantity = 2 and so on..)
 10c. Total order quantities (column labeled as 'Total Order Quantity') for each SalesOrderID record, sorted by 'Total Order Quantity' in descending order (HINT: Provide an alias 'Total Order Quantity' to column showing sum of QrderQty)
 10d. Total order quantities (column labeled as 'Total Order Quantity') for each SalesOrderID record with 'Number of SubOrders' (counting number of SalesOrderDetailId records) information, sorted by 'Number of SubOrders' in descending order.
 10e. Total order quantities (column labeled as 'Total Order Quantity') with 'Number of SubOrders' (counting number of SalesOrderDetailId records) information for only those SalesOrderID records which have 'Total Order Quantity' more than 400. 
 10f. Total order quantities (column labeled as 'Total Order Quantity') with 'Number of SubOrders' (counting number of SalesOrderDetailId records) information for only those SalesOrderID records which have 'Total Order Quantity' more than 400. Sort the results by 'Total Order Quantity' in ascending order. 

 */


 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ANSWERS to Practice Questions

-- A. Basic Syntax (Using 'Select', 'From', 'Where' keywords)

-- 1. Retrieve all of the information about all of the customers in the HumanResources.Employees table

-- Two ways we can do this:
SELECT * FROM HumanResources.Employee

-- OR instead of using '*', we specify all the columns in Select statement to get the same results
SELECT [BusinessEntityID]
      ,[NationalIDNumber]
      ,[LoginID]
      ,[OrganizationNode]
      ,[OrganizationLevel]
      ,[JobTitle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Gender]
      ,[HireDate]
      ,[SalariedFlag]
      ,[VacationHours]
      ,[SickLeaveHours]
      ,[CurrentFlag]
      ,[rowguid]
      ,[ModifiedDate]
FROM HumanResources.Employee


--2. Retrieve only BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours information from HumanResources.Employees table

SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee

/* 2a. Explicitly specifying the desired fields also allows us to control the order in which the fields are returned, 
so that if we wanted the HireDate to appear before the JobTitle, we could write: */

SELECT BusinessEntityID, HireDate, JobTitle, BirthDate, MaritalStatus, VacationHours 
FROM HumanResources.Employee


/* 3. Using Query 2, limit it to only those employees who have the following:
(By adding a WHERE clause to the SELECT statement, we add one (or more) conditions that must be met by the selected data. 
This will limit the number of rows that answer the query and are fetched.) */

-- 3a. VacationHours more than 97
SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
WHERE VacationHours > 97

-- 3b. VacationHours more than 97 but less than 99
SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
WHERE VacationHours > 97 and VacationHours < 99

-- 3c. VacationHours more than 97 and Married
SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
WHERE VacationHours > 97 and MaritalStatus = 'M'

--3d. VacationHours more than 97 and NOT Married
SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
WHERE VacationHours > 97 and MaritalStatus != 'M'   -- You can also use operator '<>' instead of '!=' for Not Equal to condition

--3e. Hired in months of January and February in 2004
SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
WHERE (HireDate >= '1-1-2004') AND (HireDate < '1-March-2004')    -- Notice the date formats here - SQL identifies most date formats

--3f. Using 'BETWEEN' keyword, write the 3e query again: Hired in months of January and February in 2004
SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
WHERE HireDate BETWEEN '1-Jan-2004' AND '29-Feb-2004'    -- Notice, we didn't use '1-March-2004' here - Because BETWEEN keyword includes equality on both ends and would have included '1-March-2004' date hires

--3g. Everyone except employees hired in months of January and February in 2004
SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
WHERE HireDate NOT BETWEEN '1-Jan-2004' AND '29-Feb-2004' 

--3h. Are 'Design Engineer' or 'Tool Designer'
SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
WHERE JobTitle = 'Design Engineer' or JobTitle = 'Tool Designer'

--3i. Are 'Design Engineer' or 'Tool Designer' or 'Engineering Manager' or 'Marketing Manager'
-- If there are three, four, or more values that we want to compare against, the above approach quickly becomes messy. In such cases, we can use the IN operator to test against a set of values. 
SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
WHERE JobTitle IN ('Design Engineer','Tool Designer','Engineering Manager','Marketing Manager')




-- B. Aliases (Using 'As')

-- 4. How many employees have JobTitle 'Design Engineer'? Use an alias for the count.	
Select COUNT(*) AS 'Number of Design Engineers'     -- Try it without the alias and see the output
FROM HumanResources.Employee
WHERE JobTitle = 'Design Engineer'

-- 5. Retrieve JobTitle, Rate and BusinessEntityID for employee with BusinessentityID = 25. Use tables HumanResources.Employee and HumanResources.EmployeePayHistory, provide aliases for tables and join them using common column 'BusinessEntityId'.
--Here's the query without Aliases for Table Names 

  SELECT JobTitle, Rate, HumanResources.EmployeePayHistory.BusinessEntityID 
  FROM HumanResources.Employee, HumanResources.EmployeePayHistory 
  WHERE HumanResources.Employee.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID 
  AND HumanResources.EmployeePayHistory.BusinessEntityID = 25

--Adding Aliases for Table Names:
/* Notice that assigning an alias does not actually rename the table. It just gives the table another name during the execution of a query.
In practice, we keep the table alias short and easy-to-understand. For example, e for employees, d for departments, j for jobs, and l for locations.
So why do we have to use the table alias?
The first reason to use the table alias is to save time typing a lengthy name and make your query more understandable.
The second reason to use the table alias is when you want to refer to the same table multiple times in a single query.  */

  SELECT JobTitle, Rate, EP.BusinessEntityID 
  FROM HumanResources.Employee AS E, HumanResources.EmployeePayHistory AS EP 
  WHERE E.BusinessEntityID = EP.BusinessEntityID 
  AND EP.BusinessEntityID = 25


-- C. Pattern Matching using WildCards (Using _ (underscore) and %)

-- 6. Retrieve records with BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours information from HumanResources.Employees table where:
-- 6a. JobTitle has the word 'Chief' in it

SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
WHERE JobTitle LIKE '%Chief%'

-- 6b. JobTitle start with the word 'Chief' 

SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
WHERE JobTitle LIKE 'Chief%'

-- 6c. Who were born in the 1960's. 

SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
WHERE BirthDate LIKE '196%'

-- 6d. Who were born in the month of March. 

SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
WHERE BirthDate LIKE '_____03%'   -- Used 5 underscores before 03   -- Try with '%03%' string  instead and see if it works. If not, Why?


-- D. Order By (Sorting results - using 'Desc'/'Asc' keywords)

/* 7. Using Query 2, Retrieve records with BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours information 
from HumanResources.Employees table where results are: */

-- 7a. Sorted by number of Vacation Hours in descending order
SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
ORDER BY VacationHours DESC

-- 7b. Sorted by Birth Date to see results starting from oldest down to youngest employees (First result should be the oldest employee)
SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
ORDER BY BirthDate

-- 7c. Sorted by Hiring date to see results starting from new joinees down to veteran employees
SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
ORDER BY HireDate DESC

-- 7d. Sorted by Job Title
SELECT BusinessEntityID, JobTitle, BirthDate, MaritalStatus, HireDate, VacationHours 
FROM HumanResources.Employee
ORDER BY JobTitle ASC           -- This sorts records in alphabetical order  -- Is 'ASC' keyword required here? Try without it. Ascending order is dafault order of sorting.



-- E. GROUP BY/ HAVING/ ORDER BY
/* (GROUP BY is a SELECT statement clause that divides the query result into groups of rows, 
	usually for the purpose of performing one or more aggregations on each group. 
	The SELECT statement returns one row per group.)  
   (HAVING clause specifies a search condition for a group or an aggregate.) */

  -- 8. Retrieve SalesOrderID, SalesOrderDetailID, OrderQty, ProductID information from Sales.SalesOrderDetail where SalesOrderID = 43659
  -- Notice that for SalesOrderID = 43659, there are 12 suborders (depicted by SalesOrderDetailID) with different order quantities (OrderQty) for differnt products (ProductID) in the output
  SELECT SalesOrderID, SalesOrderDetailID, OrderQty, ProductID 
  FROM Sales.SalesOrderDetail
  WHERE SalesOrderID = 43659

  -- 9. Grouping by SalesOrderID, Show the count of suborders and total sum of order quantity for above 12 records for SalesOrderID = 43659 (Exclude ProductID column)
  SELECT SalesOrderID, COUNT(SalesOrderDetailID), SUM(OrderQty)
  FROM Sales.SalesOrderDetail
  WHERE SalesOrderID = 43659
  GROUP BY SalesOrderID

  -- 10. Similar to query 8, Using table Sales.SalesOrderDetail, Retrieve the following for your Manager:
  -- 10a. SalesOrderID, SalesOrderDetailID, OrderQty information for all records
  SELECT SalesOrderID, SalesOrderDetailID, OrderQty
  FROM Sales.SalesOrderDetail

  -- 10b. Total order quantities for each SalesOrderID record? (HINT: Sum OrderQty by grouping records by SalesOrderID)
  /* Example: For SalesOrderID 43659, Total sum of order quantity = 26
			  For SalesOrderID 43660, Total sum of order quantity = 2 and so on.. */
  SELECT SalesOrderID, SUM(OrderQty) 
  FROM Sales.SalesOrderDetail
  GROUP BY SalesOrderID

 -- 10c. Total order quantities (column labeled as 'Total Order Quantity') for each SalesOrderID record, sorted by 'Total Order Quantity' in descending order (HINT: Provide an alias 'Total Order Quantity' to column showing sum of QrderQty)
  SELECT SalesOrderID, SUM(OrderQty) AS 'Total Order Quantity' 
  FROM Sales.SalesOrderDetail
  GROUP BY SalesOrderID
  ORDER BY SUM(OrderQty) DESC
  
 -- 10d. Total order quantities (column labeled as 'Total Order Quantity') for each SalesOrderID record with 'Number of SubOrders' (counting number of SalesOrderDetailId records) information, sorted by 'Number of SubOrders' in descending order.
  SELECT SalesOrderID, COUNT (SalesOrderDetailID) AS 'Number of SubOrders', SUM(OrderQty) AS 'Total Order Quantity' 
  FROM Sales.SalesOrderDetail
  GROUP BY SalesOrderID
  ORDER BY COUNT (SalesOrderDetailID) DESC

  -- 10e. Total order quantities (column labeled as 'Total Order Quantity') with 'Number of SubOrders' (counting number of SalesOrderDetailId records) information for only those SalesOrderID records which have 'Total Order Quantity' more than 400. 
  SELECT SalesOrderID, COUNT (SalesOrderDetailID) AS 'Number of SubOrders', SUM(OrderQty) AS 'Total Order Quantity' 
  FROM Sales.SalesOrderDetail
  GROUP BY SalesOrderID
  HAVING SUM(OrderQty) > 400

  -- 10f. Total order quantities (column labeled as 'Total Order Quantity') with 'Number of SubOrders' (counting number of SalesOrderDetailId records) information for only those SalesOrderID records which have 'Total Order Quantity' more than 400. Sort the results by 'Total Order Quantity' in ascending order. 
  SELECT SalesOrderID, COUNT (SalesOrderDetailID) AS 'Number of SubOrders', SUM(OrderQty) AS 'Total Order Quantity' 
  FROM Sales.SalesOrderDetail
  GROUP BY SalesOrderID
  HAVING SUM(OrderQty) > 400
  ORDER BY SUM(OrderQty) 

 