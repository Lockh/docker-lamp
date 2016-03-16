FROM debian:latest
MAINTAINER support@beware.fr

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y openssh-server apache2 mysql-server supervisor pwgen locales
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor

RUN sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config

RUN locale-gen fr_FR.UTF-8
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR.UTF-8  
ENV LC_ALL fr_FR.UTF-8

ADD set_root_pw.sh /root/set_root_pw.sh
ADD set_mysql_pw.sh /root/set_mysql_pw.sh

RUN chmod +x /root/*.sh
RUN /root/set_root_pw.sh
RUN /root/set_mysql_pw.sh

RUN rm /root/set_root_pw.sh
RUN rm /root/set_mysql_pw.sh

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
