
Técnicas de virtualización
====================================================================

Ejercicio 1
-----------

**Crear un espacio de nombres y montar en él una imagen ISO de un CD de forma que no se pueda leer más que desde él. Pista: en [ServerFault](http://serverfault.com/questions/198135/how-to-mount-an-iso-file-in-linux) nos explican como hacerlo, usando el dispositivo loopback.**

Para crear un espacio de nombres:
```bash
sudo unshare -u /bin/bash
hostname test
```
![img](https://dl.dropboxusercontent.com/u/22433100/IV/t3/1_1.png)
Ahora paso a montar en él una imagen ISO:
```bash
# Carpeta donde voy a montar el ISO
mkdir /mnt/iso

# Para montar la imagen, en mi caso una de ubuntu
mount -o loop ubuntu-14.04.1-desktop-amd64.iso /mnt/iso
```
![1_2.png](https://dl.dropboxusercontent.com/u/22433100/IV/t3/1_2.png)


Ejercicio 2
-----------

**1. Mostrar los puentes configurados en el sistema operativo.**
```bash
# Muestra los puentes configurados.
brctl show
```
![2_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t3/2_1.png)

**2. Crear un interfaz virtual y asignarlo al interfaz de la tarjeta wifi, si se tiene, o del fijo, si no se tiene.**
```bash
# Para crear un nuevo puente.
sudo brctl addbr puente

# Añado el puente a la interfaz 
sudo brctl addif puente virbr0
```


Ejercicio 3
-----------

**1. Usar debootstrap (o herramienta similar en otra distro) para crear un sistema mínimo que se pueda ejecutar más adelante.**

Instalo debootstrap:
```bash
sudo apt-get install debootstrap
```
Uso el comando que nos indica la [teoria](http://jj.github.io/IV/documentos/temas/Tecnicas_de_virtualizacion) para debootstrap:
```bash
sudo debootstrap --arch=i386 trusty /home/jaulas/trusty/ http://archive.ubuntu.com/ubuntu
```
Una vez que se a terminado de crear el sistema, nos aparecerá lo siguiente:
![3_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t3/3_1.png)

**Experimentar con la creación de un sistema Fedora dentro de Debian usando Rinse.**

```bash
# Instalo rinse
sudo apt-get install rinse
```
Ahora instalo fedora:
```bash
sudo rinse --arch=i386 --distribution fedora-core-6 --directory /home/jaulas/fedora/
```
![3_2.png](https://dl.dropboxusercontent.com/u/22433100/IV/t3/3_2.png)


Ejercicio 4
-----------

**Instalar alguna sistema debianita y configurarlo para su uso. Trabajando desde terminal, probar a ejecutar alguna aplicación o instalar las herramientas necesarias para compilar una y ejecutarla.**

Para este ejercicio voy a usar el ubuntu que instale en el ejercicio anterior.
Entro en la jaula de ubuntu:
```bash
sudo chroot /home/jaulas/trusty
```
Ahora monto proc como indica el guion de teoria:
```bash
mount -t proc proc /proc
```
Instalo el paquete de español que se indica:
```bash
apt-get install language-pack-es
```
Ahora paso a instalar por ejemplo nano :
```bash
apt-get install nano
```
![4_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t3/4_1.png)


Ejercicio 5
-----------

**Instalar una jaula chroot para ejecutar el servidor web de altas prestaciones nginx.**

Instalo nginx dentro de la jaula con:
```bash
# Instalar nginx
apt-get install nginx

# Iniciar nginx
service nginx start
```
Tras installar, si accedo desde fuera de la jaula a localhost, veré la pantalla de bienvenida de nginx.
![5_1.png](https://dl.dropboxusercontent.com/u/22433100/IV/t3/5_1.png)


Ejercicio 6
-----------

**Crear una jaula y enjaular un usuario usando `jailkit`, que previamente se habrá tenido que instalar.**

Descargo jailkit desde su [web](http://olivier.sessink.nl/jailkit/index.html#download) y lo instalo con:
```bash
sudo ./configure && make && sudo make install
```
Creo la carpeta oara ka nueva jaula:
```bash
sudo mkdir /home/jaulas/jaulajailkit
```
Para el uso de jailkit he seguido el [manual de esdebian.org](http://www.esdebian.org/wiki/enjaulado-facil-jailkit-chroot)
```bash
# Hago propietario a root
sudo chown root:root /home/jaulas/jaulajailkit

# Configuro la cuenta
sudo jk_init -v /home/jaulas/jaulajailkit basicshell
sudo jk_init -v /home/jaulas/jaulajailkit jk_lsh

# Añado herramientas
sudo jk_init -v /home/jaulas/jaulajailkit netutils
sudo jk_init -v /home/jaulas/jaulajailkit ssh
sudo jk_init -v /home/jaulas/jaulajailkit editors

# Creo usuario, asigno propietario y enjaulo
sudo jk_jailuser -m -j /home/jaulas/jaulajailkit santiago
sudo passwd santiago

mkdir -p /home/jaulas/jaulajailkit/./home/santiago
chown santiago:santiago /home/jaulas/jaulajailkit/./home/santiago
```



