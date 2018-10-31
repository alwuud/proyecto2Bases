create database py2Bases;
use py2Bases;
create table confederacion(
	 idConf int primary key auto_increment , 
     nombre varchar(128) not null
);

create table torneo(
    idTorneo int primary key auto_increment,
    nombre varchar(128) not null,
    fechaIni  date,
    fechaFin date
);



create table grupo(
    idGrupo char(2) primary key,
    idTorneo int,

    constraint TORNEO_GRUPO foreign key (idTorneo) references torneo(idTorneo)
);


create table pais(
	idPais int primary key auto_increment,
    nombre varchar(128) not null,
    confed int not null,
    idGrupo char(2),
    
    constraint PAIS_CONF foreign key(confed) references confederacion(idConf),
    constraint GRUPO_PAIS foreign key (idGrupo) references grupo(idGrupo)

);

create table jugador(
    idPais int,
    noJugador int , 
    nombre varchar(128) not null,
    nacimiento date,
    altura int ,
    peso int ,
    goles int ,
    constraint JUGADOR_PK  primary key(idPais, noJugador),
    constraint PAIS_JUGADOR foreign key (idPais) references pais(idPais)


);

create table usuario(
    idUsuario int primary key auto_increment,
	usuario varchar(64) unique not null,
    pasw   varchar(128) not null,
    pais int ,
    pago  char(1) default 'F' not null,
    constraint USUARIO_PAIS foreign key (pais) references pais(idPais)
    
);

create table ciudad(
	idCiudad int primary key auto_increment,
    nombre varchar(128) not null,
    pais int not null,
    constraint   PAIS_CIUDAD foreign key (pais) references pais(idPais)
);

 create table arbitro(
	idArbitro int primary key auto_increment,
    nombre varchar(128) not null,
    tipoArbitro int,
    pais int,
    constraint PAIS_ARBITRO foreign key (pais) references pais(idPais)
 );





create table partido(
	idPartido int primary key auto_increment,
	ciudad int not null,
    fecha  date, 
	pais1 int not null,
    pais2 int not null,
    arb1 int not null,
    arb2 int not null,
    arb3 int not null,
    gol1 int,
    gol2 int,
    jugado char(1) default 'F',
    constraint CIUDAD_PARTIDO foreign key(ciudad) references ciudad(idCiudad),
    constraint PAIS1_PARTIDO foreign key (pais1) references pais(idPais),
    constraint PAIS2_PARTIDO foreign key (pais2) references pais(idPais),
    constraint ARB1_PARTIDO foreign key (arb1) references arbitro(idArbitro),
    constraint ARB2_PARTIDO foreign key (arb2) references arbitro(idArbitro),
    constraint ARB3_PARTIDO foreign key (arb3) references arbitro(idArbitro)
);

create table pronostico(
	idPartido int not null,
    usuario int not null,
    constraint PARTIDO_PRONOSTICO foreign key (idPartido) references partido(idPartido),
    constraint USUARIO_PRONOSTICO foreign key (usuario) references usuario(idUsuario),
    constraint PRONOSTICO_PK  primary key (idPartido, usuario),
    gol1 int not null,
    gol2 int not null
);



