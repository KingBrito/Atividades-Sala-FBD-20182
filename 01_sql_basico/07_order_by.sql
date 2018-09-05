-- Todos funcionários ordenados pelo nome
SELECT *
FROM funcionario f
ORDER BY f.pnome

-- Todos os funcionários por salário
SELECT *
FROM funcionario f
ORDER BY f.salario

-- Todos os funcionários por salário em ordem decrescente
SELECT *
FROM funcionario f
ORDER BY f.salario DESC

-- Todos os funcionários ordenados por salário e, depois, por nome
SELECT *
FROM funcionario f
ORDER BY salario, f.pnome

-- Todos os funcionários ordenados por salário em ordem crescente
-- e, depois, por nome decrescente
SELECT *
FROM funcionario f
ORDER BY salario ASC, f.pnome DESC



