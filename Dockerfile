FROM openjdk:8-alpine
LABEL maintainer="jameshopbourn@gmail.com"

RUN cat > /etc/apt/sources.list << EOF \
    deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free \
    deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free \
    deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free \
    deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free \
    EOF \
    && apt-get update \
    && apt-get install -y ttf-dejavu fontconfig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

    
ADD target/bypassVerifyCode.jar bypassVerifyCode.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "bypassVerifyCode.jar"]
