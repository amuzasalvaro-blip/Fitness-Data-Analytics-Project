create table core.dim_pagos (
pago_id varchar(15) primary key,
forma_pago varchar(30),
pago_automatico varchar(10),
canal_pago varchar(15),
tipo_de_pago varchar(15),
pago_recurrente varchar(10)
);