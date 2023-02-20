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

--******Exemplo 2: cursor realizando update
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

--******exemplo 3: cursor realizando insert

USE curso
--criando a tabela
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'cli_nome' )
	DROP TABLE cli_nome
GO
CREATE TABLE cli_nome (
	cod_cliente int not null,
	nome_completo varchar(100) not null
)
--SELECT * FROM cli_nome

--declarando as variaveis que serão utilizada
DECLARE @codcliente INT,
	    @nome VARCHAR(50),
		@sobrenome VARCHAR(50),
		@nomecompleto VARCHAR(100)

--declarando o cursor para percorrer o conjunto de dados
DECLARE cursor2
CURSOR LOCAL FOR
	SELECT  EmployeeID,
			FirstName,
			LastName
	FROM	NORTHWND.dbo.Employees
--abrindo o cursor
OPEN cursor2
--lendo a prox linha
FETCH NEXT FROM cursor2 INTO @codcliente, @nome, @sobrenome
--percorrendo as linhas do cursor
WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @nomecompleto = @nome + ' ' + @sobrenome
		INSERT INTO cli_nome VALUES (@codcliente, @nomecompleto)
		FETCH NEXT FROM cursor2 INTO @codcliente, @nome, @sobrenome
	END
--fechando o cursor para leitura
CLOSE cursor2
--finalizando o cursor
DEALLOCATE cursor2

SELECT * FROM cli_nome