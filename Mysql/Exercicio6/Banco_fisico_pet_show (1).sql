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
    data_nascimento date not null,
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

drop database if exists BK_DB_pet_show;
create database BK_DB_pet_show;
use BK_DB_pet_show;

create table BK_Pessoa(
	BK_id_pessoa int auto_increment primary key,
    id_pessoa int not null,
    nome varchar(100) not null,
    email varchar(100) not null,
    status char(1) not null,
    user varchar(50) not null);

create table BK_Telefone (
	BK_id_telefone int auto_increment primary key,
    id_telefone int not null,
    tipo enum("TEL", "CEL", "COM"),
    numero char(11),
    id_fk_pessoa int null,
    status char(1) not null,
    user varchar(50) not null);

create table BK_Endereco(
	BK_id_endereco int primary key auto_increment,
    estado char(2) not null,
    cidade varchar(100) not null,
    bairro varchar(100) not null,
    rua varchar(100) not null,
    numero int not null,
    complemento varchar(100) null,
    id_fk_pessoa int not null,
    status char(1) not null,
    user varchar(50) not null);

create table BK_Produto(
	BK_id_produto int primary key auto_increment,
    id_produto int not null,
    nome varchar(100),
    preco_unitario float(10,2),
    descricao varchar(1000),
    imagem varchar(500),
    status char(1) not null,
    user varchar(50) not null);

create table BK_Fornecedor(
	BK_id_pessoa int primary key auto_increment,
    id_fk_pessoa int not null,
    CNPJ char(14) not null,
    status char(1) not null,
    user varchar(50) not null);
    
create table BK_Cliente(
	BK_id_pessoa int auto_increment primary key,
    id_fk_pessoa int not null,
    CPF char(11),
    data_cadastro date not null,
    data_nascimento date not null,
    sexo enum("F", "M", "I"),
    status char(1) not null,
    user varchar(50) not null);

create table BK_FornecedorProduto(
	BK_id_fornecedor_produto int primary key auto_increment,
    id_fornecedor_produto int not null,
    id_fk_produto int not null,
    id_fk_fornecedor int not null,
    quantidade int not null,
    status char(1) not null,
    user varchar(50) not null);

create table BK_ClienteProduto(
	BK_id_cliente_produto int primary key auto_increment,
    id_cliente_produto int not null,
    id_fk_produto int not null,
    id_fk_cliente int not null,
    preco_total float(10,2),
    status char(1) not null,
    user varchar(50) not null);

use DB_pet_show;

delimiter $

create trigger Salvando_BK_pessoa
after insert
on Pessoa
for each row
begin 
	insert into BK_DB_pet_show.BK_Pessoa values (null, new.id_pessoa, new.nome, new.email, "C", localHost());
end$

create trigger Salvando_BK_telefone
after insert
on Telefone
for each row
begin
	insert into BK_DB_pet_show.BK_Telefone values (null, new.id_telefone, new.tipo, new.numero, new.id_fk_pessoa, "C", localHost());
end$

create trigger Salvando_BK_endereco
after insert
on Endereco
for each row
begin
	insert into BK_DB_pet_show.BK_Endereco values(null, new.id_endereco, new.estado, new.cidade, new.bairro, new.rua, new.numero, 
		new.complemento, new.id_fk_pessoa, "C", localHost());
end$

create trigger Salvando_BK_produto
after insert
on Produto
for each row
begin
	insert into BK_DB_pet_show.BK_Produto values(null, new.id_produto, new.nome, new.preco_unitario, new.descricao,
		new.imagem, "C", localHost());
end$

create trigger Salvando_BK_fornecedor
after insert
on Fornecedor
for each row
begin
	insert into BK_DB_pet_show.BK_Fornecedor values(null, new.id_fk_pessoa, new.CNPJ, "C", localHost());
end$

create trigger Salvando_BK_cliente
after insert
on Cliente
for each row
begin
	insert into BK_DB_pet_show.BK_Cliente values(null, new.id_fk_pessoa, new.CPF, new.data_cadastro, new.data_nascimento,
		new.sexo, "C", localHost());
end$

create trigger Salvando_BK_FP
after insert
on FornecedorProduto
for each row
begin
	insert into BK_DB_pet_show.BK_FornecedorProduto values (null, new.id_fornecedor_produto, new.id_fk_produto, new.id_fk_fornecedor, 
		new.quantidade, "C", localHost());
end$

create trigger Salvando_BK_CP
after insert
on ClienteProduto
for each row
begin
	insert into BK_DB_pet_show.BK_ClienteProduto values (null, new.id_cliente_produto, new.id_fk_produto, new.id_fk_cliente, new.preco_total, "C", localHost());
end$

create trigger Alterando_BK_pessoa
after update
on Pessoa
for each row
begin 
	insert into BK_DB_pet_show.BK_Pessoa values (null, new.id_pessoa, new.nome, new.email, "U", localHost());
end$

create trigger Alterando_BK_telefone
after update
on Telefone
for each row
begin
	insert into BK_DB_pet_show.BK_Telefone values (null, new.id_telefone, new.tipo, new.numero, new.id_fk_pessoa, "U", localHost());
end$

create trigger Alterando_BK_endereco
after update
on Endereco
for each row
begin
	insert into BK_DB_pet_show.BK_Endereco values(null, new.id_endereco, new.estado, new.cidade, new.bairro, new.rua, new.numero, 
		new.complemento, new.id_fk_pessoa, "U", localHost());
end$

create trigger Alterando_BK_produto
after update
on Produto
for each row
begin
	insert into BK_DB_pet_show.BK_Produto values(null, new.id_produto, new.nome, new.preco_unitario, new.descricao,
		new.imagem, "U", localHost());
end$

create trigger Alterando_BK_fornecedor
after update
on Fornecedor
for each row
begin
	insert into BK_DB_pet_show.BK_Fornecedor values(null, new.id_fk_pessoa, new.CNPJ, "U", localHost());
end$

create trigger Alterando_BK_cliente
after update
on Cliente
for each row
begin
	insert into BK_DB_pet_show.BK_Cliente values(null, new.id_fk_pessoa, new.CPF, new.data_cadastro, new.data_nascimento,
		new.sexo, "U", localHost());
end$

create trigger Alterando_BK_FP
after update
on FornecedorProduto
for each row
begin
	insert into BK_DB_pet_show.BK_FornecedorProduto values (null, new.id_fornecedor_produto, new.id_fk_produto, new.id_fk_fornecedor, 
		new.quantidade, "U", localHost());
end$

create trigger Alterando_BK_CP
after update
on ClienteProduto
for each row
begin
	insert into BK_DB_pet_show.BK_ClienteProduto values (null, new.id_cliente_produto, new.id_fk_produto, new.id_fk_cliente, new.preco_total, "U", localHost());
end$

create trigger Deletando_BK_pessoa
before delete
on Pessoa
for each row
begin 
	insert into BK_DB_pet_show.BK_Pessoa values (null, old.id_pessoa, old.nome, old.email, "D", localHost());
end$

create trigger Deletando_BK_telefone
before delete
on Telefone
for each row
begin
	insert into BK_DB_pet_show.BK_Telefone values (null, old.id_telefone, old.tipo, old.numero, old.id_fk_pessoa, "D", localHost());
end$

create trigger Deletando_BK_endereco
before delete
on Endereco
for each row
begin
	insert into BK_DB_pet_show.BK_Endereco values(null, old.id_endereco, old.estado, old.cidade, old.bairro, old.rua, old.numero, 
		old.complemento, old.id_fk_pessoa, "D", localHost());
end$

create trigger Deletando_BK_produto
before delete
on Produto
for each row
begin
	insert into BK_DB_pet_show.BK_Produto values(null, old.id_produto, old.nome, old.preco_unitario, old.descricao,
		old.imagem, "D", localHost());
end$

create trigger Deletando_BK_fornecedor
before delete
on Fornecedor
for each row
begin
	insert into BK_DB_pet_show.BK_Fornecedor values(null, old.id_fk_pessoa, old.CNPJ, "D", localHost());
end$

create trigger Deletando_BK_cliente
before delete
on Cliente
for each row
begin
	insert into BK_DB_pet_show.BK_Cliente values(null, old.id_fk_pessoa, old.CPF, old.data_cadastro, old.data_nascimento,
		old.sexo, "D", localHost());
end$

create trigger Deletando_BK_FP
before delete
on FornecedorProduto
for each row
begin
	insert into BK_DB_pet_show.BK_FornecedorProduto values (null, old.id_fornecedor_produto, old.id_fk_produto, old.id_fk_fornecedor, 
		old.quantidade, "D", localHost());
end$

create trigger Deletando_BK_CP
before delete
on ClienteProduto
for each row
begin
	insert into BK_DB_pet_show.BK_ClienteProduto values (null, old.id_cliente_produto, old.id_fk_produto, old.id_fk_cliente, old.preco_total, "D", localHost());
end$

delimiter ;