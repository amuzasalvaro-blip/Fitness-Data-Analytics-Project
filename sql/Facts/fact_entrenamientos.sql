create table core.fact_entrenamientos (
sesion_id varchar(15) primary key,
fecha_id varchar(15),
cliente_id varchar(15),
entrenador_id varchar(15),
gimnasio_id varchar(15),
pago_id varchar(15),
ingreso_bruto numeric(10,2),
porcentaje_descuento numeric(5,2),
descuento_aplicado numeric(10,2),
ingreso_final numeric(10,2),
duracion_sesion_min int,
tipo_sesion varchar(20),
coste_entrenador numeric(10,2),
beneficio_gimnasio numeric(10,2),
margen_gimnasio numeric(5,2)
);