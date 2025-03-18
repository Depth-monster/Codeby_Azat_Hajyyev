#syntax= docker/dockerfile:1

FROM debian:11
RUN apt-get update && apt-get install -y nginx
RUN mkdir -p /opt/www
RUN echo "<h1>SECOND example DEBIAN:11 with Entrypoint</h1>" > /opt/www/index.html

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080
ENTRYPOINT ["nginx", "-g", "daemon off;"]
