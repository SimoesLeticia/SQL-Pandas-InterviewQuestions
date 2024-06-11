-- --------------------------------------
-- Desafio: Três maiores salários por departamento
-- Filtrar os três maiores salários por departamento.
-- --------------------------------------

WITH TOP_DEPARTAMENTOS_SALARIOS AS (
    SELECT 
        F.NOME + ' ' + F.SOBRENOME AS NOME_FUNCIONARIO, 
        D.NOME                     AS DEPARTAMENTO_NOME, 
        F.SALARIO,
        ROW_NUMBER() OVER (PARTITION BY D.NOME ORDER BY F.SALARIO DESC) AS ROWNUM, 
        DENSE_RANK() OVER (PARTITION BY D.NOME ORDER BY F.SALARIO DESC) AS RANKING  
    FROM 
        FUNCIONARIOS       F (NOLOCK)
        JOIN DEPARTAMENTOS D (NOLOCK) ON F.DEPARTAMENTO_ID = D.ID
)
SELECT 
    DEPARTAMENTO_NOME,
    SALARIO,
    NOME_FUNCIONARIO
FROM
    TOP_DEPARTAMENTOS_SALARIOS
WHERE 
    ROWNUM <= 3
ORDER BY
    DEPARTAMENTO_NOME ASC,
    SALARIO DESC;