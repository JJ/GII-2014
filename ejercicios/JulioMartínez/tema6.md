Ejercicios de Julio Martínez Martínez-Checa
============================

# Tema 6

## Ejercicio 1 ##
**Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.** 

Como lo hice en el primer tema ya tenía los paquetes necesarios instalados. De todas formas lo compruebo:

![captura1](http://i.imgur.com/svQ2SkX.png)

Comprobamos que nuestra CPU tiene soporte para virtualización hardware:

![caputra2](http://i.imgur.com/I7HiGOP.png)

## Ejercicio 2.1 ##
**Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).**

Creamos los discos duros necesarios:

```
$ qemu-img create -f qcow2 coreos.qcow2 10G
$ qemu-img create -f qcow2 fedora.qcow2 10G
```

Realizamos una instalación Live CD de Fedora con:

```
$ qemu-system-x86_64 -machine accel=kvm -hda fedora.qcow2 -cdrom Fedora-Live-Desktop-x86_64-20-1.iso -m 1G -boot d
```

![captura3](http://i.imgur.com/VGOMf4n.png)


También con CoreOS:

```
$ qemu-system-x86_64 -machine accel=kvm -hda coreos.qcow2 -cdrom coreos_production_iso_image.iso -m 1G -boot d
```

![caputra4](http://i.imgur.com/z1k9iUu.png)

## Ejercicio 2.2 ##
**Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.**

Voy a aprovechar que en mi servidor en casa tengo instalado Xen como hipervisor para máquinas virtualizadas usando virt-manager para su creación y monitorización.

El proceso de instalación es el siguiente:

Descargar paquetes necesarios

```
$ sudo aptitude install xen-linux-system-amd64 xen-tools xen-utils-4.1 xen-hypervisor-4.1-amd64
```

Una vez hecho esto tendremos instalado un nuevo kernel que viene con el módulo de xen necesario para usar el hipervisor. Debemos asegurarnos de arrancar con ese kernel para poder usarlo.

Para comprobar que estamos usando el kernel de Xen basta con mirar si existe la carpeta /proc/xen

Puede que el hipervisor nos de problemas si no tenemos habilitada la virtualización por hardware, en ese caso tendríamos que:

Editar el archivo /etc/xen/xend-config-sxp y añadimos lo siguiente:

```
(xend-http-server yes)

(xend-unix-server yes)

(xend-tcp-xmlrpc-server yes)

(xend-unix-xmlrpc-server yes)
```

En /etc/libvirt/libvirt.conf añadimos:

```
auth_unix_ro = "none"

auth_unix_rw = "none"

listen_tcp = 1

listen_tls = 0
```

Reiniciar los servicios:

```
$ sudo service libvirt-bin restart
$ sudo service xen restart
```

Finalmente vamos a instalar una imagen usando el asistente virt-manager.

Instalamos virt-manager:

```
$ sudo apt-get install virt-manager
```

Si queremos usar virt-manager accediendo a un servidor remoto se puede hacer instalando el paquete ssh-askpass y añadiendo una nueva conexión en el gestor:

![captura5](http://i.imgur.com/JrGiIKS.png)

Como podemos ver en la siguiente imagen Xen crea un Dominio0 que es el sistema anfitrión con el kernel de Xen que hospeda al resto de sistemas invitados. En mi caso además tengo una máquina virtual de Winodws que utilizo personalmente para hospedar servidores de juegos

![caputura6](http://i.imgur.com/4bXmLHE.png)

Vamos a instalar la imagen de CoreOS aquí.

Creamos la imagen de disco de la misma forma que antes (o podemos crearlo automáticamente desde el instalador más adelante

```
$ qemu-img create -f qcow2 coreos.qcow2 10G
```

Iniciamos virt-manager --> Click derecho sobre la conexión --> Nuevo

Seguimos el asistente de instalación:

![captura7](http://i.imgur.com/QRROpja.png)

![captura8](http://i.imgur.com/I2Q3No4.png)

![captura9](http://i.imgur.com/13KLtwJ.png)

![captura10](http://i.imgur.com/TJiPdw3.png)

![captura11](http://i.imgur.com/911m5AC.png)

Finalmente vemos que la máquina funciona:

![captura12](http://i.imgur.com/xJ4mhZo.png)

# Ejercicio 3 #
**Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con**

**qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img**



|             |       Sin Virt-IO        |                                    |
|:-----------:|:------------------------:|:----------------------------------:|
|             | Lecturas de caché (KB/s) | Lecturas de buffer de disco (KB/s) | 
|   Prueba 1  |        2039379           |              127522                | 
|   Prueba 2  |        2142818           |              121688                |          
|   Prueba 3  |        2368485           |              128012                |          
|   Prueba 4  |        1867810           |              121733                |          
|   Prueba 5  |        2346173           |              118712                |         
|             |                          |                                    |
|    Media    |        2152933           |              123533,4              | 



|             |       Con Virt-IO        |                                    |
|:-----------:|:------------------------:|:----------------------------------:|
|             | Lecturas de caché (KB/s) | Lecturas de buffer de disco (KB/s) | 
|   Prueba 1  |        2278408           |              135894                | 
|   Prueba 2  |        2114045           |              139595                |          
|   Prueba 3  |        2338876           |              136832                |          
|   Prueba 4  |        2150867           |              139093                |          
|   Prueba 5  |        2354387           |              137702                |         
|             |                          |                                    |
|    Media    |        2247316,6         |              137823,2              | 



Como podemos observar por las pruebas realizadas el hecho de usar un controlador Virt-IO produce un aumento de velocidad del orden de 10000 KB/s, aproximadamente 10 MB/s, que puede resultar significativo.

## Ejercicio 4 ##
**Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.**

He instalado lubuntu (Ubuntu con LXDE) de la misma forma que hice las máquinas virtuales en el ejercicio 2.1 y he accedido a la máquina de esta forma:

```
$ qemu-system-x86_64 -machine accel=kvm -hda lubuntu.qcow2 -m 512M -vnc :1
```

Luego podemos ver el escritorio remoto con vinagre de la siguiente forma:

```
$ vinagre localhost:1
```

![caputra13](http://i.imgur.com/Mp2hwAY.png)

Para ssh voy a instalar en la máquina lubuntu el servidor ssh

```
$ sudo apt-get install ssh
```

La apagamos y la arrancamos de nuevo con esta orden:

```
qemu-system-x86_64 -machine accel=kvm -hda lubuntu.qcow2 -m 512M -redir tcp:2222::22
```

De esta forma estamos haciendo NAT del puerto 2222 de la máquina host al 22 de la máquina invitada.

Ahora para entrar basta con:

```
$ ssh julioxus@localhost -p 2222
```

![captura14](http://i.imgur.com/2DLQmyy.png)

## Ejercicio 5 ##
**Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.**

Falta por conseguir un servicio cloud

## Ejercicio 6 ##
**Usar juju para hacer el ejercicio anterior.**

Lo primero va a ser instalar juju-gui, para ello simplemente tendremos que hacer:

```
$ juju deploy juju-gui
$ juju expose juju-gui
```
Ahora vemos la configuración con 

```
$ juju status
```

![captura15](http://i.imgur.com/6gjRUiS.png)

Como podemos ver ya está inciado. Accedemos a la dirección pública e introducimos la contraseña que encontraremos en el archivo ~/.juju/environments/local.jenv

![captura16](http://i.imgur.com/ZtkkdMq.png)

Para crear la máquina con nginx buscamos nginx en el menú de la izquierda. Le damos a "add to my canvas" y seleccionamos los recursos que le queramos asignar. Una vez hecho esto tendremos que pulsar el botón "commit" de abajo para guardar los cambios. Ahora nos aparecerá la máquina en el menú de inicio con un color amarillo:

![captura17](http://i.imgur.com/cEfnPNm.png)

Aquí me quedo porque no consigo hacer que funcione

## Ejercicio 7 ##
**Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.**

Para instalar Linux Mint podríamos hacerlo de la misma forma que lo hice con CoreOS en el ejercicio 2.2 usando el hipervisor Xen. Supongo que el objetivo sería hacerlo de forma automatizada como se explica en los apuntes.

He clonado el proyecto de vmbuilder de github

```
$ git clone git://git.debian.org/git/pkg-escience/vmbuilder.git
```
Ahora como se explica [aquí](https://wiki.debian.org/VMBuilder) para Debian tendríamos que ejecutar:

```
$ ./debian-vm-builder kvm lenny --tmp=/var/tmp --mirror http://ftp.de.debian.org/debian --rootpass debian
```

De esta forma nos instalaría una distribución Ubuntu lenny (sólo podemos instalar Ubuntu lenny o Ubuntu etch) de manera automática usando el hipervisor kvm.