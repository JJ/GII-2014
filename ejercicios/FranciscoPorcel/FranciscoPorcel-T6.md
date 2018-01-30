# Tema 6

## Ejercicio 1

#### Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Ejecutamos ````sudo kvm-ok ``` para comprobar si nuestro sistema está preparado para ejecutar kvm:

![Ejercicio 1_1](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema6/1_1.png)

Como podemos obervar, no está capacitado para ello.

## Ejercicio 2

#### Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

Vamos a utilizar SliTaz ya que el tamaño de la iso es muy reducido, y el espacio disponible en mi máquina es muy limitado.

En primer lugar lo descargamos de la [web](http://www.slitaz.org/es/get/). Una vez hecho esto creamos un nuevo disco virtual:

![Ejercicio 2_1](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema6/2_1.png)

Una vez hecho esto, arrancamos la máquina virtual con la imagen iso descargada:

![Ejercicio 2_2](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema6/2_2.png)

Ahora, para ver dos máquinas virtuales funcionando a la vez, crearemos otra con la misma imagen de SliTaz.

![Ejercicio 2_3](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema6/2_4.png)

Una vez hecho esto, ya podemos ver ambas máquinas funcionando a la vez:

![Ejercicio 2_4](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema6/2_3.png)

#### Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels

En mi caso, usare VMWare. Realizamos la instalación:

![Ejercicio 2_5](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema6/2_5.png)

Una vez hecho esto procedemos a la creación de las máquinas virtuales:

![Ejercicio 2_6](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema6/2_6.png)

Después de realizar los pasos pertinentes, la máquina virtual se crea. Podemos verla en la siguiente imagen:

![Ejercicio 2_7](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema6/2_7.png)

Al igual que antes, podemos lanzar dos máquinas virtuales a la vez.

## Ejercicio 4

#### Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

En primer luegar descargamos la iso de [Linux](http://cdimage.ubuntu.com/lubuntu/releases/14.10/release/).

Una vez hecho esto la instalamos con ``` qemu-img create -f qcow2 linuxu.qcow3 1800M ``` y ``` qemu-system-x86_64 -hda linuxu.qcow3 -cdrom lubuntu-14.10-desktop-i386.iso -m 512M ```:

![Ejercicio 4_1](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema6/4_1.png)

Ahora, la arrancamos sin entorno gráfico de esta forma ``` qemu-system-x86_64 -boot order=c -drive file=LUbuntu.qcow2,if=virtio -m 512M -name debian -vnc :1 ```. En este punto, lo que debemos hacer es buscar cuál es su IP mediante el comando ``` ifconfig ```

![Ejercicio 4_2](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema6/4_2.png)

Una vez encontrada, realizamos un acceso remoto con vinagre ``` vinagre 192.168.122.1:5901  ```

## Ejercicio 5

#### Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

En primer lugar nos descargamos la imagen de la web oficial de [Ubuntu](http://www.ubuntu.com/).

Una vez hecho esto creamos la máquina virtual. Ahora instalamos nginx.

![Ejercicio 5_1](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema6/5_1.png)

Iniciamos el servicio:

![Ejercicio 5_2](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema6/5_2.png)

Como vemos en el navegador, el servicio está funcionando:

![Ejercicio 5_2](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema6/5_2.png)

## Ejercicio 7

#### Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Primero lo descargamos de la [web oficial](http://www.linuxmint.com/download.php). A continuación, creamos la maquina virtual:

![Ejercicio 7_1](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Tema6/7_1.jpg)


























