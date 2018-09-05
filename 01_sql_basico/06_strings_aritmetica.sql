-- Todos os funcionários que tem endereço em Curitiba
SELECT *
FROM funcionario f
WHERE endereco like '%Curitiba%'

-- Todos os funcionários que tem endereço no estado de São Paulo
SELECT *
FROM funcionario f
WHERE endereco like '%SP'

-- Nome completo dos funcionários
SELECT (f.pnome || ' ' || f.minicial || ' ' || f.unome) as nome
FROM funcionario f

-- Todos os salários por mês com acréscimo de 10%
SELECT (f.salario/12)*1.1
FROM funcionario f
