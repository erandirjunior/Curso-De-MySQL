# group by - agregação.
select c_codiclien, c_razaclien from comclien, comvenda where comvenda.n_numeclien = comclien.n_numeclien group by c_codiclien, c_razaclien order by c_razaclien;

select c_codiclien, c_razaclien from comclien join comvenda on comvenda.n_numeclien = comclien.n_numeclien group by c_codiclien, c_razaclien order by c_razaclien;

# count - contagem.
select c_codiclien, c_razaclien, count(n_numevenda) from comclien, comvenda where comvenda.n_numeclien = comclien.n_numeclien group by c_codiclien, c_razaclien order by c_razaclien;

select count(*) from comclien;

# having count - contagem.
select c_razaclien, count(n_numevenda) from comclien, comvenda where comvenda.n_numeclien = comclien.n_numeclien group by c_razaclien having count(n_numevenda) > 2;

# max - valor máximo.
select max(n_totavenda) maior_venda from comvenda;

# min - valor minímo.
select min(n_totavenda) menor_venda, max(n_totavenda) maior_venda from comvenda;

# sum - total.
select sum(n_valovenda) valor_venda, sum(n_descvenda) descontos, sum(n_totavenda) total_venda from comvenda where d_datavenda between '2015-01-01' and '2015-01-01';

# avg - média.
select format(avg(n_totavenda),2) from comvenda;

# substr - define qts caracteres e length - tamanho dos caracteres.
select c_codiprodu, c_descprodu from comprodu where substr(c_codiprodu, 1, 3) = '123' and length(c_codiprodu) > 4;

select substr(c_razaclien, 1, 5) Razao_Social, length(c_cnpjclien) Tamanho_Cod from comclien where n_numeclien = 1;

# concat - concatenação.
select concat(c_razaforne, ' - fone: ', c_foneforne) from comforne order by c_razaforne;

# concat_ws - concatenação com separador.
select concat_ws(c_codiclien, '  ', c_razaclien, '  ', c_nomeclien) from comclien where c_razaclien like 'GREA%';

# lcase e lower - letra minúscula.
select lcase(c_razaclien) from comclien;

# ucase - letra maiúscula.
select ucase('banco de dados mysql') from dual;

# round - arredonda valores.
select round('213.142', 2) from dual;

# format - formata o valor para parecer com apenas as casas decimais desejadas.
select format('21123.142', 2) from dual;

# truncate - truncar as casas decimais, ou seja, omiti-las.
select truncate(max(n_totavenda), 1) maior_venda from comvenda;

# sqrt - raiz quadrada.
select sqrt(4);

# pi - PI.
select pi();

# sin - seno.
select sin(pi());

# cos - cosseno.
select cos(pi());

# tan - tangente.
select tan(pi() + 1);

# multiplicação.
select (n_qtdeivenda * n_valoivenda) multiplicação from comivenda where n_numeivenda = 4;

# divisão.
select truncate((sum(n_valoivenda) / count(n_numeivenda)), 2) divisão from comivenda;

# adição.
select (n_valoivenda + n_descivenda) adição from comivenda where n_numeivenda = 4;

# subtração.
select (n_valoivenda - n_descivenda) subtração from comivenda where n_numeivenda = 4;

# curdate - retorna data atual.
select curdate();

# now - retorna data e hora atual.
select now();

# sysdate - retorna data e hora atual.
select sysdate();

# curtime - retorna hora atual.
select curtime();

# datediff - retorna intervalo entre duas datas.
select datediff('2015-02-01 23:59:59','2015-01-01');

# date_add - adiciona dias a uma data.
select date_add('2013-01-01', interval 31 day);

# dayname - retorna o nome do dia da semana.
select dayname('2015-01-01');

# daymonth - retorna o dia do mês.
select dayofmonth('2015-01-01');

# extract - extrai o ano de uma data.
select extract(year from '2015-01-01');

# last_day - extrai último dia do mês.
select last_day('2015-02-01');

# formatando datas.
select date_format('2015-01-10',get_format(date,'EUR'));

# str_to_date - converte data.
select str_to_date('01.01.2015',get_format(date,'USA'));