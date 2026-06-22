create view analytics.vw_base_entrenamientos as
select
    -- IDs
    f.sesion_id,
    f.cliente_id,
    f.entrenador_id,
    f.gimnasio_id,
    f.fecha_id,
    f.pago_id,
    -- Fecha
    fe.fecha,
    fe.anio,
    fe.mes,
    fe.nombre_mes,
    fe.nombre_dia,
    -- Cliente
    c.edad as edad_cliente,
    c.genero as genero_cliente,
    -- Entrenador
    e.nivel_entrenador,
    -- Gimnasio
    g.nombre_gimnasio,
    g.ciudad as ciudad_gimnasio,
    -- Pago
    p.forma_pago,
    -- Métricas (FACT)
    f.ingreso_final,
    f.beneficio_gimnasio,
    f.margen_gimnasio,
    f.duracion_sesion_min,
    f.tipo_sesion

from analytics.fact_entrenamientos f

join analytics.dim_clientes c 
    on f.cliente_id = c.cliente_id

join analytics.dim_entrenadores e 
    on f.entrenador_id = e.entrenador_id

join analytics.dim_gimnasios g 
    on f.gimnasio_id = g.gimnasio_id

join analytics.dim_fechas fe 
    on f.fecha_id = fe.fecha_id

join analytics.dim_pagos p 
    on f.pago_id = p.pago_id;