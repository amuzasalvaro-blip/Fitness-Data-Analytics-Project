create table core.dim_fechas (
fecha_id varchar(15) primary key,
fecha date,
anio int,
mes int,
trimestre varchar(10),
semana_anio int,
nombre_mes varchar(20),
nombre_dia varchar(20)
);
