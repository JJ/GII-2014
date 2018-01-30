##TEMA 5

#VIRTUALIZACIÓN DE ALMACENAMIENTO


* [+]Ejercicio 1
 - A) ¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?

Desde Mac os x, uso "partition inspector", que hace un analisis de todo lo que tengo instalado.

Lo ejecutamos, entonces se nos mostrará todos los volúmenes lógicos instalados en nuestro equipo, así como todas las particiones y que hay, en caso de que se tengan.
En mi caso, solo tengo un disco duro y varias particiones realizadas, que son:

    Mac os x
    Linux
    Windows

Esta sería la respuesta que me da "Partition inspector":
```
*** Report for internal hard disk ***

Current GPT partition table:
 #      Start LBA      End LBA  Type
 1             40       409639  EFI System (FAT)
 2         409640    426086151  Mac OS X HFS+
 3      432377856    497696767  Basic Data
 4      497698816    624880263  Basic Data

Current MBR partition table:
 # A    Start LBA      End LBA  Type
 1              1       409639  ee  EFI Protective
 2         409640    426086151  af  Mac OS X HFS+
 3 *    432377856    497696767  83  Linux
 4      497698816    624880263  07  NTFS/HPFS

MBR contents:
 Boot Code: Unknown, but bootable

Partition at LBA 40:
 Boot Code: None (Non-system disk message)
 File System: FAT32
 Listed in GPT as partition 1, type EFI System (FAT)

Partition at LBA 409640:
 Boot Code: None
 File System: HFS Extended (HFS+)
 Listed in GPT as partition 2, type Mac OS X HFS+
 Listed in MBR as partition 2, type af  Mac OS X HFS+

Partition at LBA 432377856:
 Boot Code: GRUB
 File System: ext3
 Listed in GPT as partition 3, type Basic Data
 Listed in MBR as partition 3, type 83  Linux, active

Partition at LBA 497698816:
 Boot Code: Windows BOOTMGR (Vista)
 File System: NTFS
 Listed in GPT as partition 4, type Basic Data
 Listed in MBR as partition 4, type 07  NTFS/HPFS
```

Como se puede [ver en la siguiente captura](https://www.dropbox.com/s/ld5lm8thfrbdtmu/Captura%20de%20pantalla%202014-12-22%20a%20la%28s%29%2020.58.27.png?dl=0), cada uno tiene su propio sistema de archivos.

 - B) Si tienes acceso en tu escuela o facultad a un ordenador común para las prácticas, ¿qué almacenamiento físico utiliza?

Si he podido tener acceso a los ordenadores de la escuela, en un aula de prácticas. Estos ordenadores usan un sistema de ficheros remoto, que no se encuentra en el ordenador local.


* [+]Ejercicio 2
 - A) Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.

Lo primero que hago es tener instalada una máquina anfitriona en el ordenador, en este caso tengo instalado un ubuntu para las practicas de clase.

El segundo paso es instalar tanto en la máquina anfitriona como en la máquina virtual "sshfs", con el siguiente comando:

    apt-get install sshfs

[Ver captura de pantalla](https://www.dropbox.com/s/vkxxnqigufqyn49/Captura%20de%20pantalla%202014-12-24%20a%20la%28s%29%2012.49.49.png?dl=0)

El tercer paso es crear en la máquina virtual un "usuario" y dentro de su directorio "/home" un directorio "pruebaSshfs", a la cual queremos acceder, dentro de "pruebaSshfs" meteremos algun archivo para poder visualizar después.

El cuarto paso será añadir el usuario creado al cual nos queremos conectar al grupo "FUSE". Seguidamente en la máquina anfitriona vamos a crear el directorio remoto "pruebaSshfs_remoto", en el cual montaremos "/home" de la máquina virtual. De esta manera, ya podemos acceder a los recursos remotos con la orden "sshfs", simplemente pasandole el usuario remoto, la IP de la mñaquina virtual, la ruta al directorio que hemos creado para compartir y la ruta del "/home" de la máquina anfitriona.

Los comandos usados en la explicación:

Para la máquina virtual:

    adduser prueba_iv
    su prueba_iv
    mkdir /home/pruebaSshfs
    touch prueba.txt
    usermod -G fuse -a prueba_iv

[Creación de usuario](https://www.dropbox.com/s/x9k8c6cvh0glr2n/Captura%20de%20pantalla%202014-12-24%20a%20la%28s%29%2012.53.18.png?dl=0)
[Crear carpeta](https://www.dropbox.com/s/7l8ogko5tbd7gnf/Captura%20de%20pantalla%202014-12-24%20a%20la%28s%29%2012.55.31.png?dl=0)

Para la máquina anfitriona:

    mkdir pruebaSshfs_remoto
    sshfs prueba_iv@10.0.3.134:/home/pruebaSshfs /home/walker/pruebaSshfs_remoto

[Ver captura de pantalla](https://www.dropbox.com/s/e6xn8o7hya017e9/Captura%20de%20pantalla%202014-12-24%20a%20la%28s%29%2013.08.33.png?dl=0)

* [+]Ejercicio 3
 - A) Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre.

Lo primero es entrar en [QEMU](http://en.wikibooks.org/wiki/QEMU/Images), donde podremos ver los diferentes tipos de imágenes que soporta. Todas la imágenes pueden ser generadas con el siguiente formato:

    qemu-img create -f [FORMATO] [NOMBRE_ARCHIVO] [TAMAÑO]

Algunos ejemplos de como crearlas:

    raw: qemu-img create -f raw imagen-raw.img 50M
    vdi: qemu-img create -f vdi imagen-vdi.vdi 50M
    qcow2: qemu-img create -f qcow2 imagen-qcow2.qcow2 50M
    vmdk: qemu-img create -f vmdk imagen-vmdk.vmdk 50M

[Ver captura de pantalla](https://www.dropbox.com/s/660gh9yrpuxspk5/Captura%20de%20pantalla%202014-12-24%20a%20la%28s%29%2013.12.54.png?dl=0)

Cuando hayamos creado estos ficheros vamos a montarlos, pero nos dará un "error", ya que no tienen ningun formato asignado.

    mount -o loop,offset=32256 imagen-raw.img /mnt/imagen

[Ver capturas de pantalla](https://www.dropbox.com/s/8j57z535bn8c25w/Captura%20de%20pantalla%202014-12-24%20a%20la%28s%29%2013.41.12.png?dl=0)

    modprobe nbd max_part=16
    qemu-nbd -c /dev/nbd1 imagen-raw.img 
    partprobe /dev/nbd1
    mount /dev/nbd1 /mnt/imagen

[Ver captura 1](https://www.dropbox.com/s/2o222ifgw88iwyg/Captura%20de%20pantalla%202014-12-24%20a%20la%28s%29%2013.50.50.png?dl=0)
[Ver captura 2](https://www.dropbox.com/s/pdqmkv4s4wxp39t/Captura%20de%20pantalla%202014-12-24%20a%20la%28s%29%2013.52.26.png?dl=0)

Pero en todos los casos obtenemos un error:

    mount: debe especificar el tipo de sistema de archivos.

Para arreglar este error y funcione todo correctamante, tenemos que convertir cada fichero en un "dispositivo loop" con "losetup", formatearlo con "gparted" que ya lo teniamos isntalado de un ejercicio anterior. Cuando ya lo tengamos formateado, ya podemos montar el dispositivo con:

    losetup -v -f imagen-vmdk.vmdk
    mkfs.ext4 /dev/loop1
    mount /dev/loop2 /mnt/images

[Ver captura de pantalla](https://www.dropbox.com/s/ymib6cmded2ksof/Captura%20de%20pantalla%202014-12-24%20a%20la%28s%29%2013.55.29.png?dl=0)

Para ver el resultado de como quedaría todo, simplemente ponemos el siguiente comando:

    df -h

* [+]Ejercicio 4
 - A) Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema.

Vamos a hacer algo parecido al ejercicio anterior, que es crear dos sistemas de ficheros, pero ne este caso serán:

    xfs
    btrfs

Para ello ejecutamos los siguientes comandos:

    qemu-img create -f raw prueba-xfs.img 50M
    qemu-img create -f raw prueba-btrfs.img 50M

[Ver captura de pantalla](https://www.dropbox.com/s/ihjc6a1mnpsq1b4/Captura%20de%20pantalla%202014-12-25%20a%20la%28s%29%2013.27.25.png?dl=0)

Ahora como en el ejercicio anterior, usamos el comando "losetup" para convertir cada fichero en ficheros "loop":

    losetup -v -f prueba-xfs.img
    losetup -v -f prueba-btrfs.img

[Ver captura de pantalla](https://www.dropbox.com/s/avdcco5envxpi3l/Captura%20de%20pantalla%202014-12-25%20a%20la%28s%29%2013.28.50.png?dl=0)

El siguiente paso es instalar "btrfs", en caso de que no los tengamos instalados:

    apt-get install btrfs-tools

[Ver captura pantalla](https://www.dropbox.com/s/4nh3dvh44dady3i/Captura%20de%20pantalla%202014-12-25%20a%20la%28s%29%2013.47.15.png?dl=0)

Ahora es el momento de darle formato a cada uno:

    mkfs.xfs /dev/loop0
    mkfs.btrfs /dev/loop1

[Ver captura pantalla 1](https://www.dropbox.com/s/s6yikhjfnn7qfny/Captura%20de%20pantalla%202014-12-25%20a%20la%28s%29%2013.46.48.png?dl=0)
[Ver captura pantalla 2](https://www.dropbox.com/s/3sim26n3kk0k4fw/Captura%20de%20pantalla%202014-12-25%20a%20la%28s%29%2013.49.56.png?dl=0)
Y el paso final si todo ha salid bien es, montarlos, simplemente con los siguiente comandos:

    mount /dev/loop0 /mnt/loop0
    mount /dev/loop1 /mnt/loop1

Se comprueba de que se ha realizado todo correctamente con:

    df -h

* [+]Ejercicio 5
 - A) Instalar ceph en tu sistema operativo.

Para instalar "Ceph", solo es necesario poner el siguiente comando:

    apt-get install ceph-mds

[Ver captura de pantalla](https://www.dropbox.com/s/4mkdu6i6xemnyip/Captura%20de%20pantalla%202014-12-22%20a%20la%28s%29%2021.05.29.png?dl=0)

* [+]Ejercicio 6
 - A) Crear un dispositivo ceph usando BTRFS o XFS.

Solo tenemos que configurar el dispositivo, ya que lo hemos creado en el ejercicio anterior.
Lo primero que debemos de hacer es crear el directorio para almacenar la información, para ello debemos usar el siguiente comando:

    mkdir -p /srv/ceph/{osd,mon,mds}

[Ver captura de pantalla](https://www.dropbox.com/s/sqm10eztutfigk9/Captura%20de%20pantalla%202014-12-25%20a%20la%28s%29%2013.52.20.png?dl=0)

Ahora tenemos que crear y rellenar el fichero de configuración como tenemos en el ejemplo de las practicas:
```
[global]
log file = /var/log/ceph/$name.log
pid file = /var/run/ceph/$name.pid
[mon]
mon data = /srv/ceph/mon/$name
[mon.mio]
host = penny
mon addr = 127.0.0.1:6789
[mds]
[mds.mio]
host = penny
[osd]
osd data = /srv/ceph/osd/$name
osd journal = /srv/ceph/osd/$name/journal
osd journal size = 1000 ; journal size, in megabytes
[osd.0]
host = penny
devs = /dev/loop0
```

Después de configurar el fichero de configuración, creamos un sistema "loop" en "xfs", como hicimos en el ejercicio anterior.
Creamos el directorio del servidor de objetos con:

    mkdir /srv/ceph/osd/osd.0

[Ver captura de pantalla](https://www.dropbox.com/s/y4ztf0ffrtw7wfq/Captura%20de%20pantalla%202014-12-25%20a%20la%28s%29%2013.53.58.png?dl=0)

Y también el sistema de ficheros de objetos con:

    /sbin/mkcephtfs -a -c /etc/ceph/ceph.conf

[Ver captura de pantalla](https://www.dropbox.com/s/5f9ey8nhqfab7v9/Captura%20de%20pantalla%202014-12-25%20a%20la%28s%29%2013.58.17.png?dl=0)

Por último, iniciamos el servicio y comprobamos el estado de "Ceph" con:

    /etc/init.d/ceph -a start 
    ceph -s

Ya solo nos quedaría crear el directorio donde vamos a montarlo. Para  crearlo y montarlo usamos:

    mkdir /mnt/ceph mount -t ceph Ubuntu:/ /mnt/ceph


* [+]Ejercicio 7
 - A) Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados.

Lo primero que debemos de hacer es crear la "piscina" para rados, con:

    rados mkpool piscina

Una vez creado la "piscina", introducimos nuestro fichero en la "piscina" con:

    rados put -p piscina objeto prueba.img

Si lo que queremos es subir una carpeta completa, solamente tendriamos que comprimirla y subirla comprimida.
Basta con seguir estos sencillos pasos:

    tar -zcvf prueba.tar.gz IV
    rados put -p piscina carpeta prueba.tar.gz
    rados df
    rados ls -p piscina

* [+]Ejercicio 8
 - A) Tras crear la cuenta de Azure, instalar las herramientas de línea de órdenes (Command line interface, cli) del mismo y configurarlas con la cuenta Azure correspondiente.

En este [Enlace](https://login.live.com/login.srf?cbcxt=azubill&vv=2020&lc=3082&wa=wsignin1.0&wtrealm=urn:federation:MicrosoftOnline&wctx=wa%3Dwsignin1.0%26rpsnv%3D4%26ct%3D1419512902%26rver%3D6.4.6456.0%26wp%3DSAPI%26wreply%3Dhttps:%252F%252Faccount.windowsazure.com%252Fsignup%253Foffer%253Dms-azr-0044p%26lc%3D3082%26id%3D500867%26WHR%3Dlive.com%26cbcxt%3Dazubill&wfresh=0), podemos registranos, para usar "Azure" durante un mes gratis. Simplemente inicamos sesión con nuestra cuenta de "Microsoft" y rellenamos los camps de informacion que nos piden.

El primer paso que de vemos de dar tras la cración de la cuenta de "Azure", es instalar "Azure", pero para ello debemos de tener instalado previamente la librería "node.js", para ello introducimos los siguientes comandos:

    apt-get install -y python-software-properties python g++ make
    add-apt-repository -y ppa:chris-lea/node.js
    apt-get update

[Ver captura de pantalla 1](https://www.dropbox.com/s/oi5qnp636vqxfvo/Captura%20de%20pantalla%202014-12-25%20a%20la%28s%29%2014.14.50.png?dl=0)
[Ver captura de pantalla 2](https://www.dropbox.com/s/wpigoil5axei48q/Captura%20de%20pantalla%202014-12-25%20a%20la%28s%29%2014.16.33.png?dl=0)
Ahora una vez realizado los pasos anteriores, vamos a instalar la librería de "node.js" con el siguiente comando:

    apt-get install nodejs

[Ver captura de pantalla](https://www.dropbox.com/s/lm99xcd9khklzxa/Captura%20de%20pantalla%202014-12-25%20a%20la%28s%29%2014.18.02.png?dl=0)

Después de instalar "node.js", debemos de instalar también "Windows Azure", para ello usamosel siguiente comando:

    npm install azure-cli

[Ver captura de pantalla](https://www.dropbox.com/s/35dpyu2j0a21q9a/Captura%20de%20pantalla%202014-12-25%20a%20la%28s%29%2014.19.28.png?dl=0)

Cuando ya tengamos todo instalado, nos dirigimos a este [enlace](http://go.microsoft.com/fwlink/?LinkId=254432) y hacemos login. cuando hagamos login se nos descargará un archivo de configuración "publishsettings". Este archivo que se nos ha descargado tenemos que importarlo con:

    azure account import ~/Azpad345GZK8945-12-25-2014-credentials.publishsettings

Por último tenemos que crear una cuenta de almacenamiento usando los siguientes comandos:

    azure account storage create victorCoronas
    azure account storage keys list victorCoronas
    export AZURE_STORAGE_ACCOUNT=victorCoronas
    export AZURE_STORAGE_ACCESS_KEY=(llave dada por azure account)
    echo $AZURE_STORAGE_ACCOUNT
    echo $AZURE_STORAGE_ACCESS_KEY

* [+]Ejercicio 9
 - A) Crear varios contenedores en la cuenta usando la línea de órdenes para ficheros de diferente tipo y almacenar en ellos las imágenes en las que capturéis las pantallas donde se muestre lo que habéis hecho.

Lo primero que debemos de hacer es crear un contenedor para imágenes con "Azure", con el siguiente comando:

    azure storage container create imagenes -p blob

Después lo único que debemos de hacer es subir cualquier imágen al contenedor con el siguiente comando:

    azure storage blob upload ~/Escritorio/pruebaIv.jpg

Si hemos seguido los pasos anteriores, el archivo de la imágen quedará subido a la cuenta  creada en el ejercicio anterior.

* [+]Ejercicio 10
 - A) Desde un programa en Ruby o en algún otro lenguaje, listar los blobs que hay en un contenedor, crear un fichero con la lista de los mismos y subirla al propio contenedor. Muy meta todo.

Vamos a realizar un programa en "Ruby" con "Azure", para ello debemos de instalar  la "gema de ruby" para "Azure" con el siguiente comando:

    gem install azure

[Ver captura de pantalla](https://www.dropbox.com/s/g1trg0i5pa8pish/Captura%20de%20pantalla%202014-12-25%20a%20la%28s%29%2014.20.24.png?dl=0)

Una vez instalado, vamos a proceder a escribir el código del programa en Ruby:
```
#!/usr/bin/ruby
require "azure"

azure_blob_service = Azure::BlobService.new

containers = azure_blob_service.list_containers()

#Recorremos cada contenedor
containers.each do |container|

#Conforme lo va recorriendo se crea un ".txt" con el nombre del contenedor
    name = container.name + ".txt"

#Vamos abriendo el fichero que se ha creado en modo escritura "w"
File.open(name, "w") do |list|

    #Se almacena su nombre y cada blob que contiene dentro
    list.puts container.name + ":"
    list.puts "=" * container.name.length
blobs = azure_blob_service.list_blobs(container.name)
    blobs.each do |blob|
                list.puts "\t" + blob.name
    end
end

#Ahora subimos el fichero al contenedor
content = File.open(name, "rb") { |file| file.read }
blob = azure_blob_service.create_block_blob(container.name, name, content)
end
'''
