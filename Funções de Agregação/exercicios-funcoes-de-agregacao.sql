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

--STDEV: retorna o desvio padrão estatístico
SELECT STDEV(populacao) FROM cidades

--STDEVP: retorna o desvio padrão estístico para a população de todos os valores na expressão especificada
SELECT STDEVP(populacao) FROM cidades

--GROUPING: indica se uma expressão de coluna especificada em uma lista GROUP BY é agregada ou não
SELECT uf, SUM(populacao), GROUPING(uf) AS GRUPO FROM cidades GROUP BY uf WITH ROLLUP

--Comparando o crescimento das cidades
SELECT TOP 1 * FROM cidades
SELECT TOP 1 * FROM senso_2013

--concatenando colunas
SELECT cod_uf, cod_mun, cod_uf+cod_mun FROM cidades

--exemplo:
SELECT A.nome_mun, 
	   A.populacao AS senso_2007, 
	   B.populacao AS senso_2013
FROM cidades A
INNER JOIN senso_2013 B
	ON A.cod_uf+A.cod_mun = B.cod_mun

--crescimento populacional
SELECT A.nome_mun, 
	   A.populacao AS senso_2007, 
	   B.populacao AS senso_2013,
	   (100/CAST(a.populacao AS float))*CAST(b.populacao AS FLOAT) - 100 pct_cresc
FROM cidades A
INNER JOIN senso_2013 B
	ON A.cod_uf+A.cod_mun = B.cod_mun
--crescimento populacional por estado
SELECT A.uf, 
	   SUM(A.populacao) AS senso_2007, 
	   SUM(B.populacao) AS senso_2013,
	   (100/CAST(SUM(A.populacao) AS float))*CAST(SUM(B.populacao) AS FLOAT) - 100 pct_cresc
FROM cidades A 
INNER JOIN senso_2013 B
	ON A.cod_uf+A.cod_mun = B.cod_mun
GROUP BY A.uf

--VARP: retorna a variância estatística para o preenchimento  de todos os valores da expressão especificada
SELECT VARP(populacao) FROM cidades

SELECT uf, VARP(populacao) FROM cidades GROUP BY uf

SELECT uf, VAR(populacao) AS VAR, VARP(populacao) AS VARP FROM cidades GROUP BY uf

