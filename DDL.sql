SET ECHO ON

alter session set "_ORACLE_SCRIPT"=true;

drop user ACME cascade;
drop table Visitas cascade;
drop table Clientes cascade;
drop role CEO cascade;
drop role Jefatura_Tecnica cascade;
drop role Jefatura_Comercial cascade;
drop role ReInEm cascade;

create role CEO;
grant create session;
grant any role to CEO;
grant create user, drop user to CEO;

create role Jefatura_Tecnica;
grant create session to Jefatura_Tecnica;
grant create synonym, create view to Jefatura_Tecnica;

create role Jefatura_Comercial;
grant create session to Jefatura_Comercial;

create role ReInEm;
grant create session;

create user ACME identified by acme;
grant role Jefatura_Tecnica to ACME;
grant unlimited tablespace to ACME;

create user CEO1 identified by ceo1;
grant role CEO to CEO1;
grant unlimited tablespace to CEO1;

conn ACME/acme

create table CLIENTES (
	idCli number,
	nomCli varchar2(20),
	dniCli number,
	constraint pk_Cli primary key (idCli),
	constraint uq_Cli unique (dniCli)
);

create table VISITAS (
	idVis number,
	cliente number,
	numCli number,
	constraint pk_Vis primary key (idVis),
	constraint uq_Vis unique (numCli),
    	constraint fk_Cli foreign key (cliente) references CLIENTES (idCli)
);

create view SemillasPlantadas as select * from VISITAS;
create view FuentesDeDinero as select * from CLIENTES;
create view V_Visitas as (select nomUsu, numCli from VISITAS inner join CLIENTES on idCli = cliente;
create synonym for as select * from V_Visitas;

grant select on SemillasPlantadas with admin option to CEO;
grant select on Clientes with admin option to CEO;
grant select on FuentesDeDinero with admin option to CEO;

conn CEO1/ceo1

create user TRA1 identified by tra1;
grant role ReInEm to TRA1;
