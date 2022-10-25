-- Banco de dados de uma loja 
-- Entidades, Vendedor, Produto, Endereco
-- Vendedor - Endereco (1:1), Vendedor - Produto (1:N)

CREATE DATABASE loja;

USE loja;

CREATE TABLE vendedor(
	idVendedor INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    sobrome VARCHAR(30) NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
    dataNasc DATE NOT NULL
);

CREATE TABLE produto(
	idProduto INTEGER PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    desconto DECIMAL(4, 2) NOT NULL DEFAULT(0), -- 99.99 %; CASO NÃO FORNEÇA VALOR PARA DESCONTO, ELE IRÁ UTILIZAR O 0, 99.99%
    descontoAte DATE,
    quantidade INTEGER NOT NULL,
    idVendedor INTEGER NOT NULL,
    FOREIGN KEY(idVendedor) REFERENCES vendedor(idVendedor)
);

-- TABELA ENDERECO: id, cidade, uf, bairro, numero, complemento, idVendedor

CREATE TABLE endereco(
	idEndereco INTEGER PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(30) NOT NULL,
    estado CHAR(2) NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero INTEGER UNIQUE NOT NULL,
    complemento VARCHAR(30),
    idVendedor INTEGER NOT NULL,
    FOREIGN KEY(idVendedor) REFERENCES vendedor(idVendedor)
);
