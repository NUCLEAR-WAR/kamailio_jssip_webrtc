#!/bin/bash


if [[ -z "`mysql -u root -h ${MYSQL_IP} -qfsBe "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='kamailio'" 2>&1`" ]];
then
	mysql -u root -h ${MYSQL_IP} -e "create database kamailio;"
	mysql -u root -h ${MYSQL_IP} kamailio < /mnt/wss_server/kamailio.sql
	KAMAILIO_USER_EXISTS=`mysql -u root -h ${MYSQL_IP} -s -N -e "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE User = 'pcscf' AND Host = '%')"`
	if [[ "$KAMAILIO_USER_EXISTS" == 0 ]]
	then
		mysql -u root -h ${MYSQL_IP} -e "CREATE USER 'kamailio'@'%' IDENTIFIED WITH mysql_native_password BY 'wss'";
		mysql -u root -h ${MYSQL_IP} -e "CREATE USER 'kamailio'@'$WSS_SERVER_IP' IDENTIFIED WITH mysql_native_password BY 'wss'";
		mysql -u root -h ${MYSQL_IP} -e "GRANT ALL ON kamailio.* TO 'kamailio'@'%'";
		mysql -u root -h ${MYSQL_IP} -e "GRANT ALL ON kamailio.* TO 'kamailio'@'$WSS_SERVER_IP'";
		mysql -u root -h ${MYSQL_IP} -e "FLUSH PRIVILEGES;"
	fi
fi
sleep 5;

sed -i 's|DOCKER_HOST_IP|'$DOCKER_HOST_IP'|g' /var/www/html/websip.htm
# sleep 500
# Start server.


