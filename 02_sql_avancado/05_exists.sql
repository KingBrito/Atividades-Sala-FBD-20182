-- Listar todos os nomes de funcionários cujo existe dependente com mesmo nome e sexo
SELECT f.pnome, f.unome
FROM funcionario f
WHERE EXISTS (
	SELECT *
	FROM dependente d
	WHERE d.fcpf = f.cpf AND 
	      f.pnome=d.nome_dependente AND
	      f.sexo=d.sexo
)

-- -Listar todos os funcionários que tem dependente
-- -Listar todos funcionários que estão da lista de funcionários dos dependentes

SELECT f.pnome
FROM funcionario f
WHERE f.cpf in (
	SELECT d.fcpf
	FROM dependente d
)

-- - Listar todos os funcionários cujo existe dependente
SELECT f.pnome
FROM funcionario f
WHERE EXISTS(
	SELECT *
	FROM dependente d
	WHERE d.fcpf=f.cpf
)

-- Listar funcionário que não possuem dependentes
SELECT f.pnome
FROM funcionario f
WHERE NOT EXISTS(
	SELECT *
	FROM dependente d
	WHERE d.fcpf=f.cpf
)

SELECT f.pnome
FROM funcionario f
WHERE f.cpf NOT IN (
	SELECT d.fcpf
	FROM dependente d
)