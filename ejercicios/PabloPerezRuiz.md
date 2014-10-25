#Ejercicios de Pablo Pérez Ruiz

###Ejercicio 1: 
####Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

[SERVIDOR HP PROLIANT ML350P GEN8 E5-2620V2 2.1 GHz 8GB DDR3 5U](http://www.dynos.es/servidor-hp-proliant-ml350p-gen8-e5-2620v2-2.1-ghz-8gb-ddr3-5u--4514953642119__736978-425.html)

El coste del servidor es de 2569€. Le quitamos previamente el IVA al precio total:

2569*0.79= 2029.51€ Suponiendo que adquirimos el equipo a principios de año, contamos el año entero a la hora de amortizar:

**Amortización a 4 años:** cada año se amortizaría un 25% con lo que amortizaríamos: 

Año 2015: 2029.51*0.25 = 507.3775€
Año 2016: 2029.51*0.5 = 1014.755€
Año 2017: 2029.51*0.75 = 1522.1325€
Año 2018: 2029.51*1 = 2029.51€

**Amortización a 7 años:** cada año se amortizaría un 14.28% con lo que amortizaríamos: 

Año 2015: 2029.51*0.1428 = 289.814€
Año 2016: 2029.51*0.2856 = 579.62€
Año 2017: 2029.51*0.4284 = 869.44€
Año 2018: 2029.51*0.5712 = 1159.256€
Año 2018: 2029.51*0.714 = 1449.07€
Año 2018: 2029.51*0.8568 = 1738.88€
Año 2018: 2029.51*1 = 2029.51€


###Ejercicio 2: 
####Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

[Servidor en Amazon:](http://aws.amazon.com/es/ec2/pricing/)

  EC2
  4GB de RAM
  2 Cores
  0.052$ por hora (0.04155€)

[VPS Hostinger:](http://www.hostinger.es/hosting-vps)

  Plan 4 (27.99€ al mes)
  4GB de RAM
  80GB de Almacenamiento
  CPU 9,6Ghz
  
  **Si se usa sólo un 1% del tiempo:**
  
  Amazon: 0.04155 * 24h * 365.25 dias * 0.01 = 3.6423€
  
  Hostinger: 27.99 * 12 meses = 335.88€ ( Ya que no cobra por tiempo sino por meses)
  
  **Si se usa sólo un 10% del tiempo:** 
  
  Amazon: 0.04155 * 24h * 365.25 dias * 0.1 = 36.42273€
  
  Hostinger: 27.99 * 12 meses = 335.88€ ( Ya que no cobra por tiempo sino por meses)
  
  

###Ejercicio 3: 
####¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro
Leer el comentario en el foro [aquí.](https://github.com/JJ/GII-2014/issues/71#issuecomment-59169569)

<img src=http://i57.tinypic.com/5cgcwo.png></img>
####Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.
En primer lugar instalamos CDE en nuestro terminal mediante las ordenes:
    
    git clonet git://github.com/pgbovine/CDE.git
    cd CDE
    make

Como vemos a continuación:

<img src="http://i57.tinypic.com/25svlz7.png"></img>

A continuación, aprovechando un programa hecho en la asignatura DAI el año pasado, creamos el script:

<img src="http://i57.tinypic.com/w87494.png"></img>

Creamos el paquete correspondiente mediante: 

cde ./ej_01_03.py

Una vez hecho esto, se han creado los archivos correspondientes en el directorio cde-packages para poder ejecutar el programa que queramos. Para portarlo a otra distribución, simplemente comprimimos el directorio y lo ejecutamos usando el archivo creado ( ej_01_03.py.cde )


###Ejercicio 4:
####Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona.
Tutorial realizado. <img src="http://i62.tinypic.com/o77mo0.png"></img>
####Avanzado Instalarlo y crear una aplicación contenedorizada.
Hacemos sudo apt-get install docker.io en la terminal.


###Ejercicio 5
####Instala el sistema de gestión de fuentes git:

Hacemos en la terminal: sudo apt-get install git
<img src="http://i62.tinypic.com/244bryq.png"></img>


Para introducir nuestros datos de usuario hacemos:

* git config --global user.name "ppruiz" 

* git config --global user.email ppruiz@correo.ugr.es

Para ver las configuraciones que hemos hecho hacemos: git config --list

Todas las órdenes necesarias se encuentran en el [tutorial.](http://git-scm.com/docs/gittutorial) Las que vamos a usar nosotros son las siguientes: 

* Para descargar un repositorio a nuestro terminal hacemos: git clone https://github.com/JJ/GII-2014. 

* Para actualizar los commits de nuestro repositorio al repositorio externo hacemos: git push origin master.

* Para actualizar el repositorio hacemos: git pull https://github.com/JJ/GII-2014.git master.


###Ejercicio 6:
####Crear un proyecto y descargárselo con git. Al crearlo se marca la opción de incluir el fichero README. Modificar el readme y subir el fichero modificado.

Para crear el repositorio, hacemos click en "+" en esquina superior derecha de github:

<img src="http://i58.tinypic.com/2w2lrio.png"></img>

Le ponemos nombre a nuestro nuevo repositorio y marcamos la casilla para que se le incluya archivo readme:

<img src="http://i57.tinypic.com/2v2wlsm.png"></img>

Descargamos nuestro repositorio a nuestra terminal y accedemos al fichero README.md: 

<img src="http://i57.tinypic.com/21lkcoi.png"></img>

Modificamos el fichero, lo subimos y confirmamos finalmente: 

<img src="http://i59.tinypic.com/vown5f.png"></img>


###Ejercicio7:
####Comprobar si en la instalación hecha se ha instalado cgroups y en qué punto está montado, así como qué contiene.

Comprobamos que el directorio de cgroup se encuentra en /sys/fs/cgroup. Para mostrar su contenido hacemos ls:

<img src="http://i60.tinypic.com/24qs5tu.png"></img>

###Ejercicio8:
####1.Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador, en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recursos de unos y otros durante un tiempo determinado.

Creamos los grupos en el directorio gruposcontrol:

<img src="http://i59.tinypic.com/2s7bbll.png"></img>

Una vez creados le asignamos una tarea a cada uno:

* A grupo1 le asignamos el navegador Firefox.
* A grupo2 le asignamos el editor de textos sublimeText2
* A grupo3 le asignamos el depurador ddd

Me da un error por falta de espacio:

<img src="http://i60.tinypic.com/kuwzp.png"></img>

Con lo que comprobamos al menos el uso de recursos total:

<img src="http://i62.tinypic.com/2dtredz.png"></img>


####2.Calcular el coste real de uso de recursos de un ordenador teniendo en cuenta sus costes de amortización. Añadir los costes eléctricos correspondientes.

Nos basaremos en un ejemplo de la siguiente [página](http://www.pcsilencioso.com/recursos/bdd/73-alimentacion/45-gasto-electricidad):

Core i7-920 + GTX260 Extreme 	150W (est.) 	312W (est.) 	14,81€ 	7,60€ 	12,54€ 	30,81€


###Ejercicio 9:
####Discutir diferentes escenarios de limitación de uso de recursos o de asignación de los mismos a una u otra CPU.
####Implementar usando el fichero de configuración de cgcreate una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa).
####Usar un programa que muestre en tiempo real la carga del sistema tal como htopy comprobar los efectos de la migración en tiempo real de una tarea pesada de un procesador a otro (si se tiene dos núcleos en el sistema).
####Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios.


###Ejercicio 10:
####Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?


###Ejercicio 11:
####Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.


###Ejercicio12:
####Comentar diferentes soluciones de Software as a Service de uso habitual
