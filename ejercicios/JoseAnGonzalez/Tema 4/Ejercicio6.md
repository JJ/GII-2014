# Ejercicio 6

#### 1. Instalar Juju

Para instalar juju, debemos introducir las siguientes órdenes:

	sudo add-apt-repository ppa:juju/stable

	sudo apt-get update && sudo apt-get install juju-core

Estas órdenes lo instalarán, pero aún no lo inician. Para poder trabajar con juju, debemos escribir:
	
    juju init

De esta forma se inicia, creando por primera vez el directorio .juju y el archivo environments.yaml. Editamos este último fichero, buscando la línea "default: amazon" y sustituyéndola por "default local".

#### 2. Usándolo, instalar MySQL en un táper

Introducimos las siguientes órdenes:

	juju bootstrap
	juju deploy mysql

Y establecemos mysql como base de datos:
	juju add-relation mediawiki:db mysql
