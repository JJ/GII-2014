
Tema 4
======

Ejercicio 1
-----------

**Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.**

Clonamos el repositorio:

```shell
git clone https://github.com/lxc/lxc
```

Siguiendo los pasos del fichero `INSTALL` ejecutamos los típicos comandos para instalar:

```shell
./autogen.sh
./configure
sudo make install
```

Como nota adicional tuve que instalar el paquete `automake` para que funcionase la compilación correctamente.


Ejercicio 2
-----------

**Comprobar qué interfaces puente se han creado y explicarlos.**

Nos descargamos el paquete y preparamos el contenedor:

```shell
sudo lxc-create -t ubuntu-cloud -n nubecilla
```

Procedemos después a iniciarlo:

```shell
sudo lxc-start -n nubecilla
```

Para ver los puentes de red que existen podemos usar el comando:

```shell
brctl show
```

Y nos muestra el puente `lxcbr0` con una sola interfaz `veth0GKDBX` que permite al contenedor conectarse a internet.

![](https://raw.githubusercontent.com/ernestoalejo/ivimages/master/img1.png)


Ejercicio 3
-----------

**1. Crear y ejecutar un contenedor basado en Debian.**

Usamos los siguientes comandos para instalar y ejecutar el contenedor:

```shell
sudo lxc-create -t debian -n tdeb
sudo lxc-start -n tdeb
```

Podemos verlo encendido aquí:

![](https://raw.githubusercontent.com/ernestoalejo/ivimages/master/img6.png)

**2. Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue.**

En mi caso voy a elegir CentOS (que es más estable que Fedora). Para ello uso:

```shell
sudo lxc-create -t centos -n tcentos
sudo lxc-start -n tcentos
```


Ejercicio 4
-----------

**1. Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.**

Instalamos siguiendo las instrucciones oficiales de su página web desde una consola donde seamos root:

```shell
wget http://lxc-webpanel.github.io/tools/install.sh -O - | bash
```

![](https://raw.githubusercontent.com/ernestoalejo/ivimages/master/img4.png)

**NOTA:** El contenedor de CentOS no aparece porque lo he borrado explícitamente con ```lxc-destroy``` y no quería crearlo de nuevo para la captura.


**2. Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.**

Podemos por ejemplo restringir la memoria a medio giga y a una sola CPU:

![](https://raw.githubusercontent.com/ernestoalejo/ivimages/master/img5.png)


Ejercicio 6
-----------

**1. Instalar juju.**

Usamos las instrucciones del sitio oficial de Juju que nos dice que ejecutemos:

```shell
sudo add-apt-repository ppa:juju/stable
sudo apt-get update && sudo apt-get install juju-core
```

También tenemos que instalar el paquete `juju-local` para poder usar el sistema en el entorno local.


**2. Usándolo, instalar MySQL en un táper.**

Inicializamos el entorno de Juju usando:

```shell
juju init
```

Y editamos las configuraciones para usar el proveedor local poniendo:

```yaml
default: local
```

en el fichero generado `~/.juju/environments.yaml`

Igualmente para poder usar el proveedor local necesitamos MongoDB (siguiendo las instrucciones del guión de prácticas):

```shell
sudo apt-get install mongodb-server
```

Podemos usar estos dos comandos para instalar y preparar MySQL:

```shell
juju bootstrap
juju deploy mysql
```


Ejercicio 7
-----------

**1. Destruir toda la configuración creada anteriormente**

```shell
juju destroy-service mysql
```


**2. Volver a crear la máquina anterior y añadirle mediawiki y una relación entre ellos.**

Usamos los comandos que nos provee el guión para hacer la tarea:

```shell
juju deploy mysql
juju deploy mediawiki
juju add-relation mediawiki:db mysql
juju expose mediawiki
```

Una vez inicializado todo podemos usar:

```shell
juju status
```

para obtener la configuración del sistema que estamos preparando y la dirección donde podemos verlo.

![](https://raw.githubusercontent.com/ernestoalejo/ivimages/master/img7.png)


Ejercicio 8
-----------

**Instalar libvirt. Te puede ayudar esta guía para Ubuntu.**

Instalamos el paquete:

```shell
sudo apt-get install libvirt-bin
```


Ejercicio 10
------------

**Instalar docker.**

Ya tenía docker previamente instalado para el proyecto de prácticas.


Ejercicio 14
------------

**Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.**

Nosotros en nuestro proyecto (Virtual Vulcano) ya estamos usando contenedores e imágenes que publicamos a Docker Hub. Incluso no solamente una sino varias.
