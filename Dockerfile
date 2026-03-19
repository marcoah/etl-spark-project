# Imagen oficial de Spark (ya trae Java + Spark configurado)
FROM spark:3.5.1

# Cambiar a root para instalar paquetes
USER root

# Instalar Python y pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Crear symlink (algunas imágenes usan python en vez de python3)
RUN ln -s /usr/bin/python3 /usr/bin/python

# Definir variables útiles
ENV PYSPARK_PYTHON=python3

# Crear directorio de trabajo
WORKDIR /opt/app

# Copiar código
COPY . .

# Crear carpeta de datos y dar permisos
RUN mkdir -p data/raw data/processed && \
    chown -R spark:spark /opt/app

# Instalar dependencias Python
RUN pip3 install --no-cache-dir -r requirements.txt

# Cambiar a usuario seguro
USER spark

# Ejecutar con spark-submit
CMD ["spark-submit", "src/main.py"]