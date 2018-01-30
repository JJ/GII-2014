####Ejercicio1

######Instalar chef en la máquina virtual que vayamos a usar.

Para instalar [Chef](https://www.chef.io/chef/) comenzamos instalando [**Ruby**](https://www.ruby-lang.org/es/) y su gestor de librerías [Ruby Gems](https://rubygems.org/).

    sudo apt-get install ruby1.9.1 ruby1.9.1-dev rubygems

Después instalamos Chef como una gema:

    sudo gem install ohai chef

Puede que al realizar la instalación de esta forma nos encontremos con algún problema.

~~~bash
root@AnsibleServer15:/home/ansibleServer# sudo gem install ohai chef
Building native extensions.  This could take a while...
ERROR:  Error installing ohai:
ERROR: Failed to build gem native extension.
~~~

Si no encontramos una solución fácil podemos realizarla con el método tradicional.

~~~bash
curl -L https://www.opscode.com/chef/install.sh | bash

...
...

Setting up chef (12.0.3-1) ...
Thank you for installing Chef!
~~~

¡Ya tenemos chef listo para usar!

Una guía interesante para iniciarse, [*aquí*](http://gettingstartedwithchef.com/).
