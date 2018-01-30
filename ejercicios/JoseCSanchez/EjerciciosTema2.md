# Jose Carlos Sánchez Hurtado

# Ejercicios tema 2

## Ejercicio 1

#### Instalar un entorno virtual para tu lenguaje de programación favorito (uno de los mencionados arriba, obviamente).

Voy a instalar nodeenv para node.js, aprovechando que nuestro proyecto de prácticas está implementado en ese lenguaje. En mi caso lo instalaré en Ubuntu 14.04.

Lo primero que hay que hacer es instalar el paquete python-setuptools.

```sh
sudo apt-get install python-setuptools
```

A continuación, ejecutamos el siguiente comando:

```sh
sudo easy_install nodeenv
```

Para poder crear un entorno nuevo y activarlo, primero habrá que intalar el paquete python-virtualenv.

```sh
sudo apt-get install python-virtualenv
```

Una vez instalado, paso a activarlo de la siquiente manera:

```sh
virtualenv env

. env/bin/activate
```

Para mostrar el uso del nodeenv, muestro la versión que se me ha instalado, con los comandos:
```sh
(env) $ pip install nodeenv

(env) $ nodeenv --version
```
![](http://fotos.subefotos.com/abcd9f43f477d4a528e938a3763af159o.png)


## Ejercicio 2

#### Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu u OpenShift.

He elegio darme de alta en el servicio PaaS de Heroku, puesto que lo he usado en la práctica 2.

![](http://fotos.subefotos.com/3924268e4dd225d305a23d17e641ea94o.png)


## Ejercicio 3

#### Crear una aplicación en OpenShift y dentro de ella instalar WordPress. 

Para crear una aplicación con un WordPress en OpenShift, lo primero que hay que hacer es registrarse en dicha plataforma. 

![](http://fotos.subefotos.com/e00a5a7bf956f8db6de474d678ffbe87o.png)

Una vez dado de alta, seleccionamos en *Create your first application now*. Seleccionamos que queremos crear un WordPress, e indicamos para finalizar el dominio de nuestra aplicación. Despues de un tiempo, se creará nuestro WordPress, al cual se puede acceder desde [aquí](http://ejercicio5tema2-joseiv.rhcloud.com/wp-admin/install.php?step=1)

![](http://fotos.subefotos.com/7a59651f10b3870a44d509e38727ae63o.png) 


## Ejercicio 5

#### Buscar un sistema de automatización de la construcción para el lenguaje de programación y entorno de desarrollo que usemos habitualmente.

He elegido el sistema de automatización de la construcción [Pants](http://pantsbuild.github.io/index.html), el cual sirve para los lenguajes Java, Python o Scala. 

[Aquí](http://en.wikipedia.org/wiki/List_of_build_automation_software) se puede consultar la lista de sistemas de automatización disponible.

## Ejercicio 6

#### Identificar, dentro del PaaS elegido o cualquier otro en el que se dé uno de alta, cuál es el fichero de automatización de construcción e indicar qué herramienta usa para la construcción y el proceso que sigue en la misma. 

El paquete package.json determina la versión de node.js a utilizar y todas las dependencias que deben instalarse con la aplicación. Heroku se encarga de leer ese fichero e instalar la versión apropiada de node junto a las dependencias. Algunas otras funciones específicas se pueden establecer mediante variables de entorno en un fichero .env.


## Ejercicio 7

#### Buscar un entorno de pruebas para el lenguaje de programación y entorno de desarrollo que usemos habitualmente.

He buscado información sobre el entorno de pruebas <b>Mocha</b>. Para más información sobre Mocha [se puede consultar este enlace](https://github.com/mochajs/mocha).  Podemos disponer de un tutorial rápido, el cual lo compara con Vows e indica los pasos inciales para su uso, como la instalación [que se puede ver aquí](https://brianstoner.com/blog/testing-in-nodejs-with-mocha/), donde además se ven los beneficios de usar Mocha, como son cuestiones como sintaxis y mejor capacidad de pruebas asíncronas en cliente+servidor.