Lista de ejercicios Israel Blancas Álvarez
============================

#TEMA 1: Introducción a la infraestructura virtual: concepto y soporte físico#


##Sesión 29-09-2014##

###Ejercicio 1###

#####Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.#####

[Servidor al que calcular la amortización](http://www.pccomponentes.com/hp_proliant_ml310e_g8_xe_e3_1220_8gb_2tb.html?gclid=CKGXptPKiMECFfHKtAodVQ0ABQ)
El servidor tiene un precio de 645€.


+ El precio sin IVA (base imponible) es de 533.06€. El IVA es de 645-533.06=111,94€.


######Amortización a 4 años######
Se amortiza un 25% de la base imponible/año. Es decir, 133,265€/año. 
Suponiendo que lo comprásemos ahora, en el año 2014 solo amortizaría los meses de octubre, noviembre y diciembre (la amortización por mes es de 11,106€).

Amortización:
* Año 2014: 11,106*3=33,318€
* Año 2015: 133,265€
* Año 2016: 133,265€
* Año 2017: 133,265€
* Año 2018: 11,106*9=99,954€


######Amortización a 7 años######
Se amortiza un 14,29% de la base imponible/año. Es decir, 76,15€/año. 
Suponiendo que lo comprásemos ahora, en el año 2014 solo amortizaría los meses de octubre, noviembre y diciembre (la amortización por mes es de 6,35€).

Amortización:
* Año 2014: 6.35*3=19,05€
* Año 2015: 76,15€
* Año 2016: 76,15€
* Año 2017: 76,15€
* Año 2018: 6,35*9=57,15€


***

###Ejercicio 2###
#####Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.#####

[VPS Hostinger Plan 1](http://www.hostinger.es/hosting-vps)
* 1024 MB RAM
* 1.00 GB transferencia mensual
* Espacio en disco de 20 GB
* 6.99€/mes

[Amazon EC2 t2.micro](http://aws.amazon.com/es/ec2/pricing/)
* 1 vCPU
* 1 GiB de memoria
* $0.013/hora = 0.01€/hora
* Almacenamiento dinámico

######Si solo se usa un 1%######
+ **Hostinger** : se pagaría 6.99€/mes * 12 meses = 83.88€/año
+ **Amazon** : $0.013/hora * 24h/día * 30 días/mes * 12 meses/año) * 0.01 = $1.1232/año = 0.891326€/año


######Si solo se usa un 10%######
+ **Hostinger** : se pagaría 6.99€/mes * 12 meses = 83.88€/año
+ **Amazon** : $0.013/hora * 24h/día * 30 días/mes * 12 meses/año) * 0.1 = $1.1232/año = 8.91326€/año


***

###Ejercicio 3###
##### 1. ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro#####
#####2. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.#####

######[Parte 1ª](https://github.com/JJ/GII-2014/issues/71#issuecomment-58189129)######
######Parte 2ª#####

He utilizado el siguiente código (en programa.py)

```python
#!/usr/bin/env python
# -*- coding: utf-8 -*- 

import random

def main():
	intentos=0
	numero = random.randint(1, 100)

	while (intentos<10):
		numero_usuario = int(input("Inserte un número:"))
		intentos+=1
		if numero_usuario>numero:
			print("El número a adivinar es menor")
		elif numero_usuario<numero:
			print("El número a adivinar es mayor")
		else:
			print("Enhorabuena, has acertado")
			return

	if (intentos==10):
		print("Has superado el número de intentos")

if __name__ == '__main__': 
    main()

```

Una vez comprobado que funciona, 

+ Instalo CDE utilizando "sudo apt-get install cde"
+ Ejecuto mi programa utilizando "cde python programa.py"
+ Entro al directorio "/cde-package/cde-root/home/miUsuario" con "cd".
+ He ejecutado "./python.cde programa.py", ya que hay que ejecutar el programa con extensión "cde" y pasarle como parámetro aquellos ficheros que necesitemos.

Al llevarlo a otra máquina, realizo el último paso y compruebo que funciona correctamente.


***

###Ejercicio 4###
#####Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona. Avanzado Instalarlo y crear una aplicación contenedorizada#####

Tras hacer el tutorial, he procedido a realizar un empaquetado en mi PC.

+ He instalado la utilidad como se especifica [en este enlace](https://docs.docker.com/installation/ubuntulinux/)
+ He descargado la imagen del tutorial con "sudo docker pull learn/tutorial" (he utilizado sudo por que el sistema me alertaba de un error por problemas con permisos)
+ Ayudándome de la [guía](https://docs.docker.com/reference/run/), he ejecutado la imagen con la siguiente orden "sudo docker run -i -t learn/tutorial /bin/bash"
+ He instalado php5 y nano en la imagen, mediante el comando "apt-get install nano php5"
+ He escrito un código PHP que escribe un mensaje en pantalla y lo he colocado en "/usr/bin" (esto es para que PHP pueda encontrarlo. Cuando he colocado el fichero en otra ruta, he tenido problemas por que no lo encontraba)
+ Tras salir de la imagen (ejecutando "exit"), guardo la imagen "sudo docker commit 71c3 hola"
+ Ejecuto el script desde fuera de la imagen escribiendo el comando "sudo docker run -i -t hola php hola.php"


***

###Ejercicio 5###
#####Instala el sistema de gestión de fuentes git#####
Como me encuentro en Ubuntu, simplemente hay que ejecutar:
"sudo apt-get install git"


***

###Ejercicio 6###
#####1. Crear un proyecto y descargárselo con git. Al crearlo se marca la opción de incluir el fichero README.#####

He creado [un repositorio](https://github.com/iblancasa/iblancasaWordpressTheme) y lo he descargado utilizando:
"git clone https://github.com/iblancasa/iblancasaWordpressTheme.git"

#####2. Modificar el readme y subir el fichero modificado.##########
Como se puede ver en la [web de Github](https://github.com/iblancasa/iblancasaWordpressTheme), he realizado algunas modificaciones en el ["readme"](https://github.com/iblancasa/iblancasaWordpressTheme/blob/master/README.md).



***
***
##Sesión 30-09-2014##
###Ejercicio 7###
#####Comprobar si en la instalación hecha se ha instalado cgroups y en qué punto está montado, así como qué contiene.#####
Utilizo Ubuntu 14.04. Como se especifica en el enunciado unas líneas más arriba, se encuentra montado por defecto en "/sys/fs/cgroup".
Contiene las siguientes carpetas:
blkio  cpuacct  devices  hugetlb  perf_event
cpu    cpuset   freezer  memory   systemd

Donde cada carpeta es un grupo de control.


***

###Ejercicio 8###

#####8.1 Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador, en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recursos de unos y otros durante un tiempo determinado.#####
+ He montado el sistema de archivos con "sudo mount -t tmpfs cgroup_root /sys/fs/cgroup"
+ He creado el directorio con "sudo mkdir /sys/fs/cgroup/cpuset", donde "cpuset" es el nombre del cgroup
+ Como dentro del directorio no se creó nada, he acudido a buscar en Internet y he encontrado [esto](http://serverfault.com/questions/478946/how-can-i-create-and-use-linux-cgroups-as-a-non-root-user). Al ejecutar el comando "sudo mount -t cgroup -o cpuset cpuset /sys/fs/cgroup/cpuset", para montar el sistema de archivos y "sudo mkdir /sys/fs/cgroup/cpuset/${USER}" y "sudo chown -R ${USER} /sys/fs/cgroup/cpuset/${USER}" para crear el cgroup con el usuario actual, si aparecen los ficheros que se describen en el material de clase.
+Finalmente, utilizando también la solución del perfil de Twitter de la asignatura, he conseguido que se generen todos los ficheros.


###### Comparación ######
Eclipse

![Eclipse](http://fotos.subefotos.com/e71196d3fc3adee4683fccdd4e4d5712o.jpg)

Gedit

![Gedit](http://fotos.subefotos.com/54acfab06e6a06d063c8c89df653f4b2o.jpg)

Firefox

![Firefox](http://fotos.subefotos.com/1c44d0a2747e297b650ab0ce830138f4o.jpg)




#####8.2 Calcular el coste real de uso de recursos de un ordenador teniendo en cuenta sus costes de amortización. Añadir los costes eléctricos correspondientes.#####
En primer lugar hay que [tener en cuenta el gasto medio de un PC](http://www.leantricity.es/es/2012/07/11/cuanta-energia-gasta-un-ordenador-aproximaciones/)
Coste eléctrico por año:
365 días x (0,437 kWh + 0,1524 kWh) = 215 kWh 
0,15 € * 215 kWh = 32€/año

Teniendo en cuenta que la vida media de un ordenador (con cierto uso) está en torno a los 5 años y suponiendo un precio de 500€.


Amortización:
* Año 2014: 8.3*4 = 33.2€ + 2.7€ *4 = 43.8€
* Año 2015: 100€ + 32€ = 132€
* Año 2016: 100€ + 32€ = 132€
* Año 2017: 100€ + 32€ = 132€
* Año 2018: 100€ + 32€ =  132€
* Año 2019: 8.3*8 = 66.7€ + 2.7€ *8 = 88.3€

Precio total: 660.1€


***

###Ejercicio 9###

#####9.1 Discutir diferentes escenarios de limitación de uso de recursos o de asignación de los mismos a una u otra CPU.#####
--

#####9.2 Implementar usando el fichero de configuración de cgcreate una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa).#####

   
```
mount {
    cpu = /cgroup/cpumem;
    cpuset = /cgroup/cpumem;
    memory = /cgroup/cpumem;
}


group $USER { 
    cpu {
    # 75% de CPU disponible para los procesos
        cpu.shares="750"; 
    }
    cpuset {
    # Todas las CPU disponibles
        cpuset.cpus="0-7"; 
    }
    memory {
    # 2GB de memoria como límite
        memory.limit_in_bytes="2G"; 
	# 2GB de memoria y SWAP
        memory.memsw.limit_in_bytes="4G";  
    }
}

group system { 
    cpu {
    # 25% de CPU disponible para los procesos
        cpu.shares="250"; 
    }
    cpuset {
        # 1 CPU como máximo
        cpuset.cpus="0,1"; 
    }
    memory {
    # 1GB de memoria como límite	
        memory.limit_in_bytes="1G"; 
	# 2GB de memoria y SWAP
        memory.memsw.limit_in_bytes="2G"; 
    }
}
```



#####9.3 Usar un programa que muestre en tiempo real la carga del sistema tal como htopy comprobar los efectos de la migración en tiempo real de una tarea pesada de un procesador a otro (si se tiene dos núcleos en el sistema).#####
Desconozco cómo se migra la carga de un procesador a otro. El uso de memoria se incrementaría (incluso podría necesitarse memoria de SWAP) y uno de los procesadores aumentaría su uso a la vez que el del otro descendería. 
![Ejecución de la orden htop](http://fotos.subefotos.com/1c350c29f3bacd01e2f11dd5a3251566o.jpg)

#####9.4 Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios.#####

He utilizado NGINX como servidor

```
mount {
    blkio = /cgroup/iolimit;
}

group nginx {
    blkio  {
    	#Pone como prioridad 75%
        blkio.weight_device="750"; 
    }
}

group usuarios {
    blkio  {
    	#Pone como prioridad 25%
        blkio.weight_device="250"; 
    }
}
```


***

### Ejercicio 10###

#####Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?#####
El procesador es "Intel(R) Core(TM) i5-2410M CPU @ 2.30GHz".
La salida del comando es la siguiente:

![Comprobación de flags](http://fotos.subefotos.com/23e6b32485a62eba2036dfb96d019585o.jpg)


Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.


***

### Ejercicio 11###

#####Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.#####
Al intentar ejecutarlo, el sistema me ha solicitado que instalase un paquete. Tras instalarlo utilizando "sudo apt-get install cpu-checker", he ejecutado "kvm-ok" y he obtenido la siguiente salida:
>INFO: /dev/kvm exists
>KVM acceleration can be used

Entiendo que puedo utilizar KVM.


***

###Ejercicio 12###
#####Comentar diferentes soluciones de Software as a Service de uso habitual#####
Mi [respuesta en el foro](https://github.com/JJ/GII-2014/issues/72#issuecomment-59820896).



***
***
***


#TEMA 2: Introducción a la infraestructura virtual: concepto y soporte físico#


##Sesión 2-10-2014##

##Ejercicio 1##

#####Instalar un entorno virtual para tu lenguaje de programación favorito (uno de los mencionados arriba, obviamente).#####
He instalado el de Python (virtualenv) mediante:
>sudo pip install virtualenv

Después, he probado a crear el entorno virtual escribiendo en consola:
>virtualenv proyecto


***

##Ejercicio 2##

#####Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu u OpenShift.#####
Me he registrado en OpenShift.


***

##Ejercicio 3##
#####Crear una aplicación en OpenShift y dentro de ella instalar WordPress.#####
Tras solicitar crear una aplicación, se nos permite desplegar una aplicación de las que ya hay predefinidas. Insertando en el buscador "Wordpress". Después de esto, se nos pedirán algunos datos, como el nombre de dominio o el repositorio Git donde tenemos el código.
Finalmente, se nos darán los datos necesarios para entrar a administrar nuestro Wordpress.
[Ir a mi aplicación](http://wordpress-iblancasa.rhcloud.com/)



***
***

##Sesión 2-10-2014##

##Ejercicio 4##

#####Crear un script para un documento Google y cambiarle el nombre con el que aparece en el menú, así como la función a la que llama.#####
He cambiado el nombre del menú y le he puesto una función que crea un cuadro de diálogo y pregunta por una respuesta de usuario.
![Google Drive](http://fotos.subefotos.com/3d7f1666becd3469f68ff662d506fcd3o.jpg)

Aquí podemos ver cómo aparece el menú nuevo.

```javascript

function onOpen() {
  // Add a menu with some items, some separators, and a sub-menu.
  DocumentApp.getUi().createMenu('Menú probado')
      .addItem('Hola mundo', 'hola')
      .addToUi();
}


function hola() {
  var result = DocumentApp.getUi().alert(
      'Hola',
      '¿Es esto lo que buscabas?',
      DocumentApp.getUi().ButtonSet.YES_NO);

  if (result == DocumentApp.getUi().Button.YES) {
    DocumentApp.getUi().alert('Pues ya lo has encontrado');
  } else {
    DocumentApp.getUi().alert('Pues adiós');
  }
}
```