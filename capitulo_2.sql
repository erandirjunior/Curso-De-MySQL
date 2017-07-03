# criando usuário;
create user usermysql@'%' identified by 'cursomysql';

# concedendo permissão ao usuário.
grant all privileges on *.* to usermysql@'%' with grant option;

# removendo permissão do usuário.
revoke all on *.* from usermysql;

/*Os comandos grant e revoke permitem os administradores do sistema criar usuários e conceder e revogar direitos aos usuários do MySQL em seis níveis de privilégios:


Nível global: privilégios globais aplicam-se para todos os bancos de
dados em um determinado servidor. São concedidos e revogados por meio dos comandos a seguir, que concederão e revogarão apenas privilégios globais, respectivamente:*/
grant all on *.* to usermysql@localhost;
revoke all on *.* from usermysql;

/* Nível dos bancos de dados: privilégios de bancos de dados aplicam-se a todas as tabelas em um determinado banco de dados. Os comando para conceder e revogar apenas privilégios de banco de dados serão:*/
grant all to comercial.* to usermysql@localhost
revoke all on comercial.*;

/* Nível das tabelas: privilégios de tabelas aplicam-se a todas as colunas
em uma determinada tabela. São concedidos ou revogados utilizando os comandos:*/
grant all on comercial.nome_tabela;
revoke all on comercial.nome_tabela;

/* Nível das colunas: privilégios de colunas aplicam-se a uma única coluna em uma determinada tabela. Podem ser utilizados para os comandos de seleção, inserção e atualização de determinadas colunas que desejar. São concedidos utilizando os comandos:*/
grant select(nomecoluna1),
insert(nomecoluna1),
update(nomecoluna1)
on comercial.nome_tabela
to usermysql@localhost
identified by senha;

/* Nível stored routine: a rotina de alterar, criar rotina, executar e pri-
vilégios de concessão de opção aplica-se a stored procedures (procedimentos e funções). Eles podem ser concedidos aos níveis globais e de banco de dados. Também podem ser usados no nível de rotina para rotinas individuais, exceto para criar uma. Se você não sabe o que é uma store procedure, não se preocupe. No capítulo 6, você verá várias expli-
cações sobre o assunto. Esses privilégios são concedidos ou revogados utilizando os comandos:*/
## para rotinas
grant routine on comercial.* to usermysql@localhost;
## para procedures
grant execute on procedure comercial.nomeprocedure
to usermysql@localhost;

/* Nível proxy user: o privilégio de proxy permite que um usuário seja
proxy de outro. O usuário externo de um outro host assume os privilégios de um usuário. Utilizando os comandos:*/
grant PROXY on usermysql@localhost to 'usuarioexterno'@'hostexterno';


# criando database;
create database comercial;

# exibindo databases;
show databases;

# selecionando database;
use comercial;


