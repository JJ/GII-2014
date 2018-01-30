<strong> Ejercicio 1:
Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.
</strong>

De nuevo, como hicimos en el tema 5, usamos el siguiente comando:
```
kvm-ok
```
<img src="http://i61.tinypic.com/20jh6xi.png"></img>

En mi caso vemos que mi CPU no lo admite.

<strong> Ejercicio 2:<br>
1. Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).<br>
</strong>

Primero creamos una partición virtual para cada máquina:
```
qemu-img create -f qcow2 HDD1GB.qcow2 1024M
qemu-img create -f qcow2 HDD500MB.qcow2 500M
```
Ahora comenzamos con la instalación de SliTaz. Para ello ejecutamos:
```
qemu-system-x86_64 -hda HDD1GB.qcow2 -cdrom Descargas/slitaz-4.0.iso &
```
<img src="http://i62.tinypic.com/35n69zr.png"></img>

Ahora vamos a instalar Damn Small Linux. Para ello ejecutamos:
```
qemu-system-x86_64 -hda HDD500MB.qcow2 -cdrom Escritorio/dsl-4.11.rc1.iso -show-cursor &
```
<img src="http://i60.tinypic.com/167qpom.png"></img>

<strong>2. Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.</strong>

Vamos a instalar Damn Small Linux en Virtual Box en Ubuntu. Si no tenemos instalado VirtualBox en Ubuntu lo instalamos:
```
sudo apt-get install virtualbox-qt
```
Una vez que tengamos instalado VirtualBox, lo abrimos y pinchamos en "Nueva". Lo siguiente es darle un nombre, en nuestro caso la vamos a llamar "DSL". Le damos 512MB de memoria RAM y seleccionamos "crear un disco virtual ahora". Por último, le damos un espacio de unos 4GB a nuestra máquina y añadimos el ISO que descargamos antes. Nos debe quedar algo así:

<img src="http://i58.tinypic.com/2m4992v.png"></img>

Ya solo nos queda arrancar la máquina e instalarla:

<img src="http://i62.tinypic.com/mkiuti.png"></img>

<strong> Ejercicio 3:
Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img
</strong>

<strong> Ejercicio 4:
Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.
</strong>

Comenzamos realizando la misma operación que antes:
```
qemu-img create -f qcow2 LUbuntu.qcow2 8096M
```
La instalación de LUbuntu se realiza de forma similar, pero ahora especificamos la cantidad de RAM que queremos usar:
```
qemu-system-x86_64 -hda LUbuntu.qcow2 -cdrom Escritorio/lubuntu-14.10-desktop-i386.iso -m 1024M
```
<img src="http://i59.tinypic.com/jsojk1.png"></img>

Cuando la instalemos, la arrancamos con los especificadores necesarios:
```
qemu-system-x86_64 -boot order=c -drive file=LUbuntu.qcow2,if=virtio -m 512M -name debian -vnc :1
```
No he sido capaz de instalar LUbuntu. Al seleccionar que comience la instalación no pasa nunca de ahí, a pesar de haberle dado recursos suficientes.

Para realizar un acceso con vinagre obtenemos la IP de la máquina y ejecutamos:
```
vinagre "La IP de la máquina"
```

<strong> Ejercicio 5:
Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.
</strong>

Como es necesario haber configurado Azure y en mi caso no he podido hacerlo debido a los problemas detallados en los ejercicios del tema 5, voy de nuevo a especificar los pasos a seguir, aunque no podré poner capturas de pantalla. En primer lugar, listamos las máquinas que tenemos con:
```
azure vm image list
```
Seleccionamos la que queramos y la configuramos, añadiendo la clave:
```
azure vm create marcosjimenez b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-12_04_2-LTS-amd64-server-20121218-en-us-30GB marcosjimenez [clave] --location "West Europe" --ssh
```
Lo siguiente es arrancarla:
```
azure vm start marcosjimenez
```
Ahora tenemos que saber la IP. Para ello, la obtenemos en el panel de MV de Azure y hacemos lo siguiente:
```
ssh marcosjimenez@"La IP que hemos obtenido"
```
Entrando dentro, instalamos nginx:
```
sudo apt-get update
sudo apt-get install -y nginx && sudo service nginx start && sudo service nginx status
```
Lo único que nos queda es hacer que la aplicación escuche por el puerto 80. Lo hacemos con:
```
azure vm endpoint create -n http0 marcosjimenez 80 80
```
Y si nos vamos a un navegador web y colocamos la dirección nos debería salir la página de bienvenida de nginx.

<strong> Ejercicio 6:
Usar juju para hacer el ejercicio anterior.
</strong>

Vamos a seguir los pasos del tutorial de juju: https://juju.ubuntu.com/docs/config-azure.html
```
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout azure.pem -out azure.pem
openssl x509 -inform pem -in azure.pem -outform der -out azure.cer
chmod 600 azure.pem
```
Lo siguiente sería cargarlo en Azure y seleccionar juju. Lo hacemos de la siguiente manera:
```
sudo juju switch azure
sudo juju bootstrap
```
Hecho esto, ya podemos desplegar juju. Lo hacemos con:
```
sudo juju deploy --to 0 juju-gui
```

<strong> Ejercicio 7:
Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.
</strong>

Primero tenemos que descargar Linux Mint. Luego instalamos el hipervisor de Xen:
```
sudo apt-get install xen-hypervisor-4.4-amd64 bridge-utils virtinst
```
Ahora ponemos lo siguiente:
```
sudo apt-get install virt-manager
virt-manager lvm2 qemu-system
```
Con ese último comando se abre el gestor de máquinas virtuales. Pinchamos sobre nueva y dejamos el panel tal y como aparece en la siguiente imagen:

<img src="http://i59.tinypic.com/2a6732e.png"></img>

Buscamos la ISO que nos acabamos de bajar y la añadimos:

<img src="http://i58.tinypic.com/9qz50z.png"></img>

Configuramos los parámetros de la RAM y la CPU, asignamos el espacio en disco y arrancamos:

<img src="http://i62.tinypic.com/aazqjp.png"></img>
