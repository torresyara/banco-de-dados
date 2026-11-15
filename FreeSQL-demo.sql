CREATE table cliente(
    id_cliente number(10) primary key,
    nome varchar(30),
    telefone number(15),
    email varchar(30)
);

CREATE table pedido(
    id_pedido number(10) primary key,
    data_pedido date,
    valor_total number (10,2),
    id_cliente number(10),
    constraint fkpedcli foreign key(id_cliente) references cliente(id_cliente)
);

create table item_pedido(
    id_item number(10) primary key,
    descricao_produto varchar(50),
    quantidade number(5),
    preco_unitario number (38,2),
    id_pedido number(10),
    constraint fkidpedi foreign key(id_pedido) references pedido(id_pedido)
);

insert into cliente (id_cliente, nome, telefone, email)
values (1, 'Yara', 14996850330, 'storresyara@gmail.com'), 
    (2, 'Fernanda', 14996850335, 'fftorres3@gmail.com'), 
    (3, 'Pedro', 14996850336, 'pedro@gmail.com');

insert into pedido (id_pedido, data_pedido, valor_total, id_cliente)
values (2, DATE '2026-12-12', 24, 1),
    (3, DATE '2026-12-11', 38, 3),
    (4, DATE '2026-12-12', 40, 2);

insert into item_pedido (id_item, descricao_produto, quantidade, preco_unitario, id_pedido)
values (1, 'descricao1', 1, 2, 1 );

insert into item_pedido (id_item, descricao_produto, quantidade, preco_unitario, id_pedido)
values (2, 'descricao2', 2, 5, 2);

insert into item_pedido (id_item, descricao_produto, quantidade, preco_unitario, id_pedido)
values (3, 'descricao3', 1, 8, 3);

alter table cliente add sexo char(1);

alter table cliente modify nome not null;

select * from cliente where nome like 'Y%';

select * from pedido where valor_total>5;

select p.id_pedido, p.data_pedido, c.id_cliente, c.nome
from pedido p, cliente c
where c.id_cliente = p.id_cliente;

select p.id_pedido, p.data_pedido, c.id_cliente, c.nome, i.descricao_produto, i.preco_unitario, i.quantidade, p.valor_total
from cliente c, pedido p, item_pedido i
where p.id_cliente = c.id_cliente and p.id_pedido = i.id_pedido;

delete from item_pedido where ID_ITEM;