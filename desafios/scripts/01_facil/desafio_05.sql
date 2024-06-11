-- --------------------------------------
-- Desafio: Tamanhos das equipes dos gerentes
-- Filtrar qual gerente lidera a maior equipe.
-- --------------------------------------

-- --------------------------------------
-- > Opção 1: Utilizando TOP
-- --------------------------------------
SELECT 
    TOP 1 
    G.NOME       AS NOME_GERENTE, 
    COUNT(FE.ID) AS TAMANHO_EQUIPE
FROM 
    GERENTES                  G  (NOLOCK)
    JOIN FUNCIONARIOS_EQUIPES FE (NOLOCK) ON G.ID = FE.GERENTE_ID
GROUP BY    
    G.NOME
ORDER BY 
    TAMANHO_EQUIPE DESC;

-- --------------------------------------
-- > Opção 2: Utilizando OFFSET e FETCH
-- --------------------------------------
SELECT 
    G.NOME       AS NOME_GERENTE, 
    COUNT(FE.ID) AS TAMANHO_EQUIPE
FROM 
    GERENTES                  G  (NOLOCK)
    JOIN FUNCIONARIOS_EQUIPES FE (NOLOCK) ON G.ID = FE.GERENTE_ID
GROUP BY    
    G.NOME
ORDER BY 
    TAMANHO_EQUIPE DESC
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;