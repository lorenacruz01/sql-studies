--Fun��es de data e hora: Alguns exemplos de formata��o de data

--Exemplos:
--Padr�o 103
--dd/mm/yyyy
SELECT CONVERT(VARCHAR(10), GETDATE(), 103);
--dd/mm
SELECT CONVERT(VARCHAR(5), GETDATE(), 103);

--Padr�o 108
--hh:mm:ss
SELECT CONVERT(VARCHAR(10), GETDATE(), 108);
--hh:mm
SELECT CONVERT(VARCHAR(5), GETDATE(), 108);

--Padr�o 100
--Mon dd yyyy
SELECT CONVERT(VARCHAR(11), GETDATE(), 100);
--Mon dd yyyy hh:mmAM/PM
SELECT CONVERT(VARCHAR(19), GETDATE(), 100);

--Padr�o 120
--yyyy-mm-dd hh:mm:ss
SELECT CONVERT(VARCHAR(19), GETDATE(), 120);

--Padr�o 1
--mm/dd/yy
SELECT CONVERT(VARCHAR(8), GETDATE(), 1);

--Extens�o
SELECT CAST(DAY(GETDATE()) AS VARCHAR(2)) + ' ' + DATENAME(MM, GETDATE()) AS [DIA E MES]

--EXEMPLO EM TABELA
USE NORTHWND

SELECT A.OrderID,
	   A.OrderDate,
	   CONVERT(VARCHAR(10), A.OrderDate, 120) AS PADRAO_120,
	   CONVERT(VARCHAR(10), A.OrderDate, 103) AS PADRAO_103,
	   CONVERT(VARCHAR(20), A.OrderDate, 100) AS PADRAO_100,
	   CONVERT(VARCHAR(8), A.OrderDate, 1) AS PADRAO_100
FROM   Orders A