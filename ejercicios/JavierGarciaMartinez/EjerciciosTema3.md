# Ejercicio 1 #
## Crear un espacio de nombres y montar en él una imagen ISO de un CD de forma que no se pueda leer más que desde él. Pista: en ServerFault nos explican como hacerlo, usando el dispositivo loopback.##

Creamos un espacio de nombres de tipo UTS. Para ello, vamos a ejecutar el siguiente comando:

<code>sudo unshare -u /bin/bash</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema3-2.png">

Ahora crearemos la carpeta donde realizaremos el montaje. Ejecutamos el siguiente comando:

<code>mkdir /mnt/IV</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema3-3.png">

Y montaremos la imagen ISO utilizando el dispositivo loopback. Para ello, ejecutaré lo siguiente:

<code>mount -o loop ubuntu-14.04.1-server-amd64.iso /mnt/IV</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema3-4.png">
