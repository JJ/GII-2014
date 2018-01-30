
Tema 5
======


Ejercicio 1
-----------

**1. ¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?**

Podemos encontrar las siguientes particiones en el disco duro:
![t5ej1.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t5ej1.png)

- Una partición para el sistema.
- Una partición para Windows.
- Una partición para Fedora(Linux).

Dentro de la partición de Fedora, hay 3 volúmenes:
- Swap
- Home
- Root


Ejercicio 2
-----------

**Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.**

Antes de empezar, necesitamos tener instalado el paquete sshfs.
Para ello, ejecutamos en la maquina virtual ubuntu, el comando:
```bash
sudo apt-get install sshfs
```

Y en la maquina anfitriona fedora, este comando:
```bash
sudo yum install sshfs
```

Una vez instalado, añadimos en la maquina virtual el usuario con el que nos vamos a conectar al grupo de usuarios fuse. En este caso, usaremos el comando:
```bash
sudo usermod -a -G fuse alberto
```

Despues, en la maquina anfitriona, se crea la carpeta que se quiere sincronizar con la maquina virtual, por ejemplo la carpeta iv. 

Una vez creada, pasamos a sincronizarla usando sshfs, introduciendo el siguiente comando:
```bash
sshfs ubuntu@192.168.56.101:/home /home/alberto/Universidad/IV/iv -p 30520
```

En la siguiente captura, podemos ver como se ha creado la carpeta correspondiente:
![t5ej2.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t5ej2.png)


Ejercicio 3
-----------

**Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre**


Primero, instalamos el paquete qemu, que es el que vamos a utilizar:
```bash
sudo apt-get install qemu-system
```

Ahora, creamos algunas imagenes con distintos formatos, como qcow2 y raw, introduciendo los siguientes comandos:
```bash
# qcow2
qemu-img create -f qcow2 img-cow.qcow2 5M

# raw
qemu-img create -f raw img-raw.raw 5M
```
![t5ej3.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t5ej3.png)

Ahora, ponemos una imagen en bucle y le damos formato, usando los siguiente comandos:
```bash
sudo losetup -v -f img-cow.qcow2
sudo mkfs.ext4 /dev/loop0
```
![t5ej3b.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t5ej3b.png)


Ejercicio 4
-----------

**Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema**

Para empezar, creamos dos imagenes con qemu para realizar las pruebas y las ponemos en bucle:
```bash
qemu-img create -f raw img1.raw 50M
qemu-img create -f raw img2.raw 50M

sudo losetup -v -f img1.raw
sudo losetup -v -f img2.raw
```

Despues se les da formato a las imagenes y las montamos:
```bash
sudo mkfs.xfs -f /dev/loop1
sudo mkfs.btrfs -f /dev/loop2

sudo mkdir /mnt/loop1
sudo mkdir /mnt/loop2

sudo mount /dev/loop1 /mnt/loop1
sudo mount /dev/loop2 /mnt/loop2
```

Creamos el fichero:

```bash
sudo dd if=/dev/zero of=/home/ubuntu/40M bs=1MB count=40
```
Despues, copiamos el fichero para ver el tiempo:
```bash
sudo time -v cp 40M /mnt/loop2/40M
sudo time -v cp 40M /mnt/loop3/40M
```

Se puede comprobar que xfs es un poco mas rapido que btrfs.


Ejercicio 5
-----------

**Instalar ceph en tu sistema operativo.**

Para instalar ceph, tan solo hay que ejecutar el comando:

```bash
sudo apt-get install ceph-mds
```


Ejercicio 6
-----------

**Crear un dispositivo ceph usando BTRFS o XFS**

Primero, instalamos los paquetes que vamos a necesitar:
```bash
sudo apt-get install ceph-mds
```

Despues, creamos los directorios que necesitamos y el fichero de configuración:
```bash
mkdir -p /srv/ceph/{osd,mon,mds}

sudo nano /etc/ceph/ceph.conf
```

En el fichero de configuracion introducimos lo siguiente:
```bash
[global]
log file = /var/log/ceph/$name.log
pid file = /var/run/ceph/$name.pid
[mon]
mon data = /srv/ceph/mon/$name
[mon.mio]
host = ubuntu
mon addr = 127.0.0.1:6985
[mds]
[mds.mio]
host = ubuntu
[osd]
osd data = /srv/ceph/osd/$name
osd journal = /srv/ceph/osd/$name/journal
osd journal size = 1000 ; journal size, in megabytes
[osd.0]
host = ubuntu
devs = /dev/loop0
```

Creamos la imagen:
```bash
qemu-img create -f raw img.raw 200M
sudo losetup -v -f img.raw
sudo mkfs.xfs /dev/loop3
```

Despues, creamos el directorio para el sistema de objetos:
```bash
 sudo mkdir /srv/ceph/osd/osd.0
 sudo /sbin/mkcephfs -a -c /etc/ceph/ceph.conf 
 ```

![t5ej6.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t5ej6.png)

Iniciamos el servicio:
```bash
sudo /etc/init.d/ceph -a start
```

Vemos el resultado:
```bash
sudo ceph -s
```
![t5ej6b.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t5ej6b.png)

Finalmente, montamos:
```bash
sudo mkdir /mnt/ceph
sudo mount -t ceph ubuntu:/ /mnt/ceph
```


Ejercicio 7
-----------

**Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados.**

Para este ejercicio, vamos a usar rados para almacer objetos y directorios.

Primero hay que crear pool, introduciendo el comando:
```bash
sudo rados mkpool pool
```

Y añadimos el fichero:
```bash
sudo rados put -p pool obj alberto
```


Ejercicio 8
-----------

**Tras crear la cuenta de Azure, instalar las herramientas de línea de órdenes (Command line interface, cli) del mismo y configurarlas con la cuenta Azure correspondiente.**

Una vez tenemos una cuenta de Azure, en mi caso, una cuenta creada para el proyecto Virtual Vulcano, seguimos la [documentación](http://azure.microsoft.com/en-us/documentation/articles/xplat-cli/) de la pagina oficial de Azure.

Primero, instalamos azure-cli con npm:

```bash
sudo npm install azure-cli -g
```

Descargamos el fichero de configuracion de la cuenta con el siguiente comando:
```bash
azure account download
```

Una vez descargado, usamos este fichero para importar la configuracion
```bash
azure account import "fichero"
```

![t5ej8.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t5ej8.png)

