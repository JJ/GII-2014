#Ejercicios Tema 7. [Francisco Javier Expósito Cruz](http://github.com/franexposito)

##Gestión de infraestructuras virtuales
###Ejercicio1.
Chef es una herramienta para la gestión de configuraciones. Es decir, se encarga de instalar y configurar las aplicaciones en servidores o incluso estaciones de trabajo. Con él podemos realizar desde configuraciones básicas como establecer la hora del sistema, el idioma… hasta cosas tan complejas como levantar y configurar un cluster entero.  

En una máquina tipo ubuntu, la forma más sencilla es usando el paquete Omnibus proporcionado por Opscode:  
```
wget -O- https://www.opscode.com/chef/install.sh | sudo bash
```

###Ejercicio 2.
Creamos un fichero ruby con el nombre que prefiramos, en mi caso ejercicio2.rb, y añadimos la información necesaria para realizar nuestra receta. Comenzaremos con la creación de un directorio y un fichero, dentro de nuestra receta ejercicio2.rb añadimos lo siguiente:  

```
directory 'carpeta/'
file "carpeta/receta" do
owner "franexposito"
group "franexposito"
mode 00777
action :create
content "Creado desde receta "
end
```

Para ejecutarlo usamos chef-apply ejercicio2.rb.

###Ejercicio 3.
YAML es un formato de serialización de datos legible por humanos inspirado en lenguajes como XML, C, Python y Perl.  
```
uno:"dos"
tres:
-4
-5
-"Seis"
-
-siete:8
-nueve:[10,11]
```

###Ejercicio 4.
Ansible es sistema de gestión remota de configuración que permite gestionar simultáneamente miles de sistemas diferentes. Está basado en YAML para la descripción de los sistemas y escrito en Python. Nos descargamos e instalamos en primer lugar ansible:  
```
sudo pip install ansible
```
Creamos un archivo donde le indicaremos donde se encuentra alojada nuestra aplicación, en él introducimos lo siguiente:  
```
[azure]
ubuntu1204peq.cloudapp.net/ingenia/
```
Creamos una variable local que va a usar ansible para realizar la conexión, en ella introduce la dirección a nuestro archivo con los servidores de azure. Y posteriormente realizamos un ping para comprobar que se ha realizado la conexión correctamente.  

Podemos clonar un repositorio con ansible de forma muy sencilla:

```
ansible azure -m git -a "repo=https://github.com/IV-GII/Ingenia.git dest=~/ansible_ingenia vesion=HEAD" -vvvv
```

###Ejercicio 5.

###Ejercicio 6.
La ventaja de Vagrant es que permite gestionar el ciclo de vida completo de una máquina virtual, desde la creación hasta su destrucción pasando por el provisionamiento y la monitorización o conexión con la misma.  
```
sudo apt-get install Vagrant
```

Nos descargamos una distribución debian:  
```
vagrant box add debian https://dl.dropboxusercontent.com/u/197673519/debian-7.2.0.box
```

Crea un fichero Vagrantfile (y así te lo dice) que permite trabajar y llevar a cabo cualquier configuración adicional. Una vez hecho eso ya podemos inicializar la máquina y trabajar con ella.  
```  
vagrant init debian
vagrant up
vagrant ssh
```

###Ejercicio 7.
Abrimos nuestro archivo de configuración Vagrantfile y tan solo vamos a añadir unas líneas debajo de la linea que identifica nuestra maquina config.vm.box = "debian":  
```
config.vm.provision "shell",
inline: "sudo apt-get install nginx",
inline: "sudo service nginx restart"
```

Para terminar levantamos la maquina y la provisionamos con las dos siguientes lineas de ordenes:  
```
vagrant up
vagrant provision
```
