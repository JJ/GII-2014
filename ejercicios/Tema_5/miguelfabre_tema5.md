#Virtualización del almacenamiento

##Ejercicio 1

**1.¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?**

Tengo dividido mi disco duro en 3 particiones, una con Ubuntu, otra con Windows 7 y otra que utiliza ésta última para almacenar archivos del sistema.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_5/imagenes/ejercicio1-1.png)

**2.Si tienes acceso en tu escuela o facultad a un ordenador común para las prácticas, ¿qué almacenamiento físico utiliza?**

No lo he podido consultar.

**3.Buscar ofertas SAN comerciales y comparar su precio con ofertas locales (en el propio ordenador) equivalentes.**

Aquí podemos ver algunas ofertas de diferentes SAN:

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_5/imagenes/ejercicio1-2.png)


##Ejercicio 2

**Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.**

En primer lugar comprobamos que tenemos FUSE en las dos máquinas:

```lsmod | grep fuse```

Y ejecutamos:

```modprobe fuse```
```depmod -A```

Ahora instalamos sshfs:

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_5/imagenes/ejercicio2-1.png)

Creamos en cada máquina una carpeta que será las que se van a compartir:

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_5/imagenes/ejercicio2-2.png)

Ejecutamos el comando sshfs en una de las máquinas para realizar la conexión entre las dos carpetas:

```sshfs <usuario>@<ip>:/path/de/la/carpeta1 /path/de/la/carpeta2```

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_5/imagenes/ejercicio2-3.png)

Vemos como funciona a la perfección:

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_5/imagenes/ejercicio2-4.png)

##Ejercicio 3

**Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre**

Instalamos qemu:

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_5/imagenes/ejercicio3-1.png)

Ahora, creamos el fichero qcow2 tal como se indica en el guión de la práctica:

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_5/imagenes/ejercicio3-2.png)

Por último, montamos el fichero creado:

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_5/imagenes/ejercicio3-3.png)

##Ejercicio 4

**Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema**

En primer lugar instalamos las herramientas xfs y btrfs:

```sudo apt-get install xfsprogs```
```sudo apt-get install btrfs-tools```

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_5/imagenes/ejercicio4-1.png)

Creamos con qemu las dos imagenes xfs y btrfs:

```sudo qemu-img create -f raw  img-one.img 300M```
```sudo qemu-img create -f raw  img-two.img 300M```
```sudo losetup -v -f imag-one.img```
```sudo losetup -v -f imag-two.img```
```sudo mkfs.xfs /dev/loop0```
```sudo mkfs.xfs /dev/loop1```

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_5/imagenes/ejercicio4-2.png)

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_5/imagenes/ejercicio4-3.png)

Ahora, montamos cada imagen:

```sudo mkdir mnt/img-one```
```sudo mkdir mnt/img-two```
```sudo mount -t xfs /dev/loop0 /mnt/img-one/```
```sudo mount -t xfs /dev/loop0 /mnt/img-two/```

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_5/imagenes/ejercicio4-4.png)

Una vez las imágenes están montadas, vamos a transferir un fichero cualquiera y ver la diferencia de tiempos.

```sudo time -v cp jailkit-2.17.tar.gz /mnt/img-one/```
```sudo time -v cp jailkit-2.17.tar.gz /mnt/img-two/```

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_5/imagenes/ejercicio4-5.png)

Como podemos ver, el btrfs es más rápido.

##Ejercicio 5

**Instalar ceph en tu sistema operativo.**

Procedemos de forma habitual:

```sudo apt-get install ceph-mds```

##Ejercicio 6

**Crear un dispositivo ceph usando BTRFS o XFS**

En primer lugar, creamos los directorios que usaremos:

```sudo mkdir -p /srv/ceph/{osd,mon,mds}```

Creamos el archivo de configuración .conf

```sudo nano /etc/ceph/ceph.conf```

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_5/imagenes/ejercicio6-1.png)

Como vemos, vamos a usar un dispositivo loop con formato xfs que ya hemos creado previamente (img-one.img). 

Ahora, creamos una carpeta para el servidor de objetos y el sistema de ficheros de objetos.

```sudo mkdir /srv/ceph/osd/osd.0```
```sudo /sbin/mkcephfs -a -c /etc/ceph/ceph.conf```

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_5/imagenes/ejercicio6-2.png)

Por último, iniciamos el servicio.

```sudo /etc/init.d/ceph -a start```


##Ejercicio 7

**Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados.**

Haciendo uso de las órdenes dadas en el guión de la práctica, creamos un pool:

```sudo rados mkpool my-pool```

Una vez creado, ya podemos añadir el archivo que se desee:

```sudo rados put -p my-pool obj fichero```

##Ejercicio 8

**Tras crear la cuenta de Azure, instalar las herramientas de línea de órdenes (Command line interface, cli) del mismo y configurarlas con la cuenta Azure correspondiente**

Dado que no poseo cuenta de Azure ni creo conveniente dar mis datos bancarios para ello , y no poseo código promocional, explicaré de forma teórica lo comandos a usar.

Con la cuenta de Azure ya disponible, ejecutamos:

```sudo npm install azure-cli -g```

Después, ejecutamos:

```azure account download```

Por último, accedemos a la url que se nos proporciona, se nos decargará un fichero y lo importamos con la orden que se nos indica:

```azure account import <file>```












