SET ECHO ON

alter session set "_ORACLE_SCRIPT"=true;

drop user ACME cascade;
drop role CEO cascade;
drop role Jefatura_Tecnica cascade;
drop role Jefatura_Comercial cascade;
drop role ReInEm cascade;

create role CEO;
grant create session with admin option to CEO;
grant create user, drop user to CEO;

create role Jefatura_Tecnica;
grant create session to Jefatura_Tecnica;
grant create synonym, create view to Jefatura_Tecnica;

create role Jefatura_Comercial;
grant create session to Jefatura_Comercial;

create user ACME identified by acme;
grant create session to ACME;
grant create table to ACME;
grant unlimited tablespace to ACME;

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
	ubi varchar2(50),
	constraint pk_Vis primary key (idVis),
    constraint fk_Cli foreign key (cliente) references CLIENTES (idCli)
);