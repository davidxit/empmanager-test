FROM openjdk:16-jdk-alpine
COPY target/*.jar employee-manager.jar
ENTRYPOINT ["java","-jar","/employee-manager.jar"]