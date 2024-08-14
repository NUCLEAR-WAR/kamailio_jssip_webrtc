#!/bin/bash

/mnt/wss_server/start-wssserver.sh && \
/mnt/wss_server/start-nginx.sh && \
rm -f /kamailio_wss.pid && \
kamailio -f /etc/kamailio/kamailio.cfg -P /kamailio_wss.pid -DD -E -e
