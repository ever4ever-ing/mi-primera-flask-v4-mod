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

Para trabajar en desarrollo, seguirías usando los archivos actuales:
