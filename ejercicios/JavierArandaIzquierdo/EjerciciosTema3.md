#Ejercicios Tema 3
###Ejercicio 1
#####Crear un espacio de nombres y montar en él una imagen ISO de un CD de forma que no se pueda leer más que desde él. Pista: en ServerFault nos explican como hacerlo, usando el dispositivo loopback

Primero usamos:

	sudo unshare -m /bin/bash
para crear un namespace con mount (es la opcion -m).

Despues creamos el directorio donde vamos a montar la ISO:

	sudo mkdir /mnt/ISO
    
Para finalizar montamos la imagen ISO:

	sudo mount -o loop -t iso9660 ~/Escritorio/ubuntu-14.04.1-server-i386.iso /mnt/ISO
    
###Ejercicio 2
#####1.Mostrar los puentes configurados en el sistema operativo.

Para mostrar los puentes que hay ya configurados en el S.O utilizamos la siguiente orden:

	ip add show
    

#####2.Crear un interfaz virtual y asignarlo al interfaz de la tarjeta wifi, si se tiene, o del fijo, si no se tiene.

Para crear un nuevo interface virtual utilizamos:

	`sudo brctl addbr puente`
    
Donde puente es el nuevo interface. Podemos comprobar que se ha creado correctamente con la orden del ejercicio 1.
Tras esto, la asignamos al interface de la tarjeta wifi, que en mi caso es wlan0:

	sudo brctl addif puente wlan0
    
###Ejercicio 3
#####1.Usar debootstrap (o herramienta similar en otra distro) para crear un sistema mínimo que se pueda ejecutar más adelante.

Para instalar debootstrap utilizaremos el siguiente comando: 
	
    sudo apt-get install debootstrap
    
Para crear el sistema utilizaremos la orden:

	sudo debootstrap --arch=i386 saucy /home/jaulas/saucy32/ http://archive.ubuntu.com/ubuntu
    
He utilizado una version de 32 bits porque no me funciono la version de 64 que habia en el guion.Tambien he intentado montarlo en un una carpeta en dropbox pero no he podido.
Al final, tras la espera de todo el proceso, tedremos que tener la siguiente orden para saber que ha tenido exito:

	I: Base system installed successfully


#####2.Experimentar con la creación de un sistema Fedora dentro de Debian usando Rinse.
Para crear un sistema Fedora tendremos que instalar rinse previamente, con la orden:

	sudo apt-get install rinse
    
Con Fedora si he podido instalar la version de 64 bit utilizando la siguiente orden:

	sudo rinse --arch=amd64 --distribution fedora-core-6 --directory /home/jaulas/fedora/
    
El resultado es este:

![foto](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer3tema3)
###Ejercicio 4
#####Instalar alguna sistema debianita y configurarlo para su uso. Trabajando desde terminal, probar a ejecutar alguna aplicación o instalar las herramientas necesarias para compilar una y ejecutarla.

Entramos en la jaula que hemos creado en el ejercicio 3 con el siguiente comando:

	sudo chroot /home/jaulas/saucy32

Ya estamos dentro de la maquina:
![foto](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer4-1tema3.png)
Ahora vamos a montar el sistema de archivos virtual /proc, lo hacemos con el siguiente comando:

	mount -t proc proc /proc
    
Y para comprobar que se ha instalado correctamente el sistema de archivos, ejecuto la orden top, la cual no funcionaba previamente:

![foto2](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/ejer4-2tema3.png)

###Ejercicio 5 
#####Instalar una jaula chroot para ejecutar el servidor web de altas prestaciones nginx.

Primeramente, instalamos el paquete nginx con la siguiente orden:

	apt-get install nginx
    
Al hacer esto, me dice que no encuentra el paquete de nginx. Ahora modificamos el archivo /etc/apt/sources.list y añadimos lo siguiente:
    
    echo "deb http://nginx.org/packages/ubuntu/ saucy nginx" >> /etc/apt/sources.list
    echo "deb-src http://nginx.org/packages/ubuntu/ saucy nginx" >> /etc/apt/sources.list
    
Tras esto, instalamos wget para descargar la clave de repositorio para instalar nginx, y lo hacemos con los siguientes comandos:

	wget http://nginx.org/keys/nginx_signing.key
    
Agregamos la clave:

	apt-key add nginx_signing.key
    
Y ya podemos instalar nginx. Ahora solo queda lanzar nginx con la orden:

	service nginx start
    
 Y este es el resultado de nginx funcionando:
 
 ![nginx](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/nginxFuncionando.png)

###Ejercicio 6
#####Crear una jaula y enjaular un usuario usando jailkit, que previamente se habrá tenido que instalar.

Antes de nada, tenemos que descargar jailkit, lo haremos de la siguiente direccion:

	wget http://olivier.sessink.nl/jailkit/jailkit-2.16.tar.gz
    
Tras esto y habiendo descomprimido el archivo, pasamos a abrir la carpeta jailkit y ejecutamos lo siguiente:

	./configure
    make
    sudo make install
    
Ahora creamos una nueva jaula y la iniciamos con jailkit con el siguiente comando:

	sudo jk_init -v -j /home/jaulas/jaulaEjer6 jk_lsh basicshell netutils editors
    
Y para terminar, creamos un usuario dentro de dicha jaula:

	sudo adduser pepito sudo jk_jailuser -m -j /home/jaulas/jaulaEjer6 pepito