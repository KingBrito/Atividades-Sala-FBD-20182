-- Média, máximo, mínimo e contagem de salários de todos os funcionarios
SELECT avg(f.salario) aS media_salario, 
       max(f.salario) as max_salario,
       min(f.salario) as min_salario,
       count(f.salario) as count_salario,       
FROM funcionario f

-- Número de funcionarios que tem supervisor
SELECT count(*)
FROM funcionario f
WHERE f.cpf_supervisor is not NULL

SELECT count(f.cpf_supervisor)
FROM funcionario f

-- Média salarial dos funcionarios do departamento 5
SELECT avg(f.salario)
FROM funcionario f, trabalha_em t, projeto p, departamento d
WHERE f.cpf=t.fcpf AND t.pnr=p.projnumero AND p.dnum=d.dnumero AND d.dnumero=5

Quantidade de funcionarios
SELECT count(*)
FROM funcionario f

Quantos funcionarios trabalham supervisionando o departamento 5
SELECT count(*)
FROM funcionario f, departamento d
WHERE f.dnr=d.dnumero AND d.dnumero=5

Contar número de valores distintos de salário
SELECT count(DISTINCT f.salario)
FROM funcionario f









