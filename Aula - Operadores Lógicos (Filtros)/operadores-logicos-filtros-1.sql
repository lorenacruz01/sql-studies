--usando: NORTHWIND database
--Uso do operador WHERE
USE NORTHWND
	SELECT * FROM Customers
	WHERE Country = 'Mexico'
	
--Uso do operador AND 
USE AdventureWorks2014
	 SELECT firstname, 
			lastname,
			e.BusinessEntityID,
			LoginID,
			JobTitle,
			VacationHours 
	FROM	HumanResources.Employee AS e
		INNER JOIN Person.Person AS p
		ON e.BusinessEntityID = p.BusinessEntityID
		WHERE e.JobTitle = 'Marketing Assistant'
		AND VacationHours > 41

--Uso do operador BETWEEN
USE AdventureWorks2014
	 SELECT p.firstname,
			p.lastname,
	 FROM Person.Person AS p
	  