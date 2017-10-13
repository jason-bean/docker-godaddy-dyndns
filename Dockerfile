FROM phusion/baseimage:0.9.22
LABEL maintainer "taddeusz@gmail.com"

# Set correct environment variables.
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Configure user nobody to match unRAID's settings
RUN usermod -u 99 nobody && \
    usermod -g 100 nobody && \
    usermod -d /home nobody && \
    chown -R nobody:users /home

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN apt-get update && \
apt-get install -y \
python \
python-pip

RUN pip install requests

RUN mkdir -p /godaddy-dyndns /etc/firstrun/godaddy-dyndns
COPY godaddy-dyndns/ /etc/firstrun/godaddy-dyndns
COPY firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh && \
    chmod +x /etc/firstrun/godaddy-dyndns/godaddy-dyndns.py

RUN (crontab -l 2>/dev/null; echo "*/0 * * * * /godaddy-dyndns/godaddy-dyndns.sh") | crontab - && \
    (crontab -l 2>/dev/null; echo "*/@reboot sleep 30 && /godaddy/godaddy-dyndns.sh") | crontab -

VOLUME [ "/godaddy-dyndns" ]