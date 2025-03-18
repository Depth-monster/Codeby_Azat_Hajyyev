# syntax=docker/dockerfile:1

# Этап 1: Сборка приложения
FROM node:18 AS build
WORKDIR /app

# Копируем файлы зависимостей и устанавливаем их
COPY package*.json ./
RUN npm install

# Копируем все файлы проекта
COPY . .

# Выполняем сборку приложения
# Предполагается, что сборка создаёт папку dist (по умолчанию для Vite или Create React App)
RUN npm run build

# Этап 2: Запуск приложения с помощью Nginx
FROM nginx:alpine

# Копируем кастомный конфиг Nginx, чтобы изменить порт на 5177
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Копируем сгенерированную сборку из предыдущего этапа
COPY --from=build /app/dist /usr/share/nginx/html

# Информируем Docker, что контейнер слушает на порту 5177
EXPOSE 5177

# Запускаем Nginx в режиме foreground
CMD ["nginx", "-g", "daemon off;"]

