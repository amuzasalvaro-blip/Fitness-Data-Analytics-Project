create table core.dim_clientes (
cliente_id varchar(15) primary key,
pais varchar(25),
ciudad varchar(25),
comunidad_autonoma varchar(30),
edad int,
genero varchar(15),
nivel_fisico varchar(20),
condicion_medica varchar(20),
lesiones_previas varchar(10),
sesiones_contratadas_mes int,
franja_horaria varchar(20)
);