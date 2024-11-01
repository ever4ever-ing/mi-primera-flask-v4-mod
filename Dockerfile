# Etapa de construcción de la aplicación Python
FROM python:3.9-slim as builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Etapa final con Nginx
FROM nginx:alpine

# Copiar la configuración de Nginx
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Copiar la aplicación Python desde la etapa anterior
COPY --from=builder /app /app
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages

# Instalar Python en Alpine
RUN apk add --no-cache python3 supervisor

# Configurar Supervisor para manejar múltiples procesos
COPY supervisord.conf /etc/supervisord.conf

EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]