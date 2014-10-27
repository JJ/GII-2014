#Introducción a la infraestructura virtual: concepto y soporte físico

##Ejercicio 1

**Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.**

El concepto de amortización se emplea para explicar cómo los activos de una empresa comienzan a perder valor a lo largo del tiempo y esa pérdida se amortiza teniendo en cuenta los años de vida del activo, por lo tanto, lo más lógico es amortizar la mayor cantidad posible en los primeros años antes de que el producto se devalúe. De acuerdo con el artículo que se invita a consultar sobre el tema, puedes imputar anualmente como gasto deducible en concepto de amortización un máximo del 25% de la base imponible o precio antes de IVA.
Teniendo en cuenta esta definición, vamos a analizar cómo podemos amortizar el valor de un servidor [HP PROLIANT DL320E G8 E3-1220V3 3.10GHz 4GB DDR3 1U de HP](https://www.arturogoga.com/2011/12/23/tutorial-markdown-manera-simple-de-crear-texto-con-formato-especiales/) con valor de 599€ en 4 y 7 años:

###Amortización a 4 años:

Considerando que lo hemos comprado a principio de año:

Habría que imputar el máximo permitido todos los años para poder cubrir el total del valor en los 4 años.

* 2015 --> 25% = 149,75€
* 2016 --> 25% = 149,75€
* 2017 --> 25% = 149,75€
* 2018 --> 25% = 149,75€
	
###Amortización a 7 años:

Considerando que lo hemos comprado a principio de año:

Ahora si podríamos jugar con el % a imputar cada año ya que tenemos un margen de tiempo mayor, por lo tanto, vamos a amortizar el mayor porcentaje posible al principio (cuando el valor del producto aún no se ha devaluado) disminuyendo progresivamente conforme pasan los años (que el valor del producto irá decreciendo).

* 2015 --> 25% = 149,75
* 2017 --> 22% = 131,78
* 2018 --> 18% = 107,82
* 2018 --> 15% = 89,85
* 2019 --> 10% = 59,9
* 2020 -->  6% = 35,94
* 2021 -->  4% = 23,96

##Ejercicio 2

**Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.**

Vamos a comparar los dos servicios en la nube más populares, [Microsoft Azure](http://azure.microsoft.com/es-es/pricing/calculator/?scenario=virtual-machines) y [Amazon EC2](http://aws.amazon.com/es/ec2/pricing/):

**Microsoft Azure Serie D3 para Linux**
* 4 núcleos, 14 GB RAM, 100 GB SSD
* €0,626/hr = $0,791/hr

**Amazon EC2 m3.xlarge**
* 4 núcleos, 15 GiB RAM, 2 x 40 SSD
* $0.280 por hora

Si usamos un 1% del tiempo:
 * **Azure:** ($0,791x24hx365dias)*0,01 = 69,2916$
 * **Amazon EC2** ($0,280x24hx365dias)*0,01 = 24,528$ 
 
Si usamos un 10% del tiempo:
 * **Azure:** ($0,791x24hx365dias)*0,1 = 692,916$
 * **Amazon EC2** ($0,280x24hx365dias)*0,1 = 245,28$ 
 
Luego la opción Amazon es casi 3 veces más barata que la opción Azure.

##Ejercicio 3

**1.¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro**
![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_1/imagenes/ejercicio3-1.png)

**2.Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.**

Para esta actividad, en primer lugar he descargado [CDE](http://www.pgbovine.net/cde.html). Después, he seguido el [manual de usuario](http://www.pgbovine.net/cde/manual/). He abierto el programa de prueba (xclock) que viene por defecto con CDE en dos distribuciones de Linux diferentes y he comprobado como funciona en ambas.

Xclock en Ubuntu
![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_1/imagenes/clock_ubuntu.png)

Xclock en CentOS
![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_1/imagenes/clock_centos.png)

##Ejercicio 4

**Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona.**

- Mostrar la versión de docker instalada --> docker version
- Buscar una imagen --> docker search <nombre_imagen>
- Descargar una imagen --> docker pull learn/<nombre_imagen>
- Ejecutar una imagen --> docker run learn/<nombre_imagen> <comando_a_ejecutar>
- Instalar una utilidad en el contenedor de la imagen --> docker run learn/<nombre_imagen> apt-get install -y <utilidad>
- Guardar cambios (al haber instalado alguna utilidad en el contenedor) --> commit <ID> learn/<utilidad>
- Encontrar el ID del contenedor creado instalando una utilidad --> docker ps -l
- Mostrar una lista con todos los contenedores que están siendo ejecutados --> docker ps
- Compartir tu imagen con otros --> docker push learn/<nombre_imagen>

##Ejercicio 5

**Instala el sistema de gestión de fuentes git**

Para instalar git en Linux, únicamente hay que proceder como se hace habitualmente:
*sudo apt-get install git*
Después, para obtener tu carpeta de GitHub, crea una nueva carpeta, accede a ella con la consola de comandos y ejecuta lo siguiente:
*git clone https://github.com/miguelfabre/GII-2014.git*

##Ejercicio 6

**1.Crear un proyecto y descargárselo con git. Al crearlo se marca la opción de incluir el fichero README.**
**2.Modificar el readme y subir el fichero modificado.** 
   

En primer lugar he creado un nuevo proyecto en GitHub añadiendo el fichero README tal como se indicaba en el enunciado.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_1/imagenes/ejercicio6-1.png)

Después, lo he descargado en mi carpeta local.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_1/imagenes/ejercicio6-2.png)

Por último, modificamos el fichero README.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_1/imagenes/ejercicio6-3.png)

Y actualizamos:

*git commit -a*

*git push*

Como vemos, la modificación ha resultado exitosa.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_1/imagenes/ejercicio6-4.png)

##Ejercicio 7

**Comprobar si en la instalación hecha se ha instalado cgroups y en qué punto está montado, así como qué contiene.**

Primero he comprobado si inicialmente el sistema de ficheros virtual estaba ya activado utilizando la orden: 

*/sys/fs/cgroups*

Dado que no existía dicho sistema de ficheros, he procedido a montarlo para poder visualizar lo que tiene.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_1/imagenes/ejercicio7-1.png)

Lo que podemos ver son archivos de soporte a grupos de tareas en el Kernel de Linux, que permiten controlar y monitorizar la actividad de los diferentes grupos de control.

##Ejercicio 10

**Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?**

Ejecutamos la orden indicada en el guión y vemos que efectivamente el procesador tiene activos estos flags.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_1/imagenes/ejercicio10-1.png)

El procesador del que hablamos es un Intel(R) Core(TM) i3 CPU M 370  @ 2.40GHz

##Ejercicio 11

**Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.**

Ejecutamos la orden tal como indica el enunciado y tal como podemos ver el núcleo de mi ordenador no contiene este módulo del kernel.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_1/imagenes/ejercicio11-1.png)

##Ejercicio 12

**Comentar diferentes soluciones de Software as a Service de uso habitual**

SaaS (del inglés "Software as a Service") es el término empleado para denominar a aquellos servicios que son empleados en línea, es decir, que el usuario no necesita instalar en su propio equipo. Existen múltiples ejemplos de SaaS que todos empleamos habitualmente, como los servicios online de correo electrónico (gmail,yahoo,outlook), los servicios de almacenamiento en la nube (Mega,Dropbox,iCloud) y, en el caso de muchos estudiantes, el servicio de impresión empleado en la UGR denominado Copicloud. 

Como ventajas, podemos destacar el hecho de poder hacer uso de estas aplicaciones desde cualquier dispositivo con acceso a internet, además de que el soporte de la aplicación es 24 horas e inmediato. También, tus archivos están más seguros en cuanto a disponibilidad, es decir, díficilmente dichos SaaS de almacenamiento masivo perderán todos los datos almacenados, siendo más probable perderlos si los tienes en tu PC y éste sufre algún imprevisto irreversible.

Por otro lado, como desventajas, el hecho de acceder a estos servicios mediante internet puede conllevar algunos peligros en cuanto a confidencialidad y privacidad, por parte tanto del proveedor del servicio así como de otros usuarios con malas intenciones.
