-- EXERCÍCIOS: TABELAS TEMPORÁRIAS
--crud com temp table
--criando uma tabela temporária local
USE curso
CREATE TABLE #mytemptable1
(
	field1 VARCHAR(80) NOT NULL,
	field2 MONEY NOT NULL
)
--inserindo valores na tabela temporária local
INSERT INTO #mytemptable1 VALUES ('dolar', 1000)
INSERT INTO #mytemptable1 VALUES ('euro', 3000)

--selecionando dados de uma tabela temporária local
SELECT * FROM #mytemptable1
SELECT field1, field2 FROM #mytemptable1