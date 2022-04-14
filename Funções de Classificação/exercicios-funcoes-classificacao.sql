--Exercícios de Funções de Classificação

--EXEMPLOS COM RANK
SELECT RANK() OVER(ORDER BY estado ASC) AS RANK_UF,
	estado
FROM uf

SELECT RANK() OVER(ORDER BY estado ASC) AS RANK_UF,
	regiao,
	estado
FROM regiao_uf

SELECT RANK() OVER(ORDER BY estado desc) AS RANK_UF,
	estado,
	regiao	
FROM regiao_uf

SELECT RANK() OVER(ORDER BY regiao ASC) AS RANK_UF,
	regiao,
	estado
FROM regiao_uf

--EXEMPLOS COM NTILE
SELECT NTILE(5) OVER(ORDER BY regiao ASC) AS RANK_UF,
	regiao,
	estado
FROM regiao_uf