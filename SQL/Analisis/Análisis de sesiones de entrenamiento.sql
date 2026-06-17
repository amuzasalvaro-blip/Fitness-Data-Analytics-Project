--- Duración de las sesiones 

SELECT
    ROUND(AVG(duracion_sesion_min), 2) AS duracion_media,
    MIN(duracion_sesion_min) AS duracion_minima,
    MAX(duracion_sesion_min) AS duracion_maxima
FROM core.fact_entrenamientos;


--- Ingresos por sesión

SELECT
    ROUND(AVG(ingreso_bruto), 2) AS ingreso_medio,
    MIN(ingreso_bruto) AS ingreso_minimo,
    MAX(ingreso_bruto) AS ingreso_maximo
FROM core.fact_entrenamientos;


--- Beneficios por sesión

SELECT
    ROUND(AVG(beneficio_gimnasio), 2) AS beneficio_medio,
    MIN(beneficio_gimnasio) AS beneficio_minimo,
    MAX(beneficio_gimnasio) AS beneficio_maximo
FROM fact_entrenamientos;


--- Descuentos de las sesiones

SELECT
    ROUND(AVG(descuento_aplicado), 2) AS descuento_medio,
    MIN(descuento_aplicado) AS descuento_minimo,
    MAX(descuento_aplicado) AS descuento_maximo
FROM fact_entrenamientos;

