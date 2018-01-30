#Ejercicio 1#

###¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?###

Para ver como tenemos instalado el disco duro podemos usar el siguiente comando:
~~~
sudo lsblk -fm
~~~ 

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema5/ejrcicio1_1.png)


Donde mi disco se compone de 5 particiones:

* sda1: Reservado para el sistema
* sda2: Patición ntfs donde esta instalado windows 7
* sda3: Partición ntfs 
* sda4: Partición extendida
* sda5: Para la memoria de intercambio (swap)
* sda6: Es una partición con formato ext4 donde tengo instalado ubuntu


#Ejercicio 2#
###Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.##

Instalamos sshfs en nuestra máquina local:
~~~
sudo apt-get install sshfs
~~~


Creamos un directorio local donde montaremos el sistema de ficheros:
~~~
sudo mkdir /mnt/local
~~~

Ahora usamos sshfs para montar sistema de ficheros localmente con el siguiente comando:
~~~
sudo sshfs root@192.168.1.15:/ /mnt/local
~~~

#Ejercicio 3#
###Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre###


raw:

~~~
dd of=fichero-suelto.img bs=1k seek=5242879 count=0
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema5/ejercicio3_1.png)


VMDK:

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema5/ejercicio3_2.png)



qcow2:

~~~
qemu-img create -f qcow2 fichero-cow.qcow2 5M
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema5/ejercicio3_3.png)


Lo montamos con el siguiete comando:

~~~
sudo mount -o loop,offset=32256 fichero-cow.qcow2 /mnt/mountpoint
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema5/ejercicio3_4.png)

El cual nos da un error al no haberlo formateado.




#Ejercicio 4#
###Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema###

Creamos ambas imágenes:
~~~
sudo qemu-img create -f raw imagen1.img 2G
sudo qemu-img create -f raw imagen2.img 2G
~~~

Las convertimos en un dispositivo loop:
~~~
sudo losetup -v -f imagen1.img
sudo losetup -v -f imagen2.img

~~~

Le damos formato xfs a uno, y btrfs a otro.
~~~
sudo mkfs.xfs /dev/loop0
sudo mkfs.btrfs /dev/loop1
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema5/ejercicio4_1.png)


Creamos los puntos de montaje:
~~~
sudo mkdir /mnt/mountpoint1
sudo mkdir /mnt/mountpoint2
~~~


Montamos los dispositivos en los puntos de montaje:
~~~
sudo mount /dev/loop0 /mnt/mountpoint1
sudo mount /dev/loop1 /mnt/mountpoint2
~~~

Por último probamos copiando un fichero a cada uno de los directorios: 

~~~
sudo time -v cp /home/l/Descargas/ubuntu-14.04.1-desktop-amd64.iso /mnt/mountpoint1
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema5/ejercicio4_2.png)

~~~
sudo time -v cp /home/l/Descargas/ubuntu-14.04.1-desktop-amd64.iso /mnt/mountpoint2
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema5/ejercicio4_3.png)


Y observamos que con xfs se consume más tiempo y que el porcentaje de CPU es menor.


#Ejercicio 5#
###Instalar ceph en tu sistema operativo.###

Para instalar ceph ejecutamos el siguiente comando:

~~~
sudo apt-get install ceph-mds
~~~


#Ejercicio 6#
###Crear un dispositivo ceph usando BTRFS o XFS###

Creamos los directorios donde se va a almacenar la información de CEPH
~~~
sudo mkdir -p /srv/ceph/{osd,mon,mds}
~~~

Configuramos ceph, creando un fichero de configuración como el siguiente:

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema5/ejercicio6_1.png)

Creamos una imagen:
~~~
dd of=img_ceph.img bs=1k seek=5242879 count=0 
~~~

La convertimos en un dispositivo loop:
~~~
sudo losetup -v -f img_ceph.img
~~~

Le damos formato xfs:
~~~
sudo mkfs.xfs /dev/loop0
~~~

Una vez hecho esto, creamos el directorio osd.0 a mano:
~~~
sudo mkdir /srv/ceph/osd/osd.0
~~~

Creamos el sistema de ficheros de objetos con:
~~~
sudo /sbin/mkcephfs -a -c /etc/ceph/ceph.conf
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema5/ejercicio6_2.png)


Iniciamos el servicio:
~~~
sudo service ceph start
~~~

Comprobamos si todo ha ido bien con:
~~~
sudo ceph -s 
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema5/ejercicio6_3.png)

Creamos el punto de montaje:
~~~
sudo mkdir /mnt/ceph
~~~

y lo montamos con el siguiente comando:
~~~
sudo mount -t ceph l-K53SC:/ /mnt/ceph
~~~

#Ejercicio 7#
###Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados.###

Creamos un pool:
~~~
sudo rados mkpool piscina
~~~

Para almacenar objetos ejecutamos:
~~~
sudo rados put -p piscina objeto-almacenado fichero-que-almacenaremos.whatever
~~~



#Ejercicio 8#
###Tras crear la cuenta de Azure, instalar las herramientas de línea de órdenes (Command line interface, cli) del mismo y configurarlas con la cuenta Azure correspondiente###

Instalamos desde la consola el CLI de Azure:

~~~
sudo npm install -g azure-cli
~~~

Ahora ejecutamos:

~~~
azure account download
~~~

Y nos dará la dirección de donde podemos descargar el fichero de suscripción. Una vez descargado lo importamos con el siguente comando: 

~~~
azure account import <file>
~~~


#Ejercicio 9#
###Crear varios contenedores en la cuenta usando la línea de órdenes para ficheros de diferente tipo y almacenar en ellos las imágenes en las que capturéis las pantallas donde se muestre lo que habéis hecho.###

#Ejercicio 10#
###Desde un programa en Ruby o en algún otro lenguaje, listar los blobs que hay en un contenedor, crear un fichero con la lista de los mismos y subirla al propio contenedor. Muy meta todo.###


