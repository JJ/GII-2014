#### 1. Instalar chef en la máquina virtual que vayamos a usar


Para ello nos basta con hacer:

`sudo apt-get install ruby1.9.1 ruby1.9.1-dev rubygems`
`sudo gem install ohai chef`

Para ello previamente tenemos que tener instalado Ruby



#### 3. Escribir en YAML la siguiente estructura de datos en JSON { uno: "dos",tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }

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



#### 4. Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

He decidido a utilizar Koding ya que no dispongo de cuenta Azure y usaré la prática final desarrollada en el grupo ivaerospace.


Primero necesitamos generar una clave ssh para poder tener acceso a Koding:

`ssh-keygen -t rsa -C "ivaerospace2014@gmail.com"`


Una vez introducimos la contraseña nos dará el 'key fingerprint' y tendremos que unirla al ssh-agent

`eval "$(ssh-agent -s)"`
`ssh-add ~/.ssh/id_rsa`

Después de esto abirermos el "~/.ssh/id_rsa.pub", cogemos el contenido y lo metemos en 'authorized_keys', que estará en la máquina Koding.

`mkdir -p ~/.ssh`
`touch ~/.ssh/authorized_keys`

Añadimos la clave pública en 'authorized_keys' y ya podremos acceder mediante ssh.


Ahora para usar Ansible, crearemos un fichero con las máquina que usa el anfitrión. Añadimos en ansible_hosts

Antes de poder usar Ansible, tenemos que crear un fichero inventario con todas las máquinas controladas por la máquina anfitriona. Para ello en ansible_hosts introducimos:

[koding]
ivaerospace.koding.io
export ANSIBLE_HOSTS=~/ansible_hosts
echo $ANSIBLE_HOSTS
ansible koding -u ariacus -m ping 

Instalamos git en la máquina y desde el anfitrion hacemos el despliegue con Ansible

ansible koding -m git -a "repo=https://github.com/julioxus/iv-aerospace.git dest=~/iv-aerospace version=HEAD"





#### 5.1 Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

Para ello tendremos que crear nuestro playbook (provisionamiento.yml) el cual lanza un demonio creado para desplegar automáticamente en
Koding.

Ejecutamos usando:

ansible-playbook provisionamiento.yml

Y ya está.

![](http://i.imgur.com/UgKLRE3.png)


#### 5.2 ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.

Ansible hemos visto en la realiazción de la práctica que es bastante mas fácil de usar.


#### 6. Instalar una máquina virtual Debian usando Vagrant y conectar con ella.


En el anfitrión usar:

sudo apt-get install vagrant

Después haremos lo siguiente para descargarla:

vagrant box add debian  vagrant init https://dl.dropboxusercontent.com/u/197673519/debian-7.2.0.box

Después de esto lo iniciamos:

vagrant init debian

De esta forma nos habrá creado un Vagrantfile. Ya podremos trabajar con la máquina:

vagrant up

Y también conectarnos mediante ssh

vagrant ssh



#### 7. Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica


Para ello simplemente tenemos que añadir en el archivo Vagrantfile:

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian"

  config.vm.provision "shell",
  inline: "sudo apt-get update && sudo apt-get install -y nginx && sudo service nginx start"

end

Y provisionar la máquina:

`vagrant provision`


#### 8. Configurar tu máquina virtual usando vagrant con el provisionador ansible

Comenzamos la configuración añadiendo en el fichero ansible_host la IP de nuestra máquina como se muestra a continuación:

[vagrant]
192.168.1.36
El siguiente paso es indicarle a Ansible que tiene que usar este fichero usando export ANSIBLE_HOSTS=~/ansible_hosts y posteriormente introduciendo la linea config.vm.network :private_network, ip: "192.168.1.36" con una IP desde la que podamos acceder desde nuestro ordenador todo ello en el fichero Vagrantfile.

Ahora, nos creamos el playbook para que Ansible que nos instale en la máquina Nginx. El fichero playbook quedaría con el siguiente contenido:

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian"
  config.vm.network :private_network, ip: "192.168.1.36"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end





Añadimos al playbook nginx:

  - hosts: vagrant
    sudo: yes
    tasks:
      - name: Actualizar paquetes
        apt: update_cache=yes
      - name: Instalar Nginx
        apt: name=nginx state=present
      

A continuación, procedemos a aprovisionar la máquina al igual que hemos hecho en el ejercicio anterior, lanzando por línea de comandos:

`vagrant provision`


![](http://i.imgur.com/3mcsxIL.png)















