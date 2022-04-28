--EXERCÍCIOS COM FUNÇÕES DE CONVERSÃO

--CAST
DECLARE @VALOR DECIMAL(5,2);
SET @VALOR = 193.57;
SELECT CAST(@VALOR AS varbinary(20));
SELECT CAST(CAST(@VALOR AS varbinary(20)) AS DECIMAL(5,2));

--CONVERT
SELECT CONVERT(varbinary(20), @VALOR);
SELECT CONVERT(DECIMAL(5,2), CONVERT(varbinary(20), @VALOR))


--EXEMPLO
USE AdventureWorks2014
SELECT Substring(NAME,1,30) AS ProductName,
ListPrice
FROM Production.Product
WHERE CAST(ListPrice AS INT) LIKE '3%'

USE AdventureWorks2014
SELECT Substring(NAME,1,30) AS ProductName,
listprice
FROM Production.Product
WHERE CONVERT(INT, ListPrice) LIKE '3%'

--FORMATANDO CAST E ARREDONDANDO
--USANDO CAST COM OPERADORES ARITMÉTICOS
SELECT CAST(ROUND(SalesYTD/CommissionPct,0) AS INT) AS FORMATADO,
	   (SalesYTD/CommissionPct) 'NÃO FORMATADO'
	   FROM Sales.SalesPerson
	   WHERE CommissionPct <> 0

--USANDO O CAST PARA CONCATENAR
SELECT 'A lista de preço é ' + CAST(ListPrice AS varchar(12)) AS ListPrice 
	   FROM Production.Product
	   WHERE ListPrice BETWEEN 350.00 AND 400.00

--USANDO O CAST PARA CONCATENAR (COM DISTINCT)
SELECT DISTINCT 'A lista de preço é ' + CAST(ListPrice AS varchar(12)) AS ListPrice 
	   FROM Production.Product
	   WHERE ListPrice BETWEEN 350.00 AND 400.00

--USANDO O CAST PARA PRODUZIR O TEXTO MAIS LEGÍVEL
SELECT DISTINCT P.Name,
	(CAST(P.Name AS CHAR(12))) AS NOME_ABREV,
	S.UnitPrice AS PRICE
	FROM Sales.SalesOrderDetail AS S
		JOIN Production.Product AS P
		ON S.ProductID = P.ProductID
	WHERE P.Name LIKE 'Long-Sleeve Logo Jersey, M'

--USANDO CAST COM A CLÁUSULA LIKE
SELECT P.FirstName,
	   P.LastName,
	   S.SalesYTD,
	   S.BusinessEntityID,
	   CAST(CAST(S.SalesYTD AS INT) AS CHAR(20)),
	   CAST(S.SalesYTD AS CHAR(20))
FROM Person.Person AS P
	   JOIN Sales.SalesPerson AS S
	   ON P.BusinessEntityID = S.BusinessEntityID
	   WHERE CAST(CAST(S.SalesYTD AS INT) AS CHAR(20)) LIKE '2%'