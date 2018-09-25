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
- Aqui não rola!
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

