#Ejercicio 1#

###Instalar Ruby y usar

~~~
ruby --version
~~~

###para comprobar la versión instalada. A la vez, conviene instalar también irb, rubygems y rdoc.

Instalamos todo con el siguiente comando:

~~~
sudo apt-get install ruby irb rubygems rdoc
~~~

Y comprobamos la versión isntalada:


![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/SeminarioRuby/ejercicio1_1.png)



#Ejercicio 2#
###Crear un programa en Ruby que imprima los números desde el 1 hasta otro contenido en una variable.###

~~~
#!/usr/bin/ruby
variable = 10
for i in 1..variable
   puts i
end
~~~

#Ejercicio 3#
###¿Se pueden crear estructuras de datos mixtas en Ruby? Crear un array de hashes de arrays e imprimirlo.###


~~~
#!/usr/bin/ruby
sonido_de = { :vaca => 'muuu',
  :buho => 'uuu',
  :caballo => 'iiiii' }

precio_de = { "pipas" => 'bajo',
  "coche" => 'depende',
  "plan E" => 'exagerado' }

array_de_hashes = [sonido_de, precio_de]
puts array_de_hashes
~~~

#Ejercicio 4#
###Crear una serie de funciones instanciadas con un URL que devuelvan algún tipo de información sobre el mismo: fecha de última modificación, por ejemplo. Pista: esa información está en la cabecera HTTP que devuelve###

~~~
#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require 'net/http'

def fecha_mod(url)
    respuesta = Net::HTTP.get_response(url,'/')
	return respuesta['date'].to_s
end

url = ARGV[0]
 
puts "Ultima modificación: "+ fecha_mod(url)
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/SeminarioRuby/ejercicio4.png)

#Ejercicio 5#
###Ver si está disponible Vagrant como una gema de Ruby e instalarla.###

Para ver si esta disponible ejecutamos el siguiente comando:

~~~
gem search --remote vagrant 
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/SeminarioRuby/ejercicio5_1.png)

Y para instalarla ejecutamos:

~~~
sudo gem install vagrant
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/SeminarioRuby/ejercicio5_2.png)
