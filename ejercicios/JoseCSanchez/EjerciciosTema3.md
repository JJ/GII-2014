# Jose Carlos Sánchez Hurtado

# Ejercicios tema 3

## Ejercicio 1

#### Crear un espacio de nombres y montar en él una imagen ISO de un CD de forma que no se pueda leer más que desde él. Pista: en ServerFault nos explican como hacerlo, usando el dispositivo loopback.

Para crear un espacio de nombres hay que usar el siguiente comando:

```sh
sudo unshare -u /bin/bash
```

Para montar una imagen ISO de un CD se utiliza el siguiente comando:

```sh
sh mount -o loop disk.iso /mnt/disk
```


## Ejercicio 2

#### 1. Mostrar los puentes configurados en el sistema operativo.

#### 2. Crear un interfaz virtual y asignarlo al interfaz de la tarjeta wifi, si se tiene, o del fijo, si no se tiene.

Para mostrar los puentes configurados en el sistema operativo se hace uso del comando:

```sh
ip addr show
```

En la siguiente captura de pantalla se puede comprobar la salida del comando:

![](http://fotos.subefotos.com/065cbc3435b6cba531d66218a33ed87bo.png)

Para crear un interfaz virtual primero creamos un puente nuevo con el siguiente comando:

```sh
sudo brctl addbr puente
```

Una vez creado, se lo asignamos a la wifi de nuestra máquina:

```sh
sudo brctl addif puente wlan0
```

Y por último, solo queda activarlo:

```sh
ifconfig puente up
```


## Ejercicio 3

#### 1. Usar debootstrap (o herramienta similar en otra distro) para crear un sistema mínimo que se pueda ejecutar más adelante.

#### 2. Experimentar con la creación de un sistema Fedora dentro de Debian usando Rinse.

Primero instalamos debootstrap con la orden apt-get.

```sh
sudo apt-get install debootstrap
```

Una vez instalado creamos nuestro sistema con la siguiente orden:

```sh
sudo ebootstrap --arch=i386 saucy /home/jose/saucy32/ http://archive.ubuntu.com/ubuntu
```

Para el uso de rinse, lo primero que habrá que hacer es instalarlo como cualquier paquete:

```sh
sudo apt-get install rinse
```

Por último creamos una distro de fedora:

```sh
rinse --arch=i386 --distribution fedora-core-6 --directory /home/jose/fedora
```


## Ejercicio 4

#### Instalar alguna sistema debianita y configurarlo para su uso. Trabajando desde terminal, probar a ejecutar alguna aplicación o instalar las herramientas necesarias para compilar una y ejecutarla. 

Primero instalo debian en la jaula:

```sh
sudo debootstrap --arch=i386 wheezy /home/jaula-iv/debian http://ftp.debian.org/debian/
```

![](http://fotos.subefotos.com/f098d924e52b35fe0a87904ddcfdbe88o.png)

Después paso a entrar en la jaula usando el comando **chroot**.

```sh
chroot /home/jaula-iv/debian
```

![](http://fotos.subefotos.com/1c5cef51353c9a85706f1c738dd3ca47o.png)

Para probar su funcionamiento, paso a crear un script en Python que imprime por pantalla el mensaje "Hola mundo".

Una vez creado, y habiendole dado permisos de ejecución, paso a ejecutarlo. Antes de ejecutarlo, habrá que instalar python en la jaula.

```sh
apt-get install python
```

![](http://fotos.subefotos.com/f7fde5a7516736bff70d96eb110c2024o.png)

## Ejercicio 6

#### Crear una jaula y enjaular un usuario usando `jailkit`, que previamente se habrá tenido que instalar. 

Como se indica en el enunciado del ejercicio, lo primero que hay que hacer es instalar jailkit.

```sh
wget http://olivier.sessink.nl/jailkit/jailkit-2.17.tar.gz
tar -xzvf jailkit-2.17.tar.gz
cd jailkit-2.17
./configure && make %% sudo make install
```

Una vez creado, paso a crear la jaula usando dicho paquete.

```sh
sudo mkdir /home/jose/jaula
jk_init -v -j /home/jose/jaula jk_lsh basicshell netutils editors
```