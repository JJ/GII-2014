## Tema 3.

**Ejercicio 1.** Crear un espacio de nombres y montar en él una imagen ISO de un CD de forma que no se pueda leer más que desde él. Pista: en ServerFault nos explican como hacerlo, usando el dispositivo loopback.

En primer lugar vamos a ver como montar un espacio de nombres. Para ello es necesario ejecutar en nuestra terminal los siguientes comandos.

```sh
sudo unshare -u /bin/bash
hostname jesusIV
hostname
exit
hostname
```
Cuando ejecutamos el primer comando estamos creando un espacio de nombres UTS(Unix Time Sharing System), ejecutamos el segundo comando para ver como se ha creado el espacio de nombres con el nuevo nombre dado, y tercero verificamos que al salir al introducir el comando exit el espacio de nombres es el mismo que teniamos al principio, es decir antes de ejecutar la orden unshare -u /bin/bash.

En esta captura de pantalla podemos ver el proceso descrito anteriormente.

<a href="http://es.tinypic.com?ref=2mowcqd" target="_blank"><img src="http://i58.tinypic.com/2mowcqd.png" border="0" alt="Image and video hosting by TinyPic"></a>

Ahora vamos a proceder a realizar en apartado dos del ejecicio 1 montaje de una imagen ISO.

Para ello es necesasario llevar a cabo los siguientes pasos:
En primer lugar obtenemos la ISO a montar en mi caso he elegido ubuntu-12.04.3-server-i386.iso
He creado un directorio /mount/disk para montar la imagen aqui y por último he ejecutado la orden en terminal mount -o loop ubuntu-12.04.3-server-i386.iso mount/disk

En esta imagen podemos ver el proceso realizado: 
<a href="http://es.tinypic.com?ref=lusxw" target="_blank"><img src="http://i58.tinypic.com/lusxw.png" border="0" alt="Image and video hosting by TinyPic"></a>

Aqui podemos ver la ISO ya montada en mi máquina.
<a href="http://es.tinypic.com?ref=fyftat" target="_blank"><img src="http://i62.tinypic.com/fyftat.png" border="0" alt="Image and video hosting by TinyPic"></a>


**Ejercicio 2.** 

1. Mostrar los puentes configurados en el sistema operativo.

Para poder usar el comando bcrlt addr nombrePuente es necesario instalar dicho paquete para ello ejecutamos el comando:

```
sudo apt-get install bcrlt
```

Para ver las interfaces de red utilizamos la siguiente orden:

```
ip addr show
```
<a href="http://es.tinypic.com?ref=314w6ki" target="_blank"><img src="http://i57.tinypic.com/314w6ki.png" border="0" alt="Image and video hosting by TinyPic"></a>

Usamos el comando bcrl show para ver los puentes que tenemos disponibles.

```
bcrlt show
```
<a href="http://es.tinypic.com?ref=2hxobqc" target="_blank"><img src="http://i57.tinypic.com/2hxobqc.png" border="0" alt="Image and video hosting by TinyPic"></a>


2. Crear un interfaz virtual y asignarlo al interfaz de la tarjeta wifi, si se tiene, o del fijo, si no se tiene.

Para crear un puente es necesario ejecutar la siguiente orden:

```
bcrlt addbr puenteIV
```
En la imagen podemos ver el puente:
<a href="http://es.tinypic.com?ref=2hxobqc" target="_blank"><img src="http://i57.tinypic.com/2hxobqc.png" border="0" alt="Image and video hosting by TinyPic"></a>

Asignamos un interfaz de red mediante el comando:

```
bcrlt addif puenteIV eth0
```
<a href="http://es.tinypic.com?ref=vgj3vn" target="_blank"><img src="http://i59.tinypic.com/vgj3vn.png" border="0" alt="Image and video hosting by TinyPic"></a>



**Ejercicio 3.**

1. Usar debootstrap (o herramienta similar en otra distro) para crear un sistema mínimo que se pueda ejecutar más adelante.

Instalamos debootstrap con el comando:
```
sudo apt-get install debootstrap
```

Ahora procedemos a la creación de la distribución para ello ejecutamos la siguiente orden:
```
sudo debootstrap --arch=i386 saucy /home/jaulas/saucy32/ http://archive.ubuntu.com/ubuntu
```

<a href="http://es.tinypic.com?ref=16kap1j" target="_blank"><img src="http://i58.tinypic.com/16kap1j.png" border="0" alt="Image and video hosting by TinyPic"></a>

2. Experimentar con la creación de un sistema Fedora dentro de Debian usando Rinse. 

Instalamos rinse.

```
sudo apt-get install rinse
```

Mostramos las distribuciones disponibles con el comando: 

```
/usr/sbin/rinse --list-distributions

```
<a href="http://es.tinypic.com?ref=2vnqi44" target="_blank"><img src="http://i58.tinypic.com/2vnqi44.jpg" border="0" alt="Image and video hosting by TinyPic"></a>

Instalamos una distribución de fedora:

```
sudo rinse --arch=amd64 --distribution fedora-core-10 --directory /home/jaulas/
```

<a href="http://es.tinypic.com?ref=2zs5pmo" target="_blank"><img src="http://i57.tinypic.com/2zs5pmo.png" border="0" alt="Image and video hosting by TinyPic"></a>


**Ejercicio 4.** Instalar alguna sistema debianita y configurarlo para su uso. Trabajando desde terminal, probar a ejecutar alguna aplicación o instalar las herramientas necesarias para compilar una y ejecutarla.


**Ejercicio 5.** Instalar una jaula chroot para ejecutar el servidor web de altas prestaciones nginx.

**Ejercicio 6.** Crear una jaula y enjaular un usuario usando `jailkit`, que previamente se habrá tenido que instalar.

Vamos a proceder en primer lugar a realizar la instalación de jailkit.
```
wget http://olivier.sessink.nl/jailkit/jailkit-2.17.tar.gz

```

Descomprimimos el archivo, nos posicionamos en la carpeta contenedora y ejecutmos:

```
./configure && make && sudo make install
```
Creamos una nueva jaula.

```
sudo mkdir /home/jaulas/la_isla sudo jk_init -v -j /home/jaulas/la_isla jk_lsh basicshell netutils editors
```

A continuación creamos un usuario y lo enjaulamos:

```
sudo adduser usuario
```

```
sudo jk_jailuser -m -j /home/jaulas/la_isla usuario
```

