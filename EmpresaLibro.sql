create sequence idsocio;
create table if not exists Socio
(
idsocio int default nextval ('idsocio') not null,
	idpoblacion integer not null,
	nombre character varying not null,
	apellidos character varying not null,
	avalista integer not null,
	telefono  integer not null,
	poblacion integer not null,
	dni character varying unique not null,
	constraint pk_Socio Primary key (idsocio)
	
	
);

create sequence idpedido;
create table if not exists Pedido
(
idpedido int default nextval ('idpedido') not null,
	idsocio integer not null,
	forma_envio character varying not null,
	forma_pago character varying not null,
	constraint pk_Pedido Primary key (idpedido)

);

create sequence iddetalle;
create table if not exists Detalle
(
iddetalle int default nextval ('iddetalle') not null,
	idpedido integer not null,
	idlibro integer not null,
	cantidad integer not null,
	constraint pk_detalle Primary key (iddetalle)
	
);

create sequence idlibro;
create table if not exists Libro
(
idlibro int default nextval ('idlibro') not null,
	idcoleccion integer not null,
	editorial character varying not null,
	autor character varying not null,
	titulo character varying not null,
	constraint pk_Libro Primary key (idlibro)
	
);

create sequence idcoleccion;
create table if not exists Coleccion
(
idcoleccion int default nextval ('idcoleccion') not null,
	cantidad integer not null,
	constraint pk_Coleccion Primary Key (idcoleccion)
	
);

create sequence idlibroalmacen;
create table if not exists LibroAlmacen
(
idlibroalmacen int default nextval ('idlibroalmacen') not null,
	idlibro integer not null,
	idalmacen integer not null,
	stock integer not null,
	constraint pk_LibroAlmacen Primary Key (idlibroalmacen)
	
);


create sequence idalmacen;
create table if not exists Almacen
(
idalmacen int default nextval ('idalmacen') not null,
	apertura date not null,
	direccion character varying not null,
	constraint pk_Almacen Primary key (idalmacen)

);

create sequence idprovincia;
create table if not exists Provincia
(
idprovincia int default nextval ('idprovincia') not null,
	idalmacen integer not null,
	tamaño integer not null,
	constraint pk_Provincia Primary key (idprovincia)
	
);

create sequence idpoblacion;
create table if not exists Poblacion
(
idpoblacion int default nextval ('idpoblacion') not null,
	idprovincia integer not null,
	Habitantes integer not null,
	constraint pk_Poblacion Primary key (idpoblacion)
	
);


ALTER TABLE IF EXISTS Socio
ADD CONSTRAINT fk_Socio_Poblacion FOREIGN KEY (idpoblacion)
REFERENCES Poblacion (idpoblacion) 
ON UPDATE NO ACTION
ON DELETE NO ACTION
NOT VALID;

ALTER TABLE IF EXISTS Poblacion
ADD CONSTRAINT fk_Poblacion_Provincia FOREIGN KEY (idprovincia)
REFERENCES Provincia (idprovincia) 
ON UPDATE NO ACTION
ON DELETE NO ACTION
NOT VALID;

ALTER TABLE IF EXISTS Pedido
ADD CONSTRAINT fk_Pedido_Socio FOREIGN KEY (idsocio)
REFERENCES Socio ("idsocio")
ON UPDATE NO ACTION
ON DELETE NO ACTION
NOT VALID;

ALTER TABLE IF EXISTS  Detalle
ADD CONSTRAINT fk_Detalle_Pedido FOREIGN KEY (idpedido)
REFERENCES Pedido (idpedido)
ON UPDATE NO ACTION
ON DELETE NO ACTION
NOT VALID;

ALTER TABLE IF EXISTS  Detalle
ADD CONSTRAINT fk_Detalle_Libro FOREIGN KEY (idlibro)
REFERENCES Libro (idlibro)
ON UPDATE NO ACTION
ON DELETE NO ACTION
NOT VALID;

ALTER TABLE IF EXISTS Libro
ADD CONSTRAINT fk_Libro_Coleccion FOREIGN KEY (idcoleccion)
REFERENCES Coleccion (idcoleccion) 
ON UPDATE NO ACTION
ON DELETE NO ACTION
NOT VALID;

ALTER TABLE IF EXISTS Libroalmacen
ADD CONSTRAINT fk_LibroAlmacen_Libro FOREIGN KEY (idlibro)
REFERENCES Libro (idlibro) 
ON UPDATE NO ACTION
ON DELETE NO ACTION
NOT VALID;

ALTER TABLE IF EXISTS Libroalmacen
ADD CONSTRAINT fk_LibroAlmacen_Almacen FOREIGN KEY (idalmacen)
REFERENCES Almacen (idalmacen)
ON UPDATE NO ACTION
ON DELETE NO ACTION
NOT VALID;

ALTER TABLE IF EXISTS Provincia
ADD CONSTRAINT fk_Provincia_Almacen FOREIGN KEY (idalmacen)
REFERENCES Almacen (idalmacen)
ON UPDATE NO ACTION
ON DELETE NO ACTION
NOT VALID;












