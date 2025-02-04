FROM openjdk:8-alpine
LABEL maintainer="jameshopbourn@gmail.com"

# 更新 Alpine 的软件源为阿里云镜像，并安装所需包
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update && \
    apk add --no-cache ttf-dejavu fontconfig
    
ADD target/bypassVerifyCode.jar bypassVerifyCode.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "bypassVerifyCode.jar"]
