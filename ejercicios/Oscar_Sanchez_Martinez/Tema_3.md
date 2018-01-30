# Ejercicios de Óscar Sánchez Martínez #

Ejercicio1.
Crear un espacio de nombres y montar en él una imagen ISO de un CD de forma que no se pueda leer más que desde él. Pista: en ServerFault nos explican como hacerlo, usando el dispositivo loopback.

[imagen](http://i.imgur.com/3EeCJlC.jpg)
-----imagen1-------
[imagen]()
-----imagen2-------

Ejercicio2.
Mostrar los puentes configurados en el sistema operativo.
Crear un interfaz virtual y asignarlo al interfaz de la tarjeta wifi, si se tiene, o del fijo, si no se tiene.
[imagen](http://i.imgur.com/Hk8EL3X.jpg)
------imagen1-------
[imagen](http://i.imgur.com/rwIdDSy.jpg)
------imagen2-------
[imagen](http://i.imgur.com/TER1pk9.jpg)
------imagen3-------

Ejercicio3.
Usar debootstrap (o herramienta similar en otra distro) para crear un sistema mínimo que se pueda ejecutar más adelante.
Experimentar con la creación de un sistema Fedora dentro de Debian usando Rinse.
Ejecutamos este comando:
[imagen](http://i.imgur.com/TER1pk9.jpg)
-------imagen1-------
[imagen](http://i.imgur.com/ZmMPuzf.jpg)
-------imagen2-------
Ejercicio4.
Instalar alguna sistema debianita y configurarlo para su uso. Trabajando desde terminal, probar a ejecutar alguna aplicación o instalar las herramientas necesarias para compilar una y ejecutarla.

-A partir del ejercicio anterior, realizamos lo siguiente dentro de la jaula:

[imagen](http://i.imgur.com/r2iZuPa.png)


Instalación de nano dentro de la jaula 
[imagen](http://i.imgur.com/mrYgIEo.png)

Prueba del uso de la aplicación nano:

[imagen](http://i.imgur.com/FWpdXXV.png)

Ejercicio5.
Instalar una jaula chroot para ejecutar el servidor web de altas prestaciones nginx.

Primero tenemos que modificar el fichero "etc/apt/source.list" y añadir las siguientes líneas para la distribución "saucy" :

deb http://nginx.org/packages/ubuntu/ saucy nginx
deb-src http://nginx.org/packages/ubuntu/ saucy nginx

[imagen](http://i.imgur.com/RCa7mzx.png)
------- imagen1 --------

Una vez hecho esto, ejecutamos el comando "sudo apt-get update" para actualizar los paquetes incluyendo el que acabamos de poner manualmente y ya, simplemente, ejecutamos "sudo apt-get install nginx"

[imagen](http://i.imgur.com/OzrxGcO.png)
-------- imagen2---------

Por último, arrancamos el nginx con un :

service nginx start

y comprobamos que funciona

[imagen](http://i.imgur.com/9BwpjoN.png)

Ejercicio6.
Crear una jaula y enjaular un usuario usando `jailkit`, que previamente se habrá tenido que instalar.
