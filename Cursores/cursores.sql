USE curso
DECLARE @variavel VARCHAR(100)
DECLARE meuCursor
CURSOR local FOR SELECT NOME FROM ALUNOS
OPEN meuCursor
FETCH next FROM meuCursor INTO @variavel
WHILE(@@FETCH_STATUS = 0)
	BEGIN
		PRINT @variavel + ' FETCH STATUS -> ' + CAST(@@FETCH_STATUS AS VARCHAR(10))
		FETCH next FROM meuCursor INTO @variavel
	END
	PRINT 'FETCH STATUS -> ' + CAST(@@FETCH_STATUS AS VARCHAR(10))
	CLOSE meuCursor
	DEALLOCATE meuCursor

--cursor realizando update
USE curso
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'clifor')
	DROP TABLE clifor
GO
SELECT a.BusinessEntityID codPessoa,
	   a.FirstName nome,
	   a.LastName sobrenome,
	   cast('' as varchar(100)) nomeCompleto
	   into clifor
FROM   AdventureWorks2014.person.person a

--VERIFICANDO DADOS CARREGADOS SEM NOME COMPLETO
SELECT * FROM CLIFOR
--INÍCIO DO CURSOR (DECLARANDO VARIÁVEIS)
DECLARE @codpessoa INT,
		@nome VARCHAR(50),
		@sobrenome VARCHAR(50),
		@nomecompleto VARCHAR(100)
--DECLARANDO O CURSOR PARA PERCORRER OS REGISTROS
DECLARE cursor1 
CURSOR LOCAL FOR
	SELECT codPessoa,
		   nome,
		   sobrenome
	FROM   clifor
--ABRINDO O CURSOR
OPEN cursor1
--LENDO A PRÓXIMA LINHA
FETCH NEXT FROM cursor1 INTO @codpessoa, @nome, @sobrenome
--PERCORRENDO AS LINHAS DO CURSOR
WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE clifor
		SET nomecompleto = @nome + ' ' + @sobrenome
		WHERE codpessoa = @codpessoa
		FETCH NEXT FROM cursor1 INTO @codpessoa, @nome, @sobrenome
	END
--FECHANDO O CURSOR E DESALOCANDO OS RECURSOS
CLOSE cursor1 
DEALLOCATE cursor1
SELECT * FROM clifor