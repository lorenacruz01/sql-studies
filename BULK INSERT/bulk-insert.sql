USE curso

--criando a tabela para o exemplo
DROP TABLE produtos

CREATE TABLE produtos(
	cod NVARCHAR(5),
	NOME NVARCHAR(20)
)

--Exemplo de Bulk Insert
BULK INSERT produtos
	FROM 'C:\workspace\sql-studies\BULK INSERT\carga\produto.txt'
	WITH
	(
		CODEPAGE = 'ACP',
		DATAFILETYPE = 'WIDECHAR',
		FIELDTERMINATOR = '|',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0,
		FIRE_TRIGGERS,
		FIRSTROW = 1,
		LASTROW = 10
	)

SELECT nome FROM produtos