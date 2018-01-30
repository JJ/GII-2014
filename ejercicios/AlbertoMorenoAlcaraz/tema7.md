
Tema 7
======

Ejercicio 1
-----------

**Instalar chef en la máquina virtual que vayamos a usar.**

Para instalar chef, nos pide como requisito tener instalada la version 2 de ruby y al ver que la maquina no era capaz de instalarlo, procedemos a instalarlo manualmente, introduciendo estos comandos:
```bash
sudo apt-get -y update
sudo apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev
cd /tmp
wget http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p481.tar.gz
tar -xvzf ruby-2.0.0-p481.tar.gz
cd ruby-2.0.0-p481/
./configure --prefix=/usr/local
make
sudo make install
```

Una vez instalado, para instalar chef, tan solo hay que ejecutar el comando:
```bash
sudo gem install ohai chef
```
![t7ej1.png](https://raw.githubusercontent.com/albertomoreno/iv-images/master/t7ej1.png)


Ejercicio 2
-----------

**Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.**

Las recetas se añadiran a una carpeta llamada cookbooks, dentro de otra carpeta chef donde estará todo lo relacionado con dicho servicio.

Pasamos a crear la estructura de ficheros y archivos necesarios. Tendremos una carpeta para cada receta en la que habrá un archivo metadata.rb y otra carpeta recipes, en cuyo interior habra un archivo default.rb.
```bash
mkdir -p chef/cookbooks/emacs/recipes
mkdir -p chef/cookbooks/nginx/recipes
mkdir -p chef/cookbooks/test/recipes
```

Ahora, creamos en chef, dos ficheros de configuracion necesarios para su funcionamiento, que son solo.rb y node.json.
- Fichero solo.rb:
```bash
file_cache_path "/home/alberto/chef"
cookbook_path "/home/alberto/chef/cookbooks"
json_attribs "/home/alberto/chef/node.json"
```

- Fichero node.json:
```bash
{
  "emacs": {
    "version": "23.0.50"
  },

  "nginx": {
    "version": "1.7.9",
    "user": "www-data",
    "port": "80"
  },

  "folder": {
    "name": "folder"
  },

  "run_list": [
    "recipe[emacs]",
    "recipe[nginx]",
    "recipe[folder]"
  ]    
}
```

Una vez terminados los ficheros de configuracion, creamos los archivos metada.rb de cada una de las recetas que hemos dicho anteriormente:
```bash
maintainer       "Alberto Moreno"
maintainer_email "albertinivva@gmail.com"
description      "emacs"
version          "1.0"

recipe "emacs", "Instalar emacs"
```

```bash
maintainer       "Alberto Moreno"
maintainer_email "albertinivva@gmail.com"
description      "nginx "
version          "1.0"

recipe "nginx", "Instalar nginx"
```

```bash
maintainer       "Alberto Moreno"
maintainer_email "albertinivva@gmail.com"
description      "folder "
version          "1.0"

recipe "folder", "Carpeta folder"
```

Despues, preparamos los archivos default.rb:
```bash
package 'emacs'
```

```bash
package 'nginx'
```

```bash
directory '/home/alberto/folder'
file "/home/alberto/folder/tt.txt" do
  owner "alberto"
  group "alberto"
  mode 00544
  action :create
  content "Directorio de prueba"
end
```

```
.
|-- cookbooks
|   |--- emacs
|   |    |--- metadata.rb
|   |    |--- recipes
|   |         |--- default.rb
|   |--- folder
|   |    |--- metadata.rb
|   |    |--- recipes
|   |         |--- default.rb
|   |--- nginx
|        |--- metadata.rb
|        |--- recipes
|             |--- default.rb
|--- node.json
|--- solo.rb
```

Finalmente, ejecutamos:
```bash
sudo chef-solo -c solo.rb
```


Ejercicio 3
-----------

**Escribir en YAML la siguiente estructura de datos en JSON: { uno: "dos",
  tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }**

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


Ejercicio 6
-----------

**Instalar una máquina virtual Debian usando Vagrant y conectar con ella.**

Para este ejercicio, podemos coger una maquina de la lista que viene en el [manual](http://www.vagrantbox.es/).

Añadimos una maquina a vagrant:
```bash
vagrant box add debian https://dl.dropboxusercontent.com/u/4775364/vagrant/debian-6.0.9-amd64-plain-vmware.box
```

Despues de añadirla, iniciamos la maquina con los comandos:
```bash
vagrant init debian
vagrant up
```

Podemos acceder por ssh a la maquina iniciada con el comando:
```bash
vagrant ssh
```


Ejercicio 7
-----------

**Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica.**


Para este ejercicio, tenemos que abrir el fichero Vagrantfile, y añadirle las directivas para instalar nginx.
El fichero de configuracion Vagrantfile queda:
```bash
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "debian"
  
  config.vm.provision "shell",
  inline: "sudo yum -y update && sudo yum install -y nginx"

end
```

Cuando hemos configurado el Vagrantfile, le indicamos que coja los cambios con:
```bash
vagrant provision
```

Ejercicio 8
-----------

**Configurar tu máquina virtual usando vagrant con el provisionador ansible.**

Primero, creamos un archivo ansible_host en el que le indicamos la direccion que se va a utilizar:
```bash
[debian]
192.168.1.103
```

Despues, exportamos la variable con para que use los hosts que le indicamos, con el comando:
```bash
export ANSIBLE_HOSTS=~/ansible_hosts
```

Una vez exportado, modificamos el Vagrantfile para indicarle la nueva direccion y que vamos a utilizar el provisionador ansible.
El fichero queda:
```bash
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian"
  config.vm.network :private_network, ip: "192.168.1.103"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
```

Despues, configuramos el archivo playbook.yml, el cual nos quedara asi:
```yaml
  - hosts: debian
    sudo: yes
    tasks:
      - name: Actualizacion de paquetes
        apt: update_cache=yes
      - name: Nginx
        apt: name=nginx state=present
      - name: Iniciar
        command: service nginx start
```

Una vez terminado, ejecutamos:
```bash
vagrant provision
```



