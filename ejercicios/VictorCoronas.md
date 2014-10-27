<h1> Victor Coronas Lara </h1>

#Clase del 29 de septiembre de 2014

#Ejercicios

* [+]Ejercicio 1: 
 - A) Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.

     Para realizar este ejercicio he usado el siguiente [servidor](http://www.lambda-tek.com/N12000PRO-Thecus-N12000PRO-12-Bay-NAS-Intel-Xeon-E3-1275-3-4GHz-Quad-Core-8GB-DDR3-SDRAM-3-x-1GbE-upgradeable-to-10GbE-SATA-III-and-SAS-6G-~csES/B1611704&origin=gbaseES14.4?gclid=CjwKEAjwk_OhBRD06abu3qSoxlwSJACt7sZ78IJ-fmymrW9xgsNDK9HuX8r032jrGU7uTbTSydYPahoC6SPw_wcB).

    Este servidor tiene un coste de:
    - 3647.38€ precio neto
    - 3039.48€ precio bruto

####Cálculo de la amortización en 4 años:
    Vamos a deducirnos el 25% por año que es lo máximo que podemos.
     - Primer año: 3039.48€ * 25% = 759,87€  
     - Segundo año: 3039.48€ * 25% = 759,87€ 
     - Tercer año: 3039.48€ * 25% = 759,87€  
     - Cuarto año: 3039.48€ * 25% = 759,87€  

####Cálculo de la amortización en 7 años: 
    Vamos a ir deduciendonos cada año un cierto porcentaje, pero los primeros años más ya que es inversión.  
     - Primer año: 3039.48€ * 25% = 759,87€ 
     - Segundo año: 3039.48€ * 25% = 759,87€  
     - Tercer año: 3039.48€ * 15% = 455,922€  
     - Cuarto año: 3039.48€ * 15% = 455,922€  
     - Quinto año: 3039.48€ * 10% = 303,948€  
     - Sexto año: 3039.48€ * 5% = 151,974€  
     - Séptimo año: 3039.48€ * 5% = 151,974€


* [+]Ejercicio 2: 
 - A) Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.
 
    Para la comparación voy a utilizar dos de los servicios más conocidos:  [Google Compute Engine](https://cloud.google.com/products/compute-engine/) y [Amazon EC2](http://aws.amazon.com/es/ec2/)

    Características de la máquina de Google n1-standard-1-d:
    * CPU: 1 core
    * Memoria: 3,75GB
    * Disco duro: 420GB
    * Precio por hora: 0,114834658 €/hora
    
    Características de la máquina de Amazon m3.medium:
    * CPU: 1 core
    * Memoria: 3,75GB 
    * Disco duro: 410GB
    * Precio: 0,126714105 €/hora

   ####Cálculo de los precios al 1% de uso:
    Google: 0,114834658 * 87,6 horas = 10,105449904 €.
    Amazon: 0,126714105 * 87,6 horas = 11,15084124 €.  
      
    
   ####Cálculo de los precios al 10% de uso:
    Google: 0,114834658 * 876 horas = 100,595160408 €
    Amazon: 0,126714105 * 876 = 111,00155598 €
      


* [+]Ejercicio 3: 
 - A) ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro
   [Comentario en el foro](https://github.com/JJ/GII-2014/issues/71)

 -Si queremos alojar varios clientes en un servidor, utilizaría la virtualización a nivel de sistema operativo, ya que esta nos permite aislar las cuentas de cada usuario por separado, nos permite a la vez que el anfitrión y el cliente usen el mismo sistema operativo pero aislandose entre si y por último el administrados de sistema puede gestionar todo.
  
 -Para la creación de un sistema eficiente de web + middleware + base de datos, elegiría una virtualización plena, ya que nos permite virtualizar todo el sistema por completo, para la ejecución tanto de sistemas operativos, así como cualquier tipo de aplicación.
  
 -Para un sistema de prueba de software e integracion continua, yo usaria la virtualizacion de entornos de desarrollo para probar en las diferentes versiones de forma más rápida, ya que consigue reproducir cada entorno de producción de la forma parecída posible.

 - B) Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con [CDE](http://www.pgbovine.net/cde.html) y probarlo en diferentes distribuciones.

  -He usado un programa de prueba muy sencillo, usa en la asignatura DAI en el lenguaje PYTHON.
  [Programa de prueba](https://www.dropbox.com/s/xkl4fdvnuw4lpuy/ejer1.py?dl=0)
  Se descargar el archivo CDE, se le dan permisos de ejecución y lo ejecutamos junto con le programa.
[imagen1](https://www.dropbox.com/s/zdpyscmwd5bfupu/Captura%20de%20pantalla%202014-10-16%20a%20la%28s%29%2009.50.17.png?dl=0)
[imagen2](https://www.dropbox.com/s/a1lb65uf082rtcb/Captura%20de%20pantalla%202014-10-16%20a%20la%28s%29%2009.47.01.png?dl=0)

* [+]Ejercicio 4:
 - A) Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona.
 - [imagen1](https://www.dropbox.com/s/z9bk890uv05nqth/Captura%20de%20pantalla%202014-10-16%20a%20la%28s%29%2009.58.31.png?dl=0)

#Clase del 30 de septiembre de 2014

#Ejercicios

* [+]Ejercicio 5
 - Instala el sistema de gestión de fuentes git.
 - Una vez instalado git "sudo apt-get install git" comprobamos que esta instalado con la orden "git version".
  [imagen1](https://www.dropbox.com/s/o9k9vpk29dvc3d9/Captura%20de%20pantalla%202014-10-16%20a%20la%28s%29%2010.02.40.png?dl=0)

* [+]Ejercicio 6
 - A) Crear un proyecto y descargárselo con git. Al crearlo se marca la opción de incluir el fichero README.
  
-En mi repositorio de [GITHUB](https://github.com/VictorCoronas) he creado un nuevo [proyecto "Prueba"](https://github.com/VictorCoronas/Prueba).

    touch README.md
    git init
    git add README.md
    git commit -m "first commit"
    git remote add origin https://github.com/VictorCoronas/prueba.git
    git push -u origin master
 
 - B) Modificar el readme y subir el fichero modificado.
  
-He realizado una modificación del archivo [README.md](https://github.com/VictorCoronas/Prueba/blob/master/README.md).


* Ejercicio 7
 - A) Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador, en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recursos de unos y otros durante un tiempo determinado.

Voy a usar el paquete cgroup-bin puesto permite un control por línea de órdenes algo más sencillo sin necesidad de trabajar directamente con sistemas de ficheros virtuales.

En primer lugar lo que debemos hacer es instalar este paquete:

    sudo apt-get install cgroup-bin

Lo siguiente es crear un grupo que contendrá varios subgrupos. Para crearlo usamos la siguiente orden:

    sudo cgcreate -a francisco -g memory,cpu,cpuacct:ejercicio7

Este grupo se encarga de controlar la memoria, CPU y de contabilizar el uso de recursos de CPU y da permiso al usuario francisco para que trabaje con el.

Creado el grupo, vamos a crear varios subgrupos: uno encargado de ejecutar el navegador, otro de ejecutar el procesador de textos y otro de ejecutar el cliente de correo electrónico Mozilla Thunderbird.

    sudo cgcreate -g memory,cpu,cpuacct:ejercicio7/navegador
    sudo cgcreate -g memory,cpu,cpuacct:ejercicio7/editor
    sudo cgcreate -g memory,cpu,cpuacct:ejercicio7/correo

Con cgexec asignamos los procesos de cada subgrupo.

    sudo cgexec -g memory,cpu,cpuacct:ejercicio7/navegador firefox
    sudo cgexec -g memory,cpu,cpuacct:ejercicio7/editor gedit
    sudo cgexec -g memory,cpu,cpuacct:ejercicio7/correo thunderbird

Para comparar el uso de recursos visualizamos los resultados en:

    /sys/fs/cgroup/(memory|cpu|cpuacct)/ejercicio7/(navegador|editor|correo)

Resultados para el navegador:

    - cpuacct.usage --> 2943724935
    - cpuacct.stat:
           user 244
           system 38
    - cpuacct.usage_percpu --> 422363850 1046168504 1273224787 205078078 
    - memory.max_usage_in_bytes --> 327741440

Resultado para el editor:

    - cpuacct.usage --> 2345308237
    - cpuacct.stat:
           user 201
           system 21
    - cpuacct.usage_percpu --> 747258934 1008912121 407984020 181153162 
    - memory.max_usage_in_bytes --> 153321472
    
Resultados para el correo:

    - cpuacct.usage --> 0
    - cpuacct.stat:
          user 0
          system 0
    - cpuacct.usage_percpu --> 0 0 0 0
    - memory.max_usage_in_bytes --> 0

 - B) Calcular el coste real de uso de recursos de un ordenador teniendo en cuenta sus costes de amortización. Añadir los costes eléctricos correspondientes.
 
He localizado una página web que explica muy bien el consúmo eléctrico de un ordenador aproximado que tiene durante un sin desconectarlo de la corriente,

En primer lugar hay que [LeanTricity](http://www.leantricity.es/es/2012/07/11/cuanta-energia-gasta-un-ordenador-aproximaciones/)
Basandome en estos valores de la página paso a realizar el calculo de costes de amortización.

Coste eléctrico por año:

    365 días x (0,437 kWh + 0,1524 kWh) = 215 kWh (Aproximación)
    
    0,20 € * 215 kWh = 43€/año (Anual)

La vida media de un PC esta rondando los 5 años y suponiendo un precio de 1000€.

Amortización:

     Año 2014: 120€ + 43€ = 143€
     Año 2015: 200€ + 43€ = 243€
     Año 2016: 200€ + 43€ = 243€
     Año 2017: 200€ + 43€ = 243€
     Año 2018: 200€ + 43€ = 243€
     Año 2019: 57€ + 43€ =  100€
     
     Precio total: 1215€

  
* Ejercicio 8
 - A) Discutir diferentes escenarios de limitación de uso de recursos o de asignación de los mismos a una u otra CPU.
 
Las funciones de control de recursos de Oracle Solaris permiten que se comparta el ancho de banda entre las VNIC en la red virtual de un sistema. También puede utilizar funciones de control de recursos para asignar y gestionar el ancho de banda en una interfaz física sin VNIC ni máquinas virtuales. 
[Enlace a oracle](http://docs.oracle.com/cd/E26921_01/html/E25833/gewag.html)

 - B) Implementar usando el fichero de configuración de cgcreate una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa).

Para cambiar la prioridad a los procesos de usuario y a los del sistema debemos modificar el archivo:

    /etc/cgconfig.conf

Antes de empezar a modificar nada, tenemos que crear dos grupos, uno que sería para lo usuarios y otro para los procesos.
Para ello hacemos:

    sudo cgcreate -g memory,cpu,cpuacct:usuario
    sudo cgcreate -g memory,cpu,cpuacct:sistema

Una vez que hemos realizado el paso anterior ya si podemos modificar el archivo "/etc/cgconfig.conf", donde podremos modificar las prioridades.

    group usuario {
        cpu {
            ## 10% de CPU disponible para los procesos
            cpu.shares = 100;
        }
    }
    group sistema {
        cpu {
            # 90% de CPU disponible para los procesos
            cpu.shares = 900; 
        }
    }

En este caso lo que estamos haciendo es dándole menos prioridad a los procesos de usuario (20%) con respecto a los procesos del sistema (80%).

 - C) Usar un programa que muestre en tiempo real la carga del sistema tal como htop y comprobar los efectos de la migración en tiempo real de una tarea pesada de un procesador a otro (si se tiene dos núcleos en el sistema).

Instalamos htop, ya que no viene instalado por defecto:

    apt-get install htop

Enlace de referencia para usar [HTOP](http://bitelia.com/2010/03/comando-linux-htop-administra-interactivamente-los-procesos-del-sistema)

Una vez instalado "htop", lo ejecutamos con "htop", y nos mostraria lo [siguiente](https://www.dropbox.com/s/r0otmlznc22536b/Captura%20de%20pantalla%202014-10-18%20a%20la%28s%29%2016.50.48.png?dl=0).
Como se puede apreciar en la imagen, solo tiene una cpu por lo que no puedo probar al migración de una cpu a otro, aunque sinceramente no se como se haría migrarar de una cpu a otra.

 - D) Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios.

Para poder realizar esta modificación, tenemos que modificar los parámetros de blkio(block I/O) que esta dentro del grupo que anteriormente hemos metido el servidor web (nginx, apache,..)

    group web{
       blkio{
             blkio.weight = 150 
       } 
    }
   
// Asignación por defecto 500 [Informacion de blkio](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Resource_Management_Guide/ch-Subsystems_and_Tunable_Parameters.html)


#Clase del 6 de octubre de 2014

#Ejercicios

* [+]Ejercicio 9
 - A) Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?
-Con el comando "cat /proc/cpuinfo", vemos la CPU que tenemos: Intel(R) Core(TM) i5 CPU M 520 @ 2.40GHZ

-Después ejecutamos la ordem: "egrep '^flags.*(vmx|svm)' /proc/cpuinfo", pero no aparece nada ya que no esta activada esa opción.

* [+]Ejercicio 10
 - A) Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.
-Al introducir el comando "kvm-ok", me dice que no se puede usar el comando y que instale "apt-get install cpu-checker", una vez instalado ejecutamos el comando "kvm-ok" y me dice que no esta soportado.
[Imagen](https://www.dropbox.com/s/gra5sown1f7y5sf/Captura%20de%20pantalla%202014-10-16%20a%20la%28s%29%2010.52.43.png?dl=0)

* [+]Ejercicio 11
 - A) Comentar diferentes soluciones de Software as a Service de uso habitual
 [Comentario](https://github.com/JJ/GII-2014/issues/72#issuecomment-58912586). 

El concepto de SaaS existe desde hace tiempo, solo que en estos últimos años se ha hablado mucho más de ello y se a definido que és. Es todo aquel software como servicio(SaaS), son un modelo de distribibución software en el cual, tanto los datos y soportos lógicos que se usan se alojan en servidores remotos, a los que se pueden acceder através de internet haciendo uso de un cliente. 
Algunos ejemplos sencillos son: Webmail de Gmail, los CRM onlines. En este tipo de servicios nosotros accedemos normalmente a través del navegador sin atender al software. Todo el desarrollo, mantenimiento, actualizaciones, copias de seguridad es responsabilidad del proveedor.
Por lo que tenemos poco control, nosotros nos situamos en la parte más arriba de la capa del servicio. Si el servicio se cae es responsabilidad de proveedor hacer que vuelva a funcionar.
Ejemplos más conocidos de Saas son Google Docs, Salesforce, Dropbox, Gmail…
