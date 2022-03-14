--aula sobre DDL
-- DDL: CRIA��O DE TABELA
CREATE TABLE Funcionario (
	matricula INT IDENTITY(1,1),
	nome CHAR(50) NOT NULL,
	sobrenome CHAR(50) NOT NULL,
	endereco CHAR(50),
	cidade CHAR(50),
	pais CHAR(25)
)

--DDL CRIANDO TABELA COM CHAVE ESTRANGEIRA
CREATE TABLE Salario(
	matricula INT PRIMARY KEY NOT NULL,
	salario DECIMAL(10,2) NOT NULL,
	FOREIGN KEY(matricula) REFERENCES Funcionario(matricula)
)

--corrigindo o erro da tabela salario: COMANDO PARA ADICIONAR CHAVE PRIM�RIA A UMA TABELA J� CRIADA

ALTER TABLE Funcionario ADD PRIMARY KEY (MATRICULA)

--DDL CRIA��O DE TABELA COM CHAVE PRIM�RIA
CREATE TABLE audit_salario(
	transacao INT IDENTITY(1,1),
	matricula INT NOT NULL,
	data_trans DATETIME NOT NULL,
	sal_antigo DECIMAL (10,2),
	sal_novo DECIMAL(10,2),
	usuario	VARCHAR(20) NOT NULL
)
--DDL: ADICIONANDO COLUNA A TABELA JA CRIADA
ALTER TABLE Funcionario ADD data_nasc DATETIME
--DDL: CRIA��O DE INDEX
select * from Funcionario
CREATE INDEX ix_func1 ON Funcionario(data_nasc)
CREATE INDEX ix_func2 ON Funcionario(cidade, pais)

--DDL: Adicionando novo campo (coluna) a uma tabela j� criada
ALTER TABLE Funcionario ADD genero CHAR(1)

--Utilizando procedure nativa
--Renomeando campo da tabela
--EXEC sp_rename 'TabelaOrigem.CampoOrigem', 'campo_origem', 'COLUMN'
EXEC sp_rename 'Funcionario.endereco', 'ender', 'COLUMN'