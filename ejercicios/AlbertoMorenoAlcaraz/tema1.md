
Tema 1
======

Ejercicio 1
-----------

**Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.**

Para el cálculo del coste de amortizacion de un servidor, he elegido el servidor [Lenovo TS-440 Think Server Intel Xeon V1225 E3/4GB](Lenovo TS-440 Think Server Intel Xeon V1225 E3/4GB)

Su precio inicial es de 811€ (IVA incluido). El precio sin IVA es de 670.25€

######Amortización a 4 años

Para amortizar el precio del servidor, deducimos para cada año un 25%. 
670.25€ * 0.25 = 167.56€

Por lo que la amortizacion cada año sería de 167.56€

######Amortización a 7 años

Para amortizar el precio del servidor, deducimos para cada año un 14.29%. 
670.25€ * 0.1429 = 95.78€

Por lo que la amortizacion cada año sería de 95.78€


Ejercicio 2
-----------

**Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo**

Vamos a comparar dos servidores, para ello se ha elegido [Amazon EC2](http://aws.amazon.com/es/ec2/pricing/) y [Azure](http://azure.microsoft.com/es-es/pricing/calculator/?scenario=virtual-machines).

En el caso de Amazon, elegimos la maquina t2.medium que tiene 2 cores y 4GB de RAM. El precio por la maquina es 0.050 euros por hora.
![t1ej2.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t1ej2.png)

En el caso de Azure, elegimos una maquina Basic A2 con 2 cores y 3.5GB de Ram. El precio por la maquina es 0.066 euros por hora.
![t1ej2b.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t1ej2b.png)


**1% del tiempo:**

- Con Amazon: (0.050 €/h * 24h * 30 dias * 12 meses) * 0.01 = 4.32 €/año

- Con Azure: (0.066 €/h * 24h * 30 dias * 12 meses) * 0.01 = 5.70 €/año


**10% del tiempo:**

- Con Amazon: (0.050 €/h * 24h * 30 dias * 12 meses) * 0.1 = 43.2 €/año

- Con Azure: (0.066 €/h * 24h * 30 dias * 12 meses) * 0.1 = 57.02 €/año


Ejercicio 3
-----------

**2. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.**

Para empaquetar con CDE seguimos el [Manual](http://linuxzone.es/2012/06/04/creando-aplicaciones-portables-en-gnulinux/).

Primero, descargamos el binario. Despues le damos permisos de ejecucion.
Una vez que podemos ejecutarlo, creamos un programa simple, por ejemplo, un hello_world en c++.

Ahora, lo empaquetamos con CDE con el comando:
```bash
./cde_2011-08-15_64bit hello_world
```

Esto nos genera una carpeta en cuyo interior se encuentra el programa empaquetado.
Entramos en dicha carpeta y vemos que hay un ejecutable hello_world.cde.

Si lo ejecutamos, se ejecuta el mismo programa que creamos anteriormente.

Si, por ejemplo, lo comprimimos y nos lo llevamos a otra maquina ubuntu, vemos que podemos ejecutar el programa correctamente.


Ejercicio 4
-----------

**Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona.**

He realizado el tutorial de docker.
![t1ej4.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t1ej4.png)

Ejercicio 5
-----------

**Instala el sistema de gestión de fuentes git.**

Para instalarlo, tan solo hay que ejecutar el comando:
```bash
sudo yum install git
```

Ejercicio 6
-----------

**1. Crear un proyecto y descargárselo con git. Al crearlo se marca la opción de incluir el fichero README.**

Ya tengo varios proyectos creados, por ejemplo usaré MP-PracticaFinal. 

**2. Modificar el readme y subir el fichero modificado.**

Modifico el readme y lo subo al repositorio con los comandos que se ven en la imagen:
![t1ej6.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t1ej6.png)


Ejercicio 7
-----------

**Comprobar si en la instalación hecha se ha instalado cgroups y en qué punto está montado, así como qué contiene.**

Si se encuentra instalado en la carpeta /sys/fs/cgroup como podemos ver en la imagen:
![t1ej7.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t1ej7.png)


Ejercicio 10
------------

**Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?**

Comprobamos si tenemos activada la virtualizaciona nivel de hardware con el comando:
```bash
egrep '^flags.*(vmx|svm)' /proc/cpuinfo
``` 
![t1ej10.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t1ej10.png)

Si existe la virtualizacion a nivel de hardware y está activada.

Comprobamos el modelo del procesador con el comando:
```bash
cat /proc/cpuinfo
``` 

Mi procesador es: Intel(R) Core(TM) i5-2410M CPU @ 2.30GHz


Ejercicio 11
------------

**Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.**

Primero instalamos el paquete cpu-checker para hacer un chequeo del procesador:
```bash
sudo apt-get install cpu-checker
```

Despues, ejecutamos la orden:
```bash
kvm-ok
```

Compruebo que no contiene el modulo del kernel.

