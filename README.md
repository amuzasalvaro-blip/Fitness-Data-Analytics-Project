# Proyecto Final - Análisis del Sector de Gimnasios

## Descripción

Proyecto de análisis de datos centrado en el sector de los gimnasios, desarrollado mediante Python, SQL y Power BI. El proyecto recorre todo el ciclo de análisis de datos, desde la preparación y transformación de la información hasta la construcción de un dashboard interactivo para la visualización de métricas y KPIs de negocio.

## Objetivos

- Analizar el comportamiento de clientes, entrenadores y gimnasios.
- Diseñar un modelo dimensional basado en esquema estrella.
- Aplicar procesos de limpieza y transformación de datos.
- Realizar consultas analíticas mediante SQL.
- Desarrollar un dashboard interactivo en Power BI.
- Obtener indicadores clave para la toma de decisiones.

## Herramientas utilizadas

- Python (Google Colab)
- SQL (DBeaver)
- Power BI
- Git
- GitHub

## Estructura del proyecto

### 📁 csv

Contiene las tablas finales generadas para el modelo dimensional.

- dim_clientes.csv
- dim_entrenadores.csv
- dim_fechas.csv
- dim_gimnasios.csv
- dim_pagos.csv
- fact_sesiones.csv

### 📁 dataset

Contiene el conjunto de datos original utilizado en el proyecto.

- Sesiones de Entrenamientos Final.csv

### 📁 imagenes

Capturas y visualizaciones generadas durante el desarrollo del proyecto.

#### Dashboard
- Dashboard Análisis Clientes
- Dashboard Análisis Entrenadores
- Dashboard Resumen Ejecutivo

#### DBeaver
- Distribución de Registros
- Modelo Estrella
- Tablas y Vistas

#### Python
- Distribución de registros
- Ingreso y beneficio por gimnasio
- Modelo estrella
- Número de sesiones por entrenador físico
- Relación entre rating y beneficio
- Tablas y vistas

### 📁 power_bi

Contiene el dashboard final desarrollado en Power BI.

- Dashboard Final.pbix

### 📁 python

Memoria técnica completa desarrollada en Google Colab.

Incluye:

- Limpieza y preparación de datos.
- Transformación de variables.
- Creación de tablas dimensionales.
- Análisis exploratorio de datos.
- Visualizaciones.
- Preparación de datos para SQL y Power BI.

### 📁 sql

Scripts utilizados para la construcción y explotación analítica de la base de datos.

#### Análisis
Consultas orientadas al análisis de negocio:

- Análisis Clientes
- Análisis Entrenadores
- Análisis Gimnasios
- Análisis de negocio
- Análisis de sesiones de entrenamiento

#### Constraints
- fk_constraints.sql

#### Dimensiones
- dim_clientes.sql
- dim_entrenadores.sql
- dim_fechas.sql
- dim_gimnasios.sql
- dim_pagos.sql

#### Esquemas
- esquemas.sql

#### Facts
- fact_entrenamientos.sql

#### Vistas
- vw_base_entrenamientos.sql
- vw_cliente_metricas.sql
- vw_entrenador_rendimiento.sql
- vw_gimnasio_metricas.sql
- vw_kpi_mensual.sql

## Flujo de trabajo

1. Obtención del dataset.
2. Limpieza y transformación de datos mediante Python.
3. Diseño del modelo dimensional.
4. Exportación de tablas a formato CSV.
5. Implementación del modelo en SQL.
6. Creación de consultas analíticas y vistas.
7. Desarrollo del dashboard en Power BI.
8. Obtención de conclusiones de negocio.

## Resultados

El proyecto permite analizar indicadores relevantes relacionados con clientes, entrenadores, sesiones de entrenamiento, ingresos y rendimiento de los gimnasios mediante una combinación de análisis descriptivo, consultas SQL y visualización interactiva.

## Autor

**Álvaro Muzás Antuña**

Proyecto Final de Analítica de Datos.
