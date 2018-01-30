#Tema 7
### Ejercicio 1
#####Instalar chef en la máquina virtual que vayamos a usar

Tras intentar sin exito instalar tal y como vemos en el guion, opte por descargar Ruby 2.2.0 desde la web he instalado chef con el siguiente comando:
```bash
curl -L https://www.opscode.com/chef/install.sh | sudo bash
```
![1](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/tema7-1.png)


###Ejercicio 2
#####Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

###Ejercicio 3
#####Escribir en YAML la siguiente estructura de datos en JSON:
#####{ uno: "dos",tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }
```yaml
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

###Ejercicio 4
#####Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

He utilizado los siguientes comando pasa instalar Ansible:
```bash
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```
Tras esto, Ansible esta instalado y listo para utilizar. Ahora copio mi clave publica para SSH y con la siguiente orden probamos a instalar varias cosas en mi maquina virtual como Ansible:

![2](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/tema7-2.png)
```bash
ansible all -u azureuser -m command -a "sudo apt-get install git python"
ansible all -u azureuser -m command -a "sudo apt-get install python-pip -y"
ansible all -u azureuser -m command -a "sudo pip install web.py"
ansible all -u azureuser -m git -a "repo=https://github.com/IV-2014/VirtualBoard.git dest=~/VirtualBoard version=HEAD"
ansible all -u azureuser -m command -a "npm install /home/azureuser/VirtualBoard/ServerConfiguration/serverSocket"
ansible all -u azureuser -m command -a "node /home/azureuser/VirtualBoard/ServerConfiguration/serverSocket"
azure vm endpoint create -n http angeljcc 80 8080
```


###Ejercicio 5
#####1. Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible. ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.
Para mi, Ansible ha sido mucho mas facil de manejar
```yaml
- hosts: azure
  sudo: yes
  tasks:
  - name: Instalar paquetes 
    apt: name=nodejs state=present
    apt: name=git state=present
    apt: name=npm state=present
  - name: Clonando Repositorio desde git
    command: git clone  https://github.com/IV-2014/VirtualBoard.git
  - name: Iniciar
    command: node /home/VirtualBoard/ServerConfiguration/serverSocket/server.js
```
Para lanzar el fichero utilizamos:
```bahs
ansible-playbook ejercicio5.yml -u azureuser
```

###Ejercicio 6
#####Instalar una maquina virtual Debian usando Vagrant y conectar con ella.
Primero instalamos vagrant con:
```bash
sudo apt-get install vagrant
```
He descargado Debia 7.7.0:
```bash
vagrant box add debian https://github.com/kraksoft/vagrant-box-debian/releases/download/7.7.0/debian-7.7.0-amd64.box
```
![3](https://github.com/JavideBaza/GII-2014/blob/master/ejercicios/JavierArandaIzquierdo/Capturas/tema7-3.png)
Y para usar la imagen descargada, creamos un archivo Vagrant, con el comando:
```bahs
vagrant init debian
```
Y lo ejecutamos con las ordenes:
```bash
vagrant up
vagrant ssh
```

###Ejercicio 7
#####Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica
El scrpt seria este:
```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "debian"

  config.vm.provision "shell",
  inline: "sudo apt-get install -y nginx"

end
```

###Ejercicio 8
#####Configurar tu máquina virtual usando vagrant con el provisionador ansible
	