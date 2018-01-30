#EJercicio 10

#### Instala docker

DOcker es una interfaz para los contenedores lxc, que es utilizada en el proyecto. Existen algunos posts ([#1](http://freelinuxdistrodeployed.github.io/LDT/2014/12/01/Docker-Ansible/), [#2](http://freelinuxdistrodeployed.github.io/LDT/2014/12/11/Llave_publica/)) en la página del proyecto que tratan la instalación de Docker, además de [otro](http://freelinuxdistrodeployed.github.io/LDT/2014/12/11/ADD_Docker/) en el que hay algunas indicaciones sobre los DockerfiUntitledle.

Para instalar Docker, ejecutamos el siguiente script:

	#Añadir repositorio. 
	sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

	#Añadir la llave pública que verifica el repositorio (el repositorio no está verificado por defecto, omitir este paso
	#rompería la instalación desatendida, por no hablar del fallo de seguridad)
	
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D8576A8BA88D21E9

	#Actualizacion de la lista de repositorios	
	sudo apt-get update

	#Instalación de Docker
	sudo apt-get --assume-yes install lxc-docker

	#Activar demonio de Docker
	sudo docker -d &

	#Instalación de Ubuntu
	sudo docker pull ubuntu
