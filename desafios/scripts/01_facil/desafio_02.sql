-- --------------------------------------
-- Desafio: Localizações vazias
-- Filtrar todas as localizações que possuem 0 usuários vinculados a elas.
-- --------------------------------------

SELECT
    L.NOME
FROM
    LOCALIZACOES       L (NOLOCK)
    LEFT JOIN USUARIOS U (NOLOCK) ON L.ID = U.LOCALIZACAO_ID
GROUP BY 
    L.NOME
HAVING
    COUNT(U.ID) = 0
ORDER BY 
    L.NOME;