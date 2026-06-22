alter table core.fact_entrenamientos
add constraint fk_cliente
foreign key (cliente_id)
references core.dim_clientes(cliente_id);

alter table core.fact_entrenamientos
add constraint fk_entrenador
foreign key (entrenador_id)
references core.dim_entrenadores(entrenador_id);

alter table core.fact_entrenamientos
add constraint fk_gimnasio
foreign key (gimnasio_id)
references core.dim_gimnasios(gimnasio_id);

alter table core.fact_entrenamientos
add constraint fk_fecha
foreign key (fecha_id)
references core.dim_fechas(fecha_id);

alter table core.fact_entrenamientos 
add constraint fk_pago
foreign key (pago_id)
references core.dim_pagos(pago_id);