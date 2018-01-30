
Tema 6
======

Ejercicio 1
-----------

**Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.**

Ya lo tenía instalado y funcionando:

![](https://raw.githubusercontent.com/ernestoalejo/ivimages/master/img13.png)


Ejercicio 2
-----------

**Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).**

Voy a usar SliTaz para poder descargarla rápido en mi máquina. Creamos el disco:

```shell
qemu-img create -f qcow2 disk.qcow2 3000M
```

Encendemos la máquina:

```shell
qemu-system-x86_64 -hda disk.qcow2 -cdrom slitaz-4.0.iso
```

Y con esto ya podemos acceder a ella:

![](https://raw.githubusercontent.com/ernestoalejo/ivimages/master/img14.png)


Ejercicio 4
-----------

**Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.**

Creamos un disco:

```shell
qemu-img create -f qcow2 disk.img 20G
```

Y ejecutamos el ISO que nos hemos descargado de Lubuntu:

```shell
qemu-system-x86_64 -hda disk.img -cdrom utopic-desktop-amd64.iso -m 512M
```

![](https://raw.githubusercontent.com/ernestoalejo/ivimages/master/img15.png)

