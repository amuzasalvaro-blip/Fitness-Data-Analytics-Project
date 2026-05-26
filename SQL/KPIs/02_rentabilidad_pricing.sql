-- ==========================================
-- PROYECTO FINAL ANALISTA DE DATOS
-- KPIs SQL
-- ==========================================

-- ==========================================
-- BLOQUE 2: RENTABILIDAD Y PRICING
-- ==========================================

	-- KPI 2.1 BENEFICIO TOTAL
	-- Beneficio total generado por los gimnasios analizados

SELECT
    SUM(beneficio_gimnasio) AS beneficio_total
FROM fact_entrenamientos;


	-- KPI 2.2 BENEFICIO POR GIMNASIO
	-- Comparativa de rentabilidad entre gimnasios

SELECT
    g.gimnasio_id,
    g.nombre_gimnasio,
    SUM(f.beneficio_gimnasio) AS beneficio
FROM fact_entrenamientos f
JOIN dim_gimnasios g
    ON f.gimnasio_id = g.gimnasio_id
GROUP BY g.gimnasio_id, g.nombre_gimnasio
ORDER BY beneficio DESC;


	-- KPI 2.3 BENEFICIO MEDIO POR GIMNASIO
	-- Valor medio de beneficio por gimnasio

SELECT
    AVG(total_beneficio) AS beneficio_medio_gimnasio
FROM (
    SELECT
        g.gimnasio_id,
        SUM(f.beneficio_gimnasio) AS total_beneficio
    FROM fact_entrenamientos f
    JOIN dim_gimnasios g
        ON f.gimnasio_id = g.gimnasio_id
    GROUP BY g.gimnasio_id
) beneficios_gimnasios;


	-- KPI 2.4 MARGEN DE BENEFICIO TOTAL (%)
	-- Margen global de rentabilidad del conjunto de gimnasios analizados

SELECT
    (SUM(beneficio_gimnasio) / SUM(ingreso_final)) * 100 AS margen_beneficio
FROM fact_entrenamientos;


	-- KPI 2.5 MARGEN POR GIMNASIO
	-- Comparación de rentabilidad entre gimnasios

SELECT
    g.gimnasio_id,
    g.nombre_gimnasio,
    (SUM(f.beneficio_gimnasio) / SUM(f.ingreso_final)) * 100 AS margen_beneficio
FROM fact_entrenamientos f
JOIN dim_gimnasios g
    ON f.gimnasio_id = g.gimnasio_id
GROUP BY g.gimnasio_id, g.nombre_gimnasio
ORDER BY margen_beneficio DESC;


	-- KPI 2.6 DESCUENTO MEDIO APLICADO
	-- Nivel medio de descuento aplicado en las contrataciones

SELECT
    AVG(porcentaje_descuento) AS descuento_medio
FROM fact_entrenamientos;


	-- KPI 2.7 USO DE DESCUENTOS
	-- Frecuencia de aplicación de promociones

SELECT
    (COUNT(CASE WHEN porcentaje_descuento > 0 THEN 1 END) * 100.0 / COUNT(*)) AS porcentaje_descuentos
FROM fact_entrenamientos;


	-- KPI 2.8 COMPARATIVA INGRESO BRUTO VS INGRESO FINAL
	-- Cuantificación del impacto económico de las promociones 

SELECT
    SUM(ingreso_bruto) AS ingreso_bruto_total,
    SUM(ingreso_final) AS ingreso_final_total,
    SUM(descuento_aplicado) AS impacto_descuentos
FROM fact_entrenamientos;


	-- KPI 2.9 IMPACTO DE DESCUENTOS EN INGRESOS
	-- Relación entre promociones y rendimiento económico

SELECT
    CASE
        WHEN porcentaje_descuento = 0 THEN 'Sin descuento'
        WHEN porcentaje_descuento <= 10 THEN '0-10%'
        WHEN porcentaje_descuento <= 20 THEN '10-20%'
        ELSE '20%+'
    END AS rango_descuento,
    AVG(ingreso_final) AS ingreso_medio
FROM fact_entrenamientos
GROUP BY rango_descuento
ORDER BY ingreso_medio DESC;