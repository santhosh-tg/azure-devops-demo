# ---------- Stage 1: Build the application ----------
    FROM maven:3.9.4-eclipse-temurin-17 AS builder

    WORKDIR /app
    
    # Copy only pom.xml first to leverage Docker layer caching
    COPY pom.xml .
    RUN mvn dependency:go-offline
    
    # Copy the rest of the source code
    COPY src ./src
    
    # Build the application with dependencies
    RUN mvn clean package -DskipTests
    
    # ---------- Stage 2: Minimal runtime image ----------
    FROM eclipse-temurin:17-jre-alpine
    
    # Create a non-root user
    RUN addgroup -S appgroup && adduser -S appuser -G appgroup
    
    WORKDIR /app
    
    # Copy the built JAR from the builder stage
    COPY --from=builder /app/target/hello-world-1.0-SNAPSHOT-jar-with-dependencies.jar app.jar
    
    # Set permissions
    RUN chown -R appuser:appgroup /app
    
    # Use a non-root user
    USER appuser
    
    # Run the app
    ENTRYPOINT ["java", "-jar", "app.jar"]
    