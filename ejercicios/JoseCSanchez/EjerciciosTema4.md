# Ejercicio tema 4

## Ejercicio 1

Para instalar LXC en nuestra máquina, ejecutamos la orden:

```sh
sudo apt-get install lxc lxc-templates
```


## Ejercicio 2

Usando el comando **ifconfig -a**, o el comando **brctl show** podemos ver que se ha creado la partición lxcbr0, que es la que utiliza el contenedor para el acceso a internet.

![](http://fotos.subefotos.com/40a936fcd8d754f13dab64723ed5f28bo.png)


## Ejercicio 3

Para crear y ejecutar el contenedor basado en Debian, ejecutamos los siguientes comandos:

```sh
sudo lxc-create -t debian -n ubuntu
sudo lxc-start -n ubuntu
```


## Ejercicio 4

Instalamos lxc-webpanel con el comando:

```sh
wget http://lxc-webpanel.github.io/tools/install.sh -O - | bash
```

![](http://fotos.subefotos.com/173a6979ebb1dbafbeeb1c95c364a970o.png)
![](http://fotos.subefotos.com/8a2d8d603f47b845d9a762191e36ca98o.png)

Una vez instalado, se accede desde el navegador en **http://localhost:5000**. Aparecerá un panel de acceso, donde introducimos el usuario y contraseña por defecto, los cuales son los dos **admin**. Una vez dentro, se elige la maquina virtual y ya podremos restringir los recursos de la máquina.

![](http://fotos.subefotos.com/a4feae8c7fe317c50154263c996d036ao.png)


## Ejercicio 5