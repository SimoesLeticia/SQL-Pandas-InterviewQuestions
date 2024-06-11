-- --------------------------------------
-- Desafio: Pedidos de usuários
-- Filtrar os usuários que realizaram mais de três pedidos nos anos de 2019 e 2020 simultaneamente.
-- --------------------------------------

-- --------------------------------------
-- > Opção 1: Utilizando HAVING COUNT
-- --------------------------------------
SELECT 
    U.NOME AS USUARIO_NOME
FROM 
    PEDIDOS       P (NOLOCK)
    JOIN USUARIOS U (NOLOCK) ON P.USUARIO_ID = U.ID
WHERE 
    YEAR(P.DATA_CRIACAO) = 2019 OR YEAR(P.DATA_CRIACAO) = 2020
GROUP BY 
    U.NOME
HAVING 
    COUNT(CASE WHEN YEAR(P.DATA_CRIACAO) = 2019 THEN 1 END) > 3
AND
    COUNT(CASE WHEN YEAR(P.DATA_CRIACAO) = 2020 THEN 1 END) > 3
ORDER BY
    USUARIO_NOME;

-- --------------------------------------
-- > Opção 2: Utilizando Subqueries
-- --------------------------------------
SELECT
    U.NOME AS USUARIO_NOME
FROM
    (
        SELECT
            P.USUARIO_ID,
            SUM(CASE WHEN YEAR(DATA_CRIACAO) = 2019 THEN 1 ELSE 0 END) AS QUANTIDADE_2019,
            SUM(CASE WHEN YEAR(DATA_CRIACAO) = 2020 THEN 1 ELSE 0 END) AS QUANTIDADE_2020
        FROM
            PEDIDOS P (NOLOCK)
        GROUP BY 
            P.USUARIO_ID
    ) PD
    JOIN USUARIOS U (NOLOCK) ON PD.USUARIO_ID = U.ID
WHERE
    QUANTIDADE_2019 > 3
AND
    QUANTIDADE_2020 > 3
ORDER BY
    USUARIO_NOME;