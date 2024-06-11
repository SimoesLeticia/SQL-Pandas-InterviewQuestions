-- --------------------------------------
-- Desafio: Média móvel para transações bancárias
-- Calcular a média móvel de três dias para os depósitos.
-- --------------------------------------

-- --------------------------------------
-- > Opção 1: Utilizando ROW_NUMBER E OVER
-- --------------------------------------
WITH TRANSACOES AS (
    SELECT
        CAST(DATA_CRIACAO AS DATE)                              AS DATA_TRANSACAO,
        SUM(VALOR_TRANSACAO)                                    AS SOMATORIA_TRANSACAO,
        ROW_NUMBER() OVER (ORDER BY CAST(DATA_CRIACAO AS DATE)) AS ROWNUM
    FROM
        TRANSACOES_BANCARIAS (NOLOCK)
    WHERE
        VALOR_TRANSACAO > 0
    GROUP BY
        CAST(DATA_CRIACAO AS DATE)
)
SELECT
    FORMAT(DATA_TRANSACAO, 'dd/MM/yyyy') AS DATA_TRANSACAO,
    AVG(SOMATORIA_TRANSACAO) OVER (ORDER BY ROWNUM ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MEDIA_MOVEL
FROM
    TRANSACOES
ORDER BY 
    DATA_TRANSACAO;

-- --------------------------------------
-- > Opção 2: Utilizando JOIN E DATEADD
-- --------------------------------------
WITH TRANSACOES AS (
    SELECT 
        CAST(DATA_CRIACAO AS DATE) AS DATA_TRANSACAO, 
        SUM(VALOR_TRANSACAO)       AS SOMATORIA_TRANSACAO
    FROM 
        TRANSACOES_BANCARIAS (NOLOCK)
    WHERE 
        VALOR_TRANSACAO > 0
    GROUP BY 
        CAST(DATA_CRIACAO AS DATE)
)
SELECT 
    FORMAT(T2.DATA_TRANSACAO, 'dd/MM/yyyy') AS DATA_TRANSACAO,
    AVG(T1.SOMATORIA_TRANSACAO)             AS MEDIA_MOVEL
FROM 
    TRANSACOES      T1
    JOIN TRANSACOES T2 ON T1.DATA_TRANSACAO > DATEADD(DAY, -3, T2.DATA_TRANSACAO)
                      AND T1.DATA_TRANSACAO <= T2.DATA_TRANSACAO
GROUP BY 
    T2.DATA_TRANSACAO
ORDER BY 
    T2.DATA_TRANSACAO;