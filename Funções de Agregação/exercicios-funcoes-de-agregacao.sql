--EXERCÍCIOS DE FUNÇÃO DE AGREGAÇÃO

--conhecendo as tabelas
USE curso
SELECT * FROM cidades
SELECT * FROM senso_2013
SELECT * FROM uf
SELECT * FROM regiao_uf

--AVG: RETORNA A MÉDIA DOS VALORES DE UM GRUPO. IGNORA OS VALORES NULOS.
SELECT AVG(populacao) AS 'MEDIA POPULACIONAL' FROM cidades
--AVG POR ESTADO
SELECT uf AS ESTADO, AVG(populacao) AS 'MEDIA POPULACIONAL' FROM cidades
GROUP BY UF 
ORDER BY 2

select cod_uf from uf where estado = 'Paraná'
select cod_uf from uf where estado IN (select estado from regiao_uf where estado='Paraná')

--MIN: retorna o valor mínimo na expressão. Pode ser seguido da cláusula OVER
SELECT MIN(populacao) AS TOTAL FROM cidades
SELECT nome_mun, populacao AS TOTAL FROM cidades WHERE populacao IN (SELECT MIN(populacao) AS TOTAL FROM cidades)

--MIN por estado
SELECT uf, MIN(populacao) FROM cidades
GROUP BY uf
ORDER BY 2

--MAX: retorna o valor máximo na expressão
SELECT MAX(populacao) AS TOTAL FROM cidades
SELECT nome_mun, populacao AS TOTAL FROM cidades WHERE populacao IN (SELECT MAX(populacao) AS TOTAL FROM cidades)
--MAX por estado
SELECT uf, MAX(populacao) FROM cidades
GROUP BY uf
ORDER BY 2 DESC

--SUM: retorna a soma de todos os valores ou somente os valores DISTINCT na Expressão. Valores nulos não são ignorados.
SELECT SUM(populacao) FROM cidades
--SUM por estado
SELECT uf, SUM(populacao) FROM CIDADES
GROUP BY(uf)
ORDER BY 2

--COUNT: retorna o número de itens de um grupo
SELECT COUNT(DISTINCT uf) FROM cidades