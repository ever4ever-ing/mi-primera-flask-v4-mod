# Mascotas App

## Desarrollo
bash
docker-compose up --build


## Producción
bash
docker-compose -f docker-compose.prod.yml up --build
Las principales diferencias en la versión de producción son:
1. Uso de Gunicorn como servidor WSGI
2. Build en múltiples etapas para reducir el tamaño de la imagen
3. Configuración específica para producción
4. Restart policy configurado como "always"

``` 
#!/bin/bash

# Actualizar el sistema
sudo apt-get update
sudo apt-get upgrade -y

# Instalar dependencias necesarias
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    git

# Instalar Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Instalar Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Clonar el repositorio (reemplaza con tu URL)
git clone <URL-DEL-REPOSITORIO> mascotas-app
cd mascotas-app

# Iniciar la aplicación en modo producción
sudo docker-compose -f docker-compose.prod.yml up --build -d

```
Para trabajar en desarrollo, seguirías usando los archivos actuales:
