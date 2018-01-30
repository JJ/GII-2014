# Ejercicios de Óscar Sánchez Martínez #

**Ejercicio 1 Instalar chef en la máquina virtual que vayamos a usar**

- Primero instalamos Ruby y Ruby Gems, para luego instalar chef:

sudo apt-get install ruby1.9.1 ruby1.9.1-dev rubygems

sudo gem install ohai chef

Pero me doy cuenta de que el paquete "rubygems" no esta en los repositorios o está obsoleto, asi que busqué otra forma de instalarlo. Después de buscar, le pregunté a unos compañeros y me dieron un enlace [stackoverflow](http://stackoverflow.com/questions/16222738/how-do-i-install-ruby-2-0-0-correctly-on-ubuntu-12-04) donde viene la solución, que era la versión de ruby.

ejecutando la siguiente lista de comandos:

sudo apt-get -y update
sudo apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev
cd /tmp
wget http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p481.tar.gz
tar -xvzf ruby-2.0.0-p481.tar.gz
cd ruby-2.0.0-p481/
./configure --prefix=/usr/local
make
sudo make install

puede instalar lo necesario para poder instalar chef con el comando:

sudo gem install ohai chef

------- imagen1


**Ejercicio 2 Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.**



**Ejercicio 3 Escribir en YAML la siguiente estructura de datos en JSON { uno: "dos",tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }**

La estructura seria:

---
uno: dos
tres:
 -
   4
 -
   5
 -
   Seis
 -
   -
     siete: 8
   -
     nueve: 
      -
        10
      -
        11
...

**Ejercicio 4 y 5.1 Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible. Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.**

Tal y como hemos hecho en mi grupo seguir las instrucciones de provisionamiento.md:

Conexión ssh a Koding mediante par de claves pública/privada

Para comenzar necesitamos generar una nueva clave ssh para poner conectarnos desde nuestro equipo local mediante ssh a Koding. Para ello, ejecutamos el siguiente comando:

ssh-keygen -t rsa -C "ivaerospace2014@gmail.com" -f koding.key
Posteriormente, nos preguntará que introduzcamos una contraseña. Una vez introducida nos dará el 'key fingerprint'. Añadimos nuestra nueva key al ssh-agent:

eval "$(ssh-agent -s)"
ssh-add koding.key
Subimos el archivo "koding.key.pub" a nuestra máquina virtual de Koding y copiamos el contenido en un fichero llamado 'authorized_keys', dentro de la carpeta ~/.ssh que tendremos que crear también. Para ello ejecutamos:

mkdir -p ~/.ssh
echo koding.key.pub >> ~/.ssh/authorized_keys
Despliegue automático en Koding con Ansible

Ahora que tenemos acceso a ssh tendremos que crear nuestro playbook para ejecutar el despligue de la aplicación con ansible.

Lo primero será descargar las dependencias necesarias:

sudo pip install paramiko PyYAML jinja2 httplib2 ansible
Ahora debemos crear un archivo en cualquier carpeta del sistema que contenga algo como esto:

[koding]
ivaerospace.koding.io
y acto seguido asignárselo a la variable de entorno ANSIBLE_HOSTS

Para hacerlo de manera automática:

   printf "[koding]\nivaerospace.koding.io" > ~/ansible_hosts
   export ANSIBLE_HOSTS=~/ansible_hosts

Creamos el archivo despliegue.yml. En él vamos a meter instrucciones para instalar las dependencias necesarias y ejecutar la aplicación

Nos apoyamos en scripts como install.sh que se encargará de instalar el programa en el sistema y ejecutarlo

Para ejecutar el despliegue basta con hacer:

$ ansible-playbook despliegue.yml


**Ejercicio 5.2 ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.**

Ansible por la sencilla razón que es más intuitivo y fácil a la hora de trabajar con él.

**Ejercicio 6 Instalar una máquina virtual Debian usando Vagrant y conectar con ella.**

Para instalar vagrant usamos el comando:

sudo apt-get install vagrant

una vez instalado, en esta[página](http://www.vagrantbox.es/) nos facilitan cajas ya configuradas , simplemente cojemos una de debian.

----imagen1

y ejecutamos los comandos:

vagrant box add debian http://www.emken.biz/vagrant-boxes/debsqueeze64.box
vagrant init debian
-----imagen2

vagrant up
vagrant ssh

ya estaremos conectados a la máquina.



**Ejercicio 7 Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica**

**Ejercicio 8 Configurar tu máquina virtual usando vagrant con el provisionador ansible**
