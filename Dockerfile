FROM maven:3.2.0-17 as build
WORKDIR /index
COPY . .
RUN mvn clean package -X -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /index
COPY --from=build ./app/target/*.jar ./search-0.0.1-SNAPSHOT.jar
ENTRYPOINT java -jar search-0.0.1-SNAPSHOT.jar