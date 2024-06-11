-- --------------------------------------
-- Desafio: Primeira conversão por usuário
-- Filtrar a atribuição da primeira interação para cada usuário que realizou uma conversão.
-- --------------------------------------

-- --------------------------------------
-- > Opção 1: Utilizando CTE e ROW_NUMBER
-- --------------------------------------
WITH SESSOES AS (
    SELECT
        US.USUARIO_ID,      
        AT.CANAL,
        ROW_NUMBER() OVER(PARTITION BY US.USUARIO_ID ORDER BY US.DATA_CRIACAO ASC) AS ROWNUM
    FROM
        USUARIOS_SESSOES US (NOLOCK)
        JOIN ATRIBUICOES AT (NOLOCK) ON US.SESSAO_ID = AT.SESSAO_ID
    WHERE 
        AT.CONVERSAO = 1

)
SELECT 
    USUARIO_ID, 
    CANAL 
FROM 
    SESSOES
WHERE 
    ROWNUM = 1 
ORDER BY 
    USUARIO_ID;
    
-- --------------------------------------
-- > Opção 2: Utilizando CTE, ROW_NUMBER e CASE
-- --------------------------------------
WITH SESSOES AS (
    SELECT
        U.USUARIO_ID,
        A.CANAL,
        ROW_NUMBER() OVER(PARTITION BY U.USUARIO_ID ORDER BY U.DATA_CRIACAO ASC) AS ROWNUM,
        CASE 
            WHEN SUM(CAST(A.CONVERSAO AS INT)) OVER(PARTITION BY U.USUARIO_ID) > 0 THEN 1 
            ELSE 0 END 
        AS CONVERSAO
    FROM 
        USUARIOS_SESSOES U (NOLOCK)
        JOIN ATRIBUICOES A (NOLOCK) ON U.SESSAO_ID = A.SESSAO_ID
)
SELECT
    USUARIO_ID,
    CANAL
FROM 
    SESSOES
WHERE 
    CONVERSAO = 1
AND 
    ROWNUM = 1
ORDER BY 
    USUARIO_ID;