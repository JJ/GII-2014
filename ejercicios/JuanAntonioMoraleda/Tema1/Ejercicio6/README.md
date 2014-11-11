###Ejercicio 6: Crear un proyecto y descargárselo con git. Al crearlo se marca la opción de incluir el fichero README. Modificar el readme y subir el fichero modificado.

Clonamos el proyecto de la asignatura:

	git clone https://github.com/juanantc/GII-2014.git

Añadimos el archivo README.md al proyecto

    git add README.md 

Antes de subir el fichero modificado, debemos describir los cambios realizados(commit):

	git commit -m "Empezando con el repositorio"

Subimos los cambios:

	git push origin master

