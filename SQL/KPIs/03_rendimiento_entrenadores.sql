-- ==========================================
-- PROYECTO FINAL ANALISTA DE DATOS
-- KPIs SQL
-- ==========================================

-- ==========================================
-- BLOQUE 3: RENDIMIENTO DE ENTRENADORES
-- ==========================================

	-- KPI 3.1 TOP 10 ENTRENADORES POR INGRESOS
	-- Ranking de entrenadores con mayor generación de ingresos

SELECT
    e.entrenador_id,
    SUM(f.ingreso_final) AS ingresos
FROM fact_entrenamientos f
JOIN dim_entrenadores e
    ON f.entrenador_id = e.entrenador_id
GROUP BY e.entrenador_id
ORDER BY ingresos DESC
LIMIT 10


	-- KPI 3.2 INGRESO MEDIO POR ENTRENADOR
	-- Valor medio de ingresos generados por entrenador

SELECT
    AVG(total_ingresos) AS ingreso_medio_entrenador
FROM (
    SELECT
        e.entrenador_id,
        SUM(f.ingreso_final) AS total_ingresos
    FROM fact_entrenamientos f
    JOIN dim_entrenadores e
        ON f.entrenador_id = e.entrenador_id
    GROUP BY e.entrenador_id
) ingresos_entrenadores;


	-- KPI 3.3 BENEFICIO POR ENTRENADOR
	-- CAomparativa de rentabilidad entre entrenadores
	
SELECT
    e.entrenador_id,
    SUM(f.beneficio_gimnasio) AS beneficio
FROM fact_entrenamientos f
JOIN dim_entrenadores e
    ON f.entrenador_id = e.entrenador_id
GROUP BY e.entrenador_id
ORDER BY beneficio DESC;


	-- KPI 3.4 TICKET MEDIO POR ENTRENADOR
	-- Comparación del valor medio de contratación por entrenador

SELECT
    e.entrenador_id,
    AVG(f.ingreso_final) AS ticket_medio
FROM fact_entrenamientos f
JOIN dim_entrenadores e
    ON f.entrenador_id = e.entrenador_id
GROUP BY e.entrenador_id
ORDER BY ticket_medio DESC;


	-- KPI 3.5 EXPERIENCIA DEL ENTRENADOR VS INGRESOS
	-- Relación entre experiencia profesional y rendimiento económico

SELECT
    anios_experiencia,
    AVG(total_ingresos) AS ingreso_medio
FROM (
    SELECT
        e.entrenador_id,
        e.anios_experiencia,
        SUM(f.ingreso_final) AS total_ingresos
    FROM fact_entrenamientos f
    JOIN dim_entrenadores e
        ON f.entrenador_id = e.entrenador_id
    GROUP BY e.entrenador_id, e.anios_experiencia
) ingresos_entrenadores
GROUP BY anios_experiencia
ORDER BY anios_experiencia;


	-- KPI 3.6 EXPERIENCIA DEL ENTRENADOR VS TICKET MEDIO
	-- Relación entre experiencia profesional y valor medio de contratación

SELECT
    e.anios_experiencia,
    AVG(f.ingreso_final) AS ticket_medio
FROM fact_entrenamientos f
JOIN dim_entrenadores e
    ON f.entrenador_id = e.entrenador_id
GROUP BY e.anios_experiencia
ORDER BY e.anios_experiencia;


	-- KPI 3.7 DISTRIBUCIÓN DE EXPERIENCIA DE ENTRENADORES
	-- Composición profesional del conjunto de entrenadores analizados

SELECT
    anios_experiencia,
    COUNT(*) AS numero_entrenadores
FROM dim_entrenadores
GROUP BY anios_experiencia
ORDER BY anios_experiencia;


	-- KPI 3.8 TICKET MEDIO POR SEGMENTO DE EDAD DEL ENTRENADOR
	-- Relación entre edad del entrenador y valor medio de contratación

SELECT
    CASE
        WHEN e.edad < 25 THEN 'Menores de 25'
        WHEN e.edad BETWEEN 25 AND 34 THEN '25-34'
        WHEN e.edad BETWEEN 35 AND 44 THEN '35-44'
        WHEN e.edad BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS rango_edad,
    AVG(f.ingreso_final) AS ticket_medio
FROM fact_entrenamientos f
JOIN dim_entrenadores e
    ON f.entrenador_id = e.entrenador_id
GROUP BY rango_edad
ORDER BY ticket_medio DESC;


	-- KPI 3.9 INGRESOS POR SEGMENTO DE EDAD DEL ENTRENADOR
	-- Distribución del volumen económico según perfil etario del entrenador

SELECT
    CASE
        WHEN e.edad < 25 THEN 'Menores de 25'
        WHEN e.edad BETWEEN 25 AND 34 THEN '25-34'
        WHEN e.edad BETWEEN 35 AND 44 THEN '35-44'
        WHEN e.edad BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS rango_edad,
    SUM(f.ingreso_final) AS ingresos_totales
FROM fact_entrenamientos f
JOIN dim_entrenadores e
    ON f.entrenador_id = e.entrenador_id
GROUP BY rango_edad
ORDER BY ingresos_totales DESC;








