##Una introduccion a ruby
#Ejercicio 1
#Instalar Ruby y usar ruby --version para comprobar la versión instalada. A la vez, conviene instalar también irb, rubygems y rdoc.
![Imgur](http://i.imgur.com/j1oDlxX.png)
# Ejercicio 2
# Crear un programa en Ruby que imprima los números desde el 1 hasta otro contenido en una variable.
![Imgur](http://i.imgur.com/BRE0asp.png)
# Ejercicio 3
# ¿Se pueden crear estructuras de datos mixtas en Ruby? Crear un array de hashes de arrays e imprimirlo.
![Imgur](http://i.imgur.com/6rD5NgQ.png)
# Ejercicio 4
# Crear una serie de funciones instanciadas con un URL que devuelvan algún tipo de información sobre el mismo: fecha de última modificación, por ejemplo. Pista: esa información está en la cabecera HTTP que devuelve
> #!/usr/bin/ruby
> require 'net/http'
> def getfecha( texto ) 
>	indice = texto.index 'updated'
>	indice = indice.to_i + 16
>	fecha= texto.slice(indice,10)
>	puts fecha + " esta es la fecha de ultima modificacion de la pagina"
> end
> url = ARGV[0]
> puts "La url es " << url
> respuesta = Net::HTTP.get  url, '/'
> fname =  "#{url}.html"
> puts fname + " esta es la url dada"
> getfecha ( respuesta )
> if ( File.writable? (fname) ) 
>	salida = File.new fname, "w"
>	salida.puts( respuesta )
> else
>	puts("No puedo escribir en #{fname}")
>	salida = File.new fname, "w"
>	salida.puts( respuesta )
> end

Lo ejecutamos con ./ruby.rb osl.ugr.es y obtenemos la fecha de ultima modificacion de la pagina
![Imgur](http://i.imgur.com/aUakfj9.png)
# Ejercicio 5
# Ver si está disponible Vagrant como una gema de Ruby e instalarla.
Para buscar la gema de vagrant usar sudo gem search --remote vagrant
Para instalarla sudo gem install ruby vagrant y para ver la lista de gemas instaladas gem list y vemos que se ha instalado vagrant 1.5.0
![Imgur](http://i.imgur.com/9kKSLfu.png)

Ademas si queremos actualizar todas las gemas isntaladas usamos sudo gem update

