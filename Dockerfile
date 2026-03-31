# Use OpenJDK 17 as the base image
FROM openjdk:17-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy the Spring Boot JAR into the container
COPY target/*.jar app.jar

# Expose the port (Render provides PORT environment variable)
EXPOSE 8080

# Run the Spring Boot app with dynamic port
ENTRYPOINT ["sh", "-c", "java -Dserver.port=$PORT -jar app.jar"]
