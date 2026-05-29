-- ==========================================
-- PROYECTO FINAL ANALISTA DE DATOS
-- KPIs SQL
-- ==========================================

-- ==========================================
-- BLOQUE 4: CLIENTES Y COMPORTAMIENTO
-- ==========================================

	-- KPI 4.1 TICKET MEDIO
	-- Valor económico medio por contratación

SELECT
    AVG(ingreso_final) AS ticket_medio
FROM fact_entrenamientos;


	-- KPI 4.2 MÉTODO DE PAGO MÁS UTILIZADO
	-- Distribución de preferencias de pago de los clientes

SELECT
    p.forma_pago,
    COUNT(*) AS numero_contrataciones
FROM fact_entrenamientos f
JOIN dim_pagos p
    ON f.pago_id = p.pago_id
GROUP BY p.forma_pago
ORDER BY numero_contrataciones DESC


	-- KPI 4.3 INGRESO POR MÉTODO DE PAGO
	-- Rendimiento económico según método de pago utilizado

SELECT
    p.forma_pago,
    SUM(f.ingreso_final) AS ingresos_totales
FROM fact_entrenamientos f
JOIN dim_pagos p
    ON f.pago_id = p.pago_id
GROUP BY p.forma_pago
ORDER BY ingresos_totales DESC;


	-- KPI 4.4 DISTRIBUCIÓN DE CONTRATACIONES POR SEGMENTO DE EDAD DEL CLIENTE
	--Composición demográfica de la demanda

SELECT
    CASE
        WHEN c.edad < 25 THEN 'Menores de 25'
        WHEN c.edad BETWEEN 25 AND 34 THEN '25-34'
        WHEN c.edad BETWEEN 35 AND 44 THEN '35-44'
        WHEN c.edad BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS rango_edad,
    COUNT(*) AS numero_contrataciones
FROM fact_entrenamientos f
JOIN dim_clientes c
    ON f.cliente_id = c.cliente_id
GROUP BY rango_edad
ORDER BY numero_contrataciones DESC;


	-- KPI 4.5 RELACIÓN EDAD DEL CLIENTE VS TICKET MEDIO
	-- Análisis del gasto medio según edad del cliente

SELECT
    c.edad,
    AVG(f.ingreso_final) AS ticket_medio
FROM fact_entrenamientos f
JOIN dim_clientes c
    ON f.cliente_id = c.cliente_id
GROUP BY c.edad
ORDER BY c.edad;


	-- KPI 4.6 INGRESOS POR GÉNERO DEL CLIENTE
	-- Distribución del volumen económico según género del cliente

SELECT
    c.genero,
    SUM(f.ingreso_final) AS ingresos_totales
FROM fact_entrenamientos f
JOIN dim_clientes c
    ON f.cliente_id = c.cliente_id
GROUP BY c.genero
ORDER BY ingresos_totales DESC;


	-- KPI 4.7 TICKET MEDIO POR GÉNERO DEL CLIENTE
	-- Comparación del gasto medio según género del cliente

SELECT
    c.genero,
    AVG(f.ingreso_final) AS ticket_medio
FROM fact_entrenamientos f
JOIN dim_clientes c
    ON f.cliente_id = c.cliente_id
GROUP BY c.genero
ORDER BY ticket_medio DESC;





















