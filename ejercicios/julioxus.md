Ejercicios de Julio Martínez Martínez-Checa
============================

## Tema 1

### Ejercicio 1 ###

**Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.**

Vamos a calcular la amortización del siguiente servidor:

[Servidor](http://www.amazon.es/HP-ProLiant-ML110-Server-insertada/dp/B005625WIM/ref=sr_1_4?ie=UTF8&qid=1411980693&sr=8-4&keywords=servidor+hp) con un precio de 617,50€ de final.

Para realizar el cálculo de la amortización deberemos quitarle el IVA que viene incluido en el precio final del servidor:

IVA = 21% de 617,50 = 154,375

Base imponible = 617,50 - 154,375 = 463,125

Si compramos el servidor hoy, a 29 de septiembre de 2014:


**Para una amortización a 4 años**

Cada año completo se amortiza 25% de la base imponible.

En un año completo serían 115,78€

El primer año sería solo los meses de octubre, noviembre y diciembre, así que sería 3/12 de 115,78€ = 28,95€

* Año 2014: 28,95€
* Año 2015: 115,78€
* Año 2016: 115,78€
* Año 2017: 115,78€
* Año 2018: 86,83€


**Para una amortización a 7 años**

Cada año completo se amortiza un 14,28% de la base imponible.

En un año completo serían 66,13€

El primer año sería solo los meses de octubre, noviembre y diciembre, así que sería 3/12 de 66,13€ = 16,53€

* Año 2014: 16,53€
* Año 2015: 66,13€
* Año 2016: 66,13€
* Año 2017: 66,13€
* Año 2018: 66,13€
* Año 2019: 66,13€
* Año 2020: 66,13€
* Año 2021: 49,60€


## Ejercicio 2 ##

**Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.**

[VPS Hostinger](http://www.hostinger.es/hosting-vps): Plan 4 que consta de:

* 4 GB de RAM
* 9,6 GHz de CPU (Supondré que son 3 cores)
* 80 GB de almacenamiento
* 27.99€ / mes

[Servidor cloud en Amazon EC2](http://aws.amazon.com/es/ec2/pricing/) tipo t2.medium:

* 2 vCores
* 4 GB de RAM
* Almacenamiento elástico
* $0,052 por hora = 0,041€ / hora

**Si se usa sólo un 1% del tiempo:**


Con Hostinger pagaríamos lo mismo, porque el servicio se cobra por mes contratado: 27,99€ * 12 meses = 335,88€

Con Amazon pagaríamos (0,041€ * 24h * 30 días * 12 meses) * 1% = 3,54€


**Si se usa sólo un 10% del tiempo:**

Con Hostinger pagaríamos lo mismo, porque el servicio se cobra por mes contratado: 27,99€ * 12 meses = 335,88€

Con Amazon pagaríamos (0,041€ * 24h * 30 días * 12 meses) * 10% = 35,42€


## Ejercicio 3.2 ##

**Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.**

He utilizado un script de python sencillo (holamundo.py) que se puede ejecutar desde mi sistema anfitrión usando el intérprete de python que tengo instalado:

![captura1](http://i.imgur.com/C5hMFuK.png)
![captura2](http://i.imgur.com/lVxz2pX.png)

Después he descargado, compilado e instalado CDE para empaquetar el script y hacerlo portable a otra distribución de Linux sin necesidad de instalar el intérprete de python ni sus dependencias. En este caso vamos a ejecutar el paquete en mi máquina virtual de Ubuntu con una instalación limpia.

![captura3](http://i.imgur.com/iGAfsZ6.png)

Como podemos ver se ejecuta perfectamente la aplicación sin necesidad de instalar programas ni dependencias.

## Ejercicio 4 ##

**Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona. Avanzado Instalarlo y crear una aplicación contenedorizada**

He realizado satisfactoriamente el tutorial de docker y ahora voy a probarlo en mi máquina virtual.

He descargado la misma imagen del tutorial con:

\# docker pull learn/tutorial

A continuación he ejecutado el terminal de la imagen descargada con:

\# docker run -i -t learn/tutorial /bin/bash

Usando el terminal he instalado un intérprete de python y nano para escribir un script que compruebe si un número es primo. He metido dicho script en la carpeta /usr/bin para poder ejecutarlo con un comando.

He salvado los cambios en una imagen nueva con:

\# docker commit 8dbd primo

(8dbd son los 4 primeros caracteres del ID de la imagen del tutorial)

En esta imagen podemos ver las imágenes que tenemos ya creadas con sus respectivos IDs:

![captura4](http://i.imgur.com/gRW7bGk.png)

Finalmente podremos ejecutar el script de esta forma:

![captura5](http://i.imgur.com/CWKDjjP.png)

## Ejercicio 5 ##

**Instala el sistema de gestión de fuentes git**

Para instalar git basta con ejecutar la orden:

\# sudo apt-get install git

## Ejercicio 6 ##

1. Crear un proyecto y descargárselo con git. Al crearlo se marca la opción de incluir el fichero README.
2. Modificar el readme y subir el fichero modificado.

He creado un proyecto en GitHub con el fichero readme incluido.

Lo he descargado con git, y he añadido información al README haciendo lo siguiente:

![captura6](http://i.imgur.com/1egEtNj.png)

Aquí podemos ver cómo se ve en GitHub actualizado:

![captura7](http://i.imgur.com/dPMViHs.png)

## Ejercicio 7 ##

**Comprobar si en la instalación hecha se ha instalado cgroups y en qué punto está montado, así como qué contiene.**

Está montado en /sys/fs/cgroup. Contiene lo siguiente:

![captura13](http://i.imgur.com/C4zsdNd.png)

Como podemos ver se divide en carpetas diferenciando los recursos. Cada una de ellas contiene los ficheros necesarios que administran el recurso, y los grupos se deberán hacer dentro de cada uno de ellos.

## Ejercicio 8.1 ##

**Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador, en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recursos de unos y otros durante un tiempo determinado.**

He creado dos grupos en la carpeta /sys/fs/cgroup/cpu:

![captura8](http://i.imgur.com/YPl18Kn.png)

A cada uno de ellos le he asignado un proceso (Chrome y Firefox):

![captura9](http://i.imgur.com/uvHKi7g.png)

Finalmente he comprobado el tiempo de cpu consumido por cada grupo:

![captura10](http://i.imgur.com/0rQqRHc.png)

## Ejercicio 8.2 ##

**Calcular el coste real de uso de recursos de un ordenador teniendo en cuenta sus costes de amortización. Añadir los costes eléctricos correspondientes.**

Según [este artículo](http://www.pcsilencioso.com/recursos/bdd/73-alimentacion/45-gasto-electricidad) suponiendo que disponemos de un PC Core i7-920 + GTX260 Extreme
y dándole un uso de 8 horas idle + 8 horas load tendríamos un coste mensual aproximado de 12,54€.

Coste anual = 12,54€/mes * 12 meses = 150,48€

Supongamos que el ordenador costó 1000€ y lo amortizamos a 5 años, que es la vida media de un ordenador de sobremesa normal.

Costes de amortización = 5 años * 200€ = 1000€

Costes por consume eléctrico = 5 años * 150,48€ = 752,4€

TOTAL = 1752,40€

## Ejercicio 9.2 ##

**Implementar usando el fichero de configuración de cgcreate una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa).**

Lo primero de todo es tener instalado el paquete libcgroup si usamos una distribución basada en RedHat, o libcgroup-dev si es una basada en Debian.

El archivo de configuración que debemos editar es "/etc/cgconfig.conf".

La prioridad de los procesos en un grupo determinado viene dada por el parámetro "cpu.shares". El valor de cpu.shares es 1024, así que vamos a utilizar 207 para para procesos de usuario y 817 para procesos del sistema (40 y 80% de prioridad respectivamente):

```
mount {
   cpu = /sys/fs/cgroup/cpu;
}

group user_proc {
    cpu {
        cpu.shares = "207";
    }
}

group sys_proc {
    cpu {
        cpu.shares = "817";
    }
}
```
## Ejercicio 9.3 ##

**Usar un programa que muestre en tiempo real la carga del sistema tal como htop y comprobar los efectos de la migración en tiempo real de una tarea pesada de un procesador a otro (si se tiene dos núcleos en el sistema).**

He intentado pasar el proceso de ejecución de una máquina virtual a un solo core. He intentado realizar el siguiente archivo de configuración de grupos:

![captura11](http://i.imgur.com/qHPguH7.png)

Pero no se generan los grupos. También he probado a crear las carpetas de los grupos en la carpeta /sys/fs/cgroup/cpuset y asignarle un set de cpu a un grupo de todos los cores y a otro de sólo un core. El problema es que no puedo escribir en el archivo "tasks" porque "no queda espacio suficiente en disco".

Con htop he podido visualizar la carga:

![captura12](http://i.imgur.com/5Q9QAZm.png)

## Ejercicio 9.4 ##

**Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios.**

Crearemos un grupo para los servidores que llamaremos "apache" y en su interior indicaremos la prioridad de E/S que le vamos a asignar, que en este caso sería mayor que la del resto de usuarios. El rango para este parámetro estaría entre 100-1000, así que le voy a asignar un peso de 900.

Para ello editamos el archivo "/etc/cgconfig.conf", donde usaremos el parámetro "blkio.weight" para indicar la prioridad. Debemos de indicar donde se encuentra el controlador de bloqueo E/S, que en este caso será "blkio=/sys/fs/cgroup/blkio".
El archivo de configuración quedaría así:

```
mount {
   blkio = /sys/fs/cgroup/blkio;
}

group apache {
    blkio {
        blkio.weight = "900";
    }
}
```
Si el servidor que tenemos funcionando es un servidor Apache, deberemos añadir la directiva de configuración "CGROUP_DAEMON="blkio:/http" al fichero de configuración "/etc/apache2/apache2.conf" para que éste tenga conocimiento de que pertenece a un grupo de control.

## Ejercicio 10 ##

**Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?**

Mi procesador tiene activados estos flags. El modelo de mi procesador es: Intel(R) Core(TM) i5-3230M CPU @ 2.60GHz

La salida de esta orden es la siguiente:

flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms

flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms

flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms

flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms

## Ejercicio 11 ##

**Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.**

La salida de la ejecución del comando ha sido:

INFO: /dev/kvm exists
KVM acceleration can be used

Lo que quiere decir que mi ordenador contiene este módulo del kernel y puedo usar la virtualización kvm.

## Tema 2

## Ejercicio 1 ##

**Instalar un entorno virtual para tu lenguaje de programación favorito (uno de los mencionados arriba, obviamente).**

He instalado virtualenv con apt-get:

![captura14](http://i.imgur.com/uGPZOZ5.png)

## Ejercicio 2 ##

**Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu u OpenShift.**

Me he dado de alta en RedHat rellenando el formulario.

![captura15](http://i.imgur.com/b6qMry2.png)

Ahora puedo logearme en OpenShift usando esa cuenta:

![captura16](http://i.imgur.com/umMyBS8.png)

## Ejercicio 3 ##

**Crear una aplicación en OpenShift y dentro de ella instalar WordPress.**

Accedemos a [OpenShift](https://www.openshift.com/) y nos logeamos con nuestra cuenta.

A continuación pulsamos sobre "Create my first app".

Buscamos "Wordpress" y nos saldrá algo como esto:

![captura17](http://i.imgur.com/bu5RrKc.png)

Seleccionamos Wordpress 4 y rellenamos el formulario seleccionando el nombre de la URL que tendrá la aplicación entre otras cosas.
Al finalizar nos dirá que se ha completado la instalación y podremos ver qué versión de PHP y MySQL tenemos, el usuario y contraseña de la base de datos y el espacio de almacenamiento del que disponemos.

![captura18](http://i.imgur.com/d0nQlMY.png)

Finalmente si accedemos al sitio podremos empezar a configurar Wordpress para usarlo:

![captura19](http://i.imgur.com/kKUrHcl.png)