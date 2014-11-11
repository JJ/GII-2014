#EJercicio 4

####Hacer el tutorial de línea de órdenes de docker para comprender cómo funciona.

Objetivo 0: saber la versión:
	
    docker --version
    
Objetivo 1: Buscar una imagen

	Buscamos en el container de prueba para el tutorial una imagen (contenedor también llamado tutorial):
    docker search tutorial
    
Objetivo 2: Descargar contenedores de imágenes

	docker pull learn/tutorial

Objetivo 3: Ejecutar sentencias con las imágenes descargadas

	docker run learn/tutorial echo "Sentencia de prueba"
  
Objetivo 4: Instalar utilidades en los contenedores

	docker run learn/tutorial apt-get install -y ping
    La opción -y es par auna instalación desatendida

Objetivo 5: Guardar los cambios de los contenedores

	docker commit 698 learn/ping
    El número 698 es el ID del contenedor. Al guardar los cambios, docker
    devuelve otro identificador, que es sel de la nueva imagen con los cambios guardados

Objetivo 6: Ejecutar la nueva imagen creada

	docker run learn/ping ping www.ugr.es
   	learn/ping es el nombre del contenedor, que hemos guardando antes.
  
Objetivo 7: INspeccionar la imagen
	
	docker ps
    Nos mostrará las imágenes que están ejecutándose. EN nuestro caso, nos sale la imagen que hemos creado antes (con el identificador efeXXXX). Por lo cual, inspeccionamos la imagen, mediante la orden
    docker inspect efe
    
Objetivo 8: Añadir la imagen al repositorio

	docker push learn/ping
    
Para poder instalarlo en Ubuntu, escribimos las siguientes órdenes:

	$ sudo apt-get update
	$ sudo apt-get install docker.io
	$ sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
	$ sudo sed -i '$acomplete -F _docker docker' 									/etc/bash_completion.d/docker.io
	$ source /etc/bash_completion.d/docker.io
    

    

