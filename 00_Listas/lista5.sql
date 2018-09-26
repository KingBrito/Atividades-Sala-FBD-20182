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
-- Aqui não rola!
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


-- g)
SELECT fpj.pid
FROM fornpecaproj fpj
GROUP BY fpj.pid
HAVING count(DISTINCT fpj.fid)>1

-- c)
-- nao aparece quem ta com 0
SELECT fpj.pid, sum(fpj.qtd)
FROM fornpecaproj fpj
GROUP BY fpj.pid

SELECT p.pid, (select sum(fpj.qtd) from fornpecaproj fpj where fpj.pid=p.pid)
FROM pecas p

-- h)
SELECT f.fid, sum(fpj.qtd)
FROM fornecedor f LEFT OUTER JOIN fornpecaproj fpj ON f.fid=fpj.fid
GROUP BY f.fid