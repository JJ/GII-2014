#Ejercicio 3

En este ejercicio vamos a crear un simple programa en un lenguaje interpretado para Linux, lo vamos a empaquetar con CDE y lo vamos a probar en distintas distribuciones.

CDE es la creación automática de aplicaciones Linux portátiles. Ayuda a la empaquetación del código de los datos y del entorno que se requiere para ejecutar programas Linux en otras máquinas sin necesidad de instalación o configuración, eliminando el problam de las dependencias.

Virtualización ligera de plicaciones Linux

Los pasos básicos son:

* Empaquetar
* Entregar
* Ejecutar

When execution terminates, the cde-package/ subdirectory (which we call a "CDE package") contains all of the files required to run Alice's original command.

###Ejemplo

**0.Creamos un script que dependa de una librería**

Para este ejemplo vamos a usar Python y la librería ++markdown++ con la que podremos pasar de markdown a html de forma muy sencilla.
El código de pythonMarkdown.py es sólo:

```sh
import markdown
print markdown.markdown('# Hola mundo!')
```

**1.Descargamos el binacio de CDE**

Podemos usar CDE copiando el repositorio y haciendo make pero también de una forma más sencilla descargargon el binario desde http://www.pgbovine.net/cde.html .

**2.Empaquetamos el script**

Para hacerlo sólo tenemos que ejecutarlo de forma corriente anteponiendo cde así:

```sh
./cde python pythonMarkdown.py
```

Para nosotros se habrá realizado una ejecución normal pero cde habrá ejecutado internamente **ptrace** que habrá buscado las dependencias de nuestro código, el lugar donde están almacenadas las librerías necesarias para solucionarlas y todo esto junto a nuestro código lo almacenará en una carpeta llamada **cde-package**

**3.Enviamos el paquete al otro equipo**

Ahora comprimimos la carpeta y la enviamos al equipo:

```sh
tar cvf paquete.tar ./cde-package/
scp paquete.tar juanantonio@172.16.1.128:/home/juanantonio
```

**4.Desempaquetamos y ejecutamos**

Una vez descomprimido paquete.zip podemos ejecutar el script sin preocuparnos de las dependencias ni de las librerías que incluya.

Para hacerlo entramos en la carpeta descomprimida cde-package y ejecutamos el script de una forma especial. El script se encuentra en la carpeta cde-root con la misma estructura de carpetas que se tenía en el equipo donde se empaquetó, esto puede hacer muy engorrosa la ejecución, pero no se ha encontrado otra forma de hacerlo. Entonces ejecutamos el script con el interprete python de forma normal, el fichero almacenado en esa jeraquía de capetas y anteponiendo el programa cde-exec incluido en esa carpeta.

Algo así:

```sh
./cde-exec python cde-root/home/juan/Documentos/PrimerCuatrimestre1415/Infp.Virtuales/GII-2014/ejercicios/juanAFernandez/Tema1/pythonMarkdown.py
```

Y el código se ejecutará sin dar ningún problema de depencias.


**Contras:**

El único de la herramienta es el tamaño que los paquetes pueden llegar a tener:

```sh
Ubuntu> du -sh cde-package/
19M	cde-package/
```

Totalmente desproporcionado al tamaño de la librería y del propio .py


**Enlaces relacionados:**

http://www.pgbovine.net/cde.html

http://www.pgbovine.net/publications/CDE-create-portable-Linux-packages_LISA-2011.pdf
