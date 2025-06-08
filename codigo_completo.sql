-- DROP TABLES (na ordem correta para evitar erro de FK)
DROP TABLE AbrigoPessoa;
DROP TABLE LeituraClimatica;
DROP TABLE EventoClimatico;
DROP TABLE ManutencaoEstacao;
DROP TABLE Alerta;
DROP TABLE Abrigo;
DROP TABLE Pessoa;
DROP TABLE EstacaoClimatica;

-----------------------------------------------------
-- Criação da tabela EstacaoClimatica
CREATE TABLE EstacaoClimatica (
    id_estacao INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    localizacao_detalhada VARCHAR(200)
);

-- Criação da tabela LeituraClimatica
CREATE TABLE LeituraClimatica (
    id_leitura INT PRIMARY KEY,
    id_estacao INT NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    temperatura DECIMAL(5,2) NOT NULL,
    umidade DECIMAL(5,2) NOT NULL,
    status_alerta VARCHAR(20) CHECK (status_alerta IN ('Normal', 'Atencao', 'Critico')),
    FOREIGN KEY (id_estacao) REFERENCES EstacaoClimatica(id_estacao)
);

-- Criação da tabela Abrigo
CREATE TABLE Abrigo (
    id_abrigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    capacidade INT NOT NULL,
    contato VARCHAR(50)
);

-- Criação da tabela EventoClimatico
CREATE TABLE EventoClimatico (
    id_evento INT PRIMARY KEY,
    tipo_evento VARCHAR(50) NOT NULL,
    descricao VARCHAR(200),
    data_inicio DATE NOT NULL,
    data_fim DATE,
    id_estacao INT NOT NULL,
    FOREIGN KEY (id_estacao) REFERENCES EstacaoClimatica(id_estacao)
);

-- Criação da tabela Pessoa
CREATE TABLE Pessoa (
    id_pessoa INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    documento VARCHAR(20) UNIQUE NOT NULL,
    contato VARCHAR(50)
);

-- Criação da tabela AbrigoPessoa (tabela de junção)
CREATE TABLE AbrigoPessoa (
    id_abrigo INT NOT NULL,
    id_pessoa INT NOT NULL,
    data_entrada TIMESTAMP NOT NULL,
    data_saida TIMESTAMP,
    PRIMARY KEY (id_abrigo, id_pessoa, data_entrada),
    FOREIGN KEY (id_abrigo) REFERENCES Abrigo(id_abrigo),
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa)
);

-- Criação da tabela ManutencaoEstacao
CREATE TABLE ManutencaoEstacao (
    id_manutencao INT PRIMARY KEY,
    id_estacao INT NOT NULL,
    data_manutencao DATE NOT NULL,
    descricao VARCHAR(200),
    status VARCHAR(20) CHECK (status IN ('Pendente','Concluida','Em andamento')),
    FOREIGN KEY (id_estacao) REFERENCES EstacaoClimatica(id_estacao)
);

-- Criação da tabela Alerta
CREATE TABLE Alerta (
    id_alerta INT PRIMARY KEY,
    id_estacao INT NOT NULL,
    tipo_alerta VARCHAR(50) NOT NULL,
    mensagem VARCHAR(200) NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    FOREIGN KEY (id_estacao) REFERENCES EstacaoClimatica(id_estacao)
);

----------------------------------------------------
--- PROCEDURE
-- EstacaoClimatica
CREATE OR REPLACE PROCEDURE inserir_estacao (p_id_estacao INT, p_nome VARCHAR2, p_latitude DECIMAL, p_longitude DECIMAL, p_localizacao VARCHAR2) AS BEGIN
INSERT INTO EstacaoClimatica (id_estacao, nome, latitude, longitude, localizacao_detalhada) VALUES (p_id_estacao, p_nome, p_latitude, p_longitude, p_localizacao); END;
/

CREATE OR REPLACE PROCEDURE atualizar_estacao (p_id_estacao INT, p_nome VARCHAR2, p_latitude DECIMAL, p_longitude DECIMAL, p_localizacao VARCHAR2) AS BEGIN
UPDATE EstacaoClimatica SET nome = p_nome, latitude = p_latitude, longitude = p_longitude, localizacao_detalhada = p_localizacao WHERE id_estacao = p_id_estacao; END;
/

CREATE OR REPLACE PROCEDURE excluir_estacao (p_id_estacao INT) AS BEGIN
DELETE FROM EstacaoClimatica WHERE id_estacao = p_id_estacao; END;
/

-- LeituraClimatica
CREATE OR REPLACE PROCEDURE inserir_leitura (p_id_leitura INT, p_id_estacao INT, p_data_hora TIMESTAMP, p_temperatura DECIMAL, p_umidade DECIMAL, p_status_alerta VARCHAR2) AS BEGIN
INSERT INTO LeituraClimatica (id_leitura, id_estacao, data_hora, temperatura, umidade, status_alerta) VALUES (p_id_leitura, p_id_estacao, p_data_hora, p_temperatura, p_umidade, p_status_alerta); END;
/

CREATE OR REPLACE PROCEDURE atualizar_leitura (p_id_leitura INT, p_id_estacao INT, p_data_hora TIMESTAMP, p_temperatura DECIMAL, p_umidade DECIMAL, p_status_alerta VARCHAR2) AS BEGIN
UPDATE LeituraClimatica SET id_estacao = p_id_estacao, data_hora = p_data_hora, temperatura = p_temperatura, umidade = p_umidade, status_alerta = p_status_alerta WHERE id_leitura = p_id_leitura; END;
/

CREATE OR REPLACE PROCEDURE excluir_leitura (p_id_leitura INT) AS BEGIN
DELETE FROM LeituraClimatica WHERE id_leitura = p_id_leitura; END;
/

-- Abrigo
CREATE OR REPLACE PROCEDURE inserir_abrigo (p_id_abrigo INT, p_nome VARCHAR2, p_latitude DECIMAL, p_longitude DECIMAL, p_endereco VARCHAR2, p_capacidade INT, p_contato VARCHAR2) AS BEGIN
INSERT INTO Abrigo (id_abrigo, nome, latitude, longitude, endereco, capacidade, contato) VALUES (p_id_abrigo, p_nome, p_latitude, p_longitude, p_endereco, p_capacidade, p_contato); END;
/

CREATE OR REPLACE PROCEDURE atualizar_abrigo (p_id_abrigo INT, p_nome VARCHAR2, p_latitude DECIMAL, p_longitude DECIMAL, p_endereco VARCHAR2, p_capacidade INT, p_contato VARCHAR2) AS BEGIN
UPDATE Abrigo SET nome = p_nome, latitude = p_latitude, longitude = p_longitude, endereco = p_endereco, capacidade = p_capacidade, contato = p_contato WHERE id_abrigo = p_id_abrigo; END;
/

CREATE OR REPLACE PROCEDURE excluir_abrigo (p_id_abrigo INT) AS BEGIN
DELETE FROM Abrigo WHERE id_abrigo = p_id_abrigo; END;
/

-- EventoClimatico
CREATE OR REPLACE PROCEDURE inserir_evento (p_id_evento INT, p_tipo_evento VARCHAR2, p_descricao VARCHAR2, p_data_inicio DATE, p_data_fim DATE, p_id_estacao INT) AS BEGIN
INSERT INTO EventoClimatico (id_evento, tipo_evento, descricao, data_inicio, data_fim, id_estacao) VALUES (p_id_evento, p_tipo_evento, p_descricao, p_data_inicio, p_data_fim, p_id_estacao); END;
/

CREATE OR REPLACE PROCEDURE atualizar_evento (p_id_evento INT, p_tipo_evento VARCHAR2, p_descricao VARCHAR2, p_data_inicio DATE, p_data_fim DATE, p_id_estacao INT) AS BEGIN
UPDATE EventoClimatico SET tipo_evento = p_tipo_evento, descricao = p_descricao, data_inicio = p_data_inicio, data_fim = p_data_fim, id_estacao = p_id_estacao WHERE id_evento = p_id_evento; END;
/

CREATE OR REPLACE PROCEDURE excluir_evento (p_id_evento INT) AS BEGIN
DELETE FROM EventoClimatico WHERE id_evento = p_id_evento; END;
/

-- Pessoa
CREATE OR REPLACE PROCEDURE inserir_pessoa (p_id_pessoa INT, p_nome VARCHAR2, p_documento VARCHAR2, p_contato VARCHAR2) AS BEGIN
INSERT INTO Pessoa (id_pessoa, nome, documento, contato) VALUES (p_id_pessoa, p_nome, p_documento, p_contato); END;
/

CREATE OR REPLACE PROCEDURE atualizar_pessoa (p_id_pessoa INT, p_nome VARCHAR2, p_documento VARCHAR2, p_contato VARCHAR2) AS BEGIN
UPDATE Pessoa SET nome = p_nome, documento = p_documento, contato = p_contato WHERE id_pessoa = p_id_pessoa; END;
/

CREATE OR REPLACE PROCEDURE excluir_pessoa (p_id_pessoa INT) AS BEGIN
DELETE FROM Pessoa WHERE id_pessoa = p_id_pessoa; END;
/

-- AbrigoPessoa
CREATE OR REPLACE PROCEDURE inserir_abrigopessoa (p_id_abrigo INT, p_id_pessoa INT, p_data_entrada TIMESTAMP, p_data_saida TIMESTAMP) AS BEGIN
INSERT INTO AbrigoPessoa (id_abrigo, id_pessoa, data_entrada, data_saida) VALUES (p_id_abrigo, p_id_pessoa, p_data_entrada, p_data_saida); END;
/

CREATE OR REPLACE PROCEDURE atualizar_abrigopessoa (p_id_abrigo INT, p_id_pessoa INT, p_data_entrada TIMESTAMP, p_data_saida TIMESTAMP) AS BEGIN
UPDATE AbrigoPessoa SET data_saida = p_data_saida WHERE id_abrigo = p_id_abrigo AND id_pessoa = p_id_pessoa AND data_entrada = p_data_entrada; END;
/

CREATE OR REPLACE PROCEDURE excluir_abrigopessoa (p_id_abrigo INT, p_id_pessoa INT, p_data_entrada TIMESTAMP) AS BEGIN
DELETE FROM AbrigoPessoa WHERE id_abrigo = p_id_abrigo AND id_pessoa = p_id_pessoa AND data_entrada = p_data_entrada; END;
/

-- ManutencaoEstacao
CREATE OR REPLACE PROCEDURE inserir_manutencao (
    p_id_estacao INT, 
    p_data_manutencao DATE, 
    p_descricao VARCHAR2, 
    p_status VARCHAR2
) AS 
    p_id_manutencao INT;  -- Variável para armazenar o ID gerado
BEGIN
    -- Verificar se o status é válido
    IF p_status NOT IN ('Pendente','Concluida','Em andamento') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Status inválido. Os valores permitidos são: Pendente, Concluída, Em andamento');
    END IF;

    -- Gerar id_manutencao automaticamente usando a sequência
    SELECT seq_manutencao.NEXTVAL INTO p_id_manutencao FROM dual;

    -- Inserir dados na tabela ManutencaoEstacao
    INSERT INTO ManutencaoEstacao (id_manutencao, id_estacao, data_manutencao, descricao, status) 
    VALUES (p_id_manutencao, p_id_estacao, p_data_manutencao, p_descricao, p_status);
    
    -- Confirmação de sucesso (opcional)
    DBMS_OUTPUT.PUT_LINE('Dados inseridos com sucesso! ID: ' || p_id_manutencao);
END;
/



CREATE OR REPLACE PROCEDURE atualizar_manutencao (p_id_manutencao INT, p_id_estacao INT, p_data_manutencao DATE, p_descricao VARCHAR2, p_status VARCHAR2) AS BEGIN
UPDATE ManutencaoEstacao SET id_estacao = p_id_estacao, data_manutencao = p_data_manutencao, descricao = p_descricao, status = p_status WHERE id_manutencao = p_id_manutencao; END;
/

CREATE OR REPLACE PROCEDURE excluir_manutencao (p_id_manutencao INT) AS BEGIN
DELETE FROM ManutencaoEstacao WHERE id_manutencao = p_id_manutencao; END;
/

-- Alerta
CREATE OR REPLACE PROCEDURE inserir_alerta (p_id_alerta INT, p_id_estacao INT, p_tipo_alerta VARCHAR2, p_mensagem VARCHAR2, p_data_hora TIMESTAMP) AS BEGIN
INSERT INTO Alerta (id_alerta, id_estacao, tipo_alerta, mensagem, data_hora) VALUES (p_id_alerta, p_id_estacao, p_tipo_alerta, p_mensagem, p_data_hora); END;
/

CREATE OR REPLACE PROCEDURE atualizar_alerta (p_id_alerta INT, p_id_estacao INT, p_tipo_alerta VARCHAR2, p_mensagem VARCHAR2, p_data_hora TIMESTAMP) AS BEGIN
UPDATE Alerta SET id_estacao = p_id_estacao, tipo_alerta = p_tipo_alerta, mensagem = p_mensagem, data_hora = p_data_hora WHERE id_alerta = p_id_alerta; END;
/

CREATE OR REPLACE PROCEDURE excluir_alerta (p_id_alerta INT) AS BEGIN
DELETE FROM Alerta WHERE id_alerta = p_id_alerta; END;
/

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


---  FUNÇÂO

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
SET SERVEROUTPUT ON; 
BEGIN
    -- Exemplo de chamada direta para as duas funções
    DBMS_OUTPUT.PUT_LINE('Temperatura média da estação 1: ' || temperatura_media_estacao(1));
    DBMS_OUTPUT.PUT_LINE('Total de pessoas no abrigo 1: ' || total_pessoas_abrigo(1));
END;
/

---cursor 

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

--- bloco anonimo 
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
