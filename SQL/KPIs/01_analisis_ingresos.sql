-- ==========================================
-- PROYECTO FINAL ANALISTA DE DATOS
-- KPIs SQL
-- ==========================================

-- ==========================================
-- BLOQUE 1: ANÁLISIS DE INGRESOS
-- ==========================================

	-- KPI 1.1 INGRESOS TOTALES
	-- Volumen económico total del mercado analizado

SELECT
	SUM(ingreso_final) AS ingresos_totales
FROM fact_entrenamientos;


	-- KPI 1.2 INGRESOS POR GIMNASIO
	-- Comparativa de facturación entre gimnasios

SELECT
    g.gimnasio_id,
    g.nombre_gimnasio,
    SUM(f.ingreso_final) AS ingresos
FROM fact_entrenamientos f
JOIN dim_gimnasios g
    ON f.gimnasio_id = g.gimnasio_id
GROUP BY g.gimnasio_id, g.nombre_gimnasio
ORDER BY ingresos DESC;


	-- KPI 1.3 INGRESO MEDIO POR GIMNASIO
	-- Facturación media por gimnasio del conjunto analizado

SELECT
    AVG(total_ingresos) AS ingreso_medio_gimnasio
FROM (
    SELECT
        g.gimnasio_id,
        SUM(f.ingreso_final) AS total_ingresos
    FROM fact_entrenamientos f
    JOIN dim_gimnasios g
        ON f.gimnasio_id = g.gimnasio_id
    GROUP BY g.gimnasio_id
) ingresos_gimnasios;


	-- KPI 1.4 INGRESOS POR CIUDAD
	-- Distribución geográfica por ciudad del volumen de ingresos

SELECT
    g.ciudad,
    SUM(f.ingreso_final) AS ingresos
FROM fact_entrenamientos f
JOIN dim_gimnasios g
    ON f.gimnasio_id = g.gimnasio_id
GROUP BY g.ciudad
ORDER BY ingresos DESC;


	-- KPI 1.5 EVOLUCIÓN MENSUAL DE INGRESOS
	-- Análisis temporal del comportamiento de ingresos

SELECT
    d.anio,
    d.mes,
    SUM(f.ingreso_final) AS ingresos
FROM fact_entrenamientos f
JOIN dim_fechas d
    ON f.fecha_id = d.fecha_id
GROUP BY d.anio, d.mes
ORDER BY d.anio, d.mes;


	-- KPI 1.6 EVOLUCIÓN TRIMESTRAL
	-- Comportamiento de ingresos por trimestre

SELECT
    d.anio,
    d.trimestre,
    SUM(f.ingreso_final) AS ingresos
FROM fact_entrenamientos f
JOIN dim_fechas d
    ON f.fecha_id = d.fecha_id
GROUP BY d.anio, d.trimestre
ORDER BY d.anio, d.trimestre;


	-- KPI 1.7 ESTACIONALIDAD DE INGRESOS
	-- Identificación de patrones estacionales en los ingresos

SELECT
    d.mes,
    AVG(f.ingreso_final) AS ingreso_medio
FROM fact_entrenamientos f
JOIN dim_fechas d
    ON f.fecha_id = d.fecha_id
GROUP BY d.mes
ORDER BY d.mes;


	-- KPI 1.7 ESTACIONALIDAD DE INGRESOS
	-- Identificación de patrones estacionales en el volumen de ingresos

SELECT
    d.mes,
    SUM(f.ingreso_final) AS ingresos
FROM fact_entrenamientos f
JOIN dim_fechas d
    ON f.fecha_id = d.fecha_id
GROUP BY d.mes
ORDER BY d.mes;