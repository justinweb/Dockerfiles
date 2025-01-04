# 2025/1/1
# - Add ENTRYPOINT
#
FROM ubuntu:20.04

ARG mypassword=0011111
ARG UID=1000
ARG GID=1000
ARG UName=ubuntu

RUN apt update -y

RUN TZ=Asia/Taipei \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

RUN apt install sudo vim wget git -y
RUN apt install openssh-server net-tools -y
RUN apt install build-essential -y
RUN apt install ruby-full ruby-dev libmysqlclient-dev -y

RUN mkdir -p /var/run/sshd
RUN ssh-keygen -A

RUN groupadd -g $GID $UName
RUN useradd -u $GID -g $UName $UName
RUN usermod --shell /bin/bash $UName
RUN mkdir -p /home/$UName
RUN chown $UName:$UName -R /home/$UName

USER $UName
RUN cp /etc/skel/.profile /home/$UName/.profile
RUN cp /etc/skel/.bashrc /home/$UName/.bashrc
RUN echo "export PS1='\u@\h:\w\$ '" > /home/$UName/.bashrc

RUN echo "colorscheme desert" > /home/$UName/.vimrc

USER root
WORKDIR /home/$UName
RUN wget https://www.redmine.org/releases/redmine-5.1.5.tar.gz
RUN tar -xvf redmine-5.1.5.tar.gz
WORKDIR /home/$UName/redmine-5.1.5
RUN cp config/database.yml.example config/database.yml
RUN gem install bundler -v 2.4.22
RUN bundle config set --local without 'development test'
RUN bundle install
RUN bundle exec rake generate_secret_token
#RUN RAILS_ENV=production bundle exec rake db:migrate

RUN mkdir -p tmp tmp/pdf public/plugin_assets
RUN chown $UName:$UName -R tmp tmp/pdf public/plugin_assets
RUN chmod -R 755 tmp tmp/pdf public/plugin_assets
RUN find files log tmp public/plugin_assets -type f -exec chmod -x {} +

RUN usermod -aG sudo $UName
RUN echo "$UName:$mypassword" | chpasswd

COPY run.sh /home/run.sh
RUN chmod +x /home/run.sh

ENTRYPOINT [ "/home/run.sh" ]
EXPOSE 22/tcp 3000/tcp