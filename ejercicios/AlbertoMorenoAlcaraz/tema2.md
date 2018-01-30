
Tema 2
======

Ejercicio 1
-----------

**Instalar un entorno virtual para tu lenguaje de programación favorito (uno de los mencionados arriba, obviamente).**

Se ha elegido el lenguaje Python, por lo que se va a proceder a instalar virtualenv.
Para ello, antes tenemos que tener instalado el paquete pip. por lo que lo instalamos usando:
```bash
sudo apt-get install python-pip
```

Tras esto, podemos pasar a instalar virtualenv, con el siguiente comando:
```bash
sudo pip install virtualenv
```
![t2ej1.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t2ej1.png)


Despues de la instalacion, pasamos a crear un entorno virtual:
```bash
virtualenv prueba
```

Ejercicio 2
-----------

**Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu u OpenShift.**

Para darnos de alta en Openshift, vamos a su pagina y rellenamos el formulario con los datos.
![t2ej2.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t2ej2.png)


Ejercicio 3
-----------

**Crear una aplicación en OpenShift y dentro de ella instalar WordPress.**

Para crear una aplicacion, le damos a crear una aplicacion nueva.
![t2ej3.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t2ej3.png)

Esto nos llevara a un formulario en el que tendremos que rellenar datos de la aplicación como su url.
![t2ej3b.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t2ej3b.png)

Una vez instalado, accedemos a la url que le hemos asignado a la aplicación, y automaticamente nos llevara a la configuracion de wordpress.

Rellenamos los datos necesarios para la instalación, y una vez instalado, nos pedira nuestro usuario y contraseña.
Despues, nos aparecerá una pantalla de bienvenida.
![t2ej3c.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t2ej3c.png)


Ejercicio 4
-----------

**Crear un script para un documento Google y cambiarle el nombre con el que aparece en el menú, así como la función a la que llama.**

Seguimos el [tutorial](https://developers.google.com/apps-script/overview#your_first_script) que Google nos da para App Script y realizamos el primer script de prueba que nos ofrece.

Nos vamos a [script.google.com](script.google.com) y copiamos el codigo que hemos elegido de prueba.
![t2ej4.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t2ej4.png)
 
Una vez guardado el proyecto, lo ejecutamos, lo cual nos va a pedir permisos, que debemos aceptar.
![t2ej4b.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t2ej4b.png)

Al ejecutarlo, nos llega un correo, con el link al documento que se ha creado mediante la aplicacion.

Para cambiar el nombre del archivo, entramos en las opciones, dandole a la flechita que hay al lado del nombre del documento, y elegimos el nombre para modificarlo.
Para cambiar el nombre de la funcion, lo hacemos en el codigo y finalmente guardamos.
![t2ej4c.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t2ej4c.png)


Ejercicio 5
-----------

**Buscar un sistema de automatización de la construcción para el lenguaje de programación y entorno de desarrollo que usemos habitualmente.**

Para automatizar la construccion en aplicaciones, se ha usado durante las asignaturas del grado, make para el lenguaje c++.
Por otra parte, tambien se puede usar scons.


Ejercicio 6
-----------

**Identificar, dentro del PaaS elegido o cualquier otro en el que se dé uno de alta, cuál es el fichero de automatización de construcción e indicar qué herramienta usa para la construcción y el proceso que sigue en la misma.**

Si usamos, por ejemplo heroku con node, el fichero que determina el nombre del proyecto, version, repositorio, los scripts de construcion, etc, es el package.json

En este caso, como para el proyecto [virtualvulcano](https://github.com/ernestoalejo/virtual-vulcano) de la asignatura lo estamos usando, se va a usar el mismo package.json.

Primero, hay que instalar heroku:
```bash
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
```
Y acceder con nuestro usuario:
```bash
heroku login
```

Despues, accedemos al directorio donde se encuentra la aplicacion y ejecutamos:
```bash
git init
```
Una vez hecho esto, añadimos un remote de heroku:
```bash
heroku git:remote -a ivtest
```

Ahora, añadimos el package.json que hemos dicho anteriormente, a nuestro repositorio en git, y hacemos push a la rama master del proyecto heroku: 
```bash
git push heroku master
```
