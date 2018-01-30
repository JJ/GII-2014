#Ejercicio 7

#### Crear un script para provisionar nginx o cualquier otro servidor web que pueda ser útil para alguna otra práctica.

Debemos añadir al fichero Vagrantfile las siguientes líneas dentro del Vagrant.configure:

	  config.vm.provision "shell",
  	inline: "sudo apt-get update && sudo apt-get install -y nginx && sudo service nginx start"

Al ser máquina debian, utiliza apt-get para actualizar repostiroios, instalar nginx y levantar el servicio.