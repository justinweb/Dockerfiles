FROM proglab/ubuntu-gogs-build:0.1
MAINTAINER Justin Justin1021@gmail.com

#RUN apt-get update 
#RUN apt-get upgrade -y

ENV PATH $PATH:/usr/local/go/bin
WORKDIR /tmp
RUN git clone --depth 1 https://github.com/gogs/gogs.git gogs
RUN cd gogs
WORKDIR /tmp/gogs
RUN go build -o gogs

