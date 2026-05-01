drop database if exists nutricionista;
create database nutricionista;
use nutricionista;

create table Pacientes(
	id_paciente int not null primary key unique auto_increment,
    nome varchar(100) not null,
    data_nascimento date not null,
    sexo char(1) not null,
    peso float not null,
    altura float not null);
    
create table Nutricionistas(
	id_nutricionista int not null primary key auto_increment unique,
	crn varchar(16) not null,
    nome varchar(100) not null,
	telefone varchar(13) not null unique);
    
create table Consultas(
	id_consulta int not null primary key unique auto_increment,
    id_fk_paciente int not null,
    foreign key (id_fk_paciente) references Pacientes(id_paciente),
    id_fk_nutricionista int not null,
    foreign key (id_fk_nutricionista) references Nutricionistas(id_nutricionista),
    data_consulta date not null,
    observacoes varchar(1000) null);
    
create table Dietas(
	id_dieta int not null primary key unique auto_increment,
    id_fk_paciente int not null,
    foreign key (id_fk_paciente) references Pacientes(id_paciente),
    descricao varchar(1000) not null,
    data_inicio date not null,
    data_fim date null);
    
create table Alimentos(
	id_alimento int not null primary key unique auto_increment,
    nome varchar(50) not null,
    calorias float not null,
    categoria varchar(50) not null);
    
create table Dieta_Alimento(
	id_dieta_alimento int not null primary key unique auto_increment,
    id_fk_dieta int not null,
    foreign key (id_fk_dieta) references Dietas(id_dieta),
    id_fk_alimento int not null,
    foreign key (id_fk_alimento) references Alimentos(id_alimento),
    quantidade decimal not null);
    
insert into Nutricionistas (crn, nome, telefone) values(
	"crn-5-mg-4444",
    "Jurevalda",
    "1515151515151");

insert into Nutricionistas (crn, nome, telefone) values(
	"crn-7-sp-1223",
    "João",
    "1234567897410");

insert into Nutricionistas (crn, nome, telefone) values(
	"crn-4-es-7530",
    "Maria Eduarda",
    "3397783242144");

insert into Pacientes (nome, data_nascimento, sexo, peso, altura) values(
	"Isalina Canudo",
    str_to_date("2006-10-06", '%Y-%m-%d'),
    "F",
    99.9,
    1.60);

insert into Pacientes (nome, data_nascimento, sexo, peso, altura) values(
	"Mathias Savio",
    str_to_date("2006-12-15", '%Y-%m-%d'),
    "M",
    58.8,
    1.69);

insert into Pacientes (nome, data_nascimento, sexo, peso, altura) values(
	"Liliane Silva Peneira",
    str_to_date("2006-11-06", '%Y-%m-%d'),
    "F",
    88,
    1.70);

insert into Pacientes (nome, data_nascimento, sexo, peso, altura) values(
	"Sabrina Lucifer",
    str_to_date("2007-12-25", '%Y-%m-%d'),
    "F",
    75,
    1.73);

insert into Pacientes (nome, data_nascimento, sexo, peso, altura) values(
	"Ariel",
    str_to_date("1945-04-02", '%Y-%m-%d'),
    "I",
    123.78,
    1.65);
    
insert into Consultas (id_fk_paciente, id_fk_nutricionista, data_consulta, observacoes) values(
	1,
    3,
    curdate(),
    "Primeira consulta da paciente, ela apresenta sobre peso.");

insert into Consultas (id_fk_paciente, id_fk_nutricionista, data_consulta, observacoes) values(
	2,
    1,
    curdate(),
    "O paciente apresenta desnutrição extrema, iniciará com medicamentos para aumenta a fome.");

insert into Consultas (id_fk_paciente, id_fk_nutricionista, data_consulta, observacoes) values(
	4,
    2,
    curdate(),
    "");

insert into Consultas (id_fk_paciente, id_fk_nutricionista, data_consulta, observacoes) values(
	5,
    3,
    curdate(),
    "A pessoa apresenta sobrepeso, mas está sendo investigado o motivo.");

insert into Consultas (id_fk_paciente, id_fk_nutricionista, data_consulta, observacoes) values(
	5,
    3,
    curdate(),
    "A paciente apresenta desergulação hormonal, será encaminhada a uma endocrina.");

insert into Alimentos (nome, calorias, categoria) values(
	"Bolo de avéia",
    123,
    "carboidrato");

insert into Alimentos (nome, calorias, categoria) values(
	"Laranja",
    18,
    "Vitamina C");

insert into Alimentos (nome, calorias, categoria) values(
	"Peito de frango",
    "36",
    "Proteína");

insert into Alimentos (nome, calorias, categoria) values(
	"Barra de ceral",
    256,
    "Carboidrato");

insert into Alimentos (nome, calorias, categoria) values(
	"Ovo",
    8,
    "Proteína");

insert into Alimentos (nome, calorias, categoria) values(
	"Sorvete diet",
    506,
    "Gordura");

select distinct categoria
from Alimentos;

select * 
from Pacientes;

select * 
from Pacientes
order by nome asc;

select *
from Alimentos
order by calorias desc;

select * 
from Pacientes
where peso > 80;

select p.nome, c.data_consulta, n.nome
from Pacientes p
	inner join Consultas c
		on p.id_paciente = c.id_consulta
	inner join Nutricionistas n
		on p.id_paciente = n.id_nutricionista;

select count(*) as quant_paciente
from Pacientes;

select *
from Alimentos
where categoria = "Proteína"
order by calorias desc;
