# TEMA 7: Gestión de infraestructuras virtuales

## Ejercicio 1
#### Instalar chef en la máquina virtual que vayamos a usar

Usamos el gestor de gemas de Ruby para importar Chef:
```
gem install chef
```

## Ejercicio 2
#### Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

Creamos un fichero ruby con el nombre que prefiramos, en mi caso ejercicio4.rb, y añadimos la información necesaria para realizar nuestra receta.
Comenzaremos con la creación de un directorio y un fichero, dentro de nuestra receta ejercicio4.rb añadimos lo siguiente:
```
directory 'pruebaIV/'
file "pruebaIV/receta1" do
owner "ivanortegaalba"
group "ivanortegaalba"
mode 00777
action :create
content "Texto de prueba de la receta creada "
end
```
Para ejecutarlo usamos
```
chef-apply ejercicio4.rb.
```

## Ejercicio 3
#### Escribir en YAML la siguiente estructura de datos en JSON:

```
{ uno: "dos",
  tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }
- uno: 'dos'
  tres:
  - 4
  - 5
  - 'Seis'
  -
    - siete: 8
      nueve: [10, 11]
```

## Ejercicio 6
#### Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

Podemos bajarnos cualquiera de las imágenes Debian que se listan en Vagrant Boxes como por ejemplo:
```
vagrant box add https://dl.dropboxusercontent.com/s/xymcvez85i29lym/vagrant-debian-wheezy64.box --name debian
```

Luego solo tenemos que iniciar la máquina con:
```
vagrant up
vagrant ssh
```
Y podemos consultar el nombre del sistema operativo por ejemplo:
```
cat /etc/os-release
```

## Ejercicio 7
#### Crear un script para provisionar nginx o cualquier otro servidor web que pueda ser útil para alguna otra práctica

Usando el provisionamiento por línea de comandos que es el más simple que tiene Vagrant podemos añadir esta línea a la configuración:

config.vm.provision "shell", inline: "sudo apt-get install -y nginx && sudo service nginx start"
