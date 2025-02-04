FROM openjdk:8-alpine
LABEL maintainer="jameshopbourn@gmail.com"


# 更新Alpine源为阿里云镜像，并安装必要的工具
# sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
RUN apk update && \
    apk add --no-cache \
        ttf-dejavu \
        fontconfig \
        busybox-extras \
        iproute2 \
        lrzsz \
        unzip \
        curl \
        net-tools \
        tcpdump \
        wget && \
    rm -rf /var/cache/apk/*

    
ADD target/bypassVerifyCode.jar bypassVerifyCode.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "bypassVerifyCode.jar"]
