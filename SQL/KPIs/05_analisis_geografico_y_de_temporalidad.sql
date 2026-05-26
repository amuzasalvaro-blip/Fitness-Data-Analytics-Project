-- ==========================================
-- PROYECTO FINAL ANALISTA DE DATOS
-- KPIs SQL
-- ==========================================

-- ==========================================
-- BLOQUE 5: ANALISIS GEOGRAFICO Y DE TEMPORALIDAD
-- ==========================================

	-- KPI 5.1 INGRESOS POR CIUDAD
	-- Distribución geográfica del volumen económico generado

SELECT
    g.ciudad,
    SUM(f.ingreso_final) AS ingresos_totales
FROM fact_entrenamientos f
JOIN dim_gimnasios g
    ON f.gimnasio_id = g.gimnasio_id
GROUP BY g.ciudad
ORDER BY ingresos_totales DESC;


	-- KPI 5.2 MARGEN DE BENEFICIO POR CIUDAD
	-- Comparación de eficiencia económica territorial.

SELECT
    g.ciudad,
    (SUM(f.beneficio_gimnasio) / SUM(f.ingreso_final)) * 100 AS margen_beneficio
FROM fact_entrenamientos f
JOIN dim_gimnasios g
    ON f.gimnasio_id = g.gimnasio_id
GROUP BY g.ciudad
ORDER BY margen_beneficio DESC;


	-- KPI 5.3 INGRESO MEDIO POR GIMNASIO SEGUN CIUDAD
	-- Comparación del rendimiento medio por ciudad según la ubicación

SELECT
    ciudad,
    AVG(total_ingresos) AS ingreso_medio_gimnasio
FROM (
    SELECT
        g.gimnasio_id,
        g.ciudad,
        SUM(f.ingreso_final) AS total_ingresos
    FROM fact_entrenamientos f
    JOIN dim_gimnasios g
        ON f.gimnasio_id = g.gimnasio_id
    GROUP BY g.gimnasio_id, g.ciudad
) ingresos_gimnasios
GROUP BY ciudad
ORDER BY ingreso_medio_gimnasio DESC;


	-- KPI 5.4 EVOLUCIÓN MENSUAL DE INGRESOS
	-- Evolución temporal del volumen económico generado

SELECT
    d.mes,
    SUM(f.ingreso_final) AS ingresos_totales
FROM fact_entrenamientos f
JOIN dim_fechas d
    ON f.fecha_id = d.fecha_id
GROUP BY d.mes
ORDER BY d.mes;


	-- KPI 5.5 EVOLUCIÓN MENSUAL DE BENEFICIOS
	-- Evolución temporal de la rentabilidad económica

SELECT
    d.mes,
    SUM(f.beneficio_gimnasio) AS beneficio_total
FROM fact_entrenamientos f
JOIN dim_fechas d
    ON f.fecha_id = d.fecha_id
GROUP BY d.mes
ORDER BY d.mes;















