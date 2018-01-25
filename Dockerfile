FROM alpine:3.7
LABEL maintainer "taddeusz@gmail.com"

RUN mkdir -p /config /godaddy-dyndns/venv
ADD image /

RUN apk add --no-cache \
        tini \
        bash \
        python3 \
        py2-pip \
        py-virtualenv && \
    cd /godaddy-dyndns && \
    pip3 install requests && \
    python3 -m venv --system-site-packages venv && \
    chmod +x /startup.sh && \
    chmod +x /godaddy-dyndns/godaddy-dyndns.py && \
    chmod +x /godaddy-dyndns/godaddy-dyndns.sh && \
    chmod +x /godaddy-dyndns/setcron.sh && \
    (crontab -l 2>/dev/null; echo "* * * * * /godaddy-dyndns/setcron.sh") | crontab -

VOLUME [ "/config" ]
ENTRYPOINT [ "/startup.sh" ]