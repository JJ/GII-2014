TEMA 2
=========

###Ejercicio1###

`$ sudo apt-get install python-pip python-dev build-essential`
 
`$ sudo pip install --upgrade virtualenv`

###Ejercicio2###
Tenía una cuenta en OpenShift

###Ejercicio3###
Dentro de OpenShift, le damos a Add application y elegumos Wordpress4, vamos rellenando los campos y tendremos la aplicación básica creada:

[Mi Wordpress](http://php-yonatan24891.rhcloud.com/)

###Ejercicio4###
[He seguido este enlace](https://developers.google.com/apps-script/guides/menus#custom_menus_in_google_docs_sheets_or_forms)

Script:
```
function onOpen() {
 DocumentApp.getUi().createMenu('Menu custom')
  .addItem('IV', 'iv')
  .addToUi();
}

function iv() {
 DocumentApp.getUi()
  .alert('Estas en IV');
}
```
###Ejercicio5###
He elegido A-A-P (a Python based build tool).

[A-A-P](http://www.a-a-p.org/)

###Ejercicio6###
Como utilizo OpenShift, debemos instalar la herramienta rhc

`sudo aptitude install rhc`

Con `rhc setup` configuramos e introducimos nuestra cuenta

Hacemos un gitclone de los proyectos 

y vemos .openshift/action_hooks que es el fichero de automatización de construcción

###Ejercicio7###

He elegido doctest para python, doctest es un módulo incluido en la biblioteca estándar del lenguaje de programación Python, que permite la fácil generación de pruebas basadas en la producción del intérprete de Python.

[doctest en wikipedia](http://en.wikipedia.org/wiki/Doctest)

