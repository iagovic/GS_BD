DECLARE
    CURSOR c_pessoas IS
        SELECT nome, documento FROM Pessoa;
    
    v_nome Pessoa.nome%TYPE;
    v_doc Pessoa.documento%TYPE;
BEGIN
    OPEN c_pessoas;
    LOOP
        FETCH c_pessoas INTO v_nome, v_doc;
        EXIT WHEN c_pessoas%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Pessoa: ' || v_nome || ' - Documento: ' || v_doc);
    END LOOP;
    CLOSE c_pessoas;
END;
/
