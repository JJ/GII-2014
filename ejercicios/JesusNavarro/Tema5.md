# Virtualización del almacenamiento. 

## Tema 5.

**Ejercicio 1.** 

¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?

Haciendo uso del comando ``sudo lsblk -fm ```

<a href="http://es.tinypic.com?ref=zu45qx" target="_blank"><img src="http://i61.tinypic.com/zu45qx.png" border="0" alt="Image and video hosting by TinyPic"></a>

1.2. Buscar ofertas SAN comerciales y comparar su precio con ofertas locales (en el propio ordenador) equivalentes.

Observamos las opciones que se muestran a continuación:

IBM Storwize V3700 SFF Dual Control. Precio: 3,482.40 euros.

HP P2000 G3 iSCSI MSA 2-cntrl SFF Array. Precio: 5,929.20. euros.

Vemos que se trata de precios elevados, pero hay que tener en cuenta que, a parte del rendimiento, sería complicado montar máquinas con esas configuraciones a modo de ordenador convencional. Sería casi imposible alcanzar las mismas tasas de eficiencia con controladoras convencionales dedicadas en un ordenador común. Otros aspectos a tener en cuenta son la capacidad de refrigeración y expansión, ya que hablamos de Racks con grandes arrays de discos que además permiten hot swapping y redundancia de alimentación en algunos casos.

**Ejercicio 2.**  Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.

**Ejercicio 3.** Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre.

En primer lugar tenemos que instalar herramientas qemu para ello ejecutamos: 

```sudo apt-get install qemu-system ```

Usamos qemu-img: ```qemu-img create -f qcow2 cow.qcow2 10M``` y a continuación montamos el VMDK:
``` sudo losetup -v -f cow.qcow2```

```sudo mkfs.ext4 /dev/loop0```

<a href="http://es.tinypic.com?ref=2ezplrs" target="_blank"><img src="http://i58.tinypic.com/2ezplrs.png" border="0" alt="Image and video hosting by TinyPic"></a>

**Ejercicio 4.** Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema.

Procedemos a instalar las herramientas necesaria para poder llevar a cabo la realización del ejecicio.

```sudo mkfs.ext4 /dev/loop0```

Creamos las imagenes: ```sudo qemu-img create -f raw  a.img 300M```  y ```sudo qemu-img create -f raw  b.img 300M```



**Ejercicio 5.** Instalar ceph en tu sistema operativo.

La instalación se realiza con el comando:

```sudo apt-get install ceph-mds```

**Ejercicio 6.** Crear un dispositivo ceph usando BTRFS o XFS.

Vamos a crear el fichero de configuración /etc/ceph/ceph.conf
```
[global]
log file = /var/log/ceph/$name.log
pid file = /var/run/ceph/$name.pid
[mon]
mon data = /srv/ceph/mon/$name
[mon.mio]
host = ubuntu
mon addr = 127.0.0.1:6789
[mds]
[mds.mio]
host = ubuntu
[osd]
osd data = /srv/ceph/osd/$name
osd journal = /srv/ceph/osd/$name/journal
osd journal size = 1000 ; journal size, in megabytes
[osd.0]
host = ubuntu
devs = /dev/loop4
```

A continuación procedemos con a la creacion del sistema:

```
qemu-img create -f raw ceph.img 100M
sudo losetup -v -f ceph.img
sudo mkfs.xfs /dev/loop4
```

Creación del sistema de ficheros: 

```
sudo mkdir /srv/ceph/osd/osd.0
sudo /sbin/mkcephfs -a -c /etc/ceph/ceph.conf
```

Para finalizar podemos inicializar el servicio con el siguiente comando:
```
sudo /etc/init.d/ceph -a start
```

**Ejercicio 7.** Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados.

Mediante rados:

```sudo rados mkpool pisci```

y añadimos un fichero

```rados put -p pisci obj pruebaIV.txt```

**Ejercicio 8.** Tras crear la cuenta de Azure, instalar las herramientas de línea de órdenes (Command line interface, cli) del mismo y configurarlas con la cuenta Azure correspondiente.

Registro en Azure de Microsoft: 

<a href="http://es.tinypic.com?ref=5bo8ll" target="_blank"><img src="http://i57.tinypic.com/5bo8ll.png" border="0" alt="Image and video hosting by TinyPic"></a>

Una vez finalizado el registro y realiza la verificación por parte de Microsoft, será necesario ejecutar en nuestra máquina el comando ```azure account donwload``` para proceder a enlazar la cuenta, se nos indicará acudir a una dirección para poder obtener un archivo de verificación. Una vez descargado el archivo realizamos la siguiente acción ``` account import nombre_fichero```

<a href="http://es.tinypic.com?ref=2qx8aj9" target="_blank"><img src="http://i60.tinypic.com/2qx8aj9.png" border="0" alt="Image and video hosting by TinyPic"></a>

**Ejercicio 9.** Crear varios contenedores en la cuenta usando la línea de órdenes para ficheros de diferente tipo y almacenar en ellos las imágenes en las que capturéis las pantallas donde se muestre lo que habéis hecho.

Pasos a seguir, en primer lugar he introducido el siguiente comando:

``` azure storage account create jesusnavarro ```
```azure storage account keys list jesusnavarro```

Una vez obtenidas las claves es necesario exportarlas para ello ejecutamos:

```export AZURE_STORAGE_ACCOUNT=jesusnavarro```
```export AZURE_STORAGE_ACCESS_KEY=(clave obtenida)```
<a href="http://es.tinypic.com?ref=w7j1ox" target="_blank"><img src="http://i58.tinypic.com/w7j1ox.png" border="0" alt="Image and video hosting by TinyPic"></a>

Ahora procedemos a la creación de los contenedores: 

``` azure storage container create taper0 -p blob ```
<a href="http://es.tinypic.com?ref=29qk1uq" target="_blank"><img src="http://i60.tinypic.com/29qk1uq.png" border="0" alt="Image and video hosting by TinyPic"></a>

``` azure storage container create taper1 -p blob ```
<a href="http://es.tinypic.com?ref=23wmhvq" target="_blank"><img src="http://i62.tinypic.com/23wmhvq.png" border="0" alt="Image and video hosting by TinyPic"></a>


<a href="http://es.tinypic.com?ref=w7j1ox" target="_blank"><img src="http://i58.tinypic.com/w7j1ox.png" border="0" alt="Image and video hosting by TinyPic"></a>

Para proceder a la subida de un archivo es necesario ejecutar: 

```azure storage blob upload Storage1.png taper1 Storage1.png ```
<a href="http://es.tinypic.com?ref=r1jy4x" target="_blank"><img src="http://i60.tinypic.com/r1jy4x.png" border="0" alt="Image and video hosting by TinyPic"></a>



**Ejercicio 10.** Desde un programa en Ruby o en algún otro lenguaje, listar los blobs que hay en un contenedor, crear un fichero con la lista de los mismos y subirla al propio contenedor.

<a href="http://es.tinypic.com?ref=2hcm4i8" target="_blank"><img src="http://i61.tinypic.com/2hcm4i8.png" border="0" alt="Image and video hosting by TinyPic"></a>
