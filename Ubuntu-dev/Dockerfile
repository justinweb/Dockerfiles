# 2025/3/9
# - use apt-get
# 2024/2/14
# - Add ENTRYPOINT
#
FROM ubuntu:20.04

ARG mypassword=0011111
ARG UID=1000
ARG GID=1000
ARG UName=ubuntu

RUN apt-get update -y && apt-get upgrade -y && apt-get update -y

RUN TZ=Asia/Taipei \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

RUN apt-get install sudo vim wget git openssh-server net-tools build-essential cmake gdb -y
RUN mkdir -p /var/run/sshd && ssh-keygen -A

RUN groupadd -g $GID $UName && useradd -u $GID -g $UName $UName && usermod --shell /bin/bash $UName && \
    mkdir -p /home/$UName && chown $UName:$UName -R /home/$UName

USER $UName
RUN cp /etc/skel/.profile /home/$UName/.profile
RUN cp /etc/skel/.bashrc /home/$UName/.bashrc
RUN echo "export PS1='\u@\h:\w\$ '" > /home/$UName/.bashrc
RUN echo "colorscheme desert" > /home/$UName/.vimrc

USER root
RUN usermod -aG sudo $UName && echo "$UName:$mypassword" | chpasswd

ENTRYPOINT [ "/usr/sbin/sshd", "-D" ]
EXPOSE 22/tcp

