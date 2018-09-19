-- Listar todos os cpfs do funcionários que trabalham em projetos em Mauá
SELECT t.fcpf
FROM trabalha_em t
WHERE t.pnr in (
	SELECT p.projnumero
	FROM projeto p
	WHERE p.projlocal='Maua'
)

SELECT t.fcpf
FROM trabalha_em t
WHERE t.pnr = ANY (
	SELECT p.projnumero
	FROM projeto p
	WHERE p.projlocal='Maua'
)

SELECT t.fcpf
FROM trabalha_em t
WHERE t.pnr = SOME (
	SELECT p.projnumero
	FROM projeto p
	WHERE p.projlocal='Maua'
)

-- Achar funcionário com menor salário (nome e o salário)
SELECT f1.pnome, f1.salario
FROM funcionario f1
WHERE f1.salario = (
	SELECT min(f.salario)
	FROM funcionario f
)

SELECT f1.pnome, f1.salario
FROM funcionario f1
WHERE f1.salario <= ALL (
	SELECT f.salario
	FROM funcionario f
)

-- Nomes dos funcionários cujo salário e maior que todos os salários dos funcionarios do departamento 5
SELECT f1.pnome, f1.salario
FROM funcionario f1
WHERE f1.salario > ALL (
	SELECT f.salario
	FROM funcionario f
	WHERE f.dnr=5
)

SELECT f1.pnome, f1.salario
FROM funcionario f1
WHERE f1.salario > (
	SELECT max(f.salario)
	FROM funcionario f
	WHERE f.dnr=5
)

-- Listar funcionários que tem salário maior ou igual que a média salarial de algum departamento
SELECT f1.pnome, f1.salario
FROM funcionario f1
WHERE f1.salario >= SOME (
	SELECT avg(f.salario)
	FROM funcionario f
	GROUP BY f.dnr
)
