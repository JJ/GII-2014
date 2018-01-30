#Ejercicio 3

####1. Crear y ejecutar un contenedor basado en Debian.

Para saber los tipos de contenedores que podemos instalar por defecto, podemos ver el directorio **/usr/share/lxc/templates/**

~~~bash
$ ls /usr/share/lxc/templates/
lxc-alpine     lxc-cirros    lxc-openmandriva  lxc-ubuntu
lxc-altlinux   lxc-debian    lxc-opensuse      lxc-ubuntu-cloud
lxc-archlinux  lxc-download  lxc-oracle
lxc-busybox    lxc-fedora    lxc-plamo
lxc-centos     lxc-gentoo    lxc-sshd
~~~

Para instalar un contenedor sólo tenemos que hacer:

    $ sudo lxc-create -t debian -n ubuntu

Donde *-t* especifica la plantilla a usar para la creación del contenedor de las disponibles arriba vistas (si tuvieramos una plantilla creada o descargarda también podríamos pasarlsela com parámetro) y *-n* el nombre que le vamos a dar.

####2. Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora.

    $ sudo lxc-create -t fedora -n miFedora



#####Utilidades más interesantes:

Para **arrancar** cualquiera de los contenedores creados debemos hacer:

    $ sudo lxc-start -n <nombre-contenedor>

Después del nombre del contenedor también podemos especificar el interprete que queremos cargar, como bash: `sudo lxc-start -n miFedora /bin/bash` por ejemplo.


Para **parar** un contenedor podemos usar `lxc-shutdown` o `lxc-stop`, para **congelarloç** `lxc-freeze` y para **descongelarlo** `lxc-unfreeze` siempre con *-n* y el nombre de él detrás.

Si queremos **ver los contenedores creados** podemos usar **lxc-ls**:

    $ sudo lxc-ls
    miFedora  ubuntu

Para ver el **estado** de uno en concreto:

    $ sudo lxc-info -n ubuntu
    Name:           ubuntu
    State:          STOPPED


Referencias:

* [Contenedores en Debian](http://blog.phenobarbital.info/2013/08/lxc-linux-containers-en-debian-wheezy/)

* [Guia de contenedores LXC de Oracle, muy amplia](https://docs.oracle.com/cd/E37670_01/E37355/html/ol_about_containers.html)

* [LXC en SourceForge](http://lxc.sourceforge.net/man/lxc.html)
