#Ejercicios de Juan Antonio Marin

##Tema 1:

###Ejercicio 1:
Busco un servidor para hacer la amortización a 4 y 7 años:

[Enlace de la pagina donde he encontrado el servidor](http://www.dynos.es/servidor-hp-proliant-ml350e-g8-xeon-e5-2407-2.2-ghz-2gb-ddr3-500gb-sata-lff-dvd-rw-matrox-g200-array-b120i-887111422231__470065-691.html)

**Características:**

SERVIDOR HP PROLIANT ML350E G8 XEON E5-2407 2.2 GHz / 2GB DDR3
/500GB SATA LFF / DVD-RW / MATROX G200


**Precio: 1035€**

El primer paso es quitar el IVA, ya que las deducciones se hacen sobre la base imponible.

Quitamos el 21% de IVA, 1035 / 1,21 = 855,37€

El coeficiente máximo deducible al año para equipos del tratamiento de información es del 26% por lo que a 4 años podemos deducir cada año al 25%

Año 2014: 213,84€

Año 2015: 213,84€

Año 2016: 213,84€

Año 2017: 213,84€

Ahora lo calculamos a 7 años, hacemos por ejemplo 6 años al 15% y el ultimo año al 10%.

Año 2014: 128.30€

Año 2015: 128.30€

Año 2016: 128.30€

Año 2017: 128.30€

Año 2018: 128.30€

Año 2019: 128.30€

Año 2020: 85,57€

Esto siempre suponiendo que el servidor lo compramos a principios del año 2014.

###Ejercicio 2:

Vamos a comparar los dos proveedores de servicios Amazon AWS y Bluemix de IBM:

Primero vamos a ver el numero de horas que tiene el 1% de un año y el 10% de un año.
365 días X 24 horas = 8,760 horas X 1% = 87,6 horas al año
365 días X 24 horas = 8,760 horas X 10% = 876 horas al año

El procesador no queda claro en ninguna de las dos plataformas, solo en amazon puedes seleccionar mas procesadores, la memoria RAM es de 1GB en el caso de amazon y de 2GB en el caso de Bluemix. 5GB de disco duro en el caso de Amazon y 2GB de disco duro en Bluemix.

Para el 1% de procesamiento básicamente los dos servicios serian viables porque amazon dan 750 horas de procesamiento, y Bluemix 375 horas gratuitas (Aunque la cuenta es gratuita durante un mes).

Para el 10% ya si tendremos que pagar en ambos servicios, vamos a calcular cuanto en cada uno:

Amazon precio por hora 0,013 dolares por hora, 876 horas - 750 gratuitas = 123 horas a pagar = 1,599 dolares.
Bluemix precio por hora 0,05 dolares por hora, 876 horas - 375 gratuitas = 501 hora a pagas = 25,05 dolares.

Como podemos observar el precio de Amazon es mucho mas económico pero sus características son inferiores.

###Ejercicio 3:

1. ¿Qué tipo de virtualización es la más adecuada para: alojar varios clientes en un sólo servidor, crear un sistema eficiente de web + middleware + base de datos, un sistema de prueba de software e integración continua? Responder aquí y razonar.

Varios clientes en un solo servidor: Para este usaría un entorno de virtualización a nivel se sistema operativo, ya que tendría al servidor como anfitrión y a los clientes aislados en los contenedores.

Crear un sistema eficiente de web +  middleware + base de datos: un sistema de virtualización plena ya que tiene estructuras de control llamadas hipervisores para controlar los diferentes aspectos de web y base de datos.

Un sistema de prueba de software e integración continua: dado que es un sistema de prueba simplemente debe usarse una virtualización de entornos de desarrollo para así probar las diferentes versiones y por tanto así tenemos cubierta una integración continua.

2. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

Primero creamos el programa mas simple que podemos crear:

````
#!/bin/bash
echo "Esto es una prueba"
````
Descargamos del repositorio el CDE: git clone git://github.com/pgbovine/CDE.git

Instalamos entrando en el directorio y con el comando make para ejecutar el Makefile.

Copiamos el programa creado en la carpeta CDE, y le cambiamos los permisos: chmod u+x prueba.sh.

Ahora simplemente ejecutamos ./cde ./prueba.sh.

Y se nos crea el CDE en mi caso en: cde-package/cde-root/home/juanaco/CDE/prueba.sh.cde el archivo, junto a todo el cde-package. Este podemos comprimirlo y llevarlo a otros sistemas.

<img src="http://i58.tinypic.com/2w7fznb.png"></img>

###Ejercicio 4:

Tutorial realizado completamente:

<img src="http://i59.tinypic.com/2vvswsn.jpg"></img>

Aqui el tutorial finalizado:

<img src="http://i61.tinypic.com/1jm42x.png"></img>



###Ejercicio 5:

Primero instalo el git con el comando: sudo apt-get install git

Para bajar mi directorio completo: git clone https://github.com/JAntonioMarin/GII-2014.git

Para actualizarlo normalmente utilizo: git pull

Entro en el directorio con cd GII-2014/

Para ver los cambios que he realizado en el fichero utilizo: git status

Tras realizar todos los cambios pongo el fichero que quiero modificar: git add ejercicios/JAntonioMarin.md

Me pide modificar las variables globales con mis datos: git config --global user.email avalanch.psp@gmail.com, git config --global user.name JAntonioMarin

Hago el commit del fichero: git commit -am "Asunto para cambiar el fichero"

Y finalmente hago un git push para guardar los cambios.

Para actualizar el repositorio: git pull https://github.com/JJ/GII-2014.git master



###Ejercicio 6:

He seguido la linea de comandos que marca github para crear un nuevo proyecto con su README.md.

1. Creamos el fichero con: touch README.md.
2. Añadimos el fichero README.md: git add README.md.
3. Hacemos el commit del fichero: git commit -m "Primer commit".
4. Lo añadimos a la ruta: git remote add origin https://github.com/JAntonioMarin/ejerciciosjj.git.
5. Guardamos los cambios: git push -u origin master.

La segunda parte para realizar los cambios lo hacemos como siempre:

6. Cambiamos en el fichero y lo añadimos de nuevo: git add README.md.
7. Hacemos el: git commit -am "Cambio de README.md".
8. Hacemos el push: git push.

###Ejercicio 7:

Montamos el cgroup y lo examinamos:
<img src="http://i62.tinypic.com/idhgnp.png"></img>

###Ejercicio 8:

Creamos el grupo de control:

````
sudo mkdir grupoDeControl
cd grupoDeControl
sudo mkdir g1
sudo mkdir g2
sudo mkdir g3
````

<img src="http://i58.tinypic.com/28amf5c.png"></img>

Ahora miro los PIDS de los procesos:

<img src="http://i58.tinypic.com/2s8sbnq.png"></img>

Y dado que me da un error de espacio no puedo completar el ejercicio, pero he mirado como se hace básicamente:

<img src="http://i61.tinypic.com/fxe34m.png"></img>

Después veríamos cada proceso:

````
cat /sys/fs/cgroup/g1/cpuacct.usage
cat /sys/fs/cgroup/g2/cpuacct.usage
cat /sys/fs/cgroup/g3/cpuacct.usage
````

####Parte 2:

Para calcular el gasto de energia de un PC utilizo la siguiente calculadora: http://www.eu-energystar.org/es/es_008.shtml

<img src="http://i58.tinypic.com/2litroj.png"></img>


Pongo el calculo a 7 años:

Año 2014: 128.30€ + 189,6€ = 317,9€

Año 2015: 128.30€ + 189,6€ = 317,9€

Año 2016: 128.30€ + 189,6€ = 317,9€

Año 2017: 128.30€ + 189,6€ = 317,9€

Año 2018: 128.30€ + 189,6€ = 317,9€

Año 2019: 128.30€ + 189,6€ = 317,9€

Año 2020: 85,57€ + 189,6€ = 275,17€


###Ejercicio 9:

#### Discutir diferentes escenarios de limitación de uso de recursos o de asignación de los mismos a una u otra CPU.

1. Escenario 1: El ejemplo es un servidor compartido para el alojamiento de paginas web, los recursos deben dividirse equitativamente entre los clientes, pero uno de los clientes en un momento puntual necesita mas proceso que los demás no están usando, el servidor debería asignar mas cpu al cliente y avisarle de que debería de tener cuidado con el uso de la cpu.

2. Escenario 2: Un servidor sobre los resultados de fútbol, tendrán un acceso mayor durante las horas en que se juegan los partidos, se deberían asignar mas CPUs a el proceso de resultado durante estas horas.

3. Escenario 3: Un usuario necesita agilidad en un programa en especifico por que su uso es mayor y de mayor utilidad, podria dar mas prioridad a este proceso.

#### Implementar usando el fichero de configuración de cgcreate una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa).

#### Usar un programa que muestre en tiempo real la carga del sistema tal como htopy comprobar los efectos de la migración en tiempo real de una tarea pesada de un procesador a otro (si se tiene dos núcleos en el sistema).

#### Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios.

###Ejercicio 10:

Primer hago el egrep '^flags.*(vmx|svm)' /proc/cpuinfo
Ahora puedo ver mediante un cat /proc/cpuinfo las características de mi procesador

````
egrep '^flags.*(vmx|svm)' /proc/cpuinfo
/proc/cpuinfo
````

Aquí el resultado del cat

````
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 42
model name	: Intel(R) Core(TM) i5-2415M CPU @ 2.30GHz
stepping	: 7
microcode	: 0x28
cpu MHz		: 2293.366
cache size	: 3072 KB
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts mmx fxsr sse sse2 ss syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts nopl xtopology tsc_reliable nonstop_tsc aperfmperf eagerfpu pni pclmulqdq ssse3 cx16 pcid sse4_1 sse4_2 x2apic popcnt aes xsave avx hypervisor lahf_lm ida arat epb xsaveopt pln pts dtherm
bogomips	: 4586.73
clflush size	: 64
cache_alignment	: 64
address sizes	: 40 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
model		: 42
model name	: Intel(R) Core(TM) i5-2415M CPU @ 2.30GHz
stepping	: 7
microcode	: 0x28
cpu MHz		: 2293.366
cache size	: 3072 KB
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts mmx fxsr sse sse2 ss syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts nopl xtopology tsc_reliable nonstop_tsc aperfmperf eagerfpu pni pclmulqdq ssse3 cx16 pcid sse4_1 sse4_2 x2apic popcnt aes xsave avx hypervisor lahf_lm ida arat epb xsaveopt pln pts dtherm
bogomips	: 4586.73
clflush size	: 64
cache_alignment	: 64
address sizes	: 40 bits physical, 48 bits virtual
power management:
````

El procesador es un i5-2415M CPU @ 2.30Ghz, no muestra el valor vmx en los flags.


###Ejercicio 11

Usamos el comando kvm-ok


Procedemos a instalar el cpu-checker. 

Ejecutamos pero mi procesador probablemente dado que es una virtualización lo que estoy usando no me deja utilizarlo.

Captura de todo el proceso:

<img src="http://i58.tinypic.com/dcd16r.png"></img>


###Ejercicio 12

Comentar en el foro:

<img src="http://i61.tinypic.com/2efq2h5.png"></img>


##Tema 2:

###Ejercicio 1

Este procedimiento lo utilizé el año pasado en DAI para trabajar en la asignatura:

Primero instalamos el aptitude para instalar el virtual env:

````
sudo apt-get install aptitude
sudo aptitude install libc6-dev python-dev python-virtualenv
````

Ahora vamos a crear el entorno virtual para python:

````
mkdir ./virtualenv
virtualenv --python=/usr/bin/python2.7 python2.7
````

Ya solo nos queda activarlo

````
source ./python2.7/bin/activate
````

<img src="http://i60.tinypic.com/1e6xbp.png"></img>

###Ejercicio 2

Me he registrado en Openshift ya que me hara falta para la actividad 3:

<img src="http://i60.tinypic.com/23saxqp.png"></img>

###Ejercicio 3

Primero le doy a crear nueva aplicación:

<img src="http://i61.tinypic.com/2nv83va.png"></img>

Relleno los datos necesarios:

<img src="http://i59.tinypic.com/291fa83.png"></img>
<img src="http://i62.tinypic.com/k9ggoj.png"></img>
<img src="http://i61.tinypic.com/16715yx.png"></img>

Y finalmente se instala correctamente:

<img src="http://i62.tinypic.com/n47b0y.png"></img>
<img src="http://i61.tinypic.com/2j60j1f.png"></img>


###Ejercicio 4

Primero creo el archivo dentro del google drive, como por ejemplo un Documento, ahora voy a Herramientas >> Editor de secuencia de comandos

Ahora creo un pequeño script del tipo "Hola mundo" llamando a la funcion onOpen para que se ejecute al abrir:

<img src="http://i59.tinypic.com/akv0vd.png"></img>

Comprobamos el script actualizando el documento:

<img src="http://i61.tinypic.com/20afej6.png"></img>

El segundo paso es utilizar un menu para que lo ejecute:

<img src="http://i60.tinypic.com/1q0t53.png"></img>

<img src="http://i57.tinypic.com/j953pw.png"></img>

Y comprobamos que funciona:

<img src="http://i59.tinypic.com/15g5myq.png"></img>


###Ejercicio 5

Actualmente el lenguaje de programación que mas uso es c++, por ejemplo para las practica de Informatica Grafica utilizo un sistema basado en Makefile,
para ello vamos a ver por ejemplo como lo construyo para la practica 2 de IG:

<img src="http://i58.tinypic.com/suycer.png"></img>

Aqui pego el codigo con algunos comentarios:

````
# fichero Makefile
#
# nombre del fichero ejecutable
#
TARGETS= practica2

# banderas para el compilador (C y C++). Se indican los directorios donde se puenden
# encontrar ficheros para incluir mediante la opcion -I
# la opcion -g sirve para permitir la depuración
#
CFLAGS=    -g -DXWINDOWS -DSHM -I/usr/include -I.
CXXFLAGS=  -g -DXWINDOWS -DSHM -I/usr/include -I.

# banderas pra el enlazador
# Se indica directorios donde encontrar las funciontecas con -L. Usando -l seguido del
# nombre se indica la funcionteca que se desea enlazar.
#
LDFLAGS=  -lGLU -lGL -lglut

# definicion del compilador
#
CC = g++

# orden que sera ejecutada por defecto
#
default : $(TARGETS)

# regla de ejecucion
#
$(TARGETS) : file_ply_stl.o _ply.o _object3D.o _triangles_object3D.o _cube.o _tetrahedron.o user_code.o practica2.o
	$(CC) -o $@ $(CXXFLAGS) file_ply_stl.o _ply.o _object3D.o _triangles_object3D.o _cube.o _tetrahedron.o user_code.o practica2.o $(LDFLAGS)

#
#
clean:
	rm -f *.o
	rm -f $(TARGETS)

#
#
redo:
	touch *.cc
	make

#
#
superclean:
	rm -f *.o
	rm *~
	rm -f $(TARGETS)

#
#
tgz:
	rm -f *.o
	rm *~
	rm -f $(TARGETS)
	tar -zcvf $(TARGETS).tgz *
````

Aqui ya tenemos todo el sistema automatizado para compilar rapidamente en el entorno de trabajo. Simplemente ejecuto el comando make y me genera el ejecutable practica2, simplemte ejecuto ./practica2


###Ejercicio 6

Dado que he trabajado con OpenShift vamos a installar el entorno en Ubuntu, para ello sigo el tutorial de la pagina de openshift:

````
https://developers.openshift.com/en/getting-started-client-tools.html#ubuntu
````

Primero instalo el rubygems y el rhc:
<img src="http://i61.tinypic.com/al3qqu.png"></img>
````
sudo apt-get install ruby-full rubygems git-core
sudo gem install rhc
````
Instalo rhc:

````
rhc setup
````
<img src="http://i58.tinypic.com/2whr1py.png"></img>

Y simplemente sigo los pasos:
<img src="http://i57.tinypic.com/vd0ort.jpg"></img>

Y finalmente:
<img src="http://i58.tinypic.com/313rdza.png"></img>


###Ejercicio 7

Para este ejercicio he utilizado por ejemplo el JUnit de Netbeans, ya que utilizo tambien mucho este entorno de programación:

Cojo un proyecto cualquiera de los que tengo y simplemente vamos a crearle unos test simples:

<img src="http://i58.tinypic.com/15ro9ki.jpg"></img>

Y nos sale una pantalla con los distintos test que podemos seleccionar, selecciono JUnit y el acceso a todo.

<img src="http://i59.tinypic.com/j63jx4.jpg"></img>

Ahora cojo y le hago dos test simples lo suyo es usar elementos del programa para hacer los test, como funciones y todo ese tipo de elementos.

Para comprobar simplemente hago dos funciones a testear con un hola mundo que rellenare con mis datos:

<img src="http://i62.tinypic.com/ek582v.jpg"></img>

Cambio los parametros y hago un test sobre el programa:

<img src="http://i57.tinypic.com/2dv21rb.jpg"></img>































