-- AULA INICAL MYSQL 24.10
-- Comando básicos no workbanch

SHOW DATABASES; -- Lista os bancos de dados existentes no seu computador


CREATE DATABASE empresa; -- Cria um banco de dados com o nome especificar

USE empresa; -- Seleciona o banco empresa para aplicar os comandos sql 

DROP DATABASE empresa; -- Apagar o seu banco de dados (JÁ ERA TUDO)

SHOW TABLES; -- Listar todas a tabelas presentes no banco empresa

-- CRIANDO TABELAS NO BANCO DE DADOS
-- DEPARTAMENTO: idDepartamento(numerico), nome(texto), SalarioMax(numerico)

CREATE TABLE departamento(
	idDepartamento INTEGER PRIMARY KEY AUTO_INCREMENT, -- Indetificador único/chave primária e incremento
    nome VARCHAR(30) NOT NULL, -- VARCHAR(limite): TEXTO VARIAVEL, NOT NULL * obrigatório
    salarioMax DECIMAL (10.2) NOT NULL -- DECIMAL (totaldigitos, precisao)
);

DESC departamento; -- Detalhar a estrutura da Tabela
 
DROP TABLE departamento; -- Remove a table 

-- Tabela Empregado
-- Chave Estrangeira = É UMA CHAVE QUE SE REFERE A CHAVE PRIMÁRIA DE OUTRA TABELA
CREATE TABLE empregado(
	idEmpregado INTEGER PRIMARY KEY AUTO_INCREMENT, -- O banco preenche automaticamente
    nome VARCHAR(30) NOT NULL, -- Torna o nome obrigatorio
    email VARCHAR(30) UNIQUE NOT NULL, -- Email nao pode ser repetido na tabela
    dataNasc DATE NOT NULL, -- '1999-02-01'
    salario DECIMAL(10.2) NOT NULL, -- 10 = TOTAL DE DIGITOS, 2 = PRECIÇÃO DE DIGITOS (APÓS)
    idDepartamento INTEGER NOT NULL, -- Campo para guardar a chave do departamento
    FOREIGN KEY(idDepartamento) REFERENCES departamento(idDepartamento) -- Oficializa o relacionamento entre departamento - empregado 
); -- O BANCO ESTA CIENTE DESSA RELACAO ENTRE AS DUAS TABELAS

CREATE TABLE dependente(
	idDependente INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    dataNasc DATE NOT NULL,
    idResponsavel INTEGER NOT NULL, -- idEmpregado
    FOREIGN KEY(IdResponsavel) REFERENCES empregado(idEmpregado) -- Torna o banco ciente do relacionamento

);

-- Inserir Dados
-- NULL na chave primaria => o banco irá preencher automaticamente
INSERT INTO departamento VALUES (NULL, "Recursos Humanos", 5500.0); -- SEGUE A ORDEM DAS COLUNAS
INSERT INTO departamento VALUES (NULL, "Ti", 6900.00);
INSERT INTO departamento VALUES (NULL, "Suporte", 6000.0);

SELECT * FROM departamento; -- Listar os dados da tabela (departamento)

INSERT INTO empregado VALUES (NULL, "Carlos Jose", "carlos.jose@gmail.com", "1993-04-03", 3500.0, 1);
INSERT INTO empregado VALUES (NULL, "João Paulo", "joaopaulo@gmail.com", "1998-04-03", 4500.0, 2);
INSERT INTO empregado VALUES (NULL, "André Vieira", "andrevieira@gmail.com", "1978-01-03", 6500.0, 3);

SELECT * FROM empregado; -- Listar TODOS os empregados

-- NESSA FORMA, INDICA-SE QUAIS COLUNAS SERÃO PREENCHIDAS
INSERT INTO dependente(nome, dataNasc, idResponsavel) VALUES ("Carlin jr", "2010-05-01", 1);
INSERT INTO dependente(nome, dataNasc, idResponsavel) VALUES ("Maria Carla", "2015-03-02", 2);
INSERT INTO dependente(nome, dataNasc, idResponsavel) VALUES ("Pedro Antonio", "2013-02-02", 3);
INSERT INTO dependente(nome, dataNasc, idResponsavel) VALUES ("Andre Jr", "2012-02-01", 1);

SELECT * FROM dependente;

-- Atualizar registros
UPDATE empregado
SET salario = 5000.0; -- TODOS OS EMPREGADOS RECEBERIAM SALÁRIO = 5000 (PERIGO)

UPDATE empregado
SET salario = 5000.0
WHERE idEmpregado = 1; -- MUDA O SALARIO DO EMPREGADO 1

UPDATE empregado
SET nome = "João Paulo Marques", salario = 5500.0, idDepartamento = 1
WHERE idEmpregado = 2; -- MUDA NOME, SALARIO, DEPARTAMENTO DO EMPREGADO 2

UPDATE departamento
SET salarioMax = 9000
WHERE idDepartamento = 2; -- MUDA O SALARIO MAXIMO DO DEPARTAMENTO 2

UPDATE dependente
SET idResponsavel = 1
WHERE idDependente = 3; -- MUDA O RESPONSAVEL DO DEPENDENTE 3

SELECT * FROM empregado;
SELECT * FROM departamento;
SELECT * FROM dependente;

-- Deletar Registros
DELETE FROM dependente; -- LIMPAR OS REGISTROS DA TABELA

DELETE FROM dependente
WHERE idDependente = 4;

DELETE FROM departamento
WHERE idDepartamento = 3; -- NÃO FUNCIONA DE EXISTIREM EMPREGADOS ASSOCIADOS AO DEPARTAMENTO

-- QUANDO UTILIZAR O UPDATE E DELETE, LEMBRE-SE DO WHERE
-- CREATE TABLE (PK, FK); INSERT INTO, UPDATE; DELETE; SELECT;

-- DESAFIO 

-- DESAFIO 1: Criar uma tabela endereco (uf, cidade, cep, rua, numero) que esta relacionada ao empregado (1:1)
-- DESAFIO 2: Criar uma tabela projeto (nome, prazo, orcamento, descricao). N:N (Gera uma tabela relacionamento)
-- SOFT-DELETE OU DELETE LÓDIGO

CREATE TABLE endereco(
	estado CHAR(2) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INTEGER NOT NULL,
    idEndereco INTEGER NOT NULL,
    FOREIGN KEY (idEndereco) REFERENCES empregado(idEmpregado)
    
);

INSERT INTO endereco VALUES ("SP", "Sumaré", "Rua Kotakasa Nomura", 12, 1);
INSERT INTO endereco VALUES ("RJ", "Miguel Pereira", "Rua Prefeito Manoel Guilherme Barbosa", 375, 2);
INSERT INTO endereco VALUES ("MG", "Uberlândia", "Rua Sebastião Vogado.", 5, 3);

SELECT * FROM endereco;




