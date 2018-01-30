####1. ¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?

![](http://i.imgur.com/NYC7o1b.png)

Aquí podemos ver las distintas particiones donde están Windows y Linux. (tengo una partición para cada SO (sda2 y sda3) y una de datos compartida(sda4)).

#1.1. Si tienes acceso en tu escuela o facultad a un ordenador común para las prácticas, ¿qué almacenamiento físico utiliza?

Creo que utilizan un sistema de ficheros remoto.

####1.2. Buscar ofertas SAN comerciales y comparar su precio con ofertas locales (en el propio ordenador) equivalentes.

Según he estado investigando, SAN es mucho mas caro que discos duros locales. Barracuda ofrece un sistema de disco duro de red de unos 200GB (para backups automaticas) por unos 1200$ anuales. (carísimo para mi gusto).

[](http://www.macnificos.com/product.aspx?p=7909&gclid=CjwKEAiAxZKmBRD_5cCvs8SbxXsSJADZBCmdnxG6tkwS6IEgYWv8mb0TG3jTd6MguYzeIXWKlDOOjRoCxwLw_wcB)

Aqui un SAN con 8 ranuras para disco duro, por el módico precio de 1229€.

Evidentemente son mucho mas caros que los disco duros locales.


####2. Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.

Pasos para esto:

1º: Instalar sshfs en la máquina anfitrión y máquina virtual (por ejemplo las creadas en el tema4)

sudo apt-get install sshfs.

2º: Entrar en la máquina virtual y añadir dentro del grupo de fuse al usuario:

sudo usermod -a -G fuse ariacus

3º: Tendremos que usar sshfs ariacus@10.0.3.246:/home/pr4/prueba /home/ariacus/practica5

De esta forma veremos que si abrimos la carpeta va a estar el mismo archivo que el del contenedor


####3. Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre

Para hacer el ejercicio utilizaremos una imagen con formato RAW que es admitida por la mayoría de los SO.

fallocate -l 5M imgraw.img

Podemos visualizarla con:

qemu-img create -f qcow2 fichero-cow2 5M


Por último tenemos que crear otra imagen en formato vmdk usando QEMU y la creamos como con qcow2.( no olvidemos montar la imagen después: mount -o loop, offset=35456 imgraw-vmdk /mnt/mountpoint)



####4. Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema

Primero crearemos las imagenes con quemu:

-quemu-img create -f raw xfs.img 512M
-qemu-img create -f raw btrfs.img 512M

Después podremos convertirlas en sistemas de ficheros en loop:

-sudo losetup -v -f xfs.img
-sudo losetup -v -f btrfs.img
 

Darle formato con:

-mkfs.xfs /dev/loop3
-mkfs.btrfs /dev/loop4

Montarlas:

-mount /dev/loop3 /mnt/loop3/
-mount /dev/loop4 /mnt/loop4/.


Por último creamos el archivo para ver cuanto tarda en copiarse el archivo que tenemos en nuestro sistema en cada loop:


-dd if=/dev/urandom of=archivo bs=100 count=150000


Lo copiamos finalmente a los loop con:

-time -v cp archivo /mnt/loop3/archivo_xfs
-time -v cp archivo /mnt/loop4/archivo_btrfs


####5. Instalar ceph en tu sistema operativo.

Para instalar todo usar:


sudo apt-get install ceph-mds

####6. Crear un dispositivo ceph usando BTRFS o XFS

Primero tendremos que configurarlo con la orden siguiente y rellenar el fichero de configuraración:

mkdir -p /srv/ceph/{osd,mon,mds}

Seguidamente, creamos un sistema loop en xfs  y posteriormente, creamos el directorio del servidor de objetos usando:

mkdir /srv/ceph/osd/osd.0 y el sistema de ficheros de objetos con /sbin/mkcephtfs -a -c /etc/ceph/ceph.conf.

####7. Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados.

Para ello tendremos que crear una piscina para rados:

rados mkpool piscina

Entonces meteremos nuestro fichero en la piscina creada:

rados put -p piscina objeto ejemplo.img

8. No dispongo cuenta Azure
9. No dispongo cuenta Azure
10. No dispongo cuenta Azure
























