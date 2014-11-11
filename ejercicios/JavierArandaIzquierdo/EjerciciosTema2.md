#Tema 2
###Ejercicio 1
#####Instalar un entorno virtual para tu lenguaje de programación favorito (uno de los mencionados arriba, obviamente).
En mi caso, he istalado el entorno virtual de Python llamado [virtualenv](http://virtualenv.readthedocs.org/en/latest/). 

Para porder instalarlo, he tenido que instalar previamente [pip vers.1.3.1](http://stackoverflow.com/questions/4324558/whats-the)

Para instalarlo he utilizado los siguientes comandos:
	
    sudo pip intall virtualenv
    
###Ejercicio 2
#####Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu u OpenShift.
Para este ejercicio me he dado de alta en la plaataforma [OpenShift](https://www.openshift.com/). Primero creamos un nuevo perfil:
![altaOpenShift](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/altaOpenShift.png)
Confirmamos el email y ya estamos registrados:
![welcomeOpenshift](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/welcomeOpenshift.png)

###Ejercicio 3
#####Crear una aplicación en OpenShift y dentro de ella instalar WordPress.
OpenShift nos deja crear Apps basicas gratuitas. Estos son los pasos de como he creado la mia: 

-Buscamos la App que viene por defecto de Wordpress:
![wordpress](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/wordpress.png)
Y pulsamos en install y ya tenemos una App simple funcionando.

Esta es mi [App](http://appjavi-ejer3.rhcloud.com)

###Ejercicio 4
#####Crear un script para un documento Google y cambiarle el nombre con el que aparece en el menú, así como la función a la que llama.

Para trabajar con Apps script nos iremos a [esta](http://www.google.com/script/start/) pagina y pulsamos en Start Scripting. Para empezar, elegimos un proyecto en blanco.

Este es el script para agregar un menu y dos items:

```
function onOpen() {
  var ui = DocumentApp.getUi();
  // Or DocumentApp or FormApp.
  ui.createMenu('Menu IV')
      .addItem('First item', 'menuItem1')
      .addSeparator()
      .addSubMenu(ui.createMenu('Sub-menu')
          .addItem('Second item', 'menuItem2'))
      .addToUi();
}

function menuItem1() {
  DocumentApp.getUi() // Or DocumentApp or FormApp.
     .alert('Has pulsado el primer Item!');
}

function menuItem2() {
  DocumentApp.getUi() // Or DocumentApp or FormApp.
     .alert('has pulsado el segundo Item!');
}
```
Tras guardarlo, lo ejecutamos y nos pedira que lo autoricemos:

![autorizacion](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/autorizacion.png)

Despues de autorizarlo podemos ver como se crea el menu en cualquier documento que tengamos en Google drive.

###Ejercicio 5
#####Buscar un sistema de automatización de la construcción para el lenguaje de programación y entorno de desarrollo que usemos habitualmente.

Uno de los sistemas de automatizacion que uso (y que no sabia que estaba usando) es Ant para java.

Ant es una herramienta usada en programación para la realización de tareas mecánicas y repetitivas, normalmente durante la fase de compilación y construcción. Es un software para procesos de automatización de compilación, similar a Make pero desarrollado en lenguaje Java y requiere la plataforma Java.

Ant tiene la ventaja de no depender de las órdenes del shell de cada sistema operativo, sino que se basa en archivos de configuración XML y clases Java para la realización de las distintas tareas, siendo idónea como solución multi- plataforma.

La diferencia más notable entre Ant y Make es que Ant utiliza XML para describir el proceso de generación y sus dependencias, mientras que Make utiliza formato makefile. Por defecto, el archivo XML se denomina build.xml.

###Ejercicio 6
#####Identificar, dentro del PaaS elegido o cualquier otro en el que se dé uno de alta, cuál es el fichero de automatización de construcción e indicar qué herramienta usa para la construcción y el proceso que sigue en la misma.
La plataforma que hemos utilizado en el proyecto es OpenShift y he encontrado dos formas para automatizar las tareas:
- **Usando Jenkins**: Servidor con todas las funciones de integración continua (CI) que puede ejecutar, construir, testear y programar tareas que se integran con las aplicaciones de OpenShift.
- **Usando hot deployment**: Con hot deployment se aplican los cambios al código de la aplicación sin necesidad de reiniciar la aplicación, lo que aumenta la velocidad de despliegue y minimiza el tiempo de inactividad de la aplicación.
 

###Ejercicio 7
#####Buscar un entorno de pruebas para el lenguaje de programación y entorno de desarrollo que usemos habitualmente.
Dos entornos de pruebas para python son [Tox](https://pypi.python.org/pypi/tox) y [Nose](http://pythontesting.net/framework/nose/nose-introduction/)