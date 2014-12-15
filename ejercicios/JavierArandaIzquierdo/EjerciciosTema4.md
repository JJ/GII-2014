#Tema 4
###Ejercicio 1
#####Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.
El primer paso es instalar lxc con la siguiente orden:
	
    sudo apt-get install lxc
    
Tras esto, comprobamos que es compatible con la siguiente orden:

	lxc-checkconfig
    
![ejer1](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer1tema4.png)

###Ejercicio 2
#####Comprobar qué interfaces puente se han creado y explicarlos.

Primeramente creamos el contenedor con la siguiente orden:

	sudo lxc-create -t ubuntu -n una-caja

![ejer2-1](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer2-1tema4.png)
    
Tras las instalacion, procedemos a arrancarlo:

	lxc-start -n una-caja
    
Ahora podemos ver el estado de los contenedores con la orden:

	sudo lxc-ls
    
![ejer2-2](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer2-2tema4.png)
    
y tambien utilizamos esta orden para ver que los contenedores estan levantados:

	ipconfig -a
    
![ejer2-3](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer2-3tema4.png)

###Ejercicio 3
#####1.Crear y ejecutar un contenedor basado en Debian.

Para instalar el contenedor de Debian utilizamos: 

	sudo lxc-create -t debian -n debianita
    
Y para ejecutarlo utilizamos:

	sudo lxc-start -n debianita
    
![ejer3-1](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer3-1tema4.png) 

#####2.Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue.

Para isntalar el contenedor de Fedora vamos a utilizar la siguiente orden:

	sudo lxc-create -t fedora -n fedora14 -- -R 14
    
Al intentarlo nos dice que necesitamos instalar yum:

![ejer3-2](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer3-2tema4.png)

Para eso utilizamos la siguiente orden:

	sudo apt-get install yum
    
Al volver a intentar instalar el contenedor, optenemos el siguiente error:

![ejer3-3](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer3-3tema4.png)

Instalamos curl y volvemos a intentar instalar el contenedor:

![ejer3-4](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer3-4tema4.png)

###Ejercicio 4
#####1.Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Para instalar lxc-webpanel utilizaremos la siguiente orden:

	wget http://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash

Esta es la pantalla para acceder a los distintos contenedores instalados:

![ejer4-1](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer4-1tema4.png)

#####2.Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

Estos son los contenedores que tengo actualmente instalados en mi sistema, para modificar sus atributos solo hay que clicar en el contenedor que queremos cambiar en el menu de la izquierda:

![ejer4-1](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer4-2tema4.png)

![ejer4-1](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer4-3tema4.png)

###Ejercicio 5
#####Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

Voy a comparar el contenedor de ubuntu que ya tengo instalado con una de las jaulas que hice anteriormente. Lo primero que hay que hacer es instalar nginx en ambas. 

Para comparar el rendimiento del servidor voy a utilizar un benchamark que he utilizado en otras asignaturas, Apache Benchmark. Lo instalaremos con la orden:

	sudo apt-get install apache2-utils
    
Ahora utilizamos el bechmark con el contenedor de ubuntu, cuya IP es 10.0.3.80:

![ejer5-1](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer5-1tema4.png)

Tras esto, hacemos lo mismo pero con la jaula y el resultado es el siguiente:

![ejer5-2](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer5-2tema4.png)

Comparandolos, vemos que la jaula es mas rapida que el contenedor.

###Ejercicio 6
#####Instalar juju.

Para instalar Juju utilizaremos las ordenes del guion:

	sudo add-apt-repository ppa:juju/stable
	sudo apt-get update 
    sudo apt-get install juju-core

#####Usándolo, instalar MySQL en un táper.

Primeramente iniciamos juju con la orden:

	juju init
    
Tras esto, cambiamos el campo default:amazon por default:local en el fichero de configuracion ~/.juju/environments.yaml

Tras esto, ejecutaremos las siguientes ordenes para instalar MySQL:

	juju switch local
	juju bootstrap
	juju deploy mysql
	juju status
    
###Ejercicio 7
#####Destruir toda la configuración creada anteriormente

Para destruir toda la cofiguracion vamos a utlizar la orden:

	juju destroy [lo que queremos eliminar]
    
En nuestro caso vamos a eliminar MySQL:

	juju destroy-service mysql
    
Y el entorno:

	juju destroy-environment
    
![ejer7-1](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer7-1tema4.png)

#####Volver a crear la máquina anterior y añadirle mediawiki y una relación entre ellos.

Para ello vamos a utilizar las siguientes ordenes:

	juju bootstrap
	juju deploy mediawiki
	juju deploy mysql
    
Para añadir la relacion entre ellos utilizamos la siguiente orden:

	juju add-relation mediawiki:db mysql

#####Crear un script en shell para reproducir la configuración usada en las máquinas que hagan falta.

El Scrip reune todas las ordenes ya instaladas:

	#!/bin/bash
    juju init
    juju switch local 
    juju bootstrap 
    juju deploy mediawiki
    juju deploy mysql 
    juju add-relation mediawiki:db mysql 
    juju expose mediawiki 
    juju status 

###Ejercicio 8
#####Instalar libvirt. Te puede ayudar esta guía para Ubuntu.

Para instalar libvirt tenemos que utilizar el siguiente comando:

	sudo apt-get install kvm libvirt-bin

###Ejercicio 9
#####Instalar un contenedor usando virt-install.

Primero instalamos virt:

	sudo apt-get install virtinst

Tras esto descargamos una imagen, en mi caso voy a descargar ubuntu:

	sudo virt-install --name ubuntu --ram 512 --file=/var/lib/libvirt/images/ubuntu-14.04.1-server-i386.img --file-size=3 --vnc --cdrom=/var/lib/libvirt/images/ubuntu-14.04.1-server-i386.iso
 

###Ejercicio 10 
#####Instalar Docker

Instalar Docker no es directo, por eso seguiremos los siguientes pasos:

	curl -sSL https://get.docker.com/ubuntu/ | sudo sh

Ahora ejecutamos el siguiente comando:

	docker -d &
    
Esto nos dara un pequeño fallo, para arreglarlo solo tendremos que ejecutar:

	rm /var/run/docker.sock
    rm /var/run/docker.pid

Volvemosa ejecutar la orden anterior y listo:

![ejer10-1](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer10-1tema4.png)

###Ejercicio 11
#####1.Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Vamos a instalar una imagen de CentOS utilizando el comando:

	sudo docker pull centos
    
![ejer11-1](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer11-1tema4.png)

#####2.Buscar e instalar una imagen que incluya MongoDB.

Esta imagen se llama Gentoo y ejecutamos la siguiente instruccion:

	sudo docker pull hairmare/mongodb
    
![ejer11-2](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer12-1tema4.png)

###Ejercicio 12 
#####Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

Primero entramos en el contenedor:

	sudo docker run -i -t ubuntu /bin/bash
    
Tras esto creamos un usuario y le damos la contraseña con:

	useradd -d /home/usudocker -m usudocker 
	passwd usudocker 

Y al final para logearnos utilizamos:

	login usudocker
    
![ejer11-2](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer12-2tema4.png)

Y ahora isntalamos nginx con:

	apt-get install nginx

###Ejercicio 13 
#####Crear a partir del contenedor anterior una imagen persistente con commit.

Primero, vamos a ejecutar la siguiente orden desde nuestra maquina anfitriona pero con el taper de docker arrancado:

	sudo docker ps -notrunc
    
![ejer13-1](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer13-1tema4.png)

Cogemos la ID que no ha dado la orden anterior.Y creamos la imagen persistente con la siguiente orden:

	sudo docker commit ID 
    
![ejer13-2](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer13-2tema4.png)

###Ejercicio14
#####Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

Lo primero que tenemos que hacer es registranor en [Docker](http://www.docker.com). Una vez registrados, asociamos nuestra cuenta de GitHub con la cuenta de Docker. 

Tras esto, añadimos el repositorio que estamos utilizando en el proyecto y elegimos la opcion de Automated build.

Y para terminar nos vamos a Build Details y clicamos en START A BUILD. Y despues de esto ya tenemos la imagen lista para instalar desde donde quieras.



