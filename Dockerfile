
FROM eclipse-temurin:24-jdk AS build
WORKDIR /app

# Maven Wrapper files
COPY .mvn/ .mvn/
COPY mvnw .
RUN chmod +x mvnw

# Pre-fetch deps, then compile/package
COPY pom.xml .
RUN ./mvnw -q -DskipTests dependency:go-offline

COPY src ./src
RUN ./mvnw -q -DskipTests package

# ---- Runtime stage (JRE 24) ----
FROM eclipse-temurin:24-jre
WORKDIR /app

# Copy the fat jar built by the assembly plugin
# (your build produces *-jar-with-dependencies.jar)
COPY --from=build /app/target/*-with-dependencies.jar /app/app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]