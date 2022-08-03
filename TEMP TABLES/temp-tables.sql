-- EXERC�CIOS: TABELAS TEMPOR�RIAS
--crud com temp table
--criando uma tabela tempor�ria local
USE curso
CREATE TABLE #mytemptable1
(
	field1 VARCHAR(80) NOT NULL,
	field2 MONEY NOT NULL
)
--inserindo valores na tabela tempor�ria local
INSERT INTO #mytemptable1 VALUES ('dolar', 1000)
INSERT INTO #mytemptable1 VALUES ('euro', 3000)

--selecionando dados de uma tabela tempor�ria local
SELECT * FROM #mytemptable1
SELECT field1, field2 FROM #mytemptable1

--criando uma tabela tempor�ria por meio de um select
SELECT * INTO #mytemptable2 FROM #mytemptable1 
--checando os dados
SELECT * FROM #mytemptable1
SELECT * FROM #mytemptable2

--atualizando tabela tempor�ria
UPDATE #mytemptable2 SET field2 = '5.17' WHERE field1 = 'dolar'
UPDATE #mytemptable2 SET field2 = '5.29' WHERE field1 = 'euro'

--deletando registros de uma tabela tempor�ria
DELETE FROM #mytemptable1

--dropando a tabela tempor�ria
DROP TABLE #mytemptable1
DROP TABLE #mytemptable2

--EXEMPLO
USE CURSO
SELECT nome_mun INTO #mytemptable3 FROM cidades

SELECT * FROM #mytemptable3