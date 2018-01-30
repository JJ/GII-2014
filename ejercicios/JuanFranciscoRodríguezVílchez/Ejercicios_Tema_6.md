
Ejercicios de Juan Francisco Rodríguez Vílchez
================================================

## Ejercicios Tema 6: Virtualización completa: uso de máquinas virtuales ##

### Ejercicio 1 ###

**Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.**

Antes de instalar nada, debemos de comprobar que nuestro procesador soporta virtualización:

![captura](http://i.imgur.com/u7qHKTE.png)

Una vez que sabemos que nuestro procesador lo soporta, instalamos los paquetes necesarios para usar KVM y con algunos más que nos pueden ser de ayuda:

```sh
sudo apt-get install qemu-kvm qemu-system libvirt-bin virtinst virt-manager
```
![captura](http://i.imgur.com/BJ26W3S.png)

### Ejercicio 2.1 ###

**Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).**

Antes de nada voy a activar el módulo del kernel **KVM**:

```sh
sudo modprobe kvm-intel
```
**Con SliTaz:**

El sistema operativo que voy a utilizar para crear las diferentes máquinas virtuales es [SliTaz](http://www.slitaz.org/es/get/#stable) que sólo ocupa 35 megas.

Una vez descargada, procedemos a instalarla:

```sh
qemu-img create -f qcow2 slitaz_imagen.img 500M
qemu-system-x86_64 -hda /home/juanfranrv/Escritorio/slitaz_imagen.img -cdrom /home/juanfranrv/Escritorio/slitaz-4.0.iso
```
![captura](http://i.imgur.com/N5pKowl.png)

Y ya tenemos slitax listo para ser usado:

![captura](http://i.imgur.com/mgnIp5j.png)

**Con Damn Small Linux:**

Como segundo sistema operativo que voy a utilizar he elegido a [Damn Small Linux](http://www.damnsmalllinux.org/download.html):

```sh
wget ftp://distro.ibiblio.org/pub/linux/distributions/damnsmall/current/dsl-4.4.10.iso
qemu-img create -f qcow2 dsl_imagen.img 500M
qemu-system-x86_64 -hda /home/juanfranrv/Escritorio/dsl_imagen.img -cdrom /home/juanfranrv/Escritorio/dsl-4.4.10.iso
```
![captura](http://i.imgur.com/hFnIK2S.png)

### Ejercicio 2.2 ###

**Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.**

El hipervisor que he elegido ha sido **VirtualBox**:

Simplemente tenemos que descargarla desde su [web](https://www.virtualbox.org/) y podemos abrirlo, obteniendo la siguiente ventana:

![captura](http://i.imgur.com/85Zkw6P.png)

Voy a instalar SliTaz utilizando la VirtualBox:

Primero, tenemos que crear una máquina virtual nueva, ponerle nombre y elegir la distro que vamos a instalar:

![captura](http://i.imgur.com/1MMhHKC.png)

Después, tenemos que asignar la RAM que deseemos que posea:

![captura](http://i.imgur.com/in2Em1K.png)

Seleccionamos el tamaño deseado, y la creamos:

![captura](http://i.imgur.com/EqcCzFZ.png)

Y ya tenemos finalmente, la máquina virtual de Slitax:

![captura](http://i.imgur.com/7vsoWmG.png)

Sin embargo tenemos que asignarle, aún, la iso. Para ello, seleccionamos la máquina que acabamos de crear y con botón derecho sobre ella, accedemos a la configuración. Posteriormente, nos vamos a **Almacenamiento** y seleccionamos nuestra iso:

![captura](http://i.imgur.com/3zZox8C.png)

Finalmente, ya podemos iniciar nuestra máquina virtual de SliTax:

![captura](http://i.imgur.com/wtFx3Jb.png)


### Ejercicio 3 ###

**Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img**

He utilizando qemu con virtualización y con paravirtualización para hacer las pruebas:

```sh
qemu-system-x86_64 -boot order=c -drive file=fichero-cow2.qcow2,if=virtio

1emu-system-x86_64 -hda fichero-cow2.qcow2
```
Obteniendo la siguiente tabla de los tiempos sacados al copiar un fichero con virtualización y con paravirtualización: 


|          | Sin virtu    | Con virtu    |   Sin virto      |   Con virto      |
|:--------:|:------------:|:------------:|:----------------:|:----------------:|
|          |  Tiempo (s)  |  Tiempo (s)  | Velocidad (MB/s) | Velocidad (MB/s) |
|    #1    |     6'53     |     5'63     |       26'21      |       23'07      |
|    #2    |     7'12     |     9'14     |       20'13      |       20'22      |
|    #3    |     7'61     |     7'90     |       27'58      |       22'53      |
|    #4    |     10'58    |     8'83     |       26'12      |       22'53      |
|    #5    |     9'34     |     6'39     |       19'32      |       23'68      |
|          |              |              |                  |                  |
|  MEDIA   |     8'236    |     7,578    |      23'872      |      24'496      |


Como vemos es algo más rápido con virtualización, aunque la diferencia es bastante pequeña. En cuanto a tiempo y a velocidad de transferencia gana la virtualización.

### Ejercicio 4 ###

**Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.**

He elegido **Debian** para realizar este ejercicio.

Primero he creado la imagen:

```sh
qemu-img create -f qcow2 lxde.img 15G
qemu-system-x86_64 -hda lxde.img -cdrom debian-7.7.0-amd64-netinst.iso -m 512M
```

Para activar el entorno gráfico de LXDE de Debian, tenemos que realizar los siguientes pasos:

* Accedemos a la instalación y vamos a "Advanced options"

![captura](http://i.imgur.com/o8XWwtv.png)

* Posteriormente, vamos a "Alternative desktop environments" y seleccionamos LXDE:

![captura](http://i.imgur.com/n3CP4bs.png)

* Finalmente, ya tenemos Debian instalado con LXDE.

Arrancamos la máquina virtual a través de un puerto, con:
```sh
qemu-system-x86_64 -boot order=c -drive file=lxde.img,if=virtio -m 512M -name debian -redir tcp:4664::22
```
En un terminal nuevo, miramos con "ifconfig" la dirección de la interfaz a la que vamos a conectarnos con:

```sh
vinagre <direccion_interfaz>
```
Finalmente, instalo **ssh** en la nueva máquina y en la máquina anfitriona escribo:

```sh
ssh -p 4664 juanfranrv@localhost
```
Y ya podremos conectarnos a la máquina con ssh.

### Ejercicio 5 ###

**Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.**

### Ejercicio 6 ###

**Usar juju para hacer el ejercicio anterior.**

### Ejercicio 7 ###

**Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.**

No he encontrado la máquina virtual con Linux Mint por lo que he decidido hacerla con **Ubuntu**.

Antes de nada, tenemos que instalar una serie de paquetes:

```sh
sudo apt-get install ubuntu-vm-builder kvm virt-manager
```
Ahora para provisionar la máquina virtual simplemente es necesario introducir la línea de ordenes de **vmbuilder** con los siguientes parámetros:

![captura](http://i.imgur.com/bs8iNDS.png)

```sh
sudo vmbuilder vmw6 ubuntu --suite precise --flavour server --arch i386 -o --dest /home/juanfranrv/Escritorio/ejerUbuntu --hostname ejerUbuntu --domain eerUbuntu
```
Ahora abrimos VirtualBox y al crear una nueva máquina virtual con dicha imagen, seleccionamos "Usar un archivo disco duro virtual existente". 

![captura](http://i.imgur.com/Vgxrgz9.png)

Arrancamos la VirtualBox y ya podemos comprobar que la máquina virtual funciona correctamente:

![captura](http://i.imgur.com/4oPaIVG.png)
