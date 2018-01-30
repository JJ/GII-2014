#Ejercicio 7

#### Destruir toda la configuración creada anteriormente

Para destruir toda la configuración, introducimos las siguientes órdenes:

	juju destroy-service mysql
    juju destroy-service mediawiki
 	sudo juju destroy-environment local

#### 7.2 Volver a crear la máquina anterior y añadirle mediawiki y una relación entre ellos

Usamos las opciones deploy, add-relation y exposa:

	juju deploy mediawiki
    juju deploy mysql
  	juju add-relation mediawiki msql
 	juju exposa mediawiki

#### 7.3 Crear un script en shell para reproducir la configuración usada en las máquinas que hagan falta

Para hacer el script, "comprimimos" todas las órdenes realizadas en este ejercicio, cambiando siempre al entorno local

	#!/bin/bash

	sudo juju switch local
	sudo juju bootstrap
    juju deploy mysql
	juju deploy mediawiki
    juju add-relation mediawiki:db mysql
  	juju expose mediawiki