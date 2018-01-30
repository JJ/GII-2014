TEMA 5
=========


##Ejercicio 1##

![gparted](https://raw.githubusercontent.com/yonatan24891/ImagenesIV/master/gparted.bmp)

Podemos ver dos particiones para Windows y una extendida para ubuntu que contiene: el raíz, el home y la swap


##Ejercicio 2##

Localizamos la ip de la maquina virtual añadimos esta línea al fichero /etc/hosts para acceder de forma más cómoda:

192.168.65.1

Instalamos sshfs:

`sudo apt-get install sshfs`

Creamos una carpeta para montar el sistema de ficheros y lo montamos con sshfs:

`mkdir carpeta`

`sshfs yonatan24891@192.168.65.1:/home/yonatan24891 carpeta`

Finalmente podremos acceder a nuestras carpetas montadas en una carpeta usando el protocolo ssh:


##Ejercicio 3##

Instalamos QEMU:

`sudo aptitude install qemu-system`

Cremaos y montamos el amacenamiento:

`sudo qemu-img create -f qcow2 cow.qcow2 5M`

`sudo losetup -v -f cow.qcow2`

`sudo mkfs.ext4 /dev/loop0`


##Ejercicio 4##

Instalamos las herramientas:

`sudo apt-get install xfsprogs btrfs-tools ntfs-3g`

Creamos 3 imagenes y las montamos en un dispositivo loop:

`qemu-img create -f raw xfs.img 1G`

`qemu-img create -f raw btrfs.img 1G`

`qemu-img create -f raw ntfs.img 1G`

`losetup -f xfs.img`

`losetup -f btrfs.img`

`losetup -f ntfs.img`

Les damos formato y las montamos en nuestro sistema de ficheros:

`mkfs.xfs /dev/loop0`

`mkfs.btrfs /dev/loop1`

`mkfs.ntfs -f /dev/loop2`

`mkdir /mnt/xfs /mnt/btrfs /mnt/ntfs`

`mount /dev/loop0 /mnt/xfs`

`mount /dev/loop1 /mnt/btrfs`

`mount /dev/loop2 /mnt/ntfs`

Crearmos el fichero

sudo dd if=/dev/zero of=/home/yonatan24891/40M bs=1MB count=40

Medimos tiempo con time:

sudo time -v cp 40M /mnt/loop0/40M
sudo time -v cp 40M /mnt/loop1/40M
sudo time -v cp 40M /mnt/loop2/40M

Resultados:

El primero ha tenido un system time de 0.52 segundos. El segundo, de 0.55 segundos. El tercero de 0.60


##Ejercicio 5##

Para instalarlo he usado el siguiente comando:

sudo apt-get install ceph-mds


##Ejercicio 6##

### Crear un dispositivo ceph usando BTRFS o XFS.

Para crear un dispositivo usando XFS una vez instalado ceph deberemos:

1. Crear los directorios donde se almacenará la información de ceph:

        # mkdir -p /srv/ceph/{osd,mon,mds}


2. Creamos un fichero de configuración en `/etc/ceph/ceph.conf`:

    ```
[global]
    log file = /var/log/ceph/$name.log 
    pid file = /var/run/ceph/$name.pid 
[mon] 
    mon data = /srv/ceph/mon/$name 
[mon.mio] 
    host = yonatan24891
    mon addr = 127.0.0.1:6789 
[mds] 
[mds.mio] 
    host = yonatan24891
[osd] 
    osd data = /srv/ceph/osd/$name 
    osd journal = /srv/ceph/osd/$name/journal 
    osd journal size = 1000 ; journal size, in megabytes 
[osd.0] 
    host = yonatan24891
    devs = /dev/loop0 
    ```

Para crear el dispositivo **XFS** tenemos que crear el directorio a 

`mkdir /srv/ceph/osd/osd.0`


Para finalizar con nuestra configuración creamos el sistemas de ficheros de objetos:

`mount -o loop xfs.img /srv/ceph/osd/osd.0/`

`mkcephfs -a -c /etc/ceph/ceph.conf`

`/etc/init.d/ceph -a start`


Comprobamos:

`ceph -s`

Montamos nuestro nuevo sistema de ficheros de objetos:

`mount -t ceph localhost:/ /mnt/ceph/`


##Ejercicio 7##

Creamos un pool:

`sudo rados mkpool yo`

y añadimos un fichero

`rados put -p yo obj yo.txt`


##Ejercicio 8##

Instalamos CLI:

`sudo apt-get install nodejs-legacy npm`

`npm install -g azure-cli`


Nos logueamos:

`azure login -u <your organizational ID email address>`

Tenemos que enlazar con nuestra cuenta de Azure. Para ello, ejecutamos:

`azure account download`

Se nos indicará una URL. Cuando la abramos, se descargará un fichero. Importamos este fichero con:

`azure account import <fichero>`



