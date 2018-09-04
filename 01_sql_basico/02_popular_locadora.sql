insert into clientes values (
    DEFAULT, 'Victor', '987654321', '2018-08-22', 'Quixada', 'CE'
);

insert into clientes (
    cpf, nome, data_cadastro, cidade, uf
)values(
    '9876', 'Jose', '2018-08-23', 'Quixeramobim', 'CE'
);

insert into clientes (
    cpf, nome, data_cadastro, cidade, uf
)values
('3423', 'Maria', '2018-08-22', 'Morada Nova', 'CE'),
('435345', 'Joao', '2018-08-20', 'Pedra Branca', 'CE');

insert into categorias values(
    default, 'Acao'
);
insert into categorias values(
    default, 'Comedia'
);

insert into classes values(
    default, 'lancamento', '2.50'
);
insert into classes values(
    default, 'Dourada', '2.00'
);

insert into distribuidores values(
    default, 'Fox Filmes'
);

insert into filmes values(
    default, 'Zoacao em FBD', 1, 2018, 1, 1
);

insert into filmes values(
    default, 'FBB em chamas', 1, 2018, 2, 1
);