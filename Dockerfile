FROM maven:3.6.3-openjdk-8 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:jdk-slim-bullseye
COPY --from=build /target/BootMVCProj8-MVC-CRM-CRUDAPP-1.1.jar BootMVCProj8-MVC-CRM-CRUDAPP.jar
EXPOSE 9999
ENTRYPOINT ["java","-jar","BootMVCProj8-MVC-CRM-CRUDAPP.jar"]