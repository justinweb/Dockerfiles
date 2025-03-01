FROM gcc:13.3.0

RUN apt-get update 
RUN apt-get upgrade -y

# https://cynthiachuang.github.io/Change-Timezone-in-Dockerfile/
RUN apt-get update \
    &&  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
    
RUN TZ=Asia/Taipei \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata 

RUN apt-get install -y git cmake openssh-server
RUN mkdir -p /var/run/sshd

COPY run.sh /home
RUN chmod a+x /home/run.sh