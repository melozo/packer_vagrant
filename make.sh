#!/bin/bash

#redis
#packer build -var 'IP=10.127.0.30' -var 'box_name=redis' -var 'cpu=1' -var 'memory=256' -var 'disk_size=1024' -var 'vm_name=redis' alpine.json

#php y mysql
#packer build -var 'IP=10.127.0.20' -var 'box_name=php' -var 'cpu=1' -var 'memory=1024' -var 'disk_size=1024' -var 'vm_name=php' alpine.json

# nginx
#packer build -var 'IP=10.127.0.10' -var 'box_name=nginx' -var 'cpu=2' -var 'memory=512' -var 'disk_size=1024' -var 'vm_name=nginx' alpine.json
# make.sh nginx, php or redis

PACKER=`which packer`
VIRTUALBOX=`which git`
VAGRANT=`which vagrant`

if [ -z $PACKER ] || [ -z $VIRTUALBOX ] || [ -z $VAGRANT ]
then
	echo "Es necesario tener instalados packer, virtualbox y vagrant" 
	echo "https://www.packer.io/downloads.html"
	echo "https://www.virtualbox.org/wiki/Downloads"
	echo "url de vagrant"
	exit 1
fi

function Nginx
{
	echo "marchando nginx con alpine"
	$PACKER build -var 'IP=10.127.0.10' -var 'box_name=nginx' -var 'cpu=2' -var 'memory=512' -var 'disk_size=1024' -var 'vm_name=nginx' alpine.json
	
}

function Php
{
	echo "marchando php y mysql con alpine"
	$PACKER build -var 'IP=10.127.0.20' -var 'box_name=php' -var 'cpu=1' -var 'memory=1024' -var 'disk_size=1024' -var 'vm_name=php' alpine.json
}

function Redis
{
	echo "marchando redis con alpine"
	$PACKER build -var 'IP=10.127.0.30' -var 'box_name=redis' -var 'cpu=1' -var 'memory=256' -var 'disk_size=1024' -var 'vm_name=redis' alpine.json
}


# todo: bucle para oppciones
case "$1" in
	"nginx")Nginx ;;
	"php")Php ;;
	"redis")Redis ;;
 	*) echo "Uso: ./make.sh php, nginx or redis" ;;	
esac
