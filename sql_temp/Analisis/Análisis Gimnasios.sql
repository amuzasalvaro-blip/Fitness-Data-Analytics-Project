--- Tipo de gimansio

SELECT
    tipo_gimnasio,
    COUNT(*) AS total_gimnasios
FROM dim_gimnasios
GROUP BY tipo_gimnasio
ORDER BY total_gimnasios DESC;


---Antigüedad de los gimnasios
SELECT
    MIN(anio_apertura) AS anio_apertura_mas_antiguo,
    MAX(anio_apertura) AS anio_apertura_mas_reciente,
    ROUND(AVG(anio_apertura), 0) AS anio_apertura_medio
FROM dim_gimnasios;


--- Cuota mensual de los gimnasios

SELECT
    ROUND(AVG(cuota_mensual), 2) AS cuota_media,
    MIN(cuota_mensual) AS cuota_minima,
    MAX(cuota_mensual) AS cuota_maxima
FROM dim_gimnasios;

