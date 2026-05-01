drop database if exists DB_LOJA;
create database DB_LOJA;
use DB_LOJA;

create table cliente(
	cod_cliente int auto_increment primary key,
    nome varchar(100) not null,
    endereco varchar(100) not null,
    cidade varchar(40) not null,
    bairro varchar(50) not null,
    estado char(2) not null
);

insert cliente (nome, endereco, cidade, bairro, estado) values(
	"Alice Lacerda",
	"Padre Rolim",
	"Belo Horizonte",
    "Santa Efigênia",
    "MG");

insert cliente (nome, endereco, cidade, bairro, estado) values(
	"Isadora Canudo ante tartaruga",
	"Cafunde",
	"Belo Horizonte",
    "do judas",
    "MG");
    
alter table cliente
    add renda float(10,2),
	add	data_cadastro datetime;
    
update cliente 
    set renda = 115000.01,
	data_cadastro = str_to_date("02/12/2019 12:32", "%d/%m/%Y %H:%i")
    where cod_cliente = 1;
    
alter table cliente
    modify nome varchar(50),
    modify endereco varchar(20);

alter table cliente
	drop renda;
    
create table produto(
	cod_produto int primary key auto_increment,
    nome varchar(100) not null,
    preco_compra float(10,2) not null,
    preco_venda float(10,2) not null,
    data_cadastro datetime not null);

insert into produto values (null, "Computador", 1000.00, 1500.50, current_time());

alter table produto
	add descricao varchar(200) null,
    add codigo_barras varchar(50) null,
	drop preco_venda,
    drop preco_compra;

drop table produto;
drop table cliente;
