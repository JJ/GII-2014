#TEMA 5: Virtualización del almacenamiento#

##Ejercicio 2##

#####Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.#####

#####Avanzado Usar los drivers de FUSE para Ruby (aquí explican más o menos como hacerlo con fusefs para mostrar el contenido de una estructura de datos en un lenguaje como si fuera un fichero. Este es un ejemplo en Python.#####

Antes de empezar con la instalación, es importante saber si tenemos cargado "fuse". Para saberlo, ejecutamos

```shell
lsmod | grep fuse
```

Si el comando nos devuelve algo tipo "fuse 81531 2", tendremos el módulo cargado y podremos continuar. En caso contrario, deberemos ejecutar, tanto en la máquina que hará de cliente como en la servidora, los siguientes comandos:

```shell
modprobe fuse
depmod -A
```

Ahora, instalamos en las dos máquinas, sshfs.

```shell
sudo apt-get install sshfs
```

En la máquina cliente, creamos una carpeta donde vayamos a montar la carpeta remota y ejecutamos:

```shell
sshfs [usuario remoto]]@[IP remota]]:[carpeta remota a montar] [punto de montaje]
```

Si hay problemas de conexión, hay que asegurarse que la IP de la máquina remota sea la correcta (mediante el comando ``ifconfig`` en la máquina remota y ``ping [IP remota]``para comprobar que hay conexión). Una vez comprobado esto, podemos intentar conectar por SSH a la máquina remota (comprobando que tengamos instalado openssh server, ``sudo apt-get install openssh-server`` y editando el fichero /etc/ssh/sshd_config para que el puerto quede configurado como el 22 y se permita acceder con el usuario deseado).

Una vez tengamos hecho esto, los cambios que hagamos en local (o en remoto), se verán reflejados en la otra máquina.


##Ejercicio 3##

#####Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre#####

En primer lugar, es necesario instalar quemu:

```shell
sudo apt-get install qemu-system
```

Creación y montaje de un almacenamiento virtual:

```shell
sudo qemu-img create -f qcow2 cow.qcow2 5M
sudo losetup -v -f cow.qcow2
sudo mkfs.ext4 /dev/loop0
```

Una utilidad puede ser, para gestionar los recursos de almacenamiento de distintas máquinas virtuales que tengamos en nuestro sistema.


##Ejercicio 4##

#####Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema#####

Antes de nada, hay que instalar lo siguiente:

```shell
sudo apt-get install btrfs-tools xfsprogs
```

Lo primero es crear las imágenes:

```shell
sudo qemu-img create -f raw  a.img 200M
sudo qemu-img create -f raw  b.img 200M
```

Después se ponen en loop y se les da formato

```shell
sudo losetup -v -f a.img
sudo losetup -v -f b.img
sudo mkfs.xfs /dev/loop2
sudo mkfs.btrfs /dev/loop3
```

Creamos el punto de montaje y las montamos:

```shell
sudo mkdir mnt/m1
sudo mkdir mnt/m2
sudo mount -t xfs /dev/loop2 /mnt/m1
sudo mount -t xfs /dev/loop3 /mnt/m2
```

Y se copia un fichero que sea bastante grande. Yo he copiado un ejecutable:

```shell
sudo time -v cp p1 /mnt/m1/p1
sudo time -v cp p1 /mnt/m2/p1
```

El primero ha tenido un system time de 0.53 segundos. El segundo, de 0.57 segundos.


##Ejercicio 5##

#####Instalar ceph en tu sistema operativo.#####

Solo hay que ejecutar: 

```shell
sudo apt-get install ceph-mds
```


##Ejercicio 6##

#####Crear un dispositivo ceph usando BTRFS o XFS#####
#####Avanzado: Usar varios dispositivos en un nodo para distribuir la carga.#####

Se crean los directorios

```shell
sudo mkdir -p /srv/ceph/{osd,mon,mds}
```

Se crea el fichero de configuración /etc/ceph/ceph.conf

```shell
[global]
log file = /var/log/ceph/$name.log
pid file = /var/run/ceph/$name.pid
[mon]
mon data = /srv/ceph/mon/$name
[mon.mio]
host = toranzo
mon addr = 127.0.0.1:6789
[mds]
[mds.mio]
host = toranzo
[osd]
osd data = /srv/ceph/osd/$name
osd journal = /srv/ceph/osd/$name/journal
osd journal size = 1000 ; journal size, in megabytes
[osd.0]
host = toranzo
devs = /dev/loop4
```

Creamos el sistema:

```shell
qemu-img create -f raw ceph.img 100M
sudo losetup -v -f ceph.img
sudo mkfs.xfs /dev/loop4
```

Creamos un directorio y el sistema de ficheros:

```shell
sudo mkdir /srv/ceph/osd/osd.0
sudo /sbin/mkcephfs -a -c /etc/ceph/ceph.conf
```

Iniciamos el servicio

```shell
sudo /etc/init.d/ceph -a start
```

Creamos el directorio donde queramos montar y montamos:

```shell
sudo mkdir /mnt/ceph
sudo mount -t ceph iblancasaPC:/ /mnt/ceph
```


##Ejercicio 7##

#####Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados.#####

######Con rados######

Creamos un pool:

```shell
sudo rados mkpool pisci
```

y añadimos un fichero

```shell
rados put -p pisci obj toranzo.txt
```


##Ejercicio 8##

#####Tras crear la cuenta de Azure, instalar las herramientas de línea de órdenes (Command line interface, cli) del mismo y configurarlas con la cuenta Azure correspondiente#####

Tras solicitar la cuenta de prueba, que llegue el mail de confirmación y se active la cuenta, ejecutamos (en nuestro terminal):

```shell
sudo npm install azure-cli -g
``

Después, deberemos "linkear" con nuestra cuenta de Azure. Para ello, ejecutamos:

```shell
azure account download
``

Se nos indicará una URL. Cuando la abramos, se descargará un fichero. Importamos este fichero usando:

```shell
azure account import [fichero]
``` 
Y lo borramos para mayor seguridad. Si no hay ningún mensaje de error, ya tendremos nuestra cuenta enlazada.


##Ejercicio 9##

#####Crear varios contenedores en la cuenta usando la línea de órdenes para ficheros de diferente tipo y almacenar en ellos las imágenes en las que capturéis las pantallas donde se muestre lo que habéis hecho.#####

He ido introduciendo los siguientes comandos:

```shell
azure storage account create toranzo
azure storage account keys list toranzo
```

Al final del fichero ".bashrc", insertarmos:

```shell
export AZURE_STORAGE_ACCOUNT=toranzo
export AZURE_STORAGE_ACCESS_KEY=CLAVE
```

para poder acceder sin tener que exportar las variables de entorno cada vez que vayamos a hacer algo. Tendremos que ejecutar ``source .bashrc`` para tomar esas variables en la terminal actual.

Ahora podemos crear los distintos contenedores:

```shell
azure storage container create taper -p blob
azure storage container create taper2 -p blob
azure storage container create taper3 -p blob
```

Finalmente, subir un fichero será tan sencillo como:

```shell
azure storage blob upload [fichero origen] [contenedor] [fichero destino]
```


##Ejercicio 10##

#####Desde un programa en Ruby o en algún otro lenguaje, listar los blobs que hay en un contenedor, crear un fichero con la lista de los mismos y subirla al propio contenedor. Muy meta todo.#####

```shell
#!/usr/bin/ruby

require "azure"

azure_blob_service = Azure::BlobService.new
contenedores = azure_blob_service.list_containers()

contenedores.each do |contenedor|
  File.open("lista", "w") do |lista|
    lista.puts contenedor.name + " "
    blobs = azure_blob_service.list_blobs(contenedor.name)
    blobs.each do |blob|
      lista.puts blob.name + " "
    end
  end
  text = File.open("lista", "rb") { |file| file.read }
  blob = azure_blob_service.create_block_blob(contenedor.name, "lista", text)
end
```
