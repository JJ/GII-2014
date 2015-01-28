# Ejercicio 1 #
##Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.##

Vamos a proceder a instalar *lxc*. Para ello, vamos a ejecutar el siguiente comando:

<code>sudo apt-get install lxc</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-1.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-2.png">

Ahora vamos a comprobar si mi máquina es compatible. Para ello, ejecutaré el comando siguiente:

<code>lxc-checkconfig</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-3.png">

Tal y como podemos ver, mi máquina es compatible con *lxc*.

# Ejercicio 2 #
##Comprobar qué interfaces puente se han creado y explicarlos.##

Las interfaces que se han creado las podemos ver ejecutando el siguiente comando:

<code>brctl show</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-4.png">

También podemos comprobarlo ejecutando <code>ifconfig -a</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-5.png">

# Ejercicio 3 #
##1. Crear y ejecutar un contenedor basado en Debian.##

En este primer apartado vamos a crear un contenedor basado en Debian. Para ello, ejecutaremos los siguientes pasos:

+ En primer lugar, ejecutamos el comando <code>sudo lxc-create -t debian -n cont-debian</code>.

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-6.png">

+ Y ahora lo que haré será ejecutarlo con el comando <code>sudo lxc-start -n cont-debian</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-7.png">

##2. Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue.##

Ahora vamos a crear un contenedor basado en otra distribución, como Fedora por ejemplo. Para ello, solamente ejecutaré el comando <code>sudo lxc-create -t fedora -n cont-fedora</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-8.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-9.png">

Ahora vamos a proceder a arrancarlo. Para ello, ejecutaré <code>sudo lxc-start -n cont-fedora</code>. Y vemos que lo ejecuta perfectamente:

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-10.png">

# Ejercicio 4 #
##1. Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.##

Vamos a instalar *lxc-webpanel*. Para ello, vamos a ejecutar el comando siguiente:

<code>wget http://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-11.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-12.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-13.png">

Ahora para acceder al panel en el navegador, basta con poner *localhost:5000*, y nos pedirá que introduzcamos usuario y contraseña, y en ambos casos será *admin*.

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-14.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-15.png">

En el panel que hay en la parte inferior de la página podremos arrancar, parar y visualizar las máquinas que tengo instaladas.

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-16.png">

En este caso voy a parar por ejemplo la máquina *cont-debian* pulsando sobre el botón *Stop*.

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-17.png">

##2. Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.##

Vamos a proceder a editar uno de los contenedores. Para ello, el contenedor debe estar sin ejecutar, es decir en *stop*. Vamos a utilizar el contenedor que he detenido anteriormente. Ahora lo que haremos será clicar sobre el nombre del contenedor:

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-18.png">

Una vez dentro de la configuración del contenedor puedo restringir los recursos que puede usar: CPU shares, CPUs que se pueden usar y cantidad de memoria. Una vez hayamos realizado los cambios de configuración deseados, le daremos a *apply*.

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-19.png">

De esta manera restringiremos los recursos a nuestro antojo.

#Ejercicio 5#
##Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.##

Vamos a proceder a comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. En mi caso haré uso del famoso *Apache Benchmark*. Pero para empezar a utilizar *Apache Benchmark* deberemos instalarlo tanto en la jaula como en el contenedor. Para ello, ejecutaremos el siguiente comando:

<code>sudo apt-get install apache2-utils</code>

Y ahora procederemos a ejecutar el siguiente comando en ambos lados:

<code>ab -n 1000 -c 25 http://127.0.0.1/</code>

RESULTADO CONTENEDOR:

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-57.png">

RESULTADO JAULA:

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-58.png">

#Ejercicio 6#
##1. Instalar juju.##

Para proceder a instalar *juju*, lo primero que tenemos que hacer es añadir el repositorio de *juju*. Para ello, ejecutaremos lo siguiente:

<code>sudo add-apt-repository ppa:juju/stable</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-20.png">

Seguidamente actualizaremos:

<code>sudo apt-get update</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-21.png">

Y ahora procederemos a realizar la instalación:

<code>sudo apt-get install juju-core</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-22.png">

De esta manera ya tendremos instalado *juju* correctamente.

##2. Usándolo, instalar MySQL en un táper.##

En esta parte del ejercicio vamos a proceder a instalar MySQL, pero antes de nada vamos a seguir una serie de pasos para configurar *juju* de manera que podamos trabajar en local:

+ En primer lugar, iniciamos *juju*:	<code>juju init<code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-23.png">

+ Ahora iremos al archivo de configuración *.juju/environments.yaml* y lo editaremos. Para ello, haremos <code>sudo nano .juju/environments.yaml </code>.

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-24.png">

+ Y cambiaremos la línea de <code>default: amazon</code> por <code>default: local</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-25.png">

+ Antes de continuar, necesitaremos instalar *MongoDB*. Para ello, ejecutaremos <code>sudo apt-get install mongodb-server</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-26.png">

+ Una vez que hemos instalado *mongodb*, solo nos quedará instalar el entorno local. Para ello, ejecutaremos <code>sudo apt-get install juju-local</code>.

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-27.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-28.png">

Ya tenemos configurado *juju* para trabajar en local. Ahora lo que haremos será uśandolo, instalar MySQL en un táper. Para ello, vamos a ejecutar el siguiente comando:

<code>juju bootstrap</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-29.png">

Con este comando juju lo creará y lo configurará por defecto. 

Ya tenemos el táper creado, así que solo nos queda instalar MySQL con el comando <code>sudo juju deploy mysql</code>.

Y por último, podremos comprobar que se ha instalado correctamente con el comando <code>sudo juju status</code>.

#Ejercicio 7#
##1. Destruir toda la configuración creada anteriormente.##

Para desmontar los servicios deberemos hacerlo en orden inverso a la creación realizada anteriormente, así que lo primero que deberemos hacer es desmontar MySQL:

<code>sudo juju destroy-service mysql</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-30.png">

Y ahora procederemos a eliminarla con el comando <code>sudo juju destroy-machine 1</code> y ahora podremos comprobar que se ha eliminado con <code>sudo juju status</code>.

Por último, solo nos quedará eliminar el entorno mediante el comando <code>sudo juju destroy-environment local</code>.

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-31.png">

##2. Volver a crear la máquina anterior y añadirle mediawiki y una relación entre ellos.##

Ahora volveremos a ejecutar los pasos anteriores para crear un táper con mediawiki. Lo primero que haremos será ejecutar el siguiente comando:

<code>juju bootstrap</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-32.png">

Instalamos MySQL:

<code>juju deploy mysql</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-33.png">

Ahora vamos a establecer la relación con mediawiki.

+ Instalamos mediawiki con <code>juju deploy mediawiki</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-34.png">

+ Creamos la relación con <code>juju add-relation mediawiki:db mysql</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-35.png">

+ Ahora ejecutaremos <code>juju expose mediawiki</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-36.png">

Para comprobar que todo esta correctamente basta con ejecutar <code>juju status</code>

##3. Crear un script en shell para reproducir la configuración usada en las máquinas que hagan falta.##

Un script para reproducir la configuración usada en las máquinas anteriores es el siguiente:

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-37.png">

Y seguidamente lo ejecutaremos con *./script*, habiendole dado permisos de ejecución antes con el comando *chmod +x ./script*.

#Ejercicio 8#
##Instalar libvirt. Te puede ayudar esta guía para Ubuntu.##

Tal y como viene en la guía para ubuntu, para instalar *libvirt*, solo tendremos que ejecutar el siguiente comando:

<code>sudo apt-get install kvm libvirt-bin</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-38.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-39.png">

#Ejercicio 9#
##Instalar un contenedor usando virt-install.##

Para instalar un contenedor usando *virt-install* lo primero que tendremos que hacer es instalarlo:

<code>sudo apt-get install virtinst</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-40.png">

Ahora, antes de continuar, lo que haremos será descargar una de las imágenes que vamos a instalar. Para ello, ejecutaremos lo siguiente:

<code>sudo wget http://releases.ubuntu.com/14.04/ubuntu-14.04-desktop-amd64.iso</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-41.png">

A continuación, una vez que tenemos descargada la imagen, vamos a crear el contenedor con *virt-install*. Para ello, ejecutaremos el siguiente comando:

<code>sudo virt-install -n ejercicio9 -r 512 --disk path=/var/lib/libvirt/images/ubuntu_ejercicio9.img,bus=virtio,size=4 -c ubuntu-14.04-desktop-amd64.iso --accelerate --network network=default,model=virtio --connect=qemu:///system --vnc --noautoconsole -v</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-42.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-43.png">

#Ejercicio 10#
##Instalar docker.##

En este ejercicio vamos a proceder a instalar *docker*. Para su instalación, tendremos que seguir los siguientes pasos:

+ En primer lugar actualizaremos con <code>sudo apt-get update</code> y seguidamente utilizaremos el comando <code>sudo apt-get install docker.io</code>.

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-46.png">

+ Activaremos los comando de docker en bash:

<code>source /etc/bash_completion.d/docker.io</code>

+ Ahora necesitaremos instalar el paquete *apt-transport-https*. Para ello, ejecutaremos <code>sudo apt-get install apt-transport-https</code>.

+ Añadimos el repositorio de *docker*:

<code>sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9</code>

+ Y finalmente, para acabar, ejecutaremos los siguientes comandos:

<code>sudo sh -c "echo deb https://get.docker.com/ubuntu docker main /etc/apt/sources.list.d/docker.list"</code>

<code>sudo apt-get update</code>

<code>sudo apt-get install lxc-docker</code>

<code>curl -sSL https://get.docker.com/ubuntu/ | sudo sh</code>

+ Para comprobar que todo ha funcionado, ejecutaremos <code>sudo docker run -i -t ubuntu /bin/bash</code>.

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-47.png">

+ Ahora ejecutamos el siguiente comando:

<code>sudo docker -d &</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-48.png">

+ Esto nos dara un pequeño fallo, para arreglarlo solo tendremos que ejecutar:

<code>rm /var/run/docker.sock</code>
<code>rm /var/run/docker.pid</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-49.png">

+ Volvemosa ejecutar la orden anterior y listo:

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-50.png">

#Ejercicio 11#
##1. Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.##

Vamos a instalar en primer lugar una imagen de ubuntu. Para ello, ejecutaremos lo siguiente:

<code>sudo docker pull ubuntu</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-51.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-52.png">

Y de la misma manera instalaremos una imagen de CentOS, utilizando el comando <code>sudo docker pull centos</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-53.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-54.png">

##2. Buscar e instalar una imagen que incluya MongoDB.##

*dockerfile/mongodb* es una imagen que incluye *MongoDB*. Para su instalación, basta con ejecutar el siguiente comando:

<code>sudo docker pull dockerfile/mongodb</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-55.png">

<img src="https://github.com/javiergama8/Images/blob/master/Tema4-56.png">

#Ejercicio 12#
##Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.##

+ Lo primero que haremos será entrar en el contenedor, es decir, ejecutarlo:

<code>sudo docker run -i -t ubuntu /bin/bash</code>

+ Ahora añadiremos un nuevo usuario:

<code>useradd -d /home/usuario -m usuario</code>

<code>passwd usuario</code>

+ A continuación, vamos a añadir el usuario al grupo "sudo"(administrador):

<code>adduser usuario sudo</code>

+ Para loguearnos ejecutaremos el siguiente comando:

<code>login usuario</code>

+ Con esto ya habremos acabado con la gestión del usuario. Ahora vamos a pasar a instalar *nginx*. Para ello, vamos a ejecutar el siguiente comando:

<code>sudo apt-get install nginx</code>

+ Y tan solo nos quedará poner en marcha el servicio con el comando siguiente:

<code>sudo service nginx start</code>

#Ejercicio 13#
##Crear a partir del contenedor anterior una imagen persistente con commit.##

Para crear una imagen persistente con commit a partir del contenedor anterior, deberemos seguir los siguientes pasos:

+ En primer lugar, teniendo docker arrancado, vamos a ejecutar la siguiente orden:

<code>sudo docker ps -a=false</code>

+ Y ahora procederemos a crear la imagen persistente en nuestro contenedor. Para ello, vamos a ejecutar la siguiente orden:

<code>sudo docker commit ID</code>

"Siendo la *ID* la proporciona en la ejecución del comando anterior".

#Ejercicio 14#
##Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.##


