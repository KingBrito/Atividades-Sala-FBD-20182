
SELECT f.pnome
FROM funcionario f
WHERE f.cpf in (
	SELECT d.fcpf
	FROM dependente d
	WHERE f.pnome=d.nome_dependente AND d.sexo=f.sexo
)


-- Obter número de departamento e números de funcionários com salário acima de 35000
-- onde departamento tem mais de um funcionário com salário acima de 35000
SELECT f.dnr, count(*)
FROM funcionario f
WHERE f.salario>35000
GROUP BY f.dnr
HAVING count(*)>1

-- Obter número de departamento e números de funcionários com salário acima de 35000
-- onde departamento tem mais de um funcionário independente do salário
SELECT f.dnr, count(*)
FROM funcionario f
WHERE f.salario>35000 AND f.dnr in (
	SELECT f1.dnr
	FROM funcionario f1
	GROUP BY f1.dnr
	HAVING count(*)>1
)
GROUP BY f.dnr