FROM wordpress:latest

RUN apt update -y

RUN TZ=Asia/Taipei \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

RUN apt install sudo net-tools -y

#docker build -t proglab/wordpress:1.0 .
