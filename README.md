# Kamailio with WebSocket an JsSIP in Docker

Here is a docker container runs Kamailio as WebSocket/SIP Server and NGINX with simple JsSIP based WebSIP Client for Calls and messaging.

Useage :
after Deploy run :

docker container exec -it sip_server /bin/bash

on command line run the following to create usres:

kamctl add user1 pass1

kamctl add user1 pass1

Now go to this webpage :
https://<DOCKER_HOST_IP>/

use the credittials and log in.

feel free to test it and write me back!

Note : deploy and stop take time because of RTPEngine and the opened port, the issue is mainlly due to docker slow handling opening port ranges spceially if they are long
