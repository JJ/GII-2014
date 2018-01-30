#Gestión de infraestructuras virtuales

##Ejercicio 1

**Instalar chef en la máquina virtual que vayamos a usar**

Vamos a usar Koding. 

Procedemos a la descarga e instalación de chef

```curl -L https://www.opscode.com/chef/install.sh | sudo bash```

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_7/imagenes/ejercicio1-1.png)

La operación ha resultado exitosa

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_7/imagenes/ejercicio1-2.png)

##Ejercicio 2

**Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.**

Una vez hemos instalado chef, accedemos a ```/etc/chef```. En caso de no estar creada, debemos crear nosotros cada directorio.

Nuestra receta se compone de 3 archivos:

solo1.rb

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_7/imagenes/ejercicio2-1.png)

node1.json

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_7/imagenes/ejercicio2-2.png)

chef/cookbooks/receta1/recipes/default.rb

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_7/imagenes/ejercicio2-3.png)

Una vez creados tenemos todos los archivos, ejecutamos con la siguiente orden:

```sudo chef-solo -c solo1.rb```

##Ejercicio 3

**Escribir en YAML la siguiente estructura de datos en JSON.**

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
##Ejercicio 6

**Instalar una máquina virtual Debian usando Vagrant y conectar con ella.**

Instalamos vagrant de la forma habitual:

```sudo apt-get install vagrant```

Una vez hecho esto, podemos acceder a la web de [vagrant](http://www.vagrantbox.es/) y descargar alguno de los SO disponibles.

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_7/imagenes/ejercicio6-1.png)

Una vez descargado, ejecutamos la orden ```vagrant init <nombre-SO>```
Se nos genera un fichero con el cual ya podemos hacer ```vagrant up```

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_7/imagenes/ejercicio6-2.png)

Tras esto ya se nos inicia VirtualBox y ya podemos usar nuestro SO con ssh ```vagrant ssh```.


##Ejercicio 7

**Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica**

Tras haber ejecutado ```vagrant init``` se nos generará un archivo "Vagrantfile" como éste:

![](https://github.com/miguelfabre/GII-2014/blob/master/ejercicios/Tema_7/imagenes/ejercicio7-1.png)

Para provisionar nginx, debemos añadir a este archivo lo siguiente:

```config.vm.provision "shell",```
```inline: "sudo apt-get update && sudo apt-get install -y nginx && sudo service nginx restart && sudo service nginx status"```













