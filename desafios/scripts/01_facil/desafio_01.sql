-- --------------------------------------
-- Desafio: Segundo maior salário
-- Filtrar o segundo maior salário distinto no departamento de Engenharia.
-- --------------------------------------

-- --------------------------------------
-- > Opção 1: Utilizando OFFSET e FETCH
-- --------------------------------------
SELECT 
    DISTINCT F.SALARIO 
FROM 
    FUNCIONARIOS       F (NOLOCK) 
    JOIN DEPARTAMENTOS D (NOLOCK) ON F.DEPARTAMENTO_ID = D.ID 
WHERE 
    D.NOME = 'ENGENHARIA' 
ORDER BY 
    F.SALARIO DESC 
OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;

-- --------------------------------------
-- > Opção 2: Utilizando DENSE_RANK
-- --------------------------------------
WITH SALARIOSENGENHARIA AS (
    SELECT 
        F.SALARIO, 
        DENSE_RANK() OVER (ORDER BY F.SALARIO DESC) AS RANKING
    FROM 
        FUNCIONARIOS       F (NOLOCK)  
        JOIN DEPARTAMENTOS D (NOLOCK) ON F.DEPARTAMENTO_ID = D.ID 
    WHERE 
        D.NOME = 'ENGENHARIA'
) 
SELECT 
    SALARIO 
FROM 
    SALARIOSENGENHARIA 
WHERE 
    RANKING = 2;
    
-- --------------------------------------
-- > Opção 3: Utilizando ROW_NUMBER e GROUP BY
-- --------------------------------------
WITH SALARIOSENGENHARIA AS (
    SELECT 
        F.SALARIO, 
        ROW_NUMBER() OVER (ORDER BY F.SALARIO DESC) AS RANKING 
    FROM 
        FUNCIONARIOS       F (NOLOCK)  
        JOIN DEPARTAMENTOS D (NOLOCK) ON F.DEPARTAMENTO_ID = D.ID 
    WHERE 
        D.NOME = 'ENGENHARIA' 
    GROUP BY
        F.SALARIO
) 
SELECT 
    SALARIO 
FROM 
    SALARIOSENGENHARIA 
WHERE 
    RANKING = 2;