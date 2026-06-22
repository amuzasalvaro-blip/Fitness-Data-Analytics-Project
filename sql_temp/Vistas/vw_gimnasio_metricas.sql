CREATE view analytics.vw_gimnasio_metricas as
select 
    gimnasio_id,
    ciudad_gimnasio,
    count(*) as total_sesiones,
    sum(ingreso_final) as ingresos,
    sum(beneficio_gimnasio) as beneficio,
    avg(margen_gimnasio) as margen_medio
from analytics.vw_base_entrenamientos
GROUP by gimnasio_id, ciudad_gimnasio;

--- Resume el rendimiento de cada gimnasio, mostrando sesiones, ingresos y rentabilidad,
--- permitiendo comparar resultados entre ubicaciones.