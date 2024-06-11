-- --------------------------------------
-- Desafio: Distância percorrida
-- Retornar a distância percorrida por cada usuário em ordem decrescente.
-- --------------------------------------

SELECT 
    U.NOME, 
    ISNULL(SUM(V.DISTANCIA), 0) AS DISTANCIA_PERCORRIDA
FROM 
    USUARIOS          U (NOLOCK)
    LEFT JOIN VIAGENS V (NOLOCK) ON U.ID = V.PASSAGEIRO_USUARIO_ID
GROUP BY 
    U.NOME
ORDER BY 
    DISTANCIA_PERCORRIDA DESC;