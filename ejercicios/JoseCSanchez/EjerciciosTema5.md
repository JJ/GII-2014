# Jose Carlos Sánchez Hurtado

# Ejercicios tema 5

## Ejercicio 1

#### ¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?

#### Buscar ofertas SAN comerciales y comparar su precio con ofertas locales (en el propio ordenador) equivalentes.

En mi ordenador personal en donde estoy realizando los ejercicios de esta asignatura no dispongo de ninguna partición, usando una máquina virtual de ubuntu. 

A continuación muestro el sistema de disco que uso en la máquina virtual ejecutando los siguientes comandos:

`sudo lsblk -fm`

![](http://fotos.subefotos.com/7fe490615db5eef8c6ad5b7e4c56dcbao.png)

`sudo fdisk -l`

![](http://fotos.subefotos.com/dee295129068f36aa202c1c82c295e44o.png)

Para ver los volumenes lógicos, primero instalamos el paquete **sudo apt-get install lvm2**, y luego ejecutamos la orden:

`sudo lvmdiskscan`

![](http://fotos.subefotos.com/779921a29ac7f59bddc5e5f5fee49091o.png)

Como ofertas comerciales, podemos encontrar las siguientes: [Drobo B800i SAN RAID 8 bahías](http://www.macnificos.com/product.aspx?p=7909&gclid=CJ6vyImXucMCFazKtAod10oAsg), [IBM 249824E](http://www.ebay.es/itm/like/391037303855?limghlpsr=true&hlpv=2&ops=true&viphx=1&hlpht=true&lpid=115), entre otras muchas, viendo en general son bastante caras, pero con grandes niveles de eficiencia, sin decir la capacidad de swapping, redundancia, etc de la que disponen.


## Ejercicio 2

#### Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.

Primero, si no tenemos Fuse instalado, lo instalamos en ambas máquinas con las ordenes:

```sh
modprobe fuse
depmod -A
```

Una vez instalado, instalo también en ambas máquinas el **sshfs**,

`sudo apt-get install sshfs`

![](http://fotos.subefotos.com/7d85af6dc1164e6ce9652bd91b10ec1fo.png)

e instalo el servidor ssh:

`sudo apt-get install openssh-server`

Una vez instalado todo, compruebo la dirección ip de la máquina servidora mediante el comando **ifconfig**, y conecto las máquinas con la correspondiente orden.

`Ejemplo: sshf jose@direccionIP:/home/maquina1 /home/maquina2`


## Ejercicio 3

#### Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre.

Primero instalo qemu con el siguiente comando:

`sudo apt-get install qemu-system`

Para crear varias imágenes con varios formatos ejecuto las siguientes ordenes:

*qcow2*

`qemu-img create -f qcow2 fichero-cow.qcow2 5M`

*vdi*

`qemu-img create -f vdi fichero-vdi.vdi 5M`

![](http://fotos.subefotos.com/9e58f4dfc91a402a235d9d03b0496366o.png)

Una vez creado, tendremos que convertirlo a un dispositivo loop,

`sudo losetup -v -f fichero-cow.qcow2`

y ahora podemos por ejemplo formatearlo como si fuera un disco duro normal:

`sudo mkfs.ext4 /dev/loop0`

![](http://fotos.subefotos.com/4b7060200cb8ca42a67c7137beff0ef9o.png)


## Ejercicio 4

#### Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema.

Primero intalamos los paquetes necesarios con la orden:

`sudo apt-get install btrfs-tools xfsprogs`

A continuación creamos las imagenes:

```sh
sudo qemu-img create -f raw  im1.img 200M
sudo qemu-img create -f raw  im2.img 200M
```

![](http://fotos.subefotos.com/b350d5b13d77f3ce351a7aedc5a9be91o.png)

Seguidamente las ponemos en looping y les damos formato:

```sh
sudo losetup -v -f im1.img
sudo losetup -v -f im2.img
sudo mkfs.xfs /dev/loop2
sudo mkfs.btrfs /dev/loop3
```

Y finalmente las montamos:

```sh
sudo mkdir /mnt/m1
sudo mkdir /mnt/m2
sudo mount -t xfs /dev/loop2 /mnt/m1
sudo mount -t xfs /dev/loop3 /mnt/m2
```

![](http://fotos.subefotos.com/513a7f109d44c67f8434b920a5eba6f0o.png)
![](http://fotos.subefotos.com/29f4fd5b003a151df9c7d5e04e3a85e4o.png)


## Ejercicio 5

#### Instalar ceph en tu sistema operativo.

Orden de instalación: `sudo apt-get install ceph-mds`


## Ejercicio 6

#### Crear un dispositivo ceph usando BTRFS o XFS

En primer lugar, creamos los directorios necesarios y el fichero de configuración:

```sh
sudo mkdir -p /srv/ceph/{osd,mon,mds}
sudo nano /etc/ceph/ceph.conf
```

Rellenamos el fichero de la siguiente manera:

![](http://fotos.subefotos.com/99ab266583b39c7779cd2fb80110dc17o.png)

Una vez relleno, creamos las imágenes y los ficheros respectivamente:

```sh
qemu-img create -f raw ceph.img 100M
sudo losetup -v -f ceph.img
sudo mkfs.xfs /dev/loop4
```

```sh
sudo mkdir /srv/ceph/osd/osd.0
sudo /sbin/mkcephfs -a -c /etc/ceph/ceph.conf
```
![](http://fotos.subefotos.com/5d5152556c7c91a333a92cde992ed320o.png)

Por último, iniciamos con 

`sudo /etc/init.d/ceph -a start`

y montamos.

```sh
sudo mkdir /mnt/ceph
sudo mount -t ceph ubuntu:/ /mnt/ceph
```


## Ejercicio 7

#### Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados.

Primero creo un pool:

`sudo rados mkpool mi_pool`

Y añado un fichero a pool:

`sudo rados put -p mi_pool obj obj2