#EJERCICIOS DEL SEMINARIO DE RUBY#

#Ejercicio 1#
##Instalar Ruby y usar ruby --version para comprobar la versión instalada. A la vez, conviene instalar también irb, rubygems y rdoc.##

Vamos a proceder a instalar *Ruby*. Para ello, ejecutaremos el siguiente comando:

<code>sudo apt-get install ruby</code>

<img src="https://github.com/javiergama8/Images/blob/master/Seminario1.png">

<img src="https://github.com/javiergama8/Images/blob/master/Seminario2.png">

Y ahora ejecutamos <code>ruby --version</code> para comprobar la versión instalada.

<img src="https://github.com/javiergama8/Images/blob/master/Seminario3.png">

Los paquetes *irb*, *rubygems* y *rdoc* ya están instalados.

#Ejercicio2#
##Crear un programa en Ruby que imprima los números desde el 1 hasta otro contenido en una variable.##

El programa en ruby es el siguiente:

<img src="https://github.com/javiergama8/Images/blob/master/Seminario4.png">

Y ahora lo ejecutaremos:

<code>ruby ejercicio2.rb</code>

<img src="https://github.com/javiergama8/Images/blob/master/Seminario5.png">

También se podría ejecutar dándole permisos con <code>chmod +x ejercicio2.rb</code> y seguidamente haciendo <code>./ejercicio2.rb</code>.

#Ejercicio 3#
##¿Se pueden crear estructuras de datos mixtas en Ruby? Crear un array de hashes de arrays e imprimirlo.##

Si se pueden crear estructuras de datos mixtas en *Ruby*.

El código sería el siguiente:

<img src="https://github.com/javiergama8/Images/blob/master/Seminario6.png">

Y su ejecución:

<img src="https://github.com/javiergama8/Images/blob/master/Seminario7.png">

#Ejercicio 4#
##Crear una serie de funciones instanciadas con un URL que devuelvan algún tipo de información sobre el mismo: fecha de última modificación, por ejemplo. Pista: esa información está en la cabecera HTTP que devuelve##

El script que he realizado es el siguiente, con el cuál obtenemos la fecha de la última modificación:

<img src="https://github.com/javiergama8/Images/blob/master/Seminario8.png">

Algunas ejecuciones se muestran a continuación:

<img src="https://github.com/javiergama8/Images/blob/master/Seminario9.png">

#Ejercicio 5#
##Ver si está disponible Vagrant como una gema de Ruby e instalarla.##

Vamos a ver si está disponible *Vagrant* como una gema de Ruby. Para mirar las gemas disponibles, vamos a ejecutar el siguiente comando:

<code>gem search --remote vagrant</code>

<img src="https://github.com/javiergama8/Images/blob/master/Seminario10.png">

Como podemos observar, nos proporciona un listado muy largo y vemos que *Vagrant* si está disponible como una gema de Ruby(vagrant (1.5.0)).

Ahora vamos a proceder a instalar *Vagrant*. Para ello, ejecutaremos el siguiente comando:

<code>sudo gem install vagrant</code>

<img src="https://github.com/javiergama8/Images/blob/master/Seminario11.png">

<img src="https://github.com/javiergama8/Images/blob/master/Seminario12.png">
