# syntax=docker/dockerfile:1

# ---- Build stage (JDK 24 + Maven Wrapper) ----
FROM eclipse-temurin:24-jdk AS build
WORKDIR /app

# Copy Maven Wrapper and fix Windows line endings, then make executable
COPY .mvn/ .mvn/
COPY mvnw .
RUN sed -i 's/\r$//' mvnw && chmod +x mvnw

# Prefetch deps for offline build, then compile/package
COPY pom.xml .
RUN ./mvnw -q -DskipTests dependency:go-offline

COPY src ./src
RUN ./mvnw -q -DskipTests package

# ---- Runtime stage (JRE 24) ----
FROM eclipse-temurin:24-jre
WORKDIR /app

# Copy the built jar (fat jar if present, otherwise the only jar)
COPY --from=build /app/target/*.jar /app/app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
