TEMA 4
=========


##Ejercicio 1##

Instalamos lxc de los repositorios mediante:

`sudo aptitude install lxc`

##Ejercicio 2##

Comprobamos que esta configorado correctamente, mediante el comando:

`lxc-checkconfig`

Y miramos que este todo en enabled


Instalamos el contenedor:

`sudo lxc-create -t ubuntu -n contenedor1`

Miramos las interfaces puente:

![Puente](https://raw.githubusercontent.com/yonatan24891/ImagenesIV/master/puente.bmp)


##Ejercicio 3##

Creamos el contenedor Debian:

`sudo lxc-create -t debian -n debian_cont`

Creamos el contenedor CentOs:

`sudo lxc-create -t centos -n centos-cont`

Para ejecutarlos:

`sudo lxc-start -n [NOMBRE DEL CONTENEDOR]`

Para meternos en cualquier momento en el contenedor:

`sudo lxc-attach -n [NOMBRE DEL CONTENEDOR]`


##Ejercicio 4##

Instalamos lxc-webpanel:

`wget http://lxc-webpanel.github.io/tools/install.sh`

`chmod +x install.sh`

`sudo ./install.sh`

Entramos en localhost:5000 y nos logueamos con admin, admin:

![webpanel](https://raw.githubusercontent.com/yonatan24891/ImagenesIV/master/lxc_webpanel.bmp)

Para restringir los recursos, pinchamos en una máquina del panel de la izquierda y por ejemplo mediante los sliders podemos cambiar la cantidad de memoria asignada


##Ejercicio 5##

###Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.###

Como podemos observar en varios ejercicios de compañeros, la jaula es más rápida

[Comparación](https://github.com/JJ/GII-2014/blob/master/ejercicios/JulioMart%C3%ADnez/tema4.md)



##Ejercicio 6##

Instalamos juju mediante:

`sudo add-apt-repository ppa:juju/stable`

`sudo apt-get update && apt-get install juju`

Arrancamos:

`juju init`

Como dice el guión del tema4, en el fichero (en mi caso) /home/yonatan24891/.juju/environments.yaml, cambiamos el valor de default a local

Instalamos Mongodb (si no lo tenemos instalado):

`sudo apt-get install mongodb-server`

Creamos el táper:

`juju bootstrap` (sin sudo)

Me da un error que soluciono instalando juju-local

![juju](https://raw.githubusercontent.com/yonatan24891/ImagenesIV/master/juju.bmp)

Usándolo, instalar MySQL en un táper:

![mysql](https://raw.githubusercontent.com/yonatan24891/ImagenesIV/master/mysql.bmp)


##Ejercicio 7##

Se borrará todo utilizando solo el comando:

`sudo juju destroy-environment local`

Creamos la máquina anterior y añadimos mediawiki y una relación entre ellos

`juju bootstrap`

`juju deploy mysql`
 
`juju deploy mediawiki`

`juju add-relation mediawiki:db mysql`

Para que mediawiki sea accesible:

`juju expose mediawiki`


Script:

```
#!/bin/bash

sudo add-apt-repository ppa:juju/stable
sudo apt-get update && sudo apt-get install juju-core && sudo apt-get install juju-local

juju init
perl -pi -e 's/default:\ amazon/#default:\ amazon\ndefault:\ local/g' ~/.juju/environments.yaml

juju switch local

juju bootstrap

juju deploy mediawiki

juju deploy mysql

juju add-relation mediawiki:db mysql:db

juju expose mediawiki

```

##Ejercicio 8##

Instalar libvirt:

He ejecutado el siguiente comando:

`sudo apt-get install kvm libvirt-bin virtinst`

Añadimos un usuario al grupo "libvirtd" para que pueda gestionar la librería instalada:

`usermod $USER -a -G libvirtd`


##Ejercicio 9##

Como ya hemos instalado virtinst anteriormente, utilizamos este comando:

`virt-install --connect qemu:///system --name=fedora1 --ram=512 --vcpu=1 --disk=/home/$USER/vms/fedora1.img,size=2 --cdrom=/home/$USER/SOs/Fedora-Live-LXDE-x86_64-19-1.iso --noautoconsole`


##Ejercicio 10##

Para instalar docker(necesario sistema de 64 bits):

`sudo apt-get install docker.io`


##Ejercicio 11##

Instalar a partir de docker ubuntu y CentOS.

`sudo docker pull ubuntu`
`sudo docker pull centos`

Otra con mongo
`sudo docker pull mongo`

##Ejercicio 12##

Nos conectamos a la shell de ubuntu dentro de docker:

`sudo docker run -i -t ubuntu /bin/bash`

Añadimos el usuario:

`adduser docker`


![docker](https://raw.githubusercontent.com/yonatan24891/ImagenesIV/master/docker.bmp)


Instalamos nginx:

`apt-get update && apt-get install nginx`


##Ejercicio 13##

Obtenemos el ID:

`sudo docker ps`

`sudo docker commit 5fb0d1f02405 ubuntu-nginx`

##Ejercicio 14##

Imagen, herramientas para DAI:

```
# DAI requirements
#
# VERSION               0.0.1
FROM      ubuntu
MAINTAINER yonatan24891

# Instalación de dependencias para web.py
RUN apt-get update
RUN apt-get install python -y
RUN apt-get install mongodb-server -y

# Instalación de módulos de python
RUN apt-get install python-webpy -y
RUN apt-get install python-mako -y
RUN apt-get install python-feedparser -y
RUN apt-get install python-pymongo -y
RUN apt-get install python-tweepy -y
```

Construimos la imagen

`docker build -t yonatan24891/ubuntu_dai`




