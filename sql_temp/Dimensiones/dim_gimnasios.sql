create table core.dim_gimnasios (
gimnasio_id varchar(15) primary key,
nombre_gimnasio varchar (50),
ciudad varchar(25),
provincia varchar(50),
tipo_gimnasio varchar(25),
horario_gimnasio varchar(30),
anio_apertura int,
cuota_mensual numeric(6,2)
);