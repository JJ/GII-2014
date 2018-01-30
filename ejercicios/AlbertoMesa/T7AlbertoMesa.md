
#Alberto Mesa Navarro
##Gestión de configuraciones
##Ejercicios del Tema 7

###Ejercicio 1
####Instalar chef en la máquina virtual que vayamos a usar.

Vamos a utilizar la MV en Azure que creamos en el tema anterior. Nos conectamos mediante SSH y ejecutamos el comando que viene en los apuntes del tema:

`sudo curl -L https://www.opscode.com/chef/install.sh | sudo bash`

![1](http://s23.postimg.org/e3trtmicb/chefinstalacaion.png)


###Ejercicio 2
####Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

Creamos nuestra carpeta `chef` y dentro de la misma crearemos la carpeta `cookbooks` para nuestras recetas.
Como vamos a hacer 3 recetas, dentro de cookbooks creamos la carpeta de cada una de las recetas: `mkdir Ejercicio2`, `mkdir emacs` y `mkdir nginx`. 

A su vez, cada una de estas 3 carpetas va a contener un fichero `metadata.rb` y una carpeta `recipes`, con un fichero `default.rb` dentro y ajustado a cada una de las recetas.

Necesitamos 2 ficheros esenciales en la carpeta chef: `solo.rb` y `node.json`: 

Nuestro fichero `solo.rb`:

![9](http://s29.postimg.org/717ydycmf/solo2.png)

Y `node.json`:

![8](http://s1.postimg.org/ltc7s6y3z/node.png)

Ahora preparamos nuestos ficheros `metadata.rb`:

![2](http://s27.postimg.org/kwfswkgf7/Ej2.png)
 
![3](http://s2.postimg.org/5a3dpo3cp/emacs.png)

![4](http://s14.postimg.org/u7xcqwahd/nginx.png)

Y nuestros ficheros `recipes/default.rb`:

![5](http://s14.postimg.org/qfx4wvmdt/pk1.png)

![6](http://s24.postimg.org/d69nqljyt/pk2.png)

![7](http://s3.postimg.org/j2l3o1yub/pk3.png)

Si hemos seguido correctamente los pasos la cosa debe quedar así:

![10](http://s9.postimg.org/64zma2olb/tree.png)

Una vez preparados ejecutamos: `sudo chef-solo -c solo.rb`

![11](http://s10.postimg.org/y0eae6dk9/cheffinal.png)



###Ejercicio 3
####Escribir en YAML la siguiente estructura de datos en JSON: { uno: "dos", tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }

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


###Ejercicio 4
####Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.


Si vamos a usar Ansible, lo primero será instalarlo. Seguiremos los pasos que nos indican [aquí](https://devopsu.com/guides/ansible-ubuntu-debian.html):

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
Configuramos tal como nos indican [aquí](https://devopsu.com/guides/ansible-post-install.html):

Personalizamos el fichero hosts: `sudo gedit ~/ansible_hosts`:

```shell
[azure]
albertomesa.cloudapp.net
```

Y para establecerlo como predeterminado configuramos la variable de entorno:`export ANSIBLE_HOSTS=~/ansible_hosts`

Como no estoy cursando DAI, voy a desplegar la repo del proyecto de IV. Para ello solo nos queda ejecutar el comando:

`ansible all -u albertomesa -m git -a "repo=https://github.com/TransparenciaUGR/Proyecto-IV" --ask-pass`

Y con esto ya lo tendríamos.


###Ejercicio 5
####5.1 Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

Para usar un playbook podemos crear un fichero *.yml, por ejemplo playb.yml:

```shell
- hosts: azure
	 sudo: yes
	 remote_user: albertomesa
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

Una vez creado solo hay que ejecutar: `ansible-playbook playb.yml --ask-pass`

####5.2 ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.

Particularmente prefiero Chef. Me ha gustado la organización más modular con metadata.rb y default.rb, y además Ansible me ha dado algunos problemas. Chef quizás sea más tedioso pero ha funcionado desde el principio y he encontrado más documentación.

###Ejercicio 6
####Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

Comenzamos con la instalación de Vagrant: `sudo apt-get install vagrant`.

Como sabemos, para trabajar con Vagrant contamos con una series de Boxes disponibles de los cuales nos proveen la URL. Podemos consultarlas en la [web de Vagrant](http://www.vagrantbox.es/):

![12](http://s10.postimg.org/8jsjpomy1/vagrantlisra.png)

El comando por defecto es vagrant-add, así que una vez decidamos cual vamos a descargar (yo descargaré **CentOS Minimal**) se la pasamos como parámetro:

`vagrant box add CentOS6.4 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-i386-v20131103.box`

![13](http://s2.postimg.org/odkuhcws9/image.png)

A continuación inicializamos: `vagrant init CentOS6.4`.

Como el propio mensaje de Vagrant indica, el **Vagrantfile** se ha creado estamos lsito para levantar el entorno virtual. El propio mensaje nos recuerda, además, que el siguiente paso es ejecutar `vagrant up`.

![14](http://s14.postimg.org/e6emd4vm9/image.png)

Por último, accedemos a nuestra máquina: `vagrant ssh`.

![15](http://s15.postimg.org/6u8mcvk97/image.png)

Para detener la máquina, ejecutaremos `vagrant halt` y para destruirla `vagrant destroy`

###Ejercicio 7
####Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica.

Para provisionar nginx en nuestra máquina corriendo en Vagrant tendremos que especificar el inline del Vagrantfile que se encargará del aprovisionamiento. Como hemos instalado CentOS 6 Minimal, necesitaremos añadir el repositorio y utilizar yum:

```shell
config.vm.provision "shell",
inline: "sudo su -c 'rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm' && sudo yum install -y nginx"
```
![15](http://s27.postimg.org/5rv82xw6b/inline.png)


###Ejercicio 8
####Configurar tu máquina virtual usando vagrant con el provisionador ansible.

Tendremos que sobreescribir el fichero de hosts de Ansible para usarlo con la máquina de Vagrant. Como esta vez no accedemos mediante un DNS de internet (así hacíamos con Azure) vamos a usar la ip de la máquina en Vagrant, que consultarmos accediendo y ejecutando `/sbin/ip addr`:

![16](http://s24.postimg.org/fgs6v4jth/vip.png)

Ahora que tenemos la ip:

`sudo gedit ~/ansible_hosts`:

```shell
[CentOS6.4]
10.0.2.15
```

Modificamos nuestro Vagrantfile:

```shell
config.vm.provision "ansible" do |ansible| 
ansible.playbook = "Vagrant.yml"
```
Y creamos su *.yml específico:

```shell
hosts: vagrant
  sudo: yes
- name: actualizar todos los paquetes
  yum: name=* state=latest

- name: instalar las development tools
  yum: name="@Development tools" state=present
```
Como en el casi anterior, ejecutamos el script de aprovisionamiento:

`vagrant provision`.


