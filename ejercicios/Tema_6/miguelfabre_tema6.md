#Virtualización completa: uso de máquinas virtuales

##Ejercicio 1

**Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.**

Yo ya lo tenía instalado como se puede ver aquí

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_6/imagenes/ejercicio1-1.png)

##Ejercicio 2

**1.Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).**

Voy a crear la primera máquina con el SO SliTaz. Descargamos el SO de la página oficial.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_6/imagenes/ejercicio2-1-1.png)

Una vez descargado procedemos a su instalación.

```qemu-img create -f qcow2 slitaz.img 300M```
```qemu-system-x86_64 -hda /home/miguel/Descargas/slitaz.img -cdrom /home/miguel/Descargas/slitaz-5.0-rc2.iso```

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_6/imagenes/ejercicio2-1-3.png)

Tras su instalación, el sistema ya está listo para ser usado.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_6/imagenes/ejercicio2-1-4.png)

La segunda máquina que crearé será con DSL. Procedemos igual que antes.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_6/imagenes/ejercicio2-2-1.png)

Aquí lo tenemos funcionando

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_6/imagenes/ejercicio2-2-2.png)

**2.Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.**

He utilizado otro hipervisor que ya tenía instalado (VMWare) y he instalado el SO MiniNO.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_6/imagenes/ejercicio2-2-or-1.png)

Aquí lo tenemos funcionando

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_6/imagenes/ejercicio2-2-or-2.png)


##Ejercicio 4

**Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.**

He elegido el SO Lubuntu que tiene entorno gráfico LXDE. Instalamos como venimos haciendo durante toda la práctica.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_6/imagenes/ejercicio4-1.png)

Para acceder mediante ssh, procedemos de la forma habitual ```ssh <direccion_ip>```. En caso de no estar instalado, se instala como hacemos siempre.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_6/imagenes/ejercicio4-2.png)

Para acceder mediante VNC, utilizamos ```vinagre <direccion_ip>```


##Ejercicio 5

**Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.**

Para crear la VM he usado [Koding](https://koding.com/). Como vemos, es una máquina Ubuntu.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_6/imagenes/ejercicio5-1.png)

A continuación, instalamos nginx.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_6/imagenes/ejercicio5-2.png)

Una vez instalado, paramos el servicio apache (que es el que viene por defecto con koding) e iniciamos nginx.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_6/imagenes/ejercicio5-3.png)

Accediendo a la ip pública de la máquina, vemos que el servicio nginx está funcionando

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_6/imagenes/ejercicio5-4.png)


##Ejercicio 7

**Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.**

Descargamos de la página oficial de [Linux Mint](http://www.linuxmint.com/download.php) la imagen .iso e instalamos en una VM. Este es el resultado.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_6/imagenes/ejercicio7-1.png)











