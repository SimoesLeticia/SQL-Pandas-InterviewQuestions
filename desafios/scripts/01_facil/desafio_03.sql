-- --------------------------------------
-- Desafio: Última transação bancária
-- Filtrar a última transação de cada dia, ordenando os resultados por data e hora.
-- --------------------------------------

-- --------------------------------------
-- > Opção 1: Utilizando CTE e ROW_NUMBER
-- --------------------------------------
WITH ULTIMASTRANSACOES AS (
    SELECT
        ID,
        DATA_CRIACAO,
        VALOR_TRANSACAO,
        ROW_NUMBER() OVER (PARTITION BY CAST(DATA_CRIACAO AS DATE) ORDER BY DATA_CRIACAO DESC) AS ROWNUM
    FROM
        TRANSACOES_BANCARIAS (NOLOCK)
)
SELECT
    DATA_CRIACAO,
    VALOR_TRANSACAO,
    ID
FROM
    ULTIMASTRANSACOES
WHERE
    ROWNUM = 1
ORDER BY
    DATA_CRIACAO, 
    ID;
    
-- --------------------------------------
-- > Opção 2: Utilizando Subqueries, JOIN e MAX
-- --------------------------------------
SELECT
    TB.DATA_CRIACAO,
    TB.VALOR_TRANSACAO,
    TB.ID
FROM
    TRANSACOES_BANCARIAS TB
    INNER JOIN (
        SELECT
            CAST(DATA_CRIACAO AS DATE) AS DATA,
            MAX(DATA_CRIACAO) AS MAX_DATA
        FROM
            TRANSACOES_BANCARIAS (NOLOCK)
        GROUP BY
            CAST(DATA_CRIACAO AS DATE)
    ) AS MAX_TB ON CAST(TB.DATA_CRIACAO AS DATE) = MAX_TB.DATA 
               AND TB.DATA_CRIACAO = MAX_TB.MAX_DATA
ORDER BY
    TB.DATA_CRIACAO, 
    TB.ID;