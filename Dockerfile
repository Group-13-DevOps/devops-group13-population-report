# syntax=docker/dockerfile:1
# ---- Build stage ----
FROM maven:3.9.8-eclipse-temurin-24 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -B -q -DskipTests dependency:go-offline
COPY src ./src
RUN mvn -B -q -DskipTests package

# ---- Runtime stage ----
FROM eclipse-temurin:24-jre
WORKDIR /app
COPY --from=build /app/target/world-population-report-jar-with-dependencies.jar /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]
