
Ejercicios de Juan Francisco Rodríguez Vílchez
================================================

## Ejercicios Tema 7: Gestión de infraestructuras virtuales ##

### Ejercicio 1 ###

**Instalar chef en la máquina virtual que vayamos a usar**

Para instalar chef simplemente tenemos que ejecutar:

```sh
sudo apt-get install ruby1.9.1 ruby1.9.1-dev rubygems
sudo gem install ohai chef
```
Al decirme que necesito la versión 2 de Ruby, he consultado en [stackoverflow](http://stackoverflow.com/questions/16222738/how-do-i-install-ruby-2-0-0-correctly-on-ubuntu-12-04) cómo instalarla.

Conseguí instalarla de la siguiente forma:

```sh
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
Finalmente, usamos "sudo gem install ohai chef" y ya tenemos chef listo para ser usado.

### Ejercicio 2 ###

**Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.**

Voy a crear un recetario que contenga una receta para instalar el editor emacs, el servidor web nginx, y otra receta que cree un directorio para almacenar distintos ficheros.

La estructura consta de cookbooks > nginx | emacs | directorio > dentro de cada esta su "metadata.rb" correspondiente y un directorio "recipes" con "default.rb" en su interior.

El archivos **solo.rb** es el archivo de configuración de nuestro recetario que debe incluir "cookbook_path 'RUTA_RECETARIO'" y "json_attribs 'RUTA_ATRIBUTOS'" para indicar el archivo JSON con los atributos de cada una de nuestras recetas.

```sh
cookbook_path "/home/juanfranrv/chef/cookbooks"
json_attribs "/home/juanfranrv/chef/node.json"
```

El archivo **node.json** será el siguiente:

```sh
{
    "nginx": {
        "version"   : "1.4.1",
        "user"      : "www-data",
        "port"      : "80"
  },

    "emacs": {
        "version"   : "23.4.1s"
    },

    "directorio": {
        "name"      : "Directorio"
    },

    "run_list": [
        "recipe[nginx]",
        "recipe[emacs]",
        "recipe[directorio]"
    ]
}
```
En el interior de las carpetas de las recetas nos encontraremos un archivo **metadata.rb** con los metadatos sobre la receta:

```sh
maintainer       "Juan Francisco Rodríguez Vílchez"
maintainer_email "juanfran0205rv@gmail.com"
description      "NGINX "
version          "1.0"

recipe "nginx", "Instalar NGINX"
```

```sh
maintainer       "Juan Francisco Rodríguez Vílchez"
maintainer_email "juanfran0205rv@gmail.com"
description      "Crea un directorio "
version          "1.0"

recipe "directorio", "Crea un directorio"
```

```sh
maintainer       "Juan Francisco Rodríguez Vílchez"
maintainer_email "juanfran0205rv@gmail.com"
description      "emacs "
version          "1.0"

recipe "emacs", "Instalar emacs"
```
Y su receta es **default.rb**:

```sh
directory '/home/juanfranrv/directorio'
file "/home/juanfranrv/directorio/directorio.md" do
  owner "juanfranrv"
  group "juanfranrv"
  mode 00765
  action :create
  content "Directorio con archivos"
end
```

Archivo **default.rb** para instalar **nginx**:
```sh
package 'nginx'
```

Archivo **default.rb** para instalar **emacs**:
```sh
package 'emacs'
```

Finalmente, lo ejecutamos con:

```sh
sudo chef-solo -c chef/solo.rb -j chef/node.json
```
### Ejercicio 3 ###
**Escribir en YAML la siguiente estructura de datos en JSON { uno: "dos",tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }**

Las listas en YAMl se pueden usar introduciendo un miembro por línea antepuesto con "- ":

```sh
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

### Ejercicio 4 ###

**Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.**

### Ejercicio 5.1 ###

**Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.**

### Ejercicio 5.2 ###

**¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.**

### Ejercicio 6 ###

**Instalar una máquina virtual Debian usando Vagrant y conectar con ella.**

### Ejercicio 7 ###

**Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica**