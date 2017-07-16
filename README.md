##  POC

* Tres entornos funcionales que puedan ejecutarse en vagrant
* 1 nginx
* 2 php, ¿mysql?
* 3 redis
* test: https://github.com/Tombar/sample-app 


## Uso
```bash
git clone blaublau && cd blaublau
./make.sh #show help
./make.sh php
```

## Distribucion
```bash
.
├── alpine-ansible.json # Pendiente, template para provisioning con ansible
├── alpine.json		# Template para la contruccin de servidores con alpine
├── ansible		# Playbook externo para mariadb con alpine
│   └── ext
├── builds
│   └── virtualbox
├── http
│   └── answers
├── isos
├── make.sh		# Script para la generacion de imagenes make.sh nginx
├── README.md
├── scripts		# directorio con los archivos de configuracion de los distintos servicios
│   ├── config_nginx_nginx
│   ├── config_php_fpm
│   ├── config_php_nginx
│   ├── config_redis_redis
│   ├── instalacion.sh	# script de provisining, segun el "hostname" del servidor instala y configura
│   └── _noconfig_nginx
├── templates_vagrant	# templates de vagrant esto se usa porque no encontramos la forma de crear red privada desde packer
│   ├── nginxvix.template
│   ├── phpvix.template
│   └── redisvix.template
├── TODO.md		# Tareas pendientes
├── vagrant		
│   ├── nginx
│   ├── php
│   └── redis
└── vagrant.sh		# Tarea pendiente, wrapper para la gestion de vagrant desde make.sh

```

