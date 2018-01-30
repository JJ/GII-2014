#TEMA 3: Introducción a la infraestructura virtual: concepto y soporte físico#

##Ejercicio 1##

#####Crear un espacio de nombres y montar en él una imagen ISO de un CD de forma que no se pueda leer más que desde él. Pista: en ServerFault nos explican como hacerlo, usando el dispositivo loopback.#####

Usaremos unshare con la opción -u, indicando así que vamos a crear un espacio de nombres Unix Time Sharing System (UTS). A continuación comprobamos que es corecto con la orden hostname:

```shell
sudo unshare -u /bin/bash
hostname ejercicios
```

Para montarlo adecuadamente deberá existir la carpeta destino en /mnt, en mi caso se ha creado /mnt/IV. Usaremos el comando "mount" junto al especificador de opciones "-o", y como vemos en la captura se ha utilizado el loopback de Linux para montar archivos que contengan un sistema de archivos. No ha sido necesario especificar si se trata de una imagen iso9660 o udf:

```shell
$mount -o loop disk.iso /mnt/IV
```

##Ejercicio 2##
#####1. Mostrar los puentes configurados en el sistema operativo.#####

Para listar los puentes usaremos:

```shell
brctl show. 
```

#####2. Crear un interfaz virtual y asignarlo al interfaz de la tarjeta wifi, si se tiene, o del fijo, si no se tiene.#####

En este apartado primero hemos creado el puente:

```shell
addbr puenteIV 
```
Con $brctl show hemos comprobado que, aún existiendo, no le corresponde ninguna interfaz. Como en esta ocasión estoy trabajando con una conexión Ethernet, le añado la interfaz eth0:

```shell
brctl addif puenteIV eth0
```

Una vez tiene su MAC y se le ha asignado una interfaz podemos consultar de nuevo $brctl show y podemos consultar los interfaces con $ip addr show.

Si queremos, al acabar podemos deshacer los cambios:

```shell
brctl delif puenteIV eth0
brctl delbr puenteIV eth0
```

##Ejercicio 3##
#####1. Usar debootstrap (o herramienta similar en otra distro) para crear un sistema mínimo que se pueda ejecutar más adelante.#####

Para usar debootstrap deberemos indicar el tipo de arquitectura (32 bits), el nombre de la distribución que deseamos (Trusty Tahr), la ruta de instalación (/home/jaulas/trusty) y la dirección de Ubuntu:

```shell
debootstrap --arch=i386 trusty /home/jaulas/trustytahr/ http://archive.ubuntu.com/ubuntu
```

#####2. Experimentar con la creación de un sistema Fedora dentro de Debian usando Rinse.#####

Rinse (usado para "cualquier" distribución RPM desde "cualquier" distro Debian) no viene por defecto en Ubuntu 14.04:

```shell
sudo apt-get install rinse
```

Una vez instalado Rinse podemos experimentar con la creación del sistema Fedora, eligiendo, por ejemplo, Fedora 10:

```shell
rinse --arch i386 --distribution fedora-core-10 --directory /home/paco/fedora10
```

El proceso terminará con el mensaje: 
Final tidy...
Installation complete.


##Ejercicio 4##
#####Instalar algun sistema debianita y configurarlo para su uso. Trabajando desde terminal, probar a ejecutar alguna aplicación o instalar las herramientas necesarias para compilar una y ejecutarla.#####

Ya teníamos instalado Ubuntu en el ejercicio 3 (recordar que usamos $debootstrap --arch=i386 trusty /home/jaulas/trustytahr/ http://archive.ubuntu.com/ubuntu), por tanto usaremos ese:

```shell
chroot /home/jaulas/trustytahr
```

Si ejecutamos vim, por ejemplo, vemos que no está instalado. Lo instalamos con apt-get y luego lo probamos. 


##Ejercicio 5##

#####Instalar una jaula chroot para ejecutar el servidor web de altas prestaciones nginx.#####

Al tratar de instalar NGINX en la jaula de los ejercicios anteriores, podemos ver que no existe un candidato para la instalación, por lo que hay que añadir el repositorio.

1. Instalamos un editor de texto no gráfico (por ejemplo "nano").
2. Editamos la lista de repositorios 

```shell
nano /etc/apt/sources.list
```

3. Añadimos los repositorios

```shell
deb http://nginx.org/packages/ubuntu/ saucy nginx
deb-src http://nginx.org/packages/ubuntu/ saucy nginx
```

4. Instalamos el paquete wget 

```shell
apt-get install wget
```

5. Descargamos la clave del repositorio 
```shell
wget http://nginx.org/keys/nginx_signing.key
```

6. Añadimos la clave 

```shell
apt-key add nginx_signing.key
```

7. Actualizamos la lista de repositorios 

```shell
apt-get update
```

8. Instalamos NGINX 
```shell
apt-get install nginx
```

9. Ejecutamos el servicio 

```shell
service nginx start
```

10. Desde fuera de la jaula, accedemos a "localhost" utilizando un navegador y comprobamos que funciona


##Ejercicio 6##

#####Crear una jaula y enjaular un usuario usando 'jailkit', que previamente se habrá tenido que instalar.#####

Tras acceder a la página de jailkit y decargarlo, ejecutamos los siguientes comandos

```shell
tar -xzvf jailkit-2.17.tar.gz
cd jailkit-2.17
sudo ./configure && make && sudo make install
```

Se crea una nueva jaula y se inicia con jailkit:

```shell
sudo mkdir /home/jaulas/jailkit
sudo jk_init -v -j /home/jaulas/jailkit jk_lsh basicshell netutils editors
```

Se crea un usuario y se enjaula:

```shell
sudo adduser enjauladojailkit
sudo jk_jailuser -m -j /home/jaulas/jailkit enjauladojailkit
```

Tras esto, ya tendremos a nuestro usuario enjaulado.
