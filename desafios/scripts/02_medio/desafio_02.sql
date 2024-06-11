-- --------------------------------------
-- Desafio: Salários dos funcionários
-- Filtrar os três principais departamentos com pelo menos três funcionários e ordená-los pela porcentagem de funcionários que recebem acima de 4 mil.
-- --------------------------------------

WITH DEPARTAMENTOSFUNCIONARIOS AS (
    SELECT
        D.ID        AS DEPARTAMENTO_ID,
        D.NOME      AS DEPARTAMENTO_NOME,
        COUNT(F.ID) AS QUANTIDADE_FUNCIONARIOS,
        SUM(CASE
                WHEN F.SALARIO > 4000
                THEN 1
                ELSE 0
            END
        )           AS FUNCIONARIOS_ACIMA_4000
    FROM
        DEPARTAMENTOS     D (NOLOCK)
        JOIN FUNCIONARIOS F (NOLOCK) ON D.ID = F.DEPARTAMENTO_ID
    GROUP BY
        D.ID,
        D.NOME
    HAVING
        COUNT (F.ID) >= 3
)
SELECT 
    TOP 3
    (CAST(FUNCIONARIOS_ACIMA_4000 AS FLOAT) / QUANTIDADE_FUNCIONARIOS) * 100 AS PORCENTAGEM_ACIMA_4000,
    DEPARTAMENTO_NOME,
    QUANTIDADE_FUNCIONARIOS
FROM
    DEPARTAMENTOSFUNCIONARIOS
ORDER BY
    PORCENTAGEM_ACIMA_4000 DESC;