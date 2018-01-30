#TEMA 1

## Ejercicio 1
[Fujitsu Primergy TX100 Xeon E3-1220/8GB/1TB](http://www.pccomponentes.com/fujitsu_primergy_tx100_xeon_e3_1220_8gb_1tb.html?gclid=CJmasoPrhsECFVDItAod5woAtA) Tiene un precio de venta al publico de 599€.
Si elegimos una amortizacion del 12%,teniendo en cuenta que el porcentaje maximo es de 26% en un pediodo de tiempo de 10 como maximo.[Fuente de informacion](http://www.gabilos.com/webcontable/amortizacion/estimacion_directa_simplificada.htm)

*En 4 años se tendra que aplicar un 25% para amortizar el pc. Cuota anual: 149 €

*En 7 años se tendra que aplicar un 14,28% para amortizar el pc. Cuota anual : 85.36 €

Pero si elegimos un 12% de amortizacion el ordenador llegara a su amortizacion total en 8 años 4 meses y 12 dias (( 599x0,12)x8,34= 599,47€)


## Ejercicio 2
Vamos a realizar una comparacion entre un servicio de alojamiento en un servidor y alojamiento en un servidor cloud.Segun la web de [Arsys](http://www.arsys.es/hosting?gclid=CPKFjcPelcECFQ3LtAodyVEA4w) obtenemos ambos precios para unas caracteristicas de 6 cores , 8 Gb de Ram y 600 Gb de almacenamiento.

*Servidor Dedicado 225€/mes o 2700€/año.
*Servidor Cloud 285€/mes o 3420€/año.

-Si vemos el precio para un 1% de tiempo usado.

*Servidor Dedicado 27€/año.
*Servidor Cloud 34.2€/año.

-Pero si se usara un 10% del tiempo.

*Servidor Dedicado 270/año.
*Servidor Cloud 342€/año.

##Ejercicio 3.2

Realizamos un script sencillo para realizar una [suma](http://imgur.com/R7GIvGx).Seguidamente con CDE [empaquetamos](http://imgur.com/96CUB6p) el programa y finalmente lanzamos el archivo que se nos creo en la carpeta cde-package para ver si se [ejecuta](http://imgur.com/8oreLxN) sin necesidad de tener instalado python en otra maquina.

##Ejecicio 4

Realizamos el tutorial para comprender el funcionamiento de [docker](http://imgur.com/9kgsvVD) en lenguaje de comandos.

##Ejercicio 5

Instalamos el sistema de gestion de fuentes [git](http://imgur.com/vMqcjaM).

##Ejercicio 6

Creamos un que lo llamaremos Practica y lo descargaremos con git teniendo en cuenta que dicho proyecto debe contener el fichero README.Seguidamente [modificaremos](http://imgur.com/qCVnsAY) el fichero README y actualizamos obteniendo del siguiente [resultado](http://imgur.com/ixOkHtU)

##Ejercicio 7

Comprobamos si en la instalacion se encuentra instalado [cgroups](http://imgur.com/kRI8qFa),y en caso contrario lo montaremos.Una vez realizado el paso anterior procedemos a comprobar el contenido.

##Ejercicio 10

Comprobamos los flags, el tipo de procesador y el resultado a la orden realizada.

-¿Que modelo de procesador es?
  model name	: Intel(R) Core(TM)2 Duo CPU     T6600  @ 2.20GHz

-¿Cual es el resultado a la orden?
  flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constant_tsc arch_perfmon pebs bts rep_good aperfmperf pni dtes64 monitor ds_cpl est tm2 ssse3 cx16 xtpr pdcm sse4_1 xsave lahf_lm

##Ejercicio 11

Comprobamos si el modulo para kvm-ok esta instalado en nuestro sistema,obteniendo el siguiente resultado:

miguel@ubuntu:~$ kvm-ok INFO: Your CPU does not support KVM extensions
KVM acceleration can NOT be used


#TEMA 2

## Ejercicio 1
**Instalar un entorno virtual para tu lenguaje de programación favorito (uno de los mencionados arriba, obviamente).**
Instalamos virtualenv desde consola siguiendo los siguientes pasos:

![Paso 1](http://i.imgur.com/b4P7ncJ.jpg)
Instalamos virtualenv...
![Paso 2](http://i.imgur.com/4Lwfky8.jpg)
Comprobamos que funciona realizando un test...
![Paso 3](http://i.imgur.com/RLgnNdC.jpg)


## Ejercicio 2
**Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu u OpenShift.**
Nos damos de alta en OpenShift siguiendo los pasos:
Realizamos el registro en la web de [Openshift](https://www.openshift.com/)
![imagen2-1](http://i.imgur.com/II0ELuU.jpg)


## Ejercicio 3
**Crear una aplicación en OpenShift y dentro de ella instalar WordPress.**
Para crear la aplicacion clicamos en "Create my first app".
![imagen3-1](http://i.imgur.com/5vQugDx.jpg)
Una vez buscada la aplicacion de wordpress las configuramos.
![imagen3-2](http://i.imgur.com/GuhWpYJ.jpg)
Nos saldra una ventana donde podremos observar que nuestra aplicacion se ha creado correctamente.
![imagen3-3](http://i.imgur.com/Judnbcr.jpg)
Introducimos los datos para wordpress.
![imagen3-4](http://i.imgur.com/iSM6F6c.jpg)
Mensaje de bienvenida a WordPress.
![imagen3-5](http://i.imgur.com/CyQDKso.jpg)

## Ejercicio 4

**Crear un script para un documento Google y cambiarle el nombre con el que aparece en el menú, así como la función a la que llama.**
En primer lugar siguiendo el [tutorial](https://developers.google.com/apps-script/guides/menus#custom_menus_in_google_docs_sheets_or_forms) para la creacion y modificacion de menu creamos archivo de tipo documento para codigo en google app y desde el menu herramientas clicaremos en la opcion "Editor de secuencias de Comandos".Una vez ahi podremos trabajas con el codigo que os muestro a continuacion sacado del tutorial.

![imagen4-1](http://i.imgur.com/vD9Kjc0.jpg)

## Ejercicio 5
**Buscar un sistema de automatización de la construcción para el lenguaje de programación y entorno de desarrollo que usemos habitualmente.**
Realizando la siguiente busqueda en google "Build automation python" nos encontramos una [wiki de python](https://wiki.python.org/moin/ConfigurationAndBuildTools) en la que nos habla de los distintos sistemas de construccion para este lenguaje.

Donde nos encontramos con [Buildit](https://software.agendaless.com/Members/chrism/software/buildit/README.txt)como el sistema mas sencillo y facil de usar.

## Ejercicio 6
**Identificar, dentro del PaaS elegido o cualquier otro en el que se dé uno de alta, cuál es el fichero de automatización de construcción e indicar qué herramienta usa para la construcción y el proceso que sigue en la misma.**

Para identificar el fichero de automatizacion de mi aplicacion openshift he seguidos los pasos del siguiente [tutorial](https://developers.openshift.com/en/getting-started-client-tools.html#ubuntu)
En primer lugar debemos instalar ruby para poder trabajar.
![imagen6-1](http://i.imgur.com/l7nBc4A.png)

Despues he tenido que instalar la herramienta para poder trabajar con openshift
![imagen6-2](http://i.imgur.com/3PQQ1Vz.png)
Para acceder a nuestras aplicaciones hacemos "rhc apps"pero nos pide identificarnos
una vez realizada la autentificacion para acceder a nuestra cuenta.
Clonamos nuestra aplicacion a nuestro equipo con git clones +"URL" 
y en la siguiente ruta "cd wordpress/.openshift/action_hooks" estara nuestro fichero build como podeis ver en la imagen.
![imagen6-3](http://i.imgur.com/3euGPBp.png)
Clonamos nuestra aplicacion a nuestro equipo con git clones +"URL" 
y en la siguiente ruta "cd wordpress/.openshift/action_hooks" estara nuestro fichero build como podeis ver en la imagen.
![imagen6-4](http://i.imgur.com/SpQFA0p.png)


#TEMA 3

##Ejercicio 1
**Crear un espacio de nombres y montar en él una imagen ISO de un CD de forma que no se pueda leer más que desde él. Pista: en ServerFault nos explican como hacerlo, usando el dispositivo loopback**

Primero realizamos el espacio de nombre con

```sh
sudo unshare -u /bin/bash

hostname hola_k_ase
``` 
![imagen4-1](http://i.imgur.com/4yuapgy.png)
![imagen4-2](http://i.imgur.com/hZAzTXs.png)

##Ejercicio 2
** Mostrar los puentes configurados en el sistema operativo**

Para mostrar los puntes configurados usamos el comando:
```sh
ip addr show
```
![imagen4-3](http://i.imgur.com/M8wGY7L.png)

** Crear un interfaz virtual y asignarlo al interfaz de la tarjeta wifi, si se tiene, o del fijo, si no se tiene**
Primero necesitaremos instalar el paquete bridge-utils
```sh
sudo apt-get install bridge-utils
```
y con el siguiente comando asignamos nuevo nombre a la nueva interfaz.
```sh
sudo brctl addif miwel eth0
```
![imagen4-5](http://i.imgur.com/PR6ofil.png)

##Ejercicio 3
** Usar debootstrap (o herramienta similar en otra distro) para crear un sistema mínimo que se pueda ejecutar más adelante**
 
Primero antes de nada instalamos dicha herramienta.
```sh
sudo apt-get install debootstrap
```
y acontinuacion creamos el sistema 
```sh
sudo debootstrap --arch=amd64 lucid /home/jaulas/lucid/ http://archive.ubuntu.com/ubuntu
```
![imagen4-6](http://i.imgur.com/XfsHx8a.png)
mostrando la verificacion

** Experimentar con la creación de un sistema Fedora dentro de Debian usando Rinse**
 
Instalamos rinse
```sh
sudo apt-get install rinse
```
y acontinuacion creamos el sistema 
```sh
sudo rinse --arch=amd64 --distribution-centos-6 --directory /home/jaulas/centos
```

##Ejercicio 4
**Instalar alguna sistema debianita y configurarlo para su uso. Trabajando desde terminal, probar a ejecutar alguna aplicación o instalar las herramientas necesarias para compilar una y ejecutarla**



##Ejercicio 5
**Instalar una jaula chroot para ejecutar el servidor web de altas prestaciones nginx**

En primer lugar instalamos curl.
```sh
sudo apt-get install curl
```
acontinuacio realizamos la instalacion de nginx

```sh
sudo apt-get install nginx
```
y finalmente lo lanzamos y comprobamos el host local.
![imagen4-7](http://i.imgur.com/WRCfsyj.png)

##Ejercicio 6
**Crear una jaula y enjaular un usuario usando `jailkit`, que previamente se habrá tenido que instalar**

#TEMA 4

##Ejercicio 1
**Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.**

Instalamos lxc desde los repositorios

```sh
sudo apt-get install lxc lxctl lxc-templates
```

una vez instalado comprobamos que esta todo preparado para comenzar a trabajar con el.

![imagen_4.1](http://i.imgur.com/0nvM6vs.png)

Una vez comprobado que todos los componentes estan en estado "enabled" podemos trabajar con lxc.

Creamos un contenedor.

```sh
sudo lxc-create -t ubuntu -n una-caja
```
una vez crear la iniciamos y nos conectamos a el.

```sh
sudo lxc-start -n una-caja
```
Introduciendo como login: ubuntu y como pass: ubuntu
![imagen_4.2](http://i.imgur.com/m1P6t5h.png)

##Ejercicio 2
**Comprobar qué interfaces puente se han creado y explicarlos.**

Para comprobar que se han creado correctamente los interfacez puente accedo al fichero "config" en la siguiente ruta:
```sh
/var/lib/lxc/una-caja/config
```
![imagen_4.3](http://i.imgur.com/QBnCwgu.png)

Aqui podemos ver que los puentes se han creado correctamente y comprobamos que esta en funcionamiento.
![imagen_4.4](http://i.imgur.com/vc3OaGY.png)

##Ejercicio 3.1
**Crear y ejecutar un contenedor basado en Debian.**
Realizamos los mismos pasos que hicimos para crear un contenedor en ubuntu.

Pero en este caso el usuario y contraseña cambian 
login: root
pass:root
![imagen_4.5](http://i.imgur.com/FXXGeR5.png)

##Ejercicio 3.2
**Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue. **
![imagen_4.6](http://i.imgur.com/vE2OpuS.png)
##Ejercicio 4.1
**Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.**

Procedo a instalar lxc-webpanel para facilitarnos todo el trabajo sobre el control de las maquimas virtuales instaladas
```sh
wget http://lxc-webpanel.github.io/tools/install.sh
chmod +x install.sh
sudo ./install.sh
```
![imagen_4.7](http://i.imgur.com/5CJJIsR.png)


##Ejercicio 4.2
**Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.**

Para poder modificar los recursos de alguna de nuestras distribuciones primero deberan estas totalmente paradas y pinchando en ellas obtendremos otro panel con los parametros que se pueden modificar.
![imagen_4.8](http://i.imgur.com/FuUQbUJ.png)


##Ejercicio 5
**Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.**

##Ejercicio 6.1
**Instalar juju.**
Para proceder con la instalacion de juju primero he añadido el repositorio para su instalacion.
```sh
sudo add-apt-repository ppa:juju/stable
```
y acontinuacion realizamos la instalacion.

![imagen_4.10](http://i.imgur.com/CzaCszf.png)



##Ejercicio 6.2
**Usándolo, instalar MySQL en un táper. **

##Ejercicico 7.1
**Destruir toda la configuración creada anteriormente**

##Ejercicio 7.2
**Volver a crear la máquina anterior y añadirle mediawiki y una relación entre ellos.**

##Ejercicio 7.3
**Crear un script en shell para reproducir la configuración usada en las máquinas que hagan falta.**

##Ejercicio 8
**Instalar libvirt. Te puede ayudar esta guía para Ubuntu. **
Antes de procede a trabajar con libvirt debemos comprobar que nuestro equipo hardware es compatible con las extensiones de virtualización necesarias para KVM.

Para ellos realizamos la comprobacion y nos damos cuenta de que nuestra CPU no soporta al virtualizacion:
![imagen_4.13](http://i.imgur.com/84S7Rzu.png)

Buscamos varias soluciones para poder realizar la virtualizacion en nuestro equipo pero las soluciones encontradas no se pueden realizar en nuestro equipo debio a la antiguedad del mismo.

Igualmente procedo a la instalacion de libvirt.
```sh
sudo apt-get install kvm libvirt-bin
```
y con la orden virsh se abrira la terminal de trabajo en linea de comandos.
![imagen_4.14](http://i.imgur.com/ehHmsSf.png)


##Ejercicio 9
**Instalar un contenedor usando virt-install.**

##Ejercicio 10
**Instalar docker.**
Realizamos la instalacion tal y como nos indica la misma pagina de [docker](http://docs.docker.com/installation/ubuntulinux/).

En primer lugar hemos tenido que añadir la clave repositorio Docker a una biblioteca de claves.
con: 
```sh
$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
```
una vez echo esto añadimos el repositorio 
![imagen_4.15](http://i.imgur.com/t6cuGXX.png)
y realizamos seguidamente:

```sh
sudo apt-get update
sudo apt-get install lxc-docker
```
Para comprobar que funciona correctamente lo iniciamos.

![imagen_4.16](http://i.imgur.com/xzyRxTv.png)
##Ejercicio 11.1
**Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.**
Si queremos instalar una imagen a partir de docker introduciremos el siguiente codigo:

En este caso usaremos la imagen de la distribucion de centos.
 ```sh
 sudo docker pull centos
 ```
 ![imagen_4.17](http://i.imgur.com/IdYa5Fx.png)
 
 Comprobandola de la siguiente forma:
 ![imagen_4.18](http://i.imgur.com/CPO04wz.png)
 
 Esta sentencia nos vendra bien si por cualquier caso si darnos cuenta creamos varias imagenes y necesitamos [eliminarlas](http://rm-rf.es/como-instalar-configurar-usar-docker-linux-containers/):
 ```sh
 sudo docker rmi ID_IMAGE
 ```
##Ejercicio 11.2
**Buscar e instalar una imagen que incluya MongoDB.**
Buscando la imagen para docker en la que incluya MongoDB, encontre la sentencia que me instala la imagen de mongo.
```sh
sudo docker pull mongo
```
![imagen_4.19](http://i.imgur.com/iNPq0rV.png)

##Ejercicio 12
**Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.**
En primer lugar iniciamos con docker el contenedor de ubuntu.
Para instalar nginx necesitamos crear un usuario que valide los parametros y despues cambiamos de usuario para poder instalar dicho paquete en su sesion como muestro en la imagen

![imagen_4.20](http://i.imgur.com/ceHnryY.png)

##Ejercicio 13
**Crear a partir del contenedor anterior una imagen persistente con commit. **

##Ejercicio 14
**Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección. **

#TEMA 5

##Ejercicio 1.1
**¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?**
En mi ordenador solo tengo un disco duro instalado.uso varias particiones una para windows otra para linux y otro para datos importantes.
En ambos sistemas opetativos tengo maquinas virtuales para mostrar la informacion de las maquinas virtuales utilizaremos las sentecias:
```sh
sudo fdisk -l 
y 
sudo lsblk -fm
```
![1](http://i.imgur.com/f4EiWgh.png)
![2](http://i.imgur.com/59yPfKy.png)
para compreobar los volumenes logicos podriamos hacerlo con:
```sh
sudo lvmdiskscan
```
![3](http://i.imgur.com/qYztuyr.png)
simpre y cuando hayamos instalado anteriormente ```sh sudo apt-get install lvm2```
![4](http://i.imgur.com/RfgJbDH.png)

##Ejercicio 1.2
**Si tienes acceso en tu escuela o facultad a un ordenador común para las prácticas, ¿qué almacenamiento físico utiliza? **

##Ejercicio 1.3
**Buscar ofertas SAN comerciales y comparar su precio con ofertas locales (en el propio ordenador) equivalentes.**

##Ejercicio 2
**Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.Avanzado Usar los drivers de FUSE para Ruby (aquí explican más o menos como hacerlo con fusefs para mostrar el contenido de una estructura de datos en un lenguaje como si fuera un fichero. Este es un ejemplo en Python.**


##Ejercicio 3
**Crear imágenes con estos formatos (y otros que se encuentren tales como VMDK) y manipularlas a base de montarlas o con cualquier otra utilidad que se encuentre**
En primer lugar comenzaremos instalando qemu:
```sh
sudo apt-get install qemu-system
```
acontinuacion crearemos la imagen qemu y despues la montaremos:
![6,9](http://i.imgur.com/jlyFyee.png)


##Ejercicio 4
**Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema**
Para poder trabajar con ese tipo de formatos en primer lugar procederemos a la instalacion de las herramientas necesarias.
![7](http://i.imgur.com/M8bho4v.png)

Una vez instaladas vamos a crear las imagenes y mostarles en el loop.
![8](http://i.imgur.com/xlOoyOA.png)

Ahora vamos a ubicar las carpetas que necesitaremos y seguidamente realizaremos los puntos de montaje.

![10_1](http://i.imgur.com/aU8OG5g.png)
![10_2](http://i.imgur.com/JCqqmUy.png)
y comprobaremos
![10_3](http://i.imgur.com/l16qIqs.png)

y vamos a prodecer a realizar un test a ambas imagenes
![10_4](http://i.imgur.com/orlMxam.png)


##Ejercicio 5
**Instalar ceph en tu sistema operativo. **
Para ellos procedemos a instalarlo de la siguiente forma:
```sh
sudo apt-get install ceph-mds
```


##Ejercicio 6
**Crear un dispositivo ceph usando BTRFS o XFS.Avanzado Usar varios dispositivos en un nodo para distribuir la carga.**
Para crear un dispositivo con ceph empezamos creando las carpetas que necesitaremos para ello.
```sh
sudo mkdir -p /srv/ceph/{osd,mon,mds}
```
abrimos un fichero de configuracion de lo configaremos de la siguiente forma
![11](http://i.imgur.com/yvaoVxV.png)
Despues realizamos la creacion de la imagen y mas tarde susu ficheros.
![12](http://i.imgur.com/GJbSoee.png)
![12_2](http://i.imgur.com/mzkIaEG.png)
y ahora que lo tenemos arrancaremos la maquina con:
```sh
sudo /etc/init.d/ceph -a start
```
y para verlo con ceph:
```sh
sudo ceph -s
```
y finalmente lo montamos en un directorio que hayamos creado anteriormente.

##Ejercicio 7
**Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados. **
Para ellos usaremos las siguiente ordenes :
```sh
sudo rados mkpool poolrados
```
y para ver que funciona utilizamos cualquier archivo de nuestro sistema:
```sh
sudo rados put -p prueba-pool objeto hola2.txt
```

##Ejercicio 8
**Tras crear la cuenta de Azure, instalar las herramientas de línea de órdenes (Command line interface, cli) del mismo y configurarlas con la cuenta Azure correspondiente**
Una vez que nos hayamos dado de alta en la cuenta de azure vamos a realizar la instalacion del cliente de azule.
```sh
sudo apt-get install nodejs-legacy
sudo apt-get install npm
sudo npm install -g azure-cli
```
acontinuacion nos logueamos con la siguiente sentecia:
```sh
azure login -u mwlmc@outlook.com
```

despues procedemos a realizar el siguiente paso en el que enlazamos la sesion con azure
```sh
azure account download
```
y finalmente solo nos quedara realizar la importacion de fichero con el link que nos han proporcionado anteriormente.
```sh
azure account import "fichero"
```

##Ejercicio 9
**Crear varios contenedores en la cuenta usando la línea de órdenes para ficheros de diferente tipo y almacenar en ellos las imágenes en las que capturéis las pantallas donde se muestre lo que habéis hecho. **

##Ejercicio 10
**Desde un programa en Ruby o en algún otro lenguaje, listar los blobs que hay en un contenedor, crear un fichero con la lista de los mismos y subirla al propio contenedor. Muy meta todo.**


#TEMA6

##Ejercicio 1
**Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.**
Comprobamos los paquetes necesarios para usar kvm y comprobamos si esta preparado.
![1](http://i.imgur.com/VXMzdMb.png)


##Ejercicio 2.1
**Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).**
En primer ligar he buscado sistemas operativos libres que ocupen poco espacio para poder trabajar mejor sin la complicacion de tener cuidado con el espacio ya que me ha surgido varios problemas en practicas anteriores.

uno de ellos sera [SLITAZ](http://www.slitaz.org/es/get/#stable) y otro [Damn Small Linux](http://www.damnsmalllinux.org/download.html).

Ahora crearemos los disco necesarios con :
```sh
qemu-img create -f qcow2 slitaz.img 600M
qemu-img create -f qcow2 damn.img 600M
```
y ahora las instalaremos:
![1_2](http://i.imgur.com/NgRZXRy.png)
![2](http://i.imgur.com/GFo97Ha.png)
![3](http://i.imgur.com/QfVl3kQ.png)


##Ejercicio 2.2
**Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels. **
Realizamos las misma instalacion de los sistemas anteriores pero utilizando Virtualbox
![4](http://i.imgur.com/j9fHr9G.png)
![5](http://i.imgur.com/1W1zK4n.png)

##Ejercicio 3
**Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con "qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img" **

Usando 
```sh
qemu-system-x86_64 -hda uno-cow2.qcow2
qemu-system-x86_64 -boot order=c -drive file=uno-cow2.qcow2,if=virtio
```
 Utilizando paravirtualizacion
 
|Medidas     |Real        |User       |Sys        |
| ---------- | ---------- |---------- |---------- |
| 1          | 1.909s     |1.867s     |0.042s     |
| 2          | 1.799s     |1.756s     |0.043s     |
| 3          | 1.853s     |1.819s     |0.034s     |
| 4          | 1.757s     |1.723s     |0.034s     |
| 5          | 1.666s     |1.633s     |0.033s     |
| Media      | 1.796s     |1.759s     |0.0376s    |

 Sin utilizar paravirtualizacion
 
|Medidas     |Real        |User       |Sys        |
| ---------- | ---------- |---------- |---------- |
| 1          | 2.109s     |2.048s     |0.040s     |
| 2          | 2.149s     |2.093s     |0.041s     |
| 3          | 2.003s     |1.941s     |0.036s     |
| 4          | 2.047s     |1.989s     |0.032s     |
| 5          | 1.956s     |1.910s     |0.032s     |
| Media      | 2.0528s    |1.9962s    |0.0524s    |



##Ejercicio 4
**Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.**
Primero nos descargamos una imagen de linux en mi caso ya la tengo puesto que es la imagen de utilizo como maquina personal y con esa imagen vamos a crear una maquina virtula nueva con los requisitos del enunciado.
Para ellos realizaremos el siguiente comando,tal y como venimos haciendo en practicas anteriores.
```sh
qemu-img create -f qcow2 LUbuntu.qcow2 4G
```
con eso ya hemos creado un disco duro ahora realizaremos la instalacion pero ahora le indicaremos la condiciones.
```sh
qemu-system-x86_64 -hda LUbuntu.qcow2 -cdrom Escritorio/lubuntu-14.10-desktop-i386.iso -m 512M
```
![6](http://i.imgur.com/Q875Ubd.png)
Cuando tengamos la instalacion completada tendremos que realizar la conexion a traves de VNC y SSH y para ello utilizaremos VNC Vinagre.Si no tenemos instalada dicha herramienta las instalaremos con:
![7_1](http://i.imgur.com/ZlX2XAV.png)
```sh
sudo aptutide vinagre
```
![7](http://i.imgur.com/ICxYhU4.png)
una vez instalada la herramienta vamos a conectarnos atraves de VNC y co ifconfig veremos la direccion para la conexion.
y realizamos la conexion con vinagre <Direccion dada por ifconfig>
![7_2](http://i.imgur.com/XecoqT1.png)
Y entonces solo nos quedara conectarnos con:
```sh
vinagre vinagre 192.168.122.1:5901
```
y se nos desplegara una ventana de nuestra maquina remota.

##Ejercicio 5
**Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.**

##Ejercicio 6
**Usar juju para hacer el ejercicio anterior.**
Para realizar el ejercicio anterior pero con juju.
##Ejercicio 7
**Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.**
En mi maquina tengo instalado el hipervisor VirtualBox y creare la maquinas desde ahi.

![10](http://i.imgur.com/UVscuDy.png)
![11](http://i.imgur.com/WjA0rli.png)


#TEMA 7

##Ejercicio 1
**Instalar chef en la máquina virtual que vayamos a usar**
Para realizar la instalacion realizamos la siguiente sentencia:
```sh
curl -L https://www.opscode.com/chef/install.sh | sudo bash
```
![1](http://i.imgur.com/6uluxM5.png)

##Ejercicio 2
**Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual. **

.chef
  |____cookbooks
  |	|__emacs
  |	|    |__recipes
  |	|	 |__default.rb
  |	|
  |	|__nginx
  |	     |__recipes
  |		 |__default.rb
  |__ node.json
  |__ solo.rb

- Fichero cookbooks/emacs/recipes/default.rb

```sh
	package 'emacs'
	directory '/home/mwlmc/iv'
	file "/home/mwlmc/iv/fichero" do
        	owner "mwlmc"
        	group "mwlmc"
        	mode 00544
        	action :create
        	content "Directorio iv"
	end
```

- Fichero cookbooks/nginx/recipes/default.rb

```sh
	package 'nginx'
	directory '/home/mwlmc/tema7'
	file "/home/mwlmc/tema7/actividad2" do
        	owner "mwlmc"
        	group "mwlmc"
        	mode 00544
        	action :create
        	content "Directorio tema7"
	end
```

- Fichero node.json

```sh
	{
		"run_list": [
		            "recipe[emacs]",
		            "recipe[nginx]"
		            ]
	}
```

-Fichero solo.rb

```sh
	file_cache_path "/home/mwlmc/chef"
	cookbook_path "/home/mwlmc/chef/cookbooks"
	json_attribs "/home/mwlmc/chef/node.json"

```
Despues de crear los archivos procedemos a ejecutar la siguiente sentencia:

```sh
sudo chef-solo -c chef/solo.rb
```
Y una vez realizado esto ya tendremos creado el directorio y el fichero.Tambien se nos instalara en paquete emacs y nginx.


##Ejercicio 3
**Escribir en YAML la siguiente estructura de datos en JSON { uno: "dos",  tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10,11 ] } ] } "**
Esta estructura en YAML se puede crear introduciento los valores usando un orden jeraquico precedido de guion.
```sh
---
- uno: "dos"
  tres:
    - 4
    - 5
    - "Seis"
    -
      - siete: 8
        nueve: 
          - 10
          - 11
```

##Ejercicio 4
**Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.**

##Ejercicio 5.1
**Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.**

##Ejercicio 5.2
**¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.**

##Ejercicio 6
**Instalar una máquina virtual Debian usando Vagrant y conectar con ella.**
En primer lugar tendremos que instalar la herramienta:
```sh
sudo apt-get install vagrant
```
Ahora para instalar la maquina usando Vagrant buscaremos una direccion tal y como dice el siguiente [guion](http://www.vagrantbox.es/)de la pagina oficial de Vagrand.

y realizamos la instalacion con:
```sh
vagrant box add debian http://dl.dropbox.com/u/937870/VMs/squeeze64.box
```
![6](http://i.imgur.com/CxqY5Q5.png)
despues de esto iniciaremos la maquina y levantaremos el entorno virtual.
![6_1](http://i.imgur.com/3wC602h.png)
y finalmente nos conectaremos por ssh con:
```sh
vagrant ssh
```

##Ejercicio 7
**Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica**

##Ejercicio 8
**Configurar tu máquina virtual usando vagrant con el provisionador ansible**
