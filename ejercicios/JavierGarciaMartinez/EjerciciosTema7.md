#Ejercicio 1#
##Instalar chef en la máquina virtual que vayamos a usar.##

Para realizar este ejercicio voy a instalarlo en mi máquina de Virtual Box

+ Lo primero será conectarme mediante *ssh*:

<code>ssh javi@maquinajavi.cloudapp.net</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-1.png">

+ Una vez conectados, ejecutaré el siguiente comando:

<code>sudo curl -L https://www.opscode.com/chef/install.sh | sudo bash</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-2.png">

INSTALACIÓN COMPLETADA

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-3.png">

#Ejercicio 2#
##Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.##

Para llevar a cabo este ejercicio, vamos a seguir los siguientes pasos:

+ En primer lugar, vamos a crear una carpeta "chef" <code>mkdir chef</code>, y dentro de ésta crearemos la carpeta "cookbooks" <code>mkdir cookbooks</code>. Ahora, dentro de "cookbooks", necesitaremos crear tres carpetas más: una para "nginx" <code>mkdir nginx</code>; otra para "emacs" <code>mkdir emacs</code>; y por último, otra carpeta para un "directorio" normal <code>mkdir ejercicioIV2</code>.

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-4.png">

+ El árbol de directorio quedará así:

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-5.png">

+ Ahora en los directorios "nginx", "emacs" y "ejercicioIV2", vamos a crear un archivo <code>metadata.rb</code> y una carpeta <code>recipes</code> con un fichero <code>default.rb</code>. Los comandos ejecutados se ven en la siguiente imagen:

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-6.png">

+ El árbol de directorios quedará así:

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-7.png">

+ En siguiente lugar, vamos a preparar los ficheros <code>metadata.rb</code> que acabamos de crear, ajustado cada uno a su receta:

NGINX --> metadata.rb

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-8.png">

NGINX --> default.rb

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-9.png">

EMACS --> metadata.rb

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-10.png">

EMACS --> default.rb

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-11.png">

EJERCICIOIV2 --> metadata.rb

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-12.png">

EJERCICIOIV2 --> default.rb

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-13.png">

+ Ahora vamos a necesitar crear 2 ficheros en la carpeta "chef": el fichero <code><solo.rb> y el fichero <code>node.json</code>.

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-14.png">

+ Estos dos ficheros quedará así:

SOLO.RB

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-15.png">

NODE.JSON

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-16.png">

+ El árbol de directorios estará ahora así con todo creado:

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-17.png">

+ Finalmente, vamos a proceder a ejecutarlo con el comando siguiente:

<code>sudo chef-solo -c solo.rb</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-18.png">

#Ejercicio 3#
##Escribir en YAML la siguiente estructura de datos en JSON
{ uno: "dos",
  tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }##
  
Escribiremos lo siguiente en YAML:

<code>
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
</code>

#Ejercicio 4#
##Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.##

Lo primero que vamos a hacer antes de nada será instalar *Ansible*. Para ello, ejecutaremos los siguientes comandos:

<code>sudo apt-get update</code>

<code>sudo apt-get install python-pip python-dev git-core -y</code> 

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-19.png">

<code>sudo pip install PyYAML jinja2 paramiko</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-20.png">

<code>git clone https://github.com/ansible/ansible.git</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-21.png">

<code>cd ansible</code>

<code>sudo make install</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-22.png">

<code>sudo mkdir /etc/ansible</code>

<code>sudo cp ~/ansible/examples/hosts /etc/ansible/</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-23.png">

Una vez hecho todo esto, lo que vamos a hacer es personalizar el fichero hosts:

<code>sudo nano ~/ansible_hosts</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-24.png">

Y seguidamente estableceremos la variable de entorno de la siguiente manera:

<code>export ANSIBLE_HOSTS=~/ansible_hosts</code>

Y ahora comprobaré que ansible funciona adecuadamente:

<code>sudo ansible all -u iblancasa -m ping</code>

Para finalizar con el ejercicio, vamos a desplegar la aplicación desde local. Para ello, ejecutaré lo siguiente:

<code>ansible all -u javi -m git -a "repo=https://github.com/javiergama8/Proyecto/wiki" --ask-pass</code>

#Ejercicio 5#
##1. Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.##

Para usar un playbook podemos crear un fichero pbook.yml. El contenido de un fichero así, será el siguiente:

<code>
hosts: azure
     sudo: yes
     remote_user: javi
     tasks:
        -name: Instalacion elems
            apt: name=g++ state=present
            apt: name=curl state=present
            apt: name=python state=present
                apt: name=python-psycopg2 state=present
            apt: name=libpq-dev state=present
                apt: name=git state=present
            apt: name=nodejs state=present
            apt: name=mongodb-org state=present
</code>

Una vez que ya tenemos creado el fichero, solo nos queda ejecutar lo siguiente:

<code>sudo ansible-playbook pbook.yml --ask-pass</code>

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-25.png">

##¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.##

Pues realmente de lo que hemos usado me quedaría principalmente con *Ansible*, ya que además de tener una sintaxis bastante sencilla y clara, podemos utilizar una gran cantidad de módulos interesantes.

#Ejercicio 6#
##Instalar una máquina virtual Debian usando Vagrant y conectar con ella.##

Lo primero que se hará, será isntalar *vagrant* en caso de no tenerlo.Para ello, se ejecuta el siguiente comando:

<code>sudo apt-get install vagrant</code>

Una vez instalado, descargaremos una imagen de *Debian* de [aquí](http://www.vagrantbox.es/).

<img src="https://github.com/javiergama8/Images/blob/master/Tema7-26.png">

Ahora vamos a proceder a descargar la imagen mediante el siguiente comando:

<code>sudo vagrant box add debian https://dl.dropboxusercontent.com/u/4775364/vagrant/debian-6.0.9-amd64-plain-vmware.box</code>

Ahora ya podremos iniciar la máquina mediante:

<code>vagrant up</code>

Y podremos conectarnos con ella ejecutando el siguiente comando:

<code>vagrant ssh</code>

#Ejercicio 7#
##Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica##

Nuestro Vagrantfile será el siguiente:

<code>
config.vm.provision "shell",
inline: "sudo su -c 'rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm' && sudo yum install -y nginx"
</code>

Y ahora vamos a activar el provisionamiento con:

<code>vagrant provision</code>

#Ejercicio 8#
##Configurar tu máquina virtual usando vagrant con el provisionador ansible##.

Lo primero es crear un archivo para indicar la máquina con la que trabajaremos. Como ya teníamos creado "ansible_host" de un ejercicio anterior, vamos a crear otro a parte para este ejercicio llamado "ansible_host2". El archivo quedará así:

<code>
[puphpet/debian75-x64]
192.168.122.1
</code>

Ahora lo almacenaremos en una variable:

<code>lo almacenamos con export ANSIBLE_HOSTS=~/ansible_hosts2</code>

El Vagranfile será el siguiente:

<code>
	config.vm.network :private_network, ip: "192.168.122.1"


  	config.vm.provision "ansible" do |ansible| 
    	ansible.playbook = "playbook.yml"
  	end
</code>

Ahora para que se lleve a cabo la instalación de *nginx*, nuestro playbook contendrá lo siguiente:

<code>
- hosts: vagrant
  sudo: yes
  tasks:
    - name: Actualizacion
      apt: update_cache=yes
    - name: Instalacion de Nginx
      apt: name=nginx state=present
</code>

Una vez tengamos los dos ficheros anteriores configurados, vamos a recargar vagrant para que los cambios se queden guardados:

<code>sudo vagrant reload</code>

Y al igual que en el ejercicio anterior, relizaremos el provisionamiento con <code>vagrant provision</code>

Finalmente, para acabar, accederemos al navegador introduciendo nuestra IP-->192.168.122.1 y *nginx* estará funcionando.


