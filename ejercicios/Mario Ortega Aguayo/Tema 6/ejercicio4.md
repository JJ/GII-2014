###Ejercicio 4

**Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.**

Como sistema operativo Linux con entorno LXDE he elegido Lubuntu. Vamos a instalarlo igua que anteriormente, creando el disco virtual y reservando, tras esto, 512MB de RAM.

![](./img/4.1)

![](./img/4.2)

Una vez instalado, arrancamos la maquina virtual

![](./img/4.4)

![](./img/4.3)


Y a continuación, instalamos en nuestra maquina anfitriona el cliente vinagre para acceder mediante vnc con la orden

<pre> sudo apt-get install vinagre </pre>

Y nos conectamos a nuestra maquina ejecutando la siguiente orden

<pre>qemu-system-x86_64 -hda disco-lubuntu.img -vnc :1</pre>

Buscamos la interfaz virbr0 y nos conectamos a ella con vinagre 192.168.22.1:5901.
