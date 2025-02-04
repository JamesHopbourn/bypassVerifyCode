FROM openjdk:8-alpine
LABEL maintainer="jameshopbourn@gmail.com"


    
ADD target/bypassVerifyCode.jar bypassVerifyCode.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "bypassVerifyCode.jar"]
