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
CREATE OR REPLACE PROCEDURE inserir_manutencao (p_id_manutencao INT, p_id_estacao INT, p_data_manutencao DATE, p_descricao VARCHAR2, p_status VARCHAR2) AS BEGIN
INSERT INTO ManutencaoEstacao (id_manutencao, id_estacao, data_manutencao, descricao, status) VALUES (p_id_manutencao, p_id_estacao, p_data_manutencao, p_descricao, p_status); END;
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
