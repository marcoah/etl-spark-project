from extract import extract
from transform import transform
from load import load

def run_pipeline():
    print("Iniciando flujo ETL ...")

    extract()
    df = transform()
    load(df)

    print("Flujo completado satisfactoriamente")
    print("¡MH te desea un lindo día!")

if __name__ == "__main__":
    run_pipeline()