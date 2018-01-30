## Tema 1

#Ejercicio 1

Calcular amortización a 4 y 7 años de un servidor

Servidor: [ASUS TS700-E7/RS8](http://www.alternate.es/ASUS/TS700-E7-RS8-(DVD-RW)/html/product/1135513?)

Precio: 1349€ (con IVA).
Precio sin IVA con el que realizaremos los cálculos: 1065,71€.
Además consideraremos que el equipo se ha obtenido en Enero (por lo que contariamos el año completo al realizar la amortización).

**Amortización a 4 años** 
Cada año se amortizaría un 25%, lo que nos daría una cantidad de 266,4275€ al año.

**Amortización a 7 años**
Cada año se amortizaría un 14'3% lo que nos daría una cantidad aproximada de 152,39€ al año.


#Ejercicio 2

Vamos a realizar una comparación de precios entre servicios de alojamiento en Internet y de proveedores de servicios en la nube. Hemos escogido como proveedor a la compañía [*Acens*](http://www.acens.com/).

- Características del servidor:
  * 4 cores
  * 4GB RAM
  * 600GB Disco
  
- Precio anual en un *Servidor Dedicado* : 203,3€/mes * 12 = 2439,6€/año.
- Precio anual en *Cloud Server* : 331,2€/mes (0.46€/hora) * 12 = 3974,4€/año.

Vamos a realizar comparaciones según el porcentaje de uso :
  Para un servidor dedicado pagaríamos siempre lo mismo, ya utilicemos un 1%, 10%. Ya que el pago se realiza por mes y   no por uso.

* Si se utiliza un 1% del tiempo :
  - Servidor Dedicado: 2439,6€/año (203,3€ * 12, Pago fijo al mes).
  - Cloud Server: 40,296€/año (8760horas/año * 0.46€/h = 4029,6€ aproximadamente).

*Si se utiliza un 10% del tiempo :
  - Servidor Dedicado: 2439,6€/año (203,3€ * 12, Pago fijo al mes).
  - Cloud Server: 402,96€/año (8760horas/año * 0.46€/h = 4029,6€ aproximadamente).
   


#Ejercicio 3

- Parte 2:
 
Se ha realizado un pequeño programa en python que suma dos valores introducidos por teclado.

Una vez creado, hemos instalado el paquete CDE, con la siguiente instrucción:
	> sudo apt-get install cde

A continuación hemos dado permisos de ejecución (chmod +x suma.py) al programa.

Por último hemos ejecutado una serie de comandos para realizar el empaquetado en CDE.
Hemos realizado una copia del fichero suma.py en los siguientes directorios:
	- /usr/games
	- /usr/bin

Una vez tenemos la copia en ese directorio ejecutamos:
	> cde suma.py

Se ejecutará y a continuación realizaremos un ls, para ver como se han creado en nuestro directorio una serie de ficheros y una carpeta. Accederemos a la carpeta "cde-packages" y ejecutaremos otro ls.

Nos saldrán un listado de los archivos que se han creado al ejecutar la orden cde anterior.

Comprobamos que ejecutando el fichero (./suma.py.cde) el programa se ejecuta correctamente.



#Ejercicio 4

Vamos a realizar el tutorial de docker que se encuentra en el siguiente enlace [*Tutorial*](https://www.docker.com/tryit/)

![Ejercicio_4](http://i.imgur.com/1I2UHzW.png?1)



#Ejercicio 5

Para comenzar la instalación del sistemas de fuentes Git, lo primero que
vamos a hacer es actualizar el listado de los paquetes.
	
	> sudo apt-get update

A continuación instalaremos el paquete.
	
	> sudo apt-get install git
	
Por último vamos a realizar la configuración de algunos parámetros que
servirán para identificarnos a la hora de realizar gestiones en nuestros
repositorios. Primero configuraremos el nombre y a continuación el email.

	> git config --global user.name "Cristina Rosillo"
	> git config --global user.email "cristy.blk@gmail.com"
	
Si queremos comprobar el estado de todos estos valores, podemos ejecutar:
	
	> git config --list
	
![Ejercicio_5](http://i.imgur.com/O5S6Kiu.png)



#Ejercicio 6

Vamos a crear un proyecto nuevo y a descargarlo desde git, modificando al el fichero README desde linea de 
comandos y actualizandolo.

![Ejercicio_6_1](http://i.imgur.com/Wrq19vn.png)

![Ejercicio_6_2](http://i.imgur.com/oMLMGms.png)

![Ejercicio_6_3](http://i.imgur.com/mhvsWgI.png)

![Ejercicio_6_4](http://i.imgur.com/5sCygPW.png)

![Ejercicio_6_5](http://i.imgur.com/m5EWt99.png)


#Ejercicio 7

Para verificar si está montado, comprobaremos que el directorio /sys/fs/cgroup
no esté vacío. Si lo está como en mi caso tendremos que montarlo ejecutando lo siguente:

	>sudo mount -t cgroup cgroup /sys/fs/cgroup
	
Una vez hecho, haremos un ls para ver su contenido.

![Ejercicio_7](http://i.imgur.com/945l6hG.png)



#Ejercicio 10

Si tiene instalados los flags, podemos comprobarlo ejecutando la siguiente orden:

	> egrep '^flags.*(vmx|svm)' /proc/cpuinfo

El procesador del equipo es:

![Ejercicio_10_1](http://i.imgur.com/YXYxnHg.png)

La salida que produce la ejecución de la primera orden es la siguiente.

![Ejercicio_10_2](http://i.imgur.com/W8XzkM3.png)





##Tema 2

#Ejercicio 1

Vamos a realizar la instalación de el entorno de desarrollo virtual para python Virtualenv. Para hacerlo sólo
debemos ejecutar la siguiente instrucción desde consola:

	> sudo apt-get install python-virtualenv
	
![Ejercicio_1](http://i.imgur.com/4MOaKsV.png)


#Ejercicio 2

Vamos a darnos de alta en el servicio PaaS [OpenShift](https://www.openshift.com).
Como podemos ver ya tenemos creada una cuenta y podemos acceder a la funcionalidad del sitio.

![Ejercicio_2](http://i.imgur.com/StKRpCi.png)


#Ejercicio 3

A continuación vamos a crear una nueva aplicación en nuestra cuenta de OpenShift y vamos a instalar WordPress.
Volvemos al panel de la imagen anterior y seleccionamos la opción "Create you first application now".

![Ejercicio_3](http://i.imgur.com/RTWm6IY.png)

Elegimos en éste caso la instalación de WordPress y al hacerlo se abrirá la siguiente ventana, le damos un nombre a nuestra aplicación y hacemos pinchamos en "Create Application":

![Ejercicio_3_1](http://i.imgur.com/xdUOwna.png)
![Ejercicio_3_2](http://i.imgur.com/qXOrK8t.png)

Ahora podemos empezar a cambiar el códigp de nuestra a aplicación o continuar hasta finalizar la instalación. Vamos a realizar la instalación completa y más tarde editaremos el código si fuese necesario.

![Ejercicio_3_3](http://i.imgur.com/2iKKA46.png)

![Ejercicio_3_4](http://i.imgur.com/tYDzA4G.png)

Finalmente nos muestra la información de acceso a la base de datos y a la aplicación via web. Para empezar a crear nuestro sitio sólo tendremos que pinchar en la url que se nos da en la imagen anterior e ir siguiendo los pasos de configuración del sitio de WordPress.

![Ejercicio_3_5](http://i.imgur.com/0Vn2TEU.png)

Y ya tendremos listo nuestro sitio.

![Ejercicio_3_6](http://i.imgur.com/yOsTWuP.png)

![Ejercicio_3_7](http://i.imgur.com/XSqJ1Nm.png)


#Ejercicio 4

Vamos a crear un pequeño script desde [Google](https://script.google.com). El script creará de forma automática un documento en Google Drive, con el nombre y el contenido que nosotros indiquemos. Lo ejecutaremos y comprobaremos como el documento aparece en nuestra cuenta de Google Drive.

![Ejercicio_4](http://i.imgur.com/iDXEDr8.png)
![Ejercicio_4_1](http://i.imgur.com/kU517z9.png)


#Ejercicio 5

[Buildout](http://www.buildout.org/en/latest/) es un sistema de automatización de construcción de software, usada principalmente para Python y Zope. Es una herramienta open source que nos permite una instalación directa de dependencias y definición de tareas.


#Ejercicio 6

El módulo [Unittest](http://pymotw.com/2/unittest/) nos permite probar nuestro código y realizar "Suites de pruebas", agrupar funcionalidad común y escribir "Casos de pruebas". 

##Tema 3

#Ejercicio 1

Vamos a montar un archivo ISO en un espacio de nombres que vamos a crear, lo primero que haremos será crear el espacio de nombres nuevo. Ejecutamos la siguiente instrucción:

	> sudo unshare -u /bin/bash

Ahora vamos a realizar una prueba, cambiando el nombre del host con "hostname alayala". SI ahora ejecutamos "hostname" podemos ver como se ha cambiado correctamente.
A continuación montaremos la ISO en un directorio que hemos creado previamente. Para realizar el montaje escribimos:

	> mount - o loop [nombreISO] [ruta_de_montaje]

![Ejercicio_1](http://i.imgur.com/JXIvDw2.png)

#Ejercicio 2

1)	Para mostrar los puentes configurados en nuestro sistema ejecutaremos:
		
		> sudo brctl show
		
![Ejercicio_2_1](http://i.imgur.com/cBmlJ92.png)

2)	Ahora vamos a crear una nueva interfaz virtual y a asignarla a una red (en nuestro caso eth0). Como esa 		interfaz la hemos usado al realizar el ejemplo de clase, primero borraremos la interfaz "alcantara" y a 		continuación crearemos la nueva.

![Ejercicio_2_2_1](http://i.imgur.com/QOQnY5G.png)
	
Una vez eliminada, crearemos nuestra nueva interfaz virtual y la asignaremos a la interfaz eth de la tarjeta 		de red.
	
![Ejercicio_2_2_2](http://i.imgur.com/GYL6SlF.png)
	
#Ejercicio 3

1)	Usaremos la herramienta Debootstrap para crear un sistema mínimo y poder ejecutarlo después. Lo primero que 		necesitamos es instalar el paquete en nuestro sistema.

		> sudo apt-get install debootstrap
	
Una vez instalado creamos el directorio donde vamos a realizar la instalación del sistema, en éste ejemplo lo 	llamaremos UbuntuSO. Después ejecutamos la siguiente instrucción, que se encargará de instalar el 			sistema. 
	
		> sudo debootstrap --arch=amd64 precise UbuntuSO/ http://archive.ubuntu.com/ubuntu/
		
![Ejercicio_3_1_1](http://i.imgur.com/pjffktv.png)
	
![Ejercicio_3_1_2](http://i.imgur.com/WBiOe12.png)
	
2)	Instalar un sistema Fedora dentro de Debian usando la herramienta Rinse. Lo primero que haremos será 			instalarla.

		> sudo apt-get install rinse
		
A continuación realizaremos la instalación de Fedora en la carpeta que hemos llamado "FedoraRinse". Usando la herramienta Rinse que acabamos de instalar. Para ello ejecutamos:

		> sudo rinse --arch=amd64 --distribution fedora-core-6 --directory FedoraRinse
		
![Ejercicio_3_2_1](http://i.imgur.com/hWER0xD.png)

![Ejercicio_3_2_2](http://i.imgur.com/eE6n8Za.png)

#Ejercicio 4

En ésta ocasión vamos a reutilizar el sistema Ubuntu que hemos instalado en el ejercicio anterior. Entramos dentro del sistema y vamos a realizar la instalación de algunas herramientas, como las citadas en el guión.

	> sudo chroot UbuntuSO
	
![Ejercicio_4_1](http://i.imgur.com/u5HkRd2.png)

Una vez dentro, vamos a montar el diretorio proc e instalar el paquete español para que no nos aparezca algún error.

![Ejercicio_4_1_2](http://i.imgur.com/9cpSx8v.png)

Como nos pide en el ejercicio, vamos a crear y compilar una pequeña aplicación que nos muestre un "Hola Mundo", para ello instalaremos la herramienta nano y python. Ésta última ya se encuentra en el sistema en su versión más reciente así no será necesario instalarla. En cualquier caso si necesitaramos hacerlo sólo tendríamos que ejecutar:

	> apt-get install python

![Ejercicio_4_1_3](http://i.imgur.com/7cNb9Op.png)

![Ejercicio_4_1_4](http://i.imgur.com/B7Xk1Vz.png) 
	
#Ejercicio 5

De nuevo en una de las jaulas creadas en el ejercicio 3, en UbuntuSO más concretamente vamos a realizar la instalación de la herramienta nginx. Para instalarla debemos añadir los repositorios necesarios y para hacerlo nos ha surgido otro problema. Al intentar descargar la firma con el comando wget, ha aparecido un error ya que ese comando no se encuentra instalado, para solucionarlo sólo tenemos que instalarlo con la siguiente instrucción.

	> ap-get install wget
	
Una vez hecho ya podremos comenzar la instalación de nginx. Primero nos descargaremos la firma y la añadiremos a nuestros repositorios y a continuación añadimos los repositorios del paquete.
	
	> wget http://nginx.org/keys/nginx_signing.key
	> apt-key add nginx_signing.key
	
![Ejercicio_5_1](http://i.imgur.com/twFJvct.png)

	> nano /etc/apt/sources.list
	
Y añadimos:

	deb http://nginx.org/packages/ubuntu/ precise nginx
	deb-src http://nginx.org/packages/ubuntu/ precise nginx
	
![Ejercicio_5_2](http://i.imgur.com/8btedxV.png)

Por último hacemos update para actualizar los paquetes e instalamos nginx.

	> apt-get install nginx
	
![Ejercicio_5_3](http://i.imgur.com/aCkld1p.png)


## Tema 4

#Ejercicio 1

Para instalar LXC actualizaremos los repositorios y ejecutaremos la siguiente instrucción:

	> apt-get update
	> apt-get install lxc
	
![Ejercicio_1_1](http://i.imgur.com/NWQzgty.png)

Ahora comprobaremos si nuestro sistema está preparado para éste tipo de tecnología, para hacerlo usaremos "lxc-checkconfig".

	> lxc-checkconfig
	
![Ejercicio_1_2](http://i.imgur.com/mMNus8Z.png)

#Ejercicio 2

Vamos a comprobar las interfaces que se han creado. En éste caso podemos ver que se han creado 2 interfaces, una correspondiente al contenedor que hemos creado y ejecutado (prefijo veth) y la otra a lxc. Si creáramos otro contenedor y lo arrancamos tendriamos una tercera interfaz identificada también con el sufijo veth.

![Ejercicio_2](http://i.imgur.com/hQ00hte.png)

#Ejercicio 3

1) Vamos a ver como se crea y ejecuta un contenedor basado en debian (usaremos el que hemos creado para el ejercicio anterior)

![Ejercicio_3_1](http://i.imgur.com/FaEXYjf.png)
![Ejercicio_3_2](http://i.imgur.com/BAydSj0.png)

2) A continuación vamos a crear otro contenedor con otra distribución, en éste caso vamos a instalar y arrancar un contenedor con centos, para hacerlo hemos seguido las siguientes [instrucciones](http://www.bonusbits.com/main/HowTo:Setup_CentOS_LXC_Container_on_Ubuntu), pues hemos tenido que descargar la plantilla de centos para poder hacerlo. Una vez descargada y con los permisos necesarios, procederemos a crear el contenedor como lo hemos hecho hasta ahora.

![Ejercicio3_3](http://i.imgur.com/9McK4li.png)

#Ejercicio 4

1) Instalar lxc-webpanel para arrancar, parar y visualizar las maquinas virtuales que tenemos instalada. Ejecutamos la siguiente instrucción obtenida de éste [enlace](http://lxc-webpanel.github.io/install.html):

	> wget http://lxc-webpanel.github.io/tools/install.sh -O - | bash
	
![Ejercicio4_1](http://i.imgur.com/jnFd4sm.png)

2) Desde el panel vamos a restringir los recursos que pueden usar como: CPUs que se pueden usar, cantidad de memoria, etc. Al entrar en el webpanel, pinchando en las maquinas podremos acceder a un panel de configuración de esa máquina, desde donde podremos modificar los parámetros de configuración como la ip, nombre del host, cantidad de memoria...
	En nuestro ejemplo hemos bajado a 1500 MB la cantidad de memoria, hemos limitado el uso de CPUs a 0-2 para la máquina "nubecilla22"
	
![Ejercicio4_2](http://i.imgur.com/vhy28YX.png)

#Ejercicio 6

1) Para instalar juju seguiremos las instrucciones dadas en el guión, ejecutamos las siguientes instrucciones:
	
	> sudo add-apt-repository ppa:juju/stable
	
Como nuestra versión de Ubuntu supera la 12.04 debemos ejecutar:

	> sudo apt-get install juju-local
	
![Ejercicio6_1](http://i.imgur.com/2NeWu1v.png)
	
	
2) Hemos creado un táper local (para hacerlo hemos seguido todos los pasos explicados en el guión) y ahora le instalaremos MySQL.
	
![Ejercicio6_2_1](http://i.imgur.com/PnGZSjV.png)

![Ejercicio6_2_2](http://i.imgur.com/RfqFnm3.png)

#Ejercicio 7

1) Vamos a destruir toda la configuración que hemos realizado anteriormente (quitar MySQL y destruir la configuración).
	
	> juju destroy-service mysql
	> juju destroy-environment local
	> juju status
	
![Ejercicio7_1](http://i.imgur.com/7xV0wfZ.png)

2) Ahora volveremos a crear la máquina anterior, instalando mediawiki, mysql y creando un enlace entre ellos.

	> juju bootstrap
	> juju deploy mediawiki
	> juju deploy mysql
	> juju add-relation mediawiki:db mysql
	> juju expose mediawiki
	
![Ejercicio7_2_1](http://i.imgur.com/aC2vWqR.png)
![Ejercicio7_2_2](http://i.imgur.com/fbh2slL.png)

3) Crear un script para reproducir la configuración en las máquinas que sean necesarias.

	#!/bin/bash
	
	echo "Creando nueva maquina..."
	
	juju bootstrap
	juju deploy mediawiki
	juju deploy mysql
	juju add-relation mediawiki:db mysql
	juju expose mediawiki
	
	echo "Maquina creada :)"

![Ejercicio7_3](http://i.imgur.com/V2hWMtE.png)

#Ejercicio 8

Instalar la librería libirt, usando como ayuda ésta [guía](https://help.ubuntu.com/12.04/serverguide/libvirt.html)

Lo primero que vamos a hacer es comprobar si nuestra máquina es compatible, ejecutando el siguiente comando. La salida del mismo nos indicará si nuestro hardware soporta o no virtualización. En éste caso nuestro equipo si lo soporta.

	> kvm-ok
	
Ahora procederemos a instalar la librería.
	
	> sudo apt-get install kvm libvirt-bin
	
Para comprobar que todo ha ido bien podemos comprobarlo accediendo al shell virsh que hemos visto en la sesión.

![Ejercicio8_1](http://i.imgur.com/mumhSvs.png)
	
#Ejercicio 9

Realizar la instalación de un contenedor usando virt-install. Para hacerlo seguimos utilizando la guía que se nos facilitó en el ejercicio anterior. Lo primero que haremos será instalar el paquete virtinst, virt-install forma parte del paquete virtinst, así que instalando éste ya dispondriamos de dicha librería.

	> sudo apt-get install virtinst
	
A continuación vamos a instalar un sistema fedora, usando el ejemplo de la guía hemos realizado algunos cambios para
personalizar la instalación (nombre de la máquina, cambiar .iso por url para descargar la imagen de fedora...)

	> sudo virt-install -n fedoraPrueba -r 256 --disk path=/var/lib/libvirt/images/fedoraPrueba.img,bus=virtio,size=4 -l http://download.fedoraproject.org/pub/fedora/linux/releases/20/Fedora/x86_64/os/ --accelerate --network network=default,model=virtio --connect=qemu:///system --vnc --noautoconsole -v
	
Una vez instalada, comprobamos que todo ha ido bien y que se está ejecutando.

![Ejercicio9_1](http://i.imgur.com/jdjalNK.png)

#Ejercicio 10

Ahora vamos a instalar docker, como ya lo teníamos instalado de prácticas anteriores lo desinstalamos y volveremos a instalarlo ejecutando:

	> sudo apt-get update
	> sudo apt-get install docker.io
	
![Ejercicio10_1](http://i.imgur.com/Eq6nhMv.png)

#Ejercicio 11

1)	Con docker ya instalado, vamos a instalar una imagen de Ubuntu y otra de CentOS.

	> docker pull ubuntu
	> docker pull centos
	
![Ejercicio11_1](http://i.imgur.com/HgsXOwl.png)

![Ejercicio11_2](http://i.imgur.com/v7plLEP.png)

#Ejercicio 12

Vamos a crear un usuario e instalar nginx en uno de los contenedores que hemos creado anteriormente.
Primero accederemos al contenedor Ubuntu y crearemos un nuevo usuario.

	> sudo docker run -i -t ubuntu /bin/bash
	
![Ejercicio12_1](http://i.imgur.com/7xrAP6D.png)

A continuación (dentro del contenedor) instalaremos nginx.

	> sudo apt-get update
	> sudo apt-get install nginx

![Ejercicio12_2](http://i.imgur.com/skZAnI4.png)

Como podemos ver, el servicio se está ejecutando lo que nos confirma que la instalación se ha realizado correctamente.


## Tema 5

#Ejercicio 1

1) En mi disco duro no utilizo volúmenes lógicos sino particiones, aquí podemos ver cómo lo tengo distribuido.

![Ejercicio1_1](http://i.imgur.com/CzVnhi9.png)

#Ejercicio 2

Vamos a usar FUSE para acceder a los recursos remotos como si fueran ficheros locales. Primero instalamos el paquete sshfs (debemos tenerlo tanto en el cliente como en el servidor):

	> sudo apt-get install sshfs

Ahora creamos un directorio donde montará la carpeta que queremos "compartir" de nuestro servidor y ejecutamos la instrucción para montarlo.

![Ejercicio2_1](http://i.imgur.com/Rt148Zk.png)

Ahora vamos a comprobar que se ha realizado de forma correcta listando el directorio y añadiendo un fichero de prueba para ver que realmente se crea en el servidor al crearlo en nuestra máquina local.

![Ejercicio2_2](http://i.imgur.com/myppUYw.png)

#Ejercicio 3

Vamos a crear imágenes con los formatos descritos en teoría y vamos a montarlas, para ver cómo funciona. Lo primero que necesitamos es instalar el paquete qemu-system.

	> apt-get install qemu-system

Una vez lo tenemos crearemos el fichero de almacenamiento virtual de la máquina y a continuación lo montaremos en un directorio.

Ahora vamos a hacerlo utilizando ficheros tipo raw. Creamos el fichero raw.

![Ejercicio3_1](http://i.imgur.com/F13SX60.png)

Para poder montarlo tendremos que formatearlo (podemos hacerlo con el comando fdisk y mkfs). Una vez le hayamos dado formato y se haya particionado, podremos montarlo con la siguiente instrucción:

	> mount -o loop maquina1.img /mnt/maquina1

![Ejercicio3_2](http://i.imgur.com/EEEQ0wE.png)

#Ejercicio 5

Vamos a instalar ceph en nuestro sistema, para ello sólo ejecutamos:

	> apt-get install ceph

![Ejercicio5_1](http://i.imgur.com/xDs91xt.png)

#Ejercicio 6

Vamos a crear un dispositivo ceph usando BTRFS o XFS. Creamos los directorios donde se va a almacenar la información y a continuación creamos el fichero de configuración tal y como se explica en el tema.

![Ejercicio6_1](http://i.imgur.com/TVBEbgu.png)

Ahora creamos la máquina.

![Ejercicio6_2](http://i.imgur.com/37ppYJT.png)

#Ejercicio 7

Almacenar objetos y ver la forma de almacenar directorios completos usando ceph y rados. Usando rados tendremos que crear un pool.

	> rados mkpool ejemplo1

Una vez lo tenemos podemos añadirle cualquier fichero.

	> rados put -p ejemplo1 fichero.txt

#Ejercicio 8

Vamos a instalar las herramientas de línea de órdenes de nuestra cuenta Azure. Instalaremos primero cli:

	> npm install -g azure-cli

Después tendremos que conectar con nuestra cuenta de azure ejecutando la siguiente instrucción:

	> azure account download

Nos aparecerá una url, al abrirla se nos descarga un fichero que es el que debemos importar y con éste paso ya tendríamos nuestra cuenta conectada.

	> azure account import "fichero"


## Tema 6

#Ejercicio 1

Instalar los paquetes necesarios para usar KVM.Comprobar que nuestro systema está preparado para ejecutarlo. Ejecutamos kvm-ok para comprobar (como lo hicimos en temas anteriores si KVM es compatible con nuestro sistema). Como podemos ver si es compatible y podemos utilizarlo.

![Ejercicio1_1](http://i.imgur.com/IVYcTfw.png)


#Ejercicio 2

1)	Vamos a crear varias máquinas virtuales con sistemas operativos libres. Por ejemplo ttyLinux que está basado solamente en línea de ordenes. 

- Ttylinux: Descargamos la imagen desde la [página oficial](http://ttylinux.net/dloadPC-x86_64.html)
A continuación creamos un disco virtual y arrancamos la máquina con la iso y el disco.

![Ejercicio2_1_1](http://i.imgur.com/vCOit9G.png)

- Slitaz: Descargamos la imagen desde la [página oficial](http://www.slitaz.org/en/)
Seguimos los mismos pasos que en el apartado anterior, creamos un disco virtual nuevo y volvemos a arrancar la máquina.

![Ejercicio2_1_2](http://i.imgur.com/5qR3Zit.png)

2)	Ahora volveremos a crear varias máquinas virtuales pero usando VirtualBox. Para instalarlo ejecutaremos las siguientes instrucciones:
	
	> sudo apt-get update
	> sudo apt-get install virtualbox-qt

Una vez instalado, abrimos la aplicación desde el entorno gráfico. Y nos aparecerá la siguiente ventana.

![Ejercicio2_2_1](http://i.imgur.com/ZuF5gVG.png)

Pinchamos en "Nueva" y nos aparecerá una nueva ventana desde donde indicaremos el tipo de SO que vamos a instalar y el nombre que queremos darle.

![Ejercicio2_2_2](http://i.imgur.com/yqtx75H.png)

A continuación configuramos el tamaño de de memoria que queremos asignarle y le damos a "Siguiente".

![Ejercicio2_2_3](http://i.imgur.com/GrdKsZm.png)

Ahora configuraremos el almacenamiento de nuestra máquina, podemos usar un disco virtual ya creado, no crear ninguno o crear uno nuevo. En nuestro caso crearemos uno nuevo.

![Ejercicio2_2_4](http://i.imgur.com/vD3klPN.png)

En la siguiente ventana elegiremos el tipo de archivo que utilizará nuestro disco, dejaremos la opción que viene por defecto (aunque podemos ver como nos ofrece la opción de usar qcow2). A continuación podemos configurar nuestro disco como dinámico o fijo.

![Ejercicio2_2_5](http://i.imgur.com/nEybnht.png)

![Ejercicio2_2_6](http://i.imgur.com/K0JVeYC.png)

Ahora elegimos donde se guardará nuestra máquina y el tamaño que queremos que tenga nuestro disco.

![Ejercicio2_2_7](http://i.imgur.com/zcVEzBi.png)

Y ya tenemos creada una nueva máquina virtual, sólo nos queda asignarle la iso del SO que queremos instalar y podremos arrancar nuestra máquina. Para ello nos situamos sobre la máquina recién creada y hacemos clic con el botón derecho, de entre las opciones elegimos "Configuración" y accederemos a la ventana de configuración de nuestra máquina.

![Ejercicio2_2_8](http://i.imgur.com/B1dvaWk.png)

En la pestaña "Almacenamiento", en la "unidad de CD/DVD" le asignamos la iso que queremos usar y aceptamos.

![Ejercicio2_2_9](http://i.imgur.com/M8l0Qzd.png)

![Ejercicio2_2_10](http://i.imgur.com/ElLN8xa.png)

Y ya tenemos creada nuestra máquina virtual, ahora sólo tenemos que iniciarla para instalar el SO para poder comenzar a usarlo.

![Ejercicio2_2_11](http://i.imgur.com/bVTIFQz.png)

#Ejercicio 3

Crearemos un benchmark para comprobar la velocidad de entrada y salida y ver la diferencia que existe entre usar paravirtualización o sin ella.

- Utilizando paravirtualización

|Medidas     |Real        |User       |Sys        |
| ---------- | ---------- |---------- |---------- |
| 1          | 1.709s     |1.648s     |0.040s     |
| 2          | 1.749s     |1.693s     |0.041s     |
| 3          | 1.603s     |1.541s     |0.036s     |
| 4          | 1.647s     |1.589s     |0.032s     |
| 5          | 1.556s     |1.510s     |0.032s     |
| Media      | 1.6528s    |1.5962s    |0.0524s    |

- Sin utilizar paravirtualización

|Medidas     |Real        |User       |Sys        |
| ---------- | ---------- |---------- |---------- |
| 1          |1.955s      |1.888s     |0.140s     |
| 2          |1.845s      |1.759s     |0.132s     |
| 3          |2.113s      |2.035s     |0.119s     |
| 4          |1.611s      |1.554s     |0.103s     |
| 5          |2.049s      |1.960s     |0.142s     |
| Media      |1.91446s    |1.8392s    |0.1272s    |

Como podemos observar utilizando paravirtualización la velocidad aumenta ligeramente, podríamos ver un valor más significativo si hicieramos un test más complejo.


#Ejercicio 4

Vamos a crear una maquina virtual Linux con 512 MB de RAM y entorno gŕafico LXDE a la que podamos acceder mediante ssh y VNC.

Como hemos hecho en los ejercicios anteriores, creamos el fichero donde se instalará la máquina:

	> qemu-img create -f qcow2 lubuntu.qcow2 13G

Descargamos el SO que vamos a instalar de la [página oficial](https://help.ubuntu.com/community/Lubuntu/GetLubuntu), en éste caso Lubuntu que tiene un entorno lxde. E arrancamos la máquina con la ISO para su instalación.

	> qemu-system-x86_64 -hda lubuntu.qcow2 -cdrom lubuntu-14.10-desktop-amd64.iso -m 512M

![Ejercicio4_1](http://i.imgur.com/4EXn7I8.png)

Y al finalizar la instalación tendremos listo nuestra nueva máquina con Lubuntu. Para poder conectarnos mediante vnc y ssh necesitaremos un cliente VNC, así que nos instalaremos el cliente VNC Vinagre:

	> aptitude install vinagre

Una vez instalado, arrancamos de nuevo la máquina.

	> qemu-system-x86_64 -hda lubuntu.qcow2 -vnc:1rm 

Ésta vez no se abrirá ninguna ventana se quedará ejecutandose en segundo plano. Ahora nos conectaremos a través del cliente VNC que nos hemos instalado, para ello ejecutamos ifconfig para comprar la dirección de la máquina.

![Ejercicio4_2](http://i.imgur.com/O8Q9CP0.png)

Y ahora nos conectaremos y nos aparecerá un ventana donde nos aparecerá el entorno de nuestra máquina de forma remota.

	> vinagre 192.168.122.1:5901

![Ejercicio4_3](http://i.imgur.com/tPIZNkp.png)

Después de ver cómo conectarnos con VNC vamos a hacerlo a través de SSH. Para ello lo primero que haremos será arrancar nuestra máquina e instalar el paquete ssh:

	> apt-get update
	> apt-get install ssh

Una vez instalado, accederemos desde nuestra máquina local con el usuario que creamos al instalar el SO y la ip de la máquina virtual. Al ejecutar la máquina deberemos hacerlo de la siguiente forma para redirigir el puerto del ssh.

	> qemu-system-x86_64 -boot order=c -drive file=lubuntu.qcow2 -m 2G -redir tcp:3333::22

![Ejercicio4_4](http://i.imgur.com/Ds2Xuhe.png)

#Ejercicio 6

Crear una máquina virtual con ubuntu e instalar un servidor nginx usando juju. Lo primero que haremos será instalar el GUI de juju:

	> juju deploy juju-gui
	> juju expose juju-gui

A continuación ejecutamos "juju status" para ver la configuración y la ip pública para poder acceder desde el navegador.

![Ejercicio6_1](http://i.imgur.com/rIZmIYZ.png)

Una vez en el navegador accedemos a juju (debajo del formulario nos dice donde encontrar el password), a continuación en el panel de la izquierda buscamos el servicio nginx y lo añadimos y activamos.

![Ejercicio6_2](http://i.imgur.com/5SSijb8.png)

![Ejercicio6_3](http://i.imgur.com/MUg2z13.png)


##Tema 7

#Ejercicio 1

Instalar chef en la máquina virtual que vayamos a utilizar, en nuestro caso Lubuntu.

	> curl -L https://www.opscode.com/chef/install.sh | sudo bash

![Ejercicio1_1](http://i.imgur.com/rm7aMJY.png)

#Ejercicio 2

Vamos a crear una receta para instalar nginx, un editor y algún directorio. Para ello hemos creado una serie de documentos y directorios ordenados en jerarquía de ésta forma:

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

- Contenido del fichero cookbooks/emacs/recipes/default.rb

```sh
	package 'emacs'
	directory '/home/cristinara/DocumentosIV'
	file "/home/cristinara/DocumentosIV/fichero" do
        	owner "cristinara"
        	group "cristinara"
        	mode 00544
        	action :create
        	content "Directorio para documentos de la asignatura IV"
	end
```

- Contenido del fichero cookbooks/nginx/recipes/default.rb

```sh
	package 'nginx'
	directory '/home/cristinara/EjerciciosTema7'
	file "/home/cristinara/EjerciciosTema7/ejercicio2" do
        	owner "cristinara"
        	group "cristinara"
        	mode 00544
        	action :create
        	content "Directorio para los ejercicios del tema 7"
	end
```

- Contenido del fichero node.json

```sh
	{
		"run_list": [
		            "recipe[emacs]",
		            "recipe[nginx]"
		            ]
	}
```

- Contenido del fichero solo.rb

```sh
	file_cache_path "/home/cristinara/chef"
	cookbook_path "/home/cristinara/chef/cookbooks"
	json_attribs "/home/cristinara/chef/node.json"

```

Una vez creados los archivos ejecutaremos la siguiente instrucción:

	> sudo chef-solo -c chef/solo.rb

Y se nos crearán el directorio, el fichero y se nos instalará el paquete nginx además de emacs.

#Ejercicio 3

Ahora escribiremos en YAML la siguiente estructura de datos en JSON: { uno: "dos", tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }. Para realizarlo me he guiado de alguna [documentación](http://playdoces.appspot.com/documentation/1.2.4/yaml).

- Em YAML sería:

	.uno: "dos"
	.tres:
		.4
		.5
		.seis
		.
			.siete: 8
			.nueve:
				.10
				.11

#Ejercicio 6

Intalar una máquina Debian usando Vagrant. Lo primero que haremos será instalar Vagrant.

	> sudo apt-get install vagrant

Ahora ejecutaremos la siguiente instrucción cogiendo de la siguiente [web](http://www.vagrantbox.es/) la url correspondiente al sistema (Debian) que vamos a instalar.

![Ejercicio6_1](http://i.imgur.com/OUXg90b.png)

Antes de poder inicializar la máquina debemos crear el fichero Vagrantfile para poder trabajar con ella. Una vez creado la inicializamos.

![Ejercicio6_2](http://i.imgur.com/Q1iL57i.png)

Y por último para conectarnos por SSH sólo tendremos que escribir:

	> vangrant ssh

#Ejercicio 7

Crear un script para provisionar nginx o cualquier otro servidor web.
Para instalar nginx en nuestra máquina Debian, podemos hacerlo desde el mismo fichero Vagrantfile. Lo abrimos y añadimos un par de líneas de forma que el fichero nos quede tal que así:

![Ejercicio7_1](http://i.imgur.com/BLcsEui.png)

#Ejercicio 8

Configurar tu máquina virtual usando vagrant con el aprovisionador ansible. Primero añadiremos crearemos el archivo ansible_host y le añadiremos la dirección de nuestra máquina virtual. A continuación como hemos visto en ejemplos anteriores guardaremos la ruta de ese archivo en una variable de entorno para que ansible sepa donde se encuentra.

![Ejercicio8_1](http://i.imgur.com/OdcOP52.png)

Y ahora tal y como hicimos en el ejercicio anterior tendremos que modificar el archivo Vagrantfile para use ansible, el archivo nos quedará así:

![Ejercicio8_2](http://i.imgur.com/qjdGLJc.png)

Sólo nos falta configurar el archivo nginx.yml para que realice las configuraciones que queremos (como por ejemplo instalar nginx).

![Ejercicio8_3](http://i.imgur.com/1S0jYH3.png)

Y para finalizar ejecutamos la siguiente instrucción para alzar la máquina de forma explícita y ejecutar las acciones que hemos configurado en el fichero.

	> vagrant provision
