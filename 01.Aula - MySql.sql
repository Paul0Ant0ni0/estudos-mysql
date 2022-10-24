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

DESC departamento; -- Detalhar a estrtura da Tabela
 
DROP TABLE departamentos; -- Remove a table 