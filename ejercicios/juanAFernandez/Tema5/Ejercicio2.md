###Ejercicio 2

#####Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.

Para conseguir esto el primer paso será instalar **sshfs** que no viene instalado (debería en la mayoría de los casos junto con OpenSSH) por defecto con ssh en Ubuntu (en concreto).

    sudo apt-get install sshfs

Después creamos un directorio donde sshfs montará el sistema de archivos:

    mkdir /mnt/directorioRemoto

Depués realizamos el montaje con **sshfs** diciéndole el directorio que queremos enlazar del servidor (en nuestro caso el raiz **/**) y el directorio local donde queremos hacerlo:

    Ubuntu> sudo sshfs ansible@137.135.176.212:/ /mnt/directorioRemoto
    ansible@137.135.176.212's password:

Una vez realizada la operación si accedemos al punto de montaje veremos la raiz de ficheros de nuestro servidor como si en nuestro equipo estuviera, con todas las ventajas que esto conlleva a la hora por ejemplo de su administración.

    root@juan-Aspire-5920:/mnt/directorioRemoto# ls
    bin   etc         lib         media  proc  sbin  tmp  vmlinuz
    boot  home        lib64       mnt    root  srv   usr
    dev   initrd.img  lost+found  opt    run   sys   var



Si quisieramos destruir el enlace deberíamos desmontar el sistema de ficheros así:

    umount /mnt/directorioRemoto/


Este enlace también puede realizarse de forma persistente de forma que el reinicio de cualquiera de las máquinas no le afecte y pueden configurarse muchos parámetros como el nivel de acceso y permisos (que por defecto es sólo de lectura para root en el equipo local).

######Referencias:

* [Recurso de DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh)
* [Man Page **sshfs**](http://linux.die.net/man/1/sshfs)
