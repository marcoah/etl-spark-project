# Imagen base con Java 11 ya instalado
FROM eclipse-temurin:17-jdk

# Instalar Python y pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Crear directorio de trabajo
WORKDIR /app

# Copiar tu código
COPY . .

# Instalar dependencias de Python (con override de PEP 668)
RUN pip install --no-cache-dir --break-system-packages -r requirements.txt

# Ejecutar el pipeline
CMD ["python3", "src/main.py"]