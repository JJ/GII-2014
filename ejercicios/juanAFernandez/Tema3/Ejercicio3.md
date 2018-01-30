###Ejercicio 3

#####1. Usar debootstrap (o herramienta similar en otra distro) para crear un sistema mínimo que se pueda ejecutar más adelante.

Para saber las distintas imágenes que podemos instalar con debootstrap podemos ver uno de sus ficheros principales:

~~~bash
> ls /usr/share/debootstrap/scripts/
breezy     hardy         lucid      sarge             unstable
dapper     hoary         maverick   sarge.buildd      warty
edgy       hoary.buildd  natty      sarge.fakechroot  warty.buildd
etch       intrepid      oldstable  sid               wheezy
etch-m68k  jaunty        oneiric    squeeze           woody
feisty     karmic        potato     stable            woody.buildd
gutsy      lenny         precise    testing
~~~

Vamos por ejemplo a elegir la distribución lucid:

~~~bash
> sudo debootstrap --arch=i386 lucid /home/jaulas/lucid/ http://archive.ubuntu.com/ubuntu
~~~

Una vez instalada la imagen (tras un rato de ejecución) podemos ver la estructura de ficheros que se ha creado:

~~~bash
> ls lucid
bin   dev  home  media  opt   root  selinux  sys  usr
boot  etc  lib   mnt    proc  sbin  srv      tmp  var
~~~

Ya podemos entrar a trabajar dentro de nuestra jaula, aunque hay cosas como la red que no tiene configurada:

~~~bash
Ubuntu> sudo chroot lucid/ /bin/bash
[sudo] password for juan:
root@juan-Aspire-5920:/# ls
bin   dev  home  media	opt   root  selinux  sys  usr
boot  etc  lib	 mnt	proc  sbin  srv      tmp  var
root@juan-Aspire-5920:/# ifconfig
Warning: cannot open /proc/net/dev (No such file or directory). Limited output.
root@juan-Aspire-5920:/# exit
exit
~~~

Podemos cononocer mucha más información en la sección de la wiki de debian de [debootstrap](https://wiki.debian.org/es/debootstrap).


#####2. Experimentar con la creación de un sistema Fedora dentro de Debian usando Rinse.

Para poder usar rinse debemos instalarlo, `sudo apt-get install rinse`.

Después podemos realizar la instalación de un fedora así:

~~~bash
> sudo rinse --arch=i386 --distribution fedora-core-6 --directory /home/jaulas/fedora/
~~~


[Rinse](http://collab-maint.alioth.debian.org/rinse/)

[manpage Rinse](http://manpages.ubuntu.com/manpages//jaunty/man8/rinse.8.html)

[RPM-based](http://es.wikipedia.org/wiki/RPM_Package_Manager)
