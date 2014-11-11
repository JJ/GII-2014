# Ejercicio 1

#### Instalar un entorno virtual para tu lenguaje de programación favorito (uno de los mencionados arriba, obviamente).

Se ha creado un repositorio para Python, llamado PYpi. Para utilizar este repositorio, se utiliza el comando pip, con el que podemos instalar librerias de Python compatibles con nuestro sistema.

Instalamos pip y virtualenv:

	sudo apt-get install python-pip python-dev build-essential
    sudo pip install --upgrade virtualenv
    
COn esto ya hemos instalado virtualenv. Para utilizarlo:

	virtualenv proyecto #proyecto es el nombre del proyecto
    
Creará una carpeta con el nombre del proyecto. Dentro de esta carpeta hay 3 directorios más: bin/, include/, lib/. Para activar virtualenv:

	>cd proyecto
    >source bin/activate
    (proyecto) $
    
Y para desactivar virtualenv:

	>(proyecto) desactivate

Fuente: http://stickybitshell.wordpress.com/2013/04/24/como-instalar-pip-en-debian-o-ubuntu-python/comment-page-1/
