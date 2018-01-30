#2 Mostrar los puentes configurados en el sistema operativo.Crear un interfaz virtual y asignarlo al interfaz de la tarjeta wifi, si se tiene, o del fijo, si no se tiene.
Primero se muestran las interfaces con iwconfig
Despues se crea la interfaz virtual y se asigna a la interfaz ethernet por que a la wifi no me deja
![Imgur](http://i.imgur.com/4xlgoXE.png)
#3 Usar debootstrap (o herramienta similar en otra distro) para crear un sistema mínimo que se pueda ejecutar más adelante.Experimentar con la creación de un sistema Fedora dentro de Debian usando Rinse.
Sistema fedora
![Imgur](http://i.imgur.com/vuj8GEy.png)
![Imgur](http://i.imgur.com/sZLIZAc.png)

#4 Instalar alguna sistema debianita y configurarlo para su uso. Trabajando desde terminal, probar a ejecutar alguna aplicación o instalar las herramientas necesarias para compilar una y ejecutarla. 
Instale un ubuntu 14.10 con debootstrap similar al ejercicio anterior instalando fedora, como se ve se puede usar g++ y top y se puede instalar cualquier herramienta o aplicacion dentro de el.
![Imgur](http://i.imgur.com/TLfXFSJ.png)
![Imgur](http://i.imgur.com/IoDO3ur.png)
#5 Instalar una jaula chroot para ejecutar el servidor web de altas prestaciones nginx.
Usando el ubuntu del ejercicio anterior usarlo como jaula y instalar en el nginx.

sudo chroot /home/jaulas/utopic
sudo apt-get install nginx
![Imgur](http://i.imgur.com/6sY2twT.png)
una vez instalado en mi caso habia otro proceso en el puerto 80 lo cerre con
sudo fuser -k 80/tcp
y despues inicias nginx y listo
sudo service nginx start
![Imgur](http://i.imgur.com/ms5OmJA.png)
#6 Crear una jaula y enjaular un usuario usando `jailkit`, que previamente se habrá tenido que instalar. 
Primero descargamos jailkit de su pag oficial, ejecutamos los comando como viene en los ejemplos.
	./configure && make && sudo make install

Despues creamos un directorio para la jaula y ponemos a root como propietario
	mkdir -p /home/jaulas/dorada
	chown -R root:root /home/jaulas/dorada

Iniciamos jailkit en el directorio y creamos la jaula
	jk_init -v -j /home/jaulas/dorada jk_lsh basicshell netutils editors
![Imgur](http://i.imgur.com/QCImYAL.png)
Creamos el usuario en el sistema y luego lo añadimos a la jaula
	sudo adduser enjaulado
	sudo jk_jailuser -m -j /home/jaulas/dorada enjaulado
![Imgur](http://i.imgur.com/G1jKVpF.png)
Y cambiamos su shell en /home/jaulas/dorada/etc/passwd por /bin/bash
![Imgur](http://i.imgur.com/ImBMAyb.png)
