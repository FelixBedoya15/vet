# Usa una imagen base de Java 11 (que es la que suele usar HSI)
FROM openjdk:11-jre-slim

# Crea el directorio de la aplicación
WORKDIR /app

# Copia el archivo hospital.jar que subimos con LFS
COPY app/hospital.jar hospital.jar

# Expone el puerto por defecto de Spring Boot
EXPOSE 8080

# Comando para iniciar la aplicación
CMD ["java", "-jar", "hospital.jar"]