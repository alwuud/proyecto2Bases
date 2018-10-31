
---------------------------------------------------------------

-- Cargar jugadores temporales
load data 
	infile '/var/lib/mysql-files/jugadores.csv' ignore 

into table TempJugadores
	fields terminated by ',' 
	lines terminated by '\n' 
	ignore 1 lines ;

-- Cargar equipos temporales
load data 
	infile '/var/lib/mysql-files/equipos.csv' ignore 

into table TempEquipo
	fields terminated by ',' 
	lines terminated by '\n' 
	ignore 1 lines ;

--
-- cargar partidos temporales
load data 
	infile '/var/lib/mysql-files/partidos.csv' ignore 

into table TempCatJuegos
	fields terminated by ',' 
	lines terminated by '\n' 
	ignore 1 lines ;