FROM ubuntu
MAINTAINER Justin Justin1021@gmail.com

RUN apt-get update 
RUN apt-get upgrade -y

# https://cynthiachuang.github.io/Change-Timezone-in-Dockerfile/
RUN apt-get update \
    &&  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
    
RUN TZ=Asia/Taipei \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata 

RUN apt-get install -y vim wget git
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

COPY run.sh /home
