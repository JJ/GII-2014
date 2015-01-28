
Virtualización del almacenamiento
====================================================================

Ejercicio 1
-----------

**¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?**

**Si tienes acceso en tu escuela o facultad a un ordenador común para las prácticas, ¿qué almacenamiento físico utiliza?**

En mi disco duro tengo las siguientes particiones:
![EJ1_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t5/EJ1_1.png)

- Una partición para boot.
- Una para Windows.
- Una partición para Fedora.

Para Fedora tengo tres volumenes logicos:
- swap.
- root.
- home.

**Buscar ofertas SAN comerciales y comparar su precio con ofertas locales (en el propio ordenador) equivalentes.**

[SAN iSCSI PowerVault serie MD3 de 1 GB MD3260i](http://www.dell.com/es/empresas/p/powervault-md3200i/pd)
- Precio de 8.364 €.
- Permite hasta 60 unidades SSD de 3,5" de hasta 4 TB cada una.
- 8 puertos 1Gbps.
- 2 GB de caché.
- Usa protocolo iSCSI.
- Con la posibilidad de intercambio en caliente.

[SAN D-Link DSN-1100-10](http://www.audiotronics.es/product.aspx?productid=91108)
- Precio de 1.525,26 €.
- Admite 5 discos duros SATA/SATA-II de 3,5".
- 4 puertos 1Gbps.
- Usa protocolo iSCSI.
- Con la posibilidad de intercambio en caliente.
- 1 GB de caché.


-----

Ejercicio 2
-----------

**Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.**

Como no tengo instalado sshfs, lo instalo en el anfitrion y en la máquina virtual.
Para poder conectarme con la máquina servidora, necesito saber su ip, usando ifconfig en la anfitriona saco la ip:
![EJ2_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t5/EJ2_1.png)

Me conecto a la máquina virtual e instalo con:
```bash
sudo apt-get install sshfs
```
Para la máquina anfitriona fedora instalo con:
```bash
sudo yum install sshfs
```
Tras instalarlo, en la máquina virtual voy a añadir al grupo de usuario **fuse** el nombre de usuario con el que me voy a conectar remotamente.
En mi caso:
```bash
sudo usermod -a -G fuse santiago
```
Ahora en mi máquina anfitriona, creo una carpeta test que se sincronizará con la virtual.
Tras esto paso a usar sshfs, en mi caso:
```bash
sshfs santiago@172.17.42.1:/home /home/administrador/projects/test -p 49153
```
Captura de pantalla que muestra como se a montado la carpeta test
![EJ2_2.png](https://dl.dropboxusercontent.com/u/22433100/IV/t5/EJ2_2.png)


-----

Ejercicio 3
-----------

**Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre.**

He instalado qemu con el siguiente comando:
```bash
sudo apt-get install qemu-system
```

Voy a crear varias imágenes con varios formatos, para ello uso los siguientes comandos:
```bash
# qcow2
qemu-img create -f qcow2 fichero-cow.qcow2 5M

# raw
qemu-img create -f raw fichero-raw.raw 5M

# vdi
qemu-img create -f vdi fichero-vdi.vdi 5M
```
![3_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t5/3_1.png)

Ahora podré la imagen qcow2 en bucle y le daré formato con los siguientes comandos:
```bash
sudo losetup -v -f fichero-cow.qcow2
sudo mkfs.ext4 /dev/loop0
```
![3_2.png](https://dl.dropboxusercontent.com/u/22433100/IV/t5/3_2.png)


-----

Ejercicio 4
-----------

**Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema.**

Lo primero que voy a hacer es generar las imagenes con qemu y ponerlas en bucle:

```bash
# Genero dos imagenes de 50M cada una.
qemu-img create -f raw 1.img 50M
qemu-img create -f raw 2.img 50M

# Pongo las imagenes en bucle.
sudo losetup -v -f 1.img
sudo losetup -v -f 2.img

# Les doy formato y las monto
```bash
sudo mkfs.xfs -f /dev/loop2
sudo mkfs.btrfs -f /dev/loop3

sudo mkdir /mnt/loop2
sudo mkdir /mnt/loop3

sudo mount /dev/loop2 /mnt/loop2
sudo mount /dev/loop3 /mnt/loop3
```
![4_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t5/4_1.png)
![4_2.png](https://dl.dropboxusercontent.com/u/22433100/IV/t5/4_2.png)
![4_3.png](https://dl.dropboxusercontent.com/u/22433100/IV/t5/4_3.png)
Creo un fichero de 40MB y compruebo que tarda en copiar el fichero en cada uno.

```bash
# Crear fichero
sudo dd if=/dev/zero of=/home/santiago/40M bs=1MB count=40

# Copiar el fichero
sudo time -v cp 40M /mnt/loop2/40M
sudo time -v cp 40M /mnt/loop3/40M

```
Como se puede ver en las siguientes capturas xfs es un poco más rápido que btrfs.
![4_4.png](https://dl.dropboxusercontent.com/u/22433100/IV/t5/4_4.png)
![4_5.png](https://dl.dropboxusercontent.com/u/22433100/IV/t5/4_5.png)


-----

Ejercicio 5
-----------

**Instalar ceph en tu sistema operativo.**

Para instalarlo he usado el siguiente comando:
```bash
sudo apt-get install ceph-mds
```


-----

Ejercicio 6
-----------

**Crear un dispositivo ceph usando BTRFS o XFS.**

Voy a seguir los pasos que indica el [guión](http://jj.github.io/IV/documentos/temas/Almacenamiento) de teoria.
Lo primero  que voy a hacer es instalar los paquetes que voy a necesitar:
```bash
sudo apt-get install ceph-mds
```
Ahora creo los directorios necesarios y el fichero de configuración:
```bash
# Crea directorios.
mkdir -p /srv/ceph/{osd,mon,mds}

# Genero el fichero de configuración en /etc/ceph/ceph.conf
sudo nano /etc/ceph/ceph.conf
```
Añado lo siguiente al fichero de configuración:
```bash
[global]
log file = /var/log/ceph/$name.log
pid file = /var/run/ceph/$name.pid
[mon]
mon data = /srv/ceph/mon/$name
[mon.mio]
host = santiago-PC
mon addr = 127.0.0.1:6789
[mds]
[mds.mio]
host = santiago-PC
[osd]
osd data = /srv/ceph/osd/$name
osd journal = /srv/ceph/osd/$name/journal
osd journal size = 1000 ; journal size, in megabytes
[osd.0]
host = santiago-PC
devs = /dev/loop0
```
Creo la imagen:
```bash
qemu-img create -f raw ceph.img 200M
sudo losetup -v -f ceph.img
sudo mkfs.xfs /dev/loop0
```
Y el directorio para usar el sistema de objetos:
```bash
 sudo mkdir /srv/ceph/osd/osd.0
 sudo /sbin/mkcephfs -a -c /etc/ceph/ceph.conf 
 ```
![6_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t5/6_1.png)
Ahora inicio el servicio con:
```bash
sudo /etc/init.d/ceph -a start

# Compruebo como ha ido.
sudo ceph -s
```
![6_2.png](https://dl.dropboxusercontent.com/u/22433100/IV/t5/6_2.png)
Ahora ya puedo montar:
```bash
sudo mkdir /mnt/ceph
sudo mount -t ceph santiago-PC:/ /mnt/ceph
```


-----

Ejercicio 7
-----------

**Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados.**

Usando rados.

Primero creo pool:
```bash
sudo rados mkpool pool
```
Añado el fichero a pool:
```bash
sudo rados put -p pool obj Santi
```


-----

Ejercicio 8
-----------

**Tras crear la cuenta de Azure, instalar las herramientas de línea de órdenes (Command line interface, cli) del mismo y configurarlas con la cuenta Azure correspondiente.**

Para la realización de este ejercicio, voy a usar la cuenta de prueba de Azure que pedimos para el proyecto [Virtual Vulcano](https://github.com/ernestoalejo/virtual-vulcano) y voy a seguir la [documentación](http://azure.microsoft.com/en-us/documentation/articles/xplat-cli/) de la pagina oficial para la configuración.
```bash
# Instalo con npm el azure-cli: 
sudo npm install azure-cli -g

# Descargo el fichero de configuración
azure account download

# Ahora importo la configuracion
azure account import [Fichero descargado con azure account import]
```
![8_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t5/8_1.png)


-----

Ejercicio 9
-----------

**Crear varios contenedores en la cuenta usando la línea de órdenes para ficheros de diferente tipo y almacenar en ellos las imágenes en las que capturéis las pantallas donde se muestre lo que habéis hecho.**

Creo una cuenta de almacenamiento y obtengo las claves:
```bash
# Cuenta de almacenamiento
azure storage account create santi

# Lista las claves de la cuenta una primaria y una secundaria.
azure storage account keys list santi
```
Estas claves se pueden copiar en las variables de entorno en .bashrc:
```bash
export AZURE_STORAGE_ACCOUNT=santi
export  AZURE_STORAGE_ACCESS_KEY=key
```
Ahora creo los contenedores:
```bash
azure storage container create taper1 -p blob
azure storage container create taper2 -p blob
```
![9_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t5/9_1.png)
Ahora subo las capturas con el siguiente comando:
```bash
azure storage blob upload 9_1.jpg taper1 9_1.jpg
```
[Link a la captura](https://portalvhds015v8zkvtv47g.blob.core.windows.net/taper1/9_1.png)
