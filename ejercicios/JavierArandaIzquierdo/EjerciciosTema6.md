#Tema 6
###Ejercicio 1
#####Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Estaba creado en el tema 1

###Ejercicio 2
#####1.Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

He elegido SliTaz ya que es la imagen las ligera

Creamos un nuevo disco virtual:
```bash
qemu-img create -f qcow2 fichero-cow.qcow2 600M
```
Ahora arrancamos la maquina con la imagen descargada:
```bash
qemu-system-x86_64 -hda fichero-cow.qcow2 -cdrom ~/Escritorio/slitaz-4.0.iso
```
Aqui esta funcionando:

![1](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/1Tema6.png)

#####2.Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.
He utilizado VirtualBox para montar la misma imagen que en el apartado anterior:

![1](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/2Tema6.png)

###Ejercicio 3
#####Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img

###Ejercicio 4
#####Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.
Primeramente creamos la imagen con:
```bash
qemu-img create -f qcow2 linux.img 10G
```
Tras esto, creamos la maquina:
```bash
qemu-system-x86_64 -hda linux.img -cdrom ubuntu-14.04.1-server-i386.iso -m 512M
```
Tras ver que la maquina funciona, la ejecutaremos de forma que no veamos ninguna ventana y nos conectamos con vinagre a ella:
```bash
qemu-system-x86_64 -boot order=c -drive file=lxde.img,if=virtio -m 512M -name ubuntu14 -vnc :1
```
Inicialmente no podremos conectarnos por SSH ya que qemu solo permite una conexion procedente de internet. Redirigimos hacia el puerto que queramos:
```bash
-redir tcp:4664::22
```
Una vez redireccionado el trafico, solo nos falta instalar SSH para conectarnos a la maquina:
```bash
sudo apt-get install ssh
```
###Ejercicio 5
#####Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.
Una vez creada la maquina virtual (en mi caso Ubuntu), conectamos con ella mediante SSH con el siguiente comando:
```bash
ssh azureuser@javiaranda.cloudapp.net
```
Escribimos la contra y ya estamos dentro de nuestra maquina. Ahora instalamos nginx con:
```bash
sudo apt-get install nginx
```
Y para arrancarlo escribiremos:
```bash
sudo service nginx start
```
Ahora entramos en la direccion de la web de mi maquina y vemos que nginx esta funcionando:
```
http://javiaranda.cloudapp.net/
```
![3](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/3Tema6.png)

###Ejercicio 6
#####Usar juju para hacer el ejercicio anterior.

###Ejercicio 7
#####Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Voy a instalar una imagen de Linux Mint en VirtualBox, aqui esta funcionando:
![4](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/4Tema6.png)

