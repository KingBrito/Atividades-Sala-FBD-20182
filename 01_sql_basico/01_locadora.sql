DROP TABLE clientes;
DROP TABLE categorias;
DROP TABLE distribuidores;
DROP TABLE locacoes;

CREATE TABLE clientes(
    id serial PRIMARY KEY,
    nome varchar(50),
    cpf char(11),
    data_cadastro date,
    cidade varchar(50),
    uf char(2)
);

CREATE TABLE categorias(
    id serial PRIMARY KEY,
    nome varchar(50)
);

CREATE TABLE classes(
    id serial PRIMARY KEY,
    nome varchar(50),
    preco decimal(10,2)

);

CREATE TABLE distribuidores(
    id serial PRIMARY KEY,
    nome varchar(50)
);

CREATE TABLE filmes(
    id serial PRIMARY KEY,
    titulo varchar(30),
    id_distribuidor int,
    ano_lancamento int,
    id_categoria int,
    id_classe int,
    FOREIGN KEY (id_distribuidor) REFERENCES distribuidores(id),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id),
    FOREIGN KEY (id_classe) REFERENCES classes(id)
);

CREATE TABLE locacoes(
    id serial PRIMARY KEY,
    id_cliente int,
    id_filme int,
    dt_locacao date,
    dt_devolucao_prevista date,
    dt_devolucao date,
    valor decimal(10,2)
);