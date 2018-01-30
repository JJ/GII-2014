# Carlos Campos Fuentes
## Gestión de infraestructuras virtuales

### Ejercicio 1
Podemos instalar **chef** ejecutando el siguiente script:

    curl -L https://www.opscode.com/chef/install.sh | sudo bash

### Ejercicio 2
Voy a crear un recetario que contenga una receta para instalar el servidor web **nginx**, otra receta para instalar el editor **emacs** y otra receta que cree un directorio en el que podríamos almacenar los archivos de Infraestructura Virtual con el típico archivo README.md en su interior.  

Antes de crear el recetario, hay que tener claro los archivos a incluir y la función de cada uno; todos los archivos que voy a crear se muestran en el siguiente árbol de contenido.

![Imgur](http://i.imgur.com/8M9MP7p.png)

El archivos **"solo.rb"** es el archivo de configuración de nuestro recetario; como mínimo debe incluir **"cookbook_path 'RUTA_RECETARIO'"** para indicar en que directorio están situadas nuestras recetas y **"json_attribs 'RUTA_ATRIBUTOS'"** para indicar el archivo JSON con los atributos de cada una de nuestras recetas y la forma de ejecutarlas.

    cookbook_path File.expand_path("../cookbooks", __FILE__)
    json_attribs File.expand_path("../node.json", __FILE__)


El archivo **"node.json"** como he indicado antes es el que indicará los atributos de cada una de las recetas de nuestro recetario (nombres, versiones, usuarios...), así como la forma de ejecutarlas (por ejemplo, ejecutar todas las recetas seguidas).

    {
      "nginx": {
        "version"	: "1.4.1",
        "user"		: "www-data",
        "port"		: "80"
      },

      "emacs": {
        "version"	: "23.4.1"
      },

      "iv": {
        "name"		: "Infraestructura Virtual"
      },

      "run_list":	[
        "recipe[nginx]",
        "recipe[emacs]",
        "recipe[iv]"
      ]
    }

El directorio **"codebooks"** será el que contendrá cada una de las recetas, cada una de las carpetas en su interior representa una receta, y a su vez, en el interior de las carpetas de las recetas nos encontraremos un archivo **"metadata.rb"** con los metadatos sobre la receta y una carpeta **"recipes"** con un archivo **"default.rb"** en su interior, este archivo es la receta en si misma ya que contendrá los "pasos" para realizar dicha receta. En el caso de la receta para crear el directorio, su archivo de metadatos es:

    maintainer       "Carlos Campos Fuentes"
    maintainer_email "carlos@ccamposfuentes.es"
    description      "Crea un directorio para los archivos de Infraestructura Virtual"
    version          "1.0.0"

    recipe "iv", "Receta de creación del directorio de Infraestructura Virtual."

Y su receta es:

    directory '/home/ccampos/IV'
    file "/home/ccampos/IV/README.md" do
      owner "ccampos"
      group "ccampos"
      mode 00764
      action :create
      content "Archivos de Infraestructura Virtual"
    end

Esta receta creará el directorio **"/home/ccampos/IV"** y en su interior el archivo **"README.md"**, dándole la propiedad al usuario **"ccampos"**, asignándole ese mismo usuario y permisos de lectura, escritura y ejecución para su dueño, solo lectura y escritura para los miembros del mismo grupo, y finalmente, solo permisos de lectura para el resto de usuarios.

En el caso de las recetas para instalar un paquete, su contenido es mucho más simple, simplemente deberemos escribir la línea **"package 'PAQUETE'"** para instalar el paquete indicado.

* Archivo **default.rb** para instalar **nginx**:

      package 'nginx'

* Archivo **default.rb** para instalar **emacs**:

      package 'emacs'

Ejecutando el archivo **"solo.rb"** con **chef-solo** podremos usar las recetas que acabo de crear.

    sudo chef-solo -c chef-solo-iv/solo.rb -j chef-solo-iv/node.json

Ahora solo nos queda comprobar que ciertamente se han realizado correctamente todas las recetas.

    nginx -v
    emacs --version
    ls IV/

### Ejercicio 3
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

### Ejercicio 6
Antes de nada, tenemos que instalar **vagrant**

    sudo apt-get install vagrant

Ahora ejecutamos la siguiente instruccion con la url correspondiente a Debian.

    vagrant box add debian http://dl.dropbox.com/u/54390273/vagrantboxes/Squeeze64_VirutalBox4.2.4.box

Seguidamente inicializamos:

    vagrant init debian

Como el propio mensaje de Vagrant indica, el **vagrantfile** se ha creado estamos listos entonces para levantar el entorno virtual.

    vagrant up

Por último acceemos a nuestro entorno virtual

    vagrant ssh

### Ejercicio 7
Para instalar nginx en nuestra máquina Debian, podemos hacerlo desde el mismo fichero **Vagrantfile**. Lo abrimos y añadimos un par de líneas al cihero:

```ruby
  config.vm.provision "shell".
    inline: "sudo apt-get install -y nginx"
```

### Ejrcicio 8
Tenemos que sobreescrbir el fichero de hosts de Ansible para usarlo con la máquina de Vagrant. Como esta vez no accedemos mediante un DNS de internet vamos a usar la ip de la máquina virtual en Vagrant, que consultaremos accediendo y ejecutando **/sbin/ip addr**.

Una vez que tenemos la ip, simplemente tenemos que añadirla al archivo **~/ansible_hosts** y modificar el archivo **Vagrantfile** y añadir:

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

    vagrant provision
