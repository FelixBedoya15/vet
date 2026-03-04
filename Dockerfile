# Cambiamos a una imagen de Java 11 más estable y actualizada
FROM eclipse-temurin:11-jre-focal

WORKDIR /app

# Copiamos el archivo hospital.jar que subimos con LFS
COPY app/hospital.jar hospital.jar

# Exponemos el puerto
EXPOSE 8080

# Comando para iniciar
CMD ["java", "-jar", "hospital.jar"]