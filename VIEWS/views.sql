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

--SELECT 
SELECT * FROM v_hired_date

--ALTER
ALTER VIEW v_hired_date
AS
 SELECT P.FirstName,
		P.MiddleName,
	    P.LastName,
	    E.BusinessEntityID,
	    E.HireDate 
 FROM   HumanResources.Employee E
	    INNER JOIN Person.Person P 
		        ON E.BusinessEntityID = P.BusinessEntityID

--View com dados particionados
USE Curso
CREATE TABLE fornecedores1
(
	id_fornec INT PRIMARY KEY CHECK (id_fornec BETWEEN 1 AND 150),
	fornec CHAR(50)
)
CREATE TABLE fornecedores2
(
	id_fornec INT PRIMARY KEY CHECK (id_fornec BETWEEN 151 AND 300),
	fornec CHAR(50)
)
CREATE TABLE fornecedores3
(
	id_fornec INT PRIMARY KEY CHECK (id_fornec BETWEEN 301 AND 450),
	fornec CHAR(50)
)
CREATE TABLE fornecedores4
(
	id_fornec INT PRIMARY KEY CHECK (id_fornec BETWEEN 451 AND 600),
	fornec CHAR(50)
)

INSERT INTO fornecedores1 VALUES ('1', 'CaliforniaCorp')
INSERT INTO fornecedores1 VALUES ('5', 'BraziliaLTD')

INSERT INTO fornecedores2 VALUES ('231', 'FarEast')
INSERT INTO fornecedores2 VALUES ('280', 'NZ')

INSERT INTO fornecedores3 VALUES ('321', 'EuroGroup')
INSERT INTO fornecedores3 VALUES ('422', 'UKArchip')

INSERT INTO fornecedores4 VALUES ('475', 'India')
INSERT INTO fornecedores4 VALUES ('521', 'Afrique')

CREATE VIEW V_FORNEC_GERAL
AS
 SELECT id_fornec, fornec FROM fornecedores1
 UNION ALL
 SELECT id_fornec, fornec FROM fornecedores2
 UNION ALL
 SELECT id_fornec, fornec FROM fornecedores3
 UNION ALL
 SELECT id_fornec, fornec FROM fornecedores4

SELECT * FROM V_FORNEC_GERAL

ALTER VIEW V_FORNEC_GERAL
AS
 SELECT 'fornecedores1' as tabela, id_fornec, fornec FROM fornecedores1
 UNION ALL
 SELECT 'fornecedores2', id_fornec, fornec FROM fornecedores2
 UNION ALL
 SELECT 'fornecedores3', id_fornec, fornec FROM fornecedores3
 UNION ALL
 SELECT 'fornecedores4', id_fornec, fornec FROM fornecedores4

SELECT * FROM V_FORNEC_GERAL

