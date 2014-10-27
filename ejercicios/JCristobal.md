#Ejercicios de JCristobal (José Cristóbal López Zafra)


# Tema 1

[Enlace al tema](http://jj.github.io/IV/documentos/temas/Intro_concepto_y_soporte_fisico)

##Ejercicio 1
###Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años
Consulto el servidor TS-670 NAS 6 discos - Intel Atom Doble núcleo 2.6GHz, RAM 2GB

[Enlace al producto](http://qloudea.com/catalog/product/view/id/2481?gclid=CjwKEAjwhqShBRDS95LciqqaonISJADj1rgaQfhaESZeoiISz-U8dcOQ74W02TrdbISaoKDFUQjPLBoCjHfw_wcB)

Tiene un precio inicial de 1.111,57 € (IVA incluido)

que sin IVA (al 21%) quedaría en 878,14 €.

###Calculamos la amortización a 4 años, un 25% cada año ya que éste es el máximo que podemos deducir

* Primer año:  219,53 €
* Segundo año  219,53 €
* Tercer año:  219,53 €
* Cuarto año:  219,53 €


###Calculamos la amortización a 7 años
Variaremos el porcentage cada año, deduciendo los primeros años algo menos y aumentando

* Primer año: al 5%  43,90 €
* Segundo año al 5% 43,90 €
* Tercer año:  al 10%  87,81 €
* Cuarto año:  al 20%  175,62 €
* Quinto año:  al 20%  175,62 €
* Sexto año:  al 20%   175,62 €
* Septimo año:  al 20%  175,62 €


##Ejercicio 2
###Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.


El primer servicio que consulto es el de [Acens](http://www.acens.com/cloud/vps/) (opción VPS BUSINESS)con las características:

* 50 GB espacio en disco
* 2 GB memoria RAM
* 1.000 GB de transferencia

Con un precio de 15.75 €/mes. Un año costaría 188.40 €

Si lo usamos un 1% quedaría en 188.40€/año *0.01 = 1.88 €/año

y si lo usamos al el 10%: 188.40€/año * 0.1 = 18.84 €/año


A continuación vemos un servicio similar en la página de [Hostinger](http://www.hostinger.es/hosting-vps) el "Plan 2":

* 40 GB espacio en disco
* 2048 MB (2 GB) de RAM
* 2000 GB de transferencia

Con un precio de 13.99 €/mes. Al año 167.88 €

Si lo usaramos un 1% quedaría en 167.88€/año *0.01 = 1.67 €/año

y usandolo el 10%: 167.88€/año * 0.1 =  16.78 €/año



Ya que ofrecen servicios parecidos tienen un precio similar al mes, con lo que se traduce en un gasto parecido a lo largo del año como podemos ver en los resultados.


##Ejercicio 3
###¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro
Se puede consultar en [comentario en el foro](https://github.com/JJ/GII-2014/issues/71#issuecomment-58538032)

###Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.
Aprovecho un programa de la asignatura DAI en python para empaquetarlo con CDE.

Primero lo instalo: ejecuto sudo apt-get install cde

Y lo empaqueto con CDE: cde python act1.py

En el directorio: "~/Escritorio/cde-package/cde-root/home/cristobal/Escritorio$"  ejecuto  ./python.cde act1.py 

Pantallazo de los pasos anteriores: ![imagen1](http://i.imgur.com/dn1qoxB.png)


##Ejercicio 4
###Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona.

Tutorial de línea de órdenes de docker realizado:
![imagen2](http://i.imgur.com/UevZw5O.png)



##Ejercicio 5
###Instala el sistema de gestión de fuentes git

Lo instalo basándome en en [enlace a la presentación que nos proporciona el profesor](http://www.slideshare.net/jjmerelo/introduccin-al-uso-git-y-github-para-trabajo-colaborativo) 

Simplemente ejecuto: sudo apt-get install git


Algún comando útil para usar:

Para descargarme todo: git clone

Para actualizarlo todo: git pull 

Modifico los ficheros que deseo y con git status veo que archivos he modificado para mayor seguridad

git add [archivo y ruta] del archivo modificado

git commit para indicar el comentario

(git commit -a para incluir el archivo en el commit)

git push para enviar


##Ejercicio 6
###Crear un proyecto y descargárselo con git. Al crearlo se marca la opción de incluir el fichero README. Modificar el readme y subir el fichero modificado

Creamos un readme.md con su commit correspondiente y lo añadimos al repositorio que queremos (objetivosIV en mi caso)
Para ello introduzco en línea de comandos:

touch README.md

git init

git add README.md

git commit -m "first commit"

git remote add origin https://github.com/JCristobal/objetivosIV.git

git push -u origin master


Para modificarlo accedemos a el repositorio y al archivo readme y realizamos los cambios (o mediante comandos de git mencionados antes).


###Instrucciones sobre restricción y medición del uso de recursos: cgroups

Accedo al direcotrio de cgroups  ( /sys/fs/cgroup )

Monto el sistema de ficheros virtual:  sudo mount -t cgroup cgroup /sys/fs/cgroup/

Crear un grupo de control: sudo mkdir buenos  (y compruebo que se crean subdirectorios específicos para cada grupo de control)

creo también el grupo "malos" y asignamos las CPUs por omisión de las tareas

echo 0 > /cgroup/malos/cpuset.cpus 
echo 0 > /cgroup/malos/cpuset.mems 

y en "buenos" también

echo 0 > /cpuset.cpus 
echo 0 > /cpuset.mems 


##Ejercicio 7
###Comprobar si en la instalación hecha se ha instalado cgroups y en qué punto está montado, así como qué contiene. 

En la captura lo usamos y vemos que esta instalado correctamente y que está montado en /sys/fs/cgroup. También muestro su contenido con "ls"
![imagen1](http://i.imgur.com/BgE1uJe.png)


##Ejercicio 8
### Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador, en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recursos de unos y otros durante un tiempo determinado.
Accedo al direcotrio de cgroups  ( /sys/fs/cgroup ) y monto el sistema de ficheros virtual: sudo mount -t cgroup cgroup /sys/fs/cgroup/

![imagen1](http://i.imgur.com/BgE1uJe.png)


Creo un grupo de control para el navegador con una carpeta con este nombre en cgroup y accedo a ella:

![imagen2](http://i.imgur.com/mgjOmzm.png)


y abro una ventana del navegador, creando un proceso y accediendo a su id en consola con:

firefox &

echo $!
 
![imagen3](http://i.imgur.com/iYw4QV0.png)  

Y esa id iría a "tasks", pero no me deja añadirla, he probado dandole permisos pero no es eso lo que falla.

![imagen4](http://i.imgur.com/RZ2xFM5.png)    



Si funcionara correctamente podríamos consultar el uso de recursos accediendo a cpuacct.usage. Si lo hacemos nos resulta 0:

![imagen5](http://i.imgur.com/SObrTb4.png)  

Aunque para comprobar la consulta de recursos veo la total:

![imagen6](http://i.imgur.com/fOceyRU.png)  

### Calcular el coste real de uso de recursos de un ordenador teniendo en cuenta sus costes de amortización. Añadir los costes eléctricos correspondientes.

Supondremos un ordenador con Core i7-920 + GTX295, de un precio aproximado de 1000€. Para los gastos eléctricos supondremos una consumo de 2 horas en reposo y 4 horas de trabajo diarios,  108.32 € anuales de gasto eléctrico. (calculado [aquí](http://www.pcsilencioso.com/recursos/bdd/73-alimentacion/45-gasto-electricidad))

En una amortización de 5 años, ya que el mínimos son 4 años, al 20% cada año se queda:

1000€ + (108.32€ * 5 años) = 1541,60 € en total

ó 1000€/5 años + 108.32 = 308,32€ anual



##Ejercicio 9

##9.1 
###Discutir diferentes escenarios de limitación de uso de recursos o de asignación de los mismos a una u otra CPU.

En cuanto a la limitación de recursos nos podemos fijar en varios factores: como prioridad del usuario o uso que éste le va a dar.

Prioridad del usuario: un usuario con más prioridad, como el administrador o un usuario de pago frente a otro normal, deberían tener más recursos asignados. 

Según el uso: Podríamos limitar los recursos según el usuario que los use, asignando más a la memoria gráfica si está diseñando figuras 3D o al navegador si es un desarrollador web, por ejemplo


##9.2 
###Implementar usando el fichero de configuración de cgcreate una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa).

instalamos cgcreate:
sudo apt-get install cgroup-bin

Y en el fichero de configuración (etc/cgconfig.conf) indicamos dónde está montado el subsistema de cgroup:
añadimos al fichero "cpu=/sys/fs/cgroup/cpu"

Habrá 2 grupos, proc-sist y proc-usu y antes de asignarles más o menos prioridad vemos el valor de cpu.shares, que es de 1024.
Le daremos una prioridad de 30% (1024*0.3=307) y a los de sistema del resto (1024*0.7=717)

```

mount {
   cpu = /sys/fs/cgroup/cpu;
}

group proc-usu {
    cpu {
        cpu.shares = "307";
    }
}

group proc-sist {
    cpu {
        cpu.shares = "717";
    }
}

```

##9.3 
###Usar un programa que muestre en tiempo real la carga del sistema tal como htopy comprobar los efectos de la migración en tiempo real de una tarea pesada de un procesador a otro (si se tiene dos núcleos en el sistema).

Instalamos htop con sudo apt-get install htop

y lo ejecutamos para ver la carga a tiempo real:

![imagen](http://i.imgur.com/itj7rNT.png)


##9.4 
###Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios.

Configuramos el servidor de NGINX que tenemos, con los grupos "servidor"(80% de prioridad) y "usuarios":

```

mount {
    blkio = /cgroup/iolimit;
}

group servidor {
    blkio  {
        blkio.weight_device="800"; 
    }
}

group usuarios {
    blkio  {
        blkio.weight_device="200"; 
    }
}

```


##Ejercicio 10
###Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?


Ejectuamos la orden: egrep '^flags.*(vmx|svm)' /proc/cpuinfo
y nos devuelve:

flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx rdtscp lm constant_tsc arch_perfmon pebs bts xtopology nonstop_tsc aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 popcnt lahf_lm ida arat dtherm tpr_shadow vnmi flexpriority ept vpid

flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx rdtscp lm constant_tsc arch_perfmon pebs bts xtopology nonstop_tsc aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 popcnt lahf_lm ida arat dtherm tpr_shadow vnmi flexpriority ept vpid

flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx rdtscp lm constant_tsc arch_perfmon pebs bts xtopology nonstop_tsc aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 popcnt lahf_lm ida arat dtherm tpr_shadow vnmi flexpriority ept vpid

flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx rdtscp lm constant_tsc arch_perfmon pebs bts xtopology nonstop_tsc aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 popcnt lahf_lm ida arat dtherm tpr_shadow vnmi flexpriority ept vpid


Como aparecen varias líneas en la búsqueda dentro de cpuinfo podemos decir que tiene instalados los flags.


Es un procesador Inter Core i5-450M (2.4GHz, 3MB L3 cache)


##Ejercicio 11
###Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.


La ejecutamos pero primero instalamos cpu-cheker.

![imagen1](http://i.imgur.com/CaGepKD.png)

Ejecutamos kvm-ok y nos dice que sí está utlizado, lo podemos usar.

![imagen2](http://i.imgur.com/gL3pjaL.png)


##Ejercicio 12
###Comentar diferentes soluciones de Software as a Service de uso habitual

Aquí el enlace al [comentario](https://github.com/JJ/GII-2014/issues/72#issuecomment-59173713)


***
***


# Tema 2

[Enlace al tema](http://jj.github.io/IV/documentos/temas/PaaS)

##Ejercicio 1
###Instalar un entorno virtual para tu lenguaje de programación favorito

Instalaremos [nodeenv para node.js](https://pypi.python.org/pypi/nodeenv/), accediendo al enlace proporcionado por el profesor para consultar sobre la instalación de éste.

sudo easy_install nodeenv

Creamos un nuevo entorno y lo activamos:

virtualenv env

. env/bin/activate


Con esto vemos la versión, en mi caso la 0.11.1:


(env) $ pip install nodeenv

(env) $ nodeenv --version


![imagen](http://i.imgur.com/Uz6bN2M.png)


##Ejercicio 2
###Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu u OpenShift.

Accedemos a la página de [Heroku](https://www.heroku.com/). Introducimos nuestro e-mail y confirmamos el alta al correo que nos mandan, nos registramos y ya podemos usarlo:

![imagen](http://i.imgur.com/Jr80VGt.png)


También de igual manera, nos damos de alta en OpenShift para realizar la siguiente actividad.

##Ejercicio 3
###Crear una aplicación en OpenShift y dentro de ella instalar WordPress. 

Nos registramos en OpenShift y vamos al enlace para crear nuestra primera apliación.

![imagen1](http://i.imgur.com/UsZPFdQ.png)

Escogemos de la lista WordPress:

![imagen2](http://i.imgur.com/s9qNHF4.png)

Escogemos el nombre y la url que queremos, con lo que nos queda:

![imagen3](http://i.imgur.com/1D3rnqF.png)

Después nos registramos en WordPress y accedemos:

![imagen4](http://i.imgur.com/X9XsxNj.png)

Creamos una nueva entrada para probarlo:

![imagen5](http://i.imgur.com/75qlAHv.png)



##Ejercicio 4
###Crear un script para un documento Google y cambiarle el nombre con el que aparece en el menú, así como la función a la que llama. 

En un documento de Google Drive accedemos a Herramientas -> Editor de secuencias de comandos

Creamos una nueva función (miFuncion()):

![imagen1](http://i.imgur.com/DTDlxEQ.png)

y la añadimos al menú, compilamos y la subimos a la nube pulsando el botón del menú.

Después, dentro del documento, nos vamos a ese menú (Sample) y seleccionamos nuestra función:

![imagen2](http://i.imgur.com/9Zdmuaz.png)













