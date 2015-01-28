
Virtualización completa: uso de máquinas virtuales
====================================================================

Ejercicio 1
-----------

**Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.**

Lo instale para el tema 1, para instalarlo, usé:
```bash
sudo yum install qemu-kvm libvirt-bin
```
Si uso el comando ``bash virsh list --all`` puedo ver que funciona y que en mi caso no tengo ninguna maquina virtual instalada.
![1_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/1_1.png)


Ejercicio 2
-----------

**1. Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).**

Para este ejercicio voy a usar varias imagenes, una de ellas será[slitaz](http://www.slitaz.org/en/)

Me descargo la imagen de slitaz desde su web.
Creo un disco virtual usando:
```bash
qemu-img create -f qcow2 disco1.qcow2 2000M
```
Arranco la imagen para instalarla en el disco1:
```bash
qemu-system-x86_64 -hda disco1.qcow2 -cdrom slitaz-4.0.iso
```
![2_2.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/2_2.png)
![2_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/2_1.png)

Ademas de crear una máquina virtual con slitaz, voy a crear otra con [ttylinux](http://ttylinux.net/Download/)

Me descargo la imagen de ttylinux desde su web.
Creo un disco virtual usando:
```bash
qemu-img create -f qcow2 disco2.qcow2 2000M
```
Arranco la imagen para instalarla en el disco2:
```bash
qemu-system-x86_64 -hda disco2.qcow2 -cdrom ttylinux-pc_x86_64-2015.01.iso 
```
![2_3.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/2_3.png)
![2_4.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/2_4.png)

**2. Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.**

Para este apartado voy a usar el hipervisor VirtualBox, una vez que lo tengo instalado, voy a crear una máquina nueva.
![2_5.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/2_5.png)

La primera que voy a instalar en este hipervisor va a ser slitaz que ya tengo descargada su imagen.
Lo primero que tengo que hacer en VirtualBox es especificar el nombre y sistema operativo.
![2_6.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/2_6.png)
Tras indicar el nombre del sistema y el sistema, se arranca la máquina y se le indica la imagen del sistema para arrancar. En la siguiente captura de pantalla muestro el sistema slitaz inciado.
![2_7.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/2_7.png)

Ahora voy a crear otra máquina virtual con VirtualBox, ahora una máquina con ttylinux. Para crearla, hay que volver a repetir los pasos anteriores. En la siguiente captura de pantalla muestro el sistema ttylinux iniciado con VirtualBox.
![2_8.png](https://dl.dropboxusercontent.com/u/22433100/IV/t6/2_8.png)


Ejercicio 3
-----------

**Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img**




