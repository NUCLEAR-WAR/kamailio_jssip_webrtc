#!/bin/bash

/mnt/wss_server/start-wssserver.sh && \
/usr/bin/supervisord -n && \
mkdir -p /var/run/kamailio_wss && \
rm -f /kamailio_wss.pid && \
kamailio -f /etc/kamailio/kamailio.cfg -P /kamailio_wss.pid -DD -E -e
