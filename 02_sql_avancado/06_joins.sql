SELECT f.pnome, f.unome
FROM funcionario f, departamento d
WHERE f.dnr=d.dnumero AND d.dnome='Pesquisa'

SELECT f.pnome, f.unome
FROM funcionario f JOIN departamento d ON f.dnr=d.dnumero
WHERE d.dnome='Pesquisa'

SELECT sum(f.salario), avg(f.salario), min(f.salario), max(f.salario)
FROM funcionario f JOIN departamento d ON f.dnr=d.dnumero
WHERE d.dnome='Pesquisa'

-- Theta join
-- Todos as combinações tuplas entre departamento e projeto onde dnumero é maior que projnumero
SELECT *
FROM departamento d, projeto p
WHERE d.dnumero>p.projnumero

-- Natural Join
SELECT *
FROM dependente d NATURAL JOIN trabalha_em t

SELECT *
FROM dependente d JOIN trabalha_em t ON d.fcpf=t.fcpf


-- Inner Join
SELECT *
FROM funcionario f INNER JOIN departamento d on f.dnr=d.dnumero

-- Inner equijoin join com três tabelas
SELECT *
FROM (funcionario f JOIN trabalha_em t ON f.cpf=t.fcpf) JOIN projeto p ON t.pnr=p.projnumero

-- Left outer join
SELECT *
FROM funcionario f LEFT OUTER JOIN departamento d on f.dnr=d.dnumero

--Right outer join
SELECT *
FROM dependente d RIGHT OUTER JOIN funcionario f ON f.cpf=d.

-- Full outer join 
SELECT *
FROM funcionario f FULL OUTER JOIN departamento d on f.dnr=d.dnumero