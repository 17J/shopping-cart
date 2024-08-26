FROM openjdk:17-alpine AS builder
RUN apk add --no-cache ca-certificates && update-ca-certificates
WORKDIR /app
RUN apk add --no-cache maven
COPY . .
RUN mvn clean package -DskipTests=true
FROM tomcat:9-alpine
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
