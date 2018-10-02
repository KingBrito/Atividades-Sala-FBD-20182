-- a)
SELECT f.fnome
FROM fornecedor f
WHERE NOT EXISTS (
	SELECT *
	FROM projetos j, fornpecaproj fpj
	WHERE f.fid=fpj.fid and fpj.jid=j.jid and j.cidade<>'Quixadá'
) AND EXISTS(
	SELECT *
	FROM fornpecaproj fpj
	WHERE f.fid=fpj.fid
)

-- b)
-- Assim não vai!
SELECT p.pid, p.pnome
FROM pecas p, fornpecaproj fpj, fornecedor f
WHERE p.pid=fpj.pid AND fpj.fid=f.fid AND f.fnome<>'Maria Silva' AND fnome<>'João Silva'

SELECT *
FROM pecas p
WHERE NOT EXISTS(
	SELECT *
	FROM fornecedor f, fornpecaproj fpj
	WHERE p.pid=fpj.pid AND fpj.fid=f.fid AND (f.fnome='Maria Silva' OR f.fnome='João Silva') 
)

-- c)
-- nao aparece quem ta com 0
SELECT fpj.pid, sum(fpj.qtd)
FROM fornpecaproj fpj
GROUP BY fpj.pid

SELECT p.pid, (select sum(fpj.qtd) from fornpecaproj fpj where fpj.pid=p.pid)
FROM pecas p

-- d)
SELECT f.fnome
FROM fornecedor f, fornpecaproj fpj, projetos j
WHERE f.fid=fpj.fid AND fpj.jid=j.jid AND j.jnome='J1'

-- e) 
SELECT p.pnome
FROM fornecedor f, fornpecaproj fpj, pecas p
WHERE f.fid=fpj.fid AND fpj.jid=p.pid AND f.fnome='F1'

-- f)
SELECT p.pnome, p.pid, max(fpj.qtd), min(fpj.qtd) 
FROM pecas p, fornpecaproj fpj
WHERE fpj.pid=p.pid 
GROUP BY p.pid


-- g)
SELECT fpj.pid
FROM fornpecaproj fpj
GROUP BY fpj.pid
HAVING count(DISTINCT fpj.fid)>1


-- h)
SELECT f.fid, sum(fpj.qtd)
FROM fornecedor f LEFT OUTER JOIN fornpecaproj fpj ON f.fid=fpj.fid
GROUP BY f.fid