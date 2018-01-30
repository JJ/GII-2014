###Ejercicio2

**Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD.**

En primer lugar vamos a crear el disco duro virtual

![](./img/2.1)

Ahora instalamos qemu con la siguiente instruccion

<pre>sudo apt-get install qemu-system-x86</pre>

Y ejecutamos la siguiente instrucción, la cual nos abrirá la instalación de nuestra maquina virtual, en mi caso Damn Small Linux.

![](./img/2.2)

<pre>sudo qemu-system-x86_64 -hda ./disco-virtual.qcow2 -cdrom ./Descargas/dsl-4.4.10-syslinux.iso </pre>

![](./img/2.3)

Ahora vamos a crear otra maquina virtual, en este caso con Minino. Volvemos a realizar los pasos principales anteriores.

Creamos el disco virtual

![](./img/2.4)

 Instalamos el sistema operativo

![](./img/2.5)

![](./img/2.6)
