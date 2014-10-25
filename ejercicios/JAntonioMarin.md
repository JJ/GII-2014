#Ejercicios de Juan Antonio Marin

##Sesión 14-oct-2014

###Ejercicio 3:

1. ¿Qué tipo de virtualización es la más adecuada para: alojar varios clientes en un sólo servidor, crear un sistema eficiente de web + middleware + base de datos, un sistema de prueba de software e integración continua? Responder aquí y razonar.

Varios clientes en un solo servidor: Para este usaría un entorno de virtualización a nivel se sistema operativo, ya que tendría al servidor como anfitrión y a los clientes aislados en los contenedores.

Crear un sistema eficiente de web +  middleware + base de datos: un sistema de virtualización plena ya que tiene estructuras de control llamadas hipervisores para controlar los diferentes aspectos de web y base de datos.

Un sistema de prueba de software e integración continua: dado que es un sistema de prueba simplemente debe usarse una virtualización de entornos de desarrollo para así probar las diferentes versiones y por tanto así tenemos cubierta una integración continua.

2. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

Primero creamos el programa mas simple que podemos crear:

´´´
#!/bin/bash
echo "Esto es una prueba"
´´´
Descargamos del repositorio el CDE: git clone git://github.com/pgbovine/CDE.git
Instalamos entrando en el directorio y con el comando make para ejecutar el Makefile
Copiamos el programa creado en la carpeta CDE, y le cambiamos los permisos: chmod u+x prueba.sh
Ahora simplemente ejecutamos ./cde ./prueba.sh
Y se nos crea el CDE en mi caso en: cde-package/cde-root/home/juanaco/CDE/prueba.sh.cde el archivo, junto a todo el cde-package. Este podemos comprimirlo y llevarlo a otros sistemas.

![Imagen CDE](http://imageshack.com/a/img537/4091/NN0CGy.png"IMAGEN CDE")


##Sesión 6-oct-2014

###Ejercicio 6:

He seguido la linea de comandos que marca github para crear un nuevo proyecto con su README.md.

1. Creamos el fichero con: touch README.md.
2. Añadimos el fichero README.md: git add README.md.
3. Hacemos el commit del fichero: git commit -m "Primer commit".
4. Lo añadimos a la ruta: git remote add origin https://github.com/JAntonioMarin/ejerciciosjj.git.
5. Guardamos los cambios: git push -u origin master.

La segunda parte para realizar los cambios lo hacemos como siempre:

6. Cambiamos en el fichero y lo añadimos de nuevo: git add README.md.
7. Hacemos el: git commit -am "Cambio de README.md".
8. Hacemos el push: git push.

###Ejercicio 5:

Primero instalo el git con el comando: sudo apt-get install git

Para bajar mi directorio completo: git clone https://github.com/JAntonioMarin/GII-2014.git

Para actualizarlo normalmente utilizo: git pull

Entro en el directorio con cd GII-2014/

Para ver los cambios que he realizado en el fichero utilizo: git status

Tras realizar todos los cambios pongo el fichero que quiero modificar: git add ejercicios/JAntonioMarin.md

Me pide modificar las variables globales con mis datos: git config --global user.email avalanch.psp@gmail.com, git config --global user.name JAntonioMarin

Hago el commit del fichero: git commit -am "Asunto para cambiar el fichero"

Y finalmente hago un git push para guardar los cambios.

Para actualizar el repositorio: git pull https://github.com/JJ/GII-2014.git master



##Sesión 30-sept-2014

###Ejercicio 2:

Vamos a comparar los dos proveedores de servicios Amazon AWS y Bluemix de IBM:

Primero vamos a ver el numero de horas que tiene el 1% de un año y el 10% de un año.
365 días X 24 horas = 8,760 horas X 1% = 87,6 horas al año
365 días X 24 horas = 8,760 horas X 10% = 876 horas al año

El procesador no queda claro en ninguna de las dos plataformas, solo en amazon puedes seleccionar mas procesadores, la memoria RAM es de 1GB en el caso de amazon y de 2GB en el caso de Bluemix. 5GB de disco duro en el caso de Amazon y 2GB de disco duro en Bluemix.

Para el 1% de procesamiento básicamente los dos servicios serian viables porque amazon dan 750 horas de procesamiento, y Bluemix 375 horas gratuitas (Aunque la cuenta es gratuita durante un mes).

Para el 10% ya si tendremos que pagar en ambos servicios, vamos a calcular cuanto en cada uno:

Amazon precio por hora 0,013 dolares por hora, 876 horas - 750 gratuitas = 123 horas a pagar = 1,599 dolares.
Bluemix precio por hora 0,05 dolares por hora, 876 horas - 375 gratuitas = 501 hora a pagas = 25,05 dolares.

Como podemos observar el precio de Amazon es mucho mas económico pero sus características son inferiores.


##Sesión 29-sept-2014

###Ejercicio 1:
Busco un servidor para hacer la amortización a 4 y 7 años:

[Enlace de la pagina donde he encontrado el servidor](http://www.dynos.es/servidor-hp-proliant-ml350e-g8-xeon-e5-2407-2.2-ghz-2gb-ddr3-500gb-sata-lff-dvd-rw-matrox-g200-array-b120i-887111422231__470065-691.html)

**Características:**

SERVIDOR HP PROLIANT ML350E G8 XEON E5-2407 2.2 GHz / 2GB DDR3
/500GB SATA LFF / DVD-RW / MATROX G200


**Precio: 1035€**

El primer paso es quitar el IVA, ya que las deducciones se hacen sobre la base imponible.

Quitamos el 21% de IVA, 1035 / 1,21 = 855,37€

El coeficiente máximo deducible al año para equipos del tratamiento de información es del 26% por lo que a 4 años podemos deducir cada año al 25%

Año 2014: 213,84€

Año 2015: 213,84€

Año 2016: 213,84€

Año 2017: 213,84€

Ahora lo calculamos a 7 años, hacemos por ejemplo 6 años al 15% y el ultimo año al 10%.

Año 2014: 128.30€

Año 2015: 128.30€

Año 2016: 128.30€

Año 2017: 128.30€

Año 2018: 128.30€

Año 2019: 128.30€

Año 2020: 85,57€

Esto siempre suponiendo que el servidor lo compramos a principios del año 2014.
