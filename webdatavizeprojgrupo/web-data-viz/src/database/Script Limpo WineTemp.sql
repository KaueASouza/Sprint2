create database WineTemp;

use WineTemp;

create table empresa(
    idEmpresa int primary key auto_increment,
    nome varchar(45),
    cnpj char(14) not null,
    nomefantasia varchar(45),
    razao_social varchar(45)
);

create table usuario(
    idUsuario int primary key auto_increment,
    nome_usuario varchar(45),
    email varchar(45),
    senha varchar(15),
    fkempresa int,
    constraint fkEmpresa foreign key (fkempresa) 
    references empresa(idEmpresa)
);


alter table usuario add column tipoUsuario char(2);

alter table usuario add constraint chkTipo
check (tipoUsuario in ('n1','n2','n3'));

desc usuario;

desc empresa;

create table barris_vinho(
    idbarris_vinho int primary key auto_increment,
    tipo_vinho varchar(45),
    capacidade_barril int,
    tipoSensor varchar(45),
    barris_vinhoco varchar(45),
    localizacao_adega varchar(45),
    ultima_manutencao datetime,
    fkempresa int,
    constraint BarrilEmpresa foreign key (fkempresa) references empresa (idEmpresa)
);

create table configuracoes(
    idConfiguracoes int primary key auto_increment,
    limiteTempSuperior decimal (4,2),
    limiteTempinferior decimal (4,2),
    limiteUmidadesuperior float,
    limiteUmidadeinferior float,
    fkbarril int,
    constraint ConfigEmpresa foreign key (fkbarril) references empresa (idEmpresa)
);

create table historico (
    idHistorico int primary key auto_increment,
    data_hora datetime default current_timestamp,
    umidade float,
    temperatura float
);

insert into empresa values
(default, 'SPTECH', 17694580000167, 'DE SAO PAULO TECH', 'SAO PAULO TECH TECNOLOGIA EDUCACIONAL LTDA' ),
(default, 'Batasiolo', '09813204000469', 'WINE 2B', 'W2W E-COMMERCE DE VINHOS S/A');

select * from empresa;

select idEmpresa as 'ID EMPRESA', nome as 'NOME DA EMPRESA', cnpj as 'CNPJ', nomefantasia as 'NOME FANTASIA',  razao_social as 'RAZÃO SOCIAL' from empresa;

desc usuario;

/* insert into usuario values
(default, 1, 'Fernando Brandão', 'fernanado.brandao@sptech.school', 'brandao123'),
(default, 2,'Roberto Almeida', 'roberto.almeida@sptech.school', '070381');*/

select * from usuario;

desc barris_vinho;

insert into  barris_vinho values
(default, 'Vinho Tinto', 225000, 'DHT11','5901234123', 'Avenida Piraporinha - 1205', '2024-05-12', 1),
(default, 'Vinho Branco', 210000, 'DHT11','5901234123', 'Avenida Lazar Segall - 554', '2024-05-25', 2);

select * from barris_vinho;

desc configuracoes;

insert into configuracoes values 
(default, '21.3', '12.8', 74, 45, 1),
(default, '19.8', '10.4', 62, 58, 2);

select * from configuracoes;

desc historico;

insert into historico values 
(default, '2024-05-02 10:29', 58, 17.4),
(default, '2024-05-01 23:48', 63, 13.9);

select * from historico;

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
    
    select* from empresa;
