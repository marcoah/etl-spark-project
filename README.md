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

## Origen datos

API: https://jsonplaceholder.typicode.com/posts

## Cómo correrlo

Si estas en Windows recuerda Levantar Docker primero (Docker Desktop)
´´´
!bash
docker build -t etl-spark .
docker run etl-spark
´´´
o sin Docker:

pip install -r requirements.txt
python src/main.py

## Autor

Marco Hernandez 2026
