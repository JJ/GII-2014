
Tema 5
======

Ejercicio 1
-----------

**¿Cómo tienes instalado tu disco duro? ¿Usas particiones? ¿Volúmenes lógicos?**

Uso particiones porque lo seleccioné explícitamente al instalar. Rechazé usar LVM para no añadir más complejidad a la instalación dado que yo ya tenía claro el tamaño de las particiones que necesitaba.


Ejercicio 2
-----------

**Usar FUSE para acceder a recursos remotos como si fueran ficheros locales. Por ejemplo, sshfs para acceder a ficheros de una máquina virtual invitada o de la invitada al anfitrión.**

Instalamos en las dos máquinas sshfs:

```shell
sudo apt-get install sshfs
```

Luego creamos una carpeta y montamos el sistema remoto en esa carpeta:

```shell
mkdir prueba
sudo chown ernesto:fuse prueba
sshfs ernesto@192.168.1.52:/home/ernesto prueba/
```

![](https://raw.githubusercontent.com/ernestoalejo/ivimages/master/img8.png)


Una vez montado el disco podemos ver y modificar el contenido de la máquina remota desde la nuestra:

![](https://raw.githubusercontent.com/ernestoalejo/ivimages/master/img9.png)


Para desactivar el disco remoto podemos usar:

```shell
fusermount -u prueba/
```


Ejercicio 8
-----------

**Tras crear la cuenta de Azure, instalar las herramientas de línea de órdenes (Command line interface, cli) del mismo y configurarlas con la cuenta Azure correspondiente**

Instalamos globalmente la herramienta de línea de comandos de Azure:

```shell
sudo npm install -g azure
```

Nos descargamos el fichero de configuración de nuestra cuenta:

```shell
azure account download
```

Una vez tengamos el fichero de configuración de la cuenta que vayamos a usar podemos ejecutar:

```shell
azure account import [fichero]
```

para introducirlo en el programa.

![](https://raw.githubusercontent.com/ernestoalejo/ivimages/master/img10.png)


Ejercicio 9
-----------

**Crear varios contenedores en la cuenta usando la línea de órdenes para ficheros de diferente tipo y almacenar en ellos las imágenes en las que capturéis las pantallas donde se muestre lo que habéis hecho.**

Necesitamos crear una nueva cuenta de almacenamiento y luego obtener las claves para usarlas en las peticiones.

```shell
azure storage account create ernesto
azure storage account keys list ernesto
```

Cogemos la clave que nos dan y la ponemos como variable de entorno:

```shell
export AZURE_STORAGE_ACCOUNT=ernesto
export AZURE_STORAGE_ACCESS_KEY=[key]
```

Creamos un nuevo contenedor:

```shell
azure storage container create ernesto-testing -p blob
```

![](https://raw.githubusercontent.com/ernestoalejo/ivimages/master/img11.png)

Podemos subir las imágenes usando:

```shell
azure storage blob upload img11.png ernesto-testing img11.png
```

![](https://raw.githubusercontent.com/ernestoalejo/ivimages/master/img12.png)
