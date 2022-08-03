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

--criando uma tabela temporária por meio de um select
SELECT * INTO #mytemptable2 FROM #mytemptable1 
--checando os dados
SELECT * FROM #mytemptable1
SELECT * FROM #mytemptable2

--atualizando tabela temporária
UPDATE #mytemptable2 SET field2 = '5.17' WHERE field1 = 'dolar'
UPDATE #mytemptable2 SET field2 = '5.29' WHERE field1 = 'euro'

--deletando registros de uma tabela temporária
DELETE FROM #mytemptable1

--dropando a tabela temporária
DROP TABLE #mytemptable1
DROP TABLE #mytemptable2

--EXEMPLO
USE CURSO
SELECT nome_mun INTO #mytemptable3 FROM cidades

SELECT * FROM #mytemptable3