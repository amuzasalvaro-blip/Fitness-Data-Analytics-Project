create view analytics.vw_kpi_mensual as
select 
    anio,
    mes,
    nombre_mes, 
    count(*) as total_sesiones,
    sum(ingreso_final) as ingresos_totales,
    sum(beneficio_gimnasio) as beneficio_total, 
    avg(ingreso_final) as ticket_medio,
    avg(margen_gimnasio) as margen_medio
from analytics.vw_base_entrenamientos
group by anio, mes, nombre_mes
order by anio, mes;