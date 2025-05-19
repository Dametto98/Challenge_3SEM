# Use a imagem JRE (mais leve que o JDK)
FROM eclipse-temurin:17-jre-alpine

# Diretório de trabalho
WORKDIR /app

# Copie o arquivo JAR (ajuste o caminho conforme sua estrutura)
COPY ./MottoMap-JavaBackend/target/*.jar app.jar

# Exponha a porta padrão do Spring Boot
EXPOSE 8080

# Comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]  