
Virtualización ligera usando contenedores
====================================================================

Ejercicio 1
-----------

**Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.**

Instalo en fedora con el siguiente comando:
```bash
sudo yum install lxc
```

Una vez que he instalado compruebo si mi máquina es compatible y si se encuentra lxc instalado con el comando:
```bash
lxc-checkconfig
```
![EJ1_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ1_1.png)

Como esta todo **enabled** esto indica que puedo usarlo.


Ejercicio 2
-----------

**Comprobar qué interfaces puente se han creado y explicarlos.**

Tras instalar lxc he intentado crear un contenedor con el comando que se indica en el [temario](http://jj.github.io/IV/documentos/temas/Contenedores) pero me ha salido el siguiente error:
```bash
lxc_container: lxccontainer.c: get_template_path: 867 No such file or directory - bad template: fedora
lxc_container: lxccontainer.c: lxcapi_create: 1264 bad template: fedora
lxc_container: lxc_create.c: main: 271 Error creating container una-caja
```

Para solucionarlo, he instalado lxc-templates. 
```bash
sudo yum install lxc-templates
```

Tras esto me vuelve a salir otro error:
```bash
'debootstrap' command is missing
lxc_container: lxccontainer.c: create_run_template: 1125 container creation template for una-caja failed
lxc_container: lxc_create.c: main: 271 Error creating container una-caja
```

Que para solucionarlo, he instalado **debootstrap**:
```bash
sudo yum install debootstrap
```
Tras esto ya si podre crear el contenedor:
```bash
sudo lxc-create -t fedora -n una-caja
```
![EJ2_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ2_1.png)
Espero a que termine y paso a iniciarla:
```bash
sudo lxc-start -n una-caja
```

Pero me encuentro con el siguiente error:
```bash
lxc-start: conf.c: instantiate_veth: 2978 failed to attach 'vethDWA76E' to the bridge 'virbr0': No such device
lxc-start: conf.c: lxc_create_network: 3261 failed to create netdev
lxc-start: start.c: lxc_spawn: 826 failed to create the network
lxc-start: start.c: __lxc_start: 1080 failed to spawn 'una-caja'
lxc-start: lxc_start.c: main: 342 The container failed to start.
lxc-start: lxc_start.c: main: 346 Additional information can be obtained by setting the --logfile and --logpriority options.
```

Para solucionarlo, he seguido el paso **Install management libraries and utilities** de la web [major.io](https://major.io/2014/04/21/launch-secure-lxc-containers-on-fedora-20-using-selinux-and-svirt/)

He usado lo siguiente:
- He eliminado el contenedor:
```bash
sudo lxc-destroy -n una-caja
```
- He instalado las librerias para el uso de red y se activan:
```bash
sudo yum install libvirt-daemon-lxc libvirt-daemon-config-network
sudo systemctl start libvirtd.service
sudo systemctl enable libvirtd.service
```
- Tras esto ya se puede crear el contenedor e iniciar:
```bash
sudo lxc-create -t fedora -n una-caja
sudo lxc-start -n una-caja
```

Para los comando basicos de **lxc* he usado [linuxcontainers.org](https://linuxcontainers.org/lxc/manpages/)
![EJ2_2.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ2_2.png)

Tras todo esto paso a indicar las interfaces que se han creado:

Se me ha creado la interfaz **virbr0** para que el contendor tenga acceso a internet.


Ejercicio 3
-----------

**Crear y ejecutar un contenedor basado en Debian.**

**Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, [Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue.](https://github.com/IV-GII/GII-2013/issues/87#issuecomment-28639976)**

Para crear el contenedor Debian y ejecutarlo:
```bash
sudo lxc-create -t debian -n debian
sudo lxc-start -n debian
```
![EJ3_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ3_1.png)

Para crear el contenedor CentOs y ejecutarlo:
```bash
sudo lxc-create -t centos -n centos
sudo lxc-start -n centos
```
![EJ3_2.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ3_2.png)


Ejercicio 4
-----------

**Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.**
**Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.**

Para la instalación de LXC Web Panel uso el manual de la pagina del [proyecto](http://lxc-webpanel.github.io/install.html) pero no he conseguido instalarlo en fedora. Voy a instalarlo en una máquina virtual con ubuntu.
```bash
wget http://lxc-webpanel.github.com/tools/install.sh -O - | bash
```
Tras instalarlo, accedo a http://localhost:5000 con usuario admin y contraseña admin.
![EJ4_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ4_1.png)
Para cambiar los recursos de cada contenedor es muy facil, tan solo pinchando encima del nombre nos mostrará las opciones.
![EJ4_2.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ4_2.png)


Ejercicio 6
-----------

**Instalar juju.**

Añado repositorio de juju y lo instalo tal cual lo indica el temario de la asignatura.
```bash
sudo add-apt-repository ppa:juju/stable
sudo apt-get update && sudo apt-get install juju-core
```
![EJ6_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ6_1.png)

**Usándolo, instalar MySQL en un táper.**
Para empezar a trabajar con el:
```bash
juju init
```
![EJ6_2.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ6_2.png)
Tras esto voy a editar el fichero de configuracion de juju para su uso en local, cambio #default: amazon por default: local
![EJ6_3.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ6_3.png)

Como se indica en el temario, se necesita instalar mongodb-server para usar juju en local, por lo tanto lo instalo.

```bash
sudo apt-get install mongodb-server
```

Ahora establezco donde voy a trabajar:
```bash
sudo juju switch local
```
Según se indica, juju usa taper que cree el, por tanto vamos a crear uno.
![EJ6_4.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ6_4.png)

Para instalar mysql usaré:
```bash
sudo juju deploy mysql
```
![EJ6_5.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ6_5.png)
Ahora para comprobar que se ha instalado correctamente, uso el comando:
```bash
sudo juju status
```
Que muestra el servicio mysql instalado.
![EJ6_6.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ6_6.png)


Ejercicio 7
-----------

**Destruir toda la configuración creada anteriormente**
Primero tengo que eliminar mysql, para ello:
```bash
sudo juju destroy-unit mysql/0
```
Despues elimino el taper, en mi caso el 1:
```bash
sudo juju destroy-machine 1
```
Para comprobar que se ha realizado todo correctamente:
```bash
sudo juju status
```
![EJ7_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ7_1.png)


**Volver a crear la máquina anterior y añadirle mediawiki y una relación entre ellos.**
Siguiendo los pasos de los [apuntes](http://jj.github.io/IV/documentos/temas/Contenedores)
```bash
# Cambio a local
sudo juju switch local

# Creo la máquina
sudo juju add-machine

# Añado mediawiki
sudo juju deploy mediawiki 

# Creo una relacion entre ellos. [add-relation juju](https://juju.ubuntu.com/docs/charms-relations.html)
sudo juju add-relation mediawiki:db mysql 

# Expongo mediawiki
sudo juju expose mediawiki
```
**Crear un script en shell para reproducir la configuración usada en las máquinas que hagan falta.**

```bash
# Cambio a local
sudo juju switch local

# Creo la máquina
juju bootstrap

# Añado mediawiki
sudo juju deploy mediawiki 

# Creo una relacion entre ellos. [add-relation juju](https://juju.ubuntu.com/docs/charms-relations.html)
sudo juju add-relation mediawiki:db mysql 

# Expongo mediawiki
sudo juju expose mediawiki
```


Ejercicio 8
-----------

**Instalar libvirt. Te puede ayudar esta guía para Ubuntu.**
```bash
sudo yum install libvirt
```
![EJ8_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ8_1.png)


Ejercicio 10
-----------

**Instalar docker.**

Para instalar docker he seguido el manual de la pagina de [docker para fedora](https://docs.docker.com/installation/fedora/)
```bash
sudo yum install docker-io
sudo systemctl start docker
sudo systemctl enable docker
```
![EJ10_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ10_1.png)


Ejercicio 11
-----------

**Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.**

**Buscar e instalar una imagen que incluya MongoDB.**

Para instalar una imagen de ubuntu:
```bash
sudo docker pull ubuntu
```
![EJ11_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ11_1.png)

Para instalar una imagen de centOS:
```bash
sudo docker pull centOS
```
![EJ11_2.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ11_2.png)

Para instalar una imagen que incluya MongoDB, uso el nombre del paquete que me indica el siguiente [enlace](https://registry.hub.docker.com/u/dockerfile/mongodb/).
```bash
sudo docker pull dockerfile/mongodb
```
![EJ11_3.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ11_3.png)


Ejercicio 12
-----------

**Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.**

```bash
# Accedo al contenedor de ubuntu
sudo docker run -i -t ubuntu /bin/bash

# Añado el usuario, le cambio el pass y lo hago sudo
useradd -d /home/nginx -m nginx
passwd nginx
adduser nginx sudo
# Login con el usuario nginx
login nginx
```
![EJ12_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ12_1.png)
Instalo nginx:
```bash
sudo apt-get install nginx
```


Ejercicio 13
-----------

**Crear a partir del contenedor anterior una imagen persistente con commit.**

Uso para ver el contenedor que tengo encendido:
```bash
sudo docker ps --no-trunc
```
![EJ13_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ13_1.png)

Tras esto, hago el commit del contenedor con su id.
```bash
sudo docker commit dccc74482010233c9d983d10d0ff5e15bdc383204cb093be738efb423af9585f instalacion/nginx
```
Compruebo si se a creado la imagen de docker con:
```bash
sudo docker images 
```
![EJ13_2.png](https://dl.dropboxusercontent.com/u/22433100/IV/t4/EJ13_2.png)


Ejercicio 14
-----------

**Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.**

Para este ejercicio, voy a usar el **Dockerfile** del proyecto de la asignatura [Virtual Vulcano](https://github.com/ernestoalejo/virtual-vulcano)

El Dockerfile del proyecto contiene:
```yaml
# Copyright (c) 2014 The Virtual Vulcano authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that
# can be found in the LICENSE.md file.

FROM dockerfile/nodejs-bower-gulp
MAINTAINER Virtual Vulcano <virtualvulcano@gmail.com>

RUN apt-get update

# Intalar mongoDB
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
   echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
   apt-get update && \
   apt-get install -y mongodb-10gen
RUN mkdir -p /data/db

ADD . /web

WORKDIR /web
CMD /web/cmd/startup.sh
```
Este actualiza el contendor, instala MongoDB y hace uso de una imagen que contiene nodejs, bower y gulp, ademas añade una carpeta /web como directorio de trabajo e inicia un script.
