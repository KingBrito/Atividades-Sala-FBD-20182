-- Consulta C24
SELECT f.dnr, count(*), avg(f.salario)
FROM funcionario f
GROUP BY f.dnr

-- O número do departamento, a média salario, 
-- número de funcionário dos departamentos com id <=4
SELECT f.dnr, count(*), avg(f.salario)
FROM funcionario f
WHERE f.dnr<=4
GROUP BY f.dnr

-- Consulta C25
SELECT p.projnumero, p.projnome, count(*)
FROM projeto p, trabalha_em t
WHERE p.projnumero = t.pnr
group by p.projnumero, p.projnome

-- Obter nome do projeto que tem mais de dois funcionários
SELECT p.projnumero, p.projnome, count(*)
FROM projeto p, trabalha_em t
WHERE p.projnumero = t.pnr
GROUP BY p.projnumero, p.projnomeX
HAVING count(*)>2

-- Obter nomes dos funcionários que tem mais de um dependente
SELECT f.cpf, f.pnome, count(*)
FROM funcionario f, dependente d
WHERE f.cpf=d.fcpf
GROUP BY f.cpf, f.pnome
HAVING count(*)>1

-- Consulta 27
SELECT p.projnumero, count(*)
FROM funcionario f, trabalha_em t, projeto p
WHERE f.cpf=t.fcpf AND p.projnumero=t.pnr AND f.dnr=5
GROUP BY p.projnumero


-- Lista maior e menor salário de cada departamento
SELECT f.dnr, max(f.salario), min(f.salario)
FROM funcionario f
GROUP BY f.dnr

-- Lista maior e menor salário de cada departamento
-- Ordenado pelo maior salário
SELECT f.dnr, max(f.salario), min(f.salario)
FROM funcionario f
GROUP BY f.dnr
ORDER BY max(f.salario)
