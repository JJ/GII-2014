#Ejercicio 1#
##¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?##

Actualmente y desde hace ya mucho tiempo en mi disco duro solamente tengo una partición **ext4** donde tengo instalado *Linux*.

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-1.png">

Como podemos observar en la imagen anterior tenemos *sda1* con formato ext4 donde está instalado Ubuntu; *sda2* que tiene que ver con el arranque del sistema; y por último, *sda5* que es la partición de intercambio(swap).

##Si tienes acceso en tu escuela o facultad a un ordenador común para las prácticas, ¿qué almacenamiento físico utiliza?##

No he tenido acceso durante la realización de est ejercicio.

##Buscar ofertas SAN comerciales y comparar su precio con ofertas locales (en el propio ordenador) equivalentes.##

[Drobo SAN for Business B1200i Orden unidad de disco duro - Compartimentos: 12 - 12.6 TB](http://www.lambda-tek.com/Drobo-DR-B1200I-1A31~shES/B1173753&viewSpec=y#productTop)

+ **Precio:** 3188.35€
+ **Tipos de unidades de almacenamiento admitidas:** HDD, SSD
+ **Número de unidades de almacenamiento compatibles:** Número de unidades de almacenamiento compatibles
+ **Interfaz de unidad de almacenamiento:** SATA, Serial ATA II, Serial ATA III, Serial Attached SCSI.
+ **Sistemas de archivos soportados:** ext3, HFS+, NTFS, VMFS
+ **Sistemas soportados:** Linux, Windows y MAC.

[C8R17A HP 2040 SAN DC SAS SFF 21.6TB Bundle](http://www.senetic.es/product/C8R17A gclid=Cj0KEQiAiuOlBRCU-8D6idaPz_UBEiQAzTagNG6RjYDmKip32Il20VKXr15-Xzi8DOCvrMVBZn0LdQ4aAvIf8P8HAQ)

+ **Precio:** 20 189,46 €.
+ **Tipo de unidades de almacenamiento instaladas:** HDD  
+ **Capacidad total de almacenamiento instalada:** 21600  GB
+ **Tipos de unidades de almacenamiento admitidas:** HDD, SSD  
+ **Interfaz de unidad de almacenamiento:** Serial Attached SCSI  
+ **Capacidad de la unidad de almacenamiento:** 900  GB
+ **Sistemas soportados:** Linux y Windows 

[Drobo B800i SAN RAID 8 bahías](http://www.macnificos.com/product.aspx?p=7909&gclid=Cj0KEQiAiuOlBRCU-8D6idaPz_UBEiQAzTagNPm6Rr2YsZwY8o3oYTLrXlRNw9ahR_kTrqYECmRXH8QaAtqm8P8HAQ)

+ **Precio:** 1.229,00 €
+ 8 bahías para discos SATA II y III de 3,5"
+ 2 puertos Ehternet 10/100/1000 MBps
+ 1 puerto USB 2.0 (sólo para configuración inicial)
+ Protocolos de Red iSCSI, Autenticación CHAP
+ **Sistemas soportados:** Mac y Windows

[IBM Storwize V3700 SFF Dual Control Enclosure](http://www.misco.co.uk/product/205412/IBM-Storwize-V3700-SFF-Dual-Control-Enclosure?selectedTabIndex=2&tabBarViewName=ProductTechnicalSpecifications&page=1&#tabs)

+ **Precio:** 3.651,9€
+ **Expansión:** 24 (total) / 24 (free) - 2.5" - hot-swap
+ Max Supported Capacity 24 TB
+ HDD Array External Interface iSCSI

#Ejercicio 2#
##Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.##

Vamos a proceder a acceder a recursos remotos como si fueran ficheros locales desde mi máquina anfitrión a una máquina virtual.

Lo primero que tendremos que hacer es instalar *sshfs* en ambas máquinas. Para ello, ejecutaremos la siguiente orden:

<code>sudo apt-get install sshfs</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-2.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-3.png">

Una vez instalado *sshfs* en ambas máquinas, pasaremos a crear en la máquina cliente una carpeta donde vayamos a montar la carpeta remota. Para ello, vamos a ejecutar el siguiente comando:

<code>sshfs javi@192.168.56.101:/home/javi/carpetaMontaje /home/javi/IV/</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-4.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-6.png">

Como podemos ver, la conexión y el montaje se ha realizado correctamente. Ya cualquier cambio que llevemos a cabo en cualquiera de los lados se verá reflejado en el otro.

Para hacer la prueba crearé una carpeta y comprobaremos que se ha creado también en el otro lugar.

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-7.png">

#Ejercicio 3#
##Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre.##

Vamos a proceder a instalar **quemu** en primer lugar. Para ello, vamos a ejecutar el comando siguiente:

<code>sudo apt-get install qemu-system</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-8.png">

Ahora vamos a proceder a crear y montar un almacenamiento virtual. Para ello, vamos a ejecutar en primer lugar lo siguiente:

<code>sudo qemu-img create -f qcow2 cow.qcow2 5M</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-10.png">

Ahora vamos a montarlo:

<code>sudo losetup -v -f cow.qcow2</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-11.png">

Y seguidamente ejecutaremos lo siguiente:

<code>sudo mkfs.ext4 /dev/loop0</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-12.png">

Este proceso lo podemos realizar con otras imágenes. QUEMU soporta distintos tipos de imágenes:

+ raw: qemu-img create -f raw imagen-raw.img 100M
+ vmdk: qemu-img create -f vmdk imagen-vmdk.vmdk 100M
+ vdi: qemu-img create -f vdi imagen-vdi.vdi 100M

Vamos a probarlo también con el VMDK tal y como dice el ejercicio. Los pasos a seguir son exactamente los mismos:

<code>sudo qemu-img create -f vmdk imagen-vmdk.vmdk 100M</code>
<code>sudo losetup -v -f imagen-vmdk.vmdk</code>
<code>sudo mkfs.ext4 /dev/loop0</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-13.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-14.png">

#Ejercicio 4#
##Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema.##

Para comenzar a realizar este ejercicio tendremos que instalar previamente algunas herramientas. Para ello vamos a ejecutar el siguiente comando:

<code>sudo apt-get install btrfs-tools xfsprogs</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-15.png">

Una vez que ya tenemos las herramientas necesarias, vamos a empezar a crear los sistemas de ficheros en bucle. En primer lugar, crearemos los archivos de imagen:

<code>qemu-img create -f raw btrfs.img 256M</code>

<code>qemu-img create -f raw xfs.img 256M</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-16.png">

Una vez creados, vamos a hacer lo siguiente:

<code>sudo losetup -v -f btrfs.img</code>

<code>sudo losetup -v -f xfs.img</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-17.png">

A continuación, les daremos formato:

<code>sudo mkfs.btrfs /dev/loop4</code>

<code>sudo mkfs.xfs /dev/loop5</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-18.png">

Ahora vamos a crear las carpetas donde realizaremos los montajes:

<code>sudo mkdir /mnt/prueba1</code>

<code>sudo mkdir /mnt/prueba2</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-19.png">

Seguidamente, los montamos:

<code>sudo mount /dev/loop4 /mnt/prueba1/</code>

<code>sudo mount /dev/loop5 /mnt/prueba2</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-20.png">

Con todos estos pasos ya estará todo creado y montado. Ahora vamos a proceder a comparar las prestaciones.

Para ello voy copiar un instalador en cada carpeta y a comprobar los resultados. Ejecutaré los siguientes comandos:

<code>sudo time -v cp /home/javi/xampp-linux-5.5.19-0-installer.run /mnt/prueba1/</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-21.png">

<code>sudo time -v cp /home/javi/xampp-linux-5.5.19-0-installer.run /mnt/prueba2/</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-22.png">

Podemos observar que con *BTRFS* se consume más del doble de tiempo que con *XFS*.

#Ejercico 5#
##Instalar ceph en tu sistema operativo.##

Vamos a proceder a instalar *ceph* en nuestro sistema. Para hacer dicha tarea, solamente deberemos ejecutar el siguiente comando:

<code>sudo apt-get install ceph-mds</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-23.png">

#Ejercicio 6#
##Crear un dispositivo ceph usando BTRFS o XFS.##

Una vez que hemos instalado *Ceph* en el ejercicio anterior vamos a proceder a crear un dispositivo.

Lo primero que deberemos hacer es crear los directorios necesarios:

<code>sudo mkdir -p /srv/ceph/{osd,mon,mds}</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-24.png">

Seguidamente crearemos el fichero de configuración */etc/ceph/ceph.conf* e incluiremos lo siguiente:

<code>sudo gedit /etc/ceph/ceph.conf</code>

<code>

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
devs = /dev/loop6

</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-25.png">

Creamos el sistema:

<code>qemu-img create -f raw ceph.img 100M</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-26.png">

Ahora hacemos lo siguiente:

<code>sudo losetup -v -f ceph.img</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-27.png">

Le damos formato:

<code>sudo mkfs.xfs /dev/loop6</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-28.png">

En siguiente lugar, vamos a crear un directorio y el sistema de ficheros:

<code>sudo mkdir /srv/ceph/osd/osd.0</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-29.png">

<code>sudo /sbin/mkcephfs -a -c /etc/ceph/ceph.conf</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-30.png">

Ahora vamos a iniciar el servicio. Para ello hacemos lo siguiente:

<code>sudo /etc/init.d/ceph -a start</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-31.png">

Para acabar con el ejercicio, solamente queda crear el directorio donde lo vamos a montar:

<code>sudo mkdir /mnt/ceph</code>

<code>sudo mount -t ceph javi:/ /mnt/ceph</code>

#Ejercicio 7#
##Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados.##

Vamos a empezar viendo como almacenar directorios completos usando *rados*. Para ello, seguiremos los siguientes pasos:

+ Primero deberemos crear una "piscina":

<code>rados mkpool newpool</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-32.png">

+ Comprobamos que se ha creado correctamente:

<code>rados lspools</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-33.png">

Como podemos observar en la imagen anterior, se ha creado perfectamente.

+ Ahora podemos añadir un fichero:

<code>rados put -p newpool obj Rados.txt</code>

#Ejercicio 8#
##Tras crear la cuenta de Azure, instalar las herramientas de línea de órdenes (Command line interface, cli) del mismo y configurarlas con la cuenta Azure correspondiente##

Tras haber creado la cuenta de Microsfot Azure, vamos a proceder a instalar las herramientas que nos pide el ejercicio. Para ello, vamos a seguir los siguientes pasos:

+ En primer lugar, vamos a instalar la herramienta *npm*. Para ello, ejecutaremos lo siguiente:

<code>sudo apt-get install npm</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-34.png">

+ Ahora vamos a proceder a instalar *CLI*:

<code>sudo npm install -g azure-cli</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-35.png">

+ Ahora antes de enlazar con nuestra cuenta vamos a solucionar el siguiente error, ya que si no no podremos hacer el enlazado:

<code>/usr/bin/env: node: No existe el archivo o el directorio</code>

+ Para solucionar el error anterior vamos a crear un enlace simbólico de la siguiente manera:

<code>sudo ln -s /usr/bin/nodejs /usr/bin/node</code>

+ Ahora vamos a enlazar con nuestra cuenta:

<code>azure account download</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-36.png">

+ Nos identificaremos y se bajará un fichero, que importamos haciendo:

<code>azure account import [fichero]</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-60.png">

Con estos pasos ya tendremos nuestra cuenta enlazada.

#Ejercicio 9#
##Crear varios contenedores en la cuenta usando la línea de órdenes para ficheros de diferente tipo y almacenar en ellos las imágenes en las que capturéis las pantallas donde se muestre lo que habéis hecho.##

Vamos a proceder a crear varios contenedores en la cuenta usando la línea de órdenes para ficheros de diferente tipo. Para ello, vamos a seguir los siguientes pasos:

+ En primer lugar, se crea la cuenta.

<code>azure storage account create cuentajavi</code>.

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-61.png">

+ Ahora listaremos la clave primaria y secundaria con el comando <code>azure storage account keys list cuentajavi</code>.


+ Ahora vamos a pasar esta información mediante unas variables de entorno:

<code>export AZURE_STORAGE_ACCOUNT=cuentajavi</code>
<code>export  AZURE_STORAGE_ACCESS_KEY=miclave</code>

+ Ahora vamos a proceder a crear un par de contenedores:

<code>azure storage container create taper -p blob</code>

<code>azure storage container create taper2 -p blob</code>

+ Por último, cuando tengamos los contenedores creados, podemos subir el archivo que queramos. Para ello, vamos a utilizar el comando siguiente:

<code>azure storage blob upload [archivo] taper2 [archivo]</code>

#Ejercicio 10#
##Desde un programa en Ruby o en algún otro lenguaje, listar los blobs que hay en un contenedor, crear un fichero con la lista de los mismos y subirla al propio contenedor. Muy meta todo.##

Mi programa en *Ruby* es el siguiente:

<img src="https://github.com/javiergama8/Images/blob/master/Tema5-62.png">


