TEMA 6
=========


##Ejercicio 1##

Ya lo tenía instalado del primer tema:

![kvm](https://raw.githubusercontent.com/yonatan24891/ImagenesIV/master/kvm.bmp)


##Ejercicio 2##

Descargamos la iso de la página oficial por ejemplo de ttyLinux

Creamos fichero de almacenamiento:

`qemu-img create -f raw diskimage.img 200M`

Iniciamos la máquina especificando la iso y el fichero de almacenamiento:

`qemu-system-x86_64 -hda diskimage.img -cdrom ~/ttylinux-virtio_x86_64-16.1.iso `

![tty](https://raw.githubusercontent.com/yonatan24891/ImagenesIV/master/tty.bmp)

Otro ejemplo con Damn Small Linux:

`qemu-img create -f raw diskimage2.img 200M`

`qemu-system-x86_64 -hda diskimage2.img -cdrom ~/dsl-4.4.10.iso`

![dsl](https://raw.githubusercontent.com/yonatan24891/ImagenesIV/master/dsl.bmp)


###Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels:###

Primero instalamos virtualbox (si no lo tenesmo ya instalado):

```
echo "deb http://download.virtualbox.org/virtualbox/debian `lsb_release -sc` contrib" >> /etc/apt/sources.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -
apt-get update
apt-get install virtualbox-4.3
```

Creamos una máquina virtual:

![vbox](https://raw.githubusercontent.com/yonatan24891/ImagenesIV/master/vbox1.bmp)

Añadimos el disco con la iso en configuración y la iniciamos:

![vbox2](https://raw.githubusercontent.com/yonatan24891/ImagenesIV/master/vbox2.bmp)


##Ejercicio 4##

Creamos e iniciamos la máquina como en el ejercicio 2 esta vez con la imagen de lubuntu

La apagamos y la volvemos a iniciar con:

`qemu-system-x86_64 -boot order=c -drive file=lxde.img,if=virtio -m 512M -name debian -redir tcp:3251::22`

Tenemos que redirigir un puerto de la máquina anfitriona a un puerto de la máquina virtual.

Instalamos ssh

`apt-get update && apt-get install ssh`

Para conectarnos por ssh:

`ssh -p 3251 yonatan24891@localhost`


##Ejercicio 5##

Listamos las imagenes:

`azure vm image list`

La creamos:

`azure vm create nginx b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-13_10-amd64-server-20140129-en-us-30GB yonatan24891 <pass_WD1=> --location "West Europe" --ssh`

Nos conectamos a la máquina meduante ssh:

`ssh yonatan24891@nginx.cloudapp.net`

Instalamos nginx:

`apt-get install nginx`

Abrimos el puerto:

`azure vm endpoint create -n nginx nginx 80 80`


##Ejercicio 6##

Si no tenemos juju instalados, ejecutamos:

```
apt-get install juju-core
juju init
```

Creamos los certificados ssl:

```
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout azure.pem -out azure.pem
openssl x509 -inform pem -in azure.pem -outform der -out azure.cer
chmod 600 azure.pem
```

Modificamo es archivo ~/.juju/environments.yaml añadiendole:

management-susbscription-id: lo que devuelva: `azure account list`

management-certificate-path: ruta del fichero "azure.pem".

storage-account-name: lo que devuelva `azure storage account list`

Activamos el entorno, desplegamos y exponemos:

```
juju switch azure
juju deploy --to 0 juju-gui
juju expose juju-gui
```






