#Gestión de infraestructuras virtuales

## Tema 7.

*Ejecicio1.* Instalar chef en la máquina virtual que vayamos a usar.

`sudo apt-get -y update`
`sudo apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev`
`cd /tmp`
`wget http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p481.tar.gz`
`tar -xvzf ruby-2.0.0-p481.tar.gz`
`cd ruby-2.0.0-p481/`
`./configure --prefix=/usr/local`
`makev`
`sudo make install`
`sudo gem install ohai chef`

*Ejecicio 2.* Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

*Ejecicio 3.* Escribir en YAML la siguiente estructura de datos en JSON

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

*Ejecicio 4.* Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

No estoy mátriculado en la asignatura de DAI.



*Ejecicio 6.* Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

En primer lugar intalamos vargrant ``` sudo apt-get install vagrant```.

Descargamos la imagen ```vagrant box add debian https://dl.dropboxusercontent.com/u/4775364/vagrant/debian-6.0.9-amd64-plain-vmware.box```

Para poder usarlo, crearemos un fichero Vagrant, mediante la siguiente orden vagrant init debian, ejecutamos y conectamos mediante:

```vagrant up```
```vagrant ssh```


*Ejecicio 7.* Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica.

Nuestro script será el siguiente: 

```
Vagrant.configure("2") do |config|
  config.vm.box = "debian"

  config.vm.provision "shell",
  inline: "sudo apt-get update && sudo apt-get install -y nginx && sudo service nginx start"

end
```

*Ejecicio 8.* Configurar tu máquina virtual usando vagrant con el provisionador ansible

Creación del fichero ansible_host: 

Una vez creado introducimos en nustra terminal ` xport ANSIBLE_HOSTS=~/ansible_hosts`

En el archivo vargranfile escribimo lo siguiente: 

```
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian"
  config.vm.network :private_network, ip: "192.168.1.55"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
```

```
  - hosts: debian
    sudo: yes
    tasks:
      - name: Actualización de lista de paquetes en repositorios
        apt: update_cache=yes
      - name: Instalación de Nginx
        apt: name=nginx state=present
      - name: Iniciar
        command: service nginx start
        
        ````

Y en terminal ejecutamos `vagrant provision`
