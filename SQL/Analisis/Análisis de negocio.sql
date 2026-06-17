-- Franjas horarias con mayor demanda

SELECT
    franja_horaria,
    COUNT(*) AS total_sesiones
FROM fact_entrenamientos f
JOIN dim_clientes c
    ON f.cliente_id = c.cliente_id
GROUP BY franja_horaria
ORDER BY total_sesiones DESC;


-- Experiencia de los entrenadores

SELECT
    CASE
        WHEN e.anios_experiencia BETWEEN 1 AND 8 THEN '1-8 años'
        WHEN e.anios_experiencia BETWEEN 9 AND 15 THEN '9-15 años'
        WHEN e.anios_experiencia BETWEEN 16 AND 22 THEN '16-22 años'
        ELSE 'Más de 22 años'
    END AS grupo_experiencia,
    ROUND(AVG(f.beneficio_gimnasio), 2) AS beneficio_medio
FROM fact_entrenamientos f
JOIN dim_entrenadores e
    ON f.entrenador_id = e.entrenador_id
GROUP BY grupo_experiencia
ORDER BY beneficio_medio DESC;


-- Especialidades mas demandadas

SELECT
    especialidades,
    COUNT(*) AS total_sesiones
FROM fact_entrenamientos f
JOIN dim_entrenadores e
    ON f.entrenador_id = e.entrenador_id
GROUP BY especialidades
ORDER BY total_sesiones DESC;


-- Influencia de los descuentos

SELECT
    porcentaje_descuento,
    COUNT(*) AS total_sesiones,
    ROUND(AVG(beneficio_gimnasio), 2) AS beneficio_medio
FROM fact_entrenamientos
GROUP BY porcentaje_descuento
ORDER BY porcentaje_descuento;


-- Consultas de perfiles de los clientes más activos:

-- 1. Perfil clientes edades

SELECT
    CASE
        WHEN edad < 25 THEN 'Menos de 25'
        WHEN edad BETWEEN 25 AND 34 THEN '25-34'
        WHEN edad BETWEEN 35 AND 44 THEN '35-44'
        WHEN edad BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 o más'
    END AS grupo_edad,
    ROUND(AVG(sesiones_contratadas_mes), 2) AS sesiones_medias
FROM dim_clientes
GROUP BY grupo_edad
ORDER BY sesiones_medias DESC;


-- 2. Perfil clientes nivel fisico
SELECT
    nivel_fisico,
    ROUND(AVG(sesiones_contratadas_mes),2) AS media_sesiones,
    COUNT(*) AS numero_clientes
FROM dim_clientes
GROUP BY nivel_fisico
ORDER BY media_sesiones DESC;


-- 3. Lesiones previas

SELECT
    lesiones_previas,
    ROUND(AVG(sesiones_contratadas_mes),2) AS media_sesiones,
    COUNT(*) AS numero_clientes
FROM dim_clientes
GROUP BY lesiones_previas
ORDER BY media_sesiones DESC;


-- 4. Condición médica

SELECT
    condicion_medica,
    ROUND(AVG(sesiones_contratadas_mes), 2) AS sesiones_medias,
    COUNT(*) AS numero_clientes
FROM dim_clientes
GROUP BY condicion_medica
ORDER BY sesiones_medias DESC;


-- 5. Franja horaria

SELECT
    franja_horaria,
    ROUND(AVG(sesiones_contratadas_mes),2) AS media_sesiones,
    COUNT(*) AS numero_clientes
FROM dim_clientes
GROUP BY franja_horaria
ORDER BY media_sesiones DESC;



-- Comparativa entre gimnasios

--Comparativa por tipo de gimnasio

SELECT
    g.tipo_gimnasio,
    ROUND(SUM(f.ingreso_bruto), 2) AS ingreso_total,
    ROUND(SUM(f.beneficio_gimnasio), 2) AS beneficio_total,
    COUNT(*) AS total_sesiones
FROM fact_entrenamientos f
JOIN dim_gimnasios g
    ON f.gimnasio_id = g.gimnasio_id
GROUP BY g.tipo_gimnasio
ORDER BY beneficio_total DESC;


-- Comparativa según año de apertura

SELECT
    CASE
        WHEN anio_apertura < 2000 THEN 'Antes de 2000'
        WHEN anio_apertura BETWEEN 2000 AND 2009 THEN '2000-2009'
        WHEN anio_apertura BETWEEN 2010 AND 2019 THEN '2010-2019'
        ELSE '2020 o posterior'
    END AS periodo_apertura,
    ROUND(SUM(f.ingreso_bruto), 2) AS ingreso_total,
    ROUND(SUM(f.beneficio_gimnasio), 2) AS beneficio_total,
    COUNT(*) AS total_sesiones
FROM fact_entrenamientos f
JOIN dim_gimnasios g
    ON f.gimnasio_id = g.gimnasio_id
GROUP BY periodo_apertura
ORDER BY beneficio_total DESC;


