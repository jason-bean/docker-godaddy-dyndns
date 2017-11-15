FROM jasonbean/alpine-supervisord
LABEL maintainer "taddeusz@gmail.com"

# # Set correct environment variables.
# ENV HOME /root
# ENV DEBIAN_FRONTEND noninteractive
# ENV LC_ALL C.UTF-8
# ENV LANG en_US.UTF-8
# ENV LANGUAGE en_US.UTF-8

# # Use baseimage-docker's init system
# CMD ["/sbin/my_init"]

# # Configure user nobody to match unRAID's settings
# RUN usermod -u 99 nobody && \
#     usermod -g 100 nobody && \
#     usermod -d /home nobody && \
#     chown -R nobody:users /home

# # Disable SSH
# RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# RUN apt-get update && \
# apt-get install -y \
# python \
# python3-venv \
# python3-pip

# RUN pip3 install requests

RUN mkdir -p /config /godaddy-dyndns/venv /firstrun
COPY godaddy-dyndns/ /godaddy-dyndns
COPY supervisord.conf /etc/supervisord.conf
COPY firstrun.sh /firstrun

RUN apk add --no-cache \
        bash \
        py-virtualenv && \
    cd /godaddy-dyndns && \
    pip3 install requests && \
    python3 -m venv --system-site-packages venv && \
    chmod +x /firstrun/firstrun.sh && \
    chmod +x /godaddy-dyndns/godaddy-dyndns.py && \
    chmod +x /godaddy-dyndns/godaddy-dyndns.sh && \
    chmod +x /godaddy-dyndns/setcron.sh && \
    (crontab -l 2>/dev/null; echo "* * * * * /godaddy-dyndns/setcron.sh") | crontab -

VOLUME [ "/config" ]