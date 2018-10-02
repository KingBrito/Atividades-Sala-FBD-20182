-- 1)
SELECT l.titulo
FROM livros l
WHERE l.valor = (
	SELECT max(l.valor)
	FROM livros l
)

SELECT l.titulo
FROM livros l
WHERE l.valor >= all(
	SELECT l1.valor
	FROM livros l1
)

-- 2)
SELECT a.nome
FROM livros l, autores a, livros_autores la
WHERE l.isbn=la.isbn AND la.id_autor=a.id 
       AND l.valor = (
		SELECT min(l1.valor)
		FROM livros l1
       )
       
SELECT a.nome
FROM livros l, autores a, livros_autores la
WHERE l.isbn=la.isbn AND la.id_autor=a.id 
       AND l.valor <= all (
		SELECT l1.valor
		FROM livros l1
       )
-- 3)
SELECT a.nome
FROM livros l, livros_autores la, autores a
WHERE l.isbn=la.isbn AND la.id_autor=a.id
      AND l.valor > (
		SELECT avg(l1.valor)
		FROM livros l1
      )
ORDER BY a.nome

-- 4)
SELECT l.titulo, l.valor*l.qtd_estoque
FROM livros l
WHERE l.qtd_estoque > 1
ORDER BY l.valor DESC 


-- 5)
SELECT a.nome, count(l.isbn)
FROM  (autores a LEFT OUTER JOIN livros_autores la ON a.id=la.id_autor) LEFT OUTER JOIN livros l ON la.isbn=l.isbn
GROUP BY a.id
ORDER BY count(l.isbn) DESC


SELECT a.nome, count(la.isbn)
FROM autores a LEFT OUTER JOIN livros_autores la ON a.id=la.id_autor
GROUP BY a.id
ORDER BY count(la.isbn) DESC

-- 6)
SELECT e.nome, max(l.valor), min(l.valor)
FROM livros l, editoras e
WHERE l.id_editora=e.id
GROUP BY e.id

-- Com todas as editoras?
SELECT e.nome, max(l.valor), min(l.valor)
FROM livros l RIGHT OUTER JOIN editoras e ON l.id_editora=e.id
GROUP BY e.id

SELECT e.nome, 
       (SELECT max(l.valor) FROM livros l WHERE l.id_editora=e.id), 
       (SELECT min(l.valor) FROM livros l WHERE l.id_editora=e.id) 
FROM editoras e

-- 12)
SELECT l.titulo, e.nome, a.nome
FROM (editoras e FULL OUTER JOIN livros l ON e.id=l.id_editora)
      FULL OUTER JOIN livros_autores la ON l.isbn=la.isbn
      FULL OUTER JOIN autores  a ON la.id_autor=a.id

-- 13 a)
CREATE VIEW gasto_departamento AS
SELECT d.dnome, sum(f.salario)
FROM funcionario f RIGHT OUTER JOIN departamento d ON f.dnr=d.dnumero
GROUP BY d.dnumero
ORDER BY sum(f.salario) DESC

-- 13 b)
CREATE VIEW local_func AS
SELECT p.projlocal, count(t.fcpf)
FROM projeto p LEFT OUTER JOIN trabalha_em t ON p.projnumero=t.pnr
GROUP BY p.projlocal

-- 13 c)
CREATE VIEW func_dependente AS
SELECT f.pnome, 
       (SELECT count(*) FROM dependente d WHERE d.fcpf=f.cpf AND d.sexo='F'),
       (SELECT count(*) FROM dependente d WHERE d.fcpf=f.cpf AND d.sexo='M'),
FROM funcionario f


-- 14)

SELECT f.pnome || ' ' || f.minicial || ' ' || f.unome, 
       f1.pnome || ' ' || f1.minicial || ' ' || f1.unome,
       d.dnome,
       (SELECT count(*) FROM trabalha_em t WHERE t.fcpf=f.cpf)
FROM (funcionario f LEFT OUTER JOIN funcionario f1 ON f.cpf_supervisor=f1.cpf) 
     LEFT OUTER JOIN departamento d ON f.dnr=d.dnumero 
