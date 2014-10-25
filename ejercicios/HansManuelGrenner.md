##Ejercicio 1

**Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.**

En la tienda online de DELL podemos encontrar una gran variedad de ordenadores orientados al uso como servidores, he optado por el modelo mejorado del DELL PowerEdge T20 que se ofrece al precio de 459 Euros (Sin IVA). Su precio total incluido el IVA, que en caso de dispositvos electrónicas sería del 21%, es de 555,39 €.

*Costes de Amortización a 4 y 7 años.*
Dado que el IVA se puede deducir al 100% los costes de amortización se calcularán sobre el precio base del dispostivo que son 459 €. La ley establece que el porcentaje máximo de amortización es del 26% anual y el periodo máximo no puede superar los 10 años. ( Supondremos que el equipo se compró a comienzos de año )


* Para 4 años - Aplicando el tipo máximo --> 459 € * 0,26 = 119,34 € ( Durante 3 años )
 					     459 € * 0,22 = 100,98 € ( Último año )

	* 1º - 3º año --> 119,34 €
	* 4º año      --> 100,98 €

* Para 4 años - Aplicando un tipo lineal --> 459 € * 0,25 = 114,75 €

	* 1º - 4º año --> 114,75 €


* Para 7 años - Aplicando un tipo lineal --> 100% / 7 = 14,2 % , Salvo el primer año que será un 14,8% debido al resto de 0,6%
					 --> 459 € * 0,148 = 67,93 €
					     459 € * 0,142 = 65,18 €

	* 1º año      --> 65,93 €
	* 2º - 7º año --> 65,18 €


##Ejercicio 2

**Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.**


Buscamos una empresa que ofrezca tales servicios, como 1&1, y realizaremos la comparación entre dos de sus productos: [servidor dedicado](http://www.1and1.es/servidores-dedicados) vs [servidor cloud](http://www.1and1.es/servidor-cloud-dinamico).

Nuestra opción elegida para el servidor dedicado:

* Núcleos de CPU --> 2 Cores x 2,6 GHz
* Memoria RAM    --> 2 GB DDR2
* Disco Duro     --> 500 GB (2 x 500 SATA)
* **Precio** 	 --> 19,90 € / mes

En el caso del servidor cloud dispondremos de forma similar de:

* 2 Cores
* 2 GB de memoria RAM
* 500 GB de almacenamiento
* **Precio** 	--> 64,80 €* / mes ( * Este precio depende del consumo, 0,09 € / hora)

A lo largo de un año el gasto total supondría :

* **Servidor dedicado** --> 19,90 € * 12 = 238,8 € 

* **Servidor cloud**
	* Uso del 1%  --> 64,80 € * 12 * 0,01 = 7,77 €
	* Uso del 10% --> 64,80 € * 12 * 0,10 = 77,76 €

En el caso de Microsoft Azure el precio de una [máquina virtual Linux (A-Series)](http://azure.microsoft.com/es-es/pricing/calculator/?scenario=virtual-machines), de 2 Cores y 3,5 GB de RAM, ronda los €48,76 € / mes. Su consumo anual al 1% y 10% respectivamente supondría el siguiente gasto.

* **Microsoft Azure**
	* Uso del 1%  --> 48,76 € * 12 * 0,01 = 5,85 €
	* Uso del 10% --> 48,76 € * 12 * 0,10 = 58,51 €

##Ejercicio 3

**¿Qué tipo de virtualización es la más adecuada para: alojar varios clientes en un sólo servidor, crear un sistema efiiciente de web + middleware + base de datos, un sistema de prueba de software e integración continua? Responder aquí y razonar.**

Instalamos CDE en nuestro sistema linux:

* ```git clone git://github.com/pgbovine/CDE.git``` 
* ```cd CDE``` 
* ```make```

![figura1](/Imagenes/ejercicio3_1.jpg)
Figura 1. Instalando CDE.

Una vez instalado procedemos a crear un script, usaremos python en nuestro caso, y no nos olvidemos de indicar en la primera línea las directrices para convertir el archivo en ejecutable directamente.

```#! /usr/bin/env python```

El código utilizado para este ejemplo es el siguiente:

	#! /usr/bin/env python
	# -*- coding: utf-8 -*-
	import random
	
	num = random.randrange(100)+1
	
	
	print "Introduzca un número :"
	num_adivinado = input()
	num_intento=0
	
	while (num != num_adivinado and num_intento < 10 ):
	  num_intento= num_intento+1
	  if(num > num_adivinado):
	    print "Se ha equivocado. El número es MAYOR. Introduzca otro número."
	    num_adivinado = input()
	  else:
	    print "Se ha equivocado. El número es MENOR. Introduzca otro número."
	    num_adivinado = input()
	
	if(num_intento < 10):
	  print ("¡ENHORABUENA! Has adivinado el número de la máquina : ", num_adivinado)
	else:
	  print("¡HAS PERDIDO! Has superado el máximo de 10 intentos.")


Además habrá que darle al fichero los permisos de ejecución correspondientes. Ya podremos usar cde para crear el paquete portable.

```cde ./adivinar.py```

Se habrán creado los archivos correspondientes en el directorio cde-packages/ con las dependecias necesarias para poder ejecutar el programa que deseamos portar.
Dicho directorio lo podemos comprimir y usarlo en cualquier distribución linux que deseemos, ejecutando el fichero "adivinar.py.cde" que creó.


##Ejercicio4

**Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona. Avanzado Instalarlo y crear una aplicación contenedorizada**

Finalziado el tutorial procedemos a la instalación de docker en nuestro sistema, usaré [Windows](https://docs.docker.com/installation/windows/) para este ejercicio. 

Nos descargamos la imagen del tutorial como se habia indicado:

```docker pull learn/tutorial```

![figura2](/Imagenes/ejercicio4_1.png)
Figura 2. Descargando la imagen del tutorial.

Una vez descargada podemos hacer la comprobación de que funciona lanzando un mensaje "hello world".

![figura3](/Imagenes/ejercicio4_2.png)
Figura 3. Prueba de funcionamiento.

Dado que todo está en funcionamiento podemos pasar a instalar programas en nuestro nuevo contenedor. Instalaremos nano para disponer de un editor de textos.

```docker run learn/tutorial apt-get install -y nano```

A continuación usamos el comando docker ps -l para concoer la ID del contenedor creado al instalar nano. Entonces ya podremos guardar este contenedor con el nombre de repositorio 'learn/nano'.

```docker commit b54 learn/nano```

Lanzamos el programa recién instalado y comprobamos que todo funciona.

```docker run -i -t learn/nano nano```

![figura4](/Imagenes/ejercicio4_4.png)
Figura 4. Ejecutando nano.

##Ejercicio 5

**Instala el sistema de gestión de fuentes git**

Como podemos ver en el siguiente [tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-12-04), existen dos formas de instalar git en nuestro sistema de distribución linux ( Ubuntu 12.04 en mi caso ).
O bien usando 'apt-get' o bien descargar e instalar los archivos fuente.

###Instalación mediante apt-get

```sudo apt-get install git-core```

###Instalación mediante el código fuente

* Actualizamos nuestros repositorios. sudo apt-get update
* Instalamos todas las dependencias necesarias. 
```sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev build-essential```
* Descargamos la última versión de git que se ofrece en la página de [google code](https://code.google.com/p/git-core/). Ej. ```wget https://git-core.googlecode.com/files/git-1.8.1.2.tar.gz```
* Descomprimimos el archivo descargado. 
```tar -zxf git-1.8.1.2.tar.gz```
* Nos colocamos en su directorio. 
```cd git-1.8.1.2```
* Instalamos los archivos. 
```make prefix=/usr/local all```
```sudo make prefix=/usr/local install```
* Si desea actualizar git en el futuro, puede usar el mismo git para hacerlo. 
```git clone git://git.kernel.org/pub/scm/git/git.git```

###Configurar git

* Podemos modificar el archivo de configuración de git. 
```sudo nano ~/.gitconfig```
* O introducimos nuestros datos de usuario.
```git config --global user.name "NewUser"```
```git config --global user.email newuser@example.com```
* Todas las configuraciones realizadas se pueden ver con el siguiente comando.  
```git config --list```

###Uso básico de git

Para un [tutorial extensivo](http://git-scm.com/docs/gittutorial) podemos acceder a la propia página web de git y descrubir toda su funcionalidad. Los comandos básicos que necesitaremos usar son los siguientes:

* Descargar un repositorio en nuestra máquina. 
``` git clone https://github.com/JJ/GII-2014 <directorio-local>```
* Añadir un cambio. 
```git add .```
* Para añadir de forma permanente los cambios en el repositorio hacemos un commit. 
```git commit -m "Comentario.."```

##Ejercicio 6

**Crear un proyecto y descargárselo con git. Al crearlo se marca la opción de incluir el fichero README. Modificar el readme y subir el fichero modificado.**

En primer lugar generamos el nuevo repositorio para hacer la prueba.

![figura5](/Imagenes/ejercicio6_1.png)
Figura 5. Creando un nuevo proyecto.

Procedemos a descargarlo en nuestra máquina mediante git usando ```git clone``` y comprobamos que efectivamente tenemos acceso.

![figura6](/Imagenes/ejercicio6_2.png)
Figura 6. Descargando el proyecto.

Realizmos una ligera modificación en el fichero README y subimos los cambios añadiendo el fichero y salvamos todo mediante un commit.

![figura7](/Imagenes/ejercicio6_3.png)
Figura 7. Subiendo el archivo README modificado.


##Ejercicio 9

**Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?**

Lanzamos el comando indicado. 

```egrep '^flags.*(vmx|svm)' /proc/cpuinfo```

![figuraX1](/Imagenes/ejercicio9_1.png)
Figura X. Comprobando la actividad de flags.

Al no listar nada podemos decir que o bien el procesador no posee dicha funcionalidad o está desactivada.
El modelo de procesador usado es el "Intel Core i7-4702MQ".

##Ejercicio 10

**Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.**

Mi sistema no soporta las extension KVM, por tanto no puede usar la aceleración por hardware del procesador.

![figuraX2](/Imagenes/ejercicio10_1.png)
Figura X. Resultado de kvm-ok en mi sistema.

##Ejercicio 12

**Instalar un entorno virtual para tu lenguaje de programación favorito (uno de los mencionados arriba, obviamente).**

El enterno visual de desarrollo elegido es para el lenaguaje de programación Python. Procedemos por tanto a la isntalación de "virtualenv".

```sudo pip install virtualenv```

Si no disponemos de pip : ```sudo apt-get install python-pip.```

Finalizada la instalación lanzamos el comando "virtualenv ENV" que creará el directorio "ENV/lib/pythonX.X/site-packages", donde se almacenarán todas las librerias que instalemos. Y además creará el directorio "ENV/bin/python", el cual es el intérprete de Python que usará este entorno creado.

###Crear y activar un proyecto

*Creamos un proyecto. ```virtualenv test```
![figuraX3](/Imagenes/ejercicio12_1.png)
Figura X. 
*Activamos el proyecto. ```source bin/activate```
![figuraX4](/Imagenes/ejercicio12_2.png)
Figura X. 

##Ejercicio 13

**Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu u OpenShift.**

Openshift. Procedeemos a su página web ttps://www.openshift.com, y en mi caso elegiré la opción gratuita.

##Ejercicio 14

Siguiendo el tutorial ofrecido por el siguiente [enlace](http://www.hongkiat.com/blog/setup-wordpress-openshift/)

![figuraX5](/Imagenes/ejercicio14_1.png)
Figura X. Creando una nueva aplicación en openshift.

Creamos la aplicación con las opciones por defecto.

![figuraX6](/Imagenes/ejercicio14_1.png)
Figura X. Usar la app de Wordpress.

De momento indicaremos que no deseamos modificar el código, pulsando "Not now, continue.".

![figuraX7](/Imagenes/ejercicio14_3.png)
Figura X. 

Y ya tendremos todo instalado y podremos configurar Wordpress accediendo a la página web indicada.

![figuraX8](/Imagenes/ejercicio14_4.png)
Figura X. Wordpress instalado y listo para configurarse.
