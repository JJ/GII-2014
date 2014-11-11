###Ejercicio 1: Instalar un entorno virtual para tu lenguaje de programación favorito (uno de los mencionados arriba, obviamente).

He decidido instalar virtualenv para Python:

####Instalación

	 sudo apt-get install python-virtualenv

####Creación

Una vez instalado, para crear un virtualenv ejecutamos:

    virtualenv mi_proyecto

Una vez hecho esto, el directorio mi_proyecto se crea con la siguiente estructura:

	mi_proyecto/
    	bin/
    	include/
    	lib/

####Activar
Para activar el entorno virtual creado, nos situamos en el directorio de éste e introducimos lo siguiente:

	source bin/activate

A partir de ahora el prompt de la terminal cambiará por el del proyecto:

	(mi_proyecto)$

Una vez activado, podemos usar los paquetes Python instalados o instalar instalar paquetes adicionales.


####Desactivar
Para desactivar un entorno virtual basta con ejecutar el comando:

	(mi_proyecto)$ deactivate

