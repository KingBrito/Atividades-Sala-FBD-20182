-- a)
SELECT t.nome
FROM times t
WHERE EXISTS (SELECT *
             FROM jogos j
             WHERE (j.time1= t.id AND j.time2=1) OR
                    (j.time1= 1 AND j.time2=t.id))
      AND NOT EXISTS (SELECT *
		FROM jogos j
		WHERE (j.time1= t.id AND j.time2<>1) OR
                       (j.time1<> 1 AND j.time2=t.id))

-- b)
SELECT c.nome, (SELECT count(*) FROM jogos j WHERE j.campeonato=c.id), (SELECT sum(gols1)+sum(gols2) FROM jogos j WHERE j.campeonato=c.id)  as gols, (SELECT 1.0*(sum(gols1)+sum(gols2))/count(*) FROM jogos j WHERE j.campeonato=c.id)
FROM campeonatos c
ORDER BY gols DESC

-- c)
CREATE VIEW JogosTimesGols AS
(SELECT j.id, j.time1, j.gols1
FROM jogos j)
UNION
(SELECT j.id, j.time2, j.gols2
FROM jogos j)


-- d)
SELECT t.nome, (SELECT sum(jtg1.gols1) FROM JogosTimesGols jtg1 WHERE jtg1.time1=t.id)
FROM times t, JogosTimesGols jtg
WHERE t.id = jtg.time1 AND jtg.gols1 > 2
ORDER BY t.nome

-- e)
(SELECT *
FROM campeonatos c)
EXCEPT
(SELECT c.id, c.nome
FROM campeonatos c, jogos j
WHERE c.id=j.campeonato AND (j.time1=3 OR j.time2=3))
