# Ejercicios de Óscar Sánchez Martínez #


** Ejercicio 1.Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.**

Ejemplo de un servidor:Dell PowerEdge T110 II

[Página del servidor](http://www.dell.com/es/empresas/p/poweredge-t110-2/fs)

Para el servidor escogido de 699 euros con una amortización del 26% a 10 años, sería:

* Amortización a 4 años: 72,696 euros
* Amortización a 7 años: 127,218 euros

**Ejercicio 2.
Usando las tablas de precios de servicios de alojamiento en Internet y de 
proveedores de servicios en la nube, Comparar el coste durante un año de 
un ordenador con un procesador estándar (escogerlo de forma que sea el mismo 
tipo de procesador en los dos vendedores) y con el resto de las características 
similares (tamaño de disco duro equivalente a transferencia de disco duro) 
si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.**

[Página Amazón EC2](http://aws.amazon.com/es/ec2/purchasing-options/dedicated-instances/)

[Página Amazón modelo C3](http://aws.amazon.com/es/ec2/instance-types/)

[Página VPS Hostinger](http://www.hostinger.es/hosting-vps)

Comparación de uso de 1% (3.65 días):

Amazon -> para la máquina c3.large, el precio por hora es de 0.116$.
	  USO: 3.65 días * 60h/días * 0.116$ = 25,404 $
VPS Hostinger -> para el plan 2, el precio al mes es de 13.99 (17.55$)l.
	  USO: el de un mes 17,55$

Comparación de uso de 10% (36.5 días):

Amazon -> para la máquina c3.large, el precio por hora es de 0.116$.
	  USO: 36.5 días * 60h/días * 0.116$ = 254.04$
VPS Hostinger -> para el plan 2, el precio al mes es de 13.99 (17,55$).
	  USO: el de dos meses 17,55$ * 2 = 35,1$

La gran diferencia entre ambos proveedores de servicios es que, en servidores 
cloud de amazon, cobran por el uso que se de al servicio mientras que 
VPS Hostinger cobra por meses, independientemente de cuanto uses el servicio.

**Ejercicio 3.
1.¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro.
2.Crear un programa simple en cualquier lenguaje interpretado para Linux,
 empaquetarlo con CDE y probarlo en diferentes distribuciones.**

1- Escrito en el foro:

-Para alojar varios clientes en un sólo servidor: utilizaría la virtualización a nivel de sistema operativo ya que permite una implementación de clientes y administrador usando un mismo entorno hardware.
-Para crear un sistema eficiente de web + middleware + base de datos: utilizaría la virtualización plena ya que permite adaptar todos los aspectos del ordenador para utilizar programas y sistemas operativos sin necesidad de hacer cambios, lo que permite que sea eficiente.
-Para un sistema de prueba de software e integración continua: utilizaría una virtualización de entornos de desarrollo, ya que esta pensada para proporcionarnos un entorno de pruebas y producción para desarrollar nuestros programas de forma más fácil y sencilla dado que incluye versiones y librerías utilizadas para ese entorno.

2-Para instalar CDE seguimos los pasos de la [página oficial](http://www.pgbovine.net/cde.html)
-clonamos el repositorio.
-accedemos a la carpeta 
-ejecutamos el make

Una vez instalado, desde la carpeta de CDE ejecutamos: 

- ./cde aplicación (antes hay que darle permisos de ejcución con chmod u+x a la aplicacion)

 y se crearán los sub-directorios para poder ejecutar la aplicación en cualquier distribución linux. Lo último que hay que hacer
es empaquetar el sub-directorio creado en la anterior sentencia.

**Ejercicio 4.
Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona.Avanzado= Instalarlo y crear una aplicación contenedorizada**

Realizado
[Pantallazo](http://i.imgur.com/XYu94sm.jpg)

Primero hemos instalado la versión de windows que nos proporciona docker, una vez descargado, abrimos el exe y realizamos la instalación.

Una vez instalado nos abrirá una imagen del terminal BOOT2DOCKER,y procederemos a descargar la imagen del tutorial con un " docker pull learn/tutorial " y procedemos a comprobar que funciona escribiendo un simple hello world:

[Pantallazo](http://i.imgur.com/KRrL1QC.jpg)

una vez hecho esto procedemos a instalar nano en la imagen descargada y guardamos los cambios con el nombre de prueba:

[Pantallazo](http://i.imgur.com/JPsM0Xr.png)

podemos comprobar que funciona al ejecutar el comando " docker run -i -t prueba nano "

[Pantallazo](http://i.imgur.com/F064Rfw.png)

**Ejercicio 5.
Instala el sistema de gestión de fuentes git**

Es tan simple como ejecutar el comando " sudo apt-get install git " en la terminal.

**Ejercicio 6.
Crear un proyecto y descargárselo con git. Al crearlo se marca la opción de incluir el fichero README, modificar el readme y subir el fichero modificado.**

He creado un proyecto llamado ejercicios con su respectivo README.md, he realizado la clonacion con el comando git clone y accediendo al directorio ejercicios lo he modificado. Solamente queda realizar un commit y el push respectivo como se verá en la imagen.

[Pantallazo](http://i.imgur.com/jzc2Ywp.png)

Y aquí se ve la actualización:

[Pantallazo](http://i.imgur.com/BKvXOY0.png)

**Ejercicio 7.
Comprobar si en la instalación hecha se ha instalado cgroups y en qué punto está montado, así como qué contiene.**

 En ubuntu 12.04 no esta montado por defecto puesto que estaba vacío cuando lo he mirado con el comando ls asique me he dispuesto a montarlo con la orden " sudo mount -t cgroup cgroup /sys/fs/cgroup/ ".
Comprobandolo de nuevo podemos ver que ya si hay contenido:

[Pantallazo](http://i.imgur.com/1Ab2ak2.png)

En la imagen podemos ver los diferentes archivos con la información de los diferentes recursos del sistema.

**Ejercicio 8.
1.Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador, en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recursos de unos y otros durante un tiempo determinado.
2.Calcular el coste real de uso de recursos de un ordenador teniendo en cuenta sus costes de amortización. Añadir los costes eléctricos correspondientes.**

1.He procedido ha crear los tres grupos especificados en el enunciado del problema en el directorio de cgroup. Dentro se encuentran los archivos necesarios para configurar las tareas. Una vez realizado esto, miramos los ids de las tareas a asociar a cada grupo en el orden de :

grupo1 -> firefox
grupo2 -> gedit
grupo3 -> calculadora

[Pantallazo](http://i.imgur.com/EKBLbuJ.png)

Por último solo queda comparar los tiempos que se muestran en los archivos cpuacct.usage de cada grupo con lo que nos queda:

[Pantallazo](http://i.imgur.com/VmKfk24.png)


2.Usando la calculadora que indico en el siguiente [enlace](http://www.pcsilencioso.com/recursos/bdd/73-alimentacion/45-gasto-electricidad) hemos hecho calculado los gastos de un ordenador con las características que se muestran [aquí](http://i.imgur.com/CKDZwbm.png)

Si el ordenador vale 699 euros:
* A los 7 años el consumo es: 7 años*12meses*7'88 euros/mes=661,92 euros que añadidos al precio del ordenador hace un total de 1360,92 euros

Aplicando los ratios del ejercicio 1, obtenemos

* Amortización a 4 años: 141,54 euros
* Amortización a 7 años: 247,69 euros

Esta es la amortización con el coste eléctrico añadido.

**Ejercicio 9.
1.Discutir diferentes escenarios de limitación de uso de recursos o de asignación de los mismos a una u otra CPU.
2.Implementar usando el fichero de configuración de cgcreate una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa).
3.Usar un programa que muestre en tiempo real la carga del sistema tal como htopy comprobar los efectos de la migración en tiempo real de una tarea pesada de un procesador a otro (si se tiene dos núcleos en el sistema).
4.Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios.**


**Ejercicio 10.
Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?**

Mi procesador es Intel(R) Core(TM) i7-4702MQ CPU @ 2.20GHz y al ejecutar la orden indicada no da ninguna salida lo que presupone que esta desabilitada para la máquina virtual que estoy utilizando, ya que yo mismo he habilitado dicha funcionalidad en la bios.

**Ejercicio 11.
Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.**

[Pantallazo](http://i.imgur.com/PHLWMGk.png)

COmo se puede observar en la imagen no esta habilitado dicho modulo, lo que es comprensible ya que en la virtualbox no esta habilitada la aceleración por hardware.


**Ejercicio 12.
Comentar diferentes soluciones de Software as a Service de uso habitual**

Los SaaS son servicios que ofrecen algunas empresas ,como han dicho muchos de mis compañeros , google o Spotify. 
Este tipo de software presenta bastantes ventajas conforme al cliente ya que no tiene que requerir demasiados recursos ni requisitos para utilizar el servicio ya que se concentra el trabajo en la empresa o emisor del servicio, permite flexibilidad de uso en cualquier sistema operativo y la mayoria suelen ofrecer software gratuito del servicio, ofreciendo mas calidad a aquel que opta por el sistema de pago , si lo hubiera. Por contra, presenta la necesidad de disponer de una red, lo que conlleva a depender del ISP en el caso de que la red caiga, los datos o archivos estan en servidores remotos lo que son inaccesibles directamente y puede dar a problemas de privacidad o de disponibilidad de ellos.

