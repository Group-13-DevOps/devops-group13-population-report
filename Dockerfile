# syntax=docker/dockerfile:1

# ---- Build stage ----
FROM maven:3.9.9-eclipse-temurin-24 AS build
WORKDIR /app
COPY pom.xml .
# Cache dependencies first
RUN mvn -q -DskipTests dependency:go-offline
# Now copy sources and build
COPY src ./src
RUN mvn -q -DskipTests package

# ---- Runtime stage ----
FROM eclipse-temurin:24-jre
WORKDIR /app
# If you build a shaded jar, the *-jar-with-dependencies.jar pattern works;
# otherwise adjust to your actual artifact name under target/
COPY --from=build /app/target/*-jar-with-dependencies.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
