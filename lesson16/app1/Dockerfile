# syntax=docker/dockerfile:1

# Используем базовый образ alpine:latest
FROM alpine:latest

# Обновляем репозитории и устанавливаем nginx
RUN apk update && apk add --no-cache nginx

# Создаем директорию для сайта
RUN mkdir -p /opt/www

# Создаем файл index.html в директории /opt/www
RUN echo "<html><body><h1>Hello from nginx on Alpine!</h1></body></html>" > /opt/www/index.html

# Создаем конфигурационный файл nginx
RUN echo "worker_processes 1;" > /etc/nginx/nginx.conf && \
    echo "events { worker_connections 1024; }" >> /etc/nginx/nginx.conf && \
    echo "http {" >> /etc/nginx/nginx.conf && \
    echo "    server {" >> /etc/nginx/nginx.conf && \
    echo "        listen 80;" >> /etc/nginx/nginx.conf && \
    echo "        server_name localhost;" >> /etc/nginx/nginx.conf && \
    echo "        location / {" >> /etc/nginx/nginx.conf && \
    echo "            root /opt/www;" >> /etc/nginx/nginx.conf && \
    echo "            index index.html;" >> /etc/nginx/nginx.conf && \
    echo "        }" >> /etc/nginx/nginx.conf && \
    echo "    }" >> /etc/nginx/nginx.conf && \
    echo "}" >> /etc/nginx/nginx.conf

# Открываем порт 80 для доступа к nginx
EXPOSE 80

# Запускаем nginx в режиме foreground
CMD ["nginx", "-g", "daemon off;"]
