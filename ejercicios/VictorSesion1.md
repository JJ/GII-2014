<h1> Victor Coronas Lara </h1>

#Clase del 29 de septiembre de 2014

#Objetivos de la clase

* [+] Comenzar a entender los conceptos fundamentales relacionados con la virtualización.
* Comprender las técnicas de cálculo del coste de amortización de un equipo informático y aplicarlo al cálculo del coste de uso de un recurso.

#Otros objetivos

* []Tener a punto una instalación Linux para llevar a cabo las actividades de la asignatura
* []Usar los métodos de entrega de ejercicios propuestos para la asignatura usando GitHub.
* []Manejar de forma básica la línea de órdenes de Linux.
* []Aprender a instalar software libre en Linux.

#Ejercicios

* Ejercicio 1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.

* Ejercicio 2: Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

* Ejercicio 3: 
 1. ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro

 2. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

* Ejercicio 4:
 1. Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona.

 2. Avanzado Instalarlo y crear una aplicación contenedorizada

#Clase del 30 de septiembre de 2014

#Objetivos de esta sesión

* [] Aplicar técnicas básicas de aislamiento de recursos en el sistema operativo Linux
* [] Consolidar el uso de técnicas de aislamiento y control de tareas en Linux que se usarán más adelante en la creación de contenedores.
* [] Entender el soporte en hardware de las técnicas de virtualización y cómo se extiende ese soporte al núcleo de los sistemas operativos. Saber si el ordenador habitual lo usa.
* [] Comenzar a usar git desde línea de órdenes y comprender su papel como sistema para trabajo colaborativo y despliegue de aplicaciones.

#Otros objetivos

* [] Entender el concepto de sistema de ficheros virtual usado en Linux para diferentes menesteres.
* [] Tener a punto una instalación Linux para llevar a cabo las actividades de la asignatura
* [] Usar git para hacer check-in en clase y expresar al final de la misma los objetivos alcanzados.

#Ejercicios

* Ejercicio 5
 Instala el sistema de gestión de fuentes git

* Ejercicio 6
 1. Crear un proyecto y descargárselo con git. Al crearlo se marca la opción de incluir el fichero README.
 
 2.Modificar el readme y subir el fichero modificado.

* Ejercicio 7
 1. Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador, en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recursos de unos y otros durante un tiempo determinado.

 2. Calcular el coste real de uso de recursos de un ordenador teniendo en cuenta sus costes de amortización. Añadir los costes eléctricos correspondientes.
 
* Ejercicio 8
 1. Discutir diferentes escenarios de limitación de uso de recursos o de asignación de los mismos a una u otra CPU.
 2. Implementar usando el fichero de configuración de cgcreate una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa).
 3. Usar un programa que muestre en tiempo real la carga del sistema tal como htopy comprobar los efectos de la migración en tiempo real de una tarea pesada de un procesador a otro (si se tiene dos núcleos en el sistema).
 4.Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios.
