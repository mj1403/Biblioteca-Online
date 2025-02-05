#Version con jdk17
FROM maven:3.8.5-openjdk-17 as build
COPY . .
RUN mvn clean package -DskipTests
 
FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/biblioteca-1.jar biblioteca.jar
EXPOSE 80
ENTRYPOINT ["java","-jar","biblioteca.jar"]