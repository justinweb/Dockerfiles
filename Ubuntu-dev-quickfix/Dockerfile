FROM ubuntu:20.04
LABEL maintainer="Justin your-email@mail.server"

ARG mypassword=0011111
ARG UID=1000
ARG GID=1000
ARG UName=ubuntu

RUN apt-get update -y

RUN TZ=Asia/Taipei \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

RUN apt-get install sudo vim wget git \
    openssh-server net-tools \ 
    build-essential cmake gdb \
    libssl-dev -y

WORKDIR /tmp
#RUN git clone https://code.prog-lab.com/justin/quickfix.git && \
COPY ./quickfix /tmp/quickfix
RUN cd quickfix && \
    mkdir -p build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DHAVE_SSL=ON .. && \
    make && make install && \
    cp /tmp/quickfix/build/examples/executor/C++/executor /usr/local/bin && \
    cp /tmp/quickfix/build/examples/ordermatch/ordermatch /usr/local/bin && \
    cp /tmp/quickfix/build/examples/tradeclient/tradeclient /usr/local/bin && \
    rm -rf /tmp/quickfix && \
    ldconfig

WORKDIR /home

USER root
RUN mkdir -p /var/run/sshd && \
    ssh-keygen -A && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "AllowUsers $UName" >> /etc/ssh/sshd_config && \    
    groupadd -g $GID $UName && \
    useradd -u $UID -g $GID -m -s /bin/bash $UName && \
    echo "$UName:$mypassword" | chpasswd && \
    usermod -aG sudo $UName && \
    mkdir -p /home/$UName && \
    chown $UName:$UName -R /home/$UName

USER $UName
RUN cp /etc/skel/.profile /home/$UName/.profile && \
    cp /etc/skel/.bashrc /home/$UName/.bashrc && \
    cp /etc/skel/.bash_logout /home/$UName/.bash_logout && \
    echo "export PS1='\u@\h:\w\$ '" > /home/$UName/.bashrc && \
    echo "colorscheme desert" > /home/$UName/.vimrc