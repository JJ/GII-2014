
Tema 7
======

Ejercicio 1
-----------

**Instalar chef en la máquina virtual que vayamos a usar**

Usamos el gestor de gemas de Ruby para importar Chef:

```shell
gem install chef
```


Ejercicio 3
-----------

**Escribir en YAML la siguiente estructura de datos en JSON:**

```json
{ uno: "dos",
  tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }
```

```yaml
- uno: 'dos'
  tres:
  - 4
  - 5
  - 'Seis'
  -
    - siete: 8
      nueve: [10, 11]
```


Ejercicio 6
-----------

**Instalar una máquina virtual Debian usando Vagrant y conectar con ella.**

Podemos bajarnos cualquiera de las imágenes Debian que se listan en [Vagrant Boxes](http://www.vagrantbox.es/) como por ejemplo:

```shell
vagrant box add https://dl.dropboxusercontent.com/s/xymcvez85i29lym/vagrant-debian-wheezy64.box --name debian
```

![](https://raw.githubusercontent.com/ernestoalejo/ivimages/master/img2.png)

Luego solo tenemos que iniciar la máquina con:

```ssh
vagrant up
vagrant ssh
```

Y podemos consultar el nombre del sistema operativo por ejemplo:

```cat /etc/os-release```

![](https://raw.githubusercontent.com/ernestoalejo/ivimages/master/img3.png)


Ejercicio 7
-----------

**Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica**

Usando el provisionamiento por línea de comandos que es el más simple que tiene Vagrant podemos añadir esta línea a la configuración:

```ruby
config.vm.provision "shell", inline: "sudo apt-get install -y nginx && sudo service nginx start"
```
