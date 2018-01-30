##TEMA 7

#Gestión de infraestructuras virtuales


* [+]Ejercicio 1
 - A) Instalar chef en la máquina virtual que vayamos a usar

Lo primero que debemos de hacer es instalar Ruby y Ruby gema en casi de que no lo tengamos instalado en nuestro sistema operativo. Si no lo tiene sinstalado solo hay que instarlo con los siguientes comandos:

    sudo apt-get install ruby1.9.1 ruby1.9.1-dev rubygems

[Ver captura de pantalla](https://www.dropbox.com/s/r5pw790961nx18s/Captura%20de%20pantalla%202015-01-27%20a%20la%28s%29%2012.12.34.png?dl=0)

Cuando ya lo tengamos instalado o si ya lo teniamos instalado con anterioridad, vamos a instalar "chef" usando el siguiente comando:

    sudo gem install ohai chef

[Ver captura de pantalla](https://www.dropbox.com/s/y5ha2mykw14qr9t/Captura%20de%20pantalla%202015-01-27%20a%20la%28s%29%2012.16.28.png?dl=0)

Pero otra alternativa más sencilla es haciendo la ejecución de un scritp ya creado, para ello usamos el siguiente comando:

    curl -L https://www.opscode.com/chef/install.sh | sudo bash

[Ver captura de pantalla](https://www.dropbox.com/s/ffvtt2rr814oi2c/Captura%20de%20pantalla%202015-01-27%20a%20la%28s%29%2012.25.55.png?dl=0)

* [+]Ejercicio 2
 - A) Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

Lo primero que debemos de hacer es crear los directorios donde se almacenarán nuestras recetas(con el comando mkdir seguido del nombre que le vayamos a dar a los directorios):

    mkdir -p chef/cookbooks/geany/recipes
    mkdir -p chef/cookbooks/nginx/recipes

[Ver captura de pantalla](https://www.dropbox.com/s/zcclv1p9eiz54e2/Captura%20de%20pantalla%202015-01-27%20a%20la%28s%29%2012.36.15.png?dl=0)

El siguiente paso será, configurar los ficheros que contendrán las recetas para instalar "geany" y "nginx".
Entonces para ello vamos a crear dentro de cada uno de los directorios creados con anterioridad(/geany/recipes y /nginx/recipes) el fichero default.rb, que es el que contendrá la receta para instalar el editor "geany" y "nginx". Esto creará un directorio en "/home/walker/Documents" y dentro de él un fichero cn el nombre que nosottros queramos.

default.rb(para geany)

   ```
   #!usr/bin/ruby
   
   package 'geany'
   directory "/home/Documents/geany"
       owner "walker"
       group "walker"
       mode 00544
       action :create
       content "Directorio"
   end
   ```
[Ver](https://www.dropbox.com/s/7mr9kgg7urbeatq/Captura%20de%20pantalla%202015-01-27%20a%20la%28s%29%2012.55.07.png?dl=0)

default.rb(para nginx)

   ```
   #!usr/bin/ruby
   
   package 'nginx'
   directory "/home/Documents/nginx"
       owner "walker"
       group "walker"
       mode 00544
       action :create
       content "Directorio"
   end
   ```

[Ver](https://www.dropbox.com/s/ywwd76zad030tm7/Captura%20de%20pantalla%202015-01-27%20a%20la%28s%29%2013.00.40.png?dl=0)

[Ver](https://www.dropbox.com/s/babomuxld2amd1m/Captura%20de%20pantalla%202015-01-27%20a%20la%28s%29%2012.51.05.png?dl=0)

Una vez realizado lo anterior, debemos de configurar el fichero "node.json", que contendrá las referencias a nuestras recetas:

```
   {
        "run_list":["recipe[geany]", "recipe[nginx]"]
   }
```
[Ver](https://www.dropbox.com/s/xkrooyxmb1fj8s0/Captura%20de%20pantalla%202015-01-27%20a%20la%28s%29%2013.07.25.png?dl=0)

El último paso que debemos de dar es configurar el fichero "solo.rb" con la siguiente insfomación:

   ```
   #!usr/bin/ruby
   
   file_cache_path "/home/Documents/chef"
   cookbook_path "/home/Documents/chef/cookbooks"
   json_attribs "/home/Documents/chef/node.json"
   ```

[Ver](https://www.dropbox.com/s/agy0ifolnlf1sko/Captura%20de%20pantalla%202015-01-27%20a%20la%28s%29%2013.09.33.png?dl=0)

[Ver estructura final](https://www.dropbox.com/s/pme9iv2sl4kswj6/Captura%20de%20pantalla%202015-01-27%20a%20la%28s%29%2013.05.26.png?dl=0)

Si hemos realizado todos los pasos anteriores correctamente, podremos ejecutarlo desde el directorio raiz con el siguiente comando:

    chef-solo -c chef/solo.rb

[Ver](https://www.dropbox.com/s/lc55bheiz2u0uon/Captura%20de%20pantalla%202015-01-27%20a%20la%28s%29%2013.10.30.png?dl=0)

* [+]Ejercicio 3
 - A) Escribir en YAML la siguiente estructura de datos en JSON
"{ uno: "dos", tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }"

```
--- # 
 tres:
   - 4
   - 5
   - "Seis"
   -
     siete: 8
     nueve:
       - "Object"
 uno: "dos"

---
```


* [+]Ejercicio 4
 - A) Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.
 - 
Lo primero que debemos de hacer antes de comenzar es instalar en nuestro ordenador, ansible, porque desde este gestionaremos de forma remoto lso démas sistemas.

Para ello vamos a instalar "pip", que tiene los paquetes y dependecias para posteriormente instalar ansible:

    apt-get install python-pip

Ahora procedemos a instalar "ansible", con el siguiente comando:

    pip install paramiko PyYAML jinja2 httplib2 ansible

Ahora tenemos que crear el archivo de inventario y añadimos las urls de nuestros sistemas para conectarnos remotamente(Azure).

    [azure]
    app-conf2.cloudapp.net

[Ver](https://www.dropbox.com/s/l90480e4ihxlebh/Captura%20de%20pantalla%202015-01-29%20a%20la%28s%29%2018.22.50.png?dl=0)

Se le pone "[azure]" porque de estra manera nos sirve para poder referirnos a todas las máquinas a la vez que esten en "azure".

Ahora procedemos a exportat el archivo de inventario a una variable global para que al ejecutar ansible recoja la información:

    export ANSIBLE_HOSTS=~/ansible_hosts

Lo siguiente es configurar el acceso mediante "ssh", para esto debemos de enviar nuestra clave "ssh" a nuestro sistema remoto "app-conf1.cloudapp.net":

    ssh-copy-id -i ~/.ssh/id_rsa.pub walker@app-conf2.cloudapp.net

Ahora comprobamos si desde la máquina anfitrión podemos acceder a la máquina externa, para ello hacemos:

    ansible all -u walker -m ping

Si todo ha ido bien, nos saldrá en color verde el activo.

[Ver](https://www.dropbox.com/s/671wsl892cre0zy/Captura%20de%20pantalla%202015-01-29%20a%20la%28s%29%2018.23.39.png?dl=0)

Una vez realizados los pasos anteriores y si todo a salido bien como se ha explicado, nos descargamos un repositorio de git con un proyecto ya terminado del año pasado[SocialCookies](https://github.com/IV-GII/SocialCookies.git):

    ansible azure -m git -a "repo=https://github.com/IV-GII/SocialCookies.git dest=~/SocialCookies"

Si todo esta bien, nos aparecerá "success", que indica que se ha clonado correctamente.

[Ver](https://www.dropbox.com/s/1adc2ufnfs7vuzj/Captura%20de%20pantalla%202015-01-29%20a%20la%28s%29%2018.24.56.png?dl=0)

Para poder clonar un repositorio con git hay que indicar el repositorio con repo, la carpeta de destino con dest y la versión en caso de querer alguna especifica con version

* [+]Ejercicio 6
 - A) Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

Lo primero es instalr "Vagrant" en caso de que no este instalado con el comando:

    apt-get install vagrant
El siguiente paso que debemos de dar, es descargar la imagen de "Debian" con Vagrant.[Ver más imagenes soportadas](http://www.vagrantbox.es/). Solo tenemos que poner el siguiente comando:

    vagrant box add debian-squeeze http://ergonlogic.com/files/boxes/debian-current.box

[Ver 1](https://www.dropbox.com/s/fcx51lbt0vfssce/Captura%20de%20pantalla%202015-01-27%20a%20la%28s%29%2013.24.07.png?dl=0)
[Ver 2](https://www.dropbox.com/s/hbl6pg84nm8cjhg/Captura%20de%20pantalla%202015-01-29%20a%20la%28s%29%2017.02.31.png?dl=0)

Una vez que se haya hecho la descarga, procedemos a crear el archivo de configuración "Vagrantfile" con el siguiente comando:

    vagrant init debian-squeeze

[Ver captura de pantalla](https://www.dropbox.com/s/nmi1kgg9lpbwnl5/Captura%20de%20pantalla%202015-01-29%20a%20la%28s%29%2017.05.10.png?dl=0)

Una vez creado el archivo de configuración solo queda arrancar nuestra máquina con el siguiente comando:

    vagrant up

[Ver](https://www.dropbox.com/s/51wo49rt7xq9zf0/Captura%20de%20pantalla%202015-01-29%20a%20la%28s%29%2017.20.28.png?dl=0)

* [+]Ejercicio 7
 - A) Crear un script para provisionar `nginx` o cualquier otro servidor
web que pueda ser útil para alguna otra práctica.

El primer paso que debemos de dar es editar el fichero "Vagrantfile" como se sigue:

```
 # -*- mode: ruby -*-
 # vi: set ft=ruby :

 Vagrant.configure("2") do |config|
 config.vm.box = "debian-squeeze"
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end
  config.vm.provision "shell",
    inline: "sudo apt-get install -y nginx && sudo service nginx restart && sudo service nginx status"
 end
```

[Ver captura de pantalla](https://www.dropbox.com/s/oy0xuwir895o5f3/Captura%20de%20pantalla%202015-01-29%20a%20la%28s%29%2017.33.19.png?dl=0)

Una vez que tengamos hechas las modificaciones mostradas anteriormente, tenemos que ejecutar nuestra máquina con el siguiente comando:

    vagrant provision

Este comando hará que se ejecuten los comandos que necesitamos para el aprovisionamiento.

[Ver captura de pantalla](https://www.dropbox.com/s/oc9rsyz4htrfc38/Captura%20de%20pantalla%202015-01-29%20a%20la%28s%29%2017.36.40.png?dl=0)

* [+]Ejercicio 8
 - A) Configurar tu máquina virtual usando vagrant con el provisionador
ansible.

Ahora en este ejercicio vamos a seguir los mismos pasos que en el ejercicio anterior, pero en este caso vamos a añadir en el archivo "Vagrantfile" las líneas necesárias para que coja los playbooks de "ansible".

Lo primero que debemos de hacer es abrir nuestro archivo "Vagrantfile", y tenemos que borrar todo el contenido y sustituirlo por este nuevo contenido:

   ```
   VAGRANTFILE_API_VERSION = "2"
   
   Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
     config.vm.box = "debian-ansible"
     config.vm.network :private_network, ip: "192.168.53.101"
   
     config.vm.provision "ansible" do |ansible|
       ansible.playbook = "provisioning/playbook.yml"
       ansible.inventory_path = "provisioning/ansible_hosts"
   
     end
   end
   ```

[Ver](https://www.dropbox.com/s/jujfcg25n03xlwf/Captura%20de%20pantalla%202015-01-29%20a%20la%28s%29%2017.42.12.png?dl=0)

El siguiente paso es crear una carpeta "provisioning", donde guardaremos el archivo "playbooks.yml", que contendrá las tareas que deseamos que provisione "Vagrant" y el archivo "ansible_host".

[Ver](https://www.dropbox.com/s/zwvpstx2odbuj8p/Captura%20de%20pantalla%202015-01-29%20a%20la%28s%29%2017.44.59.png?dl=0)

El archivo playbook.yml contendrá lo siguiente:

    ```
    hosts: debian 
    sudo: yes 
    tasks:
      name: Actualizar 
      apt: update_cache=yes
      name: Instalar el servidor Nginx 
      apt: pkg=nginx state=present
      name: Arrancando el servidor NGINX 
      action: shell service nginx start
    ```

[Ver](https://www.dropbox.com/s/oi8hqn4t9ewglpx/Captura%20de%20pantalla%202015-01-29%20a%20la%28s%29%2017.50.10.png?dl=0)

Ya el último paso que debemos de dar antes de arrancar la máquina es, editar el archivo "ansible_host", para que contenga la "ip" que hemos puesto en el archivo de configuración de "Vagrantfile".

    [debian]
    192.168.53.101

[Ver](https://www.dropbox.com/s/xebckfiurqci8q2/Captura%20de%20pantalla%202015-01-29%20a%20la%28s%29%2017.51.20.png?dl=0)

Ahora y apodemos arrancar la máquina con:

    vagrant up

y provisionarla con:

    vagrant provision

Para acceder al servidor tan fácil como poner en el navegador la "ip" que le hemos asignado a la VM: 192.168.53.101
