
Una introducción ligera al lenguaje Ruby
====================================================================

Ejercicio 1
-----------

**Instalar Ruby y usar**

**ruby --version**
**para comprobar la versión instalada. A la vez, conviene instalar también irb, rubygems y rdoc.**

![1_1.png](https://dl.dropboxusercontent.com/u/22433100/Iv/ruby/1_1.png)


Ejercicio 2
-----------

**Crear un programa en Ruby que imprima los números desde el 1 hasta otro contenido en una variable.**

```ruby
#!/usr/bin/ruby

final=10
for i in 1..final
  puts "#{i}"
end
```


Ejercicio 3
-----------

**¿Se pueden crear estructuras de datos mixtas en Ruby? Crear un array de hashes de arrays e imprimirlo.**
Si se pueden crear estructuras de datos mixtas.
```ruby
#!/usr/bin/ruby

estructura = {
    :prueba0=>{
        :valor1 => "Esto es ",
        :numero => 1,
        :valor2 => " prueba ",
        :condicion => true
    },
    :prueba1=>{
        :valor1 => "Esto no es ",
        :numero => 1,
        :valor2 => " prueba ",
        :condicion => false
    }
}

estructura.keys().each() do |valor|
  puts estructura[valor]
end
```
![3_1.png](https://dl.dropboxusercontent.com/u/22433100/Iv/ruby/3_1.png)


Ejercicio 4
-----------

**Crear una serie de funciones instanciadas con un URL que devuelvan algún tipo de información sobre el mismo: fecha de última modificación, por ejemplo. Pista: esa información está en la cabecera HTTP que devuelve**

```ruby
#!/usr/bin/ruby

require 'net/http'

def hostname(direccion)
  return Net::HTTP.get_response(direccion,'/')['server'].to_s
end

def fecha(direccion)
  return Net::HTTP.get_response(direccion,'/')['date'].to_s
end

def contenido(direccion)
  return Net::HTTP.get_response(direccion,'/')['content-type'].to_s
end

url = ARGV[0]

puts "Host: " + hostname(url)
puts "Fecha: " + fecha(url)
puts "Contenido: " + contenido(url)
```
![4_1.png](https://dl.dropboxusercontent.com/u/22433100/Iv/ruby/4_1.png)


Ejercicio 5
-----------

**Ver si está disponible Vagrant como una gema de Ruby e instalarla.**

```bash
# Busco con si existe vagrant.
gem search --remote vagrant

# Para instalar vagrant.
gem install vagrant
```
