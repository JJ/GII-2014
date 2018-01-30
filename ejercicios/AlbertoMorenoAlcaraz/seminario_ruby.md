
Seminario de Ruby
=================

Ejercicio 1
-----------

**Instalar Ruby y usar ruby --version para comprobar la versión instalada. A la vez, conviene instalar también irb, rubygems y rdoc.**

![Sej1.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/Sej1.png)


Ejercicio 2
-----------

**Crear un programa en Ruby que imprima los números desde el 1 hasta otro contenido en una variable.**

```ruby
#!/usr/bin/ruby

fin=5

for i in 1..fin
  puts "#{i}"
end
```



Ejercicio 3
-----------

**¿Se pueden crear estructuras de datos mixtas en Ruby? Crear un array de hashes de arrays e imprimirlo.**

```ruby
#!/usr/bin/ruby

struct = {
  :test1 =>{
    :nombre => "test1",
    :pos => 1,
    :primero => true
  },
  :test2 =>{
    :nombre => "test2",
    :pos => 2,
    :primero => false
  }
}

struct.keys().each() do |contenido|
  puts struct[contenido]
end 
```
![Sej3.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/Sej3.png)


Ejercicio 4
-----------

**Crear una serie de funciones instanciadas con un URL que devuelvan algún tipo de información sobre el mismo: fecha de última modificación, por ejemplo.**

```ruby
#!/usr/bin/ruby

require 'net/http'

def servidor(uri)
  return Net::HTTP.get_response(uri,'/')['server'].to_s
end

def content(uri)
  return Net::HTTP.get_response(uri,'/')['content-type'].to_s
end

def date(uri)
  return Net::HTTP.get_response(uri,'/')['date'].to_s
end


url = ARGV[0] #Cogemos la URL

puts "URL: " + url
puts "Sevidor: "+ servidor(url)
puts "Contenido: "+ content(url)
puts "Feha: "+ date(url)

```
![Sej4.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/Sej4.png)



Ejercicio 5
-----------

**Ver si está disponible Vagrant como una gema de Ruby e instalarla.**

Para ver si Vagrant esta disponible como gema, la buscamos con:
```bash
gem search --remote vagrant
```

Vemos que si aparece vagrant, por lo que pasamos a instalarla con el comando:
```bash
gem install vagrant
```
