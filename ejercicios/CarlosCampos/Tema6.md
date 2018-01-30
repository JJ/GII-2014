#Carlos Campos
## Virtualización completa: uso de máquinas virtuales

### Ejercicio 1
Antes de nada, debemos de ver si nuestro ordenador está preparado para usar KVM, para ello debemos de ejecutar:

    kvm-ok

En el cuál nos debe de aparecer si nuestra máquina esta o no preparada. En mi caso mi ordenador no soporta la virtualización tal y como podemos ver en la siguiente imágen.

Para instalar todo lo necesario haría falta ejecutar el siguiente código:

    sudo apt-get install qemu-kvm qemu-system libvirt-bin virtinst virt-manager

### Ejercicio 2  
#### 2.1
En primer lugar, tenemos que crear un HDD virtual para cada MV.  

    qemu-img create -f qcow2 HDD1.qcow2 1024M
    qemu-img create -f qcow2 HDD2.qcow2 1024M

Para iniciar la instalación debemos de arrancar las máquinas virtuales desde la ISO, en mi caso usamos **SliTaz** y **DSL**.

    qemu-system-x86_63 -hda HDD1.qcow2 -cdrom slitaz-4.0.iso &

![Imgur](http://i.imgur.com/FqknKUp.png)

    qemu-system-x86_64 -hda HDD2.qcow2 - cdrom dsl-4.11.rc1.iso &

![Imgur](http://i.imgur.com/fwvFbMK.png)

#### 2.2
Vamos a procededer a instalar bajo VirtualBox DSL.  

Una vez que tenemos intalado virtualbox y descargado la imágen de DSL, basta con abrir Virtualbox, pulsar sobre **Nueva** y seguir el proceso de configuración de la máquina virtual paso a paso.

Una vez creada la máquina virtual tan solo necesitaremos pulsar sobre ella para acceder a **Configuración -> Almacenamiento** y selecionamos en la unidad de CD la imágen descargada, en nuestro caso el sistema operativo DSL.

![Imgur](http://i.imgur.com/jJSv56t.png)

### Ejrcicio 4
El primer paso que tenemos que realizar es crear una imagen y ejecutarlo igual que en el ejercicio anterior, pero esta vez especificandole la memoria.

    qemu-img create -f qcow2 lxde.qcow2 8096M
    qemu-system-x86_64 -hda lxde.qcow2 -cdrom lubuntu-14.10-desktop-i386.iso -m 512M

Una vez instalada, la arrancamos con los dos especificadores que necesitamos:

    qemu-system-x86_64 -boot order=c -drive file=lxde.qcow2,if=virtio -m 512M -name debian -vnc :1

La máquina comienza a ejecutarse pero esta vez sin mostrarnos su entorno, observamos la ip que tiene con un **ifconfig** a virbr0.

Con cualquier cliente VNC accedemos indicando dicha ip.

### Ejercicio 6
Lo primero que debemos de hacer es instalar juju-gui, para ello:  

    juju deploy juju-gui
    juju expose juju-gui

Ahora vemos la configuración con **juju status** para saber si está inicializado o no. Accedemos a la ip del servidor (la cuál podemos verla en la línea *public-address*) e introducimos la contraseña que podemos encontrar en el archivo **~/.juju/environments/local.jenv**.

Para crear una máquina con nginx, lo búscamos en el menú de la izquierda, le damos a **add to my canvas** y seleccionamos los recursos que le queramos asignar. Una vez hecho esto tendremos que pulsar el botón **commit** de abajo para guardar los cambios. Ahora nos aparecerá la máquina en el menú de inicio con un color amarillo.

![Imgur](http://i.imgur.com/bmmRbO8.png)

### Ejercicio 7  
Al no encontrar ninguna máquina virtual de Linux Mint, procedo a realizar el ejercicio con **ubuntu**.

Antes de nada, tenemos que instalar una serie de paquetes:

    sudo apt-get install ubuntu-vm-builder kvm virt-manager

Ahora para provisionar la máquina virtual simplemente es necesario introducir la línea de ordenes de **vmbuilder** con los siguientes parámetros:

    sudo vmbuilder vmw6 ubuntu --suite precise --flavour    server --arch i386 -o --dest /home/ccampos/ubuntu --hostname ubuntu --domain ubun

Ahora abrimos VirtualBox y al crear una nueva máquina virtual con dicha imagen, seleccionamos "Usar un archivo disco duro virtual existente" y seleccionamos el disco virtual que acabamos de crear.

Arrancamos la VirtualBox y ya podemos comprobar que la máquina virtual funciona correctamente.
