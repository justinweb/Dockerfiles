
FROM proglab/ubuntu-dev:1.0
MAINTAINER Justin your-email@mail.server

USER root

RUN apt install autoconf automake libtool -y
RUN apt update
RUN apt install libssl-dev -y
RUN apt update

USER root
RUN ssh-keygen -A

