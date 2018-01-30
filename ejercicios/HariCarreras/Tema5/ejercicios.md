###Ejercicio 1 ###

Tengo un SSD de 128 GB con OSX instalado.
Tengo una maquina virtual con Ubuntu en la cual tengo las particiones que hace linux (SWAP de datos)
![captura](http://s25.postimg.org/kxjwciegv/Screen_Shot_2015_01_06_at_17_09_50.png)
No tengo acceso a ningún ordenador de la escuela (estoy a distancia)

Oferta local: 
http://www.audiotronics.es/product.aspx?productid=91108
Precio 3.165,71€ pero con oferta 1.525,26€ (vivan las rebajas de febrero)
Capacidad para 5 discos duros de hasta 1TB pero no viene ninguno incluido.
4 puertos Gigabit Ethernet
Memoria caché: 256 MB (actualizable a 1 GB). 
Memoria del sistema: 256 MB (actualizable a 512 MB). 

Oferta comercial
http://www.ebuyer.com/543123-drobo-b800i-12tb-4-x-3tb-8-bay-san-dr-b800i-2a31-12tb-u
precio: £1323.09 = 1694 €
Capacidad para 8 discos duros capacidad de hasta 12TB
2 puertos Gigabit Ethernet

Vemos que con el descuento del 51% el precio de la oferta puede competir contra otros precios internacionales, sin embargo para ser que aun asi es más barato en otros paises.

###Ejercicio 2 ###
Instalo sshfs tanto en la maquina virtual como en la local:
![captura](http://s25.postimg.org/51v297nwf/Screen_Shot_2015_01_06_at_17_33_48.png)
Luego he creado una carpeta compartida llamada "compartido" y las he enlazado en las dos maquinas:

    sshfs haricarreras@192.168.175.1:/Users/haricarreras/compartido /home/haricarreras/compartido

###Ejercicio 3 ###

He instalado quemu con

   $ sudo apt-get install qemu-system

Luego he creado y montado el VMDK como explica en el guión:

	$ qemu-img create -f qcow2 fichero-cow.qcow2 5M
    $ sudo losetup -v -f fichero-cow.qcow2
    $ sudo mkfs.ext4 /dev/loop0	

![captura](http://s25.postimg.org/niph013un/Screen_Shot_2015_01_06_at_18_03_42.png)

###Ejercicio 4 ###

Primero he instalado las librerias necesarias para crear las imagenes:

    $ sudo apt-get install btrfs-tools
    $ sudo apt-get install xfsprogs

Luego creamos las 2 imagenes necesarias y las montamos

	$ sudo qemu-img create -f raw  primera.img 300M
	$ sudo qemu-img create -f raw  segunda.img 300M
	$ sudo losetup -v -f primera.img
	$ sudo losetup -v -f segunda.img
	$ sudo mkfs.xfs /dev/loop4
	$ sudo mkfs.btrfs /dev/loop5
	$ mkdir first second
	$ sudo mount -t xfs /dev/loop4 first
	$ sudo mount -t btrfs /dev/loop5 second

He creado un archivo de 100 MB para probar el tiempo

	$ fallocate -l 100M lastre.img

Y pasamos a copiarlo y medirlo:

	$ sudo time -v cp lastre.img first/lastre
	$ sudo time -v cp lastre.img second/lastre

El resultado es:
![captura](http://s25.postimg.org/ehk4dwkov/Screen_Shot_2015_01_07_at_17_34_33.png)

Como vemos xfs es más rapido.

###Ejercicio 5 ###

    $ sudo apt-get install ceph-mds
    
###Ejercicio 6 ###

Como ya hemos instalado en el ejercicio 5 los paquetenes necesarios, creamos los directorios donde se va a almacenar la informaciín CEPH

    mkdir -p /srv/ceph/{osd,mon,mds}

Creo el fichero de configuración, para ello he de ser root:

    sudo su
    cat > /etc/ceph/ceph.conf
    [global]
	log file = /var/log/ceph/$name.log
	pid file = /var/run/ceph/$name.pid
	[mon]
	mon data = /srv/ceph/mon/$name
	[mon.mio]
	host = haricarreras
	mon addr = 127.0.0.1:6789
	[mds]
	[mds.mio]
	host = haricarreras
	[osd]
	osd data = /srv/ceph/osd/$name
	osd journal = /srv/ceph/osd/$name/journal
	osd journal size = 1000 ; journal size, in megabytes
	[osd.0]
	host = haricarreras
	devs = /dev/loop0


Luego, creo el directorio que se ha de crear a mano:

     sudo mkdir /srv/ceph/osd/osd.0

Creo la imagen

	qemu-img create -f raw ceph.img 100M
	sudo losetup -v -f ceph.img
	sudo mkfs.xfs /dev/loop6

Luego creamos el sistema de ficheros

sudo /sbin/mkcephfs -a -c /etc/ceph/ceph.conf

He iniciamos el servicio

    sudo /etc/init.d/ceph -a start

Lo motamos con:

sudo mkdir /mnt/ceph
sudo mount -t ceph haricarreras:/ /mnt/ceph	

### Ejercicio 7 ###

    sudo rados mkpool mi-piscina
    sudo rados put -p mi-piscina objeto	fichero_ejemplo



