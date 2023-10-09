
FROM proglab/ubuntu-dev:1.0
MAINTAINER Justin your-email@mail.server

USER root

RUN apt install autoconf automake libtool -y
RUN apt install unixodbc unixodbc-dev -y
RUN apt update
RUN apt install libssl-dev -y

USER ubuntu

#WORKDIR /home/ubuntu/source

#RUN wget https://www.unixodbc.org/unixODBC-2.3.11.tar.gz
#RUN tar -xvf unixODBC-2.3.11.tar.gz

#WORKDIR /home/ubuntu/source/unixODBC-2.3.11
#RUN autoreconf -fi
#RUN ./configure
#RUN make

USER root

#RUN make install

RUN ssh-keygen -A
