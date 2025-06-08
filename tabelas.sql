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
    status VARCHAR(20) CHECK (status IN ('Pendente', 'Concluida', 'Em andamento')),
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
