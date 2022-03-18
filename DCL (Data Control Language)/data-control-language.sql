--DATA CONTROL LANGUAGE PARTE 1: CONCEDE-GRANT

--Cria um usu�rio e d� permiss�es a ele no banco
CREATE LOGIN UsrTest WITH PASSWORD='SenhaTest'
exec master.dbo.sp_addlogin 'UsrTeste3', 'SenhaTeste3'

--outras procedures
exec sp_grantdbaccess 'UsrTest','SenhaTest'
exec sp_revokedbaccess 'UsrTest'
exec sp_droplogin 'UsrTeste3'


--inserindo o usu�rio na base de dados
CREATE USER UsrTest FOR LOGIN UsrTest WITH DEFAULT_SCHEMA = dbo

--Concedendo Acesso de Atualiza��o ao usu�rio
GRANT UPDATE ON FUNCIONARIOS TO UsrTest;
--Concedendo Acesso de Inser��o
GRANT INSERT ON FUNCIONARIOS TO UsrTest;
--Concedendo Acesso de Leitura
GRANT SELECT ON FUNCIONARIOS TO UsrTest;
--Concedendo Acesso de Exclus�o
GRANT DELETE ON FUNCIONARIOS TO UsrTest;


--CRIANDO UMA PROCEDURE PARA TESTE
CREATE PROCEDURE sp_testproc
AS
SELECT * FROM cidades

--EXECUTANDO PROCEDURE DE TESTE
EXEC sp_testproc

--Concedendo acesso para executar procedures
GRANT EXECUTE ON sp_testproc TO Usrtest

--VERIFICANDO USU�RIO LOGADO
SELECT CURRENT_USER
--ALTERANDO USU�RIO LOGADO
SETUSER 'UsrTest'