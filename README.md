# Kamailio with WebSocket and JsSIP on NGINX Webserver in Docker

Here is a docker container running Kamailio as WebSocket/SIP Server and NGINX with simple JsSIP based WebSIP Client for Calls and messaging.

Usage :
Before depoly set the Host IP of the machine running docker to the correct one in the .env file

DOCKER_HOST_IP=192.168.174.130

Then deploy with this command :

docker compose -f test_env.yaml up

After Deploy run :

docker container exec -it sip_server /bin/bash

on command line run the following to create usres:

kamctl add user1 pass1

kamctl add user1 pass1

Now go to this webpage :
https://<DOCKER_HOST_IP>/

use the credittials and log in.

feel free to test it and write me back!

Note : deploy and stop take time because of RTPEngine and the opened port, the issue is mainlly due to docker slow handling opening port ranges spceially if they are long
