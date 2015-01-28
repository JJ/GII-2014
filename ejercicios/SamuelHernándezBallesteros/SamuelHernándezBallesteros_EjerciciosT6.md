# Tema 6: Virtualización completa: uso de máquinas virtuales.

##Ejercicio 1
Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Ya tenia KVM instalado en mi máquina.

##Ejercicio 2
Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

Con ttylinux

Creamos un disco virtual:

	qemu-img create -f qcow2 fichero-cow3.qcow2 10000M

Arrancamos la máquina

	qemu-system-x86_64 -hda fichero-cow3.qcow2 -cdrom slitaz-4.0.iso

![Qemu](http://i62.tinypic.com/21m9lyb.png)

Con SliTaz:

Creamos un disco virtual

	qemu-img create -f qcow2 fichero-cow3.qcow2 10000M

Arrancamos la máquina

	qemu-system-x86_64 -hda fichero-cow3.qcow2 -cdrom slitaz-4.0.iso

![Slitaz](http://i61.tinypic.com/30ihncw.jpg)

Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

Vmware

![Vmware1](http://i62.tinypic.com/2yu0pqf.jpg)

![Vmware2](http://i58.tinypic.com/1qpkx2.jpg)

##Ejercicio 3
Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con: qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img

Utilizamos la orden:

	qemu-system-x86_64 -boot order=c -drive file=fichero-cow2.qcow2,if=virtio

|Medición    |Real        |User       |Sys        |
| ---------- | ---------- |---------- |---------- |
| 1          | 3.532      |0.038      |3.272      |
| 2          | 3.320      |0.050      |3.540      |
| 3          | 4.576      |0.060      |3.448      |
| 4          | 5.646      |0.044      |3.324      |
| Media      | 4.264      |0.048      |3.396      |


	qemu-system-x86_64 -hda fichero-cow2.qcow2

|Medición    |Real        |User       |Sys        |
| ---------- | ---------- |---------- |---------- |
| 1          | 6.223      |0.043      |2.436      |
| 2          | 3.982      |0.010      |3.432    |
| 3          | 2.016      |0.033      |2.292      |
| 4          | 3.358      |0.042      |2.584      |
| Media      | 3.894      |0.032      |2.686      |

Como se ve en las mediciones es más rápida la segunda forma.


##Ejercicio 4
Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

Creamos la imagen:

	qemu-img create -f qcow2 lxde.img 15G

Ejecutamos:

	qemu-system-x86_64 -hda lxde.img -cdrom debian-7.7.0-amd64-netinst.iso -m 512M

##Ejercicio 5
Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

Ejecutamos la siguiente orden para ver las imagenes de ubuntu disponibles:

	azure vm image list | grep ubuntu

Podemos ver información sobre ellas ejecutando:

	azure vm image show [nombre de la imagen]

Creamos la máquina:

azure vm create samueliv b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB samueliv [PASS] --location "West Europe" --ssh

![EJ5-1](http://i60.tinypic.com/ng3dr5.jpg)

Arrancamos la máquina:

	azure vm start samueliv

Nos conectamos por ssh:

	ssh samueliv@samueliv.cloudapp.net

Actualizamos la máquina:

	sudo apt-get update && sudo apt-get ugprade

Instalamos nginx

	sudo apt-get install nginx

	sudo service nginx start

Creamos el endpoint para el puerto 80:

	azure vm endpoint create -n http samueliv 80 80

Y ya podemos acceder a través del enlace:
[Cloudapp](http://samueliv.cloudapp.net/)

##Ejercicio 6
Usar juju para hacer el ejercicio anterior.

Creamos un certificado y lo subimos a azure en la pestaña configuración. certificados de administración:

    openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout azure.pem -out azure.pem
    openssl x509 -inform pem -in azure.pem -outform der -out azure.cer
    chmod 600 azure.pem

![Certificado](http://i59.tinypic.com/1552fxd.jpg)

Editamos el archivo "environments.yaml" en /home/usuario/.juju y añadimos lo siguiente:

En la sección azure:

Añadimos "availability-sets-enabled: false" (sin comillas)
"location" pasa a "West Europe"
"manage-suscription-id" lo tomamos de azure account list
"management-certificate-path" es la ruta a nuestro ".pem", generado cuando hemos creado el certificado
"storage-account-name" ponemos el nombre de la cuenta de almacenamiento que vamos a usar (azure storage account list)

Después ejecutamos:

sudo juju switch azure
sudo juju bootstrap
sudo juju deploy --to 0 juju-gui
sudo juju expose juju-gui

##Ejercicio 7
Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.