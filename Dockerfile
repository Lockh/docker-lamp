FROM debian:latest
MAINTAINER support@beware.fr

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y openssh-server apache2 mysql-server libapache2-mod-php5 php5-mysql php5-mcrypt supervisor pwgen locales locales-all vim bash-completion
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor

RUN sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN locale-gen fr_FR.UTF-8
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR:fr


ADD set_root_pw.sh /root/set_root_pw.sh
ADD set_mysql_pw.sh /root/set_mysql_pw.sh

RUN chmod +x /root/*.sh
RUN /root/set_root_pw.sh
RUN /root/set_mysql_pw.sh

RUN rm /root/*.sh

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY .bashrc /root/

CMD ["/usr/bin/supervisord"]
