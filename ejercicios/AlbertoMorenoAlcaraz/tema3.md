
Tema 3
======

Ejercicio 1
-----------

**Crear un espacio de nombres y montar en él una imagen ISO de un CD de forma que no se pueda leer más que desde él.**

Creamos un espacio de nombres usando los siguientes comandos:
```bash
sudo unshare -u /bin/bash
hostname test
```

Despues, para montar un iso, creamos una carpeta donde se va a montar el iso y lo montamos:
```bash
mkdir /mnt/imagen

mount -o loop imagen.iso /mnt/imagen
```

Ejercicio 2
-----------

**1. Mostrar los puentes configurados en el sistema operativo.**

Para mostrar los puentes que tenemos, usamos el comando:
```bash
brctl show
```

![t3ej2.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t3ej2.png)

**2. Crear un interfaz virtual y asignarlo al interfaz de la tarjeta wifi, si se tiene, o del fijo, si no se tiene.**

Creamos el nuevo puento con el siguiente comando:
```bash
sudo brctl addbr puente
```
Añadimos el puente creado a la interfaz:
```bash
sudo brctl addif puente wlan
```

Ejercicio 3
-----------

**1. Usar debootstrap (o herramienta similar en otra distro) para crear un sistema mínimo que se pueda ejecutar más adelante.**

Instalamos debootstrap, introduciendo el siguiente comando:
```bash
sudo apt-get install debootstrap
```

Como hemos visto en el guion de teoria, ejecutamos el comando debootstrap para crear un sistema:
```bash
sudo debootstrap --arch=i386 trusty /home/jaulas/trusty/ http://archive.ubuntu.com/ubuntu
```
![t3ej3.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t3ej3.png)


**2. Experimentar con la creación de un sistema Fedora dentro de Debian usando Rinse.**

Instalamos el paquete rinse para poder ejecutarlo:
```bash
sudo apt-get install rinse
```

Despues, instalamos fedora usando rinse:
```bash
sudo rinse --arch=i386 --distribution fedora-core-6 --directory /home/jaulas/fedora/
```
![t3ej3b.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t3ej3b.png)

Ejercicio 4
-----------

**Instalar alguna sistema debianita y configurarlo para su uso. Trabajando desde terminal, probar a ejecutar alguna aplicación o instalar las herramientas necesarias para compilar una y ejecutarla.**

Primero, entramos en una de las jaulas que hemos instalado antes(ubuntu, por ejemplo):
```bash
sudo chroot /home/jaulas/trusty
```

Despues, montamos proc como dice la teoria:
```bash
mount -t proc proc /proc
```

Instalamos el paquete en español:
```bash
apt-get install language-pack-es
```

Ahora por ejemplo, para ejecutar una aplicación, instalamos curl:
```bash
apt-get install curl
```

![t3ej4.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t3ej4.png)


Ejercicio 5
-----------

**Instalar una jaula chroot para ejecutar el servidor web de altas prestaciones nginx.**

Instalamos nginx en la jaula ubuntu, con el siguiente comando:
```bash
apt-get install nginx
```

Iniciamos el servicio nginx para poder usarlo:
```bash
service nginx start
```

Una vez iniciado el servicio, desde fuera de la jaula, usando un navegador, introducimos localhost en la barra de direcciones y nos aparecerá la pantalla de bienvenida de nginx.
![t3ej5.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t3ej5.png)


Ejercicio 6
-----------

**Crear una jaula y enjaular un usuario usando `jailkit`, que previamente se habrá tenido que instalar.**

Descargamos jailkit desde la pagina oficial de jailkit y lo instalamos con el siguiente comando:
```bash
sudo ./configure && make && sudo make install
```

Creamos la nueva jaula y iniciamos jailkit:
```bash
sudo mkdir /home/jaulas/jailkit
sudo jk_init -v -j /home/jaulas/jailkit jk_lsh basicshell netutils editors
```

Creamos un usuario nuevo y lo enjaulamos, con los siguiente comandos:
```bash
sudo adduser enjauladojailkit
sudo jk_jailuser -m -j /home/jaulas/jailkit enjauladojailkit
```

Una vez realizado esto, tenemos enjaulado un usuario nuevo.


