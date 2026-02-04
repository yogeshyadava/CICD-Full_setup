# Base Image
FROM openjdk:11-jre-slim

# Working directory
WORKDIR /app

# Copy jar file
COPY target/javaapp-1.0.jar app.jar

# Expose port
EXPOSE 8080

# Run app
CMD ["java", "-jar", "app.jar"]
