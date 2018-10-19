-- a) 
SELECT p.sigla, (select  sum(v.numero_votos)
		from candidatos c, votos v, cargos cg
		where p.numero = c.numero_partido AND
		      c.numero_cand = v.numero_cand AND
		      c.localidade_id = v.localidade_id AND
		      cg.id = c.cargo_id AND
		      v.turno = 1 AND
		      cg.descricao = 'Presidente' ) as num_votos
FROM partidos p
ORDER BY num_votos DESC

-- b)
CREATE VIEW voto_turno1 AS
SELECT c.nome as nome_cand, c.numero_cand, cg.descricao, p.sigla, l.nome as nome_localidade, (select sum(v.numero_votos)
                                                             from votos v 
                                                             where c.numero_cand = v.numero_cand AND
                                                                   c.localidade_id = v.localidade_id AND
                                                                   v.turno = 1) as num_votos
FROM candidatos c, cargos cg, partidos p, localidades l
WHERE cg.id = c.cargo_id AND
      p.numero = c.numero_partido AND
      l.id = c.localidade_id

SELECT v1.nome_cand
FROM voto_turno1 v1
WHERE v1.num_votos >= (SELECT avg(v.numero_votos)
                       FROM votos v, localidades l, candidatos c, cargos cg
                       WHERE l.id = c.localidade_id AND 
                             c.numero_cand = v.numero_cand AND
		             c.localidade_id = v.localidade_id AND
		             cg.id = c.cargo_id AND
		             l.nome = v1.nome_localidade AND
		             cg.descricao = v1.descricao)


-- c)
SELECT cg.descricao, 
(SELECT sum(v.numero_votos)
    FROM candidatos c, votos v, localidades l
    WHERE cg.id = c.cargo_id AND
        c.numero_cand = v.numero_cand AND
	c.localidade_id = v.localidade_id AND
	l.id = c.localidade_id AND
	l.id= 1),
(SELECT sum(v.numero_votos)
    FROM candidatos c, votos v, localidades l
    WHERE cg.id = c.cargo_id AND
        c.numero_cand = v.numero_cand AND
	c.localidade_id = v.localidade_id AND
	l.id = c.localidade_id AND
	l.id= 2)	
FROM cargos cg		        


-- d)
SELECT c.nome
FROM candidatos c
WHERE  EXISTS (
	    SELECT *
	    FROM votos v
            WHERE c.numero_cand = v.numero_cand AND
	          c.localidade_id = v.localidade_id AND
	          v.localidade_id = 2
	) AND
	NOT EXISTS (
	    SELECT 
	    FROM votos v
            WHERE c.numero_cand = v.numero_cand AND
	          c.localidade_id = v.localidade_id AND
	          v.localidade_id <> 2
	)
	
-- e)
SELECT c.nome
FROM candidatos c, votos v
WHERE c.numero_cand = v.numero_cand AND
      c.localidade_id = v.localidade_id AND
      v.turno = 1 AND
      v.numero_votos = (
		SELECT max(v.numero_votos)
		FROM votos v
      )
      
SELECT c.nome
FROM candidatos c, votos v
WHERE c.numero_cand = v.numero_cand AND
      c.localidade_id = v.localidade_id AND
      v.turno = 1 AND
      v.numero_votos >= ALL (
		SELECT v.numero_votos
		FROM votos v
      )
      


-- f)
SELECT c.nome, 1.0*v1.numero_votos/(select sum(v.numero_votos) from votos v where v.localidade_id=c.localidade_id) as percentual
FROM candidatos c, votos v1
WHERE c.numero_cand = v1.numero_cand AND
      c.localidade_id = v1.localidade_id
ORDER BY percentual DESC

-- g)
SELECT cg.descricao, (select count(*) from candidatos c where c.cargo_id=cg.id) as qtd
FROM cargos cg
ORDER BY qtd DESC


-- h)
SELECT p.sigla
FROM partidos p
WHERE NOT EXISTS (
	SELECT *
	FROM candidatos c, cargos cg
	WHERE c.cargo_id = cg.id AND
	      p.numero = c.numero_partido AND
	      cg.descricao = 'Presidente'
)
