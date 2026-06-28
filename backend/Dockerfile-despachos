# Etapa 1: Compilación
FROM maven:3.8.8-eclipse-temurin-17 AS build
WORKDIR /app
COPY despachos/pom.xml .
RUN mvn dependency:go-offline
COPY despachos/src ./src
RUN mvn clean package -DskipTests

# Etapa 2: Ejecución con puerto 8081 para desoachos
FROM eclipse-temurin:17-jre
WORKDIR /app
RUN groupadd -r appgroup && useradd -r -g appgroup appuser
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8081
USER appuser
ENTRYPOINT ["java", "-jar", "app.jar"]