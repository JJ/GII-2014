### Ejercicio 1 ###

He comprobado que mi maquina no soporta virtualización, por lo que tendré que paravirtualizar los sistemas operativos

![captura](http://s18.postimg.org/bj7rv84jt/Screen_Shot_2015_02_03_at_17_00_13.png)

He instalado los paquetes necesarios ejectutando:

    sudo apt-get install qemu-kvm qemu-system libvirt-bin virtinst virt-manager

### Ejercicio 2 ###

He creado dos HDD virtuales para las maquinas virtuales

    qemu-img create -f qcow2 HDD1.qcow2 128M
    qemu-img create -f qcow2 HDD2.qcow2 512M

Debido a que tengo poco espacio, crearé una maquina con Damn Small Linux y otra con SliTaz

Para Damn Small Linux primero lo tenemos que descargar con:

    wget ftp://distro.ibiblio.org/pub/linux/distributions/damnsmall/current/dsl-4.4.10.iso

Una vez que tenemos la imagen, procedemos a arrancarla con:

    qemu-system-x86_64 -hda HDD2.qcow2 -cdrom dsl-4.4.10.iso &

Y vemos como se arranca:

![captura](http://s29.postimg.org/5hxl3otbr/Screen_Shot_2015_02_03_at_17_48_29.png)

Ahora descargamos y arrancamos en el HDD1 SliTaz 
Lo he descargado desde la web y arrancado con:

    qemu-system-x86_64 -hda HDD1.qcow2 -cdrom slitaz-4.0.iso

![captura](http://s9.postimg.org/wme5qa8nz/Screen_Shot_2015_02_03_at_17_53_45.png)

Hacer esto con Virtualbox o cualquier otro gestor gráfico es más intuitivo, si bien hemos visto que no es nada complicado con quemu, si es cierto que hay que estar familiarizado con la linea de comandos.

He arrancado SliTaz desde Vmware (ya que ya lo tenía instalado)

Es tan sencillo como instalar un programa de escritorio.
Me he descargado la imagen y he procedido a añadir una nueva maquina virtual. Después VMware me ha ido guiando

![captura](http://s4.postimg.org/6vk03y4zh/Screen_Shot_2015_02_03_at_17_57_36.png)
![captura](http://s4.postimg.org/bvhgbwam5/Screen_Shot_2015_02_03_at_17_57_58.png)
![captura](http://s4.postimg.org/4gs4jioql/Screen_Shot_2015_02_03_at_17_58_40.png)

### Ejercicio 4 ###
Primero he creado una disco duro virtual con la imagen de Fedora Live LXDE

qemu-img create -f qcow2 fedora-lxde.qcow2 1024M
qemu-system-x86_64 -hda fedora-lxde.qcow2 -cdrom Fedora-Live-LXDE-i686-20-1.iso -m 512M

Y la arrancamos:

qemu-system-x86_64 -boot order=c -drive file=fedora-lxde.qcow2,if=virtio -m 512M -vnc :1


### Ejercicio 5 ###

Después de configurar mi cuenta de Azure, veo que imagenes hay disponibles con:

    azure vm image list | grep Ubuntu

y me lista todas las disponibles

He elegido un servidor ubuntu 14.04

     azure vm create  MaquinaHari b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB Hari PASSWORD --location "West Europe" --ssh

![captura](http://s3.postimg.org/shn13ykib/Screen_Shot_2015_02_03_at_20_12_25.png)


    azure vm start maquinahari

Me he conectado por ssh

    ssh Hari@maquinahari.cloudapp.net

Instalo nginx

    sudo apt-get update
    sudo apt-get install nginx
    sudo service nginx start

[Aqui se puede visitar mi maquina virtual](http://maquinahari.cloudapp.net/)

### Ejercicio 6 ###

He seguido [estas instrucciones](https://juju.ubuntu.com/docs/config-azure.html) para configurar juju con azure

Primero he generado el archivo de configuración con:

    juju generate-config

Sin embargo me ha advertido que ya lo tenía generado de antes

Usando el comando juju generate-config --show he podido ver que mi archivo está como indica el tutorial, y que tengo que cambiar por los datos reales de mi cuenta

![captura](http://s17.postimg.org/mtnllktzz/Screen_Shot_2015_02_04_at_17_29_17.png)

He generado el certificado con el comando:

    openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout azure.pem -out azure.pem
    openssl x509 -inform pem -in azure.pem -outform der -out azure.cer
    chmod 600 azure.pem

Donde se me ha hecho un interrogatorio...
![caputura](http://s23.postimg.org/lf7m1ekzf/Screen_Shot_2015_02_04_at_17_41_58.png)

Luego lo he subido:
![captura](http://s23.postimg.org/4derzb64b/Screen_Shot_2015_02_04_at_17_41_42.png)

Por último he tenido que conseguir la información de mi:
* SUBSCRIPTION ID utilizada para el management-subscription-id
* El certificado que he subido lo he usado para el management-certificate-path
* He añadido una url para el storage-account-name
* He seleccionado la localización y la subscripción

Después he ejecutado 

    juju deploy

Sin embargo me ha dado un error, después de buscar un poco por internet me he dado cuenta de que me faltaba ejecutar

   juju bootstrap

Por último
   
    juju expose

