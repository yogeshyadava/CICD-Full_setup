# Base Image
FROM eclipse-temurin:11-jre-jammy

# Working directory
WORKDIR /app

# Copy jar file
COPY target/javaapp-1.0.jar app.jar

# Expose port
EXPOSE 8080

# Run app
CMD ["java", "-jar", "app.jar"]
