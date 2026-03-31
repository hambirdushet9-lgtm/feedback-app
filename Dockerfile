# Stage 1: Build the Spring Boot JAR using Maven
FROM maven:3.9.2-eclipse-temurin-17 AS build
WORKDIR /app

# Copy Maven config and source code
COPY pom.xml .
COPY src ./src

# Build the JAR without running tests
RUN mvn clean package -DskipTests

# Stage 2: Create a lightweight image to run the app
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy the built JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port (Render provides $PORT)
EXPOSE 8080

# Run the Spring Boot app
ENTRYPOINT ["sh", "-c", "java -Dserver.port=$PORT -jar app.jar"]
