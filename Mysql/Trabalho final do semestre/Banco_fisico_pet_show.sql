drop database if exists DB_pet_show;
create database DB_pet_show;
use DB_pet_show;

create table Pessoa(
	id_pessoa int auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100) not null);

create table Telefone (
	id_telefone int auto_increment primary key,
    tipo enum("TEL", "CEL", "COM"),
    numero char(11),
    id_fk_pessoa int null);

create table Endereco(
	id_endereco int primary key auto_increment,
    estado char(2) not null,
    cidade varchar(100) not null,
    bairro varchar(100) not null,
    rua varchar(100) not null,
    numero int not null,
    complemento varchar(100) null,
    id_fk_pessoa int not null);

create table Produto(
	id_produto int primary key auto_increment,
    nome varchar(100),
    preco_unitario float(10,2),
    descricao varchar(1000),
    imagem varchar(500));

create table Fornecedor(
	id_fk_pessoa int not null unique,
    CNPJ char(14) not null);
    
create table Cliente(
	id_fk_pessoa int not null unique,
    CPF char(11),
    data_cadastro date not null,
    data_nascimnento date not null,
    sexo enum("F", "M", "I"));

create table FornecedorProduto(
	id_fornecedor_produto int primary key auto_increment,
    id_fk_produto int not null,
    id_fk_fornecedor int not null,
    quantidade int not null);

create table ClienteProduto(
	id_cliente_produto int primary key auto_increment,
    id_fk_produto int not null,
    id_fk_cliente int not null,
    preco_total float(10,2));

alter table Telefone 
add constraint Id_fk_telefone_pessoa
foreign key (id_fk_pessoa)
references Pessoa(id_pessoa);

alter table Endereco
add constraint Id_fk_endereco_pessoa
foreign key (id_fk_pessoa)
references Pessoa(id_pessoa);

alter table Fornecedor
add constraint Id_fk_fornecedor_pessoa
foreign key (id_fk_pessoa)
references Pessoa(id_pessoa);

alter table Cliente
add Constraint Id_fk_cliente_pessoa
foreign key (id_fk_pessoa)
references Pessoa(id_pessoa);

alter table FornecedorProduto
add constraint Id_fk_FP_produto
foreign key (id_fk_produto)
references Produto(id_produto),
add constraint Id_fk_FP_fornecedor
foreign key (id_fk_fornecedor)
references Pessoa(id_pessoa);

alter table ClienteProduto
add constraint Id_fk_CP_produto
foreign key (id_fk_produto)
references Produto(id_produto),
add constraint Id_fk_CP_cliente
foreign key (id_fk_cliente)
references Pessoa(id_pessoa);