Ejercicios de Juan Francisco Rodríguez Vílchez
================================================

## Ejercicios Tema 2: Creando aplicaciones en la nube: Uso de PaaS ##

### Ejercicio 1 ###

**Instalar un entorno virtual para tu lenguaje de programación favorito (uno de los mencionados arriba, obviamente).**

Antes de poder instalar el entorno virtual es necesario la instalación de "pip":

![captura17](http://i.imgur.com/Mm1eCVX.png)

Posteriormente, procedo a instalar virtualenv para Python:

![captura18](http://i.imgur.com/1AOm7u4.png)

Lo configuro con :

![captura19](http://i.imgur.com/Dflmjnl.png)

Lo que hace es crear "ENV/lib/pythonX.X/site-packages",para que funcione cualquier librería. También crea "ENV/bin/python", que es un intérprete de Python que usará el entorno.

Finalmente, he comprobado si funciona correctamente:

![captura20](http://i.imgur.com/lr07SFE.png)

Tutorial seguido para crear proyecto: http://rukbottoland.com/blog/tutorial-de-python-virtualenv/

Como se puede ver en la captura anterior, con:

```sh
virtualenv mi_proyecto
```
Crea nuestro proyecto con las carpetas 

mi_proyecto/
    bin/
    include/
    lib/
    
Por lo que tenemos el entorno virtual de Python listo para ser utilizado.

***

### Ejercicio 2 ###

**Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu u OpenShift.**

He elegido registrarme en Heroku.

Primero nos piden poner el correo para enviarnos el enlace de validación y poder registrarnos:

![captura21](http://i.imgur.com/4FtvoZ2.png)

Luego hay que acceder al correo y aceptar el enlace que nos llevará al registro en la página de Heroku:

![captura22](http://i.imgur.com/VjeyQyO.png)

Una vez registrado, ya puedo acceder correctamente a la interfaz de Heroku:

![captura23](http://i.imgur.com/cZiWnfg.png)

También me he dado de alta en Openshift para el ejercicio 14:

![captura24](http://i.imgur.com/55v20qM.png)

***

### Ejercicio 3 ###

**Crear una aplicación en OpenShift y dentro de ella instalar WordPress.**

Una vez registrado en Openshift, buscamos en la interfaz lo siguiente:

![captura25](http://i.imgur.com/n0AmxOq.png)

y le damos a WordPress.

Elegimos la url que queramos:

![captura26](http://i.imgur.com/BR3ZuhF.png)

Y aceptamos. Ya tenemos la aplicación creada:

![captura27](http://i.imgur.com/97SJEMT.png)

Posteriormente, ya se encuentra WordPress listo para usarse (previamente hay que registrarse):

![captura28](http://i.imgur.com/F9VRxrS.png)

Llegados a este paso, tenemos la aplicación de WordPress lista para ser usada y poder crear entradas:

![captura29](http://i.imgur.com/LQbWg0t.png)

Aqui muestro un ejemplo de creación de una entrada en WordPress:

![captura30](http://i.imgur.com/0OpvoAM.png)

***

### Ejercicio 4 ###

**Crear un script para un documento Google y cambiarle el nombre con el que aparece en el menú, así como la función a la que llama.**

He seguido el siguiente tutorial: https://developers.google.com/apps-script/guides/menus

He accedido a través de Herramientas -> Editor de secuencias de comandos y he añadido el siguiente script:

![captura31](http://i.imgur.com/F5Gg3lK.png)

En el script anterior, cambio el nombre a un menú al que he llamado "Menú Custom" con dos item "Sublime" y "Precioso":

![captura32](http://i.imgur.com/LLpcG8j.png)

 Posteriormente, he creado dos funciones (que se llaman a través de los item anteriores) de tal forma que cuando se seleccione algún item se lance una alerta.
 
Al cliquear en el item "Sublime", se llama a la función "sublime" y se lanza la siguiente alerta:
 
![captura33](http://i.imgur.com/eMJBoxz.png)

Al cliquear en el item "Precioso", se llama a la función "precioso" y se lanza la siguiente alerta:
 
![captura34](http://i.imgur.com/XAMrWEb.png)
