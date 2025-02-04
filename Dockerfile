FROM openjdk8-jre-alpine-with-fontconfig
LABEL maintainer="jameshopbourn@gmail.com"

    
ADD target/bypassVerifyCode.jar bypassVerifyCode.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "bypassVerifyCode.jar"]
