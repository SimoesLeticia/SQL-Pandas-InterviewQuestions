-- --------------------------------------
-- Desafio: Rotas de voo
-- Filtrar pares únicos de duas localidades.
-- --------------------------------------

-- --------------------------------------
-- > Opção 1: Utilizando CASE
-- --------------------------------------
SELECT
    DISTINCT
    CASE
        WHEN LOCAL_ORIGEM < LOCAL_DESTINO THEN LOCAL_ORIGEM
        ELSE LOCAL_DESTINO
    END LOCALIDADE_01,
    CASE
        WHEN LOCAL_ORIGEM < LOCAL_DESTINO THEN LOCAL_DESTINO
        ELSE LOCAL_ORIGEM
    END LOCALIDADE_02
FROM 
    VOOS (NOLOCK);

-- --------------------------------------
-- > Opção 2: Utilizando SUBSTRING, CASE e SUBQUERIES
-- --------------------------------------
SELECT
    TRIM(SUBSTRING(ROTA, 1, CHARINDEX(';', ROTA) - 1))         AS LOCALIDADE_01,
    TRIM(SUBSTRING(ROTA, CHARINDEX(';', ROTA) + 1, LEN(ROTA))) AS LOCALIDADE_02
FROM (
        SELECT 
            DISTINCT
            CASE
                WHEN LOCAL_ORIGEM < LOCAL_DESTINO THEN LOCAL_ORIGEM + ';' + LOCAL_DESTINO
                ELSE LOCAL_DESTINO + ';' + LOCAL_ORIGEM
            END AS ROTA
        FROM 
            VOOS (NOLOCK)
) AS SUBQUERY;