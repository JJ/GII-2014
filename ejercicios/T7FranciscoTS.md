#TEMA 7: Gestión de infraestructuras virtuales#

##Ejercicio 1##

#####Instalar chef en la máquina virtual que vayamos a usar#####

Para instalar Chef usamos este comando:

```shell
sudo curl -L https://www.opscode.com/chef/install.sh | sudo bash
```


###Ejercicio 3###

#####Escribir en YAML la siguiente estructura de datos en JSON#####
#####{ uno: "dos", tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }#####

```shell
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


###Ejercicio 5###

#####¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.#####

[Mi comentario] (https://github.com/IV-GII/GII-2013/issues/131#issuecomment-72314725)


###Ejercicio 6###

#####Instalar una máquina virtual Debian usando Vagrant y conectar con ella.#####

El primer paso es instalar Vagrant:

```shell
sudo apt-get install vagrant
```

Una vez instalado, elegimos la distribución que queramos en la página oficial de vagrantbox. Una vez elegida, copiamos la url correspondiente y se la introducimos como argumento al comando add de vangrant:

```shell 
vagrant box add debian https://dl.dropboxusercontent.com/u/4775364/vagrant/debian-6.0.9-amd64-puppet-vmware.box
```

Ahora introducimos el comando: 

```shell
vagrant init debian
```

Para levantar el entorno virtual hacemos caso del mensaje que nos aparece y ejecutamos:

```shell
vagrant up
```

Y para acceder a ella ejecutamos: 

```shell
vagrant ssh
```


###Ejercicio 7###

#####Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica#####

Para usar nginx en nuestra máquina ejecutada en Vagrant especifico el inline del Vagrantfile que se encargará del aprovisionamiento. Para ello, en el fichero Vangrantfile introducimos la siguiente linea,

```shell
config.vm.provision "shell", inline: "sudo su -c 'rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm' && sudo yum install -y nginx"
```


###Ejercicio 8###

#####Configurar tu máquina virtual usando vagrant con el provisionador ansible#####

Primero creamos el archivo de inventario en el que se indican las máquinas ansible_hosts, y lo almacenamos con:

```shell
export ANSIBLE_HOSTS=~/ansible_hosts:

```

```shell
[debian]
192.168.73.5
```

Ahora en el Vagrantfile cambiamos la configuración con la IP que tiene que conectarse y el playbook que usaremos:

```shell
  config.vm.network :private_network, ip: "192.168.73.5"


  config.vm.provision "ansible" do |ansible| 
    ansible.playbook = "playbook.yml"
  end
```

Recargamos con vagrant reload e instalamos Nginx en nuestro playbook.yml:

```shell
- hosts: vagrant
  sudo: yes
  tasks:
    - name: Actualizar lista de paquetes
      apt: update_cache=yes
    - name: Instalar Nginx
      apt: name=nginx state=present
      
```
Por último hacemos el provisionamiento con:

```shell
vagrant provision.
```
