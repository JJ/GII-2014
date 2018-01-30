# Jose Carlos Sánchez Hurtado

# Ejercicios tema 6

## Ejercicio 1

#### Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Vuelvo a instalarlo con el siguiente comando para mostrar que ya lo tengo:

`sudo aptitude install qemu-kvm libvirt-bin`

![](http://fotos.subefotos.com/a44d3fc73f730426038fd38ca6df18b6o.png)


## Ejercicio 2

#### 1. Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo). 

#### 2. Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels. 

**Pruebo con SliTaz**

Primero creo un disco duro virtual:

`qemu-img create -f qcow2 fichero-cow3.qcow2 10000M`

Una vez creado, y despues de haber descargado de [la página oficial](http://www.slitaz.org/es/get/#stable) la imagen ISO, arranco la máquina virtual:

`qemu-system-x86_64 -hda fichero-cow3.qcow2 -cdrom slitaz-4.0.iso`

![](http://fotos.subefotos.com/03f9551500d6b184fd022c5c5f0f45fbo.png)

**Pruebo con CoreOS**

Realizo los pasos anteriores pero con la distribución y la [imagen ISO](http://distro.ibiblio.org/tinycorelinux/downloads.html) de CoreOS:

```sh
qemu-img create -f qcow2 fichero-cow3.qcow2 10000M
qemu-system-x86_64 -hda fichero-cow3.qcow2 -cdrom Core-current.iso
```

![](http://fotos.subefotos.com/8890f780b6af76d5756751326dd379e3o.png)

Desde **VMware** realizo la instalación de una nueva máquina virtual de SliTaz y otra de CoreOS:

![](http://fotos.subefotos.com/9c78f633064e0f8df26aa34a0150a297o.png)

![](http://fotos.subefotos.com/d175dbb3eb29d0ffa7caecc83fea64f2o.png)


## Ejercicio 3

#### Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con: qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img

Aplicando el benchmark de tiempo comprobamos como con paravirtualización tarda ligeramente menos que sin paravirtualización:

**Con para virtualización**

`qemu-system-x86_64 -boot order=c -drive file=fichero-cow3.qcow2,if=virtio`

|Medición    |Real        |User       |Sys        |
| ---------- | ---------- |---------- |---------- |
| 1          | 2.620      |0.843      |1.656      |
| 2          | 2.534      |0.871      |1.790      |
| 3          | 2.089      |0.800      |1.742      |
| 4          | 2.246      |0.816      |1.678      |
| Media      | 2.372      |0.832      |1.716      |


**Sin para virtualización**

`qemu-system-x86_64 -hda fichero-cow3.qcow2`

|Medición    |Real        |User       |Sys        |
| ---------- | ---------- |---------- |---------- |
| 1          | 3.089      |0.965      |2.288      |
| 2          | 2.913      |0.884      |2.782      |
| 3          | 2.064      |1.034      |2.205      |
| 4          | 2.484      |0.798      |2.343      |
| Media      | 2,637      |0.918      |2.404      |


## Ejercicio 4

#### Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

Primero creo del disco duro virtual:

`qemu-img create -f qcow2 lxde.img 10G`

Instalo la máquina virtual:

`qemu-system-x86_64 -hda lxde.img -cdrom debian-7.7.0-amd64-netinst.iso -m 512M`

Una vez instalada, en el menú de arranque le indico que quiero que se instale con el entorno gráfico LXDE.

![](http://fotos.subefotos.com/f93e6e8bc20fbd673104fde67d550e52o.png)

Una vez instalada, vemos la dirección IP de la máquina con `ifconfig virbr0` y accedemos con **vinagre**:

`vinagre 192.168.23.129`

Para conectar por ssh se ejecutan los siguientes comandos:

```sh
qemu-system-x86_64 -boot order=c -drive file=discolxde.qcow2,if=virtio -m 512M -name debian -redir tcp:4664::22

ssh -p 4664 localhost
```

## Ejercicio 6

#### Usar juju para hacer el ejercicio anterior.

Lo primero que tenemos que hacer es instalar juju-gui:

```sh
juju deploy juju-gui
juju expose juju-gui
```

Ahora accedemos a la dirección IP desde el navegador, con la contraseña que se encuentra en el archivo juju/environments/local.jenv.

![](http://fotos.subefotos.com/3068344e55af58c35bc7453dde497ea9o.png)

Ahora seleccionamos nginx en el menú de la izquierda y lo instalamos.

![](http://fotos.subefotos.com/80401f212fad5ef82c898ac98867b624o.png)


## Ejercicio 7

#### Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Instalamos el [Linux Mint](http://www.linuxmint.com/download.php) de la misma manera que las máquinas anteriores:

```sh
qemu-img create -f qcow2 mint.qcow2 10G
qemu-system-x86_64 -hda mint.qcow2 -cdrom linuxmint-17.1-cinnamon-64bit.iso
```

![](http://fotos.subefotos.com/deeda21402db8502c368bc5377f5f8ado.png)