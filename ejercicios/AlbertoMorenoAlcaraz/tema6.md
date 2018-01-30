
Tema 6
======

Ejercicio 1
-----------

**Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.**

Para ver si funciona, podemos ver las maquinas que tenemos instalas con el siguiente comando:
```bash
virsh list --all
```
![t6ej1.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t6ej1.png)

Vemos que no tenemos ninguna maquina instalada.


Ejercicio 2
-----------

**1. Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).**

Vamos a instalar una maquina con ttylinux:

Nos descargamos el archivo iso de la pagina oficial. Despues, tenemos que crear un disco virtual con el siguiente comando:
```bash
qemu-img create -f qcow2 imagen1.qcow2 2000M
```

Iniciamos el disco con la imagen slitaz para instalarla:
```bash
qemu-system-x86_64 -hda imagen1.qcow2 -cdrom ttylinux-pc_i686-2015.01.iso
```
![t6ej2.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t6ej2.png)


Ahora, vamos a instalar otra maquina con slitaz:

Nos descargamos el archivo iso de la pagina oficial. Despues, tenemos que crear un disco virtual con el siguiente comando:
```bash
qemu-img create -f qcow2 imagen2.qcow2 2000M
```

Iniciamos el disco con la imagen slitaz para instalarla:
```bash
qemu-system-x86_64 -hda imagen2.qcow2 -cdrom slitaz-4.0.iso
```
![t6ej2b.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t6ej2b.png)


**2. Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.**

Para este ejercicio, se va a instalar ttylinux en una maquina virtual usando VirtualBox.
Para ello, necesitamos crear una maquina nueva.
![t6ej2c.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t6ej2c.png)

Completamos la configuracion de la maquina como la memoria, etc.

Despues, una vez instalada, iniciamos la maquina y le indicamos la imagen con la que se va a arrancar, que se trata de la imagen de ttylinux que nos hemos descargado antes.
Mostramos en la imagen siguiente, la maquina ejecutandose con ttylinux.
![t6ej2d.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t6ej2d.png)


Ejercicio 3
-----------

**Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con ``qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img``**

- Paravirtualizacion: ``qemu-system-x86_64 -boot order=c -drive file=img-cow.qcow2,if=virtio``

|Medición    | Tiempo     |
| ---------- | ---------- |
| 1          | 8.257      |
| 2          | 8.254      |
| 3          | 8.220      |
| 4          | 8.283      |


- Usando ``qemu-system-x86_64 -hda img-cow.qcow2``

|Medición    | Tiempo     |
| ---------- | ---------- |
| 1          | 8.294      |
| 2          | 8.148      |
| 3          | 8.090      |
| 4          | 8.223      |

Como podemos ver en las tablas anteriores, es ligeramente mas rapido usando directamente ``qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img``


Ejercicio 4
-----------

**Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.**

Para empezar, hay que crear la imagen:
```bash
qemu-img create -f qcow2 debian.img 15G
```
Despues, la ejecutamos:
```bash
qemu-system-x86_64 -hda debian.img -cdrom debian-7.7.0-amd64-netinst.iso -m 512M
```
Instalamos lxde siguiendo estas indicaciones:

- Entramos en opciones avanzadas.
![t6ej4.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t6ej4.png)

- Accedemos a "Alternative desktop environments"
![t6ej4b.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t6ej4b.png)

- Elegimos LXDE.
![t6ej4c.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t6ej4c.png)

Una vez instalado, ya tenemos el escritorio LXDE.

Ahora, salidmos de la maquina y la iniciamos de nuevo:
```bash
qemu-system-x86_64 -boot order=c -drive file=debian.img,if=virtio -m 512M -name debian -vnc :1
```

En una terminal aparte, ejecutaremos ``ifconfig``, vemos la direccion ip de la interfaz a la que nos vamos a conectar y nos conectaremos con el comando:
```bash
vinagre [direccion]:[puerto]
```

Despues, iniciamos la maquina de nuevo con el siguiente comando, para indicarle el puerto por el que vamos a acceder a la maquina:
```bash
qemu-system-x86_64 -boot order=c -drive file=debian.img,if=virtio -m 512M -name debian -redir tcp:[puerto]::22
```

Despues, instalamos en la maquina ssh para poder acceder:
```bash
sudo apt-get install ssh
```

Para acceder a la maquina, desde la anfitriona, ejecutamos el comando:
```bash
ssh alberto@localhost -p [puerto]
```

Ejercicio 5
-----------

**Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.**

Ya tengo una maquina virtual ubuntu instalada.
Iniciamos la maquina e instalamos nginx con el comando:
```bash
sudo apt-get install nginx
```

Despues, iniciamos el servicio ejecutando:
```bash
sudo service nginx start
```

Ahora, miramos la direccion ip de la maquina virtual para ponerla en la barra de direcciones del navegador y nos aparecerá la pantalla de inicio de nginx.
![t6ej5.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t6ej5.png)
```


Ejercicio 7
-----------

**Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.**

Para la instalacion de una maquina con linux Mint, se va a usar VirtualBox.
Lo primero que hay que hacer, es descargarnos de su pagina oficial un archivo iso con la imagen de linux mint.

Lo siguiente, es crear una maquina virtual nueva y rellenar algunos datos.
![t6ej7.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t6ej7.png)

Despues, hay que indicarle que cree un disco virtual para ello, como se indica en la siguiente imagen.
![t6ej7b.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t6ej7b.png)

Una vez terminada la creacion, iniciamos la maquina y le indicamos el fichero iso con la imagen que va a cargar para iniciarse.
![t6ej7c.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t6ej7c.png)

Cuando termine de iniciarse, tendremos una maquina con linux Mint lista para usarse, como vemos en la siguiente imagen.
![t6ej7d.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t6ej7d.png)



