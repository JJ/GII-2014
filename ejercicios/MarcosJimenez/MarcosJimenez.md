<h1> Marcos Jiménez Fernández </h1>

<h2> Sesión 1 </h2>

<strong> EJERCICIO 1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema. </strong>

Tomamos de ejemplo el siguiente ordenador: <a href="http://www.pccomponentes.com/hp_proliant_ml310e_g8_xe_e3_1220_8gb_2tb.html"> HP ProLiant ML310e G8 XE E3-1220/8GB/2TB </a>

Este ordenador tiene un precio de 645€ con un IVA del 21% (135,45€) y tenemos que calcular su valor de amortización a 4 y 7 años con una amortización del 26%. Los resultados serían:

<p>2014: 477,3€</p> 
<p>2015: 353,2€</p>
<p>2016: 261,4€</p>
<p>2017: 193,4€</p>
<p>2018: 143,1€</p>
<p>2019: 105,9€</p>
<p>2020: 78,4€</p>

<strong> EJERCICIO 2: Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo. </strong>

En primer lugar, seleccionamos las características que va a tener nuestro <a href="http://www.arsys.es/servidores/cloud">servidor cloud</a>:
- 4 núcleos.
- 8GB de memoria RAM.
- 250GB de disco duro.
- Transferencia ilimitada de datos.
- Windows Server 2008 R2 SP1 Enterprise.
- Precio: 210€/mes.

Ahora seleccionamos las características de nuestro <a href="https://www.ovh.es/servidores_dedicados/almacenamiento/2014-FS-30T.xml">servidor dedicado</a>:
- Procesador Intel Atom C2750.
- Velocidad del procesador: 2,4GHz.
- 32GB de memoria RAM.
- 5 discos de 6TB cada uno.
- Precio: 161€/mes.

Ahora calculamos el precio total anual de cada una de las dos opciones:

<strong> Servidor cloud: </strong> 210 * 12 = 2.520€/año.<br>
<strong> Servidor dedicado: </strong> 161 * 12 = 1.932€/año.

Y ahora calculamos el coste de ambas infraestructuras en base a una utilización del 1 y 10%:

<strong> Servidor cloud: </strong> 210 * 12 * 0.01 = 25,2€
210 * 12 * 0,1 = 252€<br>
<strong> Servidor dedicdo: </strong> 161 * 12 * 0,01 = 19,32€
161 * 12 * 0,1 = 193,2€

<strong> EJERCICIO 3: ¿Qué tipo de virtualización usarías en cada caso? Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones. </strong>

<strong> EJERCICIO 4: Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona. Avanzado: Instalarlo y crear una aplicación contenedorizada </strong>

Tutorial de docker realizado:

<img src="http://i59.tinypic.com/27y30iu.png"></img>

Para instalar Docker en Ubuntu escribimos el siguiente comando:

sudo apt-get install docker.io

<strong> EJERCICIO 5: Instala el sistema de gestión de fuentes git.</strong>

Para instalar Git en Ubuntu escribimos:

sudo apt-get install git

<strong> EJERCICIO 6: Crear un proyecto y descargárselo con git. Al crearlo se marca la opción de incluir el fichero README. Modificar el readme y subir el fichero modificado.</strong>

Una vez que hayamos instalado git escribimos lo siguiente para clonar un proyecto:

git clone "URL del directorio a clonar"

Como queremos añadir el archivo README al proyecto hacemos lo siguiente:

git add README.md

Y para modificar el contenido de ese archivo hacemos lo siguiente:

git commit -m "Modificando el archivo README"

Para guardar los cambios hacemos lo siguiente:

git push origin master

<strong> EJERCICIO 7: Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador, en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recursos de unos y otros durante un tiempo determinado. Calcular el coste real de uso de recursos de un ordenador teniendo en cuenta sus costes de amortización. Añadir los costes eléctricos correspondientes.</strong>

Creamos el primer grupo de control para el navegador:

mkdir cgroup/chrome

<strong> EJERCICIO 8: Discutir diferentes escenarios de limitación de uso de recursos o de asignación de los mismos a una u otra CPU. Implementar usando el fichero de configuración de cgcreate una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa). Usar un programa que muestre en tiempo real la carga del sistema tal como htopy comprobar los efectos de la migración en tiempo real de una tarea pesada de un procesador a otro (si se tiene dos núcleos en el sistema). Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios. </strong>

<strong> EJERCICIO 9: Comprobar si el procesador o procesadores instalados lo tienen. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden? </strong>

Al ejecutar la orden <strong>egrep '^flags.*(vmx|svm)' /proc/cpuinfo</strong> nos aparece lo siguiente:<br>

<img src="http://i62.tinypic.com/29z7wd0.png"></img>

Si entramos en el fichero proc/cpuinfo podemos ver el modelo de procesador que tenemos:<br>

<img src="http://i59.tinypic.com/2qvvy54.png"></img>

<strong> EJERCICIO 10: Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok. </strong>

Para usar ese comando hay que instalar previamente un programa llamado CPU-Checker. Se instala de la siguiente forma:

sudo apt-get install cpu-checker

Hecho esto ya podemos ejecutar en nuestro terminal el comando kvm-ok. Vemos que nuestro módulo de kernel lo tiene instalado:

<img src="http://i60.tinypic.com/qyd251.png"></img>

<strong> EJERCICIO 11: Comentar diferentes soluciones de Software as a Service de uso habitual. </strong>

Podemos definir "Software as a Service" como un modelo de distribución de software donde el soporte lógico y los datos que maneja se alojan en servidores de una compañía de tecnologías de información y comunicación (TIC), a los que se accede via Internet desde un cliente (vía Wikipedia).

Como ejemplos de SaaS podríamos citar cualquier tipo de servicio de alojamiento de archivos e información como puede ser Dropbox o MEGA, donde alojamos nuestros datos en un servidor y accedemos vía Internet a toda esa información. 

<h2> Creando aplicaciones en la nube: Uso de PaaS </h2>

<strong> EJERCICIO 1: Instalar un entorno virtual para tu lenguaje de programación favorito (uno de los mencionados arriba, obviamente).</strong>

Debido a que voy a tener que programar en Ruby este cuatrimestre, voy a instalar rbenv para Ruby. Para instalarlo ejecutamos el siguiente comando:

sudo apt-get install rbenv

<strong> EJERCICIO 2: Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu u OpenShift. </strong>

Nos damos de alta en OpenShift:

<img src="http://i60.tinypic.com/2ltpt3s.png"></img>

<strong> EJERCICIO 3: Crear una aplicación en OpenShift y dentro de ella instalar WordPress.</strong>

A la aplicación de WordPress le vamos a dar el nombre de infraestructuravirtual:

<img src="http://i62.tinypic.com/o6d542.png"></img>

Y este sería el resultado final:

<img src="http://i60.tinypic.com/izqexi.png"></img>
