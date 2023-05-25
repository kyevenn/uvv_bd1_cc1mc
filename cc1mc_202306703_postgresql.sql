
CREATE TABLE produtos (
                produto_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                preco_unitario NUMERIC(10,2),
                detalhes BYTEA,
                imagem BYTEA,
                imagem_mime_type VARCHAR(512),
                imagem_arquivo VARCHAR(512),
                imagem_charset VARCHAR(512),
                imagem_ultima_atualizacao DATE,
                CONSTRAINT pk_produto PRIMARY KEY (produto_id)
);
COMMENT ON TABLE produtos IS 'Tabela dos produtos cadastrados';
COMMENT ON COLUMN produtos.produto_id IS 'PK da tabela, armazena o ID do produto.';
COMMENT ON COLUMN produtos.nome IS 'Coluna armazena o nome de cada produto.';
COMMENT ON COLUMN produtos.preco_unitario IS 'Coluna armazena o preço unitário de cada produto.';
COMMENT ON COLUMN produtos.detalhes IS 'Coluna armazena os detalhes de cada produto.';
COMMENT ON COLUMN produtos.imagem IS 'Coluna armazena a imagem de cada produto.';
COMMENT ON COLUMN produtos.imagem_mime_type IS 'Coluna armazena o tipo e o subtipo do arquivo imagem.';
COMMENT ON COLUMN produtos.imagem_arquivo IS 'Coluna armazena o arquivo da imagem.';
COMMENT ON COLUMN produtos.imagem_charset IS 'Coluna armazena o charset da imagem.';
COMMENT ON COLUMN produtos.imagem_ultima_atualizacao IS 'Coluna armazena a data da última atualização da imagem do produto.';


CREATE TABLE clientes (
                cliente_id NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone2 VARCHAR(20),
                telefone3 VARCHAR(20),
                CONSTRAINT pk_cliente PRIMARY KEY (cliente_id)
);
COMMENT ON TABLE clientes IS 'Tabela que identifica os dados dos clientes .';
COMMENT ON COLUMN clientes.cliente_id IS 'PK da tabela identifica o ID de cada cliente.';
COMMENT ON COLUMN clientes.email IS 'E-mail de cada cliente cadastrado.';
COMMENT ON COLUMN clientes.nome IS 'Identifica o nome completo de cada cliente.';
COMMENT ON COLUMN clientes.telefone1 IS 'Primeiro telefone de contato para o cliente.';
COMMENT ON COLUMN clientes.telefone2 IS 'Segundo telefone de contato para o cliente.';
COMMENT ON COLUMN clientes.telefone3 IS 'Terceiro telefone de contato para o cliente.';


CREATE TABLE lojas (
                loja_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                endereco_web VARCHAR(100),
                endereco_fisico VARCHAR(512),
                latitude NUMERIC,
                longitude NUMERIC,
                logo BYTEA,
                logo_mime_type VARCHAR(512),
                logo_arquivo VARCHAR(512),
                logo_charset VARCHAR(512),
                logo_ultima_atualizacao DATE,
                CONSTRAINT pk_loja PRIMARY KEY (loja_id)
);
COMMENT ON TABLE lojas IS 'Tabela que mostra os dados das lojas.';
COMMENT ON COLUMN lojas.loja_id IS 'PK da tabela que identifica o ID da loja.';
COMMENT ON COLUMN lojas.nome IS 'Coluna mostra o nome da loja cadastrada.';
COMMENT ON COLUMN lojas.endereco_web IS 'Coluna mostra o endereço web registrado da loja.';
COMMENT ON COLUMN lojas.endereco_fisico IS 'Coluna mostra o endereço físico cadastrado da loja.';
COMMENT ON COLUMN lojas.latitude IS 'Coluna mostra a latitude geográfica da loja cadastrada.';
COMMENT ON COLUMN lojas.longitude IS 'Coluna mostra a longitude geográfica da loja cadastrada.';
COMMENT ON COLUMN lojas.logo IS 'Coluna armazena a logo da loja cadastrada.';
COMMENT ON COLUMN lojas.logo_mime_type IS 'btipo do arquivo imagem.';
COMMENT ON COLUMN lojas.logo_arquivo IS 'Coluna armazena o arquivo da logo.';
COMMENT ON COLUMN lojas.logo_charset IS 'Coluna armazena o charset da logo, desde a ASCII para UTF-8.';
COMMENT ON COLUMN lojas.logo_ultima_atualizacao IS 'Coluna armazena a data da última atualização da logo.';


CREATE TABLE envios (
                envio_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                CONSTRAINT pk_envio PRIMARY KEY (envio_id)
);
COMMENT ON TABLE envios IS 'Tabela armazena os dados e envios de pedidos do cliente.';
COMMENT ON COLUMN envios.envio_id IS 'PK da tabela com o ID de cada envio.';
COMMENT ON COLUMN envios.loja_id IS 'PK da tabela que identifica o ID da loja.';
COMMENT ON COLUMN envios.cliente_id IS 'PK da tabela identifica o ID de cada cliente.';
COMMENT ON COLUMN envios.endereco_entrega IS 'Coluna mostra o endereço de entrega do pedido enviado.';
COMMENT ON COLUMN envios.status IS 'Coluna mostra o status do pedido enviado.';


CREATE TABLE estoques (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                CONSTRAINT pk_estoque PRIMARY KEY (estoque_id)
);
COMMENT ON TABLE estoques IS 'Tabela armazena produtos e quantidades de produtos em estoque.';
COMMENT ON COLUMN estoques.estoque_id IS 'PK da tabela com o ID do estoque.';
COMMENT ON COLUMN estoques.loja_id IS 'PK da tabela que identifica o ID da loja.';
COMMENT ON COLUMN estoques.produto_id IS 'Coluna armazena o ID do produto.';
COMMENT ON COLUMN estoques.quantidade IS 'Coluna armazena a quantidade de produtos.';


CREATE TABLE pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                data_hora TIMESTAMP NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                status VARCHAR(15) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                CONSTRAINT pk_pedido PRIMARY KEY (pedido_id)
);
COMMENT ON TABLE pedidos IS 'Tabela de pedidos feitos pela tabela Clientes.';
COMMENT ON COLUMN pedidos.pedido_id IS 'te.';
COMMENT ON COLUMN pedidos.data_hora IS 'Coluna registra a data e hora do pedido feito.';
COMMENT ON COLUMN pedidos.cliente_id IS 'FK da tabela identifica o ID de cada cliente.';
COMMENT ON COLUMN pedidos.status IS 'Coluna da tabela identifica o status do pedido.';
COMMENT ON COLUMN pedidos.loja_id IS 'FK da tabela identifica o ID da loja.';


CREATE TABLE pedidos_itens (
                pedido_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                numero_da_linha VARCHAR(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                envio_id NUMERIC(38),
                CONSTRAINT pk_pedidos_itens PRIMARY KEY (pedido_id, produto_id)
);
COMMENT ON TABLE pedidos_itens IS 'Tabela mostra os itens dos pedidos da tabela envios.';
COMMENT ON COLUMN pedidos_itens.pedido_id IS 'PFK da tabela, armazena o ID de cada pedido.';
COMMENT ON COLUMN pedidos_itens.produto_id IS 'PFK da tabela, armazena o ID de cada produto.';
COMMENT ON COLUMN pedidos_itens.quantidade IS 'Coluna armazena a quantidade de produtos de um pedido.';
COMMENT ON COLUMN pedidos_itens.numero_da_linha IS 'Coluna armazena o número da linha do pedido.';
COMMENT ON COLUMN pedidos_itens.preco_unitario IS 'Coluna armazena o preço unitário de cada produto.';
COMMENT ON COLUMN pedidos_itens.envio_id IS 'PK da tabela com o ID de cada envio.';


ALTER TABLE estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
