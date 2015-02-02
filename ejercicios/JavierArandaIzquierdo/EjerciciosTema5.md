#Tema 5
###Ejercicio 1
#####1. ¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?

Para ver la configuracion de mi disco duro he utilizado el comando:
	
 ``` bash
 sudo lsblk -fm
 ```
 ![1](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/tema5-1.png)

#####2. Si tienes acceso en tu escuela o facultad a un ordenador común para las prácticas, ¿qué almacenamiento físico utiliza?

Utiliza la particion U

#####3. Buscar ofertas SAN comerciales y comparar su precio con ofertas locales (en el propio ordenador) equivalentes.

La comparacion es la siguiente: 

[AM866B HP 8/8 Base (0) e-port SAN Switch](http://www.senetic.es/product/AM866B?gclid=CjwKEAiAi52mBRDkq5bX0vq1-RQSJAAq_7IGEvUX7fVBH0xfzvDw8xK5cqGhJoz3noK0Dy-eVPTLPBoC-ZPw_wcB)

- Precio: 2007,05 €
- 8 puertos SFP
- Puerto consola RS-232
- Tecnologia de cableado ethernt de cobre 100BASE-T
- 1 puerto fastEthernet
- 8 Gbits/s de capacidad de computacion
- Montaje Rack

[AP881A HP StorageWorks D2200sb PCIe and P4000 VSA Bundle with Smart Array Adv Pk LTU](http://www.senetic.es/product/AP881A)

- Precio: 4284,00 €
- 12 unidades de almacenamiento compatibles
- 10,8 TB de capacidad maxima de almacenamiento permitida
- Interfaz de unidad de almacenamiento

###Ejercicio 2

#####Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.

Instalamos en las dos maquinas sshfs

 ``` bash
 sudo apt-get install sshfs
 ```
 Creamos una carpeta en la maquina del cliente donde montamos la carpeta remota y ejecutamos:
 
  ``` bash
 sshfs usuario@IP_remota:carpeta_remota punto_montaje
 
 sshfs javi@192.168.56.101:/home/javi/NuevaCarpeta /home/javi/capetaIV
 ```
###Ejercicio 3
#####Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre

Primero instalamos qemu:

``` bash
sudo apt-get install qemu-system
```
Tras esto, creamos y montamos el almacenamiento virtual:

``` bash
sudo qemu-img create -f qcow2 cow.qcow2 5M
sudo losetup -v -f cow.qcow2
sudo mkfs.ext4 /dev/loop0
```
 ![1](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/2Tema5.png)
 
###Ejercicio 4 
#####Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema

Previamente instalamos las herramientas necesarias:

``` bash
sudo apt-get install btrfs-tools xfsprogs
```

Creamos las imagenes:
```bash
sudo qemu-img create -f raw  a.img 150M
sudo qemu-img create -f raw  b.img 150M
```
Formateamos las imagenes:
```bash
sudo losetup -v -f a.img
sudo losetup -v -f b.img
sudo mkfs.xfs /dev/loop1
sudo mkfs.btrfs /dev/loop2
```
Tras esto, los montamos:
```bash
sudo mkdir mnt/m1
sudo mkdir mnt/m2
sudo mount -t xfs /dev/loop1 /mnt/m1
sudo mount -t xfs /dev/loop2 /mnt/m2
```
Ahora copiamos un fichero a cada imagen con:

sudo time -v cp fichero /mnt/m1/fichero
sudo time -v cp fichero /mnt/m2/fichero

###Ejercicio 5
#####Instalar ceph en tu sistema operativo.
Para instalar ceph ejecutamos la siguiente orden:
```bash
sudo apt-get install ceph-mds
```
###Ejercicio 6
#####Crear un dispositivo ceph usando BTRFS o XFS

#####Avanzado Usar varios dispositivos en un nodo para distribuir la carga.

Primeramente creamos los directorios:
```bash
sudo mkdir -p /srv/ceph/{osd,mon,mds}
```
Creamos el fichero de configuracion:
```bash
[global]
log file = /var/log/ceph/$name.log
pid file = /var/run/ceph/$name.pid
[mon]
mon data = /srv/ceph/mon/$name
[mon.mio]
host = javi
mon addr = 127.0.0.1:6789
[mds]
[mds.mio]
host = javi
[osd]
osd data = /srv/ceph/osd/$name
osd journal = /srv/ceph/osd/$name/journal
osd journal size = 1000 ; journal size, in megabytes
[osd.0]
host = javi
devs = /dev/loop4
```
Creamos el sistema de archivos:
```bash
qemu-img create -f raw ceph.img 150M
sudo losetup -v -f ceph.img
sudo mkfs.xfs /dev/loop4
```
Se crea el sistema de archivos:
```bash
sudo /sbin/mkcephfs -a -c /etc/ceph/ceph.conf
```
Ahora iniciamos el servicio:
```bash
sudo /etc/init.d/ceph -a start
```
Y montamos:
```bash
sudo mkdir /mnt/ceph sudo mount -t ceph javi:/ /mnt/ceph
```

###Ejercicio 7
#####Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados.

Primero creamos un pool:
```bash
sudo rados mkpool poool
```
Añadimos un fichero:
```bash
rados put -p poool obj archivo.txt
```

#####Finalmente, puedo hacer estos ultimos ejercicios porque [Angel](https://github.com/angeljcc) me ha cedido una de las maquinas que tiene en su cuenta de Azure!


###Ejercicio 8
Primero nos hara falta instalar npm:
```bash
sudo apt-get install npm
```
Tras esto, ejecutamos:
```bash 
sudo npm install azure-cli -g
```
Tras esto, conectamos con nuestra cuenta de Azure:
```bash
azure account download
```
Tras dar mil vueltas para que funcionara el comando anterior, entramos en el link nos dicen y descargamos el fichero. Cuando este descargado, importamos el fichero:
```bash
azure accont import "fichero"
```

###Ejercicio 9
#####Crear varios contenedores en la cuenta usando la línea de órdenes para ficheros de diferente tipo y almacenar en ellos las imágenes en las que capturéis las pantallas donde se muestre lo que habéis hecho.
