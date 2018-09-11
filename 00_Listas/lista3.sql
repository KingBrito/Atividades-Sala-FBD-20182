-- item e
SELECT f.pnome
FROM funcionario g, funcionario f
WHERE g.cpf = f.cpf_supervisor AND g.pnome='Fernando' AND g.unome='Wong'

-- item b
SELECT f.pnome, f.unome, d.dnome, p.projnome
FROM funcionario f, departamento d, trabalha_em t, projeto p
WHERE f.dnr=d.dnumero AND t.fcpf = f.cpf AND t.pnr=p.projnumero
ORDER BY d.dnome, f.unome, f.pnome

-- item g
SELECT DISTINCT t1.fcpf
FROM trabalha_em t, trabalha_em t1
WHERE t.fcpf='12345678966' AND t.pnr=t1.pnr AND t.horas=t1.horas