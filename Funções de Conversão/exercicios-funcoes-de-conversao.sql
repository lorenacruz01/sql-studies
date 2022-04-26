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