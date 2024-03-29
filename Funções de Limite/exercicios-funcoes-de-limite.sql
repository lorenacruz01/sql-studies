--EXERC�CIOS COM FUN��ES DE LIMITE
--TOP
--RECUPERANDO 3 REGISTROS DA TABELA
USE NORTHWND
SELECT TOP 3 * FROM CUSTOMERS 

SELECT TOP 10 A.CustomerID, A.CompanyName FROM Customers A

--SELECIONANDO OS 10 CLIENTES QUE POSSUEM MAIOR VOLUME DE PEDIDO (COMPRAS)
SELECT * FROM Orders
SELECT * FROM [Order Details] 
SELECT TOP 10
	RANK() OVER (ORDER BY SUM(B.Quantity*B.UnitPrice) DESC) AS RANK,
	C.CompanyName,
	SUM(B.Quantity*B.UnitPrice) AS TOTAL FROM Customers C
INNER JOIN Orders A
ON C.CustomerID = A.CustomerID
INNER JOIN [Order Details] B
ON A.OrderID = B.OrderID GROUP BY C.CompanyName

--SELECIONANDO 10 CIDADES MAIS POPULOSAS
USE CURSO
SELECT TOP 10 populacao, nome_mun FROM cidades ORDER BY populacao DESC

SELECT TOP 10
	RANK() OVER (ORDER BY populacao DESC) AS rank_result,
	populacao,
	nome_mun
	FROM cidades