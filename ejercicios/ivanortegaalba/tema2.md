# Hito 2
## Ejercicio 1

En la práctica vamos a desarrollar con Pyhon por lo que vamos a instalar el entorno [virualenv](http://rukbottoland.com/blog/tutorial-de-python-virtualenv/)
Vamos a instalar su versión Linux usando [pip](http://rukbottoland.com/blog/como-instalar-un-paquete-python-con-pip/)

```
#Instalar pip para Linux
$ sudo apt-get install python-pip

#Instalar pip para Linux
$ sudo pip install virtualenv
  Downloading virtualenv-1.11.6-py2.py3-none-any.whl (1.6MB): 1.6MB downloaded
  Installing collected packages: virtualenv
  Successfully installed virtualenv
  Cleaning up...

```
Para crear un virtualenv simplemente se ejecuta el siguiente comando:

```
$ virtualenv env1_prueba
  New python executable in env1_prueba/bin/python
  Installing setuptools, pip...done.
$ ls env1_prueba/
  bin  include  lib  local
```
Para activar un entorno virtual, se procesa el archivo bin/activate que se encuentra en la carpeta que se ha creado al ejecutar la utilidad virtualenv:
```
$ cd env1_prueba
$ source bin/activate
  env1_prueba$
```
Ahora solo falta instalar los paquetes que vamos a necesitar con pip, en mi caso django:
```
(env1_prueba)$ pip install django
```
Podemos configurar nuestro entorno a nuestro gusto, y poder probar versiones y frameswork en distintos entornos.
Para la ubicación del código fuente del proyecto, no es importante.
Puede ser colocado inclusive dentro del directorio del virtualenv.
Una vez que el virtualenv está activado, todas las librerías de Python que instalen solo podrán ser usadas al activar ese virtualenv específico.

## Ejercicio 2
