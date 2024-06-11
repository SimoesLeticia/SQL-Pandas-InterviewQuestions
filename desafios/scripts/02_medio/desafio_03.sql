-- --------------------------------------
-- Desafio: Estudantes com pontuações mais próximas
-- Filtrar os dois estudantes com as pontuações mais próximas.
-- --------------------------------------

-- --------------------------------------
-- > Opção 1: Utilizando ORDENAÇÃO
-- --------------------------------------
SELECT
    TOP 1
    P1.ESTUDANTE                     AS ESTUDANTE_1,
    P2.ESTUDANTE                     AS ESTUDANTE_2,
    ABS(P1.PONTUACAO - P2.PONTUACAO) AS PONTUACAO_DIFERENCA
FROM
    PONTUACOES      P1 (NOLOCK)
    JOIN PONTUACOES P2 (NOLOCK) ON P1.ID <> P2.ID
ORDER BY
    PONTUACAO_DIFERENCA,
    ESTUDANTE_1 ASC;

-- --------------------------------------
-- > Opção 2: Utilizando CTE (Common Table Expression) e ROW_NUMBER
-- --------------------------------------
WITH PONTUACOESDIFERENCAS AS (
    SELECT
        P1.ESTUDANTE                     AS ESTUDANTE_1,
        P2.ESTUDANTE                     AS ESTUDANTE_2,
        ABS(P1.PONTUACAO - P2.PONTUACAO) AS PONTUACAO_DIFERENCA,
        ROW_NUMBER() OVER (ORDER BY ABS(P1.PONTUACAO - P2.PONTUACAO), P1.ESTUDANTE) AS RN
FROM
    PONTUACOES      P1 (NOLOCK)
    JOIN PONTUACOES P2 (NOLOCK) ON P1.ID <> P2.ID
)
SELECT
    ESTUDANTE_1,
    ESTUDANTE_2,
    PONTUACAO_DIFERENCA
FROM
    PONTUACOESDIFERENCAS
WHERE
    RN = 1;