Ejercicio 1.
---
1) 

[Particionado del disco.](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/1.1.jpg)

[Volúmenes lógicos.](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/1.2.jpg)

2) La facultad usa un NFS.

Ejercicio 2.
---
1. [Bajamos fuse sshfs.](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/2.1.jpg)
2. [Lo instalamos.](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/2.2.jpg)
3. Añadimos a FUSE el usuario con el que nos conectaremos: *usermod -aG fuse javi*
4. Para acceder a los ficheros de la carpeta del remoto como si fuesen locales:  *sshfs javi@IP_del_remoto:/home/javi/ /home/javi/*

Ejercicio 3.
---
1. [Creamos una imagen .img.](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/3.1.jpg)
2. [Mostramos los bloques que ha usado: ls -lks ficheroiv.img.](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/3.2.jpg)
3. [Creamos una imagen .qcow2.](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/3.2.jpg)
4. [Creamos una imagen .vmdk.](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/3.3.jpg)

Ejercicio 4.
---
1. [Creamos las imágenes.](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/4.1.jpg)
2. Convertimos las imágenes en un dispositivo loop: sudo losetup -v -f xfs.img y sudo losetup -v -f btrfs.img
3. Formateamos cada uno: *sudo mkfs.xfs /dev/loop2 sudo mkfs.btrfs /dev/loop3*
5. Comprobamos el rendimiento: *dd if=/dev/urandom of=archivo bs=4k count=15k*
6. Hacemos copias de los ficheros con el tiempo de ejecución: *time cp archivo /mnt/loop2/archivo* y *time cp archivo /mnt/loop3/archivo*

Ejercicio 5.
---
1. [Instalamos CEPH.](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/5.1.jpg)

Ejercicio 6.
---
1. Creamos el directorio para almacenar CEPH: *mkdir -p /srv/ceph/{osd,mon,mds}*
2. [Creamos el ceph.conf](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/6.1.jpg)
3. [Creamos el directorio donde se guardará el objeto.](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/6.2.jpg)
4. [Creamos el sistema de ficheros.](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/6.2.jpg)
5. [Iniciamos el servicio.](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/6.3.jpg)
6. Creamos el directorio que se usará como punto de montaje: *sudo mkdir /mnt/ceph.*
7. Lo montamos: *sudo mount -t ceph javi-virtual-machine:/ /mnt/ceph*

Ejercicio 7.
---
1. [Almacenamos usando rados.](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/7.1.jpg)

Ejercicio 8.
---
1. [Instalamos node.js](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/8.1.jpg)
2.  [Instalamos el cliente azure: npm install azure-cli -g](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/8.2.jpg)
3. [Ejecutamos "azure account download"](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/8.3.jpg)
4. [Nos da un enlace para iniciar sesión y descargar el archivo de la cuenta.](https://github.com/Jarotru/IV/blob/master/Ejercicios/Tema5_Imagenes/8.4.jpg)
5. Importamos el archivo: *azure account import _archivo_*
6. Y usamos los siguientes comandos para configurar la cuenta:

> azure account storage create jarotru
  
> azure account storage keys list jarotru
  
> export AZURE_STORAGE_ACCOUNT=jarotru
  
> export	AZURE_STORAGE_ACCESS_KEY= _laclave_

Ejercicio 9.
---
1. Creamos el contendor: *azure storage container create pruebaiv -p blob*
2. Subimos una imagen al contenedor: *azure storage blob upload /home/javi/prueba/img.jpg pruebaiv img.jpg*
