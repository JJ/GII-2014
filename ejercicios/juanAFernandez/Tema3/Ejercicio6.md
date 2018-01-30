###Ejercicio 6
#####Crear una jaula y enjaular un usuario usando `jailkit`, que previamente se habrá tenido que instalar

Lo primero que tenemos que hacer es descargar el comprimido desde su [página](http://olivier.sessink.nl/jailkit/jailkit-2.11.tar.gz).
Después descomprimimos e instalamos con *make install*.

    ./configure
    make
    make install

Si la instalación nos da algún tipo de problema como:

~~~bash
/src/jk_socketd.c:474: undefined reference to `pthread_create`
collect2: ld devolvió el estado de salida 1
make[1]: *** [jk_socketd] Error 1
make[1]: se sale del directorio «/jailkit-2.11/src»
make: *** [all] Error 2
~~~
es porque necesita compilar los fuents con la opción **-lpthread** para poder usar herramientas para la creción de hebras.
Esto es fácil de solucionar haciendo `> export LDFLAGS="-pthread"` y volviendo a repetir el proceso.

Una vez solucionado creamos un directorio para la jaula:

    > mkdir directorioPrueba

después hacemos propietario a root:

    > sudo chown root:root directorioPrueba/

ahora configuramos la jaula estableciendo lo que se podrá usar dentro:

    > sudo jk_init -v directorioPrueba/ basicshell

TE HAS QUEDADO AQUÍ!!!!!!!!!

    Establecemos lo que podrá usarse dentro de esa jaula (lo que se la pase al comando obviamente deberá estar instalado) $jk_init -v /home/jaulaej6 basicshell editors extendedshell netutils ssh sftp

    Creamos un usuario nuevo y le asignamos la jaula creada: $adduser usuarioej6

    Asignamos la jaula: $jk_jailuser -m -j /home/jaulaej6 usuarioej6 $passwd usuarioej6

    Por último, se crea el home del usuario en la jaula, haciéndolo propietario de su home: $mkdir -p /home/jaulaej6/home/usuarioej6 $chown usuarioej6:uaurioej6 /home/jaulaej6/home/usuarioej6













Referencias:

* [Tutorial Interesante](http://www.esdebian.org/wiki/enjaulado-facil-jailkit-chroot)
* [En inglés](http://www.binarytides.com/setup-jailed-shell-jailkit-ubuntu/)
