#Ejercicios tema 7: Gestión de infraestructuras virtuales

##Ejercicio 1
Instalar chef en la máquina virtual que vayamos a usar

Ya tenía ruby instalado 2.2.0

Instalamos chef con la orden.

	curl -L https://www.opscode.com/chef/install.sh | bash

##Ejercicio 2
Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

Creo el directorio chef

	mkdir chef

Creamos los siguientes ficheros:

default.rb

package 'emacs'
directory '/home/agaosl'
file "/home/agaosl/LEEME" do
	owner "samuel"
	group "samuel"
	mode 00544
	action :create
	content "Directorio para documentos diversos"
end

node.json

{
	"run_list": [ "recipe[emacs]" ]
}

solo.rb

file_cache_path "/home/agaosl/chef"
cookbook_path "/home/agaosl/chef/cookbooks"
json_attribs "/home/agaosl/chef/node.json"


##Ejercicio 3
Escribir en YAML la siguiente estructura de datos en JSON:

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



##Ejercicio 4
Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

##Ejercicio 5
Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.

##Ejercicio 6
Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

##Ejercicio 7
Crear un script para provisionar `nginx` o cualquier otro servidor
web que pueda ser útil para alguna otra práctica

##Ejercicio 8
Configurar tu máquina virtual usando vagrant con el provisionador
ansible

