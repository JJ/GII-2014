Lista de ejercicios Israel Blancas Álvarez
============================

#TEMA 7: Gestión de infraestructuras virtuales#

##Sesión 12-01-2015##

##Ejercicio 1##

#####Instalar chef en la máquina virtual que vayamos a usar#####

Cuando he ido a instalar de la primera forma que se indica en los apuntes, me he encontrado que se solicita tener, al menos la versión 2 de Ruby. Tras comprobar que los repositorios (al menos los que yo tengo) no ofrecen esa versión, he tratado de instalar con el segundo método (pensando que tal vez actualizaría mi versión de Ruby).

Tras comprobar que no, he ejecutado:

```bash
sudo apt-get -y update
sudo apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev
cd /tmp
wget http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p481.tar.gz
tar -xvzf ruby-2.0.0-p481.tar.gz
cd ruby-2.0.0-p481/
./configure --prefix=/usr/local
make
sudo make install
```

Y, finalmente, ``sudo gem install ohai chef``


![Instalando](http://fotos.subefotos.com/7378f669c28249174130139c21d34adfo.jpg)


Aunque conseguí instalarlo, cuando en el siguiente ejercicio traté de ejecutar una receta, no fui capaz (me aparecía un error en el que no se encontraba el paquete ya que, según "Chef", no se había especificado versión y no había ninguna disponible).

La solución la encontré ejecutando el sistema sobre una máquina virtual que ejecutaba Ubuntu 12.04 de 32 bits. Instalé ejecutando el segundo método que se propone en el guión de prácticas



***

###Ejercicio 2###

#####Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.#####

El árbol de ficheros que me ha quedado es el siguiente.

```
.
├── cookbooks
│   ├── emacs
│   │   ├── metadata.rb
│   │   └── recipes
│   │       └── default.rb
│   ├── fichero
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

Los ficheros contienen lo siguiente:

cookbooks>emacs>recipes>default.rb

```
package 'emacs'
```

cookbooks>emacs>metadata.rb

```
maintainer       "Israel Blancas"
maintainer_email "iblancasa@gmail.com"
description      "Instalar emacs"
version          "1.0"
name		         "emacs"

recipe "emacs", "Instalar emacs"
```

cookbooks>fichero>recipes>default.rb

```
directory '/home/iblancasa/fichero'
file "/home/iblancasa/fichero/fichero.md" do
owner "iblancasa"
group "iblancasa"
mode 00777
action :create
content "Hola, soy un fichero"
end
```

cookbooks>fichero>metadata.rb

```
maintainer       "Israel Blancas"
maintainer_email "iblancasa@gmail.com"
description      "Crea un directorio"
version          "1.0"
name		         "fichero"

recipe "fichero", "Crea un directorio"
```

cookbooks>nginx>recipes>default.rb

```
package 'nginx'
```

cookbooks>nginx>metadata.rb

```
maintainer       "Israel Blancas"
maintainer_email "iblancasa@gmail.com"
description      "Instalar NGINX"
version          "1.0"
name		         "nginx"

recipe "nginx", "Instalar NGINX"
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
        "name"	: "Fichero"
        },

        "run_list":	[
        "recipe[nginx]",
        "recipe[emacs]",
        "recipe[fichero]"
        ]
      }
```

solo.rb

```
file_cache_path "/home/iblancasa/chef"
cookbook_path "/home/iblancasa/chef/cookbooks"
json_attribs "/home/iblancasa/chef/node.json"
```

![Ejecución de las recetas](http://fotos.subefotos.com/3a8c522640cf24b7c655023dd3980151o.jpg)



***

###Ejercicio 3###

#####Escribir en YAML la siguiente estructura de datos en JSON#####
#####{ uno: "dos", tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }#####

[He usado esto para orientarme](http://docs.ansible.com/YAMLSyntax.html)

```
---
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
```



***

###Ejercicio 4###

#####Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.#####

Tras comprobar que Python está instalado e instalar pip con ``sudo apt-get install python-pip``, añado el host con ``echo "iblancasa.cloudapp.net" > ~/ansible_hosts`` y ejecutamos ``export ANSIBLE_HOSTS=~/ansible_hosts``. Si no habíamos configurado nuestra clave SSH para poder conectarnos a la máquina virtual sin utilizar contraseña, deberemos hacerlo ahora.
Para ello ejecutamos:

```bash
ssh-keygen -t dsa #Dejamos las claves sin poner
ssh-copy-id -i .ssh/id_dsa.pub iblancasa@iblancasa.cloudapp.net
```

Nos pedirá ingresar nuestra contraseña a través de SSH y ya no lo volverá a hacer.

Salimos de la máquina virtual y comprobamos que haya conexión

``ansible all -u iblancasa -m ping``

![Ping con Ansible](http://fotos.subefotos.com/eb6a534f12e56ae63db42f8e8efee58do.jpg)

Ahora hay que ejecutar los siguientes comandos:

```bash
ansible all -u iblancasa -m command -a "sudo apt-get install git nodejs npm -y"
ansible all -u iblancasa -m git -a "repo=https://github.com/iblancasa/BackendSI2-IV.git dest=~/backend version=HEAD"
ansible all -u iblancasa -m command -a "npm install /home/iblancasa/backend"
ansible all -u iblancasa -m command -a "node /home/iblancasa/backend"
azure vm endpoint create -n http iblancasa 80 8080
```

Tras esto, ya podremos acceder a la aplicación



***

###Ejercicio 5###

#####Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.#####
#####¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.#####

Cláramente Ansible. Es menos engorroso de utilizar y tiene algunos módulos muy interesantes (además de tener una sintáxis más clara).

Supongo que ya tengo los endpoints creados del ejercicio anterior. En nuestro "ansible_hosts", escribimos, justo antes de la aplicación Azure: ``[azure]``

```yaml
- hosts: azure
  sudo: yes
  remote_user: iblancasa
  tasks:
  - name: Instalar paquetes necesarios
    apt: name=nodejs state=present
    apt: name=git state=present
    apt: name=npm state=present
  - name: Instalar módulos
    command: npm install /home/iblancasa/backend
  - name: Iniciar
    command: node /home/iblancasa/backend
```



***

###Ejercicio 6###

#####Instalar una máquina virtual Debian usando Vagrant y conectar con ella.#####

Primero hay que instalarla (utilizando ``sudo apt-get install vagrant``). Después se descarga la imagen ejecutando `` vagrant box add debian https://dl.dropboxusercontent.com/u/4775364/vagrant/debian-6.0.9-amd64-plain-vmware.box``

Para poder usarlo, crearemos un fichero Vagrant, mediante la siguiente orden ``vagrant init debian`` (se especifica según el nombre que le hayamos dado al descargar la imagen). Ejecutamos y conectamos mediante:

```bash
vagrant up
vagrant ssh
```



***

###Ejercicio 7###

#####Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica#####

Nuestro Vagrantfile será el siguiente

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian"

  config.vm.provision "shell",
  inline: "sudo apt-get update && sudo apt-get install -y nginx && sudo service nginx start"

end
```
***



###Ejercicio 7###

#####Configurar tu máquina virtual usando vagrant con el provisionador ansible#####

Primero creamos nuestro fichero "ansible_host" en nuestra carpeta personal, con este contenido:

```
[debian]
192.168.1.55
```

En nuestra terminal introducimos: ``xport ANSIBLE_HOSTS=~/ansible_hosts``

En nuestro Vagrantfile escribimos:

```ruby
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian"
  config.vm.network :private_network, ip: "192.168.1.55"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
```

Y en nuestro playbook.yml, tendremos:

```yaml
  - hosts: debian
    sudo: yes
    tasks:
      - name: Actualización de lista de paquetes en repositorios
        apt: update_cache=yes
      - name: Instalación de Nginx
        apt: name=nginx state=present
      - name: Iniciar
        command: service nginx start
```

Y en terminal ejecutamos ``vagrant provision``
