# Jose Carlos Sánchez Hurtado

# Ejercicios tema 7

## Ejercicio 1

#### Instalar chef en la máquina virtual que vayamos a usar.

Instalo chef sobre la máquina en la que realizo los ejercicios:

`sudo curl -L https://www.opscode.com/chef/install.sh | sudo bash`

![](http://fotos.subefotos.com/e788ce39b188892f0a97623fe1d2e79bo.png)


## Ejercicio 3

#### Escribir en YAML la siguiente estructura de datos en JSON: 

{ uno: "dos", tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }

En YAML:

```sh
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


## Ejercicio 5

#### 2. ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?. 

[Mi comentario](https://github.com/IV-GII/GII-2013/issues/131#issuecomment-72314725)


## Ejercicio 6

#### Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

El primer paso es instalar Vagrant:

`sudo apt-get install vagrant`

Una vez instalado, elegimos la distribución que queramos en la [página oficial de vagrantbox](http://www.vagrantbox.es/). Una vez elegida, copiamos la url correspondiente y se la introducimos como argumento al comando add de vangrant:

`vagrant box add debian https://dl.dropboxusercontent.com/u/4775364/vagrant/debian-6.0.9-amd64-puppet-vmware.box`

![](http://fotos.subefotos.com/6cdd941911ee95beefa3b1738b6e58abo.png)

Ahora introducimos el comando `vagrant init debian`

![](http://fotos.subefotos.com/1ea5df3e990c6f52f836b5d366de35a3o.png)

Para levantar el entorno virtual hacemos caso del mensaje que nos aparece y ejecutamos `vagrant up`, y para acceder a ella ejecutamos `vagrant ssh`.


## Ejercicio 7

#### Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica

Para usar nginx en nuestra máquina ejecutada en Vagrant especifico el inline del Vagrantfile que se encargará del aprovisionamiento. Para ello, en el fichero Vangrantfile introducimos la siguiente linea,

`config.vm.provision "shell", inline: "sudo su -c 'rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm' && sudo yum install -y nginx"`

quedando el documento así:

![](http://fotos.subefotos.com/0b87cba5d197d09cc7327049f509a22eo.png)


## Ejercicio 8

#### Configurar tu máquina virtual usando vagrant con el provisionador ansible

Primero creamos el archivo de inventario en el que se indican las máquinas que usaremos(ansible_hosts2), y lo almacenamos con `export ANSIBLE_HOSTS=~/ansible_hosts2`:

```
[puphpet/debian75-x64]
192.168.122.1
```

Ahora en el Vagrantfile cambiamos la configuración con la IP que tiene que conectarse y el playbook que usaremos:

```
  config.vm.network :private_network, ip: "192.168.2.50"


  config.vm.provision "ansible" do |ansible| 
    ansible.playbook = "playbook.yml"
  end
```

Recargamos con `vagrant reload` e instalamos Nginx en nuestro playbook.yml:

```
- hosts: vagrant
  sudo: yes
  tasks:
    - name: Actualizar lista de paquetes
      apt: update_cache=yes
    - name: Instalar Nginx
      apt: name=nginx state=present
```

Por último hacemos el provisionamiento con `vagrant provision`.
