####Ejercicio6


######Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

Lo primero que hacemos es instalar Vagrant, accediendo a la seccin de de descargas de se [web](http://downloads.vagrantup.com/), seleccionando la versión que queremos y para el sistema que queremos.

En nuestro caso elegimos la versión 1.3.5 y el paquete para debian, lo descargamos e instalamos así:

    sudo dpkg -i vagrant_1.3.5_i686.deb

y comprobamos la versión:

~~~bash
vagrant -v
Vagrant 1.3.5
~~~

~~~bash
mkdir vagrant_ejemplo
cd vagrant_ejemplo/
vagrant init
A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
~~~

Seleccionamos una pequeña distribución de Debian desde la página de imágenes, [vagrantbox](http://www.vagrantbox.es/), elegimos
*Debian Wheezy i386 minimal w/ apache and guest additions (2014/01/21)*.

~~~bash
vagrant box add debian_wheezy https://dl.dropboxusercontent.com/u/99151903/wheezy.box
~~~

Tardará unos minutos en bajar la imagen:
~~~bash
Downloading or copying the box...
Progress: 31% (Rate: 1138k/s, Estimated time remaining: 0:05:03)
...
Successfully added box 'debian_wheezy' with provider 'virtualbox'!
~~~

Listamos las imagenes que tenemos

~~~bash
vagrant box list
debian_wheezy (virtualbox)
~~~

Para acceder a la máquina que hemos descargado editamos el fichero [Vagrantfile](https://docs.vagrantup.com/v2/vagrantfile/) y modificamos la linea donde dice config.vm.box y ponemos el nombre exacto de la imagen:

~~~bash
# Every Vagrant virtual environment requires a box to build off of.
config.vm.box = "debian_wheezy"
~~~

Arracamos la máquina:

~~~bash
$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
[default] Importing base box 'debian_wheezy'...
[default] Matching MAC address for NAT networking...
[default] Setting the name of the VM...
[default] Clearing any previously set forwarded ports...
[default] Creating shared folders metadata...
[default] Clearing any previously set network interfaces...
[default] Preparing network interfaces based on configuration...
[default] Forwarding ports...
[default] -- 22 => 2222 (adapter 1)
[default] Booting VM...
[default] Waiting for machine to boot. This may take a few minutes...
The guest machine entered an invalid state while waiting for it
to boot. Valid states are 'starting, running'. The machine is in the
'gurumeditation' state. Please verify everything is configured
properly and try again.

If the provider you're using has a GUI that comes with it,
it is often helpful to open that and watch the machine, since the
GUI often has more helpful error messages than Vagrant can retrieve.
For example, if you're using VirtualBox, run `vagrant up` while the
VirtualBox GUI is open.

~~~
El esta de la máquina segun VirtualBox es:
![](debian.png)

Debido a que en la GUI nos es imposible realizar cualquier acción sobre la máquina la detenemos desde el terminal.

~~~bash
vboxmanage controlvm vagrant_ejemplo_default_1422613335 poweroff
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
~~~

No habiendo encontrado solución el problema se ha probado con otra imagen:

*CentOS 6.3 32bit (Ruby 1.8.7 & Chef 10.14.2)*


Sigue ocurriendo el mismo problema. Eliminamos la imagen directamente con VirtualBox y rehacemos el proceso:

~~~bash
vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
[default] Importing base box 'centos'...
[default] Matching MAC address for NAT networking...
[default] Clearing any previously set forwarded ports...
[default] Creating shared folders metadata...
[default] Clearing any previously set network interfaces...
[default] Preparing network interfaces based on configuration...
[default] Forwarding ports...
[default] -- 22 => 2222 (adapter 1)
[default] Booting VM...
[default] Waiting for machine to boot. This may take a few minutes...
[default] Machine booted and ready!
[default] Mounting shared folders...
[default] -- /vagrant
~~~

Ahora vemos que ha funcionado, si volvemos a intentar levantar la máquina, o no estamos seguros de que ya la tenemos levantada podemos hacer de nuevo `vagrant up`, y volverá a intentar levantar el contenedor asignado en Vagrantfile.

~~~bash
> vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
~~~

Con `vagrant ssh` podemos entrar en la máquina y ya podemos trabajar en ella:

~~~bash
Ubuntu> vagrant ssh
Last login: Tue Sep 11 14:46:07 2012 from 10.0.2.2
[vagrant@vagrant-centos63 ~]$
~~~

Para salir de la máquina podemos hacer directamente `exit` pero si realmente queremos pararla debemos de hacer `vagrant halt` y en el caso de que queramos destruirla `vagrant destroy`


Referencias:

* [codehero](http://codehero.co/como-instalar-y-configurar-vagrant/)
