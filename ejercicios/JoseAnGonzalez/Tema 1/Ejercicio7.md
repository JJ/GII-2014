#Ejercicio 7

Para instalar la utilidad de cgroups:
	apt-get install libcgroup-dev

	apt-get install cgroup-bin

Con esto, se crea el fichero /proc/cgroups (que muestra los subsistemas kernek que podemos controlar), y además /etc/cgconfig.conf y /etc/cgrules.conf

Para comprobar si todo ha sido correcto, en una terminal escribimos:
	service cgconfig status