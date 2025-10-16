# syntax=docker/dockerfile:1
# ---- Build stage ----
FROM maven:3.9.8-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -q -DskipITs dependency:go-offline
COPY src ./src
RUN mvn -q -DskipITs package

# ---- Runtime stage ----
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/target/*-with-dependencies.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
