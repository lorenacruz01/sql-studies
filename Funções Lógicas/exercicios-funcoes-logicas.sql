--EXERCÍCIOS COM FUNÇÕES LÓGICAS

--CHOOSE:
--EXEMPLO 1
--SELECT CHOOSE (X -> INDICA O QUE SERÁ ESCOLHIDO, 'Gerente' = 1, 'Diretor' = 2, 'Desenvolvedor' = 3, 'Tester' = 4) AS ESCOLHIDO
SELECT CHOOSE (1, 'Gerente', 'Diretor', 'Desenvolvedor', 'Tester') AS ESCOLHIDO
--EXEMPLO 2
USE AdventureWorks2014
SELECT ProductCategoryID,
	CHOOSE (ProductCategoryID, 'A', 'B', 'C', 'D', 'E') AS EXPRESSAO
FROM Production.ProductCategory

SELECT * FROM Production.ProductCategory

--EXEMPLO 3
SELECT JobTitle, 
	   HireDate,
	   MONTH(HireDate) AS 'MÊS',
	   CHOOSE(MONTH(HireDate), 'Winter', 'Winter', 'Spring', 'Spring', 'Spring', 'Summer', 'Summer', 'Summer', 'Autumn', 'Autumn', 'Autumn', 'Winter')
FROM HumanResources.Employee
WHERE YEAR(HireDate) > 2005
ORDER BY YEAR(HireDate);


--IIF:
DECLARE @a INT = 45, @b INT = 40;
SELECT IIF(@a > @b, 'TRUE', 'FALSE') AS RESULTADO

DECLARE @C INT = 45, @D INT = 60;
SELECT IIF(@C > @D, @C, @D) AS MAIOR

DECLARE @E INT = NULL, @F INT = NULL;
SELECT IIF(@E > @F, @E, @F) AS RESULTADO