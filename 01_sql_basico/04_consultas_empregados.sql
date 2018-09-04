-- Consulta 0
SELECT datanasc, endereco
FROM funcionario
WHERE pnome='João' AND minicial='B' AND unome='Silva';

-- Consulta 1 - Todos os funcionários (nome e endereço) 
-- que trabalham no departamento de pesquisa
SELECT pnome, endereco
FROM funcionario, departamento
WHERE dnr=dnumero AND dnome='Pesquisa';

SELECT f.pnome, f.endereco
FROM funcionario f, departamento d
WHERE f.dnr=d.dnumero AND d.dnome='Pesquisa';

-- Consulta 2
SELECT p.projnome, p.dnum, f.unome, f.endereco, f.datanasc
FROM projeto p, departamento d, funcionario f
WHERE p.projlocal='Maua'
       AND p.dnum=dnumero 
       AND d.cpf_gerente=f.cpf;

-- Consulta 9
SELECT f.cpf
FROM funcionario f;

-- Consulta 10
SELECT f.cpf, d.dnome
FROM funcionario f, departamento d

-- Consulta C1C
SELECT *
FROM funcionario f
WHERE f.dnr=5;

-- Consulta C10A
SELECT *
FROM funcionario f, departamento d;

--  Consulta 11
SELECT f.salario
FROM funcionario f;

SELECT ALL f.salario
FROM funcionario f;

--  Consulta 11A
SELECT DISTINCT f.salario
FROM funcionario f;
