Ejercicios de Julio Martínez Martínez-Checa
============================

# Tema 7

 
## Ejercicio 1 ##
**Instalar chef en la máquina virtual que vayamos a usar**

He usado el método que puso @iblancasa en el issue #579 para instalar chef sobre debian:

```
$ curl -L https://www.opscode.com/chef/install.sh | sudo bash
```

De esta forma se instala bien sin dar problemas al instalar los paquetes más tarde.


![captura1](http://i.imgur.com/AaDpSEB.png)

## Ejercicio 2 ##
**Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.**

Mi lista de archivos es la siguiente:

```
.
├── chef-client-running.pid
├── chef-stacktrace.out
├── cookbooks
│   ├── emacs
│   │   └── recipes
│   │       └── default.rb
│   └── nginx
│       └── recipes
│           └── default.rb
├── node.json
└── solo.rb
```

Cuyo contenido es:

node.json:

```json
{
        "run_list": [
					"recipe[emacs]",
					"recipe[nginx]"
					]
}
```

solo.rb:

```ruby
file_cache_path "/home/julio/chef"
cookbook_path "/home/julio/chef/cookbooks"
json_attribs "/home/julio/chef/node.json"
```

cookbooks/emacs/recipes/default.rb:

```ruby
package 'emacs'
directory '/home/julio/Documentos'
file "/home/julio/Documentos/LEEME" do
        owner "julio"
        group "julio"
        mode 00544
        action :create
        content "Directorio para documentos diversos"
end
```

/cookbooks/nginx/recipes/default.rb:

```ruby
package 'nginx' 
```

De esta forma al ejecutar:

```
$ sudo chef-solo -c solo.rb
```

se instalará emacs y creará el fichero LEEME con el contenido indicado, y se instalará nginx.

## Ejercicio 3 ##
**Escribir en YAML la siguiente estructura de datos en JSON**

**{ uno: "dos",**
**  tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }**

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

## Ejercicios 4 y 5.1 ##
**Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.**

**Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.**


Tal y como hemos hecho en mi grupo seguir las instrucciones de [provisionamiento.md](https://github.com/julioxus/iv-aerospace/blob/master/doc/provisionamiento.md):

###Conexión ssh a Koding mediante par de claves pública/privada###

Para comenzar necesitamos generar una nueva clave ssh para poner conectarnos desde nuestro equipo local mediante ssh a Koding. Para ello, ejecutamos el siguiente comando:

```sh
ssh-keygen -t rsa -C "ivaerospace2014@gmail.com" -f koding.key
```
Posteriormente, nos preguntará que introduzcamos una contraseña. Una vez introducida nos dará el 'key fingerprint'. Añadimos nuestra nueva key al ssh-agent:

```sh
eval "$(ssh-agent -s)"
ssh-add koding.key
```
Subimos el archivo "koding.key.pub" a **nuestra máquina virtual de Koding** y copiamos el contenido en un fichero llamado 'authorized_keys', dentro de la carpeta ~/.ssh que tendremos que crear también. Para ello ejecutamos:

```sh
mkdir -p ~/.ssh
echo koding.key.pub >> ~/.ssh/authorized_keys
```

###Despliegue automático en Koding con Ansible###

Ahora que tenemos acceso a ssh tendremos que crear nuestro playbook para ejecutar el despligue de la aplicación con ansible.

Lo primero será descargar las dependencias necesarias:

```sh
sudo pip install paramiko PyYAML jinja2 httplib2 ansible
```

Ahora debemos crear un archivo en cualquier carpeta del sistema que contenga algo como esto:

```
[koding]
ivaerospace.koding.io
```

y acto seguido asignárselo a la variable de entorno ANSIBLE_HOSTS

Para hacerlo de manera automática:

```sh
   printf "[koding]\nivaerospace.koding.io" > ~/ansible_hosts
   export ANSIBLE_HOSTS=~/ansible_hosts
```

Creamos el archivo [despliegue.yml](https://github.com/julioxus/iv-aerospace/blob/master/despliegue.yml). En él vamos a meter instrucciones para instalar las dependencias necesarias y ejecutar la aplicación

Nos apoyamos en scripts como [install.sh](https://github.com/julioxus/iv-aerospace/blob/master/install.sh) que se encargará de instalar el programa en el sistema y ejecutarlo

Para ejecutar el despliegue basta con hacer:

```sh
$ ansible-playbook despliegue.yml
```

## Ejercicio 6 ##
**Instalar una máquina virtual Debian usando Vagrant y conectar con ella.**

Vagrant se encuentra desactualizado en los repositorios y ya no se puede instalar como gema. En su defecto tendremos que descargar el paquete de [su web](https://www.vagrantup.com/) e instalarlo.

En mi caso:

```sh
$ sudo dpkg -i vagrant_1.7.2_x86_64.deb
```

Después instalaremos la máquina virtual de Debian con:

```sh
vagrant box add debian https://dl.dropboxusercontent.com/u/197673519/debian-7.2.0.box
```

![captura2](http://i.imgur.com/bb4M4am.png)

Iniciamos el entorno con

```sh
$ vagrant init debian
```
Esto nos crea un fichero Vagrantfile en el directorio donde nos encontramos en este momento, que permite trabajar y llevar a cabo cualquier configuración adicional.

Una vez hecho eso ya podemos inicializar la máquina y trabajar con ella:

```sh
$ vagrant up
$ vagrant ssh
```

![captura3](http://i.imgur.com/6ieg0Hb.png)

![captura4](http://i.imgur.com/3hSsPHH.png)


## Ejercicio 7 ##
**Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica**

Editamos el Vagrantfile para añadir el provisionamiento en una línea:

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian"

  config.vm.provision "shell",
    inline: "sudo apt-get update && sudo apt-get install -y nginx && sudo service nginx restart && sudo service nginx status"

end
```

A continuación lo ejecutamos con

```
$ vagrant provision
```

![captura5](http://i.imgur.com/QSK9a0V.png)

Como podemos ver se están ejecutando los comandos especificados en el archivo.

Finalmente podremos ver que nginx está instalado accediendo a la ip de la máquina virtual (127.0.0.1):

![captura6](http://i.imgur.com/hBM5fo5.png)


## Ejercicio 8 ##
**Configurar tu máquina virtual usando vagrant con el provisionador ansible**

He usado la práctica de DAI para desplegarla en la máquina virtual de Vagrant, usando el playbook usado en la práctica (modificando hosts: all y suprimiendo el campo de usuario remoto):

```
---
- hosts: all
  sudo: yes
  tasks:
    - name: Actualizar paquetes
      apt: update_cache=yes
    - name: Instalar git
      apt: name=git state=present
    - name: Instalar Python
      apt: name=python state=present
    - name: Descargar el repositorio y sus submódulos
      git: repo=http://github.com/julioxus/iv-aerospace dest=iv-aerospace track_submodules=yes
    - name: Dar permisos de ejecución
      command: chmod +x iv-aerospace/uninstall.sh
    - name: Desinstalar la aplicación si se encontrase instalada
      command: ./uninstall.sh
      args:
        chdir: iv-aerospace
    - name: Dar permisos de ejecución
      command: chmod +x iv-aerospace/install.sh
    - name: Instalar la aplicación y crear el demonio
      command: ./install.sh
      args:
        chdir: iv-aerospace
    - name: Borrar fuentes
      command: rm -rf iv-aerospace
```

He tenido que configurar de la siguiente forma el Vagrantfile:

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian"
  config.vm.network :private_network, ip: "192.168.1.55"

  config.vm.provision "ansible" do |ansible| 
    ansible.playbook = "despliegue.yml"
  end

end
```

Como se puede ver he asignado una ip a la máquina virtual y he usado el script de despliegue de ansible 'despliegue.yml'.

Ya está la aplicación desplegada:

![captura7](http://i.imgur.com/2zNKdB3.png)

