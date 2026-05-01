create database livraria;
use livraria;

create table livros(
	id_livro int unique not null primary key auto_increment,
    nome varchar(100) not null,
    genero varchar(40) not null,
    preco decimal not null
    check (preco > 0),
    autor varchar(100) not null,
    sexo_autor char(1) not null,
    numero_paginas int not null 
    check (numero_paginas > 0),
    ano_publicao int not null,
    editora varchar(50) not null,
    editora_local char(2) not null
);

insert into livros (nome, genero, preco, autor, sexo_autor,
	numero_paginas, ano_publicao, editora, editora_local) values (
    "Cavaleiro Real",
    "Romance e drama",
    49.90,
    "Ana Claudia",
    "F",
    465,
    2009,
    "Atlas",
    "RJ");

insert into livros (nome, genero, autor, sexo_autor,
	numero_paginas, editora, preco, editora_local, ano_publicao) values (
    "SQL para leigos",
    "Tecnologia",
    "João Nunes",
    "M",
    450,
    "Addison",
    98,
    "SP",
    2018);
    
insert into livros (nome, genero, autor, sexo_autor,
	numero_paginas, editora, preco, editora_local, ano_publicao) values (
    "Receitas caseiras",
    "Culinaria",
    "Celia Tavares",
    "F",
    210,
    "Atlas",
    45,
    "RJ",
    2008);
    
insert into livros (nome, genero, autor, sexo_autor,
	numero_paginas, editora, preco, editora_local, ano_publicao) values (
    "Pessoas efetivas",
    "Educacao",
    "Eduardo Santos",
    "M",
    390,
    "Beta",
    78.99,
    "RJ",
    2018);
    
insert into livros (nome, genero, autor, sexo_autor,
	numero_paginas, editora, preco, editora_local, ano_publicao) values (
    "Habitos Saudaveis",
    "Auto ajuda",
    "Eduardo Santos",
    "M",
    630,
    "Beta",
    150.98,
    "RJ",
    2019);
    
insert into livros (nome, genero, autor, sexo_autor,
	numero_paginas, editora, preco, editora_local, ano_publicao) values (
    "A Casa Marrom",
    "Terror",
    "Hermes Macedo",
    "M",
    250,
    "Bubba",
    60,
    "MG",
    2016);
    
insert into livros (nome, genero, autor, sexo_autor,
	numero_paginas, editora, preco, editora_local, ano_publicao) values (
    "Estacio Querido",
    "Romance",
    "Geraldo Francisco",
    "M",
    310,
    "Insigmia",
    100,
    "ES",
    2015);
    
insert into livros (nome, genero, autor, sexo_autor,
	numero_paginas, editora, preco, editora_local, ano_publicao) values (
    "Pra sempre amigas",
    "Infanto-juvenil",
    "Leda Silva",
    "F",
    510,
    "Insigmia",
    78.98,
    "ES",
    2011);
    
insert into livros (nome, genero, autor, sexo_autor,
	numero_paginas, editora, preco, editora_local, ano_publicao) values (
    "Copas Inesqueciveis",
    "Fotebal",
    "Marco Alcantra",
    "M",
    200,
    "Larson",
    130.98,
    "RS",
    2018);
    
insert into livros (nome, genero, autor, sexo_autor,
	numero_paginas, editora, preco, editora_local, ano_publicao) values (
    "O Poder da Mente",
    "Auto ajuda",
    "Clara Mafra",
    "F",
    120,
    "Continental",
    56.58,
    "RS",
    2017);

select *
from livros;

select nome, editora
from livros;

select id_livro, nome
from livros
where sexo_autor = "M";

select nome, numero_paginas
from livros
where sexo_autor = "F";

select preco
from livros
where editora_local = "SP";

select *
from livros
where sexo_autor = "M" and (editora_local = "SP" or editora_local = "RJ");

