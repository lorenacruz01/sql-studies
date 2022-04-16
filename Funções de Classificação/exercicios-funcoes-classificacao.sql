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

--EXEMPLOS COM DENSE_RANK:
SELECT DENSE_RANK() OVER(ORDER BY regiao ASC) AS DENSE_RANK_UF,
	regiao,
	estado
FROM regiao_uf

SELECT DENSE_RANK() OVER(ORDER BY estado ASC) AS DENSE_RANK_UF,
	estado
FROM uf

--EXEMPLOS COM ROW_NUMBER
SELECT ROW_NUMBER() OVER(ORDER BY estado ASC) AS ROW_NUMBER_UF,
	 estado
FROM uf

SELECT ROW_NUMBER() OVER(ORDER BY regiao ASC) AS ROW_NUMBER_UF,
	 estado,
	 regiao
FROM regiao_uf


--EXEMPLO
CREATE table campeonato (
	nome_time VARCHAR(20) NOT NULL,
	time_pontos INT NOT NULL
)

INSERT INTO campeonato VALUES ('Corinthians', 53);
INSERT INTO campeonato VALUES ('Grêmio', 43);
INSERT INTO campeonato VALUES ('Santos', 41);
INSERT INTO campeonato VALUES ('Palmeiras', 40);
INSERT INTO campeonato VALUES ('Flamengo', 38);
INSERT INTO campeonato VALUES ('Cruzeiro', 37);
INSERT INTO campeonato VALUES ('Botafogo', 37);
INSERT INTO campeonato VALUES ('Atlético-PR', 34)
INSERT INTO campeonato VALUES ('Vasco', 31)
INSERT INTO campeonato VALUES ('Atlético-MG', 31)
INSERT INTO campeonato VALUES ('Fluminense', 31)
INSERT INTO campeonato VALUES ('Sport', 29)
INSERT INTO campeonato VALUES ('Avai', 29)
INSERT INTO campeonato VALUES ('Chapecoense', 28)
INSERT INTO campeonato VALUES ('Ponte Preta', 28)
INSERT INTO campeonato VALUES ('Bahia', 27)
INSERT INTO campeonato VALUES ('São Paulo', 27)
INSERT INTO campeonato VALUES ('Coritiba', 27)
INSERT INTO campeonato VALUES ('Vitória', 26)
INSERT INTO campeonato VALUES ('Atlético-GO', 22)

SELECT * FROM campeonato

--CLASSIFICAÇÃO DO CAMPEONATO
SELECT RANK() OVER(ORDER BY time_pontos DESC) AS 'classific.',
	nome_time,
	time_pontos
FROM campeonato









