/*Usando o operador de adi��o para calcular o n�mero total de horas de aus�ncia do 
trabalho para cada funcion�rio, usando: adventureworks database*/

 SELECT e.Vacationhours,
		e.Sickleavehours, 
		e.VacationHours + e.SickLeaveHours AS 'Horas Ausente',
		p.firstname,
		p.lastname 
 FROM HumanResources.Employee AS e
	JOIN Person.Person AS p
	ON e.BusinessEntityID = p.BusinessEntityID
 ORDER BY 'Horas Ausente' ASC

/*Calculando a diferen�a de taxas de imposto entre o estado ou munic�pio com a 
taxa de imposto mais alta e o estado ou munic�pio com a taxa de imposto mais baixa*/
 SELECT MAX(taxrate) AS MAX, MIN(taxrate) AS MIN, MAX(taxrate) - MIN(taxrate) AS 'Tax Rate Difference'
 FROM Sales.SalesTaxRate
 WHERE StateProvinceID IS NOT NULL

/*Usando o operador aritmetico de divis�o para calcular a meta de vendas mensal 
da equipe de vendas em ciclos de 12 meses*/

 SELECT s.BusinessEntityID AS SalesPersonId,
		p.Firstname,
		p.Lastname,
		s.SalesQuota,
		s.SalesQuota / 12 AS 'Sales target per month'
 FROM	Sales.SalesPerson AS s
		JOIN HumanResources.Employee AS e
		  ON s.BusinessEntityID = e.BusinessEntityID
		JOIN Person.Person AS p
		  ON p.BusinessEntityID = e.BusinessEntityID

