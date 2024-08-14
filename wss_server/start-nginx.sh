#!/bin/bash

# Start server.
echo 'Doing Heartbeat to S-CSCF'
/usr/sbin/nginx -t -q -g 'daemon on; master_process on;'
/usr/sbin/nginx -g 'daemon on; master_process on;'

