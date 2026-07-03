CREATE TABLE IF NOT EXISTS usuarios (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    nivel_acesso VARCHAR(20) NOT NULL DEFAULT 'usuario'
        CHECK (nivel_acesso IN ('usuario', 'administrador')),
    telefone VARCHAR(20),
    cpf VARCHAR(14),
    cep VARCHAR(8),
    data_nascimento DATE
);

CREATE TABLE IF NOT EXISTS voos (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    origem VARCHAR(100) NOT NULL,
    origem_uf VARCHAR(2) NOT NULL,
    destino VARCHAR(100) NOT NULL,
    destino_uf VARCHAR(2) NOT NULL,
    data_viagem DATE NOT NULL,
    preco DECIMAL(10,2) NOT NULL CHECK (preco >= 0),
    qtd_passagem INT NOT NULL CHECK (qtd_passagem >= 0)
);

CREATE TABLE IF NOT EXISTS reservas (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usuario_id INT NOT NULL,
    passagem_id INT NOT NULL,
    data_compra TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_reserva_usuario
        FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_reserva_voo
        FOREIGN KEY (passagem_id)
        REFERENCES voos(id)
        ON DELETE RESTRICT
);

CREATE INDEX IF NOT EXISTS idx_reservas_usuario_id  ON reservas(usuario_id);
CREATE INDEX IF NOT EXISTS idx_reservas_passagem_id ON reservas(passagem_id);
