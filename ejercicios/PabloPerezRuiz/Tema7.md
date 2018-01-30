##TEMA 7: Gestión de infraestructuras virtuales
###Ejercicio 1: 
####Instalar chef en la máquina virtual que vayamos a usar

Como ya tenia instalado ruby 2.2.0, instalo directamente chef haciendo:

	curl -L https://www.opscode.com/chef/install.sh | bash

Hecho:

![IMAGEN1](http://i59.tinypic.com/2ce2c2d.jpg)

###Ejercicio 2: 
####Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

Queda un arbol de ficheros así:

```
.
├── cookbooks
│ 
│   ├── carpeta
│   │   ├── metadata.rb
│   │   └── recipes
│   │       └── default.rb
|   ├── emacs
│   │   ├── metadata.rb
│   │   └── recipes
│   │       └── default.rb
│   └── nginx
│       ├── metadata.rb
│       └── recipes
│           └── default.rb
├── node.json
└── solo.rb
```

cookbooks>emacs>recipes>default.rb

```
package 'emacs'
```

cookbooks>emacs>metadata.rb

```
maintainer       "Pablo Perez"
maintainer_email "ppruiz@correo.ugr.es"
description      "Install emacs"
version          "1.0"
name		         "emacs"

recipe "emacs", "Install emacs"
```

cookbooks>carpeta>recipes>default.rb

```
directory '/home/ppruiz/carpeta'
file "/home/ppruiz/carpeta/readme.txt" do
owner "ppruiz"
group "ppruiz"
mode 00777
action :create
content "Creando directorio"
end
```

cookbooks>fichero>metadata.rb

```
maintainer       "Pablo Perez"
maintainer_email "ppruiz@correo.ugr.es"
description      "Creando directorio"
version          "1.0"
name		         "carpeta"

recipe "fichero", "Mkdir carpeta and readme.txt"
```

cookbooks>nginx>recipes>default.rb

```
package 'nginx'
```

cookbooks>nginx>metadata.rb

```
maintainer       "Pablo Perez"
maintainer_email "ppruiz@correo.ugr.es"
description      "Install nginx"
version          "1.0"
name		         "nginx"

recipe "nginx", "Instalar nginx"
```

node.json

```
{
  "nginx": {
    "version"	: "latest",
    "user"		: "www-data",
    "port"		: "80"
    },

    "emacs": {
      "version"	: "latest"
      },

      "fichero": {
        "name"	: "carpeta"
        },

        "run_list":	[
        "recipe[nginx]",
        "recipe[emacs]",
        "recipe[carpeta]"
        ]
      }
```

solo.rb

```
file_cache_path "/home/ppruiz/chef"
cookbook_path "/home/ppruiz/chef/cookbooks"
json_attribs "/home/ppruiz/chef/node.json"
```

###Ejercicio 3:
####Escribir en YAML la siguiente estructura de datos en JSON
####{ uno: "dos", tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }

	
    - uno: "dos"
      tres:
        - 4
        - 5
        - "Seis"
        -
          - siete: 8
            nueve:
              - 10
              - 11
    

Lo comprobamos:

![IMAGEN2](http://i60.tinypic.com/nmniuv.jpg)

###Ejercicio 4:
####Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

En primer lugar instalo ansible haciendo:

	sudo apt-get install software-properties-common
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install ansible

Configuro con mi nueva cuenta de Azure, ya que la otra caducó:

LOCAL

	echo "127.0.0.1" > ~/ansible_hosts
	export ANSIBLE_HOSTS=~/ansible_hosts

AZURE

    echo "ppruiz.cloudapp.net" > ~/ansible_hosts
    export ANSIBLE_HOSTS=~/ansible_hosts

Conectamos con ssh:

	ansible all -u ppruiz -m ping --ask-pass

Instalo una aplicacion cualquiera encontrada en el servidor git (DAI la cursé el año pasado):

    ansible all -u ppruiz -m git -a "repo=https://github.com/AzureADSamples/WebApp-GroupClaims-DotNet.git dest=~/dotnet version=HEAD"
    ansible all -u ppruiz -m command -a "npm install /home/ppruiz/dotnet"
    ansible all -u ppruiz -m command -a "node /home/ppruiz/dotnet"
    azure vm endpoint create -n http ppruiz 80 8080

###Ejercicio 5:
####Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.
####¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.

Más eficiente y cómodo Ansible:

````
- hosts: azure
  sudo: yes
  remote_user: ppruiz
  tasks:
  - name: Instalando paquetes necesarios
    apt: name=git state=present
    apt: name=npm state=present
  - name: Instalando modulos
    command: npm install /home/ppruiz/dotnet
  - name: Iniciando
    command: node /home/ppruiz/dotnet
````

### Ejercicio :6
####Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

En primer lugar la instalo haciendo :

	sudo apt-get install vagrant

Ahora nos descargamos la imagen haciendo:

	vagrant box add debian https://dl.dropboxusercontent.com/u/4775364/vagrant/debian-6.0.9-amd64-plain-vmware.box

Creamos un fichero Vagrant haciendo:

	vagrant init debian

Y ejecutamos y conectamos mediante:

	vagrant up
	vagrant ssh

### Ejercicio 7:
####Crear un script para provisionar nginx o cualquier otro servidor web que pueda ser útil para alguna otra práctica

    # -*- mode: ruby -*-
    # vi: set ft=ruby :

    Vagrant.configure("2") do |config|
      config.vm.box = "debian"

      config.vm.provision "shell",
      inline: "sudo apt-get update && sudo apt-get install -y nginx && sudo service nginx start"

    end

### Ejercicio 8:
####Configurar tu máquina virtual usando vagrant con el provisionador ansible

En nuestro directorio personal, creamos nuestro fichero ansible_host:

	[debian]
	192.168.1.57

Exportamos el ansible_host:

	xport ANSIBLE_HOSTS=~/ansible_hosts

En nuestro Vagrantfile ponemos:

    VAGRANTFILE_API_VERSION = "1"

    Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
      config.vm.box = "debian"
      config.vm.network :private_network, ip: "192.168.1.57"

      config.vm.provision "ansible" do |ansible|
        ansible.playbook = "playbook.yml"
      end
    end

En nuestro playbook.yml:

    - hosts: debian
        sudo: yes
        tasks:
          - name: Instalacion nginx
            apt: name=nginx state=present
          - name: Iniciar
            command: service nginx start

Y en nuestra terminal ejecutamos:

	vagrant provision


