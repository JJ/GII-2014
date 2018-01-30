###Ejercicio 3

#####Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre.

#####1. Imagenes de disco crudas (img, similar a iso sin comprimir):

~~~bash
dd of=fichero-suelto.img bs=1k seek=5242879 count=0
0+0 registros leídos
0+0 registros escritos
0 bytes (0 B) copiados, 0,000138705 s, 0,0 kB/s

ls -lks fichero-suelto.img
0 -rw-rw-r-- 1 juan juan 5242879 dic 27 16:53 fichero-suelto.img

~~~

En la orden de creación con **dd** of indica el nombre de fichero de salida, bs es el tamaño del bloque y seek es el tamaño del fichero en bytes.

Un fichero **.img** es un fichero de información cruda. El formato img como el formato iso es comunmente usado para realizar copias limpias de contenido de discos (CD/DVD). Normalmente img se suele usar para la creación de archivos de imagen de disco duro. En sus orígenes la idea de los ficheros img era poder agrupar todo el contenido de un disco duro en un solo fichero (como un empaquetado) pero sin realizar ningún tipo de compresión.
La estructura de amgos ficheros es la misma, son mapas de bits que contienen lo que se ha escrito en cada sector del disco.


Tanto es esto que podemos tratar a este fichero como un diso y usar fdisk para obtener información de el:

~~~bash
Ubuntu> fdisk -lu fichero-suelto.img

Disco fichero-suelto.img: 5368 MB, 5368708096 bytes
255 cabezas, 63 sectores/pista, 652 cilindros, 10485758 sectores en total
Unidades = sectores de 1 * 512 = 512 bytes
Tamaño de sector (lógico / físico): 512 bytes / 512 bytes
Tamaño E/S (mínimo/óptimo): 512 bytes / 512 bytes
Identificador del disco: 0x00000000

~~~

Vamos a montar la imagen para acceder a su contenido, para eso debemos conocer su offset y para eso necestiamos una herramienta parted, pero vemos que para poder ver información necesitamos que nuestra imagen de disco esté particionada.

Una forma de hacer esto sin necsidad de conocer su ofsset es primero montando la imagen y luego dandole formato, vamos a ver como sería:

1.Creando un dispositivo loop con **losetup**, con lo que conseguimos que el fichero tenga la apariencia de un disco para el sistema.

~~~bash
losetup -v -f fichero-suelto.img
El dispositivo de bucle es /dev/loop0
~~~

2.Dandole formato con mkfs, ext3 por ejemplo.

~~~bash
sudo mkfs.ext3 /dev/loop0
mke2fs 1.42 (29-Nov-2011)
Discarding device blocks: hecho
Etiqueta del sistema de ficheros=
OS type: Linux
Tamaño del bloque=4096 (bitácora=2)
Tamaño del fragmento=4096 (bitácora=2)
Stride=0 blocks, Stripe width=0 blocks
327680 inodes, 1310719 blocks
65535 blocks (5.00%) reserved for the super user
Primer bloque de datos=0
Número máximo de bloques del sistema de ficheros=1342177280
40 bloque de grupos
32768 bloques por grupo, 32768 fragmentos por grupo
8192 nodos-i por grupo
Respaldo del superbloque guardado en los bloques:
32768, 98304, 163840, 229376, 294912, 819200, 884736

Allocating group tables: hecho
Escribiendo las tablas de nodos-i: hecho
Creating journal (32768 blocks): hecho
Escribiendo superbloques y la información contable del sistema de ficheros: hecho

~~~

3.Montando finalmente el dispositivo:

~~~bash
mount -t ext3 -o loop fichero-suelto.img ./puntoMontaje/
~~~

Desde ese momento podemos acceder a la imagen como si de un disco conectado al sistema se tratase.

Este es uno de los formatos que podremos usar como disco para nuestras máquinas virtuales.

Para deshacer el trabajo deberíamos desmontar y desenlazar:

    umount puntoMontaje
    losetup -d /dev/loop0


######Referencias:

* [Archivos dispersos ES](http://es.wikipedia.org/wiki/Archivo_disperso)
* [Archivos dispersos ENG](http://en.wikipedia.org/wiki/Sparse_file)
* [dd Unix (+info y usos)](http://es.wikipedia.org/wiki/Dd_%28Unix%29)
* [Formato img](http://en.wikipedia.org/wiki/IMG_%28file_format%29)
* [losetup](http://blog.bitbang.es/2013/03/creando-dispositivos-loop-con-losetup.html) - [man losetup](http://linux.die.net/man/8/losetup)
* [mkfs](http://persoal.citius.usc.es/tf.pena/ASR/Tema_3html/node12.html) - [man mkfs](http://linux.die.net/man/8/mkfs)
