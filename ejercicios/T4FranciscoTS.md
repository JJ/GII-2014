#TEMA 4: Virtualización ligera usando contenedores#

##Ejercicio 1##

#####Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.#####

Hay que realizar la instalación desde el repositorio:

```shell
sudo apt-get install lxc
```

Una vez hecho esto, será necesario comprobar si nuestra máquina es compatible utilizando el comando 

```shell
lxc-checkconfig
```


##Ejercicio 2##

#####Comprobar qué interfaces puente se han creado y explicarlos.#####

Tras ejecutar `ipconfig -a`, veo que se han creado dos nuevas interfaces:
+ lxcbr0
+ veth06TK6W

Y ejecutando `brctl show`
+ lxcbr0

De esta forma el contenedor tiene acceso a Internet.


##Ejercicio 3##

#####1. Crear y ejecutar un contenedor basado en Debian.#####

Para crear el contenedor Debian, simplemente he ejecutado 

```shell 
sudo lxc-create -t debian -n debianita
``` 

Y lo he ejecutado con 

```shell
sudo lxc-start -n debianita
```

#####2. Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro.#####

Para crear el contenedor CentOS, simplemente he ejecutado 

```shell
sudo lxc-create -t centos -n new
``` 

Y lo he ejecutado con 

```shell
sudo lxc-start -n new
```


##Ejercicio 4##

#####1. Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.#####

Tras instalarlo utilizando: 

```shell 
wget http://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash
```

#####2. Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.#####

He accedido a `http://localhost:5000` y he gestionado los contenedores. En la parte superior, si pulsamos sobre un contenedor, podemos editar sus parámetros


##Ejercicio 6##

#####1. Instalar juju.#####

He instalado "juju" siguiendo las instrucciones de la sesión. Para listar los contenedores

```shell
sudo lxc-ls
```

#####2. Usándolo, instalar MySQL en un táper.#####

Después, he procedido a instalar en el contenedor "MySQL" y "Mediawiki". Es necasario realizar la relación mediante este comando:

```shell
juju add-relation mediawiki:db mysql
```


##Ejercicio 7##

#####1. Destruir toda la configuración creada anteriormente#####

Para destruir la configuración realizada, he tenido que ejecutar los siguientes comandos:

```shell
  juju destroy-service mysql
  juju destroy-service mediawiki
  sudo juju destroy-environment local
```

#####2. Volver a crear la máquina anterior y añadirle mediawiki y una relación entre ellos.#####

He vuelto a ejecutar todos los pasos:

```shell
juju bootstrap
juju deploy mediawiki
juju deploy mysql
juju add-relation mediawiki:db mysql
juju expose mediawiki
```

#####3. Crear un script en shell para reproducir la configuración usada en las máquinas que hagan falta.#####

Y mediante `juju status` compruebo que todo funcione adecuadamente.

El script para aplicar la configuración es el siguiente:

```bash
juju switch local
sudo juju bootstrap
juju deploy mediawiki
juju deploy mysql
juju add-relation mediawiki:db mysql
juju expose mediawiki
echo "Finalizado correctamente"
```


##Ejercicio 8##

#####Instalar libvirt. Te puede ayudar esta guía para Ubuntu.#####

He ejecutado el siguiente comando:

```shell
sudo apt-get install kvm libvirt-bin virtinst
```

Tras esto, he comprobado que sea compatible, ejecutando el comando `` kvm-ok``, que devolverá un mensaje que indica que este tipod de aceleración se puede usar:

```shell
INFO: /dev/kvm exists
KVM acceleration can be used
```


##Ejercicio 9##

#####Instalar un contenedor usando virt-install.#####

Instalamos "virt-viewer" para poder acceder a la interfaz gráfica usando: 

```shell
sudo apt-get install virt-viewer
```

Después, descargamos la imagen de instalación de, por ejemplo, alguna distribución Linux. Yo he optado por "Puppy Linux". Y ejecutamos el comando para la creación del contenedor.

```shell
sudo virt-install -n virt-puppylinux -r 512 --disk path=/var/lib/libvirt/images/puppy.img,bus=virtio,size=5 -c tahr-6.0-CE_PAE.iso --accelerate --network network=default,model=virtio --connect=qemu:///system --vnc --noautoconsole -v
```

Una vez que comience la instalación, se nos indicará que podremos seguir la instalación desde la interfaz. Para ello ejecutamos:

```shell
sudo virt-viewer -c qemu:///system virt-puppylinux
```

Cuando queramos parar la máquina, listaremos las máquinas que tenemos ``virsh list`` y lo paramos de la siguiente forma:

```shell
sudo virsh shutdown virt-puppylinux
```


##Ejercicio 10##

#####Instalar docker.#####

He instalado "Docker" utilizando el tutorial de la [página web de docker](http://docs.docker.com/installation/ubuntulinux/#ubuntu-trusty-1404-lts-64-bit):

+ Instalamos ``sudo apt-get install docker.io`` y ejecutamos ``source /etc/bash_completion.d/docker.io`` 
+ Instalamos ``sudo apt-get install apt-transport-https``.
+ Añadimos la llave del repositorio de Docker: ``sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9``
+ Ejecutamos ``sudo sh -c "echo deb https://get.docker.com/ubuntu docker main\ /etc/apt/sources.list.d/docker.list"`` para añadir el repositorio
+ Actualizamos los repositorios e instalamos con ``sudo apt-get update`` y ``sudo apt-get install lxc-docker``

Una vez instalado, ejecutamos: 

```shell
sudo rm /var/run/docker.pid
```

para evitar problemas en la ejecución y ejecutamos con 

```shell
sudo docker -d &
```


##Ejercicio 11##

#####1. Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.#####

Después de haber instalado una imagen de Ubuntu:

```shell 
sudo docker pull ubuntu
```

hacemos lo mismo con CentOS: 

```shell
sudo docker pull centos
```

#####2. Buscar e instalar una imagen que incluya MongoDB.#####

Una imagen que incluye MongoDB, se llama "dockerfile/mongodb" (contiene una imagen Ubuntu con MongoDB). Se instala con:

```shell
docker pull dockerfile/mongodb
```


##Ejercicio 12##

#####Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.#####

+ Entramos al contenedor ``sudo docker run -i -t ubuntu /bin/bash``
+ Añadimos el nuevo usuario ``useradd -d /home/usuarionginx -m usuarionginx``
+ Damos al usuario la posibilidad de ejecutar como "sudo" ``adduser usuarionginx sudo``
+ Establecemos contraseña ``passwd usuarionginx``
+ Entramos como el usuario mediante ``su usuarionginx``
+ Actualizamos los repositorios e instalamos nginx ``sudo apt-get update && sudo apt-get install nginx``
+ Iniciamos el servicio ``sudo service nginx start``


##Ejercicio 13##

#####Crear a partir del contenedor anterior una imagen persistente con commit.#####

Manteniendo el contenedor en funcionamiento (ya sea teniendo la terminal abierta -la creada unos pasos antes- o enviando un nuevo trabajo), listamos los dockers con ``sudo docker ps`` y guardamos la ID.
Escribimos 

```shell
sudo docker commit 5c1230db2a0d nombrenuevo
```

y el resultado será una ID.

Al ejecutar 

```shell
sudo docker images
``` 

Veremos que la última es la que hemos creado.


##Ejercicio 14##

#####Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.#####

Nos registramos en la página web de Docker (podemos hacerlo utilizando nuestra cuenta de GitHub).
Tras esto, pulsamos sobre nuestro nick y vamos a "My Repositories". Allí, hacemos click sobre "Add Repository>Automated Build". Elegimos el repositorio de GitHub (o Bitbucket) en el que queremos que se haga el despliegue. Cuando se haya creado, deberemos escribir un "Dockerfile" que indique qué debe instalarse. En mi caso ha sido este:

```shell
# ubuntuDAI
FROM ubuntu
MAINTAINER toranzo <hisahsi90@gmail.com> Version: 1.0
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
RUN apt-get update
RUN apt-get install -y mongodb-org
RUN service mongod start
RUN apt-get install -y build-essential
RUN apt-get install -y nodejs
```

Una vez que se ha creado y construido, nos aparecerá (en la web de Docker), las instrucciones a ejecutar para descargar nuestro contenedor, que serán del tipo: 

```shell
docker pull [nombre contenedor]
```
