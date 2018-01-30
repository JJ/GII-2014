# 1 Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Descargar de github lxc, ejecutar ./autogen.sh ;./configure ; make; sudo make install;
![Imgur](http://i.imgur.com/EihhvNG.png)
Para comprabar que se a instalado y esta bien configurado ejecutar lxc-checkconfig
![Imgur](http://i.imgur.com/YAZREy7.png)
Para crear un contenedor 
sudo apt-get install lxc
sudo lxc-create -t ubuntu -n my-container

Para empezar a usarlo
sudo lxc-start -n my-container


# 2 Comprobar qué interfaces puente se han creado y explicarlos.
![Imgur](http://i.imgur.com/BFkvZ9L.png)
lxcbr0 Esta es una interfaz puente que usa el contenedor de lxc creado como interfaz de red del contenedor. La direccion de puerta de enlace del contenedor sera la ip de esta interfaz en el anfitrion.

vethMP0JS1 
Es un dispositivo de red de pares se crea con un lado asignado al contenedor y el otro lado está unido a un puente especificado por el lxc.network.link
La interfaz del anfitrión será entonces un puente hasta el puente creado en el host si está configurado asi.

# 3 Crear y ejecutar un contenedor basado en Debian.Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue.
Para crear un contenedor debian y ejecutarlo, tras instalar lxc, usar la orden sudo lxc-create -t debian -n debianita, en ubuntu 14 crea y instala el contenedor pero no permite iniciarlo, en ubuntu 12.4 siguiendo los mismos paso si lo crea y lo inicia.
despues para ejecutarlo sudo lxc-start -n debianita
![Imgur](http://i.imgur.com/tS9rWrp.png)

Para instalar un contenedor fedora en ubuntu 12.4, lo unico que pide antes instalar es yum, sudo apt-get install yum
despues creamos el contenedor sudo lxc-create -t fedora -n contfedora
![Imgur](http://i.imgur.com/sPaY6p8.png)

#4 Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.
Instalar webpanel desde su web con wget http://lxc-webpanel.github.io/tools/install.sh -O - | bash
despues conectarse desde el navegador al localhost puerto 5000
http://localhost:5000
En mi caso me da un error y no me sale el usuario por defecto es admin y el pass admin
![Imgur](http://i.imgur.com/OrRoDts.png)
![Imgur](http://i.imgur.com/Ky1kwVu.png)

Tras unos minutos aparece esto pero no muestra la sesion iniciada
![Imgur](http://i.imgur.com/IWzzA2S.png)

#5 Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.
Instalamos apache para realizar el test de prestaciones
	sudo apt-get install apache2-utils
Iniciamos nginx en la jaula y en el contenedor y luego el test de apache con ab -n 100 -c 10 http://localhost/index.html
Esto es el test en la jaula
![Imgur](http://i.imgur.com/w8QWdUr.png)
Este el test en el contenedor
![Imgur](http://i.imgur.com/ZF2kaln.png)

En el contenedor es mas rapido que la jaula.










