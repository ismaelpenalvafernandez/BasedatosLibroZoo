create sequence idzoo;
create table if not exists Zoo
(
idzoo int default nextval ('idzoo') not null,
	nombre character varying not null,
	ciudad character varying not null,
	pais character varying not null,
	tamaño  numeric not null,
	prepuesto numeric not null,
	constraint pk_zoo Primary key (idzoo)
);

create sequence idespecie;
create table if not exists Especies
(
	idespecie int default nextval ('idespecie') not null,
	nombre_vulgar character varying not null,
	nombre_cientifico character varying not null,
	familia  character varying not null,
	extincion boolean not null,
	constraint pk_especie Primary key (idespecie)
	
);

create sequence idanimal;
create table if not exists Animales
(
	idanimal int default nextval ('idanimal') not null,
	sexo char(1), check(sexo in ('H','M')),
	nacimiento date not null,
	idespecie integer not null,
	idzoo integer not null,
	continente  character varying not null,
	pais_origen character varying not null,
	constraint pk_animal Primary key (idanimal),
	constraint fk_zoo_animal foreign key (idzoo) references Zoo(idzoo),
	constraint fk_zoo_especies foreign key (idespecie) references Especies(idespecie)	

);
