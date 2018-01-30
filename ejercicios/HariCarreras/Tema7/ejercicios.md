### Ejercicio 1 ###

He instalado chef con:

    curl -L https://www.opscode.com/chef/install.sh | bash

### Ejercicio 2 ###

Creamos el fichero default.rb para emacs y nginx:

	package 'emacs'
	directory '/home/haricarreras/tema7/chef'
	file "/home/haricarreras/tema7/LEEME" do
		owner "haricarreras"
		group "haricarreras"
		mode 00544
		action :create
		content "Directorio para documentos diversos"
	end

	package 'nginx'
	directory '/home/haricarreras/tema7/chef'
	file "/home/haricarreras/tema7/LEEME" do
		owner "haricarreras"
		group "haricarreras"
		mode 00544
		action :create
		content "Directorio para documentos diversos"
	end

node.json:

	{
		"run_list": [ "recipe[emacs]" ]
		"run_list": [ "recipe[nginx]" ]
	}

solo.rb

	file_cache_path "/home/haricarreras/tema7/chef"
	cookbook_path "/home/haricarreras/tema7/chef/cookbooks"
	json_attribs "/home/haricarreras/tema7/chef/node.json"
	


Por último ejecutamos

	sudo chef-solo -c tema7/chef/solo.rb



### Ejercicio 3 ###
	
	---
	uno: dos
	tres: 
	 - 4
	 - 5
	 - Seis
	 - siete: 8
	  nueve: 
	   - 10
	   - 11

### Ejercicio 6 ###

Primero he instalado vagrant:

    sudo apt-get install vagrant

Ha dado un error diciendo que esta no es la forma de instalar vagrant y que lo desinstale para que no haya conflicto. Haciendo caso:

    sudo apt-get --purge remove vagrant

Lo he instalado descargandolo desde la [pagina oficial de vagrant](http://www.vagrantup.com/downloads)

Luego solo hay que añadir una maquina de [las disponibles](http://www.vagrantbox.es/)

Yo he escogido Openmandriva2013.0 x86_64 (LXC, 2013.10.21) dado que es la más ligera

    vagrant box add mandriva http://bit.ly/vagrant-lxc-openmandriva2013-0-x86_64-2013-10-21
    vagrant init mandriva
    vagrant up

### Ejercicio 7 ###

Para ello se edita el Vagrantfile

	Vagrant.configure("2") do |config|
	  config.vm.provision "shell",
	    inline: "sudo apt-get update && sudo apt-get install -y nginx"
	end


Y ejecutamos:
 
    vagrant provision
