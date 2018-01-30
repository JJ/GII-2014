##EJERCICIOS RUBY

* [+]Ejercicio 1
 - A) Instalar Ruby y usar "ruby --version" para comprobar la versión instalada. A la vez, conviene instalar también irb, rubygems y rdoc.

Lo primero que vamos a hacer es instalar "ruby" con: 

    apt-get install ruby

[Ver captura de pantalla](https://www.dropbox.com/s/1ca1dxzxf69799l/Captura%20de%20pantalla%202014-12-26%20a%20la%28s%29%2009.55.58.png?dl=0https://www.dropbox.com/s/1ca1dxzxf69799l/Captura%20de%20pantalla%202014-12-26%20a%20la%28s%29%2009.55.58.png?dl=0)

Una vez instalado vamos a usar "ruby --version" para comprobar la versión que tenemos instalada, [ver captura](https://www.dropbox.com/s/7knxf3bf5y5bphu/Captura%20de%20pantalla%202014-12-26%20a%20la%28s%29%2010.00.39.png?dl=0).

Ahora también vamos a instalar irb, rubygems y rdoc, para ello usamos el siguiente comando:

    apt-get install irb rubygems rdoc

[Ver captura de pantalla](https://www.dropbox.com/s/hvqgtllqcqe033k/Captura%20de%20pantalla%202014-12-26%20a%20la%28s%29%2010.02.00.png?dl=0)

* [+]Ejercicio 2
 - A) Crear un programa en Ruby que imprima los números desde el 1 hasta otro contenido en una variable.

Lo primero que debemos de hacer es escribir nuestro programa en ruby. 
```
  #!/usr/bin/ruby
    for i in 1..20
      puts "Numero = #{i}"
    end
```
Una vez lo tengamos preparador el programa, tenemos que darle permisos de ejecución con:

    chmod +x nombre_programa.rb

Cuando ya hayamos hecho estos pasos anteriores, solo queda ejecutar el programa con:

    ./nombre_programa.rb

[Ver captura de pantala](https://www.dropbox.com/s/bczsttcadf54gnp/Captura%20de%20pantalla%202014-12-26%20a%20la%28s%29%2010.07.50.png?dl=0)

* [+]Ejercicio 3
 - A) ¿Se pueden crear estructuras de datos mixtas en Ruby? Crear un array de hashes de arrays e imprimirlo.

Lo primero que vamos a hacer es crear el programa:
```
#!/usr/bin/ruby
prueba = { 
        :a => ['h','o'],
        :b => ['l','a'],
        :c => [' ','a','todos']
}
puts prueba.inspect

prueba.keys().each do |i|
        puts prueba[i]
end
```

Cuando ya hayamos hecho el programa, solo queda ejecutar el programa con:

    ./nombre_programa.rb

[Ver captura de pantalla](https://www.dropbox.com/s/3d0c8pyx0t4y422/Captura%20de%20pantalla%202014-12-26%20a%20la%28s%29%2010.40.29.png?dl=0)

* [+]Ejercicio 4
 - A) Crear una serie de funciones instanciadas con un URL que devuelvan algún tipo de información sobre el mismo: fecha de última modificación, por ejemplo. Pista: esa información está en la cabecera HTTP que devuelve.
```
#!/usr/bin/ruby
require 'net/http'

url = ARGV[0]

puts "URL introducida:" << url

http = Net::HTTP.new(url, 80)
resultado = http.request_head('/')

puts resultado['Last-Modified'].to_s
puts resultado["content-type"].to_s
puts resultado["date"].to_s
puts resultado["Server"].to_s
````
[Ver resultado](https://www.dropbox.com/s/t7w0ii7p6wsyla3/Captura%20de%20pantalla%202014-12-26%20a%20la%28s%29%2011.04.19.png?dl=0)

* [+]Ejercicio 5
 - A) Ver si está disponible Vagrant como una gema de Ruby e instalarla.

Para ver si tenemos instalado "vagrant" solamente necesitamos usar el siguiente comando:

    gem search --remote vagrant


En caso de que no lo tengas instalado como es mi caso, solo tenemos que usar el siguiente comando:

    gem install vagrant

[Ver captura de pantalla](https://www.dropbox.com/s/pj6lyktggl58b8m/Captura%20de%20pantalla%202014-12-26%20a%20la%28s%29%2011.11.27.png?dl=0)
