Ejercicios de Julio Martínez Martínez-Checa
============================

# Tema 7

 
## Ejercicio 1 ##
**Instalar chef en la máquina virtual que vayamos a usar**

He usado el método que puso @iblancasa en el issue #579 para instalar chef sobre debian:

```
$ curl -L https://www.opscode.com/chef/install.sh | sudo bash
```

De esta forma se instala bien sin dar problemas al instalar los paquetes más tarde.


![captura1](http://i.imgur.com/AaDpSEB.png)

## Ejercicio 2 ##
**Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.**

Mi lista de archivos es la siguiente:

.
├── chef-client-running.pid
├── chef-stacktrace.out
├── cookbooks
│   ├── emacs
│   │   └── recipes
│   │       └── default.rb
│   └── nginx
│       └── recipes
│           └── default.rb
├── node.json
└── solo.rb

Cuyo contenido es:

node.json:

```json
{
        "run_list": [
					"recipe[emacs]",
					"recipe[nginx]"
					]
}
```

solo.rb:

```ruby
file_cache_path "/home/julio/chef"
cookbook_path "/home/julio/chef/cookbooks"
json_attribs "/home/julio/chef/node.json"
```

cookbooks/emacs/recipes/default.rb:

```ruby
package 'emacs'
directory '/home/julio/Documentos'
file "/home/julio/Documentos/LEEME" do
        owner "julio"
        group "julio"
        mode 00544
        action :create
        content "Directorio para documentos diversos"
end
```

/cookbooks/nginx/recipes/default.rb:

```ruby
package 'nginx' 
```

De esta forma al ejecutar:

```
$ sudo chef-solo -c solo.rb
```

se instalará emacs y creará el fichero LEEME con el contenido indicado, y se instalará nginx.

## Ejercicio 3 ##
**Escribir en YAML la siguiente estructura de datos en JSON**

**{ uno: "dos",**
**  tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }**

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

## Ejercicio 4 ##
**Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.**


## Ejercicio 5.1 ##
**Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.**

## Ejercicio 6 ##
**Instalar una máquina virtual Debian usando Vagrant y conectar con ella.**

## Ejercicio 7 ##
**Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica**

## Ejercicio 8 ##
**Configurar tu máquina virtual usando vagrant con el provisionador ansible**
