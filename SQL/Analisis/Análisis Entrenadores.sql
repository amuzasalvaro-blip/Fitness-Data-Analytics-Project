--- Especialidades predominantes

SELECT
    especialidades ,
    COUNT(*) AS total_entrenadores
FROM dim_entrenadores
GROUP BY especialidades
ORDER BY total_entrenadores DESC;


--- Experiencia de los entrenadores

SELECT
    ROUND(AVG(anios_experiencia), 2) AS experiencia_media,
    MIN(anios_experiencia) AS experiencia_minima,
    MAX(anios_experiencia) AS experiencia_maxima
FROM dim_entrenadores;


--- Nivel de los entrenadores

SELECT
    nivel_entrenador,
    COUNT(*) AS total_entrenadores
FROM dim_entrenadores
GROUP BY nivel_entrenador
ORDER BY total_entrenadores DESC;


--- Valoración de los entrenadores

SELECT
    ROUND(AVG(rating_medio), 2) AS valoracion_media,
    MIN(rating_medio) AS valoracion_minima,
    MAX(rating_medio) AS valoracion_maxima
FROM dim_entrenadores;




