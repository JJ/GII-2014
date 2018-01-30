<strong> Ejercicio 1: Instalar chef en la máquina virtual que vayamos a usar.</strong>

Instalamos chef con el siguiente comando:
```
sudo curl -L https://www.opscode.com/chef/install.sh | sudo bash
```
<img src="http://i57.tinypic.com/98akvs.png"></img>

<strong> Ejercicio 2: Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.
</strong>

Creamos nuestra carpeta chef y dentro de ella creamos otra que se llame cookbooks:
```
mkdir chef
cd chef
mkdir cookbooks
```
Dentro de cookbooks creamos tres carpetas más para las recetas:
```
mkdir ejer2
mkdir emacs
mkdir nginx
```
En cada una de estas tres carpetas que acabamos de crear vamos a colocar un fichero llamado metadata.rb y una carpeta llamada recipes con un fichero default.rb:
```
cd ejer2
gedit metadata.rb
mkdir recipes
gedit default.rb
```
Repetimos el mismo procedimiento en cada una de las carpetas. Cuando lo hayamos creado deberíamos tener algo parecido a esto:

Ficheros metadata.rb:

<img src="http://i60.tinypic.com/ao7xih.png"></img>

<img src="http://i62.tinypic.com/sfh2eg.png"></img>

<img src="http://i57.tinypic.com/xbxug4.png"></img>

Ahora, dentro de la carpeta chef, creamos los ficheros solo.rb y node.json dejándolos de la siguiente manera:

<img src="http://i59.tinypic.com/15xvd4w.png"></img>

<img src="http://i57.tinypic.com/scgvwi.png"></img>

Ahora preparamos los ficheros default.rb incluidos dentro de la carpeta recipe. Los dejamos de la siguiente forma:

<img src="http://i58.tinypic.com/vi0ais.png"></img>

<img src="http://i60.tinypic.com/33uzf2r.png"></img>

<img src="http://i59.tinypic.com/riyp01.png"></img>

Cuando tengamos todo esto hecho, ejecutamos:
```
sudo chef-solo -c solo.rb
```

<strong> Ejercicio 3: Escribir en YAML la siguiente estructura de datos en JSON.{ uno: "dos",
  tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] } </strong>
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

<strong> Ejercicio 4: Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.
</strong>

Primero instalamos Ansible:
```
apt-get update
apt-get install python-pip python-dev git-core -y
pip install PyYAML jinja2 paramiko
git clone https://github.com/ansible/ansible.git
cd ansible
make install
mkdir /etc/ansible
cp ~/ansible/examples/hosts /etc/ansible/
```
<img src="http://i58.tinypic.com/2lo24wi.png"></img>

Para establecerlo como predeterminado configuramos la variable de entorno:
```
export ANSIBLE_HOSTS=~/ansible_hosts
```
Yo voy a subir el repositorio del proyecto de IV. Para ello haríamos:
```
ansible all -u marcosjimenez -m git -a "repo=https://github.com/TransparenciaUGR/Proyecto-IV" --ask-pass
```

<strong> Ejercicio 5: 
1. Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.</strong>

Un playobook de Ansible es un fichero .yml donde pondremos la configuración. En mi caso sería lo siguiente:
```
- hosts: azure
     sudo: yes
     remote_user: marcosjimenez
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
```
Al igual que antes, no puedo probar esta configuración debido a que no poseo cuenta de Azure. Es solo una orientación de cómo se haría.

<strong> 2. ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.</strong>

Personalmente prefiero Ansible. He tenido muchos problemas para instalar Chef, teniendo que buscar mucha documentación hasta conseguir instalarlo. Ansible he podido instalarlo y configurarlo rápidamente, aunque lamentablemente no he podido comprobar que los resultados finales sean correctos.

<strong> Ejercicio 6:
Instalar una máquina virtual Debian usando Vagrant y conectar con ella.
</strong>

Empezamos instalando Vagrant:
```
sudo apt-get install vagrant
```
En mi caso voy a instalar con Vagrant CentOS 5.6 32 bits. Se hace de la siguiente forma:
```
vagrant box add CentOS5.6 http://yum.mnxsolutions.com/vagrant/centos_56_32.box
```
<img src="http://i61.tinypic.com/34r8wgw.png"></img>

A continuación lo ejecutamos:
```
vagrant init CentOS5.6
```
<img src="http://i59.tinypic.com/2ep4lkn.png"></img>

Si todo ha salido correctamente, podríamos arrancar con:
```
vagrant ssh
```
Nota: Si deseamos parar la máquina o destruirla, usaremos, respectivamente:
```
vagrant halt
vagrant destroy
```

<strong> Ejercicio 7:
Crear un script para provisionar 'nginx' o cualquier otro servidor web que pueda ser útil para alguna otra práctica
</strong>

Especificamos lo siguiente en el Vagrant file:
```
config.vm.provision "shell",
inline: "sudo su -c 'rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-5.6.noarch.rpm' && sudo yum install -y nginx"
```

<strong> Ejercicio 8:
Configurar tu máquina virtual usando vagrant con el provisionador ansible
</strong>

En primer lugar localizamos la IP de nuestra máquina Vagrant. En la terminal escribimos:
```
/sbin/ip addr
```
Una vez tengamos la IP accedemos al siguiente archivo:
```
sudo gedit ~/ansible_hosts
```
Y añadimos lo siguiente:
```
[Nombre de la máquina]
IP de la máquina Vagrant
```
En nuestro fichero de Vagrant introducimos lo siguiente:
```
config.vm.provision "ansible" do |ansible| 
ansible.playbook = "Vagrant.yml"
```
Y creamos su fichero .yml correspondiente añadiendo:
```
hosts: vagrant
  sudo: yes
- name: actualizar todos los paquetes
  yum: name=* state=latest

- name: instalar las development tools
  yum: name="@Development tools" state=present
```
Por último, ejecutamos el script de aprovisionamiento:
```
vagrant provision
```
