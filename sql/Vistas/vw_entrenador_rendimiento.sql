create view analytics.vw_entrenador_rendimiento as
select 
    entrenador_id,   
    count(*) as total_sesiones,
    sum(ingreso_final) as ingresos_generados,
    sum(beneficio_gimnasio) as beneficio_generado,  
    avg(ingreso_final) as ticket_medio,
    avg(duracion_sesion_min) as duracion_media
from analytics.vw_base_entrenamientos
group by entrenador_id;

--- Esta vista muestrs el rendimiento de cada entrenador, incluyendo sesiones realizadas, ingresos generados 
--- y métricas medias, facilitando la comparación entre ellos.