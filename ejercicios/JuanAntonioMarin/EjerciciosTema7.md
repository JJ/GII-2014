##Tema 7:

###Ejercicio 1:

Instalar chef en la máquina virtual que vayamos a usar:

Simplemente he utilizado la segunda forma mas rapida

````
curl -L https://www.opscode.com/chef/install.sh | sudo bash
````

Y listo en la maquina virtual:

<img src="http://i57.tinypic.com/2woavra.jpg"/>

###Ejercicio 2:

Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual

El árbol de ficheros que me ha quedado es el siguiente.

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
maintainer       "Juan Antonio Marin"
maintainer_email "avalanc@correo.ugr.es"
description      "Install emacs"
version          "1.0"
name		         "emacs"

recipe "emacs", "Install emacs"
```

cookbooks>carpeta>recipes>default.rb

```
directory '/home/alumno/carpeta'
file "/home/alumno/carpeta/readme.txt" do
owner "jantoniomarin"
group "jantoniomarin"
mode 00777
action :create
content "Mkdir carpeta and readme.txt"
end
```

cookbooks>fichero>metadata.rb

```
maintainer       "Juan Antonio Marin"
maintainer_email "avalanc@correo.ugr.es"
description      "Mkdir carpeta and readme.txt"
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
maintainer       "Juan Antonio Marin"
maintainer_email "avalanc@correo.ugr.es"
description      "Install nginx"
version          "1.0"
name		         "nginx"

recipe "nginx", "Install nginx"
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
file_cache_path "/home/alumno/chef"
cookbook_path "/home/alumno/chef/cookbooks"
json_attribs "/home/alumno/chef/node.json"
```


###Ejercicio 3:

Escribir en YAML la siguiente estructura de datos en JSON

````
{ uno: "dos",
  tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }
````

````
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
````

Y lo compruebo en un conversor: http://codebeautify.org/yaml-to-json-xml-csv

<img src="http://i62.tinypic.com/2rfwthy.jpg"/>

####Ejercicio 4:

Los primero es instalar ansible

````
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
````

Ahora tenemos que configurar con nuestra cuenta azure o local (Se me caduco el mes de prueba de azure hoy. Ya que lo pedi en fin de año)

LOCAL
````
echo "127.0.0.1" > ~/ansible_hosts
export ANSIBLE_HOSTS=~/ansible_hosts
````

AZURE

````
echo "jantoniomarin.cloudapp.net" > ~/ansible_hosts
export ANSIBLE_HOSTS=~/ansible_hosts
````

Ya conectamos anteriormente con ssh

````
ansible all -u jantoniomarin -m ping --ask-pass
````

Dado que ya tuve el año pasado la asignatura de DAI instalo una aplicación cualquiera:

````
ansible all -u jantoniomarin -m git -a "repo=https://github.com/AzureADSamples/WebApp-GraphAPI-DotNet.git dest=~/dotnet version=HEAD"
ansible all -u jantoniomarin -m command -a "npm install /home/alumno/dotnet"
ansible all -u jantoniomarin -m command -a "node /home/alumno/dotnet"
azure vm endpoint create -n http jantoniomarin 80 8080
````

###Ejercicio 5:

Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.

Uso Ansible por la comodida del lenguaje YAML

````
- hosts: azure
  sudo: yes
  remote_user: jantoniomarin
  tasks:
  - name: Instalando paquetes
    apt: name=git state=present
    apt: name=npm state=present
  - name: Modulos
    command: npm install /home/alumno/dotnet
  - name: Iniciando
    command: node /home/alumno/dotnet
````

###Ejercicio 6:

Primero instalamos vagrant con:

````
sudo apt-get install vagrant
````

Ahora bajamos una imagen de la lista dada (La debian mas ligera 7.5.0)

````
vagrant box add debian https://dl.dropboxusercontent.com/s/tp5nupuw7dltg2u/debian-7.5.0-amd64-vmware.box
````

Y finalmente:

````
vagrant up
vagrant ssh
````

###Ejercicio 7:

Crear un script para provisionar `nginx` o cualquier otro servidor
web que pueda ser útil para alguna otra práctica.

````
# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("1") do |config|
  config.vm.box = "debian"

  config.vm.provision "shell",
  inline: "sudo apt-get install nginx && sudo service nginx start"

end
````

###Ejercicio 8:

En el ansible_host

[debian]
192.168.56.101

Y exportamos el ansible_host:

````
xport ANSIBLE_HOSTS=~/ansible_hosts
````

Vagrantfile:

````
VAGRANTFILE_API_VERSION = "`1"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian"
  config.vm.network :private_network, ip: "192.168.56.101"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
````

Y el libro de juego:

````
- hosts: debian
    sudo: yes
    tasks:
      - name: Instalar nginx
        apt: name=nginx state=present
      - name: Iniciar el servidor
        command: service nginx start
````

Finalmente:

````
vagrant provision
````