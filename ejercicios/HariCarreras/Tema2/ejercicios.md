###Ejercicio1###
He instalado rbenv
![captura](http://s29.postimg.org/r48k1r8jb/Screen_Shot_2014_11_06_at_18_21_25.png)

###Ejercicio2###
Ya estaba dado de alta en heroky y además me he registrado ahora en openshift
![captura](http://s25.postimg.org/rcnnfkzzz/Screen_Shot_2014_11_06_at_18_26_55.png)

###Ejercicio3###
http://iv-haricarreras.rhcloud.com/

###Ejercicio4###
Simplemente, seguí el tutorial.
![captura](http://s25.postimg.org/51mgtrfi7/Screen_Shot_2014_11_06_at_20_08_02.png)

###Ejercicio5###
[De todos los sistemas de automatización](http://en.wikipedia.org/wiki/List_of_build_automation_software) de la construcción del software, solo he usado el clásico make y Rake para aplicaciones ruby.
En cualquier caso, cuando he creado el wordpress con OpenShift, ha habido un proceso automático de construcción del software.

###Ejercicio6###
Heroku:
Depende del lenguaje de la aplicación, aunque siempre sigue el mismo patrón. Primero busca las dependencias y crea lo necesario. Por ejemplo en una aplicación Rails ejecutará Bundle para instalar todas las Gems. Luego generará los ficheros necesarios del [AssetPipeline de rails](http://guides.rubyonrails.org/asset_pipeline.html)

###Ejercicio7###
Para apliaciones ruby, el entorno de desarrollo de pruebas más extendido es Rspec. También se combina normalmente con Cucumber que permite hacer test "Gherkin", es decir, test que se leen como especificaciones de las "features".
Además está bien mencionar que existen aplicaciones llamadas "auto-testing" las cuales comprueban las lineas de código que estás modificando y ejecutan los test automaticamente. Esto te permite hacer los test y luego ir haciendo el código hasta que el test pase.