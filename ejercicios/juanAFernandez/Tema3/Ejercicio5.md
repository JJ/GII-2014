###Ejercicio5
#####Instalar una jaula chroot para ejecutar el servidor web de altas prestaciones nginx.

Primero entramos en una de las jaulas que hemos creado anteriormente:

~~~bash
> sudo chroot /home/jaulas/lucid/
root@juan-Aspire-5920:/#
~~~

Después instalamos nginx como cualquier otro paquete con apt-get aunque al estar dentro de una jaula probablemente veamos un error debido a que no tenemos la lista de repositorios debidamente actualizada. Para solucionar esto podemos hacer `sudo apt-get update` pero aún así puede que sea necesario añadir alguna linea a la lista de repositorios.

~~~bash
# cat /etc/apt/sources.list
deb http://archive.ubuntu.com/ubuntu lucid main
~~~

Tras la modificación puede quedar así:

~~~bash
deb http://archive.ubuntu.com/ubuntu lucid main
deb http://nginx.org/packages/ubuntu lucid nginx
deb-src http://nginx.org/packages/ubuntu lucid nginx
~~~

Las lineas que han sido añadidas se pueden conocer si vemos la página oficial de los repositorios de [**nginx**](http://nginx.org/en/linux_packages.html).


Ya si puede realizarse la instalación sin problema:

~~~bash
>sudo apt-get install nginx
...
Desempaquetando nginx (de .../nginx_1.6.2-1~lucid_i386.deb) ...
----------------------------------------------------------------------

Thanks for using nginx!

Please find the official documentation for nginx here:
* http://nginx.org/en/docs/
...
~~~

Ya lo tenemos listo para usar.
