#/bin/bash

#creating bridge networkи
docker network create wp-net

#init volumes
docker volume create wp-db
docker volume create wp-data

#MYSQL
docker run -d \
  --name wordpress-db \
  --network wp-net \
  -v wp-db:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=rootpassword \
  -e MYSQL_DATABASE=wordpress \
  -e MYSQL_USER=wordpress \
  -e MYSQL_PASSWORD=wordpress \
  --restart always \
  mysql:5.7

#create a dir fo apache configs for bind-mount
mkdir -p apache-config

#creating Wordpress container with built in Apache
docker run -d \
  --name wordpress-app \
  --network wp-net \
  --link wordpress-db:db \
  -v wp-data:/var/www/html \
  -v $(pwd)/apache-config:/etc/apache2/sites-available \
  -p 8080:80 \
  -e WORDPRESS_DB_HOST=wordpress-db \
  -e WORDPRESS_DB_USER=wordpress \
  -e WORDPRESS_DB_PASSWORD=wordpress \
  -e WORDPRESS_DB_NAME=wordpress \
  --restart always \
  wordpress:latest
