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
####Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona. Avanzado Instalarlo y crear una aplicación contenedorizada.
Tutorial realizado. <img src="http://i62.tinypic.com/o77mo0.png"></img>





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

Tenemos el caso de un PC sobremesa con las siguientes características:
Core i7-920 + GTX260 Extreme , con un uso estimado de 8 horas de idle y 8 horas de carga nos da un coste de 12.54€ al mes. Al año serian unos: 12.54*12= 150.48€.

Si ponemos una amortización a 6 años(cada año amortizamos 166.66€), considerando ésta la vida media de un pc de sobremesa, tenemos un cosumo de: 

6*150.48=902.88€

Si el pc nos ha costado aproximadamente 1000€, el precio total sería:

Total: 902.88+1000= 1902.88€



###Ejercicio 9:
####Discutir diferentes escenarios de limitación de uso de recursos o de asignación de los mismos a una u otra CPU.
Distingo varios escenarios posibles:

* **Escenario 1:** En el que una empresa durante unos meses en concreto se dedique a desarrollar un proyecto y haga uso mas intensivo de los recursos de los terminales, por lo que se deberían asignar lógicamente más recursos.

* **Escenario 2:** En el que un administrador desarrolla una aplicación. Deberá tener asignados más recursos que el usuario al que va destinada ésta.

* **Escenario 3:** Según las necesidades del usuario, se deberán asignar más recursos al tipo de función que esté desempeñando, por ejemplo si usa más el navegador deberá destinar más recursos a éste.

####Implementar usando el fichero de configuración de cgcreate una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa).

En primer lugar instalamos cgcreate mediante el comando: sudo atp-get install cgroup-bin
El fichero de configuración de cgcreate, "cgconfig.conf" lo encontramos en el directorio /etc.
Indicamos donde está montado el subsistema de cgroup añadiendo a dicho fichero "cpu=/sys/fs/cgroup/cpu"

Crearemos dos grupos en concreto: proc-user y proc-syst. Vemos mediante cpu.shares su valor, siendo de 1024. Con lo que le asignaremos 25% (1024x0.25=256) y 75% (1024x0.75=768) respectivamente:

````
mount {
   cpu = /sys/fs/cgroup/cpu;
}

group proc-user {
    cpu {
        cpu.shares = "256";
    }
}

group proc-syst {
    cpu {
        cpu.shares = "768";
    }
}
````

####Usar un programa que muestre en tiempo real la carga del sistema tal como htop y comprobar los efectos de la migración en tiempo real de una tarea pesada de un procesador a otro (si se tiene dos núcleos en el sistema).

En primer lugar instalamos htop mediante sudo apt-get install htop.
Ejecutamos para ver la carga total:

<img src="http://i61.tinypic.com/2qcnvjb.jpg"></img>

Asignaremos al core 2 (que es el mas ocioso) una serie de tareas para ver como aumenta su consumo con respecto a los
demás. Para ello asignaremos varias tareas varias veces:

````
taskset 0x2 firefox
taskset 0x2 ddd
taskset 0x2 geany
````

<img src="http://i61.tinypic.com/11t8nbd.png"></img>

####Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios.

En primer lugar tenemos que hacer uso del parámetro "blkio.weight" dentro del archivo cgconfig, ésto le asignará la prioridad que le indiquemos, en un rango de 100 a 1000 (le asignaré 800 de prioridad). Se lo asignaremos a un servidor apache dentro de un grupo que vamos a crear.
El archivo quedará así:

````

mount {
   blkio = /sys/fs/cgroup/blkio;
}

group apache {
    blkio {
        blkio.weight = "800";
    }
}

````

###Ejercicio 10:
####Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Para comprobarlo hacemos: 
````
egrep '^flags.*(vmx|svm)' /proc/cpuinfo
cat /proc/cpuinfo
````
La salida que nos da es la siguiente:

````
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 42
model name	: Intel(R) Core(TM) i7-2630QM CPU @ 2.00GHz
stepping	: 7
microcode	: 0x1a
cpu MHz		: 1995.529
cache size	: 6144 KB
physical id	: 0
siblings	: 2
core id		: 0
cpu cores	: 2
apicid		: 0
initial apicid	: 0
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts mmx fxsr sse sse2 ss ht nx rdtscp constant_tsc arch_perfmon pebs bts xtopology tsc_reliable nonstop_tsc aperfmperf eagerfpu pni pclmulqdq ssse3 pcid sse4_1 sse4_2 x2apic popcnt aes xsave avx hypervisor ida arat epb xsaveopt pln pts dtherm
bogomips	: 3991.05
clflush size	: 64
cache_alignment	: 64
address sizes	: 40 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
model		: 42
model name	: Intel(R) Core(TM) i7-2630QM CPU @ 2.00GHz
stepping	: 7
microcode	: 0x1a
cpu MHz		: 1995.529
cache size	: 6144 KB
physical id	: 0
siblings	: 2
core id		: 1
cpu cores	: 2
apicid		: 1
initial apicid	: 1
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts mmx fxsr sse sse2 ss ht nx rdtscp constant_tsc arch_perfmon pebs bts xtopology tsc_reliable nonstop_tsc aperfmperf eagerfpu pni pclmulqdq ssse3 pcid sse4_1 sse4_2 x2apic popcnt aes xsave avx hypervisor ida arat epb xsaveopt pln pts dtherm
bogomips	: 3991.05
clflush size	: 64
cache_alignment	: 64
address sizes	: 40 bits physical, 48 bits virtual
power management:

processor	: 2
vendor_id	: GenuineIntel
cpu family	: 6
model		: 42
model name	: Intel(R) Core(TM) i7-2630QM CPU @ 2.00GHz
stepping	: 7
microcode	: 0x1a
cpu MHz		: 1995.529
cache size	: 6144 KB
physical id	: 1
siblings	: 2
core id		: 0
cpu cores	: 2
apicid		: 2
initial apicid	: 2
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts mmx fxsr sse sse2 ss ht nx rdtscp constant_tsc arch_perfmon pebs bts xtopology tsc_reliable nonstop_tsc aperfmperf eagerfpu pni pclmulqdq ssse3 pcid sse4_1 sse4_2 x2apic popcnt aes xsave avx hypervisor ida arat epb xsaveopt pln pts dtherm
bogomips	: 3991.05
clflush size	: 64
cache_alignment	: 64
address sizes	: 40 bits physical, 48 bits virtual
power management:

processor	: 3
vendor_id	: GenuineIntel
cpu family	: 6
model		: 42
model name	: Intel(R) Core(TM) i7-2630QM CPU @ 2.00GHz
stepping	: 7
microcode	: 0x1a
cpu MHz		: 1995.529
cache size	: 6144 KB
physical id	: 1
siblings	: 2
core id		: 1
cpu cores	: 2
apicid		: 3
initial apicid	: 3
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts mmx fxsr sse sse2 ss ht nx rdtscp constant_tsc arch_perfmon pebs bts xtopology tsc_reliable nonstop_tsc aperfmperf eagerfpu pni pclmulqdq ssse3 pcid sse4_1 sse4_2 x2apic popcnt aes xsave avx hypervisor ida arat epb xsaveopt pln pts dtherm
bogomips	: 3991.05
clflush size	: 64
cache_alignment	: 64
address sizes	: 40 bits physical, 48 bits virtual
power management:

processor	: 4
vendor_id	: GenuineIntel
cpu family	: 6
model		: 42
model name	: Intel(R) Core(TM) i7-2630QM CPU @ 2.00GHz
stepping	: 7
microcode	: 0x1a
cpu MHz		: 1995.529
cache size	: 6144 KB
physical id	: 2
siblings	: 2
core id		: 0
cpu cores	: 2
apicid		: 4
initial apicid	: 4
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts mmx fxsr sse sse2 ss ht nx rdtscp constant_tsc arch_perfmon pebs bts xtopology tsc_reliable nonstop_tsc aperfmperf eagerfpu pni pclmulqdq ssse3 pcid sse4_1 sse4_2 x2apic popcnt aes xsave avx hypervisor ida arat epb xsaveopt pln pts dtherm
bogomips	: 3991.05
clflush size	: 64
cache_alignment	: 64
address sizes	: 40 bits physical, 48 bits virtual
power management:

processor	: 5
vendor_id	: GenuineIntel
cpu family	: 6
model		: 42
model name	: Intel(R) Core(TM) i7-2630QM CPU @ 2.00GHz
stepping	: 7
microcode	: 0x1a
cpu MHz		: 1995.529
cache size	: 6144 KB
physical id	: 2
siblings	: 2
core id		: 1
cpu cores	: 2
apicid		: 5
initial apicid	: 5
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts mmx fxsr sse sse2 ss ht nx rdtscp constant_tsc arch_perfmon pebs bts xtopology tsc_reliable nonstop_tsc aperfmperf eagerfpu pni pclmulqdq ssse3 pcid sse4_1 sse4_2 x2apic popcnt aes xsave avx hypervisor ida arat epb xsaveopt pln pts dtherm
bogomips	: 3991.05
clflush size	: 64
cache_alignment	: 64
address sizes	: 40 bits physical, 48 bits virtual
power management:

processor	: 6
vendor_id	: GenuineIntel
cpu family	: 6
model		: 42
model name	: Intel(R) Core(TM) i7-2630QM CPU @ 2.00GHz
stepping	: 7
microcode	: 0x1a
cpu MHz		: 1995.529
cache size	: 6144 KB
physical id	: 3
siblings	: 2
core id		: 0
cpu cores	: 2
apicid		: 6
initial apicid	: 6
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts mmx fxsr sse sse2 ss ht nx rdtscp constant_tsc arch_perfmon pebs bts xtopology tsc_reliable nonstop_tsc aperfmperf eagerfpu pni pclmulqdq ssse3 pcid sse4_1 sse4_2 x2apic popcnt aes xsave avx hypervisor ida arat epb xsaveopt pln pts dtherm
bogomips	: 3991.05
clflush size	: 64
cache_alignment	: 64
address sizes	: 40 bits physical, 48 bits virtual
power management:

processor	: 7
vendor_id	: GenuineIntel
cpu family	: 6
model		: 42
model name	: Intel(R) Core(TM) i7-2630QM CPU @ 2.00GHz
stepping	: 7
microcode	: 0x1a
cpu MHz		: 1995.529
cache size	: 6144 KB
physical id	: 3
siblings	: 2
core id		: 1
cpu cores	: 2
apicid		: 7
initial apicid	: 7
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts mmx fxsr sse sse2 ss ht nx rdtscp constant_tsc arch_perfmon pebs bts xtopology tsc_reliable nonstop_tsc aperfmperf eagerfpu pni pclmulqdq ssse3 pcid sse4_1 sse4_2 x2apic popcnt aes xsave avx hypervisor ida arat epb xsaveopt pln pts dtherm
bogomips	: 3991.05
clflush size	: 64
cache_alignment	: 64
address sizes	: 40 bits physical, 48 bits virtual
power management:

````
Al no aparecer vmx podemos afirmar que no tiene instalado los flags.
Mi modelo de procesador es un Intel(R) Core(TM) i7-2630QM CPU @ 2.00GHz.


###Ejercicio 11:
####Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

Lo ejecutamos y nos dice que primero debemos instalar cpu-checker:

<img src="http://i59.tinypic.com/121wp6q.png"></img>

Mi CPU no soporta las extensiones KVM por lo tanto no puede usar aceleración hardware:

<img src="http://i57.tinypic.com/fxcpiu.png"></img>


###Ejercicio12:
####Comentar diferentes soluciones de Software as a Service de uso habitual
Puede leerse el comentario en el foro [aquí.](https://github.com/JJ/GII-2014/issues/72#issuecomment-60486358)

Existen un montón de servicios en la nube disponibles, tanto para el acceso remoto como para una copia de seguridad de tus datos. Algunas de la reglas generales que deben seguir son las siguientes:
  
  * La compañía "nube" le ofrece un software para trabajar según su necesidad;
  * No tienes que cambiar el funcionamiento del software en ningún momento excepto las opciones de personalización       que se suministran con el software;
  * Tienes la opción de descargar o no el software en tu pc local, de todas formas el software y los resultados se       almacenan en la nube (por ejemplo: copia de seguridad, sincronización, recopilación de datos, etc.)
  * El software como debe ser lo suficientemente rápido como para proporcionar servicios a las personas. Por ejemplo, si se trata de un software de almacenamiento, debe ser capaz de proporcionar el espacio como y cuando sea necesario. Del mismo modo, cuando la necesidad de espacio se reduce, el software debe liberar espacio extra.
  * Se te tiene que cobrar sólo por el servicio que utiliza; no debería haber una tarifa plana definida. 

Algunos ejemplos de SaaS son:

* Cualquier aplicación de Microsfot Web Office.
* Mozy, en el que tienes que bajarte el software en tu terminal, aunque puedes utilizar backups en cualquier otro pc mientras recuerdes tus credenciales.
* OneDrive Sync: el software establece que directorios necesitan ser respaldados o más bien sincronizados. Una vez ajustado, puedes olvidarte de él ya que lo sincronizará a medida que se suman a la carpeta OneDrive o medida que cambian.
* Prey, un software que rastrea tu portátil, tablet o teléfono móvil. Guarda capturas de pantalla y otros datos en la nube. Puedes ver los datos usando cualquier pc mediante tu cuenta de Prey. Muy útil para recuperar portátiles y móviles robados.
