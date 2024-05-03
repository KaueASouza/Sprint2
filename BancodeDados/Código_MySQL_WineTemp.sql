-- Criado Por Rebeca Roque RA:03241032
-- Criado Por Luiz Gustavo Dantas RA:03241060

-- Os comentários acima fornecem informações sobre os autores e o objetivo do script.

-- Cria o banco de dados WineTemp
create database WineTemp;

drop database WineTemp;

-- Seleciona o banco de dados WineTemp para uso
use WineTemp;

-- Cria a tabela 'empresa' para armazenar informações sobre as empresas
create table empresa(
    idEmpresa int primary key auto_increment,
    nome varchar(45), -- Nome da empresa
    cnpj char(14) not null, -- Número do CNPJ da empresa
    nomefantasia varchar(45), -- Nome fantasia da empresa
    razao_social varchar(45) -- Razão social da empresa
);

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

-- Descreve a estrutura da tabela 'barris_vinho'
desc empresa;

-- Cria a tabela 'barris_vinho' para armazenar informações sobre os barris de vinho
create table barris_vinho(
    idbarris_vinho int primary key auto_increment, -- Chave primária auto incrementada para identificar cada barril
    tipo_vinho varchar(45), -- Tipo de vinho armazenado no barril
    capacidade_barril int, -- Capacidade do barril em litros
    tipoSensor varchar(45), -- Tipo do sensor que será utilizado
    barris_vinhoco varchar(45), -- Código ou identificador do barril
    localizacao_adega varchar(45), -- Localização do barril na adega
    ultima_manutencao datetime, -- Data da última manutenção do barril
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

-- Cria a tabela 'historico' para armazenar o histórico de leituras de temperatura e umidade
create table historico (
    idHistorico int primary key auto_increment, -- Chave primária auto incrementada para identificar cada registro
    data_hora datetime default current_timestamp, -- Data e hora da leitura
    umidade float, -- Valor da umidade captado no sensor
    temperatura float -- Valor da temperatura captado no sensor
);

-- Insere dados na tabela 'empresa'
insert into empresa values
(default, 'SPTECH', 17694580000167, 'DE SAO PAULO TECH', 'SAO PAULO TECH TECNOLOGIA EDUCACIONAL LTDA' ),
(default, 'Batasiolo', '09813204000469', 'WINE 2B', 'W2W E-COMMERCE DE VINHOS S/A');

-- Seleciona todos os registros da tabela 'empresa'
select * from empresa;

-- Seleciona campos específicos da tabela 'empresa' com rótulos personalizados
select idEmpresa as 'ID EMPRESA', nome as 'NOME DA EMPRESA', cnpj as 'CNPJ', nomefantasia as 'NOME FANTASIA',  razao_social as 'RAZÃO SOCIAL' from empresa;

-- Descreve a estrutura da tabela 'usuario'
desc usuario;

-- Insere dados na tabela 'usuario'
insert into usuario values
(default, 1, 'Fernando Brandão', 'fernanado.brandao@sptech.school', 'brandao123'),
(default, 2,'Roberto Almeida', 'roberto.almeida@sptech.school', '070381');

-- Seleciona todos os registros da tabela 'usuario'
select * from usuario;

-- Descreve a estrutura da tabela 'barris_vinho'
desc barris_vinho;

-- Insere dados na tabela 'barris_vinho'
insert into  barris_vinho values
(default, 'Vinho Tinto', 225000, 'DHT11','5901234123', 'Avenida Piraporinha - 1205', '2024-05-12', 1),
(default, 'Vinho Branco', 210000, 'DHT11','5901234123', 'Avenida Lazar Segall - 554', '2024-05-25', 2);

-- Seleciona todos os registros da tabela 'barris_vinho'
select * from barris_vinho;

-- Descreve a estrutura da tabela 'configuracoes'
desc configuracoes;

-- Insere dados na tabela 'configuracoes'
insert into configuracoes values 
(default, '21.3', '12.8', 74, 45, 1),
(default, '19.8', '10.4', 62, 58, 2);

-- Seleciona todos os registros da tabela 'configuracoes'
select * from configuracoes;

-- Descreve a estrutura da tabela 'historico'
desc historico;

-- Insere dados na tabela 'historico'
insert into historico values 
(default, '2024-05-02 10:29', 58, 17.4),
(default, '2024-05-01 23:48', 63, 13.9);

-- Seleciona todos os registros da tabela 'historico'
select * from historico;

   -- A consulta está juntando informações das tabelas empresa, usuario, barris_vinho, configuracoes e historico.
   -- São utilizadas as chaves estrangeiras para conectar as tabelas de forma correta.
   -- Os aliases são usados para dar nomes mais legíveis às colunas no resultado da consulta.
select 
    empresa.idEmpresa,
    empresa.nome as 'Nome da Empresa',
    empresa.cnpj as 'CNPJ',
    empresa.nomefantasia as 'Nome Fantasia',
    empresa.razao_social as 'Razão Social',
    usuario.nome_usuario as 'Nome do Usuário',
    usuario.email as 'E-mail',
    usuario.senha as 'Senha',
    barris_vinho.tipo_vinho as 'Tipo de Vinho',
    barris_vinho.capacidade_barril as 'Capacidade do Barril (litros)',
    barris_vinho.tipoSensor as 'Tipo de Sensor',
    barris_vinho.barris_vinhoco as 'Código ou Identificador do Barril',
    barris_vinho.localizacao_adega as 'Localização na Adega',
    barris_vinho.ultima_manutencao as 'Última Manutenção',
    configuracoes.limiteTempSuperior as 'Limite Superior de Temperatura',
    configuracoes.limiteTempinferior as 'Limite Inferior de Temperatura',
    configuracoes.limiteUmidadesuperior as 'Limite Superior de Umidade',
    configuracoes.limiteUmidadeinferior as 'Limite Inferior de Umidade',
    historico.data_hora as 'Data e Hora da Leitura',
    historico.umidade as 'Umidade',
    historico.temperatura as 'Temperatura'
from 
    empresa
join
    usuario on empresa.idEmpresa = usuario.fkempresa
join
    barris_vinho on empresa.idEmpresa = barris_vinho.fkempresa
join
    configuracoes on barris_vinho.idbarris_vinho = configuracoes.fkbarril
join
    historico on barris_vinho.idbarris_vinho = historico.idHistorico;    


-- A consulta está juntando informações das tabelas empresa, barris_vinho e historico.
-- São utilizadas as chaves estrangeiras para conectar as tabelas de forma correta.
-- Os aliases são usados para dar nomes mais legíveis às colunas no resultado da consulta.
select
    empresa.idEmpresa,
    empresa.nome as 'Nome da Empresa',
    empresa.cnpj as 'CNPJ',
    empresa.nomefantasia as 'Nome Fantasia',
    empresa.razao_social as 'Razão Social',
    barris_vinho.tipo_vinho as 'Tipo de Vinho',
    barris_vinho.capacidade_barril as 'Capacidade do Barril (litros)',
    barris_vinho.tipoSensor as 'Tipo de Sensor',
    barris_vinho.barris_vinhoco as 'Código ou Identificador do Barril',
    barris_vinho.localizacao_adega as 'Localização na Adega',
    barris_vinho.ultima_manutencao as 'Última Manutenção',
    historico.data_hora as 'Data e Hora da Leitura',
    historico.umidade as 'Umidade',
    historico.temperatura as 'Temperatura'
from 
    empresa
join 
    barris_vinho on empresa.idEmpresa = barris_vinho.fkempresa
join 
    historico on barris_vinho.idbarris_vinho = historico.idHistorico;



-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- (TABELA TEMPERATURA E UMIDADE NÃO UTLIZADA PARA O WEB-DATA-VIZ)
-- Cria a tabela 'temperatura_umidade' para armazenar as leituras de temperatura e umidade
-- create table sensor(
  --  idsensor int primary key auto_increment, -- Chave primária auto incrementada para identificar cada leitura
   -- temperatura decimal (4,2), -- Valor da temperatura
   -- umidade float, -- Valor da umidade
   -- fkbarris int, -- Chave estrangeira referenciando o barril de vinho associado à leitura
   -- constraint TempUmiEmpresa foreign key (fkbarris) references empresa (idEmpresa) -- Restrição de chave estrangeira referenciando a tabela 'empresa'
