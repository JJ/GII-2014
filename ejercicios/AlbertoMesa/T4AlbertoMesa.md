
#Alberto Mesa Navarro
##Virtualización ligera usando contenedores
##Ejercicios del Tema 4

###Ejercicio 1
####Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en [Github](https://github.com/lxc/lxc) como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Para instalar lxc usaremos:
`sudo apt-get install lxc lxc-templates`


###Ejercicio 2
####Comprobar qué interfaces puente se han creado y explicarlos.

`ifconfig -a`

![1](http://s1.postimg.org/ozfpq2j8v/lxcbr0.png)

Vemos que con la instalación se ha creado una nueva interfaz lxcbr0, cuya utilidad es permitir al container tener acceso a la red.


###Ejercicio 3
####3.1 Crear y ejecutar un contenedor basado en Debian.

Crearemos el contenedor lxc con lxc-create, y lo probamos con lxc-start:

`sudo lxc-create -t debian -n ubuntu`

Para arrancarlo:

`sudo lxc-start -n ubuntu`

![2](http://s15.postimg.org/w8pv9b72z/contenedor.png)

*usuario: root
*clase: root

####3.2 Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro.     

CentOS no da problemas, pero primero tenemos que descargamos e instalar yum en caso de que no lo tengamos previamente:

`sudo apt-get install yum`

`sudo lxc-create -t centos -n centos`

`sudo lxc-start -n centos`

![3](http://s14.postimg.org/b1yuvmbf5/centos.png)

###Ejercicio 4
####4.1 Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

`sudo wget http://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash`

![4](http://s30.postimg.org/js7c1lqb5/webpanel.png)

####4.2 Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

Para acceder a la gestión de contenedores, podemos usar un navegador web y dirigiéndonos a `http://localhost:5000`. Para logearnos por primera vez, usamos el usuario `admin` y la clave `admin` :

![5](http://s11.postimg.org/wkpxerx83/LXCWeb_Panel.png)

En la siguiente captura puede comprobarse cómo se restringen los recursos, usando las opciones que aparecen tras elegir el contenedor que queremos modificar:

![6](http://s23.postimg.org/6lrzqaajv/modificados.png)


###Ejercicio 5
####Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.


###Ejercicio 6
####6.1 Instalar juju.

Podemos seguir el propio [tutorial de la asignatura](http://jj.github.io/IV/documentos/temas/Contenedores#configurando-las-aplicaciones-en-un-tper):

`sudo add-apt-repository ppa:juju/stable`

`sudo apt-get update && sudo apt-get install juju-core`

####6.2 Usándolo, instalar MySQL en un táper

Primero debemos iniciarlo:

`juju init`

`juju bootstrap`

Y procedemos a la instalación:

`juju deploy mediawiki`

`juju deploy mysql`

Por último establecemos mysql como la BD que va a usar mediawiki añadiendo una relación:

`juju add-relation mediawiki:db mysql`

###Ejercicio 7
####7.1 Destruir toda la configuración creada anteriormente.

`juju destroy-service mysql`
`juju destroy-service mediawiki`
`sudo juju destroy-environment local`

####7.2 Volver a crear la máquina anterior y añadirle mediawiki y una relación entre ellos.

`juju deploy mediawiki`
`juju deploy msql`
`juju add-relation mediawiki msql`
`juju expose mediawiki`

####7.3 Crear un script en shell para reproducir la configuración usada en las máquinas que hagan falta.

Lo único que tenemos que tener en cuenta es indicar el entorno:

```
juju switch local

sudo juju bootstrap
juju deploy mediawiki
juju deploy mysql
juju add-relation mediawiki:db mysql

juju expose mediawiki

```

###Ejercicio 8
####Instalar libvirt. Te puede ayudar [esta guía para Ubuntu](https://help.ubuntu.com/12.04/serverguide/libvirt.html) .

Comprobamos la compatibilidad con KVM antes de empezar: `kvm-ok`. Si no está instalado ejecutamos `sudo apt-get install cpu-checker`.

![7](http://s2.postimg.org/s4srkgift/KVM.png)

Instalamos: `sudo apt-get install kvm libvirt-bin`


###Ejercicio 9
####Instalar un contenedor usando virt-install.

Primero instalamos: `sudo apt-get install virtinst`

A continuación instalamos lo siguiente para poder utilizar la GUI virt-viewer: 
`sudo apt-get install virt-viewer`

Colocamos la ISO del SO a instalar en `/var/lib/libvirt/images` e instalamos el contendor:
`sudo cp Escritorio/ubuntu-14.04.1-desktop-i386.iso /var/lib/libvirt/images`

`sudo virt-install --name ubuntuVirt --ram 512 --file=/var/lib/libvirt/images/ubuntu-14.04.1-desktop-i386.img --file-size=3 --vnc --cdrom=/var/lib/libvirt/images/ubuntu-14.04.1-desktop-i386.iso`

![15](http://s21.postimg.org/cn07doebb/ubuntu_Virt1.png)


###Ejercicio 10
####Instalar docker.

Se puede utilizar el siguiente [tutorial](https://docs.docker.com/installation/ubuntulinux/), de donde obtenemos los pasos a seguir:

Instalamos el paquete más reciente:
`sudo apt-get install docker.io`

Reiniciamos bash, o bien ejecutamos:
`source /etc/bash_completion.d/docker.io`

Instalar transport-https para asegurarnos de que nuestro APT puede trabajar con https:
`apt-get install apt-transport-https`

Lo siguiente que debemos hacer es añadir la llave del repositorio de Docker a nuestro llavero local:
`sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9` 

Tal como indica el tutorial, añadimos el repositorio a nuestra lista de fuentes de apt:
`sudo sh -c "echo deb https://get.docker.com/ubuntu docker main\/etc/apt/sources.list.d/docker.list"` 

Actualizamos los repositorios e instalamos lxc-docker:
`sudo apt-get update`
`sudo apt-get install lxc-docker`

Por último ejecutamos el servicio:
`sudo docker -d &`

Si nos encontramos con el mensaje de error `pid file found, ensure docker is not running or delete /var/run/docker.pid` deberemos borrar dicho fichero: `sudo rm /var/run/docker.pid`  y volver a ejecutar el servicio: `sudo docker -d &`.

![8](http://s11.postimg.org/u3vob9lgz/docker.png)

*Nota: docker no soporta oficialmente los 32 bits.

###Ejercicio 11
####11.1 Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Deberemos usar la orden docker pull:
`sudo docker pull ubuntu`

Análogamente para centOS:
`sudo docker pull centos`

![9](http://s7.postimg.org/s79h8saa3/dockercentosinstall.png)

####11.2 Buscar e instalar una imagen que incluya MongoDB.

`sudo docker pull hairmare/mongodb`

![9](http://s11.postimg.org/896ike9yr/dockermongo.png)


###Ejercicio 12
####Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

Creamos nuestro propio usuario: `useradd -d /home/DockerUser -m DockerUser`
Establecemos una contraseña: `passwd DockerUser`
Por último le damos privilegios de súperusuario y nos logeamos con su sesión ejecutando: 
`adduser DockerUser sudo` y `login DockerUser`

![10](http://s15.postimg.org/4ll2bnau3/Docker_User.png)

Tal y como pide el ejercicio, instalamos nginx:
`sudo apt-get install nginx`

![11](http://s3.postimg.org/89e0i2iub/nginx.png)

Por último comprobamos que funciona correctamente:

![12](http://s23.postimg.org/4fp0b7lrf/nginx_status.png)

###Ejercicio 13
####Crear a partir del contenedor anterior una imagen persistente con commit.

Lo primero que tenemos que tener en cuenta es que necesitamos el container ejecutándose y obtener el ID correspondiente, ya que es necesario pasárselo a docker commit. Lo consultamos con:
`sudo docker ps -notrunc`

![13](http://s23.postimg.org/wdn0dvppn/image.png)

Como el identificador es demasiado largo, vamos a llamar a la imagen persistente. Para hacer todo a la vez ejecutamos:

`sudo docker commit 4a2fef244883d2cc851e39800d5ba41384711bcb93ac30f5ca1c0e153276d829 persistente`.

Ejecutamos y comprobamos:

![14](http://s21.postimg.org/p3ednn3av/persistente.png)


###Ejercicio 14
####Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.


Es necesario registrarse en Docker y seleccionar nuestra cuenta de Github. Los pasos se omiten por ser irrelevantes.

Una vez logeados y con nuestro repositorio de Github añadido, creamos un nuevo Automated Build dentro de nuestra repo. Una vez hecho se activa el trigger del build (será esencial crear un fichero Dockerfile para que el build sea correcto):

![18](http://s27.postimg.org/j3ht0qyar/image.png)


![15](http://s28.postimg.org/fy6ulej3x/Dock1.png)

Tal como nos avisa el mensaje, deberemos asegurarnos de que el build finaliza sin errores:

![16](http://s23.postimg.org/xb84uq38r/Dock2.png)

Para instalarlo en nuestra máquina, deberemos ejecutar:

`sudo docker pull am83/dockerrepo`

![17](http://s3.postimg.org/5udv8wlpf/pull_am.png)










