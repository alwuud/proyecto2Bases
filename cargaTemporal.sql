insert into confederacion (idConf , nombre )
select 
	distinct null, Confederacion
from 
	TempEquipo;


insert into grupo(idGrupo)
select distinct 
	Grupo
from 
	TempEquipo;



insert into pais(idPais, nombre, idGrupo, confed)
select 
	distinct 
		null,
		e.equipo,
        e.Grupo,
        c.idconf
        
from
	TempEquipo e
inner join
	confederacion c
on	e.Confederacion= c.nombre
;


insert into ciudad(idCiudad, nombre, pais)
select
	distinct
	null,
    p.sede,
    24
from 
	TempCatJuegos p;

insert into arbitro(idArbitro, nombre)
select
	null,
    Arbitro_central
from 
	TempCatJuegos
union
select 
	null,
	Asistente1
from TempCatJuegos
union
select 
	null,
	Asistente2
from 
	TempCatJuegos;