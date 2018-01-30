# Ejercicios de Óscar Sánchez Martínez #

**Ejercicio 1.
Instalar un entorno virtual para tu lenguaje de programación favorito (uno de los mencionados arriba, obviamente).**

He instalado virtualenv, un entorno virtual para el lenguaje python.
La instalación es bastante simple, solamente ejecutando: 

pip install virtualenv

Previamente tienes que instalar pip con el comando:

sudo apt-get install python-pip

[Instalación](http://i.imgur.com/SjCaaDU.png)

**Ejercicio 2.
Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu u OpenShift.**

Yo he elegido Openshift como servicio Pass y para darse de alta solo hay que seguir unos pasos básicos:

[Imagen](http://i.imgur.com/mbpeRfd.jpg)

elegimos la opción que queremos cojer, en nuestro caso la gratuita y rellenamos el formulario que nos piden(usuario,contraseña...).

Al final, ya estamos dados de alta.

[Imagen](http://i.imgur.com/dLk4pLk.jpg)

**Ejercicio 3.
Crear una aplicación en OpenShift y dentro de ella instalar WordPress.**

Es bastante sencillo, si accedemos a nuestra cuenta, en este caso, de Openshift, en el menú principal seleccionamos la opción crear nueva aplicación.

En esta página nos muestran diversas opciones para crear nuestra aplicación, en nuestro caso, queremos instalar wordpress y Openshift nos ofrece una instalación rápida de dicha aplicacion.

[Imagen](http://i.imgur.com/PdniqYV.jpg)

La seleccionamos y rellenamos el formulario correctamente.

[Imagen](http://i.imgur.com/NZZQgKr.png)

Al final comprobamos que la aplicación funciona perfectamente.

[Imagen](http://i.imgur.com/cpo6MNV.jpg)

**Ejercicio 4.
Crear un script para un documento Google y cambiarle el nombre con el que aparece en el menú, así como la función a la que llama.**

Siguiendo los pasos mencionados el la documentación del temario, accedemos a un fichero de google docs, herramientas -> editor de secuencia de comandos. Allí implementamos un menú (para este ejemplo uso una alerta básica) y lo guardamos.

[Imagen](http://i.imgur.com/V8ZH6J7.jpg)

Cuando volvemos al fichero , vemos que el nuevo menú aparece encima de la barra de herramientas.

[Imagen](http://i.imgur.com/oFfqomO.jpg)

Y comprobamos que todo funciona correctamente.

[Imagen](http://i.imgur.com/RpOWrZl.jpg)

**Ejercicio 5.
Buscar un sistema de automatización de la construcción para el lenguaje de programación y entorno de desarrollo que usemos habitualmente.**

**Ejercicio 6.
Identificar, dentro del PaaS elegido o cualquier otro en el que se dé uno de alta, cuál es el fichero de automatización de construcción e indicar qué herramienta usa para la construcción y el proceso que sigue en la misma.**

Primero he optado por utilizar jenkins, que es un servidor con la funcionalidad de integración continua para ejecutar test, builds,etc, en las aplicaciones de openshift, pero me ha surguido un problema que no he conseguido remediar.

[Imagen](http://i.imgur.com/Sqdrgif.jpg)

Liego he optado por instalar el rhc client de openshift en mi máquina. Para ello, he seguido el siguiente [tutorial](https://developers.openshift.com/en/getting-started-client-tools.html) para instalarlo.

Una vez instalado, ejecutamos:

rhc setup

para configurar el cliente. Aquí podemos ver los detalles de las aplicaciones que tenemos actualmente.

[Imagen](http://i.imgur.com/QXNFC9v.jpg)


**Ejercicio 7.
Buscar un entorno de pruebas para el lenguaje de programación y entorno de desarrollo que usemos habitualmente.**

Ya que en este cuatrimestre estamos utilizando bastante python, he buscado un entorno de pruebas para este lenguaje y he encontrado uno llamado selenium , que ofrece una api para lo antes mencionado.

Es fácil de instalar con la herramienta pip como muestra el siguiente [enlace](http://selenium-python.readthedocs.org/en/latest/installation.html)

-pip install selenium

El siguiente [enlace](http://selenium-python.readthedocs.org/en/latest/getting-started.html) nos muestra un ejemplo escrito en python de un test que muestra la funcionalidad de selenium.

