###Ejercicio 4

#####Instalar alguna sistema debianita y configurarlo para su uso. Trabajando desde terminal, probar a ejecutar alguna aplicación o instalar las herramientas necesarias para compilar una y ejecutarla

Podemos usar la distribución instalada en otro ejercicio. Para tenerla preparada para realizar alguna instalación debemos montar el direcotrio /proc e instalar el paquete de lenguaje para que no nos de errores raros:

~~~bash
> sudo chroot lucid/ /bin/bash
root@juan-Aspire-5920:/# mount -t proc proc /proc
root@juan-Aspire-5920:/# apt-get install language-pack-es
~~~

Una vez montado *proc* la imagen ya dispone del hardware y de recursos del equipo anfitrion y podemos verlo si listamos las interfaces de red con ifconfig.

Una instalación típica sería la de python que se podría hacer fácilmente con `apt-get install python` para poder usarla.

~~~bash
/# python
Python 2.6.5 (r265:79063, Apr 16 2010, 13:09:56)
[GCC 4.4.3] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> 2+3
5
>>> exit
Use exit() or Ctrl-D (i.e. EOF) to exit
~~~
