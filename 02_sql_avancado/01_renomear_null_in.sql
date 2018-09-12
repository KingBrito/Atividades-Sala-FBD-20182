SELECT g.pnome AS nome_gerente, f.pnome AS nome_funcionario
FROM funcionario AS f, funcionario AS g
WHERE f.cpf_supervisor = g.cpf

SELECT *
FROM funcionario f
WHERE f.cpf_supervisor is NULL

SELECT *
FROM funcionario f
WHERE f.cpf_supervisor is NOT NULL

Todos os funcionarios que pertecem ao departamento 1 ou 3
SELECT *
FROM funcionario f
WHERE f.dnr in (1,4)
