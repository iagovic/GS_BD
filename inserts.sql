
------ INSERTS
BEGIN
    -- Inserir dados na tabela EstacaoClimatica
    inserir_estacao(1, 'Estação A', -23.550520, -46.633308, 'Rua Exemplo, 123, São Paulo, SP');
    inserir_estacao(2, 'Estação B', -23.561000, -46.634000, 'Avenida Brasil, 45, São Paulo, SP');
    inserir_estacao(3, 'Estação C', -23.562000, -46.635000, 'Rua da Liberdade, 78, São Paulo, SP');
    inserir_estacao(4, 'Estação D', -23.563000, -46.636000, 'Rua das Palmeiras, 32, São Paulo, SP');
    inserir_estacao(5, 'Estação E', -23.564000, -46.637000, 'Rua das Flores, 98, São Paulo, SP');
END;
/
BEGIN
    -- Inserir dados na tabela Pessoa
    inserir_pessoa(1, 'João Silva', '12345678901', '11-91234-5678');
    inserir_pessoa(2, 'Maria Oliveira', '98765432100', '11-92345-6789');
    inserir_pessoa(3, 'Pedro Souza', '11223344556', '11-93456-7890');
    inserir_pessoa(4, 'Ana Costa', '22334455667', '11-94567-8901');
    inserir_pessoa(5, 'Carlos Pereira', '33445566778', '11-95678-9012');
END;
/
BEGIN
    -- Inserir dados na tabela Abrigo
    inserir_abrigo(1, 'Abrigo A', -23.561020, -46.636308, 'Rua Exemplo, 123, São Paulo, SP', 100, '11-98765-4321');
    inserir_abrigo(2, 'Abrigo B', -23.562000, -46.637000, 'Avenida Paulista, 250, São Paulo, SP', 150, '11-99876-5432');
    inserir_abrigo(3, 'Abrigo C', -23.563000, -46.638000, 'Rua da Consolação, 500, São Paulo, SP', 200, '11-96753-2100');
    inserir_abrigo(4, 'Abrigo D', -23.564000, -46.639000, 'Rua das Américas, 80, São Paulo, SP', 120, '11-95678-3400');
    inserir_abrigo(5, 'Abrigo E', -23.565000, -46.640000, 'Rua das Acácias, 150, São Paulo, SP', 90, '11-94567-8910');
END;
/
BEGIN
    -- Inserir dados na tabela EventoClimatico
    inserir_evento(1, 'Tempestade', 'Tempestade forte com ventos e chuva intensa', TO_DATE('2025-06-07', 'YYYY-MM-DD'), TO_DATE('2025-06-07', 'YYYY-MM-DD'), 1);
    inserir_evento(2, 'Chuvas intensas', 'Previsão de chuvas contínuas durante o dia', TO_DATE('2025-06-08', 'YYYY-MM-DD'), TO_DATE('2025-06-08', 'YYYY-MM-DD'), 2);
    inserir_evento(3, 'Vento forte', 'Rajadas de vento acima de 50 km/h', TO_DATE('2025-06-09', 'YYYY-MM-DD'), TO_DATE('2025-06-09', 'YYYY-MM-DD'), 3);
    inserir_evento(4, 'Nevoeiro', 'Visibilidade reduzida devido ao nevoeiro denso', TO_DATE('2025-06-10', 'YYYY-MM-DD'), TO_DATE('2025-06-10', 'YYYY-MM-DD'), 4);
    inserir_evento(5, 'Calor extremo', 'Temperaturas acima de 35°C em várias regiões', TO_DATE('2025-06-11', 'YYYY-MM-DD'), TO_DATE('2025-06-11', 'YYYY-MM-DD'), 5);
END;
/
BEGIN
    -- Inserir dados na tabela LeituraClimatica
    inserir_leitura(1, 1, TO_TIMESTAMP('2025-06-07 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 22.5, 65.0, 'Normal');
    inserir_leitura(2, 1, TO_TIMESTAMP('2025-06-07 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 23.0, 60.0, 'Normal');
    inserir_leitura(3, 2, TO_TIMESTAMP('2025-06-07 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 21.5, 70.0, 'Atencao');
    inserir_leitura(4, 2, TO_TIMESTAMP('2025-06-07 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 24.0, 55.0, 'Normal');
    inserir_leitura(5, 3, TO_TIMESTAMP('2025-06-07 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 20.5, 75.0, 'Critico');
END;
/
---manutenção
BEGIN
    -- Inserção de dados usando a procedure
    inserir_manutencao(1, TO_DATE('2025-06-06', 'YYYY-MM-DD'), 'Troca de bateria', 'Concluida');
    inserir_manutencao(2, TO_DATE('2025-06-07', 'YYYY-MM-DD'), 'Manutenção preventiva', 'Pendente');
    inserir_manutencao(3, TO_DATE('2025-06-08', 'YYYY-MM-DD'), 'Reparo de sensor', 'Concluida');
    inserir_manutencao(4, TO_DATE('2025-06-09', 'YYYY-MM-DD'), 'Substituição de peça', 'Pendente');
    inserir_manutencao(5, TO_DATE('2025-06-10', 'YYYY-MM-DD'), 'Verificação de sistema', 'Em andamento');
END;
/


BEGIN
    -- Inserir dados na tabela Alerta
    inserir_alerta(1, 1, 'Aviso', 'Temperatura elevada detectada', TO_TIMESTAMP('2025-06-07 15:30:00', 'YYYY-MM-DD HH24:MI:SS'));
    inserir_alerta(2, 2, 'Alerta', 'Ventos fortes previstos para a noite', TO_TIMESTAMP('2025-06-07 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    inserir_alerta(3, 3, 'Crítico', 'Tempestade tropical se aproximando', TO_TIMESTAMP('2025-06-07 17:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    inserir_alerta(4, 4, 'Aviso', 'Nevoeiro denso na região', TO_TIMESTAMP('2025-06-07 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    inserir_alerta(5, 5, 'Crítico', 'Calor extremo, risco de incêndios', TO_TIMESTAMP('2025-06-07 19:00:00', 'YYYY-MM-DD HH24:MI:SS'));
END;
/

BEGIN
    -- Inserir dados na tabela AbrigoPessoa
    inserir_abrigopessoa(1, 1, TO_TIMESTAMP('2025-06-07 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-06-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    inserir_abrigopessoa(1, 2, TO_TIMESTAMP('2025-06-07 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-06-09 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    inserir_abrigopessoa(2, 3, TO_TIMESTAMP('2025-06-07 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-06-08 14:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    inserir_abrigopessoa(3, 4, TO_TIMESTAMP('2025-06-07 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-06-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    inserir_abrigopessoa(4, 5, TO_TIMESTAMP('2025-06-07 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-06-10 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));
END;
/

