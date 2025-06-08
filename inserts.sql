BEGIN
    inserir_estacao(1, 'Estação Norte', -23.5505, -46.6333, 'São Paulo - Norte');
    inserir_estacao(2, 'Estação Sul', -30.0346, -51.2177, 'Porto Alegre - Sul');
    inserir_estacao(3, 'Estação Leste', -22.9068, -43.1729, 'Rio de Janeiro - Leste');
    inserir_estacao(4, 'Estação Oeste', -19.9167, -43.9345, 'Belo Horizonte - Oeste');
    inserir_estacao(5, 'Estação Centro', -15.7942, -47.8822, 'Brasília - Centro');
END;
/

BEGIN
    inserir_leitura(1, 1, SYSTIMESTAMP, 25.5, 60.2, 'Normal');
    inserir_leitura(2, 2, SYSTIMESTAMP, 32.1, 50.5, 'Atencao');
    inserir_leitura(3, 3, SYSTIMESTAMP, 35.4, 45.8, 'Critico');
    inserir_leitura(4, 4, SYSTIMESTAMP, 20.0, 70.0, 'Normal');
    inserir_leitura(5, 5, SYSTIMESTAMP, 28.7, 55.3, 'Normal');
END;
/

BEGIN
    inserir_leitura(1, 1, SYSTIMESTAMP, 25.5, 60.2, 'Normal');
    inserir_leitura(2, 2, SYSTIMESTAMP, 32.1, 50.5, 'Atencao');
    inserir_leitura(3, 3, SYSTIMESTAMP, 35.4, 45.8, 'Critico');
    inserir_leitura(4, 4, SYSTIMESTAMP, 20.0, 70.0, 'Normal');
    inserir_leitura(5, 5, SYSTIMESTAMP, 28.7, 55.3, 'Normal');
END;
/

BEGIN
    inserir_evento(1, 'Tempestade', 'Tempestade severa', SYSDATE, SYSDATE + 2, 1);
    inserir_evento(2, 'Enchente', 'Alerta de enchente', SYSDATE, SYSDATE + 1, 2);
    inserir_evento(3, 'Calor Extremo', 'Onda de calor', SYSDATE, SYSDATE + 3, 3);
    inserir_evento(4, 'Frio Intenso', 'Frente fria', SYSDATE, SYSDATE + 2, 4);
    inserir_evento(5, 'Vento Forte', 'Rajadas de vento', SYSDATE, SYSDATE + 1, 5);
END;
/

BEGIN
    inserir_pessoa(1, 'Ana Silva', '12345678900', '11911111111');
    inserir_pessoa(2, 'Carlos Souza', '98765432100', '21922222222');
    inserir_pessoa(3, 'Mariana Lima', '45678912300', '31933333333');
    inserir_pessoa(4, 'Fernando Costa', '78912345600', '41944444444');
    inserir_pessoa(5, 'Beatriz Rocha', '32165498700', '51955555555');
END;
/

BEGIN
    inserir_abrigopessoa(1, 1, SYSTIMESTAMP, NULL);
    inserir_abrigopessoa(2, 2, SYSTIMESTAMP, NULL);
    inserir_abrigopessoa(3, 3, SYSTIMESTAMP, NULL);
    inserir_abrigopessoa(4, 4, SYSTIMESTAMP, NULL);
    inserir_abrigopessoa(5, 5, SYSTIMESTAMP, NULL);
END;
/

BEGIN
    inserir_manutencao(1, 1, SYSDATE, 'Revisão geral', 'Concluida');
    inserir_manutencao(2, 2, SYSDATE, 'Troca de sensores', 'Pendente');
    inserir_manutencao(3, 3, SYSDATE, 'Verificação elétrica', 'Em andamento');
    inserir_manutencao(4, 4, SYSDATE, 'Atualização de software', 'Concluida');
    inserir_manutencao(5, 5, SYSDATE, 'Checagem de estrutura', 'Pendente');
END;
/


BEGIN
    inserir_alerta(1, 1, 'Chuva forte', 'Possível alagamento', SYSTIMESTAMP);
    inserir_alerta(2, 2, 'Vento forte', 'Risco de quedas de árvores', SYSTIMESTAMP);
    inserir_alerta(3, 3, 'Calor extremo', 'Risco de incêndios', SYSTIMESTAMP);
    inserir_alerta(4, 4, 'Frio intenso', 'Risco para pessoas vulneráveis', SYSTIMESTAMP);
    inserir_alerta(5, 5, 'Granizo', 'Possibilidade de queda de granizo', SYSTIMESTAMP);
END;
/

