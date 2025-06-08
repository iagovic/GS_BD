DECLARE
    CURSOR c_estacoes IS
        SELECT e.nome, COUNT(l.id_leitura) AS total
        FROM EstacaoClimatica e
        JOIN LeituraClimatica l ON e.id_estacao = l.id_estacao
        GROUP BY e.nome;

    v_nome EstacaoClimatica.nome%TYPE;
    v_total NUMBER;
BEGIN
    FOR estacao IN c_estacoes LOOP
        DBMS_OUTPUT.PUT_LINE('Estação: ' || estacao.nome || ' - Leituras: ' || estacao.total);
    END LOOP;
END;
/

DECLARE
    v_total_concluidas NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_total_concluidas
    FROM ManutencaoEstacao
    WHERE status = 'Concluida';

    IF v_total_concluidas > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Há ' || v_total_concluidas || ' manutenções concluídas.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Nenhuma manutenção concluída.');
    END IF;
END;
/
