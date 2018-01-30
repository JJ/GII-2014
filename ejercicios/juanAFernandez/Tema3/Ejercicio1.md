###Ejercicio 1

####Crear un espacio de nombres y montar en él una imagen ISO de un CD de forma que no se pueda leer más que desde él. Pista: en ServerFault nos explican como hacerlo, usando el dispositivo loopback



UTS: Unix Time Sharing System (Sistema de tiempo compartido Unix)

Para crear nuestro espacio de nombres sólo tenemos que hacer:

    sudo unshare -u /bin/bash

y especificar un nombre al host:

    hostname prueba
    # hostname
    prueba


ya podemos montar la imagen después:

###Montaje y desmontaje de ficheros .iso

Montar una imagen **iso** es muy sencillo. Sólo tenemos que crear una carpeta en dentro del directorio /mnt/ del sistema y usar **mount**:

~~~bash
mkdir /mnt/disk
sudo mount -o loop PHPAvanzadoSemana1.iso /mnt/disk/
~~~

Al hacer esto ya podremos acceder a la información que contiene la iso.

Para desmontar usamos **umount**:

    sudo umount disk

Desde ese momento el directorio /mnt/disk estará vacío.

Cada vez que montamos una imagen estamos creando un espacio de nombres

Referencias interesantes:

*Blog que habla de linux 3.8 y los [espacios de nombres](http://diegocg.blogspot.com.es/2013/02/las-novedades-de-linux-38.html).

http://www.cinefania.com/elavia/linux/unix-evol/unix-evol.htm
