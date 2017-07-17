#!/bin/bash

# script para la instalacion de software en cada uno de los servidores contruidos, desde un mismo punto
# hace uso del hostname configurado desde packer, podriamos usar ansible, puppet, etc.

# TODO
# solucion check endpoint: https://github.com/yaoweibin/nginx_upstream_check_module

function Redis {
	echo "Function Redis"	
}

function PHP {
	echo "Function PHP"
}

function Nginx {
	echo "Function PHP" 
	
}

if [ $HOSTNAME = nginx ]
then
	sudo apk add nginx git wget && \
	echo "Install nginx on $HOSTNAME"
	sudo rc-update add nginx && \
	sudo rc-service nginx restart && \
	Redis
fi

if [ $HOSTNAME = php ]
then
	echo "Install php-fpm and mysql..."	
	sudo apk add php7-redis php7-mysql python iproute2 php7-fpm mariadb mariadb-client git wget && \
	sudo rc-update add php-fpm && \
	sudo rc-update add mariadb && \
	echo "Clone repo repo app..."
	sudo mkdir -p /opt/app && \
	git clone https://github.com/Tombar/sample-app && \
	cp sample-app/* /var/www/localhost/htdocs/ && \
	chown -R nginx:nginx /var/www/localhost/htdocs/ && \
	sudo rc-service php-fpm restart && \
	PHP
fi

if [ $HOSTNAME = redis ]
then
	sudo apk add redis && \
	sudo rc-update add redis && \
	echo "Install redis..."
	Redis
	
fi

echo "TESTING in $HOSTNAME"
