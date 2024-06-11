-- --------------------------------------
-- Desafio: Histograma de comentários
-- Gerar um histograma representando o número de comentários por usuário durante o mês de janeiro de 2020.
-- --------------------------------------

-- --------------------------------------
-- > Opção 1: Utilizando CTE (Common Table Expression)
-- --------------------------------------
WITH BINS AS (
    SELECT 
        U.ID                AS USUARIO_ID, 
        COUNT(C.USUARIO_ID) AS QUANTIDADE_COMENTARIOS
    FROM
        USUARIOS              U (NOLOCK)
        LEFT JOIN COMENTARIOS C (NOLOCK) ON U.ID = C.USUARIO_ID 
                                        AND MONTH(C.DATA_CRIACAO) = 1 
                                        AND YEAR(C.DATA_CRIACAO) = 2020
    GROUP BY 
        U.ID
)
SELECT  
    QUANTIDADE_COMENTARIOS, 
    COUNT(USUARIO_ID) AS FREQUENCIA
FROM 
    BINS
GROUP BY 
    QUANTIDADE_COMENTARIOS
ORDER BY 
    QUANTIDADE_COMENTARIOS;
    
-- --------------------------------------
-- > Opção 2: Utilizando Subqueries
-- --------------------------------------
SELECT 
    ISNULL(QUANTIDADE_COMENTARIOS, 0) AS QUANTIDADE_COMENTARIOS,
    COUNT(*)                          AS FREQUENCIA
FROM 
    (
        SELECT 
            U.ID                AS USUARIO_ID, 
            COUNT(C.USUARIO_ID) AS QUANTIDADE_COMENTARIOS
        FROM
            USUARIOS              U (NOLOCK)
            LEFT JOIN COMENTARIOS C (NOLOCK) ON U.ID = C.USUARIO_ID 
                                            AND MONTH(C.DATA_CRIACAO) = 1 
                                            AND YEAR(C.DATA_CRIACAO) = 2020
        GROUP BY 
            U.ID
    ) AS SUBCONSULTA
GROUP BY 
    QUANTIDADE_COMENTARIOS
ORDER BY 
    QUANTIDADE_COMENTARIOS;