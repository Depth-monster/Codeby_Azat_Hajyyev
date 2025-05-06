FROM openjdk:14-slim
COPY target/*jar-with-dependencies.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]

