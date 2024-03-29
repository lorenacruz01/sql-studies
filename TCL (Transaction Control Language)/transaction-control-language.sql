--TCL (TRANSACTION CONTROL LANGUAGE)


--CRIANDO UMA TABELA PARA OS TESTES
CREATE TABLE CADASTRO(
	NOME VARCHAR(50) NOT NULL,
	DOCTOR VARCHAR(50) NOT NULL,
)
--INICIA TRANSA��O
BEGIN TRANSACTION

--INSERE REGISTROS
INSERT INTO CADASTRO VALUES ('ANDRE', '123123123')
INSERT INTO CADASTRO VALUES ('JOAO', '124124124')
INSERT INTO CADASTRO VALUES ('PEDRO', '125125125')

--SELECT DOS REGISTROS INSERIDOS
SELECT * FROM CADASTRO

--RETORNA A TABELA AO ESTADO ANTERIOR DO BEGIN TRANSACTION
ROLLBACK

--EFETIVA AS INFORMA��ES NA TABELA DO BANCO DE DADOS
COMMIT TRANSACTION


--Removendo todas as linhas para um novo teste
TRUNCATE TABLE CADASTRO
SELECT * FROM CADASTRO

--EXEMPLO CRIANDO UM PONTO DE RECUPERA��O


BEGIN TRANSACTION
--INSERINDO UM REGISTRO
INSERT INTO CADASTRO VALUES ('ANDR�', '12341234')
--CRIANDO PONTO DE RECUPERA��O
SAVE TRANSACTION A1
--INSERINDO OUTRO REGISTRO
INSERT INTO CADASTRO VALUES ('PEDRO', '14781478')
--CRIANDO UM OUTRO PONTO DE RECUPERA��O
SAVE TRANSACTION A2
--INSERINDO UM NOVO REGISTRO
INSERT INTO CADASTRO VALUES ('JO�O', '15961596')
--CRIANDO UM NOVO PONTO DE RESTAURA��O
SAVE TRANSACTION A3

--VERIFICANDO REGISTRO
SELECT * FROM CADASTRO

--RESTAURANDO A TABELA AT� O PONTO A2
ROLLBACK TRANSACTION A2
--VERIFICANDO REGISTRO
SELECT * FROM CADASTRO

--RESTAURANDO A TABELA PARA O ESTADO ANTERIOR AO BEGIN TRANSACTION
ROLLBACK

--EFETIVANDO AS INFORMA��ES DA TABELA
COMMIT TRANSACTION