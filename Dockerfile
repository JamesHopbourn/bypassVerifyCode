FROM openjdk:8-alpine
LABEL maintainer="jameshopbourn@gmail.com"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

#采用tini运行java,提高运行可靠性，防止僵尸进程，并且方便适应jdk自带命令
RUN apk add --update --no-cache ttf-dejavu fontconfig busybox-extras iproute2 lrzsz unzip curl net-tools tcpdump wget&& \
    apk --update --no-cache add tini && \
    rm -rf /var/cache/apk/*
    
ADD target/bypassVerifyCode.jar bypassVerifyCode.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "bypassVerifyCode.jar"]
