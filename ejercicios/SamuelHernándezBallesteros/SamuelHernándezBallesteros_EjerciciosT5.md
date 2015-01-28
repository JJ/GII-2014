#TEMA 5: Virtualización del almacenamiento

###Ejercicio 1
¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?

Tengo una partición ext4 donde está instalado Linux. No uso LVM.

![EJ1](http://i58.tinypic.com/ejha1k.jpg)

Si tienes acceso en tu escuela o facultad a un ordenador común para las prácticas, ¿qué almacenamiento físico utiliza?

Buscar ofertas SAN comerciales y comparar su precio con ofertas locales (en el propio ordenador) equivalentes.

Comparación:


###Ejercicio 2
Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.

Avanzado Usar los drivers de FUSE para Ruby (aquí explican más o menos como hacerlo con fusefs para mostrar el contenido de una estructura de datos en un lenguaje como si fuera un fichero. Este es un ejemplo en Python.

Comprobamos que Fuse está cargado con la orden:

	lsmod | grep fuse

Si no devuelve nada es que no tenemos el módulo cargado por tanto tenemos que ejecutar los siguientes comandos tanto en la máquina cliente como en la servidora:

	modprobe fuse
	depmod -A

Instalamos en las dos máquinas sshfs:

	sudo apt-get install sshfs

En la máquina cliente, creamos una carpeta donde vayamos a crear la carpeta remota y ejecutamos:

	sshfs [usuario remoto]]@[IP remota]]:[carpeta remota a montar] [punto de montaje]

###Ejercicio 3
Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre

Instalamos quemu:

	sudo apt-get install qemu-system

Creamos y montamos el almacenamiento virtual:

	sudo qemu-img create -f qcow2 cow.qcow2 5M

	sudo losetup -v -f cow.qcow2

	sudo mkfs.ext4 /dev/loop0

![EJ3-1](http://i62.tinypic.com/msdsn7.jpg)


###Ejercicio 4
Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema

Instalamos las tools necesarias:

	sudo apt-get install btrfs-tools xfsprogs
    
Creamos las imágenes:

	sudo qemu-img create -f raw  a.img 200M
	sudo qemu-img create -f raw  b.img 200M

Las ponemos en bucle y se les da formato:

    sudo losetup -v -f a.img
    sudo losetup -v -f b.img
    sudo mkfs.xfs /dev/loop2
    sudo mkfs.btrfs /dev/loop3

Creamos el punto de montaje y las montamos:

    sudo mkdir mnt/m1
    sudo mkdir mnt/m2
    sudo mount -t xfs /dev/loop2 /mnt/m1
    sudo mount -t xfs /dev/loop3 /mnt/m2


![EJ4-1](http://i58.tinypic.com/2ce2qgh.jpg)

![EJ4-2](http://i62.tinypic.com/hs44k2.jpg)

Para comprobarlo copiamos un fichero:

	sudo time -v cp <fichero> /mnt/m1/p1
    
	sudo time -v cp <fichero> /mnt/m2/p1

###Ejercicio 5
Instalar ceph en tu sistema operativo.

Ejecutamos la siguiente orden:

	sudo apt-get install ceph-mds

###Ejercicio 6
Crear un dispositivo ceph usando BTRFS o XFS

Avanzado Usar varios dispositivos en un nodo para distribuir la carga.

Creamos los directorios:

	sudo mkdir -p /srv/ceph/{osd,mon,mds}

Creamos el siguiente fichero: /etc/ceph/ceph.conf

[global]
log file = /var/log/ceph/$name.log
pid file = /var/run/ceph/$name.pid
[mon]
mon data = /srv/ceph/mon/$name
[mon.mio]
host = samuel-virtual-machine
mon addr = 127.0.0.1:6789
[mds]
[mds.mio]
host = samuel-virtual-machine
[osd]
osd data = /srv/ceph/osd/$name
osd journal = /srv/ceph/osd/$name/journal
osd journal size = 1000 ; journal size, in megabytes
[osd.0]
host = samuel-virtual-machine
devs = /dev/loop4

Creamos el sistema:

    qemu-img create -f raw ceph.img 100M
    sudo losetup -v -f ceph.img
    sudo mkfs.xfs /dev/loop4

Creamos un directorio y el sistema de ficheros:

    sudo mkdir /srv/ceph/osd/osd.0
    sudo /sbin/mkcephfs -a -c /etc/ceph/ceph.conf

Iniciamos el servicio:

	sudo /etc/init.d/ceph -a start

Creamos el directorio y montamos:

    sudo mkdir /mnt/ceph
    sudo mount -t ceph samuel-virtual-machine:/ /mnt/ceph

###Ejercicio 7
Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados.

Creamos un pool:

	sudo rados mkpool new_pool

Añadimos un fichero:

	rados put -p new_pool obj <fichero>

###Ejercicio 8
Tras crear la cuenta de Azure, instalar las herramientas de línea de órdenes (Command line interface, cli) del mismo y configurarlas con la cuenta Azure correspondiente

Una vez tenemos la cuenta de azure:

	sudo npm install azure-cli -g

Asociamos nuestra cuenta:

	azure account download

Accedemos a la url indicada y descargamos un fichero, lo importamos con la orden:

	azure account import [fichero]

Si todo va bien, tendremos nuestra cuenta enlazada.

###Ejercicio 9
Crear varios contenedores en la cuenta usando la línea de órdenes para ficheros de diferente tipo y almacenar en ellos las imágenes en las que capturéis las pantallas donde se muestre lo que habéis hecho.

Para crear los contenedores tenemos que seguir los siguientes pasos:

	azure storage account create samueliv
    
    azure storage account keys list samueliv

Al final del fichero ".bashrc", insertarmos:

	export AZURE_STORAGE_ACCOUNT=samueliv
	export  AZURE_STORAGE_ACCESS_KEY=CLAVE

Para poder acceder sin tener que exportar las variables de entorno cada vez que vayamos a hacer algo ejecutamos source .bashrc

Ahora podemos crear los contenedores:

    azure storage container create contenedor -p blob
    azure storage container create contenedor1 -p blob
    azure storage container create contenedor2 -p blob

![EJ9-1](http://i57.tinypic.com/2la7dy0.jpg)

![EJ9-2](http://i57.tinypic.com/2la7dy0.jpg)

Subimos un fichero cualquiera

azure storage blob upload T5Ejercicio9.png contenedor1 T5Ejercicio9.png

Podemos ver la imagen subida en el siguiente enlace

[Contenedor](https://samueliv.blob.core.windows.net/contenedor1/T5Ejercicio9.png)

###Ejercicio 10
Desde un programa en Ruby o en algún otro lenguaje, listar los blobs que hay en un contenedor, crear un fichero con la lista de los mismos y subirla al propio contenedor. Muy meta todo.