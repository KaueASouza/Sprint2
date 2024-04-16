-- Criado Por Rebeca Roque RA:03241032
-- Criado Por Luiz Gustavo Dantas RA:03241060

-- Cria o banco de dados WineTemp
create database WineTemp;

-- Seleciona o banco de dados WineTemp para uso
use WineTemp;

-- Cria a tabela 'usuario' para armazenar informações sobre os usuários do sistema
create table usuario(
    idUsuario int auto_increment, -- Chave primária auto incrementada para identificar cada usuário
    fkempresa int, -- Chave estrangeira referenciando a empresa a que o usuário pertence
    constraint pkcomposta_usuario primary key (idUsuario, fkempresa), -- Chave primária composta
    nome_usuario varchar(45), -- Nome do usuário
    email varchar(45), -- Endereço de e-mail do usuário
    senha varchar(15), -- Senha do usuário
    constraint UsuarioEmpresa foreign key (fkempresa) references empresa (idEmpresa)
    );
    

-- Descreve a estrutura da tabela 'usuario'
desc usuario;

-- Cria a tabela 'empresa' para armazenar informações sobre as empresas
create table empresa(
    nome varchar(45), -- Nome da empresa
    cnpj char(14) not null, -- Número do CNPJ da empresa
    nomefantasia varchar(45), -- Nome fantasia da empresa
    razao_social varchar(45) -- Razão social da empresa
);

-- Adiciona uma coluna 'idEmpresa' à tabela 'empresa' para torná-la uma chave primária auto incrementada
alter table empresa add column idEmpresa int primary key auto_increment;

-- Descreve a estrutura da tabela 'barris_vinho'
desc empresa;

-- Cria a tabela 'barris_vinho' para armazenar informações sobre os barris de vinho
create table barris_vinho(
    idbarris_vinho int primary key auto_increment, -- Chave primária auto incrementada para identificar cada barril
    tipo_vinho varchar(45), -- Tipo de vinho armazenado no barril
    capacidade_barril int, -- Capacidade do barril em litros
    barris_vinhoco varchar(45), -- Código ou identificador do barril
    localizacao_adega varchar(45), -- Localização do barril na adega
    ultima_manutencao varchar (45), -- Data da última manutenção do barril
    fkempresa int, -- Chave estrangeira referenciando a empresa proprietária do barril
    constraint BarrilEmpresa foreign key (fkempresa) references empresa (idEmpresa) -- Restrição de chave estrangeira referenciando a tabela 'empresa'
);

-- Cria a tabela 'configuracoes' para armazenar as configurações de temperatura e umidade
create table configuracoes(
    idConfiguracoes int primary key auto_increment, -- Chave primária auto incrementada para identificar cada conjunto de configurações
    limiteTempSuperior decimal (4,2), -- Limite superior de temperatura
    limiteTempinferior decimal (4,2), -- Limite inferior de temperatura
    limiteUmidadesuperior float, -- Limite superior de umidade
    limiteUmidadeinferior float, -- Limite inferior de umidade
    fkbarril int, -- Chave estrangeira referenciando o barril de vinho associado às configurações
    constraint ConfigEmpresa foreign key (fkbarril) references empresa (idEmpresa) -- Restrição de chave estrangeira referenciando a tabela 'empresa'
);

-- Cria a tabela 'temperatura_umidade' para armazenar as leituras de temperatura e umidade
create table sensor(
    idsensor int primary key auto_increment, -- Chave primária auto incrementada para identificar cada leitura
    tipoSensor varchar(45), -- Tipo do sensor que será utilizado
    temperatura decimal (4,2), -- Valor da temperatura
    umidade float, -- Valor da umidade
    fkbarris int, -- Chave estrangeira referenciando o barril de vinho associado à leitura
    constraint TempUmiEmpresa foreign key (fkbarris) references empresa (idEmpresa) -- Restrição de chave estrangeira referenciando a tabela 'empresa'
);

create table historico (
idHistorico int auto_increment,
fkSensor int, -- Chave estrangeira refenciando as leitura captadas pelo sensor informado na tabela 'sensor' 
constraint pkcomposta_historica primary key (idHistorico, fkSensor),  -- Chave primária composta
data_hora date, -- Data e hora da leitura
umidade float, -- Valor da umidade captado no sensor
temperatura decimal(4.2), -- Valor da temperatura captado no sensor
constraint SensorHistorico foreign key (fkSensor) references sensor(idsensor) -- Restrição de chave estrangeira referenciando a tabela ''
);


