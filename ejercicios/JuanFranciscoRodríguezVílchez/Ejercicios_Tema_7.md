
Ejercicios de Juan Francisco Rodríguez Vílchez
================================================

## Ejercicios Tema 7: Gestión de infraestructuras virtuales ##

### Ejercicio 1 ###

**Instalar chef en la máquina virtual que vayamos a usar**

Para instalar chef simplemente tenemos que ejecutar:

```sh
sudo apt-get install ruby1.9.1 ruby1.9.1-dev rubygems
sudo gem install ohai chef
```
Al decirme que necesito la versión 2 de Ruby, he consultado en [stackoverflow](http://stackoverflow.com/questions/16222738/how-do-i-install-ruby-2-0-0-correctly-on-ubuntu-12-04) cómo instalarla.

Conseguí instalarla de la siguiente forma:

```sh
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

### Ejercicio 2 ###

**Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.**

Voy a crear un recetario que contenga una receta para instalar el editor emacs, el servidor web nginx, y otra receta que cree un directorio para almacenar distintos ficheros.

El archivos **solo.rb** es el archivo de configuración de nuestro recetario que debe incluir "cookbook_path 'RUTA_RECETARIO'" y "json_attribs 'RUTA_ATRIBUTOS'" para indicar el archivo JSON con los atributos de cada una de nuestras recetas.

```sh
cookbook_path "/home/juanfranrv/chef/cookbooks"
json_attribs "/home/juanfranrv/chef/node.json"
```

El archivo **node.json** será el siguiente:

```sh
{
    "nginx": {
        "version"   : "1.4.1",
        "user"      : "www-data",
        "port"      : "80"
  },

    "emacs": {
        "version"   : "23.4.1s"
    },

    "directorio": {
        "name"      : "Directorio"
    },

    "run_list": [
        "recipe[nginx]",
        "recipe[emacs]",
        "recipe[directorio]"
    ]
}
```
En el interior de las carpetas de las recetas nos encontraremos un archivo **metadata.rb** con los metadatos sobre la receta:

```sh
maintainer       "Juan Francisco Rodríguez Vílchez"
maintainer_email "juanfran0205rv@gmail.com"
description      "NGINX "
version          "1.0"

recipe "nginx", "Instalar NGINX"
```

```sh
maintainer       "Juan Francisco Rodríguez Vílchez"
maintainer_email "juanfran0205rv@gmail.com"
description      "Crea un directorio "
version          "1.0"

recipe "directorio", "Crea un directorio"
```

```sh
maintainer       "Juan Francisco Rodríguez Vílchez"
maintainer_email "juanfran0205rv@gmail.com"
description      "emacs "
version          "1.0"

recipe "emacs", "Instalar emacs"
```
Y su receta es **default.rb**:

```sh
directory '/home/juanfranrv/directorio'
file "/home/juanfranrv/directorio/directorio.md" do
  owner "juanfranrv"
  group "juanfranrv"
  mode 00765
  action :create
  content "Directorio con archivos"
end
```

Archivo **default.rb** para instalar **nginx**:
```sh
package 'nginx'
```

Archivo **default.rb** para instalar **emacs**:
```sh
package 'emacs'
```

Finalmente, lo ejecutamos con:

```sh
sudo chef-solo -c chef/solo.rb -j chef/node.json
```
### Ejercicio 3 ###
**Escribir en YAML la siguiente estructura de datos en JSON { uno: "dos",tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }**

Las listas en YAMl se pueden usar introduciendo un miembro por línea antepuesto con "- ":

```sh
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

### Ejercicio 4 ###

**Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.**

Al tener caducada la cuenta de Microsoft Azure, voy a realizar los ejercicios con **Koding**.

Antes de nada tenemos que tener acceso mediante ssh a la máquina virtual de Koding, para ello tenemos que realizar los siguientes pasos:

Para comenzar necesitamos generar una nueva clave ssh para poner conectarnos desde nuestro equipo local mediante ssh a Koding. Para ello, ejecutamos el siguiente comando:

```sh
ssh-keygen -t rsa -C "ivaerospace2014@gmail.com"
```

Posteriormente, nos preguntará que introduzcamos una contraseña. Una vez introducida nos dará el 'key fingerprint'. Añadimos nuestra nueva key al ssh-agent:

```sh
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

Finalmente, abrimos el "~/.ssh/id_rsa.pub" y copiamos el contenido en un fichero llamado 'authorized_keys' en nuestra máquina virtual de Koding. Para ello ejecutamos:

```sh
mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys
```

Ahora abrimos el fichero de 'authorized_keys' que acabamos de crear y copiamos nuestra clave pública. 

Ya tendremos acceso con ssh a la máquina virtual de Koding:

![captura](http://i.imgur.com/pL6Zd3f.png)

Antes de poder usar Ansible, tenemos que crear un fichero inventario con todas las máquinas controladas por la máquina anfitriona. Para ello en **ansible_hosts** introducimos:

```sh
[koding]
ivaerospace.koding.io
```
```sh
export ANSIBLE_HOSTS=~/ansible_hosts
echo $ANSIBLE_HOSTS
ansible koding -u juanfranrv -m ping 
```
Nos conectamos con ssh e instalamos 'git'. Finalmente, desde la máquina anfitriona le damos la orden  para que usando ansible despliegue las fuentes:

```sh
ansible koding -m git -a "repo=https://github.com/julioxus/iv-aerospace.git dest=~/iv-aerospace version=HEAD"
```
Y los fuentes habrán sido desplegados correctamente en Koding.

### Ejercicio 5.1 ###

**Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.**

Creamos nuestro **playbook** llamado **provisionamiento.yml** que quedará tal que así:

```sh
---
- hosts: koding
  sudo: yes
  remote_user: ivaerospace
  tasks:
    - name: Actualizar paquetes
      apt: update_cache=yes
    - name: Instalar git
      apt: name=git state=present
    - name: Instalar Python
      apt: name=python state=present
    - name: Descargar/Actualizar el repositorio y sus submódulos
      git: repo=http://github.com/julioxus/iv-aerospace dest=/home/ivaerospace/iv-aerospace/ track_submodules=yes
    - name: Instalar la aplicación y crear el demonio 
      script: /home/ivaerospace/iv-aerospace/install.sh
```
El playbook anterior ejecutará un demonio que hemos creado en la práctica para desplegar automáticamente la aplicación en Koding.

Ejecutamos con:

```sh
ansible-playbook provisionamiento.yml
```
Y tendremos nuestra aplicación correctamente desplegada en http://ivaerospace.koding.io/ ( cada hora sin usar la máquina se apaga automáticamente):

![captura](http://i.imgur.com/EL2kfBD.png)

### Ejercicio 5.2 ###

**¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.**

Ansible claramente, es mucho más fácil de usar y entender que chef, que a mi punto de vista ha sido muy lioso de hacer funcionar, mientras que Ansible tiene una sintaxis más clara y más cómoda de usar.

### Ejercicio 6 ###

**Instalar una máquina virtual Debian usando Vagrant y conectar con ella.**

Antes de nada, tenemos que instalar vagrant si no lo tenemos instalado, para ello:

```sh
sudo apt-get install vagrant
```
Sin embargo, seguía sin funcionarme por lo que tuve que instarlo utilizando una gema:

```sh
sudo gem install vagrant --version 1.0.7
```
Posteriormente, me decía que la versión de mi Virtualbox era demasiado nueva, por lo que me he tenido que bajar una más antigüa:

```sh
#Virtualbox
deb http://download.virtualbox.org/virtualbox/debian quantal contrib
sudo apt-get update
sudo apt-get install virtualbox-4.2
```
Ahora nos descargamos una máquina configurada para Vagrant consultando la lista de disponibles en la página de [Vagrantbox](http://www.vagrantbox.es/). Yo he elegido una de Debian, por lo tanto, tenemos que descargarla e inicializarla.

```sh
vagrant box add debian https://dl.dropboxusercontent.com/u/197673519/debian-7.2.0.box
vagrant init debian
```
![captura](http://i.imgur.com/cxrP9nF.png)

Nos crea un fichero Vagrantfile que permite trabajar y llevar a cabo cualquier configuración adicional. Una vez hecho eso ya podemos inicializar la máquina y trabajar con ella:

```sh
vagrant up
vagrant ssh
```
![captura](http://i.imgur.com/LskG938.png)

### Ejercicio 7 ###

**Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica**

Simplemente tenemos que usar la directiva **inline** que nos permitirá ejecutar comandos directamente como si estuvieramos trabajando en un terminal. Para ello, nos vamos al archivo **Vagrantfile** y añadimos lo siguiente:

```sh
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian"

  config.vm.provision "shell",
    inline: "sudo apt-get update && sudo apt-get install -y nginx && sudo service nginx restart && sudo service nginx status"

end
```
Finalmente provisionamos dicha máquina:

```sh
vagrant provision
```

### Ejercicio 8 ###

**Configurar tu máquina virtual usando vagrant con el provisionador ansible**

Antes de nada tenemos que asignarle una dirección IP a nuestra máquina Vagrant para poder indicarle a Ansible la máquina a la que tiene que conectarse y configurar. Para ello indicamos en nuestro Vagrantfile lo siguiente:

```sh
config.vm.network :private_network, ip: "10.0.2.15"
```
Después de este cambio, recagargamos Vagrant con:

```sh
vagrant reload
```
Para indicar que vamos a usar provisionamiento mediante Ansible tenemosque añadir en nuestro Vagrantfile  la directiva playbook para indicar el nombre y la ruta del playbook que vamos a usar para realizar la configuración:

```sh
Vagrant.configure("2") do |config|
  config.vm.box = "debian"
  config.vm.network :private_network, ip: "10.0.2.15"

  config.vm.provision "ansible" do |ansible| 
    ansible.playbook = "playbook.yml"
  end

end
```
Y en dicho playbook añadimos la instalación de **Nginx**:

```sh
---
- hosts: vagrant
  sudo: yes
  tasks:
    - name: Actualizar lista de paquetes
      apt: update_cache=yes
    - name: Instalar Nginx
      apt: name=nginx state=present
```

Para provisionar los cambios sólo queda hacer uso de:

```sh
vagrant provision
```
![captura](http://i.imgur.com/ugMmsgP.png)