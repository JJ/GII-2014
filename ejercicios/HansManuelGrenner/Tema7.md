## Ejercicio 1

**Instalar chef en la máquina virtual que vayamos a usar**

> Haré uso de la recomendación dada por @iblancasa en el Issue #579 de usar una máquina virtual de Ubuntu 12.04 de 32 bits e instalar mediante el script proporcionado.

Instalamos ruby.

```sudo apt-get install ruby ```

Usamos el script del siguiente enlace para poder instalar chef.

```curl -L https://www.opscode.com/chef/install.sh | sudo bash ```

![Imgur](http://i.imgur.com/g5dlQvm.png)
> Figura 1. Instalando Chef.

## Ejercicio 2

**Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.**

En primer lugar creamos la estructura para la receta.

![Imgur](http://i.imgur.com/5tmWleA.png)
> Figura 2. Estructura de directorios

Los contenidos de los ficheros creados serán los siguientes.

solo.rb :

```
file_cache_path "/home/jmgn/chef"
cookbook_path "/home/jmgn/chef/cookbooks"
json_attribs "/home/jmgn/chef/node.json"
```

node.json :

```
{
        "run_list": [
                    "recipe[emacs]",
                    "recipe[nginx]",
                    "recipe[directorio]"	    
                    ]
}
````

cookbooks/emacs/recipes/default.rb :

```
package 'emacs'
```

cookbooks/nginx/recipes/default.rb :

```
package 'nginx'
```

cookbooks/directorio/recipes/default.rb :

```
directory '/home/jmgn/directorio'
file "/home/jmgn/directorio/README" do

	owner "jmgn"
	group "jmgn"
	mode 00777
	action :create
	content "¡Bazzinga!"

end
```

Finalmente lanzamos la "receta" con :

```sudo chef-solo -c solo.rb ```

![Imgur](http://i.imgur.com/QDNyAEl.png)
> Figura 2. Ejecutando receta con chef.

## Ejercicio 3

**Escribir en YAML la siguiente estructura de datos en JSON : `{ uno: "dos",
  tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] } `**

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

## Ejercicio 4 y 5

**Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.**

**Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.**

Tal y como hemos hecho en mi grupo para el desarrollo de la práctica seguimos las instrucciones de [provisionamiento.md](https://github.com/julioxus/iv-aerospace/blob/master/doc/provisionamiento.md) en las cuales usaremos el servicio de Koding:

**Conexión ssh a Koding mediante par de claves pública/privada**

Para comenzar necesitamos generar una nueva clave ssh para poner conectarnos desde nuestro equipo local mediante ssh a Koding. Para ello, ejecutamos el siguiente comando:

```sh
ssh-keygen -t rsa -C "ivaerospace2014@gmail.com" -f koding.key
```
Posteriormente, nos preguntará que introduzcamos una contraseña. Una vez introducida nos dará el 'key fingerprint'. Añadimos nuestra nueva key al ssh-agent:

```sh
eval "$(ssh-agent -s)"
ssh-add koding.key
```

Subimos el archivo "koding.key.pub" a **nuestra máquina virtual de Koding** y copiamos el contenido en un fichero llamado 'authorized_keys', dentro de la carpeta ~/.ssh que tendremos que crear también. Para ello ejecutamos:

```sh
mkdir -p ~/.ssh
echo koding.key.pub >> ~/.ssh/authorized_keys
```

**Despliegue automático en Koding con Ansible**

Ahora que tenemos acceso a ssh tendremos que crear nuestro playbook para ejecutar el despligue de la aplicación con ansible.

Lo primero será descargar las dependencias necesarias:

```sh
sudo pip install paramiko PyYAML jinja2 httplib2 ansible
```

Ahora debemos crear un archivo en cualquier carpeta del sistema que contenga algo como esto:

```
[koding]
ivaerospace.koding.io
```

y acto seguido asignárselo a la variable de entorno ANSIBLE_HOSTS

Para hacerlo de manera automática:

```
sh
printf "[koding]\nivaerospace.koding.io" > ~/ansible_hosts
export ANSIBLE_HOSTS=~/ansible_hosts
```

Creamos el archivo [despliegue.yml](https://github.com/julioxus/iv-aerospace/blob/master/despliegue.yml). En él vamos a meter instrucciones para instalar las dependencias necesarias y ejecutar la aplicación

Nos apoyamos en scripts como [install.sh](https://github.com/julioxus/iv-aerospace/blob/master/install.sh) que se encargará de instalar el programa en el sistema y ejecutarlo

Para ejecutar el despliegue basta con hacer:

```sh
$ ansible-playbook despliegue.yml
```

## Ejercicio 6

**Instalar una máquina virtual Debian usando Vagrant y conectar con ella.**

Seguimos el siguiente [tutorial](http://www.olindata.com/blog/2014/07/installing-vagrant-and-virtual-box-ubuntu-1404-lts)

Dado que vagrant por defecto usa virtualbox para administrar la virtualización, nos los descargamos.

```sudo apt-get install virtualbox ```

A continuación descargamos vagrant usando ```apt-get ``` dado que no se distribuye ya como una gema. En caso de tenerlo previamente instalado con una gema se recomiendo desintalarlo primero.

```sudo gem uninstall vagrant ```

```sudo apt-get install vagrant ```

Instalar ahora el paquete dkms para asegurarnos de que los módulos del kernel de Virtualbox están correctamente actualizados.

```sudo apt-get install virtualbox-dkms ```

Una vez todo instalado nos buscamos una imagen vagrant para debian. En el siguiente enlace tenemos una [lista](http://www.vagrantbox.es/) con todas las imágenes disponibles.
He elegido **Debian Squeeze i386 6.0.7**  y la desplegamos el entorno mediante.

```
vagrant box add debian http://dl.dropbox.com/u/40989391/vagrant-boxes/debian-squeeze-i386.box
```

El siguiente paso es iniciar la configuración del proyecto. Para ello tenemos que crear un directorio raíz de nuestro proyecto y dentro generar el fichero de configuración llamando a ```vagrant init ```.

```
mkdir vagrant_project
cd vagrant_project
vagrant init 
```

Editamos el fichcero de configuración de Vagrant sustituyendo la siguiente línea.

```config.vm.box = "debian" ```

![Imgur](http://i.imgur.com/HL6AsL0.png)
> Figura 3. Modificando el fichero de configuración de Vagrant

Ya podemos iniciar el entorno mediante.

```vagrant up ```

![Imgur](http://i.imgur.com/1sGnY5T.png)
> Figura 4. Iniciando entorno

Para conectarnos a la máquina usamos.

```vagrant ssh ```

![Imgur](http://i.imgur.com/pu9XcHV.png)
> Figura 5. Conectar mediante ssh a la máquina


## Ejercicio 7

**Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica**

El subcomando ```provision ``` de vagrant permite provisionar la máquinar. Para ello añadimos el proceso de instalación de nginx al archivo de configuración de Vagrant.

```sudo apt-get update && sudo apt-get install  -y nginx```

> Añadimos el parámetro -y a install para que no pregunte por terminal e instale directamente. 

Quedará de la siguiente forma.

```config.vm.provision "shell", inline: "sudo apt-get update && sudo apt-get install -y nginx" ```

![Imgur](http://i.imgur.com/EOv7fGR.png)
> Figura 6. Fichero de configuración.

Lanzamos el comando ```vagrant provision ``` para iniciar el proceso.

![Imgur](http://i.imgur.com/jsbN6LC.png)
> Figura 7. Provisionamiento.

Finalmente comprobamos en localhost el funcionamiento de la página por defecto ( o la IP que le hayamos asignado en el archivo de configuración ) de nginx o nos conectamos por ssh y comprobamos el estado del servicio.

![Imgur](http://i.imgur.com/2gabNzk.png)
> Figura 8. Nginx en funcionamiento.


## Ejercicio 8

**Configurar tu máquina virtual usando vagrant con el provisionador ansible**

Creamos el playbook de Ansible que vayamos a usar. Usaré uno que instale varias herramientas (python,curl y git).

```
---
- hosts: all
  sudo: yes
  tasks:
    - name: Actualizar paquetes
      apt: update_cache=yes
    - name: Instalar Python
      apt: name=python state=present
	- name: Instalar curl
	  apt: name=curl state=present	
    - name: Instalar git
      apt: name=git state=present
```

A continuación modificamos el fichero de configuración de Vagrant y añadimos que use el playbook de Ansible anterior. Para ello tenemos que incluir las siguientes líneas.

```
config.vm.provision "ansible" do |ansible| 
	ansible.playbook = "herramientas.yml"
end
```

Guardamos el fichero y lanzamos el comando.
```vagrant provision ``` ( suponiendo que la máquina estaba activa, sino antes la lanzamos con ```vagrant up ```).


