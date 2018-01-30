# Tema 5

## Ejercicio 1

#### Instalar Ruby y usar ruby --version para comprobar la versión instalada. A la vez, conviene instalar también irb, rubygems y rdoc.

Una vez que instalamos Ruby (ayudados de esta [documentación](https://www.ruby-lang.org/en/documentation/installation/)), comprobamos la versión instalada con ruby --version:

![Ejercicio 1_1](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Ruby/1_1.png)

Además hemos instalado rubygems ([instalación rubygems](https://rubygems.org/pages/download)).

## Ejercicio 2

#### Crear un programa en Ruby que imprima los números desde el 1 hasta otro contenido en una variable. 

Lo creamos de la siguiente forma:

~~~
#!/usr/local/bin/ruby
for i in 1..10
  puts "#{i}"
end
~~~

Y obtenemos el siguiente resultado:

![Ejercicio 2_1](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Ruby/2_1.png)

## Ejercicio 3

#### ¿Se pueden crear estructuras de datos mixtas en Ruby? Crear un array de hashes de arrays e imprimirlo.

Se pueden crear estructuras de datos mixtas tal que así:

~~~
#!/usr/local/bin/ruby

arrayCompuesto = {
  :uno =>{
    :primero => "string",
    :segundo => 2,
    :tercero => true
    },
  :dos =>{
    :primero => "string",
    :segundo => 2,
    :tercero => true
    }
  }

arrayCompuesto.keys().each() do |leng|
  puts arrayCompuesto[leng]
end
~~~

Podemos ver la ejecución:

![Ejercicio 3_1](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Ruby/3_1.png)

## Ejercicio 4

#### Crear una serie de funciones instanciadas con un URL que devuelvan algún tipo de información sobre el mismo: fecha de última modificación, por ejemplo. Pista: esa información está en la cabecera HTTP que devuelve.

~~~
#!/usr/local/bin/ruby

require 'net/http'

def infoServer(dir)
  return Net::HTTP.get_response(dir,'/')['server'].to_s
end

def infoContenido(dir)
  return Net::HTTP.get_response(dir,'/')['content-type'].to_s
end

url = ARGV[0]

puts "URL: " + url
puts "Server: "+ infoServer(url)
puts "Contenido: "+ infoContenido(url)
~~~

##Ejercicio 5

#### Ver si está disponible Vagrant como una gema de Ruby e instalarla.

Comprobamos con ``` gem search --remote vagrant ``` que la gema se encuentra disponble:

![Ejercicio 5_1](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Ruby/5_1.png)

Si bajamos un poco la encontramos:

![Ejercicio 5_2](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Ruby/5_2.png)

Ahora podemos instalarla mediante ``` gem install vagrant ```

![Ejercicio 5_3](https://github.com/FranciscoPorcel/GII-2014/blob/master/ejercicios/FranciscoPorcel/imagenes/Ruby/5_3.png)


