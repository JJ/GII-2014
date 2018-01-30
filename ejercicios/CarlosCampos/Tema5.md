#Carlos Campos Fuentes
##Virtualización de almacenamiento

###Ejercicio 1

######Mis particiones
Actualmente con el Macbook, solo tengo la particion de sistema operativo, pero cuando usaba Linux, tenia una partición para el boot, raiz y home.

######Ofertas SAN

* [Drobo SAN Array B1200i 12 bahías iSCSI](http://www.bechtle.es/shop/BD_ES-es/Drobo+SAN+Array+B1200i+12+bah%C3%ADas+iSCSI_869939)

  Precio: 4.948,90 € (IVA incluido).  
  Conexiones:	4 Gigabit Ethernet  
  Fuente de alimentación:	2x redundante.  
  Controlador:	Single  
  Garantía del fabricante:	2 años servicio en taller.  

  Bahías sin marco  
  Para máx. 12 discos duros 8,9 cm (3,5") SAS o SATA o 2 a 3 SSD (máx. 9 discos duros).  
  Incluye 2 fuentes de alimentación de 1,8 m, kit de montaje en rack.  

* [D-Link SAN Storage DSN-6110 iSCSI](http://www.bechtle.es/shop/BD_ES-es/D-Link+SAN+Storage+DSN-6110+iSCSI_756649)

  Precio: 4.746,83 € (IVA incluido).  
  Capacidad:	36 GB.  
  Conexiones:	iSCSI.  
  Garantía del fabricante:	3 años servicio en taller.  

  Unidad de disco duro SAN D-Link xStack DSN-6110.  
  Compatibilidad con RAID.  
  12 x Bahías Totales  
  Gigabit Ethernet.  
  2U Montable en Bastidor.  

### Ejercicio 2
Antes de nada, tenemos que comprobar si tenemos cargado **fuse**. Para ello tenemos que ejecutar en una consola:

    lsmod | grep fuse

En el caso de que nos nos aparezca nada, tenemos que ejecutar:

    modprobe fuse
    depmod -A

Ahora, instalamos sshfs en las dos máquinas (cliente y servidor) desde la consola a través de apt:  

    sudo apt-get install sshfs

El siguiente paso a realizar es crear una carpeta en la máquina cliente donde vayamos a montar la remota, para esto:

    mkdir carpeta_remota
    sshfs [usuario_remoto]@[IP]:[carpeta_remota] [punto a montar]
    --
    Por ejemplo: sshfs ccampos@server:Documents carpeta_remota

### Ejercicio 3
En primer lugar, tenemos que instalar si no lo tenemos **qemu**:  

    sudo apt-get install qemu-system

Para la creación y posterior montaje de un almacenamiento virtual ejecutamos:  

    sudo qemu-img create -f qcow2 cow.qcow2 6M
    sudo losetup -v -f cow.qcow2
    sudo mkfs.ext4 /dev/loop0

Podemos ver en la siguiente imagen el resultado de dichos comandos:  

![Imgur](http://i.imgur.com/inKgouI.png)

### Ejercicio 4
Para poder dar el formato **xfs** o **btrfs** tenemos que instalar algunas herramientas:  

    sudo apt-get install btrfs-tools xfsprogs

Creamos las imágenes y les damos formato.

    sudo qemu-img create -f raw xfs.img 200M
    sudo qemu-img create -f raw btrfs.img 200M
    sudo losetup -v -f xfs.img
    sudo losetup -v -f btrfs.img
    sudo mkfs.xfs /dev/loop0
    sudo mkfs.btrfs /dev/loop1

Creamos los dos puntos de montajes y las montamos.

    sudo mkdir /media/xfs
    sudo mkdir /media/btrfs
    sudo mount -t xfs /dev/loop0 /media/xfs
    sudo mount -t btrfs /dev/loop1 /media/btrfs

Para comprobar el rendimiento de una y otra, he copiado y pegado un archivo grandels en los directorios (time cp archivo.tar.gz /media/xfs) y el tiempo que han tardado cada unas han sido:  

* XFS: 0.304s
* BTRFS: 0.323s

### Ejercicio 5
Para instalar **ceph** tan solo tenemos que instalar el paquete **ceph-mds**:

    sudo apt-get install ceph-mds

### Ejercicio 6
Vamos a crear un dispositivo ceph usando XFS, para ello en primer lugar tenemos que crear los directorios:

    mkdir -p /srv/ceph/{osd,mon,mds}

Creamos el fichero de configuración **/etc/ceph/ceph.conf**

![Imgur](http://i.imgur.com/Z5AntFP.png)

Una vez creado el archivo tenemos que crear el sistema, para ello debemos de ejecutar los siguientes comandos:

    sudo qemu-img create -f raw ceph.img 100M
    sudo losetup -v -f ceph.img
    sudo mkfs.xfs /dev/loop4  

### Ejercicio 7
Tenemos que crear primero el pool y añadimos un fichero:

    sudo rados mkpl pooltmp
    rados put -p pooltmp obj filename.txt
