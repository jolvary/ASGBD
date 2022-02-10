drop trigger if EXISTS CLIAI;
drop trigger if exists CLIBU;
drop trigger if exists VISBD;

drop table if EXISTS VISITAS;
drop table if EXISTS CLIENTES;
drop table if EXISTS NCLIENTES;
drop table if EXISTS RVISITAS;
drop table if EXISTS ACLIENTES;

CREATE TABLE CLIENTES (
    dniCli varchar(9),
    nomCli varchar(50),
    tlfCli int,
    constraint pk_Cli primary key (dniCli)
);

CREATE TABLE VISITAS (
    dniCli varchar(9), 
    DEPARTAMENTO VARCHAR(45), 
    MOTIVO VARCHAR(90), 
    constraint pk_Vis primary key (dniCli),
    constraint fk_Cli foreign key (dniCli) references CLIENTES (dniCli)
);

insert into CLIENTES (dniCli, nomCli, tlfCli) values ('54121231A', 'Pepe', 987456321);
insert into CLIENTES (dniCli, nomCli, tlfCli) values ('25121231B', 'Miguel', 123456789);
insert into CLIENTES (dniCli, nomCli, tlfCli) values ('84121231C', 'Álvaro', 456789123);
insert into CLIENTES (dniCli, nomCli, tlfCli) values ('72121231D', 'Moises', 654789321);
insert into CLIENTES (dniCli, nomCli, tlfCli) values ('31121231E', 'Benito', 159753248);
insert into CLIENTES (dniCli, nomCli, tlfCli) values ('14121231F', 'Francisco', 164798235);

insert into VISITAS (dniCli, DEPARTAMENTO, MOTIVO) values ('54121231A', 'RRHH', 'Revisar anuncios');
insert into VISITAS (dniCli, DEPARTAMENTO, MOTIVO) values ('25121231B', 'RRHH', 'Revisar anuncios');
insert into VISITAS (dniCli, DEPARTAMENTO, MOTIVO) values ('84121231C', 'Demacia', 'Revisar demacia');
insert into VISITAS (dniCli, DEPARTAMENTO, MOTIVO) values ('72121231D', 'Ole', 'Revisar anuncios');
insert into VISITAS (dniCli, DEPARTAMENTO, MOTIVO) values ('31121231E', 'Beti', 'Mirar anuncios');
insert into VISITAS (dniCli, DEPARTAMENTO, MOTIVO) values ('14121231F', 'RRHH', 'anuncios');


CREATE TABLE NCLIENTES (
    idClin int auto_increment,
    dniCli varchar(9),
    nomCli varchar(50),
    tlfCli int,
    usuario varchar(25), 
    fecha date,
    constraint pk_Clin primary key (idClin),
    constraint uq_Clin UNIQUE (dniCli)
); 

 CREATE TABLE ACLIENTES (
    idClia int auto_increment,
    prevdniCli VARCHAR(25), 
    prevnomCli VARCHAR(25), 
    prevtlfCli INT, 
    newdniCli VARCHAR(25), 
    newnomCli VARCHAR(25), 
    newtlfCli INT, 
    usuario VARCHAR(25), 
    prevFecha DATE,
    constraint pk_Clia primary key (idClia)
);

CREATE TABLE RVISITAS (
    idVis INT auto_increment, 
    dniCli varchar(9), 
    DEPARTAMENTO VARCHAR(45), 
    MOTIVO VARCHAR(90), 
    USUARIO VARCHAR(25), 
    FECHA DATE,
    constraint pk_Visr primary key (idVis)
); 


CREATE TRIGGER CLIAI AFTER INSERT ON CLIENTES FOR EACH ROW
INSERT INTO NCLIENTES (dniCli, nomCli, tlfCli, usuario, fecha)
VALUES (NEW.dniCli, NEW.nomCli, NEW.tlfCli, CURRENT_USER (), NOW());

CREATE TRIGGER CLIBU BEFORE UPDATE ON CLIENTES FOR EACH ROW
INSERT INTO ACLIENTES (prevdniCli, prevnomCli, prevtlfCli, newdniCli, newnomCli, newtlfCli, usuario, prevFecha)
VALUES (OLD.dniCli, OLD.nomCli, OLD.tlfCli, NEW.dniCli, NEW.nomCli, NEW.tlfCli, CURRENT_USER (), NOW());

CREATE TRIGGER VISBD BEFORE DELETE ON VISITAS FOR EACH ROW
INSERT INTO RVISITAS (dniCli, DEPARTAMENTO, MOTIVO, USUARIO, FECHA)
VALUES (OLD.dniCli, OLD.DEPARTAMENTO, OLD.MOTIVO, CURRENT_USER (), NOW());



INSERT INTO CLIENTES (dniCli, nomCli, tlfCli) 
VALUES ('00009911A', 'FRANCISCO FRANCO', '212222277');

INSERT INTO CLIENTES (dniCli, nomCli, tlfCli) 
VALUES ('00007791B', 'PEDRO SANCHEZ', '441122277');



UPDATE CLIENTES SET nomCli='AMAYA MONTERO' WHERE dniCli='54121231A';

UPDATE CLIENTES SET tlfCli='656999988' WHERE dniCli='00007791B';
                                    


DELETE FROM VISITAS WHERE DEPARTAMENTO='RRHH';

DELETE FROM VISITAS WHERE MOTIVO='Revisar anuncios';



SELECT * FROM CLIENTES;

SELECT * FROM VISITAS;