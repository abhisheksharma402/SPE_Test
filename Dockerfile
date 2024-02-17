# Use a base Java image
FROM openjdk:latest

# Set the working directory
WORKDIR /app

# Copy the Java program into the container
COPY SPE_Project.java /app

# Compile the Java program
RUN javac SPE_Project.java

# Run the Java program
CMD ["java", "SPE_Project"]
