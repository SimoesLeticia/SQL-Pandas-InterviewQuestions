-- --------------------------------------
-- Desafio: Sobreposição de assinaturas
-- Determinar se o intervalo de datas de assinatura se sobrepõe a qualquer outra.
-- --------------------------------------

-- --------------------------------------
-- > Opção 1: Utilizando CASE E SUBQUERY
-- --------------------------------------
SELECT 
    A.USUARIO_ID,
    CASE
        WHEN EXISTS (
            SELECT 
                1
            FROM 
                ASSINATURAS B (NOLOCK)
            WHERE 
                A.USUARIO_ID <> B.USUARIO_ID
            AND ( 
                    (A.DATA_INICIO BETWEEN B.DATA_INICIO AND B.DATA_TERMINO) OR 
                    (A.DATA_TERMINO BETWEEN B.DATA_INICIO AND B.DATA_TERMINO) 
                ) 
        ) THEN 1
        ELSE 0
    END AS SOBREPOSICAO
FROM 
    ASSINATURAS A (NOLOCK)
WHERE 
    A.DATA_TERMINO IS NOT NULL;

-- --------------------------------------
-- > Opção 2: Utilizando JOIN E COUNT
-- --------------------------------------
SELECT A.USUARIO_ID,
    CASE
        WHEN COUNT(B.USUARIO_ID) > 0 THEN 1
        ELSE 0
    END AS SOBREPOSICAO
FROM 
    ASSINATURAS           A (NOLOCK)
    LEFT JOIN ASSINATURAS B (NOLOCK) ON A.USUARIO_ID <> B.USUARIO_ID
                                    AND A.DATA_INICIO <= B.DATA_TERMINO
                                    AND A.DATA_TERMINO >= B.DATA_INICIO 
WHERE 
    A.DATA_TERMINO IS NOT NULL
GROUP BY 
    A.USUARIO_ID;