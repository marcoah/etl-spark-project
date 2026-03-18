from pyspark.sql import SparkSession
from pyspark.sql.functions import col, length

RAW_PATH = "data/raw/posts.json"

def transform():
    spark = SparkSession.builder \
        .appName("ETL Spark Project") \
        .getOrCreate()

    df = spark.read.json(RAW_PATH)

    # Limpieza básica
    df_clean = df.dropna()

    # Feature engineering simple
    df_transformed = df_clean.withColumn("title_length", length(col("title")))

    return df_transformed