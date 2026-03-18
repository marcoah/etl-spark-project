import requests
import json
import os

RAW_PATH = "data/raw/posts.json"

def extract():
    url = "https://jsonplaceholder.typicode.com/posts"
    response = requests.get(url)
    data = response.json()

    os.makedirs("data/raw", exist_ok=True)

    with open(RAW_PATH, "w") as f:
        json.dump(data, f)

    print("Data extracted successfully")

if __name__ == "__main__":
    extract()