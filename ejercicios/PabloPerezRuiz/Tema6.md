##TEMA 6: Virtualización completa: uso de máquinas virtuales
###Ejercicio 1: 
####Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Comprobamos que lo teniamos previamente iinstalado:

![IMAGEN1](http://i58.tinypic.com/ebef60.jpg)

###Ejercicio 2
#####1. Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).
#####2. Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

Voy a instalar SliTaz, para ello accedemos a la web oficial para su descarga:

[SliTaz](http://http://www.slitaz.org/es/get/#stable)

Creamos un disco duro virtual:

	qemu-img create -f qcow2 imagen2Act2.qcow2 10000M

y arrancamos KVM haciendo:

	qemu-system-x86_64 -hda imagen2Act2.qcow2 -cdrom slitaz-4.0.iso

Con lo que el instalador empezara a funcionar:

![IMAGEN2](http://i62.tinypic.com/r1k1s3.jpg)

![IMAGEN3](http://i58.tinypic.com/116kz8y.jpg)

Comprobamos que esta ejecutandose:

![IMAGEN4](http://i58.tinypic.com/4t92xz.jpg)

Ahora instalare ttylinux. Creo el disco duro:

	qemu-img create -f qcow2 imagen2Act3.qcow2 10000M

Y hacemos:

	qemu-system-x86_64 -hda imagen2Act3.qcow2 -cdrom ttylinux-pc_x86_64-2015.01.iso

![IMAGEN5](http://i61.tinypic.com/2w21nuu.jpg)

Ahora instalare SliTaz con VirtualBox. Simplemente seleccionamos el archivo de imagen y seguimos los pasos:

![IMAGEN6](http://i59.tinypic.com/2ex2bz4.jpg)

Ya esta instalada:

![IMAGEN7](http://i60.tinypic.com/5zk61d.jpg)

###Ejercicio 3
####Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con: qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img

Para ello hacemos:

	qemu-system-x86_64 -boot order=c -drive file=fichero-cow2.qcow2,if=virtio

|Medición    |Real        |User       |Sys        |
| ---------- | ---------- |---------- |---------- |
| 1          | 3.535      |0.037      |3.272      |
| 2          | 3.549      |0.048      |3.540      |
| 3          | 4.754      |0.060      |3.448      |
| 4          | 5.674      |0.044      |3.324      |
| Media      | 4.627	  |0.062      |3.396      |


	qemu-system-x86_64 -hda fichero-cow2.qcow2

|Medición    |Real        |User       |Sys        |
| ---------- | ---------- |---------- |---------- |
| 1          | 6.223      |0.043      |2.436      |
| 2          | 3.982      |0.010      |3.432    |
| 3          | 2.016      |0.033      |2.292      |
| 4          | 3.358      |0.042      |2.584      |
| Media      | 3.894      |0.032      |2.686      |

Obsvervamos que la más rapida es la segunda.

###Ejercicio 4
####Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

Para ello en primer lugar creamos la imagen:

	qemu-img create -f qcow2 lxde.img 20G

Y hacemos:

	qemu-system-x86_64 -hda lxde.img -cdrom debian-7.7.0-amd64-netinst.iso -m 512M

###Ejercicio 5
####Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

Ejecuto:

	azure vm image list | grep Ubuntu 
y nos lista las maquinas virtuales disponibles con Ubuntu.

He elegido la version:
	b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu_DAILY_BUILD-trusty-14_04_1-LTS-amd64-server-20150123.1-en-us-30GB

b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB

Ahora la creo haciendo:

	azure vm create ppruiz b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB ppruiz PASSWORD --location "West Europe" --ssh

Arranco la maquina con:

	azure vm start ppruiz

Me conecto por ssh:

	ssh ppruiz@ppruiz.cloudapp.net

![IMAGEN8](http://i59.tinypic.com/ohnzmb.jpg)

La actualizo:

	udo apt-get update && sudo apt-get ugprade

Instalo nginx:

	sudo apt-get install nginx

	sudo service nginx start

Creo el endpoint para el puerto 80:

	azure vm endpoint create -n http ppruiz 80 80

Pero finalmente me da un error. Si no me lo diera, solo nos quedaria acceder a ella:

http://ppruiz.cloudapp.net/

### Ejercicio 6
####Usar juju para hacer el ejercicio anterior

Creamos un certificado azure.cer que subiremos a Azure desde la web (Certificados de Administracion/Configuracion):

	openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout azure.pem -out azure.pem
	openssl x509 -inform pem -in azure.pem -outform der -out azure.cer
	chmod 600 azure.pem

![IMAGEN9](http://i61.tinypic.com/2h6a7wp.jpg)

Editamos el fichero "environments.yaml" de home/usuario/.juju

En la seccion Azure editamos lo siguiente:

	Añadimos availability-sets-enabled: false 
    location pasa a West Europe
    manage-suscription-id lo tomamos de azure account list
    management-certificate-path (que es la ruta de nuestro .pem)
    Y en storage-account-name ponemos nuestra azure storage account list

Y hacemos:

	sudo juju switch azure
    sudo juju bootstrap
    sudo juju deploy --to 0 juju-gui
    sudo juju expose juju-gui


