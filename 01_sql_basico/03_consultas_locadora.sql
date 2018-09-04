-- Recuperar todos os nomes e cpf dos clientes nascidos em Quixada
SELECT nome, cpf
FROM clientes
WHERE cidade='Quixada'

-- Recuperar data e nome de todos clientes cujo data maior que 21/08
SELECT data_cadastro, nome
FROM clientes
WHERE data_cadastro > '2018-08-21'

-- Quero recuperar o nome da categoria do filme com id=1
SELECT titulo, id_categoria, nome
FROM filmes, categorias
WHERE categorias.id=id_categoria;

-- Todas as combinações entre filmes e categorias 
-- (mostrar todoas os atributos)
SELECT *
FROM filmes, categorias;

-- Mostrar todos os titulos dos filmes 
-- juntamente com os nomes de suas classes
SELECT titulo, nome
FROM filmes, classes
WHERE id_classe = classes.id
AS (titulo_filme, nome_classe);

-- Renomeando atributos de tabela
SELECT *
FROM distribuidores as D(id, nome_distrbuidor)

-- Obter todas os id de classes distintos dos filmes
SELECT DISTINCT id_classe
FROM filmes;

-- Obter todas os id de classes distintos dos filmes
SELECT ALL id_classe
FROM filmes;