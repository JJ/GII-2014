#Ejercicios de JCristobal (José Cristóbal López Zafra)

# Tema 7

[Enlace al tema](http://jj.github.io/IV/documentos/temas/Gestion_de_configuraciones)


##Ejercicio 1
###Instalar chef en la máquina virtual que vayamos a usar

Nos conectamos a ello con `ssh jcristobal@jcristobal.cloudapp.net`.

Y dentro lo instalamos como nos indican en el guión, con `sudo curl -L https://www.opscode.com/chef/install.sh | sudo bash` 


![imagen](http://i.imgur.com/ehjjAiH.png) 


##Ejercicio 2
###Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual. 

Crearé recetas con nginx, emacs y un directorio (iv). Para ello muestro los contenidos de mi solo.rb y node.json

en el archivo solo.rb:

```
file_cache_path "/home/jcristobal/chef"
cookbook_path "/home/jcristobal/chef/cookbooks"
json_attribs "/home/jcristobal/chef/node.json"
```

en node.json:

```
{
"iv": {
   "name" : "IV"
},
"nginx": {
   "user" : "www-data",
   "port"	: "80"
},
"run_list": [ "recipe[emacs]", "recipe[iv]", "recipe[nginx]" ]
}
```


Dentro de un directorio (chef en mi caso) crearemos "coockbooks" y dentro de él una carpeta con cada receta (emacs, iv y nginx): cada una tendrá su metadata.rb y recipes/default.rb

Tendrán estructuras similares, pongo los de la receta de nginx:

dentro de metadata.rb:

```
maintainer "JCristobal"
maintainer_email "tobas92@gmail.com"
description "Instala nginx"
version "1.0.0"
name "nombrenginx"

recipe "nginx", "Receta para instalar nginx"
```

y dentro de default.rb

```
package 'nginx'
```

En cada receta tendremos que cambiar "recipe" de metadata.rb y el paquete de default.rb



Muestro la esctructura que se queda:

![imagen](http://i.imgur.com/tFveKn6.png) 

y para acabar `sudo chef-solo -c solo.rb`

Pero no se puede ejecutar con éxito en esta versión de Ubuntu, Chef no encuentra ningún paquete (en el siguiente pantallazo muestra nginx por ejemplo):

![imagen](http://i.imgur.com/hu0qVB1.png) 


Pruebo lo mismo en una versión anterior, [Ubuntu 12.04.5](http://releases.ubuntu.com/12.04/). Una vez dentro instalo chef y creo una receta, pero obtengo el mismo fallo.


##Ejercicio 3
###Escribir en YAML la siguiente estructura de datos en JSON

{ uno: "dos", tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }

En YAML:

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

##Ejercicio 4 
### Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

Lo instalamos como aplicación normal: primero tenemos que añadir su repositorio correspondiente: ejecutamos `sudo add-apt-repository ppa:rquillo/ansible`

Actualizamos paquetes e intalamos: `sudo apt-get install ansible`

Creamos un fichero (en la máquina anfitriona) para especificar las máquinas controladas por la máquina anfitriona, indicando la dirección de la máquina. Será ansible_host y simplemente contendrá:

```
[azure]
jcristobal.cloudapp.net
```


E indico el nuevo valor de variable de la ruta a este archivo: `export ANSIBLE_HOSTS=~/ansible_hosts`

Y lo podemos comprobar con `ansible azure -u jcristobal -m ping --ask-pass`

![imagen](http://i.imgur.com/PfkbZX9.png) 

Y desde local desplegamos la [aplicación](https://github.com/JCristobal/practicas3-4-DAI), que es la práctica 4 de la asignatura DAI, con ansible:
`ansible azure -u jcristobal -m git -a "repo=https://github.com/JCristobal/practicas3-4-DAI.git dest=~/practicas3-4-DAI version=HEAD" --ask-pass`

![imagen](http://i.imgur.com/oShNyIM.png) 

Y lo comprobamos:

![imagen](http://i.imgur.com/Ygq64PG.png) 



##Ejercicio 5
###Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

Crearé un playbook (despliegue.yml) instalando Python (y web.py, además de MongoDB como base de datos). Además trataremos la aplicación (la práctica 4 de la asignatura DAI) como un "servicio Upstart" para poder gestionarla más fácilmente.

despliegue.yml:

```
---
- hosts: azure
  sudo: yes
  remote_user: jcristobal
  tasks:
    - name: Instalar Python y EasyInstall
      apt: name=build-essential state=present
      apt: name=python-dev state=present
      apt: name=python-setuptools state=present
    - name: Instalar MongoDB
      apt: name=mongodb-server state=present
    - name: Instalar web.py
      command: easy_install web.py 
    - name: Instalar pip
      apt: name=python-pip state=present
    - name: Instalar twetpy
      command: easy_install tweepy
    - name: Crear servicio upstart
      template: src=despliegue.conf dest=/etc/init/despliegue.conf owner=root group=root mode=0644
    - name: Iniciar aplicación
      service: name=despliegue state=running
```

El script upstart "despliegue.conf" contendrá:

```
script
    cd /home/jcristobal/practicas3-4-DAI
    python practica3-4.py 0.0.0.0:8000
end script
```

Y usamos el playbook con `ansible-playbook despliegue.yml --ask-pass`

![imagen](http://i.imgur.com/UfpWJuV.png) 

Ya estaría desplegada, pero necesitamos definir los endpoints (primero hay que borrar el endpoint que teníamos ya configurado): `azure vm endpoint create -n http jcristobal 80 8000`

La aplicación debería estar disponible en: http://jcristobal.cloudapp.net/periodico/

![imagen](http://i.imgur.com/RiiHPWQ.png) 


###¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.

[Enlace a mi comentario del issue](https://github.com/IV-GII/GII-2013/issues/131#issuecomment-70383092)



##Ejercicio 6
###Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

Para instalar Vagrant ejecutamos `sudo apt-get install vagrant` y ya podemos trabajar con él.

Escogemos la máquina que queramos de las disponibles en su [web](http://www.vagrantbox.es/). Como nos dice el enunciado instalaremos Debian, por lo que escojo [Debian 6 Squeeze x64](http://www.emken.biz/vagrant-boxes/debsqueeze64.box)

Pero al querer instalar la máquina con `vagrant box add debian http://www.emken.biz/vagrant-boxes/debsqueeze64.box` me dice que con esta instalación está obsoleta, y que me descargue e instale [la actual](https://www.vagrantup.com/downloads)

Desistalo la que tenía instalada con `sudo gem uninstall vagrant` y me descargo de su web la actual.

Ya podemos trabajar con la versión correcta de Vagrant, escogemos la máquina que queremos de su [catálogo](https://atlas.hashicorp.com/boxes/search) y me la descargo: `vagrant init puphpet/debian75-x64`

![imagen](http://i.imgur.com/CqPUKbn.png)

E iniciamos la máquina: `vagrant up`

![imagen](http://i.imgur.com/w8xZRta.png)

Conectamos con ella con `vagran ssh`

![imagen](http://i.imgur.com/Qdr9fhL.png)



##Ejercicio 7
###Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica

Al archivo Vagrantfile añadimos las líneas:

```
config.vm.provision "shell",
inline: "sudo apt-get update && sudo apt-get install -y nginx && sudo service nginx restart && sudo service nginx status"
```

Y activamos el provisionamiento `vagrant provision`:

![imagen](http://i.imgur.com/1sLNH3K.png)


##Ejercicio 8
###Configurar tu máquina virtual usando vagrant con el provisionador ansible


Crearemos un archivo de inventario para indicar las máquinas con la que trabajaremos (ansible_hosts2), y lo almacenamos con `export ANSIBLE_HOSTS=~/ansible_hosts2`:

```
[puphpet/debian75-x64]
192.168.2.50
```

Cambiaremos la configuración en el Vagrantfile indicando la IP que tiene que conectarse y el playbook que usaremos, añadimos a "Vagrantfile":


```

  config.vm.network :private_network, ip: "192.168.2.50"


  config.vm.provision "ansible" do |ansible| 
    ansible.playbook = "playbook.yml"
  end

```

Y recargamos para que se guarden los cambios: `vagrant reload`

Nuestro playbook instalará Nginx, contenido de playbook.yml:

```
---
- hosts: vagrant
  sudo: yes
  tasks:
    - name: Actualizar lista de paquetes
      apt: update_cache=yes
    - name: Instalar Nginx
      apt: name=nginx state=present
```

y realizamos el provisionamiento con `vagrant provision`, lo podemos comprobar accediendo a la dirección IP de la máquina virtual: 192.168.2.50

![imagen](http://i.imgur.com/72cSVMm.png)


***
***

