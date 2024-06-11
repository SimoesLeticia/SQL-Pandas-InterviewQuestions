-- --------------------------------------
-- Desafio: Promoções cruzadas
-- Identifique os produtos frequentemente adquiridos juntos pelo mesmo usuário.
-- --------------------------------------

WITH PROMOCOESCRUZADAS AS (
    SELECT
        PD.USUARIO_ID, 
        PD.DATA_CRIACAO, 
        PR.NOME
    FROM 
        PEDIDOS       PD (NOLOCK)
        JOIN PRODUTOS PR (NOLOCK) ON PD.PRODUTO_ID = PR.ID
    WHERE 
        PD.DATA_CRIACAO >= '01/01/2022'
)
SELECT 
    TOP 5
    PC1.NOME  AS PRODUTO_01, 
    PC2.NOME  AS PRODUTO_02, 
    COUNT(*)  AS QUANTIDADE
FROM 
    PROMOCOESCRUZADAS         PC1 (NOLOCK)
    JOIN PROMOCOESCRUZADAS AS PC2 (NOLOCK) ON PC1.USUARIO_ID = PC2.USUARIO_ID
                                          AND PC1.NOME < PC2.NOME
                                          AND PC1.DATA_CRIACAO = PC2.DATA_CRIACAO
GROUP BY 
    PC1.NOME,
    PC2.NOME
ORDER BY  
    QUANTIDADE DESC, 
    PRODUTO_01 ASC;