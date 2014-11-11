#Ejercicio 6

Desde la plataforma, nos logueamos con nuestro nombre de usuario y contraseña, y pinchamos en "Repositories", y después en New.

Dentro, rellenamos la descripción, y seleccionamos la opción de inicializar incluyendo el fichero README (que modificaremos más tarde). Acto seguido, pulsamos en Create Repository

Para descargar el repositorio y trabajar localmente, utilizamos la orden pull. Antes, debemos crear la carpeta en la que guardar el repositorio, y desde dentro de ella, ejecutamos:

	git pull <enlace>
    
Donde enlace es el enlace que nos da la plataforma github para el repositorio.

Una vez descargado (nos pedirá login), podemos trabajar normalmente. Entramos al archivo README.md, y con herramientas como Haroopad, podremos modificar cómodamente el fichero. 

Una vez actualizado, introducimos las siguientes órdenes:

	1º git add ./* (dentro de la carpeta en la que hemos trabajado. Esto permite a github marcar los archivos que se van a cambiar, que en este caso van a ser todos los del directorio donde estamos

	2º git commit -m "MENSAJE" (para comentar lo que se ha hecho, y confirmar)	

	3º git push (para subir el trabajo)