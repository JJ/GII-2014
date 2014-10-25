###Ejercicio 6

**1-Crear un proyecto y descargárselo con git. Al crearlo se marca la opción de incluir el fichero README.**

**2-Modificar el readme y subir el fichero modificado.**

Desde la web https://github.com/mortega87, la que hace referencia a mi perfil git, creo un nuevo repositorio llamado Infraestructura_Virtual y marcando la opcion de crear fichero README.md.
Los pasos a seguir son los siguientes:

* En primer lugar, clonamos en nuestro directorio local el repositorio Infraestructura_Virtual con la siguiete orden desde la terminal: git clone https://github.com/mortega87/Infraestructura_Virtual.git

* En segundo lugar, accedemos al repositorio y editamos el fichero README.md con la siguiente orden: nano README.md

* En tercer lugar, lo añadimos al repositorio mediante la siguiente orden: git add README.md

* En siguiente lugar, realizamos el commit: git commit -m "Modificacion de README.md"

* Por último, aplicamos los cambios realizados en nuestro repositorio de git: git push origin master
