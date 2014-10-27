###Ejercicio8

**Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador, en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recursos de unos y otros durante un tiempo determinado.**


He creado tres grupos de control cgroups en la ruta que especifique en el ejercicio anterior **/sys/fs/cgroup**.

En primer lugar creamos los directorios de estos tres grupos, llamados **primer_grupo, segundo_grupo y tercer_grupo**.

Despues, logueandonos como root con la orden "sudo su", vamos a asignarle **memoria y CPU** a cada grupo creado anteriormente, de la siguiente forma:

	**Primer grupo:**
	echo 0 > primer_grupo/cpuset.cpus
	echo 0 > segundo_grupo/cpuset.mems
	**Segundo Grupo**
	echo 0 > segundo_grupo/cpuset.cpus
	echo 0 > segundo_grupo/cpuset.mems
	**Tercer grupo**
	echo 0 > tercer_grupo/cpuset.cpus
	echo 0 > tercer_grupo/cpuset.mems

Una vez realizado esto, vamos a **asignar las tareas** para cada grupo:

	sudo echo 11006 > cgroup/primer_grupo/tasks -> **NAVEGADOR**
	sudo echo 11050 > cgroup/segundo_grupo/tasks -> **EDITOR DE TEXTO**
	sudo echo 11108 > cgroup/tercer_grupo/tasks -> **EDITOR DE IMAGENES**

Comprobamos como la tarea asignada al primer_grupo (NAVEGADOR) es la que con diferencia mas cpu y memoria consume con respecto a las otras dos.

	cat cgroup/primer_grupo/cpuacct.usage -> **56070086145**
	cat cgroup/segundo_grupo/cpuacct.usage -> **1835597120**
	cat cgroup/tercer_grupo/cpuacct.usage -> **1382589216**
