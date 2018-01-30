##Ejercicio 1##
###Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.###

Comprobamos si nuestro sistema está preparado para usar KVM con:
~~~
kvm-ok
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio1_1.png)


##Ejercicio 2##
###Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).###

Máquina virtual con debian
~~~
qemu-img create -f qcow2 debian.qcow2 10G

qemu-system-x86_64 -hda debian.qcow2 -cdrom Descargas/debian-7.8.0-amd64-lxde-CD-1.iso
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio2_1.png)

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio2_2.png)



Máquina virtual con SliTaz

~~~
qemu-img create -f qcow2 slitaz.qcow2 2G

qemu-system-x86_64 -hda slitaz.qcow2 -cdrom Descargas/slitaz-4.0.iso
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio2_3.png)

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio2_4.png)

###Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.###

Voy a instalar CoreOS en VirtualBox. Para ello seguimos los siguientes pasos:

Abrimos VirtualBox y seleccionamos "Nueva"

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio2_5.png)

Le ponemos nombre:

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio2_6.png)


Ajustamos la cantidad de memoria ram:

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio2_7.png)


Elegimos el formato VDI para el disco duro:

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio2_8.png)


Elegimos el fichero ISO:

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio2_9.png)

Iniciamos la máquina:

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio2_10.png)


##Ejercicio 3##
###Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con###

##Ejercicio 4##
###Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh###

Creamos la imagen:
~~~
qemu-img create -f qcow2 ejercicio4.qcow2 10G
~~~

Y ejecutamos:

~~~
qemu-system-x86_64 -hda ejercicio4.qcow2 -cdrom Descargas/debian-7.8.0-amd64-netinst.iso -m 512M
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio4_1.png)

Para instalar el entorno gráfico LXDE en debian seguimos los siguientes pasos:

Elegimos la opcion "Advanced Options"

Despues elegimos Alternative desktop environments"

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio4_2.png)

Y elegimos LXDE e instalamos debian:

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio4_3.png)

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio4_4.png)

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio4_5.png)

Arrancamos la máquina dentro de un servidor VNC:
~~~
qemu-system-x86_64 -hda ejercicio4.qcow2 -vnc :1
~~~

Nos conectamos a la máquina virtual usando el cliente VNC "vinagre":
~~~
vinagre 192.168.1.10:5901
~~~




##Ejercicio 5##
###Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.###

Comprobamos las imagenes disponibles y elegimos una:
~~~
sudo azure vm image list

sudo azure vm create leocastillo b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB leocastillo clave --location "West Europe" --ssh
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio5_1.png)

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio5_2.png)

Iniciamos la máquina con:
~~~
sudo azure vm start leocastillo y nos conectamos con ssh leocastillo@leocastillo.cloudapp.net
~~~

Después, instalamos el servidor ejecutando:
~~~
sudo apt-get install nginx
~~~
![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio5_3.png)

Iniciamos el servidor 
~~~
sudo service nginx start
~~~

Creamos el "endpoint", para ello ejecutamos el siguiente comando:

~~~
sudo azure vm endpoint create -n http leocastillo 80 80
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio5_4.png)


Y accedemos a nuestra web a través del navegador:

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio5_5.png)


Por último apagamos la máquina:

~~~
sudo azure vm shutdown leocastillo
~~~

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio5_6.png)


##Ejercicio 6##
###Usar juju para hacer el ejercicio anterior###

Seguimos los pasos de la documentación de juju en el siguiente enlace ![Sin titulo](https://juju.ubuntu.com/docs/config-azure.html)

Generamos el fichero de configuración de Juju con el siguiente comando:
~~~
juju generate-config
~~~

Generamos un nuevo certificado. Para ello ejecutamos lo siguiente:
~~~
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout azure.pem -out azure.pem

openssl x509 -inform pem -in azure.pem -outform der -out azure.cer

chmod 600 azure.pem
~~~

Importamos el certificado en nuestra cuenta azure:

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio6_1.png)

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio6_2.png)


Editamos el fichero "environments.yaml"

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio6_3.png)


Seleccionamos azure y ejecutamos bootstrap:

~~~
sudo juju switch azure
sudo juju bootstrap
~~~


Para instalar nginx ejecutamos el siguiente comando:

~~~
juju deploy nginx
~~~

##Ejercicio 7##
###Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.###

Creamos una nueva máquina virtual con VirtualBox:

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio7_1.png)

![Sin titulo](https://github.com/leocm89/prueba/blob/master/Imagenes/Tema6/ejercicio7_2.png)

