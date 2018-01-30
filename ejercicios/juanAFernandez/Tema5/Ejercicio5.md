###Ejercicio 5

#####Instalar ceph en tu sistema operativo.

1.Instalación siguiendo el **[Quick Start](http://eu.ceph.com/docs/wip-6919/start/quick-start/)**


    sudo apt-get install ceph

El primer fichero de configuración que tendremos que manejar es **ceph.conf**,
que crearemos nostros y cuyo contenido será:

~~~bash
[osd]
osd journal size = 1000
filestore xattr use omap = true

[mon.a]
host = AnsibleServer
mon addr = 100.85.98.79:6789

[osd.0]
host = AnsibleServer

[osd.1]
host = AnsibleServer

[mds.a]
host = AnsibleServer
~~~

Este fichero configurará Ceph para operar como monitor, dos demonios OSD y un
servidor de metadatos todo en la máquina local.

2.Creamos directorios necesarios para el despliegue de los demonios.






Instlación manual
1. clonar repositorio
2. Instalar dependencias
3. Compilar (si te atreves)










Referencias:

* [IBM DeveloperWorks](http://www.ibm.com/developerworks/linux/library/l-ceph/index.html)
* [Paper White de los creadores](http://www.ssrc.ucsc.edu/Papers/weil-osdi06.pdf)
* [Arquitectura General](http://docs.ceph.com/docs/master/architecture/)
* [Caso práctico de instalación](http://switzernet.com/3/public/130925-ceph-cluster/)





#2ªToma de contacto.

##1.Ajustes previos
http://docs.ceph.com/docs/master/start/quick-start-preflight/

Recomendaciones antes de las instalaciones:
http://docs.ceph.com/docs/master/start/os-recommendations/





Todos los nodos deben tener SSH

en cada nodo hacemos un nuevo usuario:

sudo useradd -d /home/cephUser -m cephUser
sudo passwd cephUser
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully

haBILITAMOS permisos de superusuarios para estos usuarios:

echo "cephUser ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/cephUser
cephUser ALL = (root) NOPASSWD:ALL

sudo chmod 0440 /etc/sudoers.d/cephUser


Copiamos la clave ssh

$ ssh-copy-id cephUser@23.102.31.130
The authenticity of host '23.102.31.130 (23.102.31.130)' can't be established.
ECDSA key fingerprint is 94:56:f3:fb:54:d0:a7:10:06:b4:f8:60:40:35:61:65.
Are you sure you want to continue connecting (yes/no)? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
cephUser@23.102.31.130's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'cephUser@23.102.31.130'"
and check to make sure that only the key(s) you wanted were added.



##2. Proceso de instalación


Antes de nada editamos /etc/hosts en el server para que ceph-deploy pueda resolver los nombres por la ip.

ceph-deploy purgedata admin-node, node1, node2, node3
ceph-deploy forgetkeys

Hacemos al node1 monitor con `ceph-deploy new node1`

Instalamos ceph


http://docs.ceph.com/docs/master/start/quick-ceph-deploy/
