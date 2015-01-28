
#Alberto Mesa Navarro
##Almacenamiento virtual
##Ejercicios del Tema 5

###Ejercicio 1
#### 1.1. ¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?

En mi ordenador principal tengo varios discos duros. En el disco duro principal dispongo de una partición con Windows 8.1. Es dentro de esta partición donde uso máquinas virtuales para utilizar otros SO. No se usa ningún volumen lógico. No obstante, podemos poner en práctica el ejercicio observando una de las máquinas virtuales con los comandos `sudo fdisk -l` y `sudo lsblk -fm`:

![1](http://s3.postimg.org/o0krxcv6r/particiones.png)

En la captura anterior se observa una partición sda (para Linux) que a su vez contiene las particiones extendida y la de swap.

En caso de que desconozcamos si tenemos volúmenes lógicos, podemos hacer uso de lvmdiskscan, incluido en el paquete lvm2:
`sudo apt-get install lvm2`.
`sudo lvmdiskscan`.

![2](http://s9.postimg.org/8z4xddwpr/vollog.png)


#### 1.2. Buscar ofertas SAN comerciales y comparar su precio con ofertas locales (en el propio ordenador) equivalentes.

Observamos las opciones que se muestran a continuación:

[IBM Storwize V3700 SFF Dual Control](http://www.misco.co.uk/product/205412/IBM-Storwize-V3700-SFF-Dual-Control-Enclosure). Precio: 3,482.40 libras.



[HP P2000 G3 iSCSI MSA 2-cntrl SFF Array](http://www.misco.co.uk/product/197630/HP-P2000-G3-iSCSI-MSA-2-cntrl-SFF-Array). Precio: 5,929.20. libras. 

Vemos que se trata de precios elevados, pero hay que tener en cuenta que, a parte del rendimiento, sería complicado montar máquinas con esas configuraciones a modo de ordenador convencional. Sería casi imposible alcanzar las mismas tasas de eficiencia con controladoras convencionales dedicadas en un ordenador común. Otros aspectos a tener en cuenta son la capacidad de refrigeración y expansión, ya que hablamos de Racks con grandes arrays de discos que además permiten hot swapping y redundancia de alimentación en algunos casos. 

###Ejercicio 2
####Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.

Para este ejercicio vamos a necesitar es tener 2 máquinas a la vez y comprobar que no hay instancia de FUSE. Para ello ejecutaremos `lsmod | grep fuse` y `depmod -A`.

Lo primero es instalar sshfs (es necesario hacerlo en ambas máquinas):
`sudo apt-get install sshfs`.

![3](http://s13.postimg.org/xnp72xmnr/sshfs.png)
*Recuerda: debes instalarlo en las dos máquinas.

Consultamos la ip de la máquina "invitada" con `ifconfig` y vemos que es 192.168.78.128.
Como esta será la máquina donde se harán los cambios, en ella instalamos un servidor ssh para poder acceder a los ficheros:

`sudo apt-get install openssh-server`
![4](http://s17.postimg.org/5mf0m3ry7/ssh1.png)

Se crea, por ejemplo, IVT5Ej2/actividad2 para hacer el ejercicio y lo siguiente es montar:

`sshfs alberto@192.168.78.128:/home/alberto/IVT5Ej2/actividad2 /home/alberto/IVT5Ej2`

![5](http://s14.postimg.org/6gfbsit75/montarsshfs.png)

Tras introducir las credenciales hemos conseguido el enlace y hemos conseguido montar correctamente.

![6](http://s4.postimg.org/lasum97zx/sshfhls.png)



###Ejercicio 3
####Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre.

Comenzamos instalando la herramienta qemu:

`sudo apt-get install qemu-system`

Usamos qemu-img: `qemu-img create -f qcow2 cow.qcow2 10M` y a continuación montamos el VMDK: `sudo losetup -v -f cow.qcow2`, `sudo mkfs.ext4 /dev/loop0`:

![7](http://s15.postimg.org/4hfwjlrff/qemu.png)


###Ejercicio 4
####Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema.

Para ficheros y formatos de ese tipo se necesitan herramientas adicionales:
`sudo apt-get install xfsprogs`.
`sudo apt-get install btrfs-tools`.

A continuación creamos las imágenes y las ponemos en looping:

`sudo qemu-img create -f raw  I0.img 256M`.
`sudo qemu-img create -f raw  I2.img 256M`.

`sudo losetup -v -f I1.img`.
`sudo losetup -v -f I2.img`.

Formateamos:
`sudo mkfs.xfs /dev/loop1`.
`sudo mkfs.btrfs /dev/loop2`.

![8](http://s27.postimg.org/r8tzg2jdv/qemu2.png)

Creamos las correspondientes carpetas, puntos de montaje y montamos:

`sudo mkdir /mnt/I0`. 
`sudo mkdir /mnt/I2`.
`sudo mount -t xfs /dev/loop3 /mnt/I0`.
`sudo mount -t btrfs /dev/loop2 /mnt/I2`.

Probamos con un fichero pesado:
`sudo time -v cp /home/alberto/Escritorio/unicorn-6.2.1.91.iso /mnt/I2/unicorn-6.2.1.91.iso`;

![9](http://s9.postimg.org/b4w0g9plr/time2.png)

`sudo time -v cp /home/alberto/Escritorio/unicorn-6.2.1.91.iso /mnt/I0/unicorn-6.2.1.91.iso`;

![10](http://s14.postimg.org/gulo29175/time0.png)


###Ejercicio 5
####Instalar ceph en tu sistema operativo.

`sudo apt-get install ceph-mds`


###Ejercicio 6
####Crear un dispositivo ceph usando BTRFS o XFS.

Creamos las carpetas necesarias:

`sudo mkdir -p /srv/ceph/{osd,mon,mds}`

Editamos el fichero de configuración que necesitamos antes de continuar:

`sudo gedit /etc/ceph/ceph.conf`

![11](http://s3.postimg.org/hvv3piyub/cephconf.png)

Se crea la imagen y luego los ficheros:

`qemu-img create -f raw ceph.img 100M`, `sudo losetup -v -f ceph.img`, `sudo mkfs.xfs /dev/loop4`

![12](http://s11.postimg.org/co5s2jwfn/loop4.png)

`sudo mkdir /srv/ceph/osd/osd.0`, `sudo /sbin/mkcephfs -a -c /etc/ceph/ceph.conf`:

![13](http://s21.postimg.org/mjqoxih6f/monmio.png)

Por fin podemos arrancarlo con `sudo /etc/init.d/ceph -a start` y luego `sudo ceph -s`:

![14](http://s13.postimg.org/ls0m99khj/cephs.png)

El último paso será el montado:

`sudo mkdir /mnt/ceph` y luego `sudo mount -t ceph ubuntu:/ /mnt/ceph`.


###Ejercicio 7
####Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados.

`sudo rados mkpool poolrados`.

`sudo rados put -p poolrados obj Ej7`


###Ejercicio 8
####Tras crear la cuenta de Azure, instalar las herramientas de línea de órdenes (Command line interface, cli) del mismo y configurarlas con la cuenta Azure correspondiente.

![15](http://s21.postimg.org/r9uvapt9z/azure1.png)

Instalamos desde la consola el CLI de Azure:

`sudo npm install -g azure-cli`:

![16](http://s23.postimg.org/y75mnzzsb/azure2.png)

El siguiente paso es ejecutar `azure account download`, que nos indicará una dirección a la que acudir para descargar el fichero de suscripción correspondiente, el cual he importado una vez descargado con `azure account import Escritorio/Evaluación\ gratuita-1-19-2015-credentials.publishsettings`:

![18](http://s17.postimg.org/8kea4ocan/suscripcion.png)

![17](http://s27.postimg.org/lzx4cp57n/import.png)


###Ejercicio 9
####Crear varios contenedores en la cuenta usando la línea de órdenes para ficheros de diferente tipo y almacenar en ellos las imágenes en las que capturéis las pantallas donde se muestre lo que habéis hecho.

Comenzando creando la cuenta:

`azure storage account create albertomesa`:

![19](http://s8.postimg.org/nrymt8vbp/create.png)

A continuación se obtienen las claves:`azure account storage keys list albertomesa` y se exportan: `export AZURE_STORAGE_ACCOUNT=albertomesa`, `export  AZURE_STORAGE_ACCESS_KEY=pegar conjunto de caracteres de la key`.

Vamos a crear dos contenedores:

`azure storage container create taper0 -p blob`, `azure storage container create taper1 -p blob`:

![20](http://s16.postimg.org/m1blvzc11/taper.png)

El último paso es subir el archivo tal y como pide el ejercicio:

`azure storage blob upload Escritorio/taper.png taper0 taper.png`.

`azure storage blob upload Escritorio/create.png taper1 create.png`:

![21](http://s8.postimg.org/dsrmct0ut/blobupload.png)

Podemos ver ambos contenedores en la propia web de Azure:

![22](http://s13.postimg.org/npi297tvb/preview.png)

Enlaces directos a la imágenes:

[Imagen 1](https://albertomesa.blob.core.windows.net/taper0/taper.png)

[Imagen 2](https://albertomesa.blob.core.windows.net/taper0/create.png)




###Ejercicio 10
####Desde un programa en Ruby o en algún otro lenguaje, listar los blobs que hay en un contenedor, crear un fichero con la lista de los mismos y subirla al propio contenedor. Muy meta todo.

![23](http://s17.postimg.org/eto04mk3j/script.png)












