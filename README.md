# ETL con PySpark + Data Lake (Dockerizado)

## Objetivo

Construir un pipeline de datos end-to-end que:

- Extrae datos desde una API pública
- Transforma los datos usando PySpark
- Persiste la información en formato optimizado (Parquet)
- Deja los datos listos para consumo analítico (BI / Data Science)

---

## Arquitectura

[API] → Extract → Transform (Spark) → Load → Data Lake (Parquet)

---

## Estructura del proyecto

```bash
etl-spark-project/
│
├── data/                  # Data Lake local (volumen Docker)
│   ├── raw/
│   └── processed/
│
├── src/
│   ├── extract.py
│   ├── transform.py
│   ├── load.py
│   └── main.py
│
├── requirements.txt
├── Dockerfile
├── docker-compose.yml
└── README.md
```

---

## Origen de datos

API pública:

[https://jsonplaceholder.typicode.com/posts](https://jsonplaceholder.typicode.com/posts)

---

## Ejecución

### Opción 1: Docker (recomendada)

```bash
docker-compose up --build
```

Esto:

- Ejecuta el pipeline ETL
- Persiste datos en un volumen Docker (Data Lake local)
- Levanta un entorno Jupyter para exploración

👉 Jupyter:

- URL: [http://localhost:8888](http://localhost:8888)
- Token: `dev`

---

### Opción 2: Ejecución manual

```bash
pip install -r requirements.txt
python src/main.py
```

---

## Persistencia de datos

El proyecto utiliza volúmenes Docker para desacoplar almacenamiento del contenedor.

Salida esperada:

```bash
data/processed/posts_parquet/
├── part-00000-*.parquet
└── _SUCCESS
```

> Nota: Apache Spark genera múltiples archivos (particiones), no un único archivo.

---

## Exploración de datos (Jupyter)

Ejemplo de lectura:

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()

df = spark.read.parquet("data/processed/posts_parquet")
df.show()
```

---

## Configuración

Variables de entorno:

```env
RAW_PATH=/opt/app/data/raw/posts.json
OUTPUT_PATH=/opt/app/data/processed/posts_parquet
```

---

## Conceptos aplicados

- ETL (Extract, Transform, Load)
- Procesamiento distribuido con PySpark
- Data Lake (formato Parquet)
- Contenerización con Docker
- Orquestación con docker-compose
- Separación de configuración vía variables de entorno

---

## Posibles mejoras

- Particionado por fecha (data partitioning)
- Integración con almacenamiento cloud (S3 / Azure Data Lake)
- Orquestación con Airflow o Azure Data Factory
- Catálogo de datos (Hive Metastore / Glue)
- Exposición a herramientas BI (Power BI)

---

## Autor

Marco Hernández
Marzo 2026
