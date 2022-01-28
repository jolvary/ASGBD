SET ECHO ON

alter session set "_ORACLE_SCRIPT"=true;

conn ACME/acme

insert into ACME.CLIENTES (idCli, nomCli, dniCli) values (1, 'Pepe', '54121231A');
insert into ACME.CLIENTES (idCli, nomCli, dniCli) values (2, 'Miguel', '25121231B');
insert into ACME.CLIENTES (idCli, nomCli, dniCli) values (3, 'Álvaro', '84121231C');
insert into ACME.CLIENTES (idCli, nomCli, dniCli, visita) values (4, 'Moises', '72121231D', 'S');
insert into ACME.CLIENTES (idCli, nomCli, dniCli) values (5, 'Benito', '31121231E');
insert into ACME.CLIENTES (idCli, nomCli, dniCli, visita) values (6, 'Francisco', '14121231F', 'S');
insert into ACME.CLIENTES (idCli, nomCli, dniCli) values (7, 'Jose', '22121231G');
insert into ACME.CLIENTES (idCli, nomCli, dniCli) values (8, 'Antonio', '11121231H');
insert into ACME.CLIENTES (idCli, nomCli, dniCli, visita) values (9, 'Raúl', '99121231I', 'S');
insert into ACME.CLIENTES (idCli, nomCli, dniCli, visita) values (10, 'Mario', '37121231J', 'S');

insert into ACME.VISITAS (idVis, cliente, numCli) values (1, 1, 987456321);
insert into ACME.VISITAS (idVis, cliente, numCli) values (2, 2, 123456789);
insert into ACME.VISITAS (idVis, cliente, numCli) values (3, 3, 456789123);
insert into ACME.VISITAS (idVis, cliente, numCli) values (4, 4, 654789321);
insert into ACME.VISITAS (idVis, cliente, numCli) values (5, 5, 159753248);
insert into ACME.VISITAS (idVis, cliente, numCli) values (6, 6, 164798235);
insert into ACME.VISITAS (idVis, cliente, numCli) values (7, 7, 323568974);
insert into ACME.VISITAS (idVis, cliente, numCli) values (8, 8, 647852147);
insert into ACME.VISITAS (idVis, cliente, numCli) values (9, 9, 965874123);
insert into ACME.VISITAS (idVis, cliente, numCli) values (10, 10, 156247893);