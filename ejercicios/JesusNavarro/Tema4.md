# Virtualización ligera usando contenedores. 

## Tema 4.

**Ejercicio 1.** Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Instalación de lxc: sudo su apt-get install lxc

Comprobar si nuestro ordenado es compatible: lxc-checkconfig

<a href="http://es.tinypic.com?ref=25po2s3" target="_blank"><img src="http://i58.tinypic.com/25po2s3.png" border="0" alt="Image and video hosting by TinyPic"></a>

**Ejercicio 2.** comprobar qué interfaces puente se han creado y explicarlos.

Vemos que se ha creado un nuevo puente con el comando: ```sh brclt show ```

**Ejercicio 3.**

1. Crear y ejecutar un contenedor basado en Debian.
  Creación del contenedor basado en Debian, ejecutamos el siguiente comando ```sh sudo lxc-create -t debian -n debianita ```
 
2. Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue.

Arrancamos con la orden: ```sh sudo lxc-restar -n debianita ```

<a href="http://es.tinypic.com?ref=vo4h1c" target="_blank"><img src="http://i61.tinypic.com/vo4h1c.png" border="0" alt="Image and video hosting by TinyPic"></a>

**Ejercicio 4.**
1. Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Instalamos lxc-webpanel con el comando: ```sh wget http://lxc-webpanel.github.io/tools/install.sh -O - | bash```

<a href="http://es.tinypic.com?ref=24489rb" target="_blank"><img src="http://i57.tinypic.com/24489rb.png" border="0" alt="Image and video hosting by TinyPic"></a>

2. Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria. 

Modificacion realizada (Imagen):

<a href="http://es.tinypic.com?ref=111p087" target="_blank"><img src="http://i60.tinypic.com/111p087.png" border="0" alt="Image and video hosting by TinyPic"></a>

**Ejercicio 5.** Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

**Ejercicio 6.**

1. Instalar juju.

Para instalar juju procedemos a ejecutar los siguientes comandos:

``` add-apt-repository ppa:juju/stable```
``` sudo apt-get update && sudo apt-get install juju-core ```

<a href="http://es.tinypic.com?ref=308f8g1" target="_blank"><img src="http://i57.tinypic.com/308f8g1.png" border="0" alt="Image and video hosting by TinyPic"></a>

2. Usándolo, instalar MySQL en un táper.

<a href="http://es.tinypic.com?ref=xd89pv" target="_blank"><img src="http://i59.tinypic.com/xd89pv.png" border="0" alt="Image and video hosting by TinyPic"></a>

Instalamos el servicio con los comandos: 

``` sudo juju bootstrap```
``` juju deploy mysql ```

**Ejercicio 7.**

1. Destruir toda la configuración creada anteriormente

Para destruir la configuración creada anteriormente es necesario ejecutar el siguiento comando:

``` sudo juju bootstrap```

Destruimos la máquina:
```sudo juju destroy machine 1 ```

2. Volver a crear la máquina anterior y añadirle mediawiki y una relación entre ellos.

Cración:

``` sudo juju bootstrap```

Añadimos el servicio mediawiki

``` sudo juju deploy mediawiki```

Añadimos mysql

``` sudo deploy mysql```

Relacion entre mediawiki y mysql:

``` sudo juju add-relation mediawiki:slave mysql:db ```

3.Crear un script en shell para reproducir la configuración usada en las máquinas que hagan falta.

**Ejercicio 8.**

Instalar libvirt. Te puede ayudar esta guía para Ubuntu.

Ejecutamos el siguiente comando:

``` sudo apt-get install kvm libvirt-bin virtinst ```

Podemos comprobar la compatibilidad ejecutando ``` kvm-ok ```.

<a href="http://es.tinypic.com?ref=1zf7exj" target="_blank"><img src="http://i58.tinypic.com/1zf7exj.png" border="0" alt="Image and video hosting by TinyPic"></a>

Ejecutamos virsh

<a href="http://es.tinypic.com?ref=2rdg1z4" target="_blank"><img src="http://i59.tinypic.com/2rdg1z4.png" border="0" alt="Image and video hosting by TinyPic"></a>

**Ejercicio 9.**

Instalar un contenedor usando virt-install.

!/bin/bash

sudo juju bootstrap

sudo juju deploy mediawiki

sudo juju deploy mysql

sudo juju add-relation mediawiki:slave mysql:db

sudo juju expose mediawiki


**Ejercicio 10.** Instalar docker.

Para poder instalar docker en primer lugar es necesario actualizar el kernel a su versión mas reciente para ello ejecutamos el siguiente comando:

``` apt-get install linux-image-generic-lts-raring linux-headers-generic-lts-raring```

Agregamos el repositorio de Docker:

``` sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"```

Realizamos la instalación y la verificación de que Docker ha sido instalado correctamente:

<a href="http://es.tinypic.com?ref=j5ur7d" target="_blank"><img src="http://i59.tinypic.com/j5ur7d.png" border="0" alt="Image and video hosting by TinyPic"></a>

**Ejercicio 11.**

1. Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Instalmos centos:

```sudo docker pull centos```

Verificamos que la instalación de centos se ha relizado correctamente

<a href="http://es.tinypic.com?ref=160sz5y" target="_blank"><img src="http://i58.tinypic.com/160sz5y.png" border="0" alt="Image and video hosting by TinyPic"></a>



2. Buscar e instalar una imagen que incluya MongoDB.

**Ejercicio 12.**

Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

**Ejercicio 13.**

Crear a partir del contenedor anterior una imagen persistente con commit

**Ejercicio 14.**

Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.


