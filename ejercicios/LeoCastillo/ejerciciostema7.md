##Ejercicio 1
###Instalar chef en la máquina virtual que vayamos a usar.

Instalamos chef con el siguiente comando:

`curl -L https://www.opscode.com/chef/install.sh | sudo bash`

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio1_1.png)


##Ejercicio 2
###Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

Creamos la carpeta `cookbooks` que contenga una receta para instalar el servidor web nginx, otra receta para instalar el editor emacs y otra que cree un directorio:

~~~
mkdir cookbooks
~~~

~~~
mkdir emacs
mkdir nginx
mkdir ejercicio2
~~~

Dentro de cada carpeta creamos un fichero `metadata.rb` y una carpeta `recipes`, y dentro de `recipes` un fichero `default.rb` 

También creamos los ficheros `solo.rb` y `node.json`

El arbol de directorios nos quedaría de la siguiente manera:

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio2_1.png)


El archivo de configuración `solo.rb` tiene el siguiente contenido:

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio2_2.png)

Y el fichero `node.json`:

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio2_3.png)

Ahora editamos "metadata.rb" con los metadatos sobre las recetas:

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio2_4.png)

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio2_5.png)

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio2_6.png)

Y añadimos sus recetas en el fichero `default.rb`

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio2_7.png)

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio2_8.png)

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio2_9.png)


Por último, ejecutamos

~~~
sudo chef-solo -c solo.rb
~~~

##Ejercicio 3
###Escribir en YAML la siguiente estructura de datos en JSON: { uno: "dos", tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }

~~~
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
~~~


##Ejercicio 4
###Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

Creamos una máquina virtual en Azure:
~~~
sudo azure vm create maquinaleo b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB leo clave --location "West Europe" --ssh
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio4_1.png)

Nos conectamos a la máquina a través de ssh:
~~~
ssh leo@maquinaleo.cloudapp.net
~~~



A continuación instalamos ansible y git:

~~~
sudo apt-get update
sudo apt-get install ansible
sudo apt-get install git
~~~

Creamos el fichero inventario con el nombre "ansible_hosts"

~~~
[azure]
maquinaleo.cloudapp.net
~~~

Y por último desplegamos los fuentes de la aplicación:

~~~
ansible azure -m git -a "repo=https://github.com/leocm89/prueba_dai.git dest=~prueba_dai version=HEAD"
~~~



##Ejercicio 5
###Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

Para usar un playbook creamos el fichero playbook.yml:

~~~
- hosts: azure
     sudo: yes
     remote_user: leo
     tasks:
        - name: Instalar MongoDB
      	apt: name=mongodb-server state=present
        - name: Instalar python
        apt: name=python state=present
	- name: Instalar git
        apt: name=git state=present

~~~

Una vez creado ejecutamos lo siguiente: 
~~~
ansible-playbook playbook.yml
~~~

##Ejercicio 6
###Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

Instalamos Vagrant:

~~~
sudo apt-get install vagrant
~~~

Ahora nos descargamos una máquina configurada para Vagrant. Para ello podemos ver una lista [aquí](http://www.vagrantbox.es/)
~~~
vagrant box add debian http://dl.dropbox.com/u/54390273/vagrantboxes/Squeeze64_VirtualBox4.2.4.box
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio6_1.png)

Iniciamos la máquina:

~~~
vagrant init debian
~~~

Configuramos el archivo Vagrantfile indicandole que instale el editor "emacs" y que el box que vamos a usar es "debian"
		
![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio6_2.png)

Después iniciamos la máquina y nos conectamos por ssh:

~~~
vagrant up
vagrant ssh
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio6_3.png)


##Ejercicio 7
###Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica

Creamos el script al que llamaremos "nginx.sh":
~~~
#!/bin/bash
# Script para provisiona Nginx
sudo apt-get update && apt-get install -y nginx
sudo service nginx restart && sudo service nginx status
~~~

Y en el fichero Vagrantfile añadimos la siguiente linea `path: "nginx.sh`

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio7_1.png)


y provisionamos la máquina:

~~~
vagrant provision
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio7_2.png)


##Ejercicio 8
###Configurar tu máquina virtual usando vagrant con el provisionador ansible.

Para utilizar ansible tenemos que asignarle una dirección IP a la máquina vagrant para poder conectarse.

Para ello añadimos la IP al fichero Vagrantfile mediante la siguiente linea:

~~~
config.vm.network :private_network, ip: "192.168.2.2"
~~~

Recargamos la configuración:
~~~
vagrant reload
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio8_1.png)


Para indicarle que vamos a utilizar provisionamiento con ansible añadimos al fichero Vagrantfile lo siguiente:
~~~
config.vm.provision "ansible" do |ansible| 
    ansible.inventory_path = "ansible_hosts"
    ansible.playbook = "playbook.yml"
end
~~~

Y creamos el fichero inventario:
~~~
[debian]
192.168.2.2
~~~

Después creamos el fichero playbook.yml con el siguiente contenido:
~~~
---
- hosts: debian
  sudo: yes
  tasks:
    - name: Actualizar cache
      apt: update_cache=yes
    - name: Instalar Nginx
      apt: name=nginx state=present

~~~

Por último para aprovisionar ejecutamos el siguiente comando: 
~~~
vagrant provision
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio8_2.png)
![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema7/ejercicio8_3.png)
