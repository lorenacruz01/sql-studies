--EXPRESSÕES CASE

--Exemplo Simples
USE curso
DECLARE @data DATETIME
SET @data = GetDate()-1
SELECT @data AS DATE,
	   CASE
		 WHEN @data = GetDate() THEN 'HOJE'
		 WHEN @data < GetDate() THEN 'ONTEM'
		 WHEN @data > GetDate() THEN 'AMANHÃ'
	   END dia
	

--EXEMPLO 2:
USE AdventureWorks2014
SELECT ProductNumber,
	   ProductLine,
	   Categoria = CASE ProductLine
					 WHEN 'R' THEN 'ROAD'
					 WHEN 'M' THEN 'MOUNTAIN'
					 WHEN 'T' THEN 'TOURING'
					 WHEN 'S' THEN 'OTHER SALE ITEMS'
					 ELSE 'NOT FOR SALE' 
				   END,
	  Name
FROM  Production.Product
ORDER BY ProductNumber

--escrita alternativa
USE AdventureWorks2014
SELECT ProductNumber,
	   ProductLine,
	   CASE
		WHEN ProductLine = 'R' THEN 'ROAD'
		WHEN ProductLine = 'M' THEN 'MOUNTAIN'
		WHEN ProductLine = 'T' THEN 'TOURING'
		WHEN ProductLine = 'S' THEN 'OTHER SALE ITEMS'
		ELSE 'NOT FOR SALE' 
	  END Category,
	  Name
FROM  Production.Product
ORDER BY ProductNumber


--EXEMPLO
USE AdventureWorks2014
SELECT ProductNumber,
	   Name,
	   ListPrice,
	   CASE
		  WHEN ListPrice = 0 THEN 'Não está a venda'
		  WHEN ListPrice < 50 THEN 'Abaixo de $50'
		  WHEN ListPrice >= 50 
			AND ListPrice < 250 THEN 'Abaixo de $250'
		  WHEN ListPrice >= 250 
		    AND ListPrice < 1000 THEN 'Abaixo de $1000'
		  ELSE 'Acima de $1000'
	   END PriceRange,
       'Produtos' AS Categoria
FROM   Production.Product
ORDER  BY ProductNumber

--Utilizando o case para ordenar uma consulta
SELECT BusinessEntityId,
	   SalariedFlag 
FROM   HumanResources.Employee
ORDER  BY CASE WHEN SalariedFlag = 1 THEN BusinessEntityID END DESC,
		  CASE WHEN SalariedFlag = 0 THEN BusinessEntityID END ASC

--UPDATE COM CASE
BEGIN TRANSACTION
	UPDATE HumanResources.Employee
	SET VacationHours = (CASE WHEN ((VacationHours - 10.00) < 0) 
	THEN VacationHours + 40
	ELSE (VacationHours + 20) END)

	output deleted.BusinessEntityID,
		   deleted.VacationHours as 'antes',
		   inserted.VacationHours as 'depois'
	WHERE SalariedFlag = 0;

ROLLBACK TRANSACTION