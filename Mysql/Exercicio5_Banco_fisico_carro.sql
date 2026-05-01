drop database if exists Projeto;
create database Projeto;
use Projeto;

create table Carro(
	Id_carro int,
    Preco float(10,2) not null,
    Tamanho float (10,2) not null,
    Quant_lugares int not null,
    Quant_portas int not null,
    Data_fabricacao date not null);

create table Dono(
	Id_dono int,
    Id_fk_carro int unique not null,
    Data_nascimento date not null,
    Nome varchar(100) not null,
    CPF char(11) not null,
    Sexo char(1) not null);

create table Marca(
	Id_marca int,
    Id_fk_carro int null,
    Modelo varchar(30) not null,
    Nome varchar (30) not null);

create table Cor(
	Id_cor int,
    Hexadecimal varchar(6) not null,
    Nome varchar(30) null);

create table Carro_Cor(
    Id_fk_carro int not null,
    Id_fk_cor int null);

alter table Carro 
add constraint Id_carro
primary key(Id_carro);

alter table Dono 
add constraint Id_dono
primary key(Id_dono),
add constraint Fk_carro_Dono
foreign key (Id_fk_carro)
references Carro(Id_carro);

alter table Marca
add constraint Id_Marca
primary key(Id_marca),
add constraint Fk_carro_marca
foreign key (Id_fk_carro) 
references Carro(Id_carro);

alter table Cor
add constraint Id_cor
primary key (Id_cor);

alter table Carro_Cor
add constraint Id_carro_cor
primary key(Id_fk_carro, Id_fk_cor),
add constraint Fk_carro_carro_cor_carro
foreign key (Id_fk_carro) 
references Carro(Id_carro),
add constraint Fk_carro_carro_cor_cor
foreign key (Id_fk_cor)
references Cor(Id_cor);