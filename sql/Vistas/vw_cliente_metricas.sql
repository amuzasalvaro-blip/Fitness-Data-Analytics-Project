create view analytics.vw_cliente_metricas as
select 
    cliente_id,
    count(*) as total_sesiones,
    sum(ingreso_final) as gasto_total,
    avg(ingreso_final) as ticket_medio,   
    min(fecha) as primera_sesion,
    max(fecha) as ultima_sesion,
    count(distinct gimnasio_id) as gimnasios_distintos
from analytics.vw_base_entrenamientos
group by cliente_id;

--- Vista que resume el comportamiento de cada cliente, incluyendo número de sesiones, 
--- gasto total y actividad en el tiempo, permitiendo analizar su valor y uso del servicio.