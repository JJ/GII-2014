# Segunda parte de los ejercicios
## Tema 5 Almacenamiento
### Ejercicio 1
En el portatil el disco duro es un SSD con particiones de recuperacion, boot y Windows.
En el de sobremesa hay un SSD con particion Windows y Linux y un HDD mecánico con una particion para datos.
Los ordenadores de la facultad usan un sistema de archivos remoto NFS.

SAN comercial de Dell:
http://www.dell.com/us/business/p/storage-san
6581,92 $

NAS local, FreeNAS Mini
http://www.amazon.com/FreeNAS-Mini-Network-Attached-Diskless/dp/B00EQJ1BTU

995 $

### Ejercicio 2

Inicializamos el bash de nuestra maquina virtual.
` sudo docker run -i -t ubuntu /bin/bash `

Instalamos FUSE.
`sudo apt-get install sshfs`
Añadimos nuestro usuario.
`sudo usermod -a -G fuse pablo`

Tratamos de conectarnos.
`sshfs pablo@172.17.0.2:/ /mnt/prueba`

![Imgur](http://i.imgur.com/RWK8KJI.png)

Nos da error que no he podido resolver.

### Ejercicio 3

Primero creamos el fichero vmdk.

`sudo qemu-img create -f vmdk prueba.vmdk 2M`

Luego creamos un archivo con el formato qcow2.

`sudo qemu-img create -f qcow2 pruebacow.qcow2 2M`

No se pueden montar debido a que no tienen formato,le damos formato:

`sudo apt-get install btrfs-tools`

Le damos formato btrfs

`sudo mkfs.btrfs -f /dev/loop1`

### Ejercicio 4

Creamos el fichero

`qemu-img create -f raw fichero-xfs.img 100M`

Bucle

`sudo losetup -v -f fichero-xfs.img`
Formato xfs

`sudo mkfs.xfs /dev/loop2`

Lo montamos

`sudo mount /dev/loop2 /mnt/loop2`

### Ejercicio 5

Instalamos con:

`sudo apt-get install ceph-mds`

### Ejercicio 6

Crear directorios

`sudo mkdir -p /srv/ceph/{osd,mon,mds}`

Fichero configuración

![Imgur](http://i.imgur.com/1yh8Cqy.png)

```
[global]
log file = /var/log/ceph/$name.log
pid file = /var/run/ceph/$name.pid
[mon]
mon data = /srv/ceph/mon/$name
[mon.mio]
host = ubuntu
mon addr = 127.0.0.1:6789
[mds]
[mds.mio]
host = ubuntu
[osd]
osd data = /srv/ceph/osd/$name
osd journal = /srv/ceph/osd/$name/journal
osd journal size = 1000 ; journal size, in megabytes
[osd.0]
host = ubuntu
devs = /dev/loop0

```

Iniciamos:
![Imgur](http://i.imgur.com/htV8fdr.png)

### Ejercicio 7

Se haría con :

` sudo rados mkpool piscina `

y almacenamos algo:

` sudo rados put -p piscina obj prueba `

### Ejercicio 8

Como estamos utilizando nodejs para el proyecto ya esta instalano npm. Instalamos
`sudo npm install -g azure-cli `

`azure account download`

Abrimos la URL y el fichero descargado lo importamos.

`azure account import nombredelfichero`

## Virtualización completa: Uso de maquinas virtuales

### Ejercicio 1
![Imgur](http://i.imgur.com/PvozGRv.png)

### Ejercicio 2

Hacemos 

` wget http://ttylinux.net/Download/ttylinux-pc_x86_64-16.1.iso.gz `

`gunzip ttylinux-pc_x86_64-16.1.iso.gz`

Creamos el disco de 500 MB:
`qemu-img create -f qcow2 cow-file.qcow2 500M`

Usamos la opción -curses porque daba un error de SDL.
`qemu-system-x86_64 -curses -hda cow-file.qcow2 -cdrom ttylinux-pc_x86_64-16.1.iso `

![Imgur](http://i.imgur.com/pi909y5.png)

` wget http://mirror.slitaz.org/iso/4.0/slitaz-4.0.iso `

Creamos el disco de 500 MB:
`qemu-img create -f qcow2 cow-file2.qcow2 500M`

Usamos la opción -curses porque daba un error de SDL.
`qemu-system-x86_64 -curses -hda cow-file2.qcow2 -cdrom slitaz-4.0.iso `

![Imgur](http://i.imgur.com/o5w2Epg.png)

### Con VirtualBox

Descargamos la imagen, creamos una nueva maquina virtual.

![Imgur](http://i.imgur.com/ZExZzth.png)

Asignamos memoria RAM a la maquina virtual y creamos un disco duro virtual.

Al iniciarla le damos la ruta donde tenemos la imagen descargada.

![Imgur](http://i.imgur.com/WatqSwp.png)

Se inicia e instalamos normalmente.
### Ejercicio 3
Creamos un script, le damos permisos.

![Imgur](http://i.imgur.com/IShCBpd.png)

Ejecutamos y comprobamos el tiempo.

![Imgur](http://i.imgur.com/julvRkx.png)

### Ejercicio 4

Nos bajamos la imagen debian netinst con

`wget http://cdimage.debian.org/debian-cd/7.8.0/amd64/iso-cd/debian-7.8.0-amd64-netinst.iso`

Creamos el disco con
`qemu-img create -f qcow2 cow-file3.qcow2 1000M`

`qemu-system-x86_64 -vnc :1 -hda cow-file3.qcow2 -cdrom debian-7.8.0-amd64-netinst.iso -m 512M`
![Imgur](http://i.imgur.com/lVYFLiw.png)

Si abrimos otra terminal podemos comprobar que el servidor vnc está en uso por la maquina que hemos creado.

![Imgur](http://i.imgur.com/s9ozwIA.png)


### Ejercicio 5

`azure vm image list | grep Ubuntu`
la primera instrucción nos muestra la lista de imagenes para instalar, y como nos piden Ubuntu filtramos por Ubuntu.

`azure vm create maquinaIV b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu_DAILY_BUILD-trusty-14_04-LTS-amd64-server-20131221-en-us-30GB pablo (password) --location "West Europe" --ssh`

`azume vm list` listamos la maquina por si ya se nos ha olvidado el nombre que le habiamos puesto y arrancamos con `azure vm start maquinaIV`

Nos conectamos por ssh e instalamos nginx `sudo apt-get install nginx`

Creación del endpoint.
`azure vm endpoint create -n http maquinaIV 80 80`

## Tema 7 Gestión de configuraciones

### Ejercicio 1

Instalamos con

`wget  https://www.opscode.com/chef/install.sh `
`sudo bash install.sh `

![Imgur](http://i.imgur.com/TcjClcS.png)

### Ejercicio 2

Ejecutando cheff:

![Imgur](http://i.imgur.com/h3esBIb.png)

Como ya habia comprobado antes que la receta funcionaba (y tengo vim instalado) el fichero y el directorio no los crea ni instala vim, pero si instala nginx.

Ficheros de configuración:

![Imgur](http://i.imgur.com/vEdLlbX.png)

![Imgur](http://i.imgur.com/uQX20O2.png)

![Imgur](http://i.imgur.com/wzrk9hx.png)

### Ejercicio 3

```
uno:  dos
tres: 
  - [4,5,Seis, [Siete: 8, [nueve: [10, 11] ]] ]
```

### Ejercicio 4

Instalamos Ansible añadiendo sus repositorios y con apt-get.

Creamos el inventario:
```
[local]
192.168.56.101
```
Exportamos la variable de entorno:

`export ANSIBLE_HOSTS=~/ansible_hosts`

Desplegamos
```
ansible local -u pablo -m git -a "repo=https://github.com/ramako/IV.git dest=~/practicas version=HEAD" 
```
### Ejercicio 5

Un playbook de ansible es como una receta de Chef.

```
---
- hosts: azure
  sudo: yes
  remote_user: pablo
  tasks:
    - name: instalar python y easy install 
      apt: name=build-essential state=present
      apt: name=python-dev state=present
      apt: name=python-setuptools state=present
    - name: instalar build-essentials
      apt: name=build-essential state=present
    - name: Instalar MongoDB
      apt: name=mongodb-server state=present
    - name: Instalar web.py
      command: easy_install web.py 
```
Necesitamos instalar web.py por lo que necesitamos easy install.

`ansible-playbook nombre_fichero.yml --ask-pass`

### Ejercicio 6

Instalamos Vagrant desde la web con wget y luego con dpkg.

Seleccionamos Debian de la lista.

`vagrant init puphpet/debian75-x64`

![Imgur](http://i.imgur.com/BJysSYu.png)

![Imgur](http://i.imgur.com/p5iN0Ua.png)

Usamos `vagrant up` para iniciar la máquina.

### Ejercicio 7

![Imgur](http://i.imgur.com/ECfS4q1.png)

Y ejecutamos `vagrant provison`
