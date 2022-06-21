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