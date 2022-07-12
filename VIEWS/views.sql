--VIEWS

--EXEMPLO
--CRIANDO A VIEW
USE ADVENTUREWORKS2014
CREATE VIEW v_hired_date
AS
 SELECT P.FirstName,
	    P.LastName,
	    E.BusinessEntityID,
	    E.HireDate 
 FROM   HumanResources.Employee E
	    INNER JOIN Person.Person P 
		        ON E.BusinessEntityID = P.BusinessEntityID