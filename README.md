# Proyecto de ejemplo de ETL con PySpark + Data Lake

## Objetivo

Construir un pipeline que:

- Extrae datos desde una API (o CSV simulado)
- Transforma los datos con PySpark
- Los guarda en formato optimizado (Parquet)
- Deja todo listo para consumo analítico (BI)

## Arquitectura

[API / CSV] → [Extract] → [Transform (Spark)] → [Load → Data Lake (Parquet)]

## Estructura

´´´
etl-spark-project/
│
├── data/
│ ├── raw/
│ └── processed/
│
├── src/
│ ├── extract.py
│ ├── transform.py
│ ├── load.py
│ └── main.py
│
├── requirements.txt
├── Dockerfile
└── README.md
´´´

## Origen datos

API: https://jsonplaceholder.typicode.com/posts

## Cómo correrlo

### Con Docker

Si estas en Windows recuerda Levantar Docker primero (Docker Desktop)
´´´
!bash
docker build -t etl-spark .
docker run etl-spark
´´´

#### Montar contenedor

linux: docker run -v $(pwd)/data:/opt/app/data etl-spark
Salida en: /opt/app/data

Windows:
´´´
powershell
docker run -v "C:\ruta\completa\tu_proyecto\data:/opt/app/data" etl-spark

### Sin Docker

pip install -r requirements.txt
python src/main.py

## Opcion contenedor completo

docker-compose up --build

Que hace esto:

- Corre el ETL
- Guarda Parquet en ./data
- Levanta Jupyter en: http://localhost:8888
- Tu token: dev

Notas: La imagen completa requiere 1.8GB de descarga.

## Autor

Marco Hernandez 2026
