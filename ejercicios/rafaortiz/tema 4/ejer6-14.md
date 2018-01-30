# Ejercicio 6
# Instalar juju.
# Usándolo, instalar MySQL en un táper.
instalamos juju y iniciamos cambiamos el archivo yaml para trabajar en local, instalamos mondodb que es necesario
sudo apt-get install mongodb-server

juju bootstrap
juju deploy mysql
comprobamos con juju status
![Imgur](http://i.imgur.com/nyg0jeM.png)
borramos todo con juju destroy-unit mysql/0
juju destroy-machine 1
![Imgur](http://i.imgur.com/uCtwoEY.png)
al crear de nuevo una maquina con juju add-machine, se crea con la configuracion de la ultima maquina borrada.
Esta ya trae mysql, para instalarle tambien mediawiki 
sudo juju deploy mediawiki
sudo juju add-realtion mediawiki:slave mysql:db
![Imgur](http://i.imgur.com/xzQj3ul.png)

scritp
> #!/bin/bash
sudo add-apt-repository ppa:juju/stable
sudo apt-get update && sudo apt-get install juju-core
sudo juju init
sudo gedit $HOME/.juju/environments.yaml
Comentar #default:amazon y escribir default:local
sudo juju switch local
sudo apt-get install mongodb-server
sudo juju deploy mediawiki
sudo juju deploy mysql
sudo juju add-relation mediawiki mysql
sudo juju expose mediawiki
sudo juju status
#Ejercicio 8
#Instalar libvirt.
sudo apt-get install kvm libvirt-bin
sudo adduser $USER libvirtd
sudo apt-get install virtinst 
#Ejercicio 9
#Instalar un contenedor usando virt-install.
sudo virt-install -n web_devel -r 256 --disk /var/lib/libvirt/images/web_devel.img,size=4 -c Escritorio/ubuntu12-4.iso --accelerate --network network=default,model=virtio --vnc --noautoncosole -v
![Imgur](http://i.imgur.com/Ox9LaaK.png)
para ver su estado
sudo virsh -c qemu:///system list
![Imgur](http://i.imgur.com/WmwAgjM.png)
para ver la maquina con entorno grafico instalamos
sudo apt-get install virt-manager
sudo apt-get install virt-viewer
y usamos el virt-viewer
sudo virt-viewer web_devel
![Imgur](http://i.imgur.com/jFnVT5X.png)
#Ejercicio 10. Instalar docker.
sudo apt-get update
sudo apt-get install docker.io
source /etc/bash_completion.d/docker.io
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F96
sudo sh -c "echo deb https://get.docker.com/ubuntu docker main > 
/etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get install lxc-docker, aqui me da un error no encuentra para instalar esto con ubuntu 14.4 de 32 bits en un i7.
![Imgur](http://i.imgur.com/6OLdZgy.png)
![Imgur](http://i.imgur.com/hGoKz4K.png)
Ni realizando los pasos que hay en el enlace de material adicional de github funciona, he leido que en sistemas intel de 32bits no va bien tampoco.
#Ejercicio 11. Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS. Buscar e instalar una imagen que incluya MongoDB.
#Ejercicio 12. Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.
#Ejercicio 13. Crear a partir del contenedor anterior una imagen persistente con commit.
#Ejercicio 14. Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

