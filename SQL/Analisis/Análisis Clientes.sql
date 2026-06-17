--- Distribución por género

SELECT
    genero,
    COUNT(*) AS total_clientes
FROM dim_clientes
GROUP BY genero;


--- Distribución por edad

SELECT
    ROUND(AVG(edad), 2) AS edad_media,
    MIN(edad) AS edad_minima,
    MAX(edad) AS edad_maxima
FROM dim_clientes;


--- Distribución por nivel físico

SELECT
    nivel_fisico,
    COUNT(*) AS total_clientes
FROM dim_clientes
GROUP BY nivel_fisico
ORDER BY total_clientes DESC;


--- Distribución por franja horaria

SELECT
    franja_horaria,
    COUNT(*) AS total_clientes
FROM dim_clientes
GROUP BY franja_horaria
ORDER BY total_clientes DESC;