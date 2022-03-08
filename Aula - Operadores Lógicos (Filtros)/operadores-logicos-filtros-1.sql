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
			ep.Rate
	 FROM Person.Person p
	 JOIN HumanResources.EmployeePayHistory ep
	 ON p.BusinessEntityID = ep.BusinessEntityID
		WHERE ep.Rate BETWEEN 27 AND 30
	ORDER BY ep.Rate

--Uso do operador IN
USE AdventureWorks2014
	 SELECT p.FirstName,
			p.Lastname,
			sp.salesquota
	 FROM	Person.Person AS p
	 JOIN	Sales.SalesPerson AS sp
	 ON p.BusinessEntityID = sp.BusinessEntityID
	 WHERE P.BusinessEntityID IN (SELECT BusinessEntityID FROM Sales.SalesPerson WHERE SalesQuota > 250000)

--Uso do operador NOT IN
USE AdventureWorks2014
	 SELECT p.FirstName,
			p.Lastname,
			sp.salesquota
	 FROM	Person.Person AS p
	 JOIN	Sales.SalesPerson AS sp
	 ON p.BusinessEntityID = sp.BusinessEntityID
	 WHERE P.BusinessEntityID NOT IN (SELECT BusinessEntityID FROM Sales.SalesPerson WHERE SalesQuota > 250000)

--Uso do operador Like: localizar valores que contenham "or" em qualquer lugar
USE NORTHWND
	SELECT * FROM Customers
		WHERE ContactName LIKE '%or%'

--Uso do operador Like: encontrar quaisquer valores que contenham "r" na segunda posição
	SELECT * FROM Customers
		WHERE ContactName LIKE '_r%'

--Uso do operador Like: localizar valores que começam com 'a' e que possuem pelo menos 3 caracteres de comprimento
	SELECT * FROM Customers
		WHERE ContactName LIKE 'a_%_%'

--Ùso do operador like: localizar valores que começam com 'a' e que terminam com 'o'
	SELECT * FROM Customers
		WHERE ContactName LIKE 'a%o'