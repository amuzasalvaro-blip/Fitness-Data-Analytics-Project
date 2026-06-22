create table core.dim_entrenadores (
entrenador_id varchar(15) primary key,
genero varchar(15),
edad int,
anios_experiencia int,
pais varchar(25),
ciudad varchar(25),
comunidad_autonoma varchar(30),
nivel_entrenador varchar(20),
especialidades varchar(90),
rating_medio decimal(10,2),
gimnasio_id varchar(15),
tarifa_sesion decimal(10,2),
ofrece_descuento varchar(5),
porcentaje_descuento decimal(5,2),
descuento_decimal decimal(5,2),
idiomas varchar(90),
tipo_contrato varchar(25)
);