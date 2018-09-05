-- Todos o números de projeto cujo tem funcionário com último nome = silva.
SELECT p.projnumero
FROM funcionario f, trabalha_em t, projeto p
WHERE f.cpf=t.fcpf AND t.pnr=p.projnumero AND f.unome='Silva'

-- Todos os números de projeto cujo tem gerente com último nome = silva
SELECT p.projnumero
FROM funcionario f, departamento d, projeto p
WHERE f.cpf=d.cpf_gerente AND d.dnumero=p.dnum AND f.unome = 'Silva'

-- Todos os números de projeto cujo tem gerente ou funcionário com último nome = silva
(SELECT p.projnumero
FROM funcionario f, trabalha_em t, projeto p
WHERE f.cpf=t.fcpf AND t.pnr=p.projnumero AND f.unome='Silva')
UNION
(SELECT p.projnumero
FROM funcionario f, departamento d, projeto p
WHERE f.cpf=d.cpf_gerente AND d.dnumero=p.dnum AND f.unome = 'Silva')

-- Os nomes de todos os funcionários e todos os dependentes
(SELECT f.pnome
FROM funcionario f)
UNION ALL
(SELECT d.nome_dependente
FROM dependente d)

-- Todos os nomes de funcionários que não são nomes de dependentes
(SELECT f.pnome
FROM funcionario f)
EXCEPT
(SELECT d.nome_dependente
FROM dependente d)

-- Todos os nomes em comum de funcionários e dependentes
(SELECT f.pnome
FROM funcionario f)
INTERSECT
(SELECT d.nome_dependente
FROM dependente d)

