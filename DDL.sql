SET ECHO ON

alter session set "_ORACLE_SCRIPT"=true;

drop user ACME cascade;
drop user CEO1 cascade;
drop user TRA1 cascade;
drop user Jcomercial cascade;

drop role CEO;
drop role Jefatura_Tecnica;
drop role Jefatura_Comercial;
drop role ReInEm;

drop table VISITAS cascade;
drop table CLIENTES cascade;

create role CEO;
grant create session to CEO;
grant grant any role to CEO;
grant create user, drop user to CEO;

create role Jefatura_Tecnica;

create role Jefatura_Comercial;

create role ReInEm;

create user CEO1 identified by ceo1;
grant CEO to CEO1;
grant unlimited tablespace to CEO1;

conn CEO1/ceo1;

grant create session to Jefatura_Tecnica;
grant create table, drop table, create synonym, drop synonym, create view, drop view to Jefatura_Tecnica;

grant create session to Jefatura_Comercial;

grant create session to ReInEm;

create user ACME identified by acme;
grant  Jefatura_Tecnica to ACME;
grant unlimited tablespace to ACME;

create user JComercial identified by jc1;
grant Jefatura_Comercial to JComercial;

conn ACME/acme

create table CLIENTES (
	idCli number,
	nomCli varchar2(20),
	dniCli number,
	visita char(1) default 'N' not null,
	constraint pk_Cli primary key (idCli),
	constraint uq_Cli unique (dniCli),
	constraint ck_Vis check (visita in ('S','N'))
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
create view V_VISITAS as (select nomUsu, numCli from VISITAS inner join CLIENTES on idCli = cliente);
create synonym MARRONES for V_Visitas;

grant select on SemillasPlantadas with admin option to CEO;
grant select on Clientes with admin option to CEO;
grant select on FuentesDeDinero with admin option to CEO;

conn CEO1/ceo1

create user TRA1 identified by tra1;
grant ReInEm to TRA1;
grant select on MARRONES to TRA1;