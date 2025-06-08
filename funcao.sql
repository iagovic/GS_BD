CREATE OR REPLACE FUNCTION temperatura_media_estacao (
    p_id_estacao IN INT
) RETURN NUMBER IS
    v_media NUMBER;
BEGIN
    SELECT AVG(temperatura)
    INTO v_media
    FROM LeituraClimatica
    WHERE id_estacao = p_id_estacao;

    RETURN v_media;
END;
/

CREATE OR REPLACE FUNCTION total_pessoas_abrigo (
    p_id_abrigo IN INT
) RETURN INT IS
    v_total INT;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM AbrigoPessoa
    WHERE id_abrigo = p_id_abrigo
      AND data_saida IS NULL; -- apenas quem ainda está no abrigo

    RETURN v_total;
END;
/
