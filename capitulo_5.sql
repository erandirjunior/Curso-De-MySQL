# selecionado dados da tabela.
select * from comclien;

select n_numeclien, c_codiclien, c_razaclien from comclien;

select n_numeclien, c_codiclien, c_razaclien from comclien where c_codiclien = '0001';

select n_numeclien, c_codiclien, c_razaclien from comclien where c_codiclien <> '0001';

select n_numeclien, c_codiclien, c_razaclien from comclien where c_razaclien like 'L%';

select n_numeclien from comvenda;

#selecionado dados distintos.
select distinct n_numeclien from comvenda;

# fazendo comparações com n valores.
select c_codiclien, c_razaclien from comclien where n_numeclien in (1,2);

select c_codiclien, c_razaclien from comclien where n_numeclien not in (1,2);

# consultando dados com subquery
select c_razaclien from comclien where n_numeclien in (select n_numeclien from comvenda where n_numeclien);

select c_razaclien from comclien where n_numeclien not in (select n_numeclien from comvenda where n_numeclien);

select c_codivenda, (select c_razaclien from comclien where n_numeclien = comvenda.n_numeclien) Nome_Cliente from comvenda;

# criação de alias.
select c_codiclien CODIGO, c_nomeclien CLIENTE from comclien where n_numeclien not in (1,2,3,4);

# join
select c_codiclien, c_razaclien, c_codivenda Cod_Venda from comvenda, comclien where comvenda.n_numeclien = comclien.n_numeclien order by c_razaclien;

select c_codiclien, c_razaclien, c_codivenda Cod_Venda from comvenda join comclien on comvenda.n_numeclien = comclien.n_numeclien order by c_razaclien;

# criando tabelas por meio de select.
create table comclien_bkp as (select * from comclien where c_estaclien = 'SP');

create table comcontato(
n_numecontato int not null auto_increment,
c_nomecontato varchar(200),
c_fonecontato varchar(30),
c_cidacontato varchar(200),
c_estacontato varchar(2),
n_numeclien int,
primary key(n_numecontato));

# inserindo dados por meio de select.
insert into comcontato (select n_numeclien,
c_nomeclien,
c_foneclien,
c_cidaclien,
c_estaclien,
n_numeclien from comclien);

# alterando registro por meio de select.
update comcontato set c_cidacontato = 'LONDRINA', c_estacontato = 'PR' where n_numeclien in (select n_numeclien from comclien_bkp);

# deletando por meio de select.
delete from comcontato where n_numeclien not in (select n_numeclien from comvenda);
