--aula sobre DDL
-- DDL: CRIAÇÃO DE TABELA
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

--corrigindo o erro da tabela salario: COMANDO PARA ADICIONAR CHAVE PRIMÁRIA A UMA TABELA JÁ CRIADA

ALTER TABLE Funcionario ADD PRIMARY KEY (MATRICULA)
