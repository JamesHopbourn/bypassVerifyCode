FROM openjdk:8-alpine
LABEL maintainer="jameshopbourn@gmail.com"


RUN apk add --update ttf-dejavu fontconfig && rm -rf /var/cache/apk/*

    
ADD target/bypassVerifyCode.jar bypassVerifyCode.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "bypassVerifyCode.jar"]
