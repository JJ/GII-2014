####Ejercicio7

######Crear un script para provisionar nginx o cualquier otro servidor web que pueda ser útil para alguna otra práctica.


Para Vagrant:

1. Creariamos el script que instala nginx:

~~~bash
#!/bin/bash

#Para CentOS
sudo yum install nginx
~~~

2. Modificar Vagrantfile

Solo debemos añadir esta linea para que cuando se levante la máquina se ejecute el script.

      config.vm.provision "shell", path: "instala_nginx.sh"


Como vimos en otros ejecicios, ahora sólo tendríamos que para la máquina, provisionarla con `vagrant provision` o resetearla para que coja los cambios.
