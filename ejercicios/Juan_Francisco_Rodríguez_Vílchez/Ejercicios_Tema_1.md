Ejercicios de Juan Francisco Rodríguez Vílchez
================================================

## Ejercicios Tema 1: Introducción a la infraestructura virtual: concepto y soporte físico ##

### Ejercicio 1 ###

**Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.**

Según la ley se establece que el porcentaje máximo de amortización es del 26% anual con un periodo máximo de 10 años.

Precio del servidor= 405,92€, incluido el IVA por lo que deberemos de quitarselo:

El IVA es de 21% que sería un precio de 85,32€ que deberiamos de restar al total, obteniendo un precio final de 320,6€.

[Servidor elegido](http://www.amazon.es/HP-ProLiant-MicroServer-G8-Servidor/dp/B00DJVRVFE/ref=sr_1_8?ie=UTF8&qid=1411980980&sr=8-8&keywords=servidor )

**Coste de amortización a cuatro años:**

Teniendo en cuenta que obtenemos un 25% (100%/4) del precio total del servidor cada año:

* Año 2014: 20,03€ de 3 meses que quedan de 2014 contando desde el día 1/10/2014
* Año 2015: 80,15€
* Año 2016: 80,15€
* Año 2017: 80,15€
* Año 2018: 60,11€ de los 9 meses restantes para completar el cuarto año.

**Coste de amortización a siete años:**

Teniendo en cuenta que obtenemos un 14,28% (100%/7) del precio total del servidor cada año:

* Año 2014: 11,44€ de 3 meses que quedan de 2014 contando desde el día 1/10/2014
* Año 2015: 45,78€
* Año 2016: 45,78€
* Año 2017: 45,78€
* Año 2018: 45,78€
* Año 2019: 45,78€
* Año 2020: 45,78€
* Año 2021: 34,33€ de los 9 meses restante para completar el séptimo año.

***

### Ejercicio 2 ###

**Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.**

Voy a proceder a comparar un servidor VPS con uno en nube, para ello he elegido [Hostinger VPS](http://www.hostinger.es/hosting-vps) y [Amazon EC2](http://aws.amazon.com/es/ec2/pricing/).

**Hostinger VPS Plan 2**

* 4.8 Ghz CPU
* 2 GB RAM
* 40GB de disco

Precio: 13.99€ al mes.

**Amazon EC2 t2.small**

* 1 vCPU
* 2 GB RAM
* Almacenamiento EBS

Precio:$0.026 por hora = 0.016€

**Usando sólo un 1% del tiempo:**

* Con Hostinger pagaríamos lo mismo, porque el servicio se cobra por mes contratado independientemente del tiempo utilizado: 13.99€ * 12= 167.88€
* Con Amazon pagaríamos (0.016€ * 24h *30 días * 12 meses) * 0.01 = 1.38€

**Usando el 10% del tiempo:**

* Con Hostinger pagaríamos lo mismo, porque el servicio se cobra por mes contratado independientemente del tiempo utilizado: 13.99€ * 12= 167.88€
* Con Amazon pagaríamos (0.016€ * 24h *30 días * 12 meses) * 0.10 = 13.8€

***

### Ejercicio 3.1 ###

**¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro**

Lo he comentado en el [foro](https://github.com/JJ/GII-2014/issues/72#issuecomment-58931811), pero también lo indico aqui:

1- Para alojar varios clientes en un sólo servidor, coincido con mis compañeros, y usaría la virtualización a nivel de sistema operativo, debido a que permite que solamente el anfitrión y el cliente usen el mismo sistema operativo pero con invitados aislados del anfitrión y entre sí. De esta forma, se puede mejorar el rendimiento porque hay un solo sistema operativo encargándose de los avisos de hardware, aunque también presenta alguna desventaja como por ejemplo,que cada invitado debe utilizar el mismo sistema operativo que utiliza el host.

2- La virtualización que usaría para crear un sistema eficiente de web+middleware+base de datos sería la virtualización plena ya que nos permitiría virtualizar todos los aspectos de un ordenador para poder ejecutar sistemas operativos y otros programas sin modificar.

3- Por último,la virtualización más adecuada para un sistema de prueba de software e integración continua, obviamente, es la virtualización de entornos de desarrollo ya que nos permite reproducir de la forma más fiable posible entornos de producción.

***

### Ejercicio 3.2 ###

**Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.**

Tutorial seguido: http://blog.desdelinux.net/como-crear-aplicaciones-portables-de-linux/

En mi máquina virtual con Linux Mint instalado, me he bajado el CDE del repositorio de Github correspondiente y lo he instalado en el sistema. Posteriormente, he empaquetado un reloj que te trae de prueba llamado "xclock" con la siguiente orden:

![captura1](http://i.imgur.com/3awd0EF.png)

Reloj ejecutado:

![captura2](http://i.imgur.com/SsYHtFy.png)

Una vez empaquetado con CDE, me he cambiado a otra máquina virtual con Ubuntu 13 y he desempaquetado el reloj:

![captura3](http://i.imgur.com/wovTtPZ.png)

Podemos observar como se puede ejecutar correctamente sin la necesidad del propio paquete.

También he empaquetado con CDE un script de Python que nos dice si el número introducido es par o impar y lo he probado en ubuntu 13, para ello he comprimido el cde-package y lo he pasado a otras distribuciones para comprobar que se puede ejecutar correctamente el script sin necesidad de ningún paquete o dependencia:

![captura4](http://i.imgur.com/2BjlczI.png)

Y en linux Mint:

![captura5](http://i.imgur.com/q4qPpTp.png)

***

### Ejercicio 4 ###

**Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona. Avanzado: Instalarlo y crear una aplicación contenedorizada.**

He procedido a descargar docker siguiendo el siguiente tutorial: http://codehero.co/como-instalar-y-usar-docker/ y me daba el siguiente fallo:

"Cannot connect to the Docker daemon. Is 'docker -d' running on this host?"

Para arreglarlo he usado:

```sh
 sudo apt-get install apparmor
```

Después de instalarlo, he procedido a descargar la misma imagen del tutorial con:

```sh
  sudo docker pull learn/tutorial
```

Una vez descargada, he ejecutado la terminal de la imagen:

![captura9](http://i.imgur.com/JwrIemI.png)

En dicha terminal he instalado Python y nano para escribir un script en Python que nos permite saber si un número es par o impar. Lo he guardado en usr/bin para ejecutarlo posteriormente.

Para guardar los cambios en una imagen nueva donde el ID de la imagen lo consultamos con "docker ps -l" y añadimos los 3 primeros dígitos de dicho ID:

```sh
  sudo docker commit [ID de la imagen] par
```

Podemos ver las imágenes creadas con:

```sh
  sudo docker images
```
y finalmente ejecutar el script con:

```sh
  sudo docker run -i -t par par
```

***

### Ejercicio 5 ###

**Instala el sistema de gestión de fuentes git**

![captura4](http://i.imgur.com/M6Io3nv.png)

***

### Ejercicio 6 ###

**Crear un proyecto y descargárselo con git: Al crearlo se marca la opción de incluir el fichero README y modificar el readme y subir el fichero modificado.**

He creado un proyecto en GitHub con el fichero README incluido llamado "probando".

Me lo he bajado con el siguiente comando y he modificado el README:

![captura5](http://i.imgur.com/tQVs1Qq.png)

Para subir el fichero modificado he ejecutado los siguiente comandos: (git add, git commit -m, git push)

![captura6](http://i.imgur.com/oKZYwzJ.png)

Finalmente, como podemos observar [aqui](https://github.com/juanfranrv/probando), el fichero readme se ha modificado correctamente:

![captura6](http://i.imgur.com/3XYPqy0.png)

***

### Ejercicio 7 ###

**Comprobar si en la instalación hecha se ha instalado cgroups y en qué punto está montado, así como qué contiene.**

En la ruta /sys/fs/ como podemos ver se encuentra montada la carpeta cgroup:

![captura7](http://i.imgur.com/Qy0iGGY.png)

Dentro de ella se puede observar su contenido con un "ls":

![captura8](http://i.imgur.com/asgCwJ1.png)

***

### Ejercicio 8.1 ###

**Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador, en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recursos de unos y otros durante un tiempo determinado.**

Tras seguir el guión de la sesión 1 al pie de la letra y probando numerosos casos, no conseguía que al crear una carpeta en "cgroup" ( y al montarla) se crearan todos los ficheros necesarios dentro de ella, tal y como se muestra en la captura del guión. Sin embargo, informándome por diversos foros como Stackoverflow encontré la solución, consistió en la creación de la carpeta en el interior del fichero "cpu" dentro de cgroups, de esta forma, se crearon todos los ficheros necesarios para poder ver el uso de cpu de los procesos y poder hacer este ejercicio correctamente.

Para crear los diferentes grupos de control, he creado tres carpetas diferentes dentro de /cgroup/cpu:

* Como navegador he usado Mozilla Firefox: He creado una carpeta llamada firefox,dentro de ella, he realizado los siguientes pasos:

![captura30](http://i.imgur.com/5Rvhzm8.png)

Búsqueda del PID del proceso,añadir el PID al fichero tasks, y ver el uso de CPU.

* Como procesador de textos he usado Retext: He creado una carpeta llamada Retext, dentro de ella, he realizado los mismos pasos que antes:

![captura31](http://i.imgur.com/cqm2NrE.png)

* Como otro proceso he usado Brasero: He creado una carpeta llamada brasero, dentro de ella, he realizado los mismos pasos que antes:

![captura32](http://i.imgur.com/xRb1M09.png)

El que más consume es Mozilla firefox, seguido de la aplicación "Brasero" y por último, el editor de textos Retext.

***

### Ejercicio 8.2 ###
    
**Calcular el coste real de uso de recursos de un ordenador teniendo en cuenta sus costes de amortización. Añadir los costes eléctricos correspondientes.**

Según este [artículo](http://www.leantricity.es/es/2012/07/11/cuanta-energia-gasta-un-ordenador-aproximaciones/), el consumo energético total anual sin descontar días festivos de un ordenador sería:

365 días x (0,437 kWh + 0,1524 kWh) = 215 kWh anuales por ordenador.

Si multiplicamos por el coste actual de la energía en España: 0,15 € * 215 kWh = 32€ anuales en consumo eléctrico de un ordenador.

Suponiendo que nuestro ordenador ha costado 1000 euros y que la vida media de un ordenador suele estar rondando los 5 años, los costes de amortización serían los siguientes:

Si comenzamos contando los años desde principios del año 2015: 5 años * 200€ = 1000€

Por otro lado, los costes eléctricos serían 32€ anuales * 5 años = 160€

Coste total = 1160€

***

### Ejercicio 9.1 ###

**Discutir diferentes escenarios de limitación de uso de recursos o de asignación de los mismos a una u otra CPU.**

Podemos limitar el uso de recursos por ejemplo, en entornos de producción en los que estuvieramos probando como se comporta un programa para un usuario y nos interesaría saber cuanto consume de nuestro sistema, para ello podríamos limitar la velocidad de CPU al navegador por ejemplo, ya que no nos interesaría que afectara al desarrollo de nuestra aplicación.

También podríamos limitar los recursos en función del tipo de usuario, es decir, si un usuario está pagando mas que otro por el mismo servicio, es lógico pensar que el que paga mas debería tener mas recursos para su uso.

Por otro lado, el administrador debería de tener más recursos que un usuario que pueda usar sus programas, por lo que sería interesante una mayor asignación para el administrador que para el usuario.


***

### Ejercicio 9.2 ###

**Implementar usando el fichero de configuración de cgcreate una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa).**

El fichero de configuración de cgcreate es "/etc/cgconfig.conf", pero para poder realizar esta configuración tenemos que tener instalado el paquete "libcgroup" si usamos una distribución basada en Red Hat o "libcgroup-dev" si usamos una basada en Debian.

Para poder asignar correctamente la prioridad del proceso según el grupo asignado,tenemos que utilizar el parámetro "cpu.shares", para ello debemos de indicar al principio del fichero de configuración dónde está montado el subsistema de cgroup, que en este caso será "cpu=/sys/fs/cgroup/cpu".

Posteriormente procedemos a definir cada uno de los grupos:

* Para procesos del usuario: "user_proc"
* Para procesos del sistema: "sys_proc"

Indicamos que "user_proc" tendrá una prioridad del 40% frente a "sys_proc" que tendrá una prioridad el 80%. Como el valor de "cpu.shares" es 1024, usaremos un valor de 207 para procesos de usuario y 817 para procesos del sistema:

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

***

### Ejercicio 9.3 ###

**Usar un programa que muestre en tiempo real la carga del sistema tal como htop y comprobar los efectos de la migración en tiempo real de una tarea pesada de un procesador a otro (si se tiene dos núcleos en el sistema).**

He instalado htop mediante la orden:

```sh
sudo apt-get install htop
```

Y he estado observando en tiempo real la carga del sistema:

![captura31](http://i.imgur.com/irutUio.png)

Sin embargo, no se como migrar en tiempo real una tarea pesada de un procesador a otro.


***

### Ejercicio 9.4 ###

**Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios.**

Dentro de "/etc/cgconfig.conf" usaremos el parámetro "blkio.weight", previamente debemos de indicar donde se encuentra el controlador de bloqueo E/S, que en este caso será "blkio=/sys/fs/cgroup/blkio".

Ahora procedemos a crear un grupo para los servidores que llamaremos "servers" y en su interior indicaremos la prioridad de E/S que le vamos a asignar, que en este caso sería mayor que la del resto de usuarios. El rango para este parámetro estaría entre 100-1000, por lo que he dicidido dar un "peso" de 800. El archivo de configuración, finalmente, quedaría de la siguiente forma:
```
mount {
   blkio = /sys/fs/cgroup/blkio;
}

group servers {
    blkio {
        blkio.weight = "800";
    }
}
```
Si el servidor que tenemos funcionando es un servidor Apache, deberemos añadir la directiva de configuración "CGROUP_DAEMON="blkio:/http" al fichero de configuración "/etc/apache2/apache2.conf" para que éste tenga conocimiento de que pertenece a un grupo de control.

***

### Ejercicio 10 ###

**Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?**

Modelo del procesador: Intel(R) Core(TM) i7-3612QM CPU @ 2.10GHz

He ejecutado la instrucción:

```sh
egrep '^flags.*(vmx|svm)' /proc/cpuinfo
```

/proc/cpuinfo es el fichero del sistema de ficheros virtual /proc que da acceso mediante “ficheros” a las estructuras de datos del núcleo de Linux; cpuinfo lista las características de la CPU y vmx es el flag que se usa para indicar que el procesador usa esta tecnología. egrep busca líneas de un fichero que contengan la expresión regular indicada, y si aparecen los flags listará la línea completa. 

Según la siguiente captura:

![captura13](http://i.imgur.com/lRgjts6.png)

La expresión no devuelve nada, por lo que el procesador no tiene esa funcionalidad o está desactivada.

***

### Ejercicio 11 ###

**Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.**

Para poder usar la orden kvm-ok he tenido que instalar lo siguiente:

![captura14](http://i.imgur.com/4TLeaBc.png)

Posteriormente he ejecutado la orden y me ha dado como resultado:

![captura15](http://i.imgur.com/ndRs9CC.png)

Me indica que use otra orden para más información:

![captura16](http://i.imgur.com/4meXfEI.png)

Por lo que se puede observar que mi ordenador no contiene este módulo del kernel.

***

### Ejercicio 12 ###

**Comentar diferentes soluciones de Software as a Service de uso habitual.**

Lo he comentado en el [foro](https://github.com/JJ/GII-2014/issues/71#issuecomment-58328756), pero también lo indico aqui:

Todas las aplicaciones que se ejecutan en servidores remotos y son accedidas generalmente a través de un navegador web, son SaaS.

Los ejemplos más comunes son algunos ERP (Sistemas de planificación de recursos empresariales) y CRM (Software para la administración basada en la relación con los clientes), aunque otros ejemplos de uso serían los siguientes:

* Aplicaciones web: CMS o gestores de contenidos, WebOS (Webdesktops o escritorios basados en web),  correo, mensajería instantánea, plataforma educativa, comercio electrónico, sistemas de pago, herramientas colaborativas…

* Aplicaciones mixtas (ej: Adobe AIR)

* Almacenamiento Remoto y backup

* Control Remoto para soporte y formación

* Alquiler de la plataforma para servicios/aplicaciones de terceros o soluciones tradicionales de hosting (y servicios relacionados como registro de dominios).

Son soluciones SaaS, debido a que ofrecen aplicaciones o soluciones software que están almacenada en servidores de empresas, lo cuál, hace que no tengamos que preocuparnos por el mantenimiento o la realización de copias de seguridad entre otras cosas. Sin embargo, el principal inconveniente de las soluciones SaaS es el problema de la privacidad de datos, ya que estas empresas tienen acceso a numerosos datos personales del cliente, de tal forma que si alguien consigue acceder a esa información, nos podría poner en peligro.




