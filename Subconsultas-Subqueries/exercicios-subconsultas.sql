--Exemplos com Subconsultas

--PREPARANDO O BANCO PARA OS TESTES
--CRIANDO TABELA DE CLIENTES
CREATE TABLE clientes(
	cod_cli NCHAR(5) PRIMARY KEY,
	cli_come NVARCHAR(40) NOT NULL
)

--INSERINDO DADOS NA TABELA A PARTIR DA TABELA CUSTOMERS DO NORTHWIND
INSERT INTO clientes 
SELECT CustomerID, CompanyName FROM NORTHWND.dbo.Customers

--CRIANDO TABELA DE PEDIDOS
CREATE TABLE pedidos(
	num_ped INT PRIMARY KEY,
	cod_cliente NCHAR(5) NOT NULL,
	data DATETIME NOT NULL,
	TOTAL DECIMAL(10,2)
)

--INSERINDO DADOS NA TABELA PEDIDOS A PARTIR DA TABELA ORDERS DO NORTHWIND
INSERT INTO pedidos (num_ped, cod_cliente, data) 
SELECT OrderID, CustomerID, OrderDate FROM NORTHWND.dbo.Orders

--ATUALIZANDO CAMPO TOTAL DA TABELA PEDIDOS COM UPDATE EM SUBSELECT
UPDATE pedidos SET total = (SELECT SUM(t2.UnitPrice*t2.Quantity) FROM NORTHWND.dbo.[Order Details] t2 
WHERE num_ped = t2.OrderID)

select * from pedidos
exec sp_rename 'Clientes.cli_come', 'cli_nome', 'COLUMN'
--MOSTRANDO OS CLIENTES QUE FIZERAM COMPRA ANTES DO DIA ATUAL

SELECT cod_cli, 
	   cli_nome 
FROM clientes 
WHERE cod_cli IN (SELECT cod_cliente 
	FROM pedidos WHERE data < GETDATE())

--MOSTRANDO OS CLIENTES QUE NÃO FIZERAM COMPRA ANTES DO DIA ATUAL

SELECT cod_cli, 
	   cli_nome 
FROM clientes 
WHERE cod_cli NOT IN (SELECT cod_cliente 
	FROM pedidos WHERE data < GETDATE())