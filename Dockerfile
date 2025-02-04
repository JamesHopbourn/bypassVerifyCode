FROM openjdk:8-alpine
LABEL maintainer="jameshopbourn@gmail.com"

COPY *.apk ./

# 安装这些包
RUN apk add --allow-untrusted *.apk

# 清理
RUN rm -rf /tmp/packages

    
ADD target/bypassVerifyCode.jar bypassVerifyCode.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "bypassVerifyCode.jar"]
