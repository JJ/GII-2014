TEMA 3
=========


##Ejercicio 1##

#####Crear un espacio de nombres y montar en él una imagen ISO de un CD de forma que no se pueda leer más que desde él. Pista: en [ServerFault](http://serverfault.com/questions/198135/how-to-mount-an-iso-file-in-linux) nos explican como hacerlo, usando el dispositivo loopback#####

Ejecutamos el comando

`mount -o loop ISO.iso /mnt/ISO`


##Ejercicio 2##

Los puentes configurados en el sistema operativo son:

![Mostrando los puentes configurados](https://raw.githubusercontent.com/yonatan24891/ImagenesIV/master/show.bmp)

Como vemos no tenemos ningún puente actualmente.

Creamos una interfaz virtual asignada a la tarjeta de red son:

$sudo brctl addbr nuevopuente
$sudo brctl addif nuevopuente eth0
Se activa la interfaz aplicando ifconfig nuevopuente up

##Ejercicio 3##

Instalamos debootstrap.

```sudo aptitude install debootstrap```

Utilizamos el comando:

```sudo debootstrap --arch=amd64 saucy /home/jaulas/saucy64/ http://archive.ubuntu.com/ubuntu```

**Experimentar con la creación de un sistema Fedora dentro de Debian usando Rinse.**

Instalamos rinse:

```sudo aptitude install rinse```

Utilizamos el comando:

```sudo rinse --arch=amd64 --distribution fedora-core-6 --directory /home/jaulas/fedora/```

##Ejercicio 4##

Entramos en la jaula creada anteriormente:

![chroot](https://raw.githubusercontent.com/yonatan24891/ImagenesIV/master/chroot.jpg)

Montamos el sistema de ficheros  e instalamos el paquete de lenguaje:

```mount -t proc proc /proc```
```apt-get install language-pack-es```

Instalamos una aplicacion:

![nano](https://raw.githubusercontent.com/yonatan24891/ImagenesIV/master/nano.jpg)

##Ejercicio 5##

Lo primero, debemos añadir los repositorios de nginx, mediante nano, que hemos instalado en el apartado anterior

```nano /etc/apt/sources.list```

Añadimos los repositorios siguientes:

```deb http://nginx.org/packages/ubuntu/ saucy nginx```

```deb-src http://nginx.org/packages/ubuntu/ saucy nginx```

Instalamos wget y descargamos la key del repositorio y la añadimos:

```apt-get install wget```

```wget http://nginx.org/keys/nginx_signing.key```

```apt-key add nginx_signing.key```

Actualizamos los repositorios del sistema e instalamos nginx:

```apt-get update```

```apt-get install nginx```

Lanzamos el servidor:

```service nginx start```

##Ejercicio 6##

Nos descargamos jailkit desde la página

Descomprimimos e instalamos la herramienta:

```tar -xzvf jailkit-2.17.tar.gz```

```cd jailkit-2.17```

```sudo ./configure && make && sudo make install```

Creamos una nueva jaula:

```sudo mkdir /home/jaulas/ejercicio6```

Iniciamos la jaula:

```sudo jk_init -v -j /home/jaulas/ejercicio6 jk_lsh basicshell netutils editors```

Creamos un usuario nuevo y lo "enjaulamos":
```sudo adduser user```

```sudo jk_jailuser -m -j /home/jaulas/ejercicio6 user```
