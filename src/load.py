import os

OUTPUT_PATH = os.getenv("OUTPUT_PATH", "data/processed/posts_parquet")

def load(df):
    df.write.mode("overwrite").parquet(OUTPUT_PATH)
    print("Data cargada dentro del archivo Parquet")