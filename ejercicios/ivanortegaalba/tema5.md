# TEMA 5: Virtualización ligera usando contenedores

## Ejercicio 1

#### ¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?
Tengo 2 particiones en un Mac book pro:
- Una donde tengo instalado Linux con 30 GB asignados
- Otra donde tengo macos con 90GB
- Tengo dos particiones extra para el boot y el swap de linux


#### Buscar ofertas SAN comerciales y comparar su precio con ofertas locales (en el propio ordenador) equivalentes.

xStack Storage® Almacenamiento iSCSI SAN con 8 bahías
DSN-2100-10
Capacidad de hasta 8 discos duros SATA/SATA-II de 3.5” , de cualquier capacidad para un total de 16TB actualmente
Potente diseño SoC (System-on-a-Chip) capaz de manejar hasta 80.000 operaciones de entrada y de salida por segundo.
Bahías para discos duros SATA cambiables en funcionamiento
4 puertos Gigabit Ethernet con soporte de agregación de enlace 802.3ad
Batería para conservar los contenidos de la memoria caché de hasta 4GB
Soporte para configuraciones HDD RAID 0/1/1+0/5 HDD
Fácil gestión a través del gestor de dispositivos IP-SAN basado en web

## Ejercicio 2
#### Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.

Vamos a necesitar 2 máquinas y comprobamos que no hay instancia de FUSE:

```
lsmod | grep fuse
```
y
```
depmod -A
```
Lo instalaremos en las dos máquinas.

En la máquina invitada vamos a crear una carpeta y la montaremos con sshfs:
```
sshfs ivanortegaalba@192.168.78.128:/home/ivanortegaalba/prueba-IV /home/ivanortegaalba/prueba-IV
```
Si se ha hecho correctamente, ya tendremos en nuestra máquina el enlace.

## Ejercicio 3
#### Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre.

Instalamos Qemu con el comando:
```
sudo apt-get install qemu-system
```
Ahora creamos la imagen con:

```
qemu-img create -f qcow2 cow.qcow2 10M
```
Y posteriormente montamos el VMDK:
```
sudo losetup -v -f cow.qcow2
```
Y asociamos al dispositivo de bloque:
```
sudo mkfs.ext4 /dev/loop0:
```

## Ejercicio 4
#### Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema.
Para manejar estos formatos tenemos que instalar las herramientas necesarias:
```
sudo apt-get install xfsprogs
```
```
sudo apt-get install btrfs-tools
```
Una vez las tenemos, creamos las imagenes y las ponemos en looping:
```
sudo qemu-img create -f raw Imagen1.img 256M
sudo qemu-img create -f raw Imagen2.img 256M
sudo losetup -v -f Imagen1.img. sudo losetup -v -f Imagen2.img
```
Damos formato:
```
sudo mkfs.xfs /dev/loop1
sudo mkfs.btrfs /dev/loop2
```
Creamos las carpetas y puntos de montaje:
```
sudo mkdir /mnt/Imagen1
sudo mkdir /mnt/Imagen2
sudo mount -t xfs /dev/loop3 /mnt/Imagen1
sudo mount -t btrfs /dev/loop2 /mnt/Imagen2
```
## Ejercicio 5
#### Instalar ceph en tu sistema operativo.
```
sudo apt-get install ceph-mds
```

## Ejercicio 6
#### Crear un dispositivo ceph usando BTRFS o XFS.

Creamos carpetas:
```
sudo mkdir -p /srv/ceph/{osd,mon,mds}

```
Y editamos el archivo de configuración: ``` /etc/ceph/ceph.conf ``` :
```
[global]
log file = /var/log/ceph/$name.log
pid file = /var/run/ceph/$name.pid
[mon]
mon data = /srv/ceph/mon/$name
[mon.mio]
host = ivan-PC
mon addr = 127.0.0.1:6789
[mds]
[mds.mio]
host = ivan-PC
[osd]
osd data = /srv/ceph/osd/$name
osd journal = /srv/ceph/osd/$name/journal
osd journal size = 1000 ; journal size, in megabytes
[osd.0]
host = ivan-PC
devs = /dev/loop0
```

Creamos imagen y ficheros necesarios:

```
qemu-img create -f raw ceph_osd.img 100M
sudo losetup -v -f ceph_osd.img
sudo mkfs.xfs /dev/loop0
```

Creamos el directorio y el sistema de archivos:

```
sudo mkdir /srv/ceph/osd/osd.0
sudo /sbin/mkcephfs -a -c /etc/ceph/ceph.conf
```

Finalmente creamos el directorio donde lo vamos a montar y lo montamos:

```
sudo mkdir /mnt/ceph
sudo mount -t ceph ivan-PC:/ /mnt/ceph
```

## Ejercicio 7
#### Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados.

Para almacenar los objetos en rados lo primero que deberemos hacer es crear una piscina:
```
rados mkpool prueba
```
Si queremos comprobar que se ha creado:
```
rados lspools
```
Una vez creado, podemos introducir cualquier archivo que tengamos en nuestro sistema, como por ejemplo:
```
rados put -p objeto-prueba objeto prueba.img
```
## Ejercicios de Azure

** A falta de cuenta **
