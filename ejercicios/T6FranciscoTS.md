#TEMA 6: Virtualización completa: uso de máquinas virtuales#

##Ejercicio 1##

#####Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.#####

El comando para comprobar si podmeos usar KVM es:

```shell
kvm-ok
```

Se comprobará si existe /dev/kvm si nos devolverá un mensaje indicando si podemos usar o no la aceleración KVM.


##Ejercicio 2##

#####1. Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).#####
#####2. Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.#####

He creado una máquina virtual con ttyLinux:

+ [He descargado la imagen de la web oficial ](http://ttylinux.net/Download/ttylinux-pc_x86_64-16.1.iso.gz)
+ He creado un nuevo disco virtual con ``qemu-img create -f qcow2 fichero-cow.qcow2 10000M``
+ He arrancado la máquina virtual desde la imagen para instalarla en el disco con ``qemu-system-x86_64 -hda fichero-cow.qcow2  -cdrom ttylinux-pc_x86_64-16.1.iso``

Con Debian:

+ [He descargado la imagen de la web oficial ](http://cdimage.debian.org/debian-cd/7.7.0/amd64/iso-cd/debian-7.7.0-amd64-netinst.iso)
+ He creado un nuevo disco virtual con ``qemu-img create -f qcow2 fichero-cow2.qcow2 10000M``
+ He arrancado la máquina virtual desde la imagen para instalarla en el disco con ``qemu-system-x86_64 -hda fichero-cow.qcow2  -cdrom debian-7.7.0-amd64-netinst.iso``

Y con SliTaz:

+ [He descargado la imagen de la web oficial ](http://mirror.slitaz.org/iso/4.0/slitaz-4.0.iso)
+ He creado un nuevo disco virtual con ``qemu-img create -f qcow2 fichero-cow3.qcow2 10000M``
+ He arrancado la máquina virtual desde la imagen para instalarla en el disco con ``qemu-system-x86_64 -hda fichero-cow3.qcow2  -cdrom slitaz-4.0.iso``

El otro hipervisor que he utilizado es VMWare

+ [Se descarga de la web oficial](https://my.vmware.com/web/vmware/free#desktop_end_user_computing/vmware_player/7_0) (se puede utilizar siempre y cuando no sea para uso comercial)
+ Se instala, ejecutando ``sh VMware-Player.bundle``
+ Pulsamos sobre "Create a new virtual machine" y se nos abrirá un asistente. Deberemos seleccionar el fichero de imagne desde el que queramos instalar.
+ Al darle a siguiente, elegimos el tipo de SO que vamos a instalar. Depués, elegiremos dónde queremos guardar nuestra máquina virtual
+ Crearemos un nuevo disco virtual, seleccionando tamaño y tipo de almacenamiento (un fichero solo o varios)
+ Finalmente, iniciamos la máquina virtual


##Ejercicio 4##

#####Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.#####

Primero he creado la imagen con 

```shell 
qemu-img create -f qcow2 lxde.img 15G
```

Después he ejecutado la:

```shell 
qemu-system-x86_64 -hda lxde.img -cdrom debian-7.7.0-amd64-netinst.iso -m 512M
```

Aunque Debian 7 viene con Gnome, se puede instalar (incluso antes de instalar el sistema operativo) otro entorno de escritorio.
Para ello, seguimos los siguientes pasos.

Accedemos a la instalación y vamos a "Advanced options" después, vamos a "Alternative desktop environments" seleccionamos LXDE e instalamos y al terminar de instalar, ya tendremos nuestro Debian con LXDE. Salimos de la máquina y la arrancamos ejecutando: 

```shell
qemu-system-x86_64 -boot order=c -drive file=lxde.img,if=virtio -m 512M -name debian -vnc :1
```

Se quedará en ejecución sin abrir ninguna ventana ni nada. En otro terminal, tendremos que ver, usando "ifconfig" la dirección de la interfaz a la que tenemos que conectarnos.

QUEMU no permite más conexión que la procedente desde Internet. Para habilitarla, deberemos añadir un nuevo parámetro cuando arranquemos la máquina (que servirá para redirigir un puerto de la máquina anfitriona a un puerto de la máquina virtual).

```shell 
qemu-system-x86_64 -boot order=c -drive file=lxde.img,if=virtio -m 512M -name debian -redir tcp:4664::22
```

Una vez que hayamos iniciado la máquina virtual, instalamos en la misma SSH (como no he añadido mi usuario a "sudoers", ejecuto como root):

```shell
apt-get update && apt-get install ssh
```

y en la máquina anfitriona: 

```shell
ssh -p 4664 toranzo@localhost
```

Tras aceptar la clave y escribir la contraseña, nos habremos conectado.


##Ejercicio 5##

#####Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.#####

Ejecuando: 

```shell 
azure vm image list | grep Ubuntu
``` 

Obtenemos todas las imágenes Ubuntu disponibles. Voy a instalar la imagen " b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB". Podemos ver información sobre ella ejecutando: 

```shell
azure vm image show b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB
```

Creamos la máquina con:

```shell
azure vm create toranzo b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB toranzo [PASS] --location "West Europe" --ssh
```

Con nombre y usuario toranzo, la imagen que se ha indicado antes, una contraseña, localización en el este de Europa y uso de SSH. Es importante que hayamos creado antes el almacenamiento (con el mismo nombre de la VM) ya que puede dar algunos problemas.


Después podremos ver algunos detalles de las máquinas que tengamos creadas utilizando: 

```shell
azure vm list
```

La arrancamos con: 
```shell
azure vm start toranzo
``` 

Y nos conectamos con: 

```shell
ssh toranzo@toranzo.cloudapp.net
```

Una vez nos encontremos dentro, ejecutamos: 

```shell
sudo apt-get update && sudo apt-get ugprade
``` 
Para que se actualice la imagen y los repositorios. Después, instalamos el servidor ejecutnado:

```shell 
sudo apt-get install nginx
```
Cuando finalice la instalación, iniciamos el servidor:

```shell
sudo service nginx start
``` 

Si nginx no indica ningun mensaje comprobamos su estado mediante el comando 

```shell
sudo service nginx status
```

Ahora solo falta crear el "endpoint". En una terminal local, ejecutamos 

```shell
azure vm endpoint create -n http toranzo 80 80
```

Y ya podremos acceder a nuestra web.


##Ejercicio 6##

#####Usar juju para hacer el ejercicio anterior#####

En primer lugar, es necesario crear  un certificado. Para ello, en terminal, escribimos:

```shell
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout azure.pem -out azure.pem
openssl x509 -inform pem -in azure.pem -outform der -out azure.cer
chmod 600 azure.pem
```

Subimos el certificado a Azure (desde la interfaz web), en la pestaña "Certificados de administración", dentro de "Configuración".Ahora hay que editar el fichero "environments.yaml" (dentro de la carpeta /home/usuario/.juju)

Hay que editar varios parámetros (en la sección Azure):
+ Añadimos "availability-sets-enabled: false" (sin comillas)
+ "location" pasa a "West Europe"
+ "manage-suscription-id" lo tomamos de ``azure account list``
+ "management-certificate-path" es la ruta a nuestro ".pem", generado cuando hemos creado el certificado
+ "storage-account-name" ponemos el nombre de la cuenta de almacenamiento que vamos a usar (``azure storage account list``)

Y ejecutamos los siguientes comandos:

```shell
sudo juju switch azure
sudo juju bootstrap
sudo juju deploy --to 0 juju-gui
sudo juju expose juju-gui
```

Comprobamos si se ha realizado todo correctamente ejecutando 

```shell
sudo juju status
```

Accedemos a la dirección que se nos indica.

Hay dos opciones para activar NGINX:
+ En el menú de la izquierda buscamos "nginx", lo seleccionamos y marcamos que sea expuesto. Se quedará en amarillo. Yo no he conseguido hacerlo así.
+ Mediante consola de comandos:

```shell
sudo juju deploy --to 0 cs:~hp-discover/trusty/nginx-4
sudo expose nginx
```


##Ejercicio 7##

#####Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.#####

Descargaremos la ISO de [Linux Mint](http://www.linuxmint.com/download.php). Esta vez usaremos un gestor de máquinas virtuales más intuitivo, previa instalación de Xen:

```shell
sudo apt-get install xen-hypervisor-4.4-amd64 bridge-utils virtinst
```

A continuación:

```shell
sudo apt-get install virt-manager
virt-manager lvm2 qemu-system
```
