
Tema 3
======

Ejercicio 1
-----------

**Crear un espacio de nombres y montar en él una imagen ISO de un CD de forma que no se pueda leer más que desde él. Pista: en ServerFault nos explican como hacerlo, usando el dispositivo loopback**

Podemos usar el comando del foro de ayuda que menciona el guión para montar el disco:

```shell
mount -o loop -t img img.iso /mnt/img
```


Ejercicio 2
-----------

**Mostrar los puentes configurados en el sistema operativo.**

![](https://raw.githubusercontent.com/ernestoalejo/ivimages/master/img16.png)

Como se ve están los puentes de las máquinas virtuales que he ido creando para las pruebas.


Ejercicio 3
-----------

**Usar debootstrap (o herramienta similar en otra distro) para crear un sistema mínimo que se pueda ejecutar más adelante.**

Nos aseguramos de tener debootstrap instalado:

```shell
sudo apt-get install debootstrap
```
