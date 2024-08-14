# syntax=docker/dockerfile:1

FROM debian:latest
# Install required packages
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        lsb-release \
        ca-certificates \
        git \
        vim \
        wget \
        curl \
        supervisor \
        net-tools \
        kamailio \
        kamailio-websocket-modules \
        kamailio-mysql-modules \
        kamailio-tls-modules \
        kamailio-presence-modules \
        nginx \
    && apt-get clean
RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*
RUN echo "set mouse-=a" >> ~/.vimrc

COPY kamailio.cfg /etc/kamailio/kamailio.cfg
COPY tls.cfg /etc/kamailio/tls.cfg
COPY kamctlrc /etc/kamailio/kamctlrc
COPY websip /etc/nginx/sites-available/websip
RUN ln -s /etc/nginx/sites-available/websip /etc/nginx/sites-enabled/
COPY websip.htm /var/www/html/websip.htm
COPY favicon.ico /var/www/html/favicon.ico
RUN chmod 644 /var/www/html/websip.htm
RUN chmod 644 /var/www/html/favicon.ico
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY start-heartbeat.sh /usr/bin/start-heartbeat.sh
COPY start-nginx.sh /usr/bin/start-nginx.sh
COPY start-wssserver.sh /usr/bin/start-wssserver.sh
COPY start-main.sh /usr/bin/start-main.sh

RUN chmod +x /usr/bin/start-heartbeat.sh
RUN chmod +x /usr/bin/start-nginx.sh
RUN chmod +x /usr/bin/start-wssserver.sh
RUN chmod +x /usr/bin/start-start-main.sh

CMD /usr/bin/start-main.sh


