<h1> Marcos Jiménez Fernández </h1>

<h2> Tema 5 </h2>

<strong>Ejercicio 1:<br>
1. ¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos? </strong>

En mi portátil dispongo de un disco duro SSD de 250GB donde únicamente tengo instalada la partición de Windows. Ubuntu lo utilizo en una máquina virtual con VMware. Antes, cuando mi antiguo portátil tenía solo 4GB de RAM, usaba Ubuntu como partición. Ahora solo en máquina virtual. Para ver los datos de la máquina virtual en cuestión podemos hacer lo siguiente:
```
sudo fdisk -l 
sudo lsblk -fm
```
<img src="http://i59.tinypic.com/2zom4px.png"></img>

<strong>2. Si tienes acceso en tu escuela o facultad a un ordenador común para las prácticas, ¿qué almacenamiento físico utiliza?</strong>

Pues ni idea porque yo siempre utilizo mi portátil.

<strong>3. Buscar ofertas SAN comerciales y comparar su precio con ofertas locales (en el propio ordenador) equivalentes.</strong>

Aquí tenemos por ejemplo una oferta de Dell: http://www.dell.com/us/business/p/storage-san
Y aquí otra de IBM: http://www-03.ibm.com/systems/es/storage/san/ctype/9250i/index.html

<strong> Ejercicio 2:
Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.
Avanzado Usar los drivers de FUSE para Ruby (aquí explican más o menos como hacerlo con fusefs para mostrar el contenido de una estructura de datos en un lenguaje como si fuera un fichero. Este es un ejemplo en Python.
</strong>

Como es necesaria la utilización de dos máquinas virtuales, voy a instalar otra, que va a ser Ubuntu 14.10 de 64 bits. Una vez que la tenga instalada, ejecutamos en ambas máquinas lo siguiente:
```
sudo apt-get install sshfs
```
<img src="http://i61.tinypic.com/2q9gjee.png"></img>

Ahora hay que decidir cuál va a ser la máquina "invitada", por así decirlo. En mi caso va a ser la máquina virtual con Ubuntu 14.10. Consulto su IP e instalo un servidor ssh para poder acceder a los ficheros:
```
ipconfig -a
sudo apt-get install openssh-server
```
Lo que hacemos ahora es crear algún fichero de prueba en la máquina invitada y montarlo. Lo hacemos de la siguiente manera:
```
sshfs marcos@192.168.163.130:/home/marcos/IVEjer5/ejer2 /home/marcos/IVEjer5/ejer2
```

<strong> Ejercicio 3:
Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre.
</strong>

Instalamos quemu:
```
sudo apt-get install qemu-system
```
Usamos la imagen de quemu y a continuación montamos el VMDK:
```
qemu-img create -f qcow2 cow.qcow2 10M
sudo losetup -v -f cow.qcow2
sudo mkfs.ext4 /dev/loop0
```
<img src="http://i58.tinypic.com/ekgqwx.png"></img>

<strong> Ejercicio 4:
Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema.
</strong>

Instalamos un par de herramientas para llevar a cabo el proceso:
```
sudo apt-get install xfsprogs
sudo apt-get install btrfs-tools
```
Una vez instaladas esas herramientas creamos las imágenes:
```
sudo qemu-img create -f raw I0.img 256M
sudo qemu-img create -f raw I1.img 256M
sudo losetup -v -f I0.img
sudo losetup -v -f I1.img
```
Formateamos y montamos:
```
sudo mkfs.xfs /dev/loop1
sudo mkfs.btrfs /dev/loop2
```
<img src="http://i60.tinypic.com/2h8d7v8.png"></img>

Creamos las carpetas y los puntos de montaje:
```
sudo mkdir /mnt/I0 
sudo mkdir /mnt/I1 
sudo mount -t xfs /dev/loop3 /mnt/I0
sudo mount -t btrfs /dev/loop4 /mnt/I1
```
<strong> Ejercicio 5:
Instalar ceph en tu sistema operativo.
</strong>

Lo instalamos con:
```
sudo apt-get install ceph-mds
```

<strong> Ejercicio 6:
Crear un dispositivo ceph usando BTRFS o XFS
</strong>

En primer lugar creamos las carpetas necesarias:
```
sudo mkdir -p /srv/ceph/{osd,mon,mds}
```
Ahora editamos el correspondiente fichero de configuración:
```
sudo gedit /etc/ceph/ceph.conf
```
El fichero tiene que quedar de la siguiente manera:

<img src="http://i61.tinypic.com/2q3y89z.png"></img>

Creamos la imagen y luego los ficheros:
```
qemu-img create -f raw ceph.img 100M
sudo losetup -v -f ceph.img 
sudo mkfs.xfs /dev/loop4
```
<img src="http://i60.tinypic.com/2zrm0w5.png"></img>
```
sudo mkdir /srv/ceph/osd/osd.0 
sudo /sbin/mkcephfs -a -c /etc/ceph/ceph.conf
```
<img src="http://i61.tinypic.com/bhitg5.png"></img>

Por último, lo arrancamos con:
```
sudo /etc/init.d/ceph -a start
sudo ceph -s
```
Y para el montado:
```
sudo mkdir /mnt/ceph
sudo mount -t ceph ubuntu:/ /mnt/ceph
```

<strong> Ejercicio 7:
Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados.
</strong>

Lo podemos hacer con:
```
sudo rados mkpool poolrados
sudo rados put -p poolrados obj Ej7
```
<img src="http://i60.tinypic.com/i294b8.png"></img>

<strong> Ejercicio 8:
Tras crear la cuenta de Azure, instalar las herramientas de línea de órdenes (Command line interface, cli) del mismo y configurarlas con la cuenta Azure correspondiente.
</strong>

Para crear la cuenta de Azure nos vamos a: http://azure.microsoft.com/es-es/

En mi caso no puedo crearla ya que aunque existe versión gratuita hay que introducir un número de cuenta, y no dispongo de cuenta electrónica.

<img src="http://i62.tinypic.com/wsmo86.png"></img>

Lo que sí puedo hacer es instalar el CLI de Azure:
```
sudo npm install -g azure-cli
```
<img src="http://i58.tinypic.com/117bsqo.png"></img>

<strong> Ejercicio 9:
Crear varios contenedores en la cuenta usando la línea de órdenes para ficheros de diferente tipo y almacenar en ellos las imágenes en las que capturéis las pantallas donde se muestre lo que habéis hecho.
</strong>

Al no disponer de cuenta en Azure no voy a poder detallar el proceso con imágenes, pero al menos voy a colocar los comandos a utilizar. Comenzamos creando nuestra cuenta:
```
azure storage account create marcosjimenez
```
Ahora procederíamos a la obtención de las claves y las exportamos:
```
azure account storage keys list marcosjimenez
export AZURE_STORAGE_ACCOUNT=marcosjimenez
export AZURE_STORAGE_ACCESS_KEY=nuestra clave
```
Ahora crearíamos dos contenedores:
```
azure storage container create cont0 -p blob 
azure storage container create cont1 -p blob
```
Y por último subimos el archivo:
```
azure storage blob upload Escritorio/img1.png cont0 img1.png.
azure storage blob upload Escritorio/img2.png tont1 img2.png
```
<strong> Ejercicio 10:
Desde un programa en Ruby o en algún otro lenguaje, listar los blobs que hay en un contenedor, crear un fichero con la lista de los mismos y subirla al propio contenedor. Muy meta todo.
</strong>

Al no haber podido crear los contenedores no me es posible mostrar dichos datos.
